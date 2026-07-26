---
description: Active to-dos, current tasks, and things currently working on
---
## ACTIVE TODOS

**1. Delete flawed generate_and_deploy_html tool**
- Status: Pending
- Why: Tool wrapper doesn't solve the problem — use `run_code_with_tools` directly

**2. Drops Architecture — remaining steps**
- [x] Drop Agent created (agent-82720585, April 29 2026)
- [x] Drops repo created on GitHub (golaunchmate/drops)
- [x] Pipeline validated twice (May 26 & 27 — reminder drop + briefing drop)
- [x] #drops Discord channel created (1506865147501871275)
- [ ] Set up Drop Agent MemFS (Laura running /init, July 22 2026)
- [ ] Wire up #drops channel webhook to Drop Agent
- [ ] Configure Transcript Agent to send data to Drop Agent
- [ ] Implement scheduling logic in Drop Agent
- See [[reference/launchmate/forward-momentum-tasks]] for full project details

**3. GitHub Actions tidbits dashboard — permissions fix**
- Need: org setting change to "Read and write" workflow permissions OR PAT_TOKEN secret
- See [[reference/launchmate/forward-momentum-tasks]] for details

## RECENTLY COMPLETED
- Activepieces → Discord notification flow (July 26, 2026) — polls Letta API every 1 min for new agent messages, posts to Discord. Key bugs fixed: variable reference, query params, cursor overwrite. Still pending: content filtering for "no response needed" messages.
- Memory Explorer Dashboard MemFS upgrade (July 22, 2026) — legacy warnings + MemFS section + 60 files synced across 4 agents
- MemFS fully working (July 22, 2026) — git-backed memory filesystem operational
- Memory sync script upgraded to 3 layers (July 22, 2026) — core blocks + archival memory + MemFS files pushed to golaunchmate/memories
- Memory Explorer Dashboard (July 2026) — https://golaunchmate.github.io/memories/dashboard/
- Agent memory sync to GitHub memories repo (July 2026)
- Code execution upload workflow prototype (March 2026)
- Tool parameter naming audit — tools were never broken (March 2026)
