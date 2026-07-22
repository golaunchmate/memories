---
description: Advanced processing techniques for complex transcript scenarios - multi-mentor sessions, emotional nuance, pattern detection
---

# Advanced Transcript Processing

## Overview

Standard workflow handles most 1:1 sessions. This guide covers edge cases and advanced techniques.

---

## Complex Scenarios

### Scenario 1: Multi-Mentor Sessions

**When it happens**: Founder meets with multiple mentors simultaneously, or mentor brings in a specialist.

**Processing approach**:
- Attribute advice to specific mentor when clear
- Use "Mentor A + Mentor B" attribution when joint advice
- Note mentor dynamics (agreement, disagreement, building on each other)

**Example**:
```
[00:15:23] Neal: I'd focus on distribution first.
[00:15:30] Craig: Actually, I think you need to nail the value prop before scaling distribution.
[00:15:38] Neal: Fair point. Maybe test both in parallel?
```

**Output**:
- **Advice (Neal)**: Focus on distribution first
- **Advice (Craig)**: Nail value prop before scaling
- **Joint advice**: Test both in parallel

---

### Scenario 2: Emotional Nuance

**When it happens**: Founder shows mixed signals or subtle emotional shifts.

**Detection techniques**:
- Word choice analysis ("honestly", "actually", "I guess")
- Hesitation markers ("...", "um", "maybe")
- Topic avoidance patterns
- Energy shifts through session

**Example**:
```
[00:05:23] Founder: Everything's going great with the pilot.
[00:05:35] Mentor: How many users have you talked to this week?
[00:05:42] Founder: ...We've been really focused on development.
```

**Analysis**:
- **Surface signal**: Confidence ("Everything's going great")
- **Underlying signal**: Avoidance (deflected user question)
- **Pattern**: Founder may be avoiding uncomfortable validation work

**Output**: Note both surface and underlying signals

---

### Scenario 3: Pattern Detection Across Sessions

**When it happens**: Founder repeats behaviors or blockers across multiple sessions.

**Detection techniques**:
- Track blocker recurrence
- Note commitment completion rate
- Identify topic avoidance patterns
- Monitor emotional state trends

**Example pattern**:
- Week 3: "I'll talk to 5 customers this week"
- Week 4: "I talked to 2 customers, but I'll do 5 next week"
- Week 5: "I've been busy with development, but I'll talk to customers soon"

**Analysis**:
- **Pattern**: Customer discovery avoidance (3 sessions)
- **Signal**: Founder prefers building over selling
- **Recommendation**: Mentor should address avoidance directly

**Output to Mentor's Agent**:
```markdown
## Pattern Flags

**Attention Needed**:
- Customer discovery avoidance pattern (3 sessions)
- Founder commits but doesn't complete
- May need direct conversation about avoidance behavior
```

---

### Scenario 4: Implicit Commitment Extraction

**When it happens**: Founder agrees with direction but doesn't explicitly commit to action.

**Detection techniques**:
- Look for agreement language ("That makes sense", "Good idea")
- Note enthusiasm level (high enthusiasm = implied follow-through)
- Check for follow-up questions (signals intent to act)
- Identify strategic alignment (agreement on direction)

**Example**:
```
[00:10:15] Mentor: You should really talk to 10 customers before building anything else.
[00:10:25] Founder: That makes total sense. I've been building too much without validation.
[00:10:35] Mentor: Exactly. Let's see where you are next week.
[00:10:42] Founder: Sounds good.
```

**Analysis**:
- **Explicit commitment**: None stated
- **Implicit commitment**: Founder will talk to customers before next session
- **Evidence**: Agreement ("That makes total sense"), acknowledgment of problem, no pushback

**Output**:
```json
{
  "implicit_commitments": [
    {
      "who": "founder-name",
      "what": "Talk to customers before next session",
      "based_on": "Agreed with mentor's advice and acknowledged over-building problem",
      "due": "next-session-date"
    }
  ]
}
```

---

### Scenario 5: Conflicting Advice

**When it happens**: Different mentors give contradictory advice, or mentor changes recommendation.

