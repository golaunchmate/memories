# Sync Letta Agent Memory to GitHub via API
# Usage: .\sync-agent-memory.ps1 -AgentId "agent-xxx" [-AgentName "name"]
# 
# This script fetches memory blocks from the Letta API and writes them
# to the golaunchmate/memories GitHub repo for backup and visibility.

param(
    [Parameter(Mandatory=$true)]
    [string]$AgentId,

    [string]$AgentName = "unknown",

    [string]$LettaBaseUrl = "https://api.letta.com"
)

# Check for API key
$apiKey = $env:LETTA_API_KEY
if (-not $apiKey) {
    Write-Error "LETTA_API_KEY environment variable not set"
    exit 1
}

$githubToken = $env:GITHUB_TOKEN
if (-not $githubToken) {
    Write-Error "GITHUB_TOKEN environment variable not set"
    exit 1
}

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Syncing Agent Memory to GitHub" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Agent ID: $AgentId"
Write-Host "Agent Name: $AgentName"
Write-Host ""

# Fetch memory blocks from Letta API
$headers = @{
    "Authorization" = "Bearer $apiKey"
    "Accept" = "application/json"
}

try {
    $response = Invoke-RestMethod -Uri "$LettaBaseUrl/v1/agents/$AgentId/core-memory" -Headers $headers -Method Get
} catch {
    Write-Error "Failed to fetch memory blocks: $_"
    exit 1
}

$blocks = $response.blocks
$agentInfo = $response.agent_type

Write-Host "Found $($blocks.Count) memory blocks"

# Also get agent name if not provided
if ($AgentName -eq "unknown") {
    try {
        $agentResponse = Invoke-RestMethod -Uri "$LettaBaseUrl/v1/agents/$AgentId" -Headers $headers -Method Get
        $AgentName = $agentResponse.name
        Write-Host "Agent name: $AgentName"
    } catch {
        Write-Host "Could not fetch agent name, using 'unknown'"
    }
}

# Create agent.json metadata
$metadata = @{
    agent_id = $AgentId
    agent_name = $AgentName
    synced_at = (Get-Date -Format "yyyy-MM-ddTHH:mm:ssZ")
    block_count = $blocks.Count
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

# Upload agent.json
$agentJsonPath = "agents/$AgentId/agent.json"
$ghHeaders = @{
    "Authorization" = "Bearer $githubToken"
    "Accept" = "application/vnd.github.v3+json"
}

# Check if file exists
$existingSha = $null
try {
    $existing = Invoke-RestMethod -Uri "https://api.github.com/repos/golaunchmate/memories/contents/$agentJsonPath" -Headers $ghHeaders -Method Get
    $existingSha = $existing.sha
} catch {
    # File doesn't exist yet
}

$uploadBody = @{
    message = "sync: Update agent metadata for $AgentName"
    content = $metadataBase64
}
if ($existingSha) { $uploadBody.sha = $existingSha }

try {
    Invoke-RestMethod -Uri "https://api.github.com/repos/golaunchmate/memories/contents/$agentJsonPath" -Headers $ghHeaders -Method Put -Body ($uploadBody | ConvertTo-Json) -ContentType "application/json"
    Write-Host "[OK] agent.json uploaded"
} catch {
    Write-Host "[FAIL] agent.json: $_"
}

# Upload each block
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
        Write-Host "  [SKIP] $label (empty)"
        continue
    }

    # Create markdown content with frontmatter
    $content = "---`ndescription: $description`nlimit: $limit`nagent_id: $AgentId`n---`n`n$value"
    $contentBytes = [System.Text.Encoding]::UTF8.GetBytes($content)
    $contentBase64 = [Convert]::ToBase64String($contentBytes)

    $filePath = "agents/$AgentId/$label.md"

    # Check if file exists
    $blockSha = $null
    try {
        $existingBlock = Invoke-RestMethod -Uri "https://api.github.com/repos/golaunchmate/memories/contents/$filePath" -Headers $ghHeaders -Method Get
        $blockSha = $existingBlock.sha
    } catch {
        # File doesn't exist yet
    }

    $blockBody = @{
        message = "sync: Update memory block '$label' for $AgentName"
        content = $contentBase64
    }
    if ($blockSha) { $blockBody.sha = $blockSha }

    try {
        Invoke-RestMethod -Uri "https://api.github.com/repos/golaunchmate/memories/contents/$filePath" -Headers $ghHeaders -Method Put -Body ($blockBody | ConvertTo-Json) -ContentType "application/json"
        $successCount++
        Write-Host "  [OK] $label ($($value.Length) chars)"
    } catch {
        $failCount++
        Write-Host "  [FAIL] $label: $_"
    }

    Start-Sleep -Milliseconds 500
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Sync Complete!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Success: $successCount"
Write-Host "Skipped (empty): $skipCount"
Write-Host "Failed: $failCount"
Write-Host "Total: $($blocks.Count)"
Write-Host ""
Write-Host "View at: https://github.com/golaunchmate/memories/tree/main/agents/$AgentId"
