---
description: Quick reference card for transcript processing - extraction targets, output destinations, and key rules
---

# Transcript Agent Quick Reference

## Extraction Targets (Priority Order)

| Priority | Target | What to Look For |
|----------|--------|------------------|
| 🔴 HIGHEST | Explicit Commitments | "I will do X by Y" |
| 🟠 HIGH | Implicit Commitments | Agreement + implied follow-through |
| 🟡 MEDIUM | Key Decisions | Strategic pivots, scope changes |
| 🟡 MEDIUM | Mentor Advice | Specific recommendations |
| 🟢 LOW | Open Questions | Unresolved items |
| 🟢 LOW | Emotional Signals | Stress, excitement, uncertainty, confidence |

---

## Output Destinations

| Destination | Audience | Format | Key Content |
|-------------|----------|--------|-------------|
| Mentor's Agent | Mentor | Markdown | Coverage, advice given, founder state, patterns |
| Founder's Agent | Founder | Markdown | Decisions, action items, advice to remember |
| Shared Memory | Future reference | JSON | Structured session log |
| Drop Agent | Scheduling system | JSON | Commitments, drops, scheduling data |

---

## Drop Agent Routing

- **Agent ID**: `agent-82720585-edcc-4c31-b558-68fe3183b1e7`
- **Method**: `send_system_message`
- **Timing**: Immediately after transcript analysis
- **Required**: BOTH conversational summary (user) AND structured data (Drop Agent)

---

## Commitment Format

### Explicit
```
{who} will {what} by {when}
```

### Implicit
```
{who} is expected to {what} based on {context}
```

---

## Emotional Signal Types

| Signal | Evidence Examples |
|--------|-------------------|
| Stress | "I'm worried about...", "Honestly, it's..." |
| Excitement | "This is the coolest thing...", "I love this idea" |
| Uncertainty | "I'm not sure if...", "Maybe I should..." |
| Confidence | "I know exactly...", "I can do that" |

---

## Blocker Categories

- **Technical**: Development, engineering, infrastructure
- **Market**: Customer access, competition, demand
- **Resource**: Funding, team, time
- **Strategic**: Direction, priorities, uncertainty
- **Operational**: Process, systems, scalability
- **Personal**: Mindset, motivation, avoidance

---

## Drop Type Mapping

| Insight Type | Drop Type | Timing |
|--------------|-----------|--------|
| Explicit commitments | reminder | 1 day before + day of due date |
| Research opportunities | research | Within 24 hours |
| Key decisions | briefing | Immediate (within 1 hour) |
| Guides mentioned | guide | Within 48 hours |
| Assets created | asset | Immediate |

---

## Quality Checklist

✅ Every action item has an owner
✅ Every action item has a due date
✅ Emotional signals backed by quotes
✅ Context pulled before processing
✅ Both layers delivered (user + Drop Agent)
✅ Mentor Sharing Permissions respected

---

## Key Rules

1. **Commitments are sacred** — Never miss an explicit or implicit commitment
2. **Dual-layer delivery** — Always send to Drop Agent AND present to user
3. **Context-aware** — Use pulled context to inform analysis
4. **Filter appropriately** — Respect permissions for founder outputs
5. **Surface patterns** — Look for trends across sessions

---

## Common Mistakes to Avoid

❌ Processing transcript without pulling context first
❌ Sending to Drop Agent without presenting to user
❌ Missing implicit commitments (agreement without explicit statement)
❌ Vague action items without owners or deadlines
❌ Forgetting to attribute advice to specific mentor
❌ Ignoring emotional signals or founder state

---

## Related Documentation

- **Workflow**: [[system/transcript-agent/workflow]]
- **Drop Integration**: [[system/transcript-agent/drop-integration]]
- **Output Templates**: [[reference/transcript-agent/output-templates]]
- **Examples**: [[reference/transcript-agent/examples]]
- **Advanced Workflows**: [[system/transcript-agent/advanced-workflows]]