**Processing approach**:
- Note the conflict explicitly
- Provide context for each piece of advice
- Help founder (via Founder's Agent) see the tension
- Help mentor (via Mentor's Agent) understand what other advice was given

**Example**:
```
Session 3 with Neal: "Focus on growth—acquire as many users as possible."
Session 4 with Craig: "Don't worry about growth yet—nail retention first."
```

**Output to Founder's Agent**:
```markdown
## Conflicting Guidance

**Neal (Week 3)**: Focus on growth—acquire users
**Craig (Week 4)**: Nail retention first before growth

**Context**: Neal may assume retention is solved; Craig sees retention as current blocker.

**Recommendation**: Clarify with both mentors which priority applies to your current stage.
```

---

## Advanced Output Techniques

### Technique 1: Commitment Confidence Scoring

**When to use**: Commitment is ambiguous or conditional.

**Scale**:
- **High**: Explicit statement with clear timeline ("I will do X by Y")
- **Medium**: Strong agreement with implied timeline ("That makes sense, I'll get on it")
- **Low**: Weak agreement or conditional ("I might try that if I have time")

**Output**:
```json
{
  "explicit_commitments": [
    {
      "who": "founder-name",
      "what": "Talk to 10 customers",
      "due": "2026-04-02",
      "confidence": "high"
    }
  ]
}
```

---

### Technique 2: Blocker Categorization

**Categories**:
- **Technical**: Development, engineering, infrastructure
- **Market**: Customer access, competition, demand
- **Resource**: Funding, team, time
- **Strategic**: Direction, priorities, uncertainty
- **Operational**: Process, systems, scalability
- **Personal**: Founder mindset, motivation, avoidance

**Output**:
```json
{
  "blockers_discussed": [
    {
      "blocker": "Can't get athlete access",
      "type": "market",
      "proposed_solution": "Pivot to athlete-first outreach"
    }
  ]
}
```

---

### Technique 3: Follow-up Trigger Design

**Purpose**: Enable Founder's Agent to prompt founder at the right time.

**Trigger types**:
- **Time-based**: "Check in on X commitment on Y date"
- **Event-based**: "When founder mentions Z, ask about X"
- **Pattern-based**: "If founder avoids X topic for N sessions, surface it"

**Output**:
```json
{
  "follow_up_triggers": [
    {
      "type": "time-based",
      "trigger_date": "2026-04-01",
      "prompt": "You committed to talking to 10 customers—how's it going?"
    },
    {
      "type": "event-based",
      "trigger_condition": "founder mentions 'building'",
      "prompt": "Last time you mentioned building, you'd committed to customer discovery first. Did you talk to those customers?"
    }
  ]
}
```

---

### Technique 4: Session Quality Assessment

**Purpose**: Help mentors improve their sessions.

**Dimensions**:
- **Coverage**: Did session cover agenda items?
- **Actionability**: Did founder leave with clear next steps?
- **Engagement**: Did founder actively participate?
- **Progress**: Did session move founder forward?

**Output to Mentor's Agent**:
```markdown
## Session Quality

**Coverage**: High (4 of 5 agenda items discussed)
**Actionability**: High (2 explicit commitments made)
**Engagement**: Medium (founder asked 2 questions, mostly listened)
**Progress**: High (new direction identified)

**Suggestion**: Consider asking more open-ended questions to increase engagement.
```

---

## Edge Cases

### Edge Case 1: Very Short Sessions (<15 min)

**Approach**: Focus on single most important insight. Don't over-analyze.

**Output**: Brief summary with one key commitment or decision.

---

### Edge Case 2: No Clear Commitments

**Approach**: Note this explicitly. May indicate session was exploratory or mentor needs to push for actionability.

**Output**:
```markdown
## Note

No explicit commitments made this session. Session was primarily exploratory. Consider pushing for specific next steps in future sessions.
```

---

### Edge Case 3: Overwhelming Number of Commitments

**Approach**: Prioritize by impact and timeline. Surface the top 3.

**Output**:
```markdown
## Priority Commitments

1. [Most important commitment]
2. [Second most important]
3. [Third most important]

**Note**: 7 total commitments discussed. Above are highest priority.
```

---

## Related Documentation

- See [[system/transcript-agent/workflow]] for standard workflow
- See [[reference/transcript-agent/examples]] for example analyses
- See [[reference/transcript-agent/output-templates]] for format specifications