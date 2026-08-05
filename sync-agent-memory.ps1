# Sync Letta Agent Memory to GitHub via API
# Usage: 
#   .\sync-agent-memory.ps1 -AgentId "agent-xxx" [-AgentName "name"] [-SyncMemFS]
#   .\sync-agent-memory.ps1 -AllAgents [-SyncMemFS]
#
# This script fetches memory blocks from the Letta API and writes them
# to the golaunchmate/memories GitHub repo for backup and visibility.
# With -SyncMemFS, it also walks the local MemFS directory and uploads
# those files to agents/{agentId}/memfs/ on GitHub.

param(
    [string]$AgentId,

    [string]$AgentName = "unknown",

    [string]$LettaBaseUrl = "https://api.letta.com",

    [switch]$SyncMemFS,

    [switch]$AllAgents,

    [switch]$DotSourceMode,

    [string]$MemFSBasePath = "$env:USERPROFILE\.letta\agents"
)

# Force dark background (like cmd.exe) instead of default PowerShell blue
if (-not $DotSourceMode) {
    $Host.UI.RawUI.BackgroundColor = 'Black'
    Clear-Host
}

# Known agents for -AllAgents mode
$KnownAgents = @(
    @{ Id = "agent-b86549ac-4995-4d37-ad0d-c3119a3a093a"; Name = "Laura Wetherhold" },
    @{ Id = "agent-82720585-edcc-4c31-b558-68fe3183b1e7"; Name = "Drop Agent" },
    @{ Id = "agent-300f6e26-ce14-4baa-b116-a333f335de43"; Name = "AIC Agent" },
    @{ Id = "agent-88845acf-f843-463a-9b23-185cad7499f7"; Name = "Transcript Agent" }
)

# Check for API key (skip in DotSourceMode — caller should have these set)
$apiKey = $env:LETTA_API_KEY
if (-not $apiKey -and -not $DotSourceMode) {
    Write-Error "LETTA_API_KEY environment variable not set"
    exit 1
}

$githubToken = $env:GITHUB_TOKEN
if (-not $githubToken -and -not $DotSourceMode) {
    Write-Error "GITHUB_TOKEN environment variable not set"
    exit 1
}

$ghHeaders = @{
    "Authorization" = "Bearer $githubToken"
    "Accept" = "application/vnd.github.v3+json"
}

