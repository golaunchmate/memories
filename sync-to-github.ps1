# Sync Letta Agent Memory to GitHub
# Run this script to push memory changes to GitHub

$memoryDir = $env:MEMORY_DIR
cd $memoryDir

Write-Host "Syncing memory to GitHub..."

# Check for uncommitted changes
$status = git status --porcelain
if ($status) {
    Write-Host "Committing local changes..."
    git add .
    git commit -m "Update memory $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
}

# Push to both remotes
Write-Host "Pushing to Letta server..."
git push origin main

Write-Host "Pushing to GitHub..."
git push github main

Write-Host "Done! Memory synced to:"
Write-Host "  - Letta: https://api.letta.com"
Write-Host "  - GitHub: https://github.com/golaunchmate/memories"
