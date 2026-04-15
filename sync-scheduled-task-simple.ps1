# Scheduled Task: Auto-sync Letta Code memories to GitHub
# Run this script once as Administrator to set up the scheduled task
# FIXED: No problematic parameters, uses hardcoded path

$taskName = "LettaCode-MemorySync"

# FIXED: Use hardcoded path instead of environment variable
$memoryDir = "C:\Users\marga\.letta\agents\agent-8f31ed67-bc7d-40e7-abde-5a8bc4f7e601\memory"

# Verify the directory exists
if (-not (Test-Path $memoryDir)) {
    Write-Error "Memory directory not found: $memoryDir"
    Write-Host "Please update the script with your correct memory path."
    exit 1
}

Write-Host "Setting up scheduled task for memory sync..."
Write-Host "Memory directory: $memoryDir"

# Check if task already exists
$existingTask = Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue
if ($existingTask) {
    Write-Host "Task '$taskName' already exists. Removing old version..."
    Unregister-ScheduledTask -TaskName $taskName -Confirm:$false
}

# Create the action (run the sync script)
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoProfile -ExecutionPolicy Bypass -File `"$memoryDir\sync-to-github.ps1`"" -WorkingDirectory $memoryDir

# Create the trigger (every 4 hours, starting now)
$trigger = New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Hours 4) -RepetitionDuration (New-TimeSpan -Days 3650)

# FIXED: Create settings WITHOUT the problematic parameter
$settings = New-ScheduledTaskSettingsSet -StartWhenAvailable -RunOnlyIfNetworkAvailable

# Register the task
Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger -Settings $settings -Description "Auto-sync Letta Code agent memories to GitHub every 4 hours" -RunLevel Highest

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  SUCCESS!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Scheduled task '$taskName' created successfully!" -ForegroundColor Green
Write-Host "It will run every 4 hours to sync memories to GitHub." -ForegroundColor Green
Write-Host ""
Write-Host "Useful commands:"
Write-Host "  Start-ScheduledTask -TaskName '$taskName'    # Run now"
Write-Host "  Get-ScheduledTask -TaskName '$taskName'       # View task"
Write-Host "  Unregister-ScheduledTask -TaskName '$taskName' # Remove"
