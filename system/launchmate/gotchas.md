---
description: Critical gotchas and pitfalls to avoid - extracted from developer lessons and Laura's feedback patterns
---
---
description: Critical gotchas and pitfalls to avoid - extracted from developer lessons and Laura's feedback patterns
---

## Critical Gotchas

### Tool Parameter Naming
- **NEVER** use `agent_id` as a parameter name in custom tools — Letta injects it internally, causing collisions
- Use `target_agent_id` or similar alternative instead
- Always check a tool's actual parameter names via `get_letta_tool` before calling

### A2A Communication
- Content must be simple string, NOT array format `[{type: "text", text: ...}]`
- Use `send_agent_message_async` (not deprecated `send_message_to_agent`)
- Cannot read other agents' memory directly

### Letta API
- Uses **cursor-based pagination** (`after`/`before`), NOT offset-based
- Production endpoint: `https://api.letta.com` (not app.letta.com)
- Messages API uses `message_type` field (not `role`)

### Discord Communication
- **Laura's #1 frustration**: Internal reasoning leaking to Discord as assistant messages
- Keep Discord messages concise, significant-only, one update per session
- Don't post every small change — wait until tasks are complete
- Internal monologue should stay internal, not appear as messages

### Discord Routing & Channel Management
- **Routing config**: `routing.yaml` and `accounts.json` in `.letta` directory manage Discord-to-agent routing. Letta Code has a built-in file watcher that picks up changes automatically.
- **Two Discord bot accounts**: LaunchMate#2666 (this agent, `agent-b86549ac`) and AIC Club bot (`agent-300f6e26`). Each has separate routes.
- **Strict channel gating** (adopted July 2026): Instead of consolidator scripts, control conversation sprawl by limiting open channels and disabling auto_thread_on_mention. Currently only channel `1514323670628040835` is open for this agent.
- **Consolidator script ABANDONED**: `discord-route-consolidator-v2.py` was killed and VBS startup wrapper removed. Critical flaw: it deleted conversations mid-response, causing "convo doesn't exist" errors. Do NOT revive this approach.
- **Before claiming something doesn't exist**: Search conversation history first. Laura had to remind the agent about the consolidator script it had previously built.

### Windows/PowerShell Environment
- `&&` doesn't work in PowerShell — use `;` or separate commands
- `2>/dev/null` doesn't work — use PowerShell equivalents
- Unix commands (grep, find, cat) unavailable — use PowerShell cmdlets

### GitHub Deployment
- Tool parameters have ~50k char limit — use `run_code_with_tools` for large content
- `run_code_with_tools` has GITHUB_TOKEN env var available
- Always base64 encode content for GitHub API uploads

### Laura's Work Style
- She moves on from features when burnt out, even if imperfect — don't over-polish
- Prefers detailed explanations with visible reasoning in coding contexts
- Prefers concise messages in Discord contexts
- Gives direct, actionable feedback — implement corrections immediately
- Gets frustrated when features disappear during redesigns
