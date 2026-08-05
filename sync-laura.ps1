# Convenience Script: Sync Laura's Main Agent Memory to GitHub
# Usage: .\sync-laura.ps1 [-SyncMemFS]
#
# This script calls sync-agent-memory.ps1 for Laura's main agent (agent-b86549ac).
# Uses the Letta API to fetch memory blocks and uploads via GitHub API.
# No git push, no auth prompts - all API-based.

param(
    [switch]$SyncMemFS
)

$scriptDir = Split-Path $MyInvocation.MyCommand.Path -Parent
$syncScript = Join-Path $scriptDir "sync-agent-memory.ps1"

$lauraAgentId = "agent-b86549ac-4995-4d37-ad0d-c3119a3a093a"
$lauraAgentName = "Laura Wetherhold"

Write-Host ""
Write-Host "========================================" -ForegroundColor Magenta
Write-Host "  Syncing Laura's Agent Memory" -ForegroundColor Magenta
Write-Host "  Agent: $lauraAgentName ($lauraAgentId)" -ForegroundColor DarkMagenta
Write-Host "========================================" -ForegroundColor Magenta
Write-Host ""

# Run the sync script
$params = @("-NoProfile", "-ExecutionPolicy", "Bypass", "-File", $syncScript, "-AgentId", $lauraAgentId, "-AgentName", $lauraAgentName)
if ($SyncMemFS) { $params += "-SyncMemFS" }

powershell.exe @params

Write-Host ""
Write-Host "View: https://github.com/golaunchmate/memories/tree/main/agents/$lauraAgentId" -ForegroundColor Cyan
