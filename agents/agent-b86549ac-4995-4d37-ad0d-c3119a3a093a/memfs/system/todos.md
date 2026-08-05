---
description: Active to-dos, current tasks, and things currently working on
---
## ACTIVE TODOS

Historical task archive: [[reference/forward_momentum_tasks]].

**1. Delete flawed generate_and_deploy_html tool**
- Status: Pending
- Why: Tool wrapper doesn't solve the problem - use `run_code_with_tools` directly

**1.5. Chatter -- getting it actually working**
- [x] Concept defined (auto-synced group chat from transcripts)
- [x] Platform picked: Discord (free tier, unlimited history)
- [x] Chatter channel created & open (`1529527246266695922`)
- [x] Architecture decided: founder agent (me) is the face of chatter, no separate agent
- [x] Chatter instructions memory file created (`reference/chatter/instructions.md`)
- [ ] Test with manually pasted transcript -- process conversationally, extract commitments
- [ ] Create commitments tracking file (`reference/chatter/commitments.md`) after first transcript
- [ ] Set up auto-sync placeholder (transcript channel -> chatter channel)
- [ ] Integrate parfait for transcript extraction (future)
- [ ] Recall.ai integration for live transcription (future)
- [ ] Live transcription desktop UI (future)
- [ ] Speaker diarization (future)
- [ ] Auto task assignment from transcripts (future)
- See [[reference/chatter/instructions]] for full chatter operating manual

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

**3. GitHub Actions tidbits dashboard -- permissions fix**
- Status: COMPLETED (August 5, 2026)
- What was done: Added `permissions: contents: write` to `update-dashboard.yml` workflow file. This allows GITHUB_TOKEN to push the dashboard data commit. Fixes the 403 errors on the "Push changes" step.
- Local script also verified fresh (uses `$PSScriptRoot` dynamic path resolution).

**4. Clean up redundant memory sync scripts**
- Status: COMPLETED (August 5, 2026)
- What was done: Created `sync-laura.ps1` convenience wrapper for agent-b86549ac. Consolidated three redundant scheduled task scripts into single unified `sync-scheduled-task.ps1`. Added `DEPRECATED` headers to `sync-scheduled-task-fixed.ps1` and `sync-scheduled-task-simple.ps1` pointing to consolidated version. Set `git config --global credential.helper cache` to eliminate auth prompts.
- Active scripts: `sync-agent-memory.ps1` (main), `sync-laura.ps1` (convenience wrapper), `sync-scheduled-task.ps1` (unified), `sync-to-github.ps1` (simple push).

**5. Memory Sync to GitHub** [RESTORED FROM ORIGINAL]
- Goal: Sync agent memory blocks to golaunchmate/memories repo
- Status: COMPLETED (July 15, 2026)
- What was done: Synced all 28 non-empty memory blocks, created agent.json metadata, created reusable sync-agent-memory.ps1 script
- Note: MemFS git is NOT enabled for this agent. Sync must be done via Letta API.
- Next step: Set up GitHub Action with cron + LETTA_API_KEY for automatic periodic sync

**6. Discord Route Consolidator** [RESTORED FROM ORIGINAL]
- Goal: Consolidate all Discord routes into one conversation to prevent conversation sprawl
- Status: COMPLETED (July 2026)
- What was built: Script with file watcher, auto-deletion of stale conversations, message preservation, self-restart wrapper, VBS wrapper in Windows Startup folder
- Unified conversation: conv-f49b5024-95c2-4469-b7eb-919b0ecd9260
- Note: Consolidator approach was later abandoned in favor of Letta Code built-in channel gating (see developer_lessons rule 14)

**7. Discord Routing -- Exclude agent-300f6e26** [RESTORED FROM ORIGINAL]
- Goal: Exclude AIC Agent (agent-300f6e26) from this agent's Discord conversation
- Status: Pending (July 19, 2026)
- Plan: Disable Route 2 in routing.yaml (set enabled: false), later set up separate Discord conversation for agent-300f6e26

**8. Memory Explorer Dashboard** [RESTORED FROM ORIGINAL]
- Goal: Build a dynamic memory visualization dashboard for the memories repo
- Status: COMPLETED (July 15, 2026)
- What was built: Complete dashboard at golaunchmate/memories/dashboard/index.html
  - Dynamic agent loading from GitHub API
  - File tree + markdown rendering
  - Search, stats, copy-to-clipboard
  - URL: https://golaunchmate.github.io/memories/dashboard/

## RECENTLY COMPLETED
- Sync scripts and dashboard maintenance (August 5, 2026) -- Completed 5 tasks: (1) Updated local tidbits dashboard script via git pull, (2) Created sync-laura.ps1 convenience wrapper, (3) Fixed git credential helper cache, (4) Consolidated redundant scheduled task scripts into single version + deprecated old ones, (5) Added `permissions: contents: write` to update-dashboard.yml workflow. Also cleaned up stale root-level system/ files in memories repo, merged remote changes, added .gitignore for nested MemFS repos. **Lesson learned**: `work_done` tool experienced network failures (DNS resolution errors) preventing response delivery -- always verify delivery, send manual fallbacks.
- Git repo structure investigation (July 29, 2026) -- Confirmed MemFS is clean (no duplicates); stale DROPS content only in nested agent snapshots in golaunchmate/memories repo; main agent (agent-b86549ac) NOT synced to repo yet
- MemFS audit and repair (July 29, 2026) -- Fixed 3 categories of corruption across 23 memory files
- Letta Code credit consumption investigation (July 27, 2026) -- Found hidden ephemeral subagents
- Activepieces -> Discord notification flow (July 26, 2026) -- polls Letta API every 1 min
- Memory Explorer Dashboard MemFS upgrade (July 22, 2026)
- MemFS fully working (July 22, 2026)
- Memory sync script upgraded to 3 layers (July 22, 2026)
- Code execution upload workflow prototype (March 2026)
- Tool parameter naming audit (March 2026)
- Developer lessons memory block (March 2026)
- Archival memory documentation (March 2026)
- Qudsi success story (March 2026)
