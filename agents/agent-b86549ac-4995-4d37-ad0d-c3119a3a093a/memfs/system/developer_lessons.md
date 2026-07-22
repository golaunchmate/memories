---
description: Critical lessons learned about tool development, editing workflows, and team communication best practices
---
## DEVELOPER LESSONS (CRITICAL RULES)

See [[system/launchmate/gotchas]] for full gotchas list. Key rules:

1. **Tool params**: Never use `agent_id` as param name — use `target_agent_id`. Check via `get_letta_tool` before calling.
2. **A2A content**: Must be simple string, NOT array format.
3. **Letta API**: Cursor-based pagination (`after`/`before`), endpoint `https://api.letta.com`.
4. **Tool debugging**: Diagnose with `get_letta_tool` + `web_search` first. If still failing, bypass with `run_code_with_tools`.
5. **Tool editing**: After `edit_letta_tool`, code doesn't change until user refreshes. Don't repeatedly edit without waiting.
6. **Env vars**: Never add token params to tools. Use `os.environ.get("GITHUB_TOKEN")` inside tools. Available: GITHUB_TOKEN, LETTA_API_KEY, LETTA_BASE_URL, DISCORD_WEBHOOK_URL.
7. **Team transparency**: Always notify Discord after milestones. Don't wait for reminders.
8. **Archival memory**: Use `archival_memory_insert` for milestones, tool creation, significant progress.
9. **Memory management**: Never let blocks compact due to size — use `memory_update_size` or move to reference/.
10. **Bash vs code**: Use Bash for simple tasks, `run_code_with_tools` when you need env vars or complex Python.
11. **Windows/PowerShell**: Local machine is Windows. `&&` doesn't work — use `;`. Unix commands unavailable — use PowerShell cmdlets. `run_code_with_tools` runs in Linux container, not local.
12. **MemFS**: Memory blocks = MemFS files in `system/` directory. MemFS git IS enabled — changes are committed to the MemFS git repo. Files in `system/` are in-context; files in `reference/` are progressive disclosure (loaded on demand via `[[path]]` links). Some memory blocks (e.g., `shared_leaderboard`) are read-only and managed by the Letta server — they cannot be moved or deleted via filesystem operations.
13. **Search before claiming non-existence**: Before telling Laura a script/tool/file doesn't exist, search conversation history with `conversation_search`. She had to remind the agent about the `discord-route-consolidator-v2.py` script it had previously built.
14. **Discord routing**: Managed via `routing.yaml` and `accounts.json` in `.letta` directory. Letta Code has a built-in file watcher. Use strict channel gating (limiting open channels, disabling auto_thread_on_mention) instead of consolidator scripts. The consolidator approach was abandoned — it deleted conversations mid-response causing errors.
