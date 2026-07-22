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
- Parameter is `target_agent_id` (NOT `agent_id` — causes collision)

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
- **Two bot accounts**: LaunchMate#2666 (this agent) and AIC Club bot (`agent-300f6e26`)
- **Strict channel gating**: Limit open channels + disable auto_thread_on_mention to prevent conversation sprawl
- **Consolidator script abandoned**: Had critical flaw — deleted conversations mid-response. Do NOT revive.
- **Current open channel**: `1514323670628040835` only (as of July 2026)

### Memory Sync to GitHub
- **Repo**: `golaunchmate/memories` (single repo for all agent memory layers)
- **Script**: `sync-agent-memory.ps1` (local, on Laura's machine)
- **Three layers synced**: (1) Core memory blocks via Letta API `/v1/agents/{id}/core-memory`, (2) Archival memory via `/v1/agents/{id}/archival-memory`, (3) MemFS files walked from local `$MEMORY_DIR` directory
- **Not synced**: Conversation history (4986+ messages — overkill, already distilled via compaction)
- **Letta memory types** (5 total): core blocks, archival/passages, files (deprecated), conversation history, external RAG (not used)

### Drops Discord Channel
- **#drops channel ID**: `1506865147501871275`
- **Managed by**: Drop Agent (`agent-82720585-edcc-4c31-b558-68fe3183b1e7`) via webhook
- **Architecture**: Drop Agent dispatches + posts to #drops channel; founder agent delivers drops conversationally to user
- **Drop Agent MemFS**: Being set up (July 22, 2026) — Laura ran `/init` on it

### Memory Management
- **system/** = always in context (durable knowledge, identity, conventions)
- **reference/** = progressive disclosure (read on demand via [[path]] links)
- **Archival memory** = long-term searchable (meeting notes, historical patterns, insights)
- Never let memory blocks get compacted due to size limits — use `memory_update_size` or move to reference/
- **Before sharing "current" work status**: Search conversation history first — the "Current focus areas" in memory can be stale
