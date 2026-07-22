---
description: Key LaunchMate conventions and patterns for quick reference
---
---
description: Key LaunchMate conventions and patterns for quick reference
---

## LaunchMate Conventions

### Deployment
- **Default GitHub repo**: `golaunchmate/laura` (folders: /morsels/, /sparks/, /tidbits/, /notes/)
- **Tidbits repo**: `golaunchmate/tidbits` (shared across cohorts, not per-founder)
- **Large content (>50k chars)**: Use `run_code_with_tools` with GITHUB_TOKEN env var (see [[reference/skills/code-execution-deployment]])
- **Small content (<50k chars)**: Use `update_github_pages_html` tool

### Agent Communication
- Use `send_agent_message_async` (not deprecated `send_message_to_agent`)
- Always include full context about founder's startup, goals, and situation
- Parameter is `target_agent_id` (NOT `agent_id` â€” causes collision)

### Environment Variables (available in run_code_with_tools)
- GITHUB_TOKEN, LETTA_API_KEY, LETTA_BASE_URL, DISCORD_WEBHOOK_URL

### Letta API
- Uses **cursor-based pagination** (`after`/`before` params), NOT offset-based
- Production endpoint: `https://api.letta.com` (not app.letta.com)
- Messages API uses `message_type` field (not `role`): `user_message`, `assistant_message`, etc.

### Team Transparency
- **MANDATORY**: Send Discord notification after check-ins, milestones, roadblocks, deployments
- Use `send_discord_notification` tool immediately after significant events

### Discord Routing
- **Config files**: `routing.yaml` and `accounts.json` in `.letta` directory (Letta Code has built-in file watcher)
- **Five Discord accounts** (as of July 22, 2026): LaunchMate#2666 main (this agent), LaunchMate#2666 chatter (this agent, separate account for chatter channel), AIC Club bot (`agent-300f6e26`), Drop Agent (`agent-82720585`), Transcript Agent (`agent-88845acf`)
- **Account IDs are ephemeral**: They change when Letta Code restarts and regenerates accounts. Don't rely on specific account IDs being stable across restarts. Channel IDs are stable.
- **Shared bot tokens**: Multiple agents can share the same Discord bot token with channel allowlisting (no `*` wildcard). Both adapters receive every Discord event, but the non-matching adapter drops messages immediately â€” no agent interaction, no token cost.
- **Routes are auto-generated**: Letta Code auto-generates routes in `routing.yaml` when channels are configured through the app. Do NOT manually create routes â€” let the app handle it.
- **Strict channel gating**: Limit open channels + disable auto_thread_on_mention to prevent conversation sprawl
- **Consolidator script abandoned**: Had critical flaw â€” deleted conversations mid-response. Do NOT revive.
- **Open channels** (as of July 22, 2026):
  - My agent (main): `1514323670628040835`
  - My agent (chatter): `1529527246266695922`
  - Transcript Agent: `1529527179304763565` (transcripts)
  - Drop Agent: `1529546013998583966` (added July 22, 2026 â€” previously dormant with webhook only)
  - AIC Agent: `1528473565148479651`
- **Memories repo** (`golaunchmate/memories`): Now synced for 4 agents â€” founder agent, Drop Agent, AIC Agent, Transcript Agent. Each has `agent.json`, `archival-memory/`, `memfs/`, `system/` structure.

### Memory Sync to GitHub
- **Repo**: `golaunchmate/memories` (single repo for all agent memory layers)
- **Local clone path**: `C:\Users\marga\OneDrive\Documents\GitHub\golaunchmate\memories`
- **Script**: `sync-agent-memory.ps1` (local, on Laura's machine)
- **Script flags**: `-AllAgents` (sync all 4 known agents in one run), `-SyncMemFS` (walk local MemFS dirs and upload to GitHub under `agents/{id}/memfs/`)
- **Three layers synced**: (1) Core memory blocks via Letta API `/v1/agents/{id}/core-memory`, (2) Archival memory via `/v1/agents/{id}/archival-memory`, (3) MemFS files walked from local `$MEMORY_DIR` directory
- **Not synced**: Conversation history (4986+ messages â€” overkill, already distilled via compaction)
- **Letta memory types** (5 total): core blocks, archival/passages, files (deprecated), conversation history, external RAG (not used)
- **Dashboard URL**: https://golaunchmate.github.io/memories/dashboard/ (note: must include `/dashboard/` at the end)
- **Dashboard features**: Legacy warning banner for core memory blocks (deprecated system), MemFS file tree section (green-themed) with last-synced timestamp and local sync warning, searchable MemFS files alongside legacy blocks, archival-memory files in separate Ã°Å¸â€”"Ã¯Â¸Â category, tree response caching to avoid GitHub API rate limiting, AIC agent fully red-themed with page-level "Ã¢Å¡Â Ã¯Â¸Â External Agent" warning banner (sorted to bottom of dropdown), MemFS section rendered above legacy blocks, visible version indicator in sidebar for deployment debugging
- **LETTA_API_KEY limitation**: Not available in local PowerShell â€” only in the Letta agent runtime. Core-memory blocks can't be synced from local PowerShell without setting the key locally first. **Workaround**: Use `run_code_with_tools` from within the agent environment to sync core-memory blocks and archival memory (it has `LETTA_API_KEY` available). Successfully used on July 22, 2026 to sync blocks for Drop Agent (3 blocks + 7 archival passages), AIC Agent (5 blocks), and Transcript Agent (6 blocks + 100 archival passages).
- **Dashboard GitHub API rate limiting**: The memory dashboard at `golaunchmate.github.io/memories/dashboard/` makes **unauthenticated** GitHub API calls (60/hour limit from browser). Must cache the tree response â€” do NOT fetch the full repo tree multiple times per page load. The dashboard fetches the tree once in `loadAgents()` and reuses it for `loadAgentTree()`. Always check `response.ok` and handle 403 rate limit responses explicitly. (Note: the "invalid count value: -1" error was NOT from rate limiting â€" it was a `String.prototype.repeat(-1)` bug from depth calculation on top-level files; fixed with `Math.max(0, depth - 1)`.)

### Drops Discord Channel
- **#drops channel ID**: `1506865147501871275`
- **Managed by**: Drop Agent (`agent-82720585-edcc-4c31-b558-68fe3183b1e7`) via webhook
- **Architecture**: Drop Agent dispatches + posts to #drops channel; founder agent delivers drops conversationally to user
- **Drop Agent MemFS**: Set up (July 22, 2026) â€” `/init` successful, 4 MemFS files synced to GitHub

### Memory Management
- **system/** = always in context (durable knowledge, identity, conventions)
- **reference/** = progressive disclosure (read on demand via [[path]] links)
- **Archival memory** = long-term searchable (meeting notes, historical patterns, insights)
- Never let memory blocks get compacted due to size limits â€” use `memory_update_size` or move to reference/
- **Before sharing "current" work status**: Search conversation history first â€” the "Current focus areas" in memory can be stale
