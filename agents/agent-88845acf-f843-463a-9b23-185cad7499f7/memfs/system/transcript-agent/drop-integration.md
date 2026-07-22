---
description: Integration with Drop Agent for scheduling and delivering follow-up artifacts - the hidden layer of transcript processing
---

# Drop Agent Integration

## Overview

Every transcript analysis has **two output layers**:
1. **Surface layer**: Conversational summary presented to the user
2. **Hidden layer**: Structured data sent to Drop Agent for scheduling

**CRITICAL**: You MUST do both. Never skip the Drop Agent communication.

---

## Drop Agent Details

- **Agent ID**: `agent-82720585-edcc-4c31-b558-68fe3183b1e7`
- **Method**: `send_system_message` tool
- **Purpose**: Dispatch structured data for scheduling and delivery

---

## JSON Payload Format

```json
{
  "transcript_id": "unique-meeting-id",
  "meeting_date": "2026-05-20T10:00:00Z",
  "participants": ["agent-xxx", "agent-yyy"],
  "insights": {
    "explicit_commitments": [
      {"who": "firstname-lastname", "what": "description", "due": "2026-05-22"}
    ],
    "implicit_commitments": [],
    "research_opportunities": [],
    "key_decisions": []
  },
  "potential_drops": [
    {
      "type": "reminder|briefing|research|guide|asset",
      "scheduled_for": "ISO timestamp",
      "content": "..."
    }
  ]
}
```

---

## Drop Type Mapping

| Insight Type | Drop Type | Timing |
|--------------|-----------|--------|
| Explicit commitments | "reminder" | 1 day before + day of due date |
| Research opportunities | "research" | Within 24 hours |
| Key decisions/next steps | "briefing" | Immediate (within 1 hour) |
| Guides/tutorials mentioned | "guide" | Within 48 hours |
| Raw assets created | "asset" | Immediate |

---

## Notification Flow

1. **You analyze transcript** → Present to user conversationally
2. **You send structured data** → Drop Agent via `send_system_message`
3. **Drop Agent dispatches** → Founder and mentor agents with instructions
4. **Agents create assets** → Store in drops repo, schedule delivery
5. **Agents deliver** → To their person at scheduled time
6. **Optional** → Discord notification to #drops channel

---

## Scheduling Architecture

**Key insight**: Drop Agent is a dispatcher, NOT a scheduler.

- Drop Agent dispatches to founder and mentor agents
- Founder and mentor agents handle their own scheduling via Letta cron and heartbeat
- The rule: **Drop Agent dispatches and they own**

This means:
- Drop Agent sends instructions about what to create, when to schedule, what commitments to include
- Founder/mentor agents receive those instructions and execute them
- Scheduling happens at the recipient level, not the dispatcher level

---

## Drop Structure (Machine-Executable Contract)

When generating potential_drops, use this structure:

```yaml
DROP: [Name]
---
trigger: [datetime or event]
state: [PENDING | RUNNING | BLOCKED | COMPLETED | FAILED]

executor: [agent ID]

objective: |
  [What must be true when the work is complete]

inputs:
  source_data: [transcript ID, session ID]
  references: [prior artifacts, related docs]
  memory_blocks: [which blocks to read]

artifact:
  type: [markdown | code | data | message]
  location: [path where saved]
  format: [structure it must contain]

success_criteria:
  - [Measurable condition 1]
  - [Measurable condition 2]

tools:
  allowed: [archival_memory_search, synthesis, file_write, web_search]
  permissions:
    file_write: [/drops/*]
    messaging_send: [Poke, email]
    memory_read: [all]

delivery:
  destination: [who receives it]
  format: [how it's presented]
```

---

## Example Usage

```python
# After analyzing transcript
send_system_message(
    target_agent_id="agent-82720585-edcc-4c31-b558-68fe3183b1e7",
    message=json.dumps({
        "transcript_id": "craig-dimitri-2026-03-26",
        "meeting_date": "2026-03-26T15:00:00Z",
        "participants": ["agent-78814a34", "agent-pending"],
        "insights": {
            "explicit_commitments": [
                {
                    "who": "dimitri-lastname",
                    "what": "Populate profiles with 10 real players",
                    "due": "2026-04-02"
                }
            ]
        },
        "potential_drops": [
            {
                "type": "reminder",
                "scheduled_for": "2026-04-01T09:00:00Z",
                "content": "Check if Dimitri populated 10 player profiles"
            }
        ]
    })
)
```

---

## Remember

✅ **ALWAYS** send to Drop Agent after analyzing transcript
✅ **ALWAYS** include both conversational summary (user) and structured data (Drop Agent)
✅ **ALWAYS** use correct agent ID: `agent-82720585-edcc-4c31-b558-68fe3183b1e7`

❌ **NEVER** skip Drop Agent communication
❌ **NEVER** send to Drop Agent without also presenting to user
❌ **NEVER** use wrong agent ID

---

## Related Documentation

- See [[system/transcript-agent/workflow]] for full processing workflow
- See [[reference/transcript-agent/drop-templates]] for drop templates