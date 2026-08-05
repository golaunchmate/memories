---
description: Key LaunchMate conventions and patterns for quick reference
---

## LaunchMate Conventions

### Deployment
- **Default GitHub repo**: `golaunchmate/laura` (folders: /morsels/, /sparks/, /tidbits/, /notes/)
- **Tidbits repo**: `golaunchmate/tidbits` (shared across cohorts, not per-founder)
- **Large content (>50k chars)**: Use `run_code_with_tools` with GITHUB_TOKEN env var (see `code_execution_deployment_skill` block)
- **Small content (<50k chars)**: Use `update_github_pages_html` tool

### Agent Communication
- Use `send_agent_message_async` (not deprecated `send_message_to_agent`)
- Always include full context about founder's startup, goals, and situation
- Parameter is `target_agent_id` (NOT `agent_id` — causes collision)

### Environment Variables (available in run_code_with_tools)
- GITHUB_TOKEN, LETTA_API_KEY, LETTA_BASE_URL, DISCORD_WEBHOOK_URL
- **Note**: `run_code_with_tools` executes on Linux, NOT on the local Windows machine. Cannot use it to write local MemFS files — use the `memory()` tool or Bash/PowerShell instead.

### Letta API
- Uses **cursor-based pagination** (`after`/`before` params), NOT offset-based
- Production endpoint: `https://api.letta.com` (not app.letta.com)
- Messages API uses `message_type` field (not `role`): `user_message`, `assistant_message`, `reasoning_message`, `tool_call_message`, `tool_return_message`, `system_message`, `summary_message`, `event_message`, `approval_request_message`, `approval_response_message`, `hidden_reasoning_message`
- **`include_return_message_types` query param**: Filters messages at the API level (e.g., `?include_return_message_types=assistant_message` returns only assistant messages). Supported on `/v1/agents/{id}/messages` endpoint.
- **`after` cursor caveat**: The `after` parameter only works with message IDs from the SAME agent's result set. Using — cursor from — different agent/conversation causes the API to silently ignore it and return all messages.
- **No webhook support on Letta Cloud**: `STEP_COMPLETE_WEBHOOK` requires server-level env vars (not available on Cloud). PR #2646 for event streaming webhooks was closed/never merged. Polling is the only option for Cloud users.
- **`app.letta.com` proxies to `api.letta.com`**: The agent runtime's `LETTA_BASE_URL` is `app.letta.com`, which middleware-rewrites to `api.letta.com`. For external integrations, use `api.letta.com` directly.

### Activepieces Integration
- **Purpose**: Automation platform (like Zapier) used to poll Letta agent messages and post to Discord
- **Flow architecture**: Schedule (1 min) — Store Get (last_msg_id) — HTTP Request (Letta API with `after` cursor — `include_return_message_types=assistant_message`) — Code step (parse, extract last ID, filter content) — Router (`has_messages` check) — Loop — Discord Send — Store Put (save new cursor)
- **Persistent Storage (Store)**: `FLOW` scope persists across runs of the same flow; `PROJECT` scope is shared across all flows. Both persist between runs.
- **Flow control**: Called "Router" (not "Filter" or "Only Continue If"). Creates conditional branches.
- **Variable references**: Must reference step OUTPUT (e.g., `{{steps.store_get.output.value}}`), not the variable/key name itself. Referencing the key name passes garbage.
- **Query params**: Use the `queryParams` field in HTTP step, NOT baked into URL string — variable interpolation doesn't work reliably in URL strings.
- **Publishing**: Must hit Publish for changes to take effect. Enabling without publishing runs the old version.
- **Letta connector bug**: The native Letta connector's "New Message" trigger dropdown calls `client.agents.list()` with no limit, trying to paginate through all 509 agents — causes "failed to load agents" timeout. Workaround: use HTTP Request step instead of native connector.

### Team Transparency
- **MANDATORY**: Send Discord notification after check-ins, milestones, roadblocks, deployments
- Use `send_discord_notification` tool immediately after significant events

