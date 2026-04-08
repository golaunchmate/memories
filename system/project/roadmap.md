---
description: Future features and ideas for LaunchMate - tracking across sessions
---
# LaunchMate Roadmap

## Future Features (Ideas)

### Desktop App
- **Status**: UI Preview created (`tidbits/inflight-spring-26/laura/laura-wetherhold/desktop-app-preview.html`)
- **Tech Options**: 
  - Tauri (recommended) - smaller size, Rust backend
  - Electron - larger but more common
  - .exe wrapper - simple but limited features
- **Features**:
  - Native notifications
  - System tray integration
  - Offline mode
  - Telegram/iMessage integration via Letta Bot

### Automation Status
- **Tidbits**: ✅ GitHub Actions (push + daily)
- **Memories**: ⚠️ Manual sync script exists (`sync-to-github.ps1`)
- **Letta Memory**: ✅ Auto-syncs to Letta server
- **GitHub Memory**: ❌ Not automated - needs scheduling

### Future Automation Ideas
1. Schedule memory sync to GitHub (cron job or Windows Task Scheduler)
2. Auto-update tidbits dashboard on new tidbit creation
3. Webhook for real-time dashboard updates
4. Memory change detection and auto-push

### Memories Dashboard
- Created at `dashboard/memories.html`
- Needs: Agent-specific memory files (restructured)
- Structure: `agents/{agent-id}/` with `agent.json` metadata

### Mentor Admin Features
- ✅ Added to tidbits dashboard (Admin tab)
- Features: Export JSON/CSV, Copy links, Generate report, Engagement stats

### Question: EXE vs Desktop App
- **EXE wrapper**: Simpler, just wraps the web app, limited native features
- **Desktop app (Tauri/Electron)**: Full native features, but more work
- **Recommendation**: Start with Tauri for best balance of features and complexity

## Notes from Sessions

### 2026-04-08
- Redesigned tidbits dashboard with stunning visuals
- Added mentor admin panel
- Created desktop app UI preview
- Restructured memories repo by agent-id
