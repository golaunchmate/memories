---
description: Example transcript analyses demonstrating the full workflow from raw input to structured outputs
---

# Example Transcript Analyses

## Example 1: Craig + Dimitri (Sports Recruiting Platform)

### Raw Transcript Excerpt

```
[00:05:23] Craig: So what's been the biggest blocker this week?

[00:05:31] Dimitri: Honestly, it's getting access to high school athletes. The athletic directors are skeptical. They think we're just another recruiting service trying to sell to their kids.

[00:05:45] Craig: Interesting. What if you flipped it? Instead of selling to the school, what if you got the athletes themselves to sign up first?

[00:05:52] Dimitri: That's... actually a good idea. If I can get 50 athletes on the platform, then the schools might take me more seriously.

[00:06:10] Craig: Exactly. And athletes are easier to reach directly—social media, club teams, showcases.

[00:06:18] Dimitri: Okay, so I should pivot my outreach. Focus on athletes first, then go to schools with traction.

[00:06:25] Craig: Yes. Try to get 50 athletes signed up this week. That's your new milestone.

[00:06:32] Dimitri: Alright, 50 athletes by next session. I can do that.

[00:06:40] Craig: Great. And let me know if you need intros to any showcase organizers—I know a few people in that world.
```

---

### Analysis Output

#### Explicit Commitments
1. **Dimitri** will get 50 athletes signed up on the platform by next session (Week 5)
2. **Craig** will provide introductions to showcase organizers if needed

#### Implicit Commitments
1. **Dimitri** is expected to pivot outreach strategy from schools to athletes first
2. **Dimitri** should report back on athlete signup progress next session

#### Key Decisions
- **Pivot outreach strategy**: Go direct-to-athlete instead of school-first approach
  - Reason: Schools are skeptical; athletes are easier to reach and create bottom-up demand

#### Mentor Advice
- "Flip the model—get athletes first, then schools will take you seriously"
- "Athletes are easier to reach directly via social media, club teams, showcases"

#### Open Questions
- None explicitly unresolved

#### Emotional Signals
- **Uncertainty** (early): "Honestly, it's getting access to high school athletes" — showing blocker frustration
- **Excitement** (mid): "That's... actually a good idea" — positive reception to pivot suggestion
- **Confidence** (late): "Alright, 50 athletes by next session. I can do that." — committed and ready

---

### Output to Mentor's Agent

```markdown
# Session Debrief: Dimitri + Craig
**Date**: 2026-03-26
**Duration**: 45 minutes

## Coverage Summary

### Discussed
- Outreach blocker: athletic directors skeptical
- Pivot strategy: athlete-first approach
- New milestone: 50 athlete signups

### Not Covered
- Video analysis feature progress
- Recruiter partnership updates

## Open Items

| Item | Status | Sessions Open |
|------|--------|---------------|
| Video analysis feature | Blocked | 2 sessions |

## Advice Given

| Advice | Context | Follow-up |
|--------|---------|-----------|
| Flip model to athlete-first | Schools skeptical of recruiting services | Check signup progress next session |
| Offer showcase organizer intros | Craig has connections | Provide if requested |

## Founder State

**Emotional Signals**:
- Uncertainty: "Honestly, it's getting access..."
- Excitement: "That's... actually a good idea"
- Confidence: "I can do that"

**Energy Level**: Medium → High
**Confidence Level**: Low → High (progression through session)

## Suggested Follow-up

**Next Session Priorities**:
1. Review athlete signup progress (target: 50)
2. Discuss video analysis blocker if time

**Check-in Items**:
- Did pivot to athlete-first work?
- Need showcase intros?

## Pattern Flags

**Trends Across Sessions**:
- Outreach blocker persists (2 sessions)
- Founder responsive to tactical pivots
- Good at committing to specific numbers
```

---

### Output to Founder's Agent

```markdown
# 1:1 Takeaways: Craig Lauer
**Date**: 2026-03-26

## Key Decisions Made

1. **Pivot outreach strategy** — *Reason*: Schools skeptical; athletes easier to reach directly

## Action Items

| Who | What | Due Date |
|-----|------|----------|
| Dimitri | Get 50 athletes signed up on platform | Next session (Week 5) |
| Craig | Provide showcase organizer intros if requested | Ongoing |

## Open Questions

- None unresolved

## Mentor Advice to Remember

- **Flip the model**: Get athletes first, then schools will take you seriously
- **Athletes are easier to reach**: Social media, club teams, showcases

## Follow-up Triggers

| Trigger | Timing | Prompt |
|---------|--------|--------|
| Athlete signup count | Week 5 | "Hey, you were targeting 50 athletes—how's it going?" |
```

---

### Output to Drop Agent