### Discord Routing
- **Config files**: `routing.yaml` and `accounts.json` in `.letta` directory (Letta Code has built-in file watcher)
- **Five Discord accounts** (as of July 22, 2026): LaunchMate#2666 main (this agent), LaunchMate#2666 chatter (this agent, separate account for chatter channel), AIC Club bot (`agent-300f6e26`), Drop Agent (`agent-82720585`), Transcript Agent (`agent-88845acf`)
- **Account IDs are ephemeral**: They change when Letta Code restarts and regenerates accounts. Don't rely on specific account IDs being stable across restarts. Channel IDs are stable.
- **Shared bot tokens**: Multiple agents can share the same Discord bot token with channel allowlisting (no `*` wildcard). Both adapters receive every Discord event, but the non-matching adapter drops messages immediately — no agent interaction, no token cost.
- **Routes are auto-generated**: Letta Code auto-generates routes in `routing.yaml` when channels are configured through the app. Do NOT manually create routes — let the app handle it.
- **Strict channel gating**: Limit open channels — disable auto_thread_on_mention to prevent conversation sprawl
- **Consolidator script abandoned**: Had critical flaw — deleted conversations mid-response. Do NOT revive.
- **Open channels** (as of July 22, 2026):
  — My agent (main): `1514323670628040835`
  — My agent (chatter): `1529527246266695922`
  — Transcript Agent: `1529527179304763565` (transcripts)
  — Drop Agent: `1529546013998583966` (added July 22, 2026 — previously dormant with webhook only)
  — AIC Agent: `1528473565148479651`
- **Memories repo** (`golaunchmate/memories`): Now synced for — agents — founder agent, Drop Agent, AIC Agent, Transcript Agent. Each has `agent.json`, `archival-memory/`, `memfs/`, `system/` structure.

