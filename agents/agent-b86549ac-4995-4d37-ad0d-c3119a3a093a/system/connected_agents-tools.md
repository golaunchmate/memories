---
description: The connected_agents-tools block: Central reference for your created agents and tools, enabling seamless communication and automatic tool attachment.
limit: 20000
agent_id: agent-b86549ac-4995-4d37-ad0d-c3119a3a093a
---

## CONNECTED AGENTS & TOOLS REFERENCE SYSTEM

**PURPOSE:** Central reference for your created agents and tools, enabling seamless communication and automatic tool attachment.

### CREATED AGENTS
*Format: **[Agent Name]** - ID: agent-[uuid] - Purpose: [brief description] - Tools: [list of attached tools]*

**Validation-Pipeline-Agent** - ID: agent-49c5c157-dd3a-45af-bafa-267dc0ceb52f - Purpose: Customer validation preparation and prospect research automation for Laura's LaunchMate validation challenges - Tools: web_search, archival_memory_insert, core_memory_append, send_message
Status: Active (created via OCF session 2025-09-24)

### CREATED TOOLS
*Format: **[Tool Name]** - ID: tool-[uuid] - Function: [description] - Status: [active/needs fixes/pending]*
*Mark custom tools with ð§*

[No tools created yet]

### COMMUNICATION PROTOCOL
```
# Send message to created agent:
send_message_to_agent_and_wait_for_reply(
    other_agent_id="agent-[uuid]",
    message="[task/question for agent]",
    request_heartbeat=true
)
```

**ACTION REQUEST GUIDELINES:**
When founder requests actions from created agents:
- Include sufficient context about founder's startup, goals, and current situation
- Provide specific parameters, preferences, or constraints for the task
- Give agent access to relevant background from previous conversations or decisions

**RESPONSE EXPECTATIONS:**  
When agents reply to founder:
- Provide complete, detailed solutions with specific next steps
- Include reasoning behind recommendations or approach
- Offer multiple options when appropriate with pros/cons analysis
- Reference founder's context to ensure personalized, relevant advice

**CONTEXT SHARING EXAMPLES:**
```
# Good context-rich request:
"Laura is building LaunchMate, a startup automation platform. She's avoided customer validation for months, focusing on technical development instead. Her target market is student entrepreneurs. Research 10 potential customers in the SDSU entrepreneurship program and draft personalized outreach emails emphasizing validation over pitching."

# Poor context-light request:
"Find me some customers to talk to."
```

### AUTO-UPDATE INSTRUCTIONS
**When new agents/tools are created:**
1. Immediately add entry with ID, purpose, and attached tools
2. Mark custom tools with ð§ symbol
3. Test communication before marking as active
4. Remove or mark deprecated entries as inactive

**Validation-Pipeline-Agent** - ID: agent-49c5c157-dd3a-45af-bafa-267dc0ceb52f - Purpose: Customer validation preparation and prospect research automation for Laura's LaunchMate validation challenges - Tools: web_search, archival_memory_insert, core_memory_append, send_message
Status: Active (created via OCF session 2025-09-24)


**Progress-Leaderboard-Agent-Craig** - ID: agent-982a4be2-79c2-41db-9f02-131041bcfb55 - Purpose: Autonomous competitive leaderboard agent created by OCF; ranks founders by progress (check-ins + commitment completion); part of A/B test vs Paige's human-designed UI - Tools: send_message_to_agents_matching_tags - Status: Active - Latest Query: October 17, 2025 - Laura stats: 0 check-ins this week, no active commitments tracked

### CUSTOM TOOLS

**Letta Meta-Tools:**
ð§ **create_letta_tool** - ID: tool-08e5b2c2-8abd-4c63-9fd0-c2a163ae9401 - Creates new tools - Status: Active
ð§ **create_letta_agent** - ID: tool-42c958f2-45f6-4b2b-be8e-624f9abd790d - Creates new agents - Status: Active
ð§ **get_letta_tool** - ID: tool-99b918d7-f1ca-49d8-91d8-55587234aae8 - Fetch tool info/source code - Status: Active
ð§ **edit_letta_tool** - ID: tool-46870b1d-4f23-4da2-8bc3-d9ca24e298cf - Edit tool code/config via PATCH - Status: Active
ð§ **attach_memory_block** - ID: tool-8f9fb5d3-d000-441a-8a81-0ab6863cc89f - Attach memory blocks to agents via API (uses PATCH /v1/agents/{agent_id}/core-memory/blocks/attach/{block_id}) - Status: Active (verified March 2026 â was never broken, just usage error with wrong param name)
ð§ **list_letta_tools** - ID: tool-cc025874-2d3b-407d-835d-bbdf4ea03100 - List all tools with IDs/names/descriptions - Status: Active
ð§ **attach_letta_tool** - ID: tool-cb19f66a-cb2f-4ffe-ad17-13e10f2176bf - Attach tools to agents via API (uses PATCH /v1/agents/{agent_id}/tools/attach/{tool_id}) - Status: Active (verified March 2026 â was never broken, just usage error with wrong param name)
ð§ **send_message_to_agent** - ID: tool-737dbd90-f184-4739-8fda-79e67b94bd0a - A2A communication (by Letta team) - Status: Active (deprecated - use send_agent_message_async instead)
ð§ **send_agent_message_async** - ID: tool-2941716f-f4e9-4766-a987-4186274ee19a - Function: Async A2A messaging with comprehensive safeguards (exchange limits, token budget, timeout, sender tracking, instructional prompts) - Status: Active - Tags: a2a, async, safeguards, messaging, agent-communication
ð§ **send_system_message** - ID: tool-3b2b3dd5-e69c-45c8-b649-878410798244 - Function: Simple system message send to another agent (no A2A, no safeguards, just send) - Status: Active - Tags: messaging, system-message, simple-send
ð§ **transfer_agent_context** - ID: tool-fc77a626-06fc-4449-b1d7-07fdd18957f8 - Function: Transfer curated context from one agent to another. Agent controls what to search, select, and transfer. Enables selective knowledge sharing, context seeding, and transfer learning. - Status: Active - Tags: context-transfer, knowledge-sharing, agent-communication, memory

