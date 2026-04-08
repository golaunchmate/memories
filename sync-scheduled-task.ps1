# Scheduled Task: Auto-sync Letta Code memories to GitHub
# Run this script once to set up the scheduled task

$taskName = "LettaCode-MemorySync"
$memoryDir = $env:MEMORY_DIR

# Check if task already exists
$existingTask = Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue
if ($existingTask) {
    Write-Host "Task '$taskName' already exists. Updating..."
    Unregister-ScheduledTask -TaskName $taskName -Confirm:$false
}

# Create the action (run the sync script)
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoProfile -ExecutionPolicy Bypass -File `"$memoryDir\sync-to-github.ps1`"" -WorkingDirectory $memoryDir

# Create the trigger (every 4 hours)
$trigger = New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Hours 4)

# Create the settings
$settings = New-ScheduledTaskSettingsSet -StartWhenAvailable -DontStopOnIdleApplication -RunOnlyIfNetworkAvailable

# Register the task
Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger -Settings $settings -Description "Auto-sync Letta Code agent memories to GitHub" -RunLevel Highest

Write-Host "Scheduled task '$taskName' created successfully!"
Write-Host "It will run every 4 hours to sync memories to GitHub."
Write-Host ""
Write-Host "To manually trigger: Start-ScheduledTask -TaskName '$taskName'"
Write-Host "To view task: Get-ScheduledTask -TaskName '$taskName'"
Write-Host "To remove: Unregister-ScheduledTask -TaskName '$taskName'"
