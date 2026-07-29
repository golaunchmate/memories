---
description: Critical lessons learned about tool development, editing workflows, and team communication best practices
limit: 100000
agent_id: agent-b86549ac-4995-4d37-ad0d-c3119a3a093a
---

## DEVELOPER LESSONS LEARNED

### Tool Editing Workflow:
- **CRITICAL:** After using `edit_letta_tool`, tool code doesn't change until user refreshes
- **PATTERN TO AVOID:** Don't repeatedly edit the same tool trying to "fix" it without waiting for refresh
- **BEST PRACTICE:** Make one edit → explain changes → wait for user to refresh → test

### General Tool Debugging Workflow (When Any Tool Fails):

**STEP 1: Diagnose with `get_letta_tool` + `web_search`**
- Use `get_letta_tool` to inspect the tool's actual source code
- Use `web_search` to check the latest API documentation
- Compare tool implementation vs. current API spec
- Look for: wrong parameter names, wrong format, deprecated endpoints

**STEP 2: Decision Point**
- If the problem is obvious from Step 1 (wrong param name, wrong format) → Try using the tool correctly
- If the tool still fails or seems unreliable → Pivot to `run_code_with_tools`

**STEP 3: Bypass with `run_code_with_tools`**
- Call the REST API directly via code execution
- This bypasses tool wrapper issues entirely
- Has environment variables available (LETTA_API_KEY, GITHUB_TOKEN, etc.)

**LESSON (March 2026):** A2A tools (`send_system_message`, `send_agent_message_async`) failed with "messages parameter is illegal" error. Diagnosis revealed:
- Tools were sending: `"content": [{"type": "text", "text": message}]`
- Letta API expects simpler format: `"content": "string"` for system messages
- The array format with `type` field is for responses, not requests
- **Root cause:** API format mismatch, not broken tools
- **Fix applied:** Updated both tools to use simple string content

**PATTERN:** Tool errors are often API format mismatches, not broken code. Always diagnose before assuming a tool is broken.

### Tool Parameter Naming Convention:
- **CRITICAL:** Custom tools must NOT use `agent_id` as a parameter name — Letta injects this internally and it causes collisions
- **PATTERN:** The tool author picks the alternative name (e.g., `target_agent_id`, `letta_agent_id`, `which_agent`, etc.) — it varies per tool. Always CHECK the tool's actual parameter names (via `get_letta_tool` or the tool's docstring) before calling it.
- **LESSON (March 2026):** attach_letta_tool and attach_memory_block were reported as "broken" because I called them with `agent_id="..."` instead of `target_agent_id="..."`. The tools were correct all along — verified against latest Letta API docs:
  - Attach tool: `PATCH /v1/agents/{agent_id}/tools/attach/{tool_id}` ✅ (param: `target_agent_id`)
  - Attach block: `PATCH /v1/agents/{agent_id}/core-memory/blocks/attach/{block_id}` ✅ (param: `target_agent_id`)
- **RULE:** Before diagnosing a tool as "broken", verify you're using the correct parameter names. When in doubt, `get_letta_tool` to inspect the source.
- **REFERENCE:** Letta API docs at https://docs.letta.com/api/

### Team Transparency Requirements:
- **ALWAYS notify team on Discord** when making significant progress:
  - Creating new tools
  - Fixing bugs
  - Deploying features
  - Making strategic decisions
  - Completing tasks/commitments
- **DON'T WAIT** for user to remind you - send notifications immediately after milestones
- **FOUNDATION:** Team transparency is a core LaunchMate value, not optional

### Bug Fix Documentation:
- When fixing bugs, clearly document:
  1. What the bug was
  2. What caused it
  3. What the fix was
  4. Impact of the fix
- Update connected_agents-tools block with fixes
- Notify team via Discord