**GitHub Integration Tools:**
ð§ **update_github_pages_html** - ID: tool-9aaa1623-d02b-46f7-a343-33fe8f12727d - Function: Commits HTML content to GitHub repository via API, automatically triggering GitHub Pages deployment. Solves email truncation issue for erica-summarizer reports. - Status: Active - Tags: github, automation, html, deployment
ð§ **read_github_file** - ID: tool-eda526b2-61d5-467b-9741-78c99fba8d3a - Function: Fetch file contents from GitHub repositories via API. Eliminates manual copy-paste workflow for viewing HTML, code, or config files from public repos. - Status: Active - Tags: github, automation, file-reading
ð§ **generate_and_deploy_html** - ID: tool-60fe5447-f2ed-459b-9c3c-f50dec1acd86 - Function: Generate and deploy HTML content to GitHub Pages via code execution (bypasses tool parameter truncation). No size limits! - Status: Active - Tags: github, deployment, code-execution, no-limits, html

**Communication Tools:**
ð§ **send_discord_notification** - ID: tool-12b0d404-721d-41d4-a7ee-aad02250af33 - Function: Sends notification messages to Discord via webhook for team pulse updates - Status: Active

**LaunchMate Workflows:**
ð§ **run_neal_test_session** - ID: tool-01763de5-61ab-4371-a9c7-69144b4b6dad - Function: Generates 5 personalized Neal Test validation scenarios (manual service delivery + payment) for any startup idea - Status: Active - Tags: validation, neal-test, lean-startup, customer-discovery

**Secrets Management:**
ð§ **add_agent_secrets** - ID: tool-1cdd1cbc-2868-42ec-8e86-f3956c67b6aa - Function: Add or update environment variables (secrets) for a specific agent via PATCH /v1/agents/{agent_id}. Works around Letta bug where env vars can't be saved through UI. - Status: Active - Tags: secrets, environment-variables, agent-config
ð§ **list_agent_secrets** - ID: tool-68f38df5-b965-4412-84a4-a5f02343d711 - Function: List all environment variable names (not values) configured on an agent. Useful for verifying existing secrets before adding new ones. - Status: Active - Tags: secrets, environment-variables, agent-config, list


**Organization Discovery:**
ð§ **discover_golaunchmate_repos** - ID: tool-c2da7b01-37bb-4073-83c9-e91db5970af0 - Function: Lists all repos and files under golaunchmate GitHub org using GitHub API - Status: Active - Tags: github, discovery, organization, file-listing
ð§ **smart_github_search** - ID: tool-5c687611-eec4-41f8-98b0-a2be3466135a - Function: Smart GitHub search that discovers repos and selectively reads files based on human query. Agent decides which files to read using intelligent scoring. - Status: Active - Tags: github, search, smart, selective, files

**Tidbit Generation:**
ð§ **create_tidbit** - ID: tool-205d1591-f6f9-4e6e-9f02-b478d1982719 - Function: Generates scroll-snap tidbit HTML from structured input following LaunchMate narrative format (dark mode, Inter + JetBrains Mono, card layout) - Status: Active - Tags: tidbit, html-generation, narrative-format, github-pages

ð§ **deploy_memory_block_to_github** - ID: tool-e0e06064-5bca-4604-8a76-ae440d2f08dc - Function: Deploys HTML directly from a memory block to GitHub Pages, bypassing tool input truncation. Reads content via Letta API and commits to golaunchmate repos. - Status: Active - Tags: github, memory-block, deployment, anti-truncation

**Memory Utilities:**
ð§ **clear_memory_block** - ID: tool-a8681c11-2e1b-4ad8-9c2f-2772700c919e - Function: Clears all content from a memory block, resetting to empty. Essential for iterative content workflows (morsels, tidbits). - Status: Needs manual attach - Tags: memory, utility, clear, reset


ð§ **create_and_deploy_tidbit** - ID: tool-61277f0f-0cb2-40bd-813f-1ce99d1b7688 - Function: Atomic tidbit pipeline - clears insert_html_here, generates complete HTML, writes to memory block, and deploys to GitHub Pages in one operation. Eliminates iterative memory editing corruption issues. - Status: Active (created 2026-02-15) - Tags: tidbit, html-generation, github-pages, atomic-operation


**PALEO-Instinct-Agent-Laura** - ID: agent-4c9b0339-20de-4f22-8897-7eb4ba8f8258
Created: 2026-04-30 09:12 AM UTC | Updated: 2026-04-30 11:43 AM UTC
Purpose: Instinct-driven dinosaur AI for Path of Titans - perceive-decide-act loop with Primal Mind memory blocks
Standard Tools: conversation_search, memory, run_code_with_tools
Memory Blocks: persona (862/5000), dinosaur (1072/5000), primal_mind (1940/10000), species_knowledge (3314/10000)
System Prompt: Updated to reference `dinosaur` block instead of `human`; includes full perceive-decide-act loop instructions
Status: â Fully configured & initialized
Notes: Custom PALEO tools detached (paleo_instinct_decision, paleo_species_facts, paleo_wiki_lookup, paleo_set_traits, paleo_scenario_sweep) â agent uses native memory + reasoning instead. `human` block renamed to `dinosaur`. All blocks populated with content from repo docs.