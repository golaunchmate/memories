# Sync All Agents' Memory to GitHub via API
# Usage: .\sync-all-agents.ps1 [-SyncMemFS]
#
# This script syncs ALL known agents using the API-based approach.
# No git push, no auth prompts — all done via Letta API + GitHub API.
# Each agent only updates its own folder in the memories repo.
# Runs everything in ONE window with consistent coloring.

param(
    [switch]$SyncMemFS
)

# Force dark background (like cmd.exe) instead of default PowerShell blue
$Host.UI.RawUI.BackgroundColor = 'Black'
Clear-Host

$scriptDir = Split-Path $MyInvocation.MyCommand.Path -Parent
$syncScriptPath = Join-Path $scriptDir "sync-agent-memory.ps1"

# Dot-source the sync script to load the Sync-Agent function (skips main block)
. $syncScriptPath -DotSourceMode

# Set up GitHub headers (needed by Sync-Agent function)
$githubToken = $env:GITHUB_TOKEN
$ghHeaders = @{
    "Authorization" = "Bearer $githubToken"
    "Accept" = "application/vnd.github.v3+json"
}
$apiKey = $env:LETTA_API_KEY

# All known agents — each only touches its own agents/{agentId}/ folder
$agents = @(
    @{ Id = "agent-b86549ac-4995-4d37-ad0d-c3119a3a093a"; Name = "Laura Wetherhold" },
    @{ Id = "agent-82720585-edcc-4c31-b558-68fe3183b1e7"; Name = "Drop Agent" },
    @{ Id = "agent-300f6e26-ce14-4baa-b116-a333f335de43"; Name = "AIC Agent" },
    @{ Id = "agent-88845acf-f843-463a-9b23-185cad7499f7"; Name = "Transcript Agent" }
)

Write-Host ""
Write-Host "========================================" -ForegroundColor Magenta
Write-Host "  Syncing All $($agents.Count) Agents" -ForegroundColor Magenta
Write-Host "========================================" -ForegroundColor Magenta

foreach ($agent in $agents) {
    Sync-Agent -AgentId $agent.Id -AgentName $agent.Name -DoMemFS $SyncMemFS
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  All agents synced!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