# === SYNC FUNCTION ===
function Sync-Agent {
    param(
        [string]$AgentId,
        [string]$AgentName,
        [bool]$DoMemFS
    )

    Write-Host ""
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host "  Syncing Agent: $AgentName" -ForegroundColor Cyan
    Write-Host "  ID: $AgentId" -ForegroundColor DarkCyan
    Write-Host "========================================" -ForegroundColor Cyan

    $headers = @{
        "Authorization" = "Bearer $apiKey"
        "Accept" = "application/json"
    }

    # --- Fetch core-memory blocks from Letta API ---
    $blocks = @()
    try {
        $response = Invoke-RestMethod -Uri "$LettaBaseUrl/v1/agents/$AgentId/core-memory" -Headers $headers -Method Get
        $blocks = $response.blocks
    } catch {
        Write-Host "  [WARN] Could not fetch core-memory blocks: $_" -ForegroundColor Yellow
    }

    Write-Host "  Found $($blocks.Count) core-memory blocks"

    # Get agent name from API if still unknown
    if ($AgentName -eq "unknown") {
        try {
            $agentResponse = Invoke-RestMethod -Uri "$LettaBaseUrl/v1/agents/$AgentId" -Headers $headers -Method Get
            $AgentName = $agentResponse.name
        } catch {
            Write-Host "  [WARN] Could not fetch agent name"
        }
    }

    # Get archival memory count
    $archivalCount = 0
    try {
        $archivalResp = Invoke-RestMethod -Uri "$LettaBaseUrl/v1/agents/$AgentId/archival-memory?limit=1" -Headers $headers -Method Get
        # The API returns paginated results; get total from headers or count
        if ($archivalResp -is [array]) {
            $archivalCount = $archivalResp.Count
        }
    } catch {
        Write-Host "  [WARN] Could not fetch archival memory count"
    }

    # --- Count MemFS files ---
    $memfsPath = Join-Path $MemFSBasePath "$AgentId\memory"
    $memfsFiles = @()
    if ($DoMemFS -and (Test-Path $memfsPath)) {
        $memfsFiles = Get-ChildItem -Path $memfsPath -Recurse -File | Where-Object { $_.FullName -notmatch '\\\.git\\' }
        Write-Host "  Found $($memfsFiles.Count) MemFS files at $memfsPath"
    } elseif ($DoMemFS) {
        Write-Host "  [SKIP] No MemFS directory found at $memfsPath" -ForegroundColor Yellow
    }

    # --- Create agent.json metadata ---
    $metadata = @{
        agent_id = $AgentId
        agent_name = $AgentName
        synced_at = (Get-Date -Format "yyyy-MM-ddTHH:mm:ssZ")
        block_count = $blocks.Count
        archival_passage_count = $archivalCount
        memfs_file_count = $memfsFiles.Count
        blocks = @()
    }

    foreach ($block in $blocks) {
        $metadata.blocks += @{
            label = $block.label
            limit = $block.limit
            used = $block.value.Length
        }
    }

    $metadataJson = $metadata | ConvertTo-Json -Depth 5
    $metadataBytes = [System.Text.Encoding]::UTF8.GetBytes($metadataJson)
    $metadataBase64 = [Convert]::ToBase64String($metadataBytes)

    # --- Upload agent.json ---
    $agentJsonPath = "agents/$AgentId/agent.json"
    $existingSha = $null
    try {
        $existing = Invoke-RestMethod -Uri "https://api.github.com/repos/golaunchmate/memories/contents/$agentJsonPath" -Headers $ghHeaders -Method Get
        $existingSha = $existing.sha
    } catch {}

    $uploadBody = @{
        message = "sync: Update agent metadata for $AgentName"
        content = $metadataBase64
    }
    if ($existingSha) { $uploadBody.sha = $existingSha }

    try {
        Invoke-RestMethod -Uri "https://api.github.com/repos/golaunchmate/memories/contents/$agentJsonPath" -Headers $ghHeaders -Method Put -Body ($uploadBody | ConvertTo-Json) -ContentType "application/json"
        Write-Host "  [OK] agent.json uploaded"
    } catch {
        Write-Host "  [FAIL] agent.json: $_"
    }

    # --- Upload core-memory blocks ---
    $successCount = 0
    $skipCount = 0
    $failCount = 0

    foreach ($block in $blocks) {
        $label = $block.label
        $value = $block.value
        $description = $block.description
        $limit = $block.limit

        if (-not $value.Trim()) {
            $skipCount++
            Write-Host "    [SKIP] $label (empty)"
            continue
        }

        $content = "---`ndescription: $description`nlimit: $limit`nagent_id: $AgentId`n---`n`n$value"
        $contentBytes = [System.Text.Encoding]::UTF8.GetBytes($content)
        $contentBase64 = [Convert]::ToBase64String($contentBytes)

        $filePath = "agents/$AgentId/$label.md"
        $blockSha = $null
        try {
            $existingBlock = Invoke-RestMethod -Uri "https://api.github.com/repos/golaunchmate/memories/contents/$filePath" -Headers $ghHeaders -Method Get
            $blockSha = $existingBlock.sha
        } catch {}

        $blockBody = @{
            message = "sync: Update memory block '$label' for $AgentName"
            content = $contentBase64
        }
        if ($blockSha) { $blockBody.sha = $blockSha }

        try {
            Invoke-RestMethod -Uri "https://api.github.com/repos/golaunchmate/memories/contents/$filePath" -Headers $ghHeaders -Method Put -Body ($blockBody | ConvertTo-Json) -ContentType "application/json"
            $successCount++
            Write-Host "    [OK] block: $label ($($value.Length) chars)"
        } catch {
            $failCount++
            Write-Host "    [FAIL] block: ${label}: $($_)" -ForegroundColor Red
        }

        Start-Sleep -Milliseconds 300
    }

    Write-Host "  Core-memory blocks: $successCount OK, $skipCount skipped, $failCount failed"

    # --- Upload MemFS files ---
    if ($DoMemFS -and $memfsFiles.Count -gt 0) {
        $memfsSuccess = 0
        $memfsFail = 0

        foreach ($file in $memfsFiles) {
            # Calculate relative path from the memory directory
            $relPath = $file.FullName.Replace("$memfsPath\", "").Replace("\", "/")
            $githubPath = "agents/$AgentId/memfs/$relPath"

            # Read file content
            $fileContent = Get-Content -Path $file.FullName -Raw -Encoding UTF8
            $fileBytes = [System.Text.Encoding]::UTF8.GetBytes($fileContent)
            $fileBase64 = [Convert]::ToBase64String($fileBytes)

            # Check if file exists on GitHub
            $fileSha = $null
            try {
                $existingFile = Invoke-RestMethod -Uri "https://api.github.com/repos/golaunchmate/memories/contents/$githubPath" -Headers $ghHeaders -Method Get
                $fileSha = $existingFile.sha
            } catch {}

            $fileBody = @{
                message = "sync: Update MemFS file '$relPath' for $AgentName"
                content = $fileBase64
            }
            if ($fileSha) { $fileBody.sha = $fileSha }

            try {
                Invoke-RestMethod -Uri "https://api.github.com/repos/golaunchmate/memories/contents/$githubPath" -Headers $ghHeaders -Method Put -Body ($fileBody | ConvertTo-Json) -ContentType "application/json"
                $memfsSuccess++
                Write-Host "    [OK] memfs: $relPath ($($file.Length) bytes)"
            } catch {
                $memfsFail++
                Write-Host "    [FAIL] memfs: ${relPath}: $($_)" -ForegroundColor Red
            }

            Start-Sleep -Milliseconds 300
        }

        Write-Host "  MemFS files: $memfsSuccess OK, $memfsFail failed"
    }

    Write-Host "  Done: $AgentName" -ForegroundColor Green
    Write-Host "  View: https://github.com/golaunchmate/memories/tree/main/agents/$AgentId"
}

# === MAIN ===
if ($DotSourceMode) {
    # Just load the function, don't run anything
    return
}
if ($AllAgents) {
    Write-Host "Syncing all $($KnownAgents.Count) agents..." -ForegroundColor Magenta
    foreach ($agent in $KnownAgents) {
        Sync-Agent -AgentId $agent.Id -AgentName $agent.Name -DoMemFS $SyncMemFS
    }
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "  All agents synced!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
} elseif ($AgentId) {
    Sync-Agent -AgentId $AgentId -AgentName $AgentName -DoMemFS $SyncMemFS
} else {
    Write-Host "Usage: .\sync-agent-memory.ps1 -AgentId 'agent-xxx' [-SyncMemFS]" -ForegroundColor Yellow
    Write-Host "       .\sync-agent-memory.ps1 -AllAgents [-SyncMemFS]" -ForegroundColor Yellow
    exit 0
}
