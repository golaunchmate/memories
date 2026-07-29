---
description: Active to-dos, current tasks, and things currently working on
---
## ACTIVE TODOS

**1. Delete flawed generate_and_deploy_html tool**
- Status: Pending
- Why: Tool wrapper doesn't solve the problem — use `run_code_with_tools` directly

**2. Drops Architecture v2 -- remaining steps**
- [x] Drop Agent created (agent-82720585, April 29 2026)
- [x] Drops repo created on GitHub (golaunchmate/drops)
- [x] Pipeline validated twice (May 26 & 27 -- reminder drop + briefing drop)
- [x] #drops Discord channel created (1506865147501871275)
- [x] Drop Agent MemFS set up (July 22, 2026)
- [x] Architecture v2 finalized -- founder agent owns full lifecycle (July 29, 2026)
- [x] `send_system_message` updated with conversation_id param (July 29, 2026)
- [ ] Create drops repo with proper folder structure
- [ ] Configure Transcript Agent to send data to Drop Agent
- [ ] Test full v2 lifecycle with real dispatch
- [ ] Explore Chatter/ChitChat -- meeting intelligence tool using Recall.ai
- [ ] Evaluate Granola free tier -- are summaries sufficient for agent context?
- See [[reference/launchmate/forward-momentum-tasks]] for full project details

**3. GitHub Actions tidbits dashboard — permissions fix**
- Need: org setting change to "Read and write" workflow permissions OR PAT_TOKEN secret
- See [[reference/launchmate/forward-momentum-tasks]] for details

**4. Clean up redundant memory sync scripts**
- Status: Pending (awaiting Laura's go-ahead)
- Context: AIC agent compared all 7 sync scripts:
  - ✅ KEEP: `sync-agent-memory.ps1` (9.8KB, July 22) — main script, API-based, multi-agent, correct paths. Used by AIC scheduled task.
  - ✅ KEEP: `sync-scheduled-task-fixed.ps1` (2KB, April 29) — creates the LettaCode-MemorySync task. Currently in use.
  - ✅ KEEP: `sync-to-github.ps1` (708B, April 29) — simple git push, used by LaunchMate's LettaCode-MemorySync task.
  - ❌ DELETE: `sync-all-agents.ps1` (650B, July 27) — redundant wrapper created by AIC, not used by any scheduled task.
  - ❌ DELETE: `sync-manual.ps1` (1.5KB, July 16) — legacy, hardcoded to agent-8f31ed67 only, superseded.
  - ❌ DELETE: `sync-scheduled-task.ps1` (1.5KB, April 29) — original version, superseded by fixed version.
  - ❌ DELETE: `sync-scheduled-task-simple.ps1` (2.5KB, April 29) — duplicate of fixed version, redundant.

## RECENTLY COMPLETED
- Activepieces → Discord notification flow (July 26, 2026) — polls Letta API every 1 min for new agent messages, posts to Discord. Key bugs fixed: variable reference, query params, cursor overwrite. Still pending: content filtering for "no response needed" messages.
- Memory Explorer Dashboard MemFS upgrade (July 22, 2026) — legacy warnings + MemFS section + 60 files synced across 4 agents
- MemFS fully working (July 22, 2026) — git-backed memory filesystem operational
- Memory sync script upgraded to 3 layers (July 22, 2026) — core blocks + archival memory + MemFS files pushed to golaunchmate/memories
- Memory Explorer Dashboard (July 2026) — https://golaunchmate.github.io/memories/dashboard/
- Agent memory sync to GitHub memories repo (July 2026)
- Code execution upload workflow prototype (March 2026)
- Tool parameter naming audit — tools were never broken (March 2026)
