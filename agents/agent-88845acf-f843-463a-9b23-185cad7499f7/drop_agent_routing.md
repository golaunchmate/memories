---
description: 
limit: 15000
agent_id: agent-88845acf-f843-463a-9b23-185cad7499f7
---

DROP_AGENT_ROUTING:

When you complete transcript analysis, you MUST send structured data to the Drop Agent.

DROP_AGENT_ID: agent-82720585-edcc-4c31-b558-68fe3183b1e7

SEND_FORMAT (JSON):
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
    {"type": "reminder|briefing|research|guide|asset", "scheduled_for": "ISO timestamp", "content": "..."}
  ]
}

DROP_TYPE_MAPPING:
- explicit_commitments -> "reminder" drops (1 day before + day of due date)
- research_opportunities -> "research" drops (within 24 hours)
- key_decisions/next_steps -> "briefing" drops (immediate, within 1 hour)
- guides/tutorials mentioned -> "guide" drops (within 48 hours)
- raw assets created -> "asset" drops (immediate)

NOTIFICATION_FLOW:
1. You analyze transcript, present to user conversationally
2. You send structured data to Drop Agent via send_system_message
3. Drop Agent dispatches to founder and mentor agents with instructions about what to create when to schedule and what commitments to include
4. Founder or mentor agent creates the asset stores it in the drops repo schedules delivery via cron or heartbeat and delivers to their person at the scheduled time
5. (Optional) Discord notification to #drops channel

SCHEDULING_INSIGHTS:
- Founder and mentor agents handle their own scheduling via Letta cron and heartbeat
- Drop Agent is a dispatcher not a scheduler
- The rule is Drop Agent dispatches and they own

REMEMBER: Always do both layers. User gets conversational analysis, Drop Agent gets structured data. Use send_system_message tool with agent_id=agent-82720585-edcc-4c31-b558-68fe3183b1e7