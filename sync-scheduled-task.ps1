# Scheduled Task: Auto-sync Letta Code memories to GitHub
# Run this script once as Administrator to set up the scheduled task.
#
# This is the CONSOLIDATED version that replaces:
#   - sync-scheduled-task.ps1 (original, used unreliable $env:MEMORY_DIR)
#   - sync-scheduled-task-fixed.ps1 (fix attempt with hardcoded path)
#   - sync-scheduled-task-simple.ps1 (another fix attempt, nearly identical)
#
# Uses the API-based sync-all-agents.ps1 (no git push, no auth prompts).
# Each agent only updates its own folder in the memories repo.

$taskName = "LettaCode-MemorySync"

# Path to the memories repo where sync scripts live
$memoriesRepo = "C:\Users\marga\OneDrive\Documents\GitHub\golaunchmate\memories"

# Verify the directory exists
if (-not (Test-Path $memoriesRepo)) {
    Write-Error "Memories repo not found: $memoriesRepo"
    Write-Host "Please update the script with your correct path."
    exit 1
}

Write-Host "Setting up scheduled task for memory sync..."
Write-Host "Memories repo: $memoriesRepo"

# Check if task already exists
$existingTask = Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue
if ($existingTask) {
    Write-Host "Task '$taskName' already exists. Removing old version..." -ForegroundColor Yellow
    Unregister-ScheduledTask -TaskName $taskName -Confirm:$false
}

# Create the action (run the API-based sync-all-agents script with MemFS sync)
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoProfile -ExecutionPolicy Bypass -File `"$memoriesRepo\sync-all-agents.ps1`" -SyncMemFS" -WorkingDirectory $memoriesRepo

# Create the trigger (every 4 hours, starting now, repeating for 10 years)
$trigger = New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Hours 4) -RepetitionDuration (New-TimeSpan -Days 3650)

# Create settings (no problematic idle parameters)
$settings = New-ScheduledTaskSettingsSet -StartWhenAvailable -RunOnlyIfNetworkAvailable

# Register the task
Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger -Settings $settings -Description "Auto-sync Letta Code agent memories to GitHub every 4 hours via API" -RunLevel Highest

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  SUCCESS!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Scheduled task '$taskName' created successfully!" -ForegroundColor Green
Write-Host "It will run every 4 hours to sync all agents' memories to GitHub." -ForegroundColor Green
Write-Host "Uses API-based sync (no auth prompts, no git push)." -ForegroundColor Green
Write-Host ""
Write-Host "Useful commands:"
Write-Host "  Start-ScheduledTask -TaskName '$taskName'    # Run now"
Write-Host "  Get-ScheduledTask -TaskName '$taskName'       # View task"
Write-Host "  Unregister-ScheduledTask -TaskName '$taskName' # Remove"
