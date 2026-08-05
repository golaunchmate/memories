---
description: Active to-dos, current tasks, and things currently working on
limit: 100000
agent_id: agent-b86549ac-4995-4d37-ad0d-c3119a3a093a
---

## ACTIVE TODOS & CURRENT WORK

**Purpose:** Track current tasks and progress. Should be updated frequently as Laura makes progress.

---

### ð¯ CURRENT ACTIVE TASKS:

**1. Prototype Code Execution Upload Workflow**
- **Goal:** Test code-based GitHub upload to bypass tool parameter truncation
- **Status:** â COMPLETED - SUCCESS!
- **Why:** Tool parameters have size limits; code execution doesn't
- **Approach:** Use `run_code_with_tools` + GitHub API (has env vars!)
- **Started:** March 12, 2026
- **Completed:** March 12, 2026
- **Result:** Successfully uploaded test file: https://golaunchmate.github.io/tidbits/inflight-spring-26/test/code-execution-test.html

**2. Fix attach_letta_tool and audit other tools**
- **Goal:** Fix attach_letta_tool parameter issues and check all tools for similar problems
- **Status:** â RESOLVED - Tools were never broken!
- **Finding:** Both attach_letta_tool and attach_memory_block are correct. The error was a USAGE problem â I called them with `agent_id` instead of `target_agent_id`. Verified against latest Letta API docs (March 2026). Updated developer_lessons and connected_agents-tools with the lesson.
- **Resolved:** March 23, 2026

**3. Memory Explorer Dashboard**
- **Goal:** Build a dynamic memory visualization dashboard for the memories repo
- **Status:** â COMPLETED
- **What was built:** A complete "Memory Explorer" dashboard at golaunchmate/memories/dashboard/index.html
  - Dynamic agent loading from GitHub API (any agent in the repo)
  - File tree navigation with hierarchical display
  - Markdown rendering of memory block content
  - Search across all blocks
  - Stats (blocks, total size, categories)
  - Copy to clipboard, GitHub link, raw link for each block
  - Dark theme with cyan/teal/purple accent palette
  - Responsive design
- **URL:** https://golaunchmate.github.io/memories/dashboard/
- **Also:** Enabled GitHub Pages for the golaunchmate/memories repo
- **Completed:** July 15, 2026

**4. Delete flawed generate_and_deploy_html tool**
- **Goal:** Remove the tool that has html_content parameter (same truncation issue)
- **Status:** Pending
- **Why:** Tool wrapper doesn't solve the problem - workflow does
- **Alternative:** Use run_code_with_tools directly

**4. Fix GitHub Actions "Update Dashboard" workflow in tidbits repo**
- **Goal:** Stop the consistent failures (runs #210-216 all failed)
- **Status:** PARTIALLY FIXED â script fixed, permissions issue remaining
- **What was wrong:** 
  1. â FIXED: `update-dashboard.ps1` had corrupted line 8 + hardcoded local path (`C:\Users\marga\OneDrive\...`)
  2. â¬ REMAINING: `git push` step fails with 403 â golaunchmate org has "write permissions for workflows" disabled
- **Fix applied:** Replaced hardcoded path with `$PSScriptRoot` dynamic resolution; script now works on GitHub Actions
- **What Laura needs to do:** 
  - Option A: Change org setting at GitHub â golaunchmate â Settings â Actions â General â Workflow permissions â "Read and write"
  - Option B: Create a PAT with `repo` scope, add as `PAT_TOKEN` secret in tidbits repo, update workflow to use it
- **Completed:** July 15, 2026

**5. Sync agent memory to GitHub memories repo**
- **Goal:** Back up Laura's main agent memory blocks to golaunchmate/memories repo
- **Status:** â COMPLETED
- **What was done:** 
  - Synced all 28 non-empty memory blocks from agent-b86549ac to GitHub
  - Created reusable `sync-agent-memory.ps1` script (parameterized by agent ID)
  - Created `agent.json` metadata file with block inventory
- **Repo:** https://github.com/golaunchmate/memories/tree/main/agents/agent-b86549ac-4995-4d37-ad0d-c3119a3a093a
- **Completed:** July 15, 2026

---

### ð BACKLOG:

*(No items yet)*

---

### â RECENTLY COMPLETED:

- **Developer lessons memory block** - Added best practices for tool editing, team transparency, archival memory usage, and memory block size management (March 12, 2026)
- **Archival memory documentation** - Started using archival memory for important milestones (March 12, 2026)
- **Qudsi success story** - Documented in Discord and archival memory (March 12, 2026)

---

**NOTE:** This block should be updated frequently when Laura makes progress!

## DROPS ARCHITECTURE PROJECT - April 29, 2026

### ARCHITECTURE OVERVIEW:
- **Surface Layer**: Transcript Agent (per-person conversation in LaunchMate tab)
- **Hidden Layer**: Drop Agent (orchestrates scheduling, storage, routing)
- **Storage**: Separate drops repo (similar naming conventions to tidbits)

### COMPONENTS TO BUILD:
1. **Transcript Agent** - Already exists, needs training to:
   - Spit back analysis to user
   - Send insights/takeaways to Drop Agent

2. **Drop Agent** - NEW:
   - Receive analysis from Transcript Agent
   - Look at involved agent IDs
   - Create drop scheduling
   - Store artifacts in drops repo

3. **Drops Repo** - NEW:
   - GitHub repo for storing artifacts
   - Same folder/naming conventions as tidbits
   - Any file type support

### KEY DECISIONS NEEDED:
- Is scheduling done via system prompt to founder agents OR can Drop Agent handle it directly?
- Who creates the asset, stores it in GitHub, and notifies user? (Founder agent vs Drop agent)
- How to train Transcript Agent about this architecture (memory block vs MemFS - unclear if Letta is deprecating blocks)

### DROPS v2 â July 29, 2026:
- [â] Architecture v2 finalized â founder agent owns full lifecycle
- [â] Drop Agent created and initialized (agent-82720585)
- [â] Multiple test drops delivered successfully
- [ ] Create drops repo with proper structure on GitHub
- [ ] Configure Transcript Agent to send data to Drop Agent
- [ ] Test full v2 lifecycle with real dispatch (end-to-end)
- [ ] Explore Chatter (Recall.ai) integration for meeting intelligence

### LETTA CODE EXPLORATION GOAL:
- Use Letta Code for this task
- Explore transfer agent context + agent communication
- Potentially use founder as Letta Code agent or other integration patterns
