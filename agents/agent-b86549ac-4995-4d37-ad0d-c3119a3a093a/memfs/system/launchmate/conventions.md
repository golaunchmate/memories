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

### Memory Management
- **system/** = always in context (durable knowledge, identity, conventions)
- **reference/** = progressive disclosure (read on demand via [[path]] links)
- **Archival memory** = long-term searchable (meeting notes, historical patterns, insights)
- Never let memory blocks get compacted due to size limits — use `memory_update_size` or move to reference/
