---
description: Future features and ideas for LaunchMate - tracking across sessions
---
# LaunchMate Roadmap

## Future Features (Ideas)

### Desktop App
- **Status**: UI Preview created with LaunchMate branding
- **Location**: `tidbits/inflight-spring-26/laura/laura-wetherhold/desktop-app-preview.html`
- **Tech Options**: 
  - Tauri (recommended) - smaller size (~10MB), Rust backend, better performance
  - Electron - larger (~150MB) but more common ecosystem
  - .exe wrapper - simplest, just wraps web app, limited native features
- **Features**:
  - Native notifications
  - System tray integration
  - Offline mode
  - Telegram/iMessage integration via Letta Bot
- **Similar to**: Letta ADE (agent-centric), Claude Code (chat panel), Codex (dashboard)
- **LaunchMate Brand**: Navy blues (#263051, #14234a), clean UI, Inter font

### Automation Status
| System | Status | Method |
|--------|--------|--------|
| Tidbits Dashboard | ✅ Automated | GitHub Actions (push + daily) |
| Memories → Letta Server | ✅ Automated | Built into Letta Code |
| Memories → GitHub | ✅ Scheduled | Windows Task Scheduler (sync-scheduled-task.ps1) |
| Tidbits w/o GitHub Desktop | 🔄 TODO | GitHub API automation |

### Memory Types (What's Stored)
| Type | Location | Access |
|------|----------|--------|
| System Memory | `system/*.md` | Always in context (pinned) |
| Progressive Memory | Files outside `system/` | Loaded on demand |
| Recall (Conversation) | Letta server | Searchable via recall subagent |
| Core Memory | Letta server blocks | Block-based storage |
| Archival Memory | Optional | Long-term storage |

### Memories Dashboard
- ✅ Created at `dashboard/memories.html`
- ✅ Shows agent by common name (bold), agent-id (subtle gray)
- ✅ Structure: `agents/{agent-id}/` with `agent.json` metadata
- **Common name stored in**: `agents/{agent-id}/agent.json` as `name` field

### Mentor Admin Features
- ✅ Added to tidbits dashboard (Admin tab)
- Features: Export JSON/CSV, Copy links, Generate report, Engagement stats, Inactive founders list

### Tauri Project Skeleton
- **TODO**: Create in `golaunchmate/laura` repo
- Would wrap the existing LaunchMate web app
- Add native features: notifications, tray, offline

### Telegram Bot Integration
- **How**: Install Letta Bot, connect to local Letta Code instance
- **After**: Desktop app build (separate work)
- **Steps**: Bot setup → Webhook → Agent routing

## Questions Answered

### EXE vs Desktop App?
- **EXE wrapper**: Simpler, just wraps the web app, limited native features
- **Desktop app (Tauri)**: Full native features, 10MB size, better UX
- **Recommendation**: Tauri for best balance

### Local vs Remote Repo Access?
- I can **fetch** from web APIs (GitHub, websites)
- For **automation** (creating files, running scripts), I need **local access**
- For tidbits: Can use GitHub API to update without GitHub Desktop
- LaunchMate: Keep local until you finish your feature

### Do I Save Ideas/Discussions?
- ✅ **Yes!** This roadmap file tracks all ideas
- ✅ `system/todos.md` tracks active tasks
- ✅ Memory syncs to Letta server automatically
- ✅ Memory pushed to GitHub manually or scheduled

## Notes from Sessions

### 2026-04-08
- Redesigned tidbits dashboard with stunning visuals
- Added mentor admin panel
- Created desktop app UI preview with LaunchMate branding
- Restructured memories repo by agent-id
- Created scheduled task for memory GitHub sync
- Fixed dashboard data loading (embedded data in HTML)
- Documented all memory types and their storage locations
