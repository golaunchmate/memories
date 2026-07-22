---
id: passage-89f139fd-cab0-4b23-8fd3-32a9b6f207b6
created_at: 2026-03-04T20:46:53.645536Z
tags: [context-transfer, agent-communication, tool]
---

## Context Transfer Tool (tool-fc77a626-06fc-4449-b1d7-07fdd18957f8)

**Purpose:** Transfer curated context from one agent to another - agent controls what to search, select, and transfer.

**Key Features:**
- Mandatory archival search with specific query (agent chooses what's relevant)
- Optional core block transfer (explicit opt-in, selective blocks)
- Optional recall history transfer (recent conversation context)
- Source labeling (marks everything as "IMPORTED FROM agent-X")
- Size validation (checks char limits before transfer)
- Overwrite protection (requires explicit overwrite=True)

**Use Cases:**
- Clone specific context between agents
- Transfer learning (share knowledge)
- Context seeding (populate new agents)
- Knowledge sharing (selective transfer)

**Parameters:**
- source_agent_id: Pull context FROM this agent
- target_agent_id: Push context TO this agent
- query: REQUIRED - be specific about what context you want (e.g., "customer validation techniques")
- include_core: Optional - transfer core memory blocks
- core_blocks: Optional - which specific blocks (e.g., ["persona", "validation_knowledge"])
- include_recall: Optional - include recent conversation history
- recall_days: How many days of history (default: 7)
- overwrite: Whether to overwrite existing blocks (default: False)

**Example Usage:**
```python
# Transfer validation knowledge
transfer_agent_context(
    source_agent_id="agent-mentor-123",
    target_agent_id="agent-founder-456",
    query="Neal Test methodology and customer validation techniques",
    include_core=True,
    core_blocks=["validation_patterns"],
    overwrite=False
)
```