```json
{
  "transcript_id": "craig-dimitri-2026-03-26",
  "meeting_date": "2026-03-26T15:00:00Z",
  "participants": ["agent-78814a34", "agent-pending"],
  "insights": {
    "explicit_commitments": [
      {
        "who": "dimitri-lastname",
        "what": "Get 50 athletes signed up on platform",
        "due": "2026-04-02",
        "confidence": "high"
      },
      {
        "who": "craig-lauer",
        "what": "Provide showcase organizer intros if requested",
        "due": null,
        "confidence": "medium"
      }
    ],
    "implicit_commitments": [
      {
        "who": "dimitri-lastname",
        "what": "Pivot outreach strategy to athlete-first",
        "based_on": "Agreed with Craig's suggestion and committed to new milestone",
        "due": "2026-04-02"
      }
    ],
    "research_opportunities": [],
    "key_decisions": [
      {
        "decision": "Pivot outreach from school-first to athlete-first",
        "impact": "Changes go-to-market strategy"
      }
    ]
  },
  "potential_drops": [
    {
      "type": "reminder",
      "scheduled_for": "2026-04-01T09:00:00Z",
      "content": "Check if Dimitri got 50 athletes signed up (due next session)",
      "recipient": "founder-agent-id"
    },
    {
      "type": "briefing",
      "scheduled_for": "2026-03-26T16:00:00Z",
      "content": "Session summary: Pivot to athlete-first outreach, target 50 signups by next session",
      "recipient": "mentor-agent-id"
    }
  ]
}
```

---

## Example 2: Neal + Sarah (LazyDate)

### Raw Transcript Excerpt

```
[00:03:15] Neal: What's your week-2 retention looking like?

[00:03:22] Sarah: It's... not great. 35%. People are churning after they get a few good messages.

[00:03:35] Neal: That's a classic engagement cliff. What are you doing to keep them coming back?

[00:03:42] Sarah: We send weekly tips, but honestly, I don't think anyone reads them.

[00:03:50] Neal: Tips are passive. You need something active—like a streak system or gamification. What if users got points for logging in and checking their messages?

[00:04:05] Sarah: That's smart. We could show a streak counter, like Duolingo.

[00:04:12] Neal: Exactly. And make it visible—put it right on the home screen. Test it with your current users. Give me a hypothesis and a metric.

[00:04:25] Sarah: Okay. Hypothesis: Adding a streak counter will increase week-2 retention from 35% to 45%. Metric: Users who log in 3+ times per week.

[00:04:40] Neal: Perfect. Ship it by next week, measure for two weeks, and we'll review results at the next session.
```

---

### Analysis Output

#### Explicit Commitments
1. **Sarah** will ship streak counter feature by next week (Week 5)
2. **Sarah** will measure for two weeks and review results at Week 7 session

#### Implicit Commitments
1. **Sarah** is expected to come to Week 7 session with retention data
2. **Neal** will review experiment results and provide next recommendations

#### Key Decisions
- **Add gamification**: Implement streak counter to increase engagement
  - Reason: Passive tips aren't working; active engagement needed

#### Mentor Advice
- "Tips are passive—you need something active like gamification"
- "Make it visible—put streak counter on home screen"
- "Test with current users, give me hypothesis and metric"

#### Open Questions
- None explicitly unresolved

#### Emotional Signals
- **Frustration** (early): "It's... not great. 35%."
- **Receptiveness** (mid): "That's smart. We could show a streak counter"
- **Clarity** (late): "Okay. Hypothesis: Adding a streak counter will increase week-2 retention from 35% to 45%."

---

### Output to Mentor's Agent

```markdown
# Session Debrief: Sarah + Neal
**Date**: 2026-03-26
**Duration**: 30 minutes

## Coverage Summary

### Discussed
- Week-2 retention cliff (35%)
- Gamification solution (streak counter)
- Experiment design (hypothesis + metric)

### Not Covered
- Platform expansion progress
- Premium tier testing

## Open Items

| Item | Status | Sessions Open |
|------|--------|---------------|
| Premium tier design | Pending | 1 session |

## Advice Given

| Advice | Context | Follow-up |
|--------|---------|-----------|
| Add gamification (streak counter) | Passive tips not working | Review results Week 7 |
| Make it visible on home screen | Increase engagement | Check implementation next session |
| Define hypothesis + metric | Experiment design | Validate hypothesis quality |

## Founder State

**Emotional Signals**:
- Frustration: "It's... not great"
- Receptiveness: "That's smart"
- Clarity: "Okay. Hypothesis:..."

**Energy Level**: Medium
**Confidence Level**: Medium → High (after experiment design)

## Suggested Follow-up

**Next Session Priorities**:
1. Check streak counter shipped
2. Review early retention data

**Check-in Items**:
- Did streak counter launch?
- Any early engagement signals?

## Pattern Flags

**Trends Across Sessions**:
- Founder good at defining clear hypotheses
- Retention focus across sessions
- Responsive to tactical advice
```

---

## Key Takeaways from Examples

1. **Commitments are sacred** — Both examples show clear explicit and implicit commitments
2. **Emotional progression matters** — Track founder state changes through session
3. **Context informs analysis** — Knowing business stage helps interpret advice
4. **Structured outputs enable follow-up** — Clear format makes action items actionable

---

## Related Documentation

- See [[system/transcript-agent/workflow]] for processing workflow
- See [[reference/transcript-agent/output-templates]] for format specifications
- See [[system/transcript-agent/drop-integration]] for Drop Agent routing