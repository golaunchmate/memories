# Manual Sync: Letta Agent Memory to GitHub
# Run this script anytime to manually sync memories to GitHub
# NO ADMIN REQUIRED!

$memoryDir = "C:\Users\marga\.letta\agents\agent-8f31ed67-bc7d-40e7-abde-5a8bc4f7e601\memory"

cd $memoryDir

Write-Host "========================================"
Write-Host "  Manual Memory Sync to GitHub"
Write-Host "========================================"
Write-Host ""

# Check for uncommitted changes
$status = git status --porcelain
if ($status) {
    Write-Host "📦 Committing local changes..."
    git add .
    git commit -m "Update memory $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
    Write-Host "✅ Changes committed!"
} else {
    Write-Host "✅ No changes to commit"
}

# Push to both remotes
Write-Host ""
Write-Host "🚀 Pushing to remotes..."

try {
    git push origin main
    Write-Host "✅ Pushed to Letta server"
} catch {
    Write-Host "⚠️  Letta server push failed (this is OK if pushing to GitHub works)"
}

try {
    git push github main
    Write-Host "✅ Pushed to GitHub"
} catch {
    Write-Host "❌ GitHub push failed - check credentials"
}

Write-Host ""
Write-Host "========================================"
Write-Host "  Sync Complete!"
Write-Host "========================================"
Write-Host ""
Write-Host "Your memories are now synced to:"
Write-Host "  🌐 GitHub: https://github.com/golaunchmate/memories"
Write-Host ""
Write-Host "Run this script anytime to manually sync!"