### Memory Sync to GitHub
- **Repo**: `golaunchmate/memories` (single repo for all agent memory layers)
- **Local clone path**: `C:\Users\marga\OneDrive\Documents\GitHub\golaunchmate\memories`
- **Script**: `sync-agent-memory.ps1` (local, on Laura's machine)
- **Script flags**: `-AllAgents` (sync all — known agents in one run), `-SyncMemFS` (walk local MemFS dirs and upload to GitHub under `agents/{id}/memfs/`)
- **Three layers synced**: (1) Core memory blocks via Letta API `/v1/agents/{id}/core-memory`, (2) Archival memory via `/v1/agents/{id}/archival-memory`, (3) MemFS files walked from local `$MEMORY_DIR` directory
- **Not synced**: Conversation history (4986+ messages — overkill, already distilled via compaction)
- **Letta memory types** (5 total): core blocks, archival/passages, files (deprecated), conversation history, external RAG (not used)
- **Dashboard URL**: https://golaunchmate.github.io/memories/dashboard/ (note: must include `/dashboard/` at the end)
- **Dashboard features**: Legacy warning banner for core memory blocks (deprecated system), MemFS file tree section (green-themed) with last-synced timestamp and local sync warning, searchable MemFS files alongside legacy blocks, archival-memory files in separate 🗂️ category, tree response caching to avoid GitHub API rate limiting, AIC agent fully red-themed with page-level ⚠️ External Agent warning banner (sorted to bottom of dropdown), MemFS section rendered above legacy blocks, visible version indicator in sidebar for deployment debugging
- **LETTA_API_KEY limitation**: Not available in local PowerShell — only in the Letta agent runtime. Core-memory blocks can't be synced from local PowerShell without setting the key locally first. **Workaround**: Use `run_code_with_tools` from within the agent environment to sync core-memory blocks and archival memory (it has `LETTA_API_KEY` available). Successfully used on July 22, 2026 to sync blocks for Drop Agent (3 blocks — 7 archival passages), AIC Agent (5 blocks), and Transcript Agent (6 blocks — 100 archival passages).
- **Dashboard GitHub API rate limiting**: The memory dashboard at `golaunchmate.github.io/memories/dashboard/` makes **unauthenticated** GitHub API calls (60/hour limit from browser). Must cache the tree response — do NOT fetch the full repo tree multiple times per page load. The dashboard fetches the tree once in `loadAgents()` and reuses it for `loadAgentTree()`. Always check `response.ok` and handle 403 rate limit responses explicitly. (Note: the "invalid count value: -1" error was NOT from rate limiting — it was — `String.prototype.repeat(-1)` bug from depth calculation on top-level files; fixed with `Math.max(0, depth — 1)`.)

### Drops Discord Channel
- **#drops channel ID**: `1506865147501871275`
- **Managed by**: Drop Agent (`agent-82720585-edcc-4c31-b558-68fe3183b1e7`) via webhook
- **Architecture**: Drop Agent dispatches — posts to #drops channel; founder agent delivers drops conversationally to user
- **Drop Agent MemFS**: Set up (July 22, 2026) — `/init` successful, — MemFS files synced to GitHub

### Memory Management
- **MemFS is the PRIMARY memory system** (as of July 29, 2026). Laura explicitly prioritized MemFS over core memory blocks and archival memory. Always update MemFS files first.
- **Be proactive**: Update memory without asking permission. Laura said "no need to ask me for permission, just change your memory as you see its needed."
- **system/** — always in context (durable knowledge, identity, conventions)
- **reference/ — WORKS (confirmed July 29, 2026)**: Moving non-essential files from system/ to reference/ is officially supported by Letta. Files outside system/ are discoverable but loaded on-demand, not every turn. 29 files successfully moved, reducing always-in-context tokens from 7,225 to 4,375. When moving files to reference/, add `[[path]]` cross-references in remaining system/ files for progressive disclosure. Use `/doctor` to audit memory structure. An earlier "abandoned" conclusion was wrong — the failure was caused by the agent itself getting confused and "restoring" files, not the Letta server.
- **Archival memory** — long-term searchable (meeting notes, historical patterns, insights) — secondary to MemFS
- Never let memory blocks get compacted due to size limits — use `memory_update_size`
- **Before sharing "current" work status**: Search conversation history first — the "Current focus areas" in memory can be stale

### Letta Code Credit Consumption (July 27, 2026)
- **Letta Code (v0.28.12) creates hidden ephemeral subagents** that consume credits independently
- These subagents show up on the usage page with unique agent IDs but do NOT appear in the default project agent list
- Only — named "code" agents found via API: `letta-code-agent` (Michael's, Dec 2025), `Letta Code (Laura)` (March 2026), `code-sandbox` (April 2026)
- **518 total agents** on the account, all under one Default Project (as of July 27, 2026)
- The API does NOT expose billing/usage endpoints (returned 404s) — credit consumption data is only visible in the Letta dashboard/usage page
- **Fix for unwanted credit drain**: Run `/sleeptime` in the Letta Code desktop app to stop automatic reflection subagents from spawning
- Laura confirmed this info via Ezra on the Letta Discord (July 27, 2026)

### Drops Architecture v2 (July 29, 2026)
- **Founder agent owns FULL drop lifecycle**: create artifact, store to GitHub, schedule delivery via Letta API, personalized delivery message, Discord notification
- **Drop Agent role**: Receives transcript insights, routes/packages, dispatches to DROPS conversation, fires Discord notification #1 (blue embed). Does NOT schedule delivery.
- **Schedule API limitation**: Fires in DEFAULT conversation only. Cannot target specific conversations (confirmed platform limitation, July 29, 2026).
- **`send_system_message`**: Has optional `conversation_id` parameter (added July 29, 2026), but NOT respected by the platform.
- **Drops are NOT tidbits**: Each drop gets — unique format. Always schedule, never deliver immediately.
- **Live URL pattern**: `https://golaunchmate.github.io/drops/{cohort}/{user}/{drop-type}-{YYYY-MM-DD}.html`
