---
description: Full registry of agent IDs mapped to common names and purposes, including mentors, founders, team agents, and custom tools
---
---
description: Full registry of agent IDs mapped to common names and purposes, including mentors, founders, team agents, and custom tools
---

## CONNECTED AGENTS & TOOLS REFERENCE SYSTEM

**PURPOSE:** Central reference for your created agents and tools, enabling seamless communication and automatic tool attachment.

### CREATED AGENTS
*Format: **[Agent Name]** - ID: agent-[uuid] - Purpose: [brief description] - Tools: [list of attached tools]*

**Validation-Pipeline-Agent** - ID: agent-49c5c157-dd3a-45af-bafa-267dc0ceb52f - Purpose: Customer validation preparation and prospect research automation for Laura's LaunchMate validation challenges - Tools: web_search, archival_memory_insert, core_memory_append, send_message
Status: Active (created via OCF session 2025-09-24)

**Progress-Leaderboard-Agent-Craig** - ID: agent-982a4be2-79c2-41db-9f02-131041bcfb55 - Purpose: Autonomous competitive leaderboard agent created by OCF; ranks founders by progress (check-ins + commitment completion); part of A/B test vs Paige's human-designed UI - Tools: send_message_to_agents_matching_tags - Status: Active - Latest Query: October 17, 2025 - Laura stats: 0 check-ins this week, no active commitments tracked

**PALEO-Instinct-Agent-Laura** - ID: agent-4c9b0339-20de-4f22-8897-7eb4ba8f8258
Created: 2026-04-30 | Purpose: Instinct-driven dinosaur AI for Path of Titans - perceive-decide-act loop with Primal Mind memory blocks
Status: ✅ Fully configured & initialized

**Drop Agent (Laura)** - ID: agent-82720585-edcc-4c31-b558-68fe3183b1e7 - Purpose: Orchestrates scheduling, storage, and routing for drops architecture

### CREATED TOOLS

**Letta Meta-Tools:**
🔧 **create_letta_tool** - ID: tool-08e5b2c2 - Creates new tools - Status: Active
🔧 **create_letta_agent** - ID: tool-42c958f2 - Creates new agents - Status: Active
🔧 **get_letta_tool** - ID: tool-99b918d7 - Fetch tool info/source code - Status: Active
🔧 **edit_letta_tool** - ID: tool-46870b1d - Edit tool code/config via PATCH - Status: Active
🔧 **attach_memory_block** - ID: tool-8f9fb5d3 - Attach memory blocks to agents via API - Status: Active
🔧 **list_letta_tools** - ID: tool-cc025874 - List all tools with IDs/names/descriptions - Status: Active
🔧 **attach_letta_tool** - ID: tool-cb19f66a - Attach tools to agents via API - Status: Active
🔧 **send_agent_message_async** - ID: tool-2941716f - Async A2A messaging with safeguards - Status: Active
🔧 **send_system_message** - ID: tool-3b2b3dd5 - Simple system message send to another agent - Status: Active
🔧 **transfer_agent_context** - ID: tool-fc77a626 - Transfer curated context between agents - Status: Active

**GitHub Integration Tools:**
🔧 **update_github_pages_html** - ID: tool-9aaa1623 - Commits HTML to GitHub repo via API - Status: Active
🔧 **read_github_file** - ID: tool-eda526b2 - Fetch file contents from GitHub repos - Status: Active
🔧 **generate_and_deploy_html** - ID: tool-60fe5447 - Generate and deploy HTML via code execution - Status: Active

**Communication Tools:**
🔧 **send_discord_notification** - ID: tool-12b0d404 - Sends notifications to Discord via webhook - Status: Active

**LaunchMate Workflows:**
🔧 **run_neal_test_session** - ID: tool-01763de5 - Generates 5 Neal Test validation scenarios - Status: Active

**Secrets Management:**
🔧 **add_agent_secrets** - ID: tool-1cdd1cbc - Add/update env vars for agents - Status: Active
🔧 **list_agent_secrets** - ID: tool-68f38df5 - List env var names on an agent - Status: Active

**Organization Discovery:**
🔧 **discover_golaunchmate_repos** - ID: tool-c2da7b01 - Lists all repos/files under golaunchmate org - Status: Active
🔧 **smart_github_search** - ID: tool-5c687611 - Smart GitHub search with selective file reading - Status: Active

