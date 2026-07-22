---
description: Step-by-step checklist for processing each transcript - from receipt to delivery
---

# Transcript Processing Checklist

## Pre-Processing

- [ ] Receive transcript input (file path, pasted text, or recording)
- [ ] Identify participants (mentor name, founder name)
- [ ] Pull mentor context from [[system/transcript-agent/mentor-registry]]
- [ ] Pull founder context from Founder's Agent
- [ ] Note session date and duration
- [ ] Review recent session history for continuity

---

## During Processing

### Commitment Extraction
- [ ] Scan for explicit commitments ("I will", "I'll", "Let me")
- [ ] Scan for implicit commitments (agreement + implied action)
- [ ] Identify commitment owners (who)
- [ ] Identify commitment timelines (when)
- [ ] Note commitment confidence level (high/medium/low)

### Decision Extraction
- [ ] Identify strategic pivots
- [ ] Identify scope changes
- [ ] Identify priority shifts
- [ ] Note decision rationale

### Advice Extraction
- [ ] Attribute advice to specific mentor
- [ ] Capture advice context (situation it applies to)
- [ ] Note tactical vs. strategic advice

### Question Extraction
- [ ] Identify questions asked but not answered
- [ ] Identify topics mentioned but not explored
- [ ] Note action items without clear owners

### Signal Detection
- [ ] Note stress signals
- [ ] Note excitement signals
- [ ] Note uncertainty signals
- [ ] Note confidence signals
- [ ] Track emotional progression through session

### Pattern Detection
- [ ] Check for recurring blockers
- [ ] Check for commitment completion history
- [ ] Check for topic avoidance patterns
- [ ] Note trends across sessions

---

## Output Generation

### Mentor's Agent Output
- [ ] Coverage summary (discussed vs. not covered)
- [ ] Open items table
- [ ] Advice given table
- [ ] Founder state summary
- [ ] Suggested follow-up
- [ ] Pattern flags

### Founder's Agent Output
- [ ] Key decisions made
- [ ] Action items table (who, what, when)
- [ ] Open questions list
- [ ] Mentor advice to remember
- [ ] Follow-up triggers
- [ ] Apply Mentor Sharing Permissions filter

### Shared Memory Output
- [ ] Session metadata (date, participants, duration)
- [ ] Structured JSON with all extracted insights
- [ ] Searchable keywords and tags

### Drop Agent Output
- [ ] JSON payload with transcript_id
- [ ] Meeting date and participants
- [ ] Explicit and implicit commitments
- [ ] Research opportunities
- [ ] Key decisions
- [ ] Potential drops with scheduling

---

## Delivery

- [ ] Present conversational summary to user
- [ ] Send structured data to Drop Agent via `send_system_message`
- [ ] Verify Drop Agent received payload
- [ ] Confirm all three outputs generated

---

## Post-Processing

- [ ] Store session log in shared memory
- [ ] Update founder context with new blockers/commitments
- [ ] Update mentor context with session notes
- [ ] Schedule follow-up reminders if needed
- [ ] Note any patterns for future sessions

---

## Quality Verification

- [ ] Every action item has an owner
- [ ] Every action item has a due date
- [ ] Emotional signals backed by quotes
- [ ] Advice attributed to specific mentor
- [ ] Implicit commitments justified with evidence
- [ ] Both layers delivered (user + Drop Agent)

---

## Edge Cases

### If no clear commitments:
- [ ] Note session was exploratory
- [ ] Suggest mentor push for actionability next session

### If overwhelming commitments (>5):
- [ ] Prioritize top 3 by impact
- [ ] Note total count and prioritization

### If very short session (<15 min):
- [ ] Focus on single most important insight
- [ ] Provide brief summary only

### If conflicting advice from different mentors:
- [ ] Note the conflict explicitly
- [ ] Provide context for each piece of advice
- [ ] Recommend clarification with mentors

---

## Related Documentation

- **Workflow**: [[system/transcript-agent/workflow]]
- **Quick Reference**: [[system/transcript-agent/quick-reference]]
- **Examples**: [[reference/transcript-agent/examples]]