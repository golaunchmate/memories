---
description: Active todos and tasks for current work - tracking what needs to be done
---
# Active Todos

## Current Session (2026-04-15)

### High Priority
- [ ] Iterate on dashboard visuals (tidbits, memories, desktop preview)
- [ ] Develop Tauri desktop app (from existing skeleton)
- [ ] Telegram/iMessage integration with Letta Bot
- [ ] Research: Local agents on founders' machines (Letta Code + Letta Bot + extras)

### In Progress
- [x] Create scheduled task for memory GitHub sync - DONE ✅
- [x] Discord integration for team updates - DONE ✅
- [x] Set up unique message signature: "Letta Code (Laura)" - DONE ✅

### Completed
- [x] Fix tidbits dashboard data loading
- [x] Update memories dashboard for agent-id structure
- [x] Add mentor admin panel to dashboard
- [x] Restructure memories repo by agent-id
- [x] Create desktop app UI preview
- [x] Organize all repos into golaunchmate/ folder
- [x] Create Tauri skeleton in laura repo
- [x] Fix GitHub workflow path issue
- [x] Letta ecosystem research complete
- [x] Scheduled task created successfully (runs every 4 hours)

### Research Tasks - Letta Ecosystem ✅ RESEARCH COMPLETE
From Cameron's suggestions and Letta documentation:

#### Subagents for Task Delegation
- [ ] Research: Deploy `<agent-id>` as explore subagent for code review
- [ ] Example: "Deploy agent-xxx as an explore subagent to review authentication code"

#### Repos to Explore - FROM "EXTRAS" LIST
- [x] https://github.com/cpfiffer/note (14 stars, Go) - External storage for Letta agents to manage persistent notes
- [x] https://github.com/letta-ai/letta (22k stars, Python) - Official Letta repo with installable tools
- [x] Cameron's personal repos: central (Bluesky AI), self-expansion (knowledge graphs), comind (cognitive layer)
- [x] Taurean's cloudseeding (TypeScript/Python) - Bridge between Bluesky and Letta agents via AT Protocol

#### Official Letta Repositories Discovered
| Repo | Stars | Purpose | Use For |
|------|-------|---------|---------|
| **letta** | 22,000+ | Core platform | Foundation |
| **letta-code** | 2,100+ | CLI coding agent | Founders |
| **lettabot** | 291 | Cross-platform messaging | Founders |
| **vercel-ai-sdk-provider** | - | Vercel integration | Founders |
| **n8n-nodes-letta** | 18 | n8n workflows | Automation |
| **note** (cpfiffer) | 14 | External note storage | Laura |
| **cloudseeding** | - | Bluesky integration | Laura |

#### Key Findings
- **Memory Types**: Core Memory (blocks), Recall (conversation history), Archival (semantic search), Progressive, Scratchpad
- **For Founders**: letta-code, lettabot, vercel-ai-sdk-provider
- **For Laura**: note (persistent notes), cloudseeding (Bluesky), central (autonomous AI)

#### GitHub Actions
- [ ] Add GitHub Actions for automated workflows
- [ ] Research: What actions can be added to tidbits/memories repos

#### Letta Bot Integrations
- [ ] Telegram Bot setup and configuration
- [ ] iMessage integration possibilities
- [ ] Webhook configurations for real-time updates
- [ ] Letta Bot + Letta Code local setup for founders

### Memory Site Enhancements - FORGOTTEN ITEMS
- [ ] Add **Progressive Memory** display to memories dashboard
- [ ] Add **Recall (Conversations)** - conversation history from Letta server
- [ ] Add **Archival Memory** display
- [ ] Add **Core Memory** display (block-based storage from Letta server)
- [ ] Create comprehensive memory type visualization showing all 5 types

### Infrastructure Fixes - FORGOTTEN ITEMS
- [ ] Fix scheduled task script - `DontStopOnIdleApplication` parameter error
- [ ] Create manual sync option for memories (as backup to scheduled task)
- [ ] GitHub API automation for tidbits (without GitHub Desktop)

### Visual Iteration - DEFERRED BUT TRACKED
- [ ] Iterate on tidbits dashboard visuals (enhance beyond current stunning version)
- [ ] Iterate on memories dashboard visuals (agent view styling)
- [ ] Iterate on desktop app preview (further polish)

### Architecture Research - LOCAL AGENTS
- [ ] Research: Webapp interface with agents running locally on founders' machines
- [ ] How to have Letta Code + Letta Bot run locally while webapp is remote
- [ ] Explore "extras" for local agent deployment (Docker, Tauri, etc.)

### Future Ideas
- [ ] Add real-time dashboard updates via webhooks
- [ ] Create memories dashboard with live GitHub API data
- [ ] Archive/conversation history visualization (Recall memory type)

## Notes
- User prefers detailed explanations
- Standard research depth is sufficient
- Don't over-engineer - do what was asked
- Discord webhook integrated for team updates
- Message signature: "Letta Code (Laura)" 🎭