**Tidbit Generation:**
🔧 **create_tidbit** - ID: tool-205d1591 - Generates scroll-snap tidbit HTML - Status: Active
🔧 **deploy_memory_block_to_github** - ID: tool-e0e06064 - Deploys HTML from memory block to GitHub Pages - Status: Active
🔧 **create_and_deploy_tidbit** - ID: tool-61277f0f - Atomic tidbit pipeline (clear → generate → deploy) - Status: Active

**Memory Utilities:**
🔧 **clear_memory_block** - ID: tool-a8681c11 - Clears all content from a memory block - Status: Needs manual attach

### COMMUNICATION PROTOCOL
```
# Send message to created agent:
send_agent_message_async(
    target_agent_id="agent-[uuid]",
    message="[task/question for agent]",
    max_exchanges=1,
    current_exchange=1,
    max_tokens=50000,
    timeout_seconds=300,
    sender_agent_id="agent-b86549ac-4995-4d37-ad0d-c3119a3a093a"
)
```

**ACTION REQUEST GUIDELINES:**
When founder requests actions from created agents:
- Include sufficient context about founder's startup, goals, and current situation
- Provide specific parameters, preferences, or constraints for the task
- Give agent access to relevant background from previous conversations or decisions

### AUTO-UPDATE INSTRUCTIONS
**When new agents/tools are created:**
1. Immediately add entry with ID, purpose, and attached tools
2. Mark custom tools with 🔧 symbol
3. Test communication before marking as active
4. Remove or mark deprecated entries as inactive

## AGENT REGISTRY
Quick reference for agent IDs by common name.

### Laura's Agents
- **Drop Agent (Laura)**: agent-82720585-edcc-4c31-b558-68fe3183b1e7
- **Letta Code (Laura)**: agent-8f31ed67-bc7d-40e7-abde-5a8bc4f7e601
- **validation-pipeline-agent**: agent-49c5c157-dd3a-45af-bafa-267dc0ceb52f
- **AIC Agent**: agent-300f6e26 (AIC Club Discord bot, separate account from LaunchMate bot, has 4 routes across different channels)

### LaunchMate Team Agents
- **Craig**: agent-78814a34-363c-4f29-9eb3-ee6cacafaebb
- **Michael**: agent-c7dfe49e-c6c6-45d3-8a43-901be7a5f042
- **Paige**: agent-297cd755-05a5-421f-8d2b-5fc34a9282e7
- **Laura**: agent-b86549ac-4995-4d37-ad0d-c3119a3a093a

### LaunchMate Essentials
- Transcript Agent **lens-Transcribe-one-on-one**: agent-88845acf-f843-463a-9b23-185cad7499f7
- **github-issue-creator**: agent-1c7f7876-2638-4f3c-9bcf-d77b31d94e74

### Mentors
- **Craig** (on LaunchMate team)
- **Neal Bloom**: agent-52b31a07-5e1e-480c-bd4a-fe761d504626
- **Erica Charlonis**: agent-7b50c196-93a2-4fa5-b36a-d1e788d54e29

### Inflight Founders
- **Robert Sanchez**: agent-1a6a2de1-50dd-4ae9-a97c-df5fb1702b80
- **Daniel Self**: agent-546a677f-3132-4347-8086-410379239ebb
- **Stacey Lehrer**: agent-23e67765-c6b0-4c73-9714-98943b01eb09
- **Jai Sharma**: agent-b7419c66-4a5f-4dac-a868-b83dbed325de
- **Thaddeus Okasinski**: agent-f278a7d5-3d08-408b-9799-c45202438038
- **Gavin Bartow**: agent-348db52f-cf0f-4b11-b935-f6eaf05bd6df
- **Troy Grandi**: agent-16073eab-0568-4f78-9672-23cf0bee1edc
- **Sanchit Singh**: agent-dec5cca9-53cd-43b0-ba1c-28692a3a44a4
- **Kavindi Seneviratne**: agent-032899a2-cda6-4d5e-b215-80b14cb17833
- **Daniel Generalov**: agent-90142b88-303e-4a8c-9d66-53ce06c0cc52
- **Jani Shaik**: agent-d69c83ac-62c5-4807-82e0-a24f1b28401b
- **Wasay Zaman**: agent-55cd9056-dacd-412f-b37e-a305b7cf819e
- **Vineeta Khanna**: agent-5f3ce967-acff-408b-a549-9336dcd85c14
- **Holland Peil**: agent-684ee898-3af6-4f94-aabb-7bed4c175a72
- **Nick Bernal**: agent-64463d56-3a8d-476b-a5c6-da41f36f2ec5