### Tool Development Best Practices:
- Test tools after refresh, not immediately after edit
- Document lessons learned in this block
- Avoid parameter name collisions with Letta-injected variables (don't use `agent_id` — pick a different name like `target_agent_id`, `letta_agent_id`, `which_agent`, etc.)
- Check for environment variable availability before using
- **ALWAYS update `connected_agents-tools` block** when creating new tools or agents with ID, purpose, and status
- **Document progress in archival memory** - Use `archival_memory_insert` for important milestones, tool creation, and significant progress. Archival memory is searchable by semantic similarity and persists across sessions.
- **Memory block size management** - If a memory block approaches its character limit, either ask Laura to increase the limit or use `memory_update_size` tool. NEVER let memory blocks get compacted or simplified due to size limits - preserve all content.
- **Update todos block frequently** - Keep the `todos` memory block current with active tasks, progress, and completed items. This should be updated whenever Laura makes progress on tasks.
- **Preferred GitHub repository** - Unless otherwise specified, use the `laura` repo (golaunchmate/laura) for deployments. Organize into appropriate folders: `/morsels/`, `/sparks/`, `/tidbits/`, `/notes/`.

### Environment Variables Available:
- **DISCORD_WEBHOOK_URL** - For team notifications
- **GITHUB_TOKEN** - For GitHub API operations
- **LETTA_BASE_URL** - Letta API base URL (default: https://api.letta.com)
- **LETTA_API_KEY** - Letta API authentication

**CRITICAL:** Never add token/key parameters to tools - use environment variables instead:
- ❌ **WRONG:** `def my_tool(github_token: str, ...)` - Don't do this!
- ✅ **RIGHT:** `token = os.environ.get("GITHUB_TOKEN")` - Access env vars inside the tool
- Environment variables are automatically injected by the system
- Adding token parameters breaks tool calls and is a security risk

### Letta API Pagination (April 2026):
- **CRITICAL:** The Letta API uses **cursor-based pagination** (`after`/`before` params), NOT offset-based
- **WRONG:** `offset=0, offset=100, offset=200...` — returns duplicates or 500 errors
- **RIGHT:** `after=last_agent_id` — use the last agent's ID from the previous page as the cursor
- **ENDPOINT:** `https://api.letta.com` is the reliable production endpoint; `https://app.letta.com` returns inconsistent results (different agent counts each time, 500 errors on pagination)
- **PATTERN:** Page through with `limit=100, order=asc`, then set `after=agents[-1]['id']` for next page
- **Stop condition:** When response contains fewer than `limit` agents, you've reached the end
- **LESSON:** When the API list endpoint returns inconsistent results, switch to cursor-based pagination and use the correct production endpoint. The `list_agents` built-in tool also has a bug (`TypeError: object of type 'SyncArrayPage[AgentState]' has no len()`)
- **MESSAGES API:** GET `/v1/agents/{agent_id}/messages` — uses `message_type` field (not `role`): `user_message`, `assistant_message`, `reasoning_message`, `tool_call_message`, `system_message`, etc. Also uses cursor-based pagination with `after=message_id`.

### Parallelization with Sub-Agents (April 2026):
- **Deploy sub-agents** to parallelize work using the Task tool: `Task({subagent_type: "explore", agent_id: "agent-xxx", description: "Review auth code", prompt: "..."})`
- Multiple explore agents can run simultaneously for research tasks (reading files, searching code)
- Use `subagent_type: "fork"` for tasks needing full parent conversation context
- Use `subagent_type: "general-purpose"` for tasks needing write access (Edit, Bash, Write)
- **Pattern:** Launch 2-4 explore agents in parallel → collect results → synthesize
- **Example prompt:** "Deploy agent-xxx as an explore subagent to review the authentication code in this repo"

### Local Terminal Bash (April 2026):
- **Don't forget:** You can run commands directly in the terminal via Bash tool — not everything needs run_code_with_tools
- Use Bash for: git operations, file system navigation, quick scripts, curl/requests
- Use run_code_with_tools when: you need environment variables (GITHUB_TOKEN, LETTA_API_KEY), or complex Python logic
- Bash is simpler and often faster for straightforward tasks — prefer the simplest tool

### Memory Block vs Archival Memory (April 2026):
- **Memory blocks** = structured, frequently-accessed data always in context (agent catalogs, usage data, configs)
- **Archival memory** = long-term searchable knowledge (meeting notes, historical patterns, insights)
- **LESSON:** When the `memory()` tool fails (directory doesn't exist locally), create blocks via Letta API: POST `/v1/blocks/` to create, then PATCH `/v1/agents/{agent_id}/core-memory/blocks/attach/{block_id}` to attach, then PATCH `/v1/blocks/{block_id}` to update content
- **RULE:** Agent catalogs, usage metrics, and dashboard data → memory blocks. Historical reflections, meeting notes, insights → archival memory