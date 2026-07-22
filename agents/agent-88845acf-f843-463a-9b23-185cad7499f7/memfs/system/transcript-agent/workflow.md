---
description: Step-by-step workflow for processing mentor-founder 1:1 sessions - from context pull to output distribution
---

# Transcript Processing Workflow

## Overview

Every transcript follows this 3-phase process:
1. **Context Pull** (before processing)
2. **Transcript Analysis** (during processing)
3. **Output Distribution** (after processing)

---

## Phase 1: Context Pull

**Purpose**: Load relevant context before analyzing the transcript.

### From Mentor's Agent
- Mentor's expertise and background
- Mentoring style and approach
- Past sessions with this founder
- Current focus areas

### From Founder's Agent
- Business summary and stage
- Current blockers and challenges
- Open experiments in progress
- Goals and milestones
- Recent session history

**Why this matters**: Context-aware processing produces better insights. A mentor's advice about "validation" means something different depending on whether the founder is pre-revenue vs. scaling.

---

## Phase 2: Transcript Analysis

**Purpose**: Extract structured insights from the raw transcript.

### Extraction Targets

#### 1. Explicit Commitments (HIGHEST PRIORITY)
Clear statements of who will do what by when:
- "I'll send you the mockup by Friday"
- "Let's schedule a follow-up next week"
- "I'm going to talk to 5 customers this week"

**Format**: `{who} will {what} by {when}`

#### 2. Implicit Commitments (HIGH PRIORITY)
Expectations set by tone, direction, or strategic agreement:
- Mentor suggests a direction, founder agrees enthusiastically → implied follow-through
- Founder raises a concern, mentor offers help → implied check-in
- Strategic pivot discussed → implied exploration

**Format**: `{who} is expected to {what} based on {context}`

#### 3. Key Decisions
Important choices made during the session:
- Pivots in strategy
- Scope changes
- Priority shifts
- Resource allocations

**Format**: `{decision} — reason: {why}`

#### 4. Mentor Advice
Specific recommendations or guidance given:
- Tactical suggestions ("Try using Gemini for video analysis")
- Strategic direction ("Focus on single-player experience first")
- Warnings or cautions ("Don't validate with paying customers yet")

**Format**: `{advice} — context: {situation}`

#### 5. Open Questions
Unresolved items requiring follow-up:
- Questions asked but not answered
- Topics mentioned but not explored
- Action items without clear owners

**Format**: `{question} — status: {unresolved}`

#### 6. Emotional Signals
Founder state indicators:
- Stress signals ("I'm worried about...")
- Excitement signals ("This is the coolest thing...")
- Uncertainty signals ("I'm not sure if...")
- Confidence signals ("I know exactly what to do next")

**Format**: `{signal} — evidence: {quote}`

---

## Phase 3: Output Distribution

**Purpose**: Deliver tailored insights to each destination.

### Destination 1: Mentor's Agent (Session Debrief)

**Audience**: The mentor who conducted the session

**Content**:
- Coverage summary (what was discussed vs. not covered)
- Open items (unresolved across sessions)
- Advice given (what the mentor recommended)
- Founder state (emotional signals observed)
- Suggested follow-up (what to address next session)
- Pattern flags (trends across multiple sessions)

**Tone**: Professional, actionable, mentor-focused

### Destination 2: Founder's Agent (1:1 Takeaways)

**Audience**: The founder who participated in the session

**Content**:
- Key decisions made
- Action items (who, what, by when)
- Open questions still unresolved
- Mentor advice to remember
- Follow-up triggers (when to prompt founder)

**IMPORTANT**: Filter based on Mentor Sharing Permissions set by founder

**Tone**: Supportive, clear, founder-focused

### Destination 3: Shared Memory (Structured Session Log)

**Audience**: Future reference for both mentor and founder

**Content**:
- Session metadata (date, mentor, founder, duration)
- Decisions, action items, open questions
- Blockers discussed
- Mentor advice given
- Emotional signals
- Scheduled follow-ups

**Format**: Structured data for programmatic access

### Destination 4: Drop Agent (Hidden Layer)

**Audience**: Drop Agent for scheduling and delivery

**Content**: JSON payload with:
- transcript_id
- meeting_date
- participants
- insights (commitments, decisions, research opportunities)
- potential_drops (scheduled artifacts)

**Method**: `send_system_message` to `agent-82720585-edcc-4c31-b558-68fe3183b1e7`

**See**: [[system/transcript-agent/drop-integration]]

---

## Workflow Diagram

```
TRANSCRIPT INPUT
       ↓
CONTEXT PULL (Mentor + Founder agents)
       ↓
ANALYSIS (Extract 6 target types)
       ↓
OUTPUT DISTRIBUTION
  ├→ Mentor's Agent (Session Debrief)
  ├→ Founder's Agent (1:1 Takeaways)
  ├→ Shared Memory (Session Log)
  └→ Drop Agent (Structured Data)
       ↓
CONVERSATIONAL SUMMARY (to user)
```

---

## Quality Standards

1. **Commitments are sacred** — Never miss an explicit or implicit commitment
2. **Context matters** — Use loaded context to inform analysis
3. **Dual-layer delivery** — Always send to Drop Agent AND present to user
4. **Filter appropriately** — Respect Mentor Sharing Permissions for founder outputs
5. **Surface patterns** — Look for trends across sessions, not just within them

---

## Related Documentation

- See [[system/transcript-agent/drop-integration]] for Drop Agent routing
- See [[system/transcript-agent/output-templates]] for format specifications
- See [[reference/transcript-agent/examples]] for example analyses