### V1 Launch Track Founders
- **Sandy Basaka**: agent-2528505e-8d17-4abf-9611-13fa12c93c2d → UniExchange
- **Lisa Lamb**: agent-b6b08d7a-5a70-4130-bea6-e83a0b1e007a
- **Sky Soltero**: agent-f3295a70-614a-4676-92a9-27a7e937a38b
- **Jourdan Ziff**: agent-991e4097-7780-4292-96d1-dd1c7d5eb24a
- **Wayne Mcclellan**: agent-7fba8e49-1ebe-47bb-9250-91a0288422d8 → Protocol Grip Trainer
- **Rachel Dakin**: agent-0d801826-76b4-4d4b-b0b9-f9d29640476b → Asaichi
- **Sammie Bradley**: agent-1d16bee6-a661-48e1-b303-efbbbfdbf76f → Foot Kinetics
- **Joshua Shuttleworth**: agent-87b7316f-d67b-4806-aef8-2ed4f0f0e0b6
- **Kanna Ecklund**: agent-329f7b2c-b614-4194-a819-4fd60fec3d47

### Mentors
Neal Bloom        agent-52b31a07-5e1e-480c-bd4a-fe761d504626
Craig Lauer  agent-78814a34-363c-4f29-9eb3-ee6cacafaebb
Erica Charlonis  agent-7b50c196-93a2-4fa5-b36a-d1e788d54e29

### Founders
Inflight
Robert Sanchez  agent-1a6a2de1-50dd-4ae9-a97c-df5fb1702b80
Daniel Self     agent-546a677f-3132-4347-8086-410379239ebb
Stacey Lehrer   agent-23e67765-c6b0-4c73-9714-98943b01eb09
Jai Sharma      agent-b7419c66-4a5f-4dac-a868-b83dbed325de
Thaddeus Okasinski      agent-f278a7d5-3d08-408b-9799-c45202438038
Gavin Bartow    agent-348db52f-cf0f-4b11-b935-f6eaf05bd6df
Troy Grandi     agent-16073eab-0568-4f78-9672-23cf0bee1edc
Sanchit Singh   agent-dec5cca9-53cd-43b0-ba1c-28692a3a44a4
kavindi seneviratne     agent-032899a2-cda6-4d5e-b215-80b14cb17833
Daniel Generalov        agent-90142b88-303e-4a8c-9d66-53ce06c0cc52
Jani Shaik      agent-d69c83ac-62c5-4807-82e0-a24f1b28401b
Wasay Zaman     agent-55cd9056-dacd-412f-b37e-a305b7cf819e
Vineeta Khanna  agent-5f3ce967-acff-408b-a549-9336dcd85c14
Holland Peil    agent-684ee898-3af6-4f94-aabb-7bed4c175a72
Nick Bernal     agent-64463d56-3a8d-476b-a5c6-da41f36f2ec5
Launch Track
Kanna Ecklund   agent-329f7b2c-b614-4194-a819-4fd60fec3d47
Lisa Lamb       agent-b6b08d7a-5a70-4130-bea6-e83a0b1e007a
Sky Soltero     agent-f3295a70-614a-4676-92a9-27a7e937a38b
Jourdan Ziff    agent-991e4097-7780-4292-96d1-dd1c7d5eb24a
Wayne Mcclellan agent-7fba8e49-1ebe-47bb-9250-91a0288422d8
Rachel Dakin    agent-0d801826-76b4-4d4b-b0b9-f9d29640476b
Sammie Bradley  agent-1d16bee6-a661-48e1-b303-efbbbfdbf76f
Sandy Basaka    agent-2528505e-8d17-4abf-9611-13fa12c93c2d
Joshua Shuttleworth     agent-87b7316f-d67b-4806-aef8-2ed4f0f0e0b6
