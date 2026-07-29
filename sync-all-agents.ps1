# Sync both agents' MemFS to GitHub
$syncScript = "C:\Users\marga\OneDrive\Documents\GitHub\golaunchmate\memories\sync-agent-memory.ps1"

# Sync AIC Agent
powershell -NoProfile -ExecutionPolicy Bypass -File $syncScript -AgentId "agent-300f6e26-ce14-4baa-b116-a333f335de43" -AgentName "AIC Agent" -SyncMemFS

# Sync LaunchMate Agent (existing)
$memoryDir = "C:\Users\marga\.letta\agents\agent-8f31ed67-bc7d-40e7-abde-5a8bc4f7e601\memory"
cd $memoryDir
$status = git status --porcelain
if ($status) {
    git add .
    git commit -m "Update memory $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
}
git push origin main 2>$null
git push github main 2>$null
