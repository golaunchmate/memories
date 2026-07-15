---
description: Active to-dos, current tasks, and things currently working on
limit: 100000
agent_id: agent-b86549ac-4995-4d37-ad0d-c3119a3a093a
---

## ACTIVE TODOS & CURRENT WORK

**Purpose:** Track current tasks and progress. Should be updated frequently as Laura makes progress.

---

### 🎯 CURRENT ACTIVE TASKS:

**1. Prototype Code Execution Upload Workflow**
- **Goal:** Test code-based GitHub upload to bypass tool parameter truncation
- **Status:** ✅ COMPLETED - SUCCESS!
- **Why:** Tool parameters have size limits; code execution doesn't
- **Approach:** Use `run_code_with_tools` + GitHub API (has env vars!)
- **Started:** March 12, 2026
- **Completed:** March 12, 2026
- **Result:** Successfully uploaded test file: https://golaunchmate.github.io/tidbits/inflight-spring-26/test/code-execution-test.html

**2. Fix attach_letta_tool and audit other tools**
- **Goal:** Fix attach_letta_tool parameter issues and check all tools for similar problems
- **Status:** ✅ RESOLVED - Tools were never broken!
- **Finding:** Both attach_letta_tool and attach_memory_block are correct. The error was a USAGE problem — I called them with `agent_id` instead of `target_agent_id`. Verified against latest Letta API docs (March 2026). Updated developer_lessons and connected_agents-tools with the lesson.
- **Resolved:** March 23, 2026

**3. Delete flawed generate_and_deploy_html tool**
- **Goal:** Remove the tool that has html_content parameter (same truncation issue)
- **Status:** Pending
- **Why:** Tool wrapper doesn't solve the problem - workflow does
- **Alternative:** Use run_code_with_tools directly

---

### 📋 BACKLOG:

*(No items yet)*

---

### ✅ RECENTLY COMPLETED:

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

### IMMEDIATE NEXT STEPS:
1. Create + set up Drop Agent using system prompts
2. Create drops repo with proper structure
3. Mock up sample drops in repo (no full logic yet)
4. Set up memory tracking for project

### LETTA CODE EXPLORATION GOAL:
- Use Letta Code for this task
- Explore transfer agent context + agent communication
- Potentially use founder as Letta Code agent or other integration patterns
