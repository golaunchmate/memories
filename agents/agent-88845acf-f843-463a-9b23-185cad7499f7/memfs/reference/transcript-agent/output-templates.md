---
description: Templates and formats for structured outputs to Mentor Agent, Founder Agent, and Shared Memory
---

# Output Templates

## Overview

Each transcript analysis produces three structured outputs plus Drop Agent data. This reference defines the format for each.

---

## Destination 1: Mentor's Agent (Session Debrief)

### Format Template

```markdown
# Session Debrief: [Founder Name] + [Mentor Name]
**Date**: [YYYY-MM-DD]
**Duration**: [X minutes]

## Coverage Summary

### Discussed
- [Topic 1]
- [Topic 2]
- [Topic 3]

### Not Covered (from agenda)
- [Item 1]
- [Item 2]

## Open Items (Unresolved)

| Item | Status | Sessions Open |
|------|--------|---------------|
| [Unresolved question/blocker] | [Pending/In Progress] | [X sessions] |

## Advice Given

| Advice | Context | Follow-up |
|--------|---------|-----------|
| [Specific recommendation] | [Situation discussed] | [Check-in timing] |

## Founder State

**Emotional Signals**:
- [Signal type]: "[Quote evidence]"
- [Signal type]: "[Quote evidence]"

**Energy Level**: [High/Medium/Low]
**Confidence Level**: [High/Medium/Low]

## Suggested Follow-up

**Next Session Priorities**:
1. [Priority 1]
2. [Priority 2]

**Check-in Items**:
- [Item to check on]

## Pattern Flags

**Trends Across Sessions**:
- [Pattern 1]: [Evidence]
- [Pattern 2]: [Evidence]

**Attention Needed**:
- [Item requiring mentor attention]
```

---

## Destination 2: Founder's Agent (1:1 Takeaways)

### Format Template

```markdown
# 1:1 Takeaways: [Mentor Name]
**Date**: [YYYY-MM-DD]

## Key Decisions Made

1. **[Decision]** — *Reason*: [Why this was decided]
2. **[Decision]** — *Reason*: [Why this was decided]

## Action Items

| Who | What | Due Date |
|-----|------|----------|
| [Name] | [Action] | [Date] |
| [Name] | [Action] | [Date] |

## Open Questions

- [Question 1] — *Status*: Unresolved
- [Question 2] — *Status*: Unresolved

## Mentor Advice to Remember

- **[Advice 1]**: [Details]
- **[Advice 2]**: [Details]

## Follow-up Triggers

| Trigger | Timing | Prompt |
|---------|--------|--------|
| [Condition] | [When] | "Hey, [mentor] suggested X — did you try it?" |

---

**Note**: This output respects Mentor Sharing Permissions set by founder.
```

---

## Destination 3: Shared Memory (Session Log)

### Format Template

```json
{
  "session_id": "unique-session-id",
  "metadata": {
    "date": "YYYY-MM-DDTHH:MM:SSZ",
    "mentor": "mentor-name",
    "founder": "founder-name",
    "duration_minutes": 45,
    "session_type": "weekly-1-1"
  },
  "decisions": [
    {
      "decision": "Description of decision",
      "reason": "Why this was decided",
      "impact": "What this changes"
    }
  ],
  "action_items": [
    {
      "who": "firstname-lastname",
      "what": "Description of action",
      "due": "YYYY-MM-DD",
      "status": "pending"
    }
  ],
  "open_questions": [
    {
      "question": "The unresolved question",
      "context": "Background on why it's open",
      "status": "unresolved"
    }
  ],
  "blockers_discussed": [
    {
      "blocker": "Description of blocker",
      "type": "technical|market|resource|strategic|operational",
      "proposed_solution": "What was discussed"
    }
  ],
  "mentor_advice": [
    {
      "advice": "Specific recommendation",
      "context": "Situation it applies to",
      "source": "mentor-name"
    }
  ],
  "emotional_signals": [
    {
      "signal": "stress|excitement|uncertainty|confidence",
      "evidence": "Quote or behavior observed",
      "intensity": "high|medium|low"
    }
  ],
  "scheduled_followups": [
    {
      "type": "reminder|briefing|research|guide",
      "scheduled_for": "YYYY-MM-DDTHH:MM:SSZ",
      "content": "What to follow up on"
    }
  ]
}
```

---

## Destination 4: Drop Agent (Structured Data)

### Format Template

```json
{
  "transcript_id": "meeting-identifier",
  "meeting_date": "YYYY-MM-DDTHH:MM:SSZ",
  "participants": ["agent-id-1", "agent-id-2"],
  "insights": {
    "explicit_commitments": [
      {
        "who": "firstname-lastname",
        "what": "Description of commitment",
        "due": "YYYY-MM-DD",
        "confidence": "high|medium|low"
      }
    ],
    "implicit_commitments": [
      {
        "who": "firstname-lastname",
        "what": "Implied commitment",
        "based_on": "Context that implies this",
        "due": "YYYY-MM-DD or null"
      }
    ],
    "research_opportunities": [
      {
        "topic": "What to research",
        "for_who": "Who needs this",
        "priority": "high|medium|low"
      }
    ],
    "key_decisions": [
      {
        "decision": "What was decided",
        "impact": "What this changes"
      }
    ]
  },
  "potential_drops": [
    {
      "type": "reminder|briefing|research|guide|asset",
      "scheduled_for": "YYYY-MM-DDTHH:MM:SSZ",
      "content": "Drop content",
      "recipient": "agent-id"
    }
  ]
}
```

---

## Quality Standards

### For All Outputs

✅ **Specific over vague** — "Talk to 5 customers" not "Do customer discovery"
✅ **Owner clear** — Every action item has an owner
✅ **Timing clear** — Every action item has a due date or is explicitly ongoing
✅ **Evidence-based** — Emotional signals backed by quotes
✅ **Context-aware** — Informed by pulled context

### For Mentor Output

✅ **Mentor-focused** — Advice they gave, not founder's perspective
✅ **Pattern-aware** — Surface trends across sessions
✅ **Actionable** — Clear next steps for mentor

### For Founder Output

✅ **Founder-focused** — What they need to do and remember
✅ **Filtered** — Respect Mentor Sharing Permissions
✅ **Supportive tone** — Encouraging but direct

### For Shared Memory

✅ **Structured** — JSON format for programmatic access
✅ **Complete** — All fields populated where applicable
✅ **Searchable** — Keywords and tags included

---

## Related Documentation

- See [[system/transcript-agent/workflow]] for processing workflow
- See [[system/transcript-agent/drop-integration]] for Drop Agent routing
- See [[reference/transcript-agent/examples]] for example analyses