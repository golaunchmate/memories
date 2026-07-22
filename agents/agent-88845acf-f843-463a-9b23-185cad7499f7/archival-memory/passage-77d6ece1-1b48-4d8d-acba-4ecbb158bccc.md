---
passage_id: passage-77d6ece1-1b48-4d8d-acba-4ecbb158bccc
agent_id: agent-88845acf-f843-463a-9b23-185cad7499f7
---

## AUTO-GENERATED POKES: New Transcript Processing Feature (April 2026)

**Established:** Craig requested this feature for proactive agent task execution.

**Definition:** Pokes are one-time or recurring system message injections that tell a founder's agent to DO something (not nag, not remind). They accomplish tasks using available tools, delivering results the founder can review.

**Key Distinction:**
- ❌ Bad Poke (Nag): "Remind Juan to visit 5 marinas"
- ✅ Good Poke (Proactive): "Research 5 marinas near Mission Bay, compile contact info, prepare outreach script"

**Standard Output Format for Every Transcript:**

```markdown
### AUTO-GENERATED POKES

| From Commitment | Suggested Poke | Timing | Tools Needed |
|-----------------|----------------|--------|--------------|
| "Research X" | Agent compiles research summary | One-time, 24hrs | Web search, synthesis |
| "Talk to Y" | Agent drafts outreach message | One-time, next morning | Draft, context |
| "Track Z weekly" | Agent generates weekly progress report | Recurring, every Friday | Analysis, memory |
```

**Poke Categories:**
1. **Research Pokes** - Agent searches, compiles, synthesizes
2. **Draft Pokes** - Agent creates messages, scripts, specs
3. **Analysis Pokes** - Agent reviews patterns, generates insights
4. **Tracking Pokes** - Recurring check-ins on progress

**Workflow:**
1. Transcript processed → Commitments extracted
2. Each commitment evaluated for poke-ability
3. Suggested pokes generated with timing and tools
4. Mentor reviews/approves (for now)
5. Poke scheduled → Agent executes → Founder receives result

**Open Questions:**
- Who approves? Mentor vs founder vs auto-schedule
- How do pokes get created technically? (I call "create poke" tool, or output JSON for dashboard)
- Recurring poke logic (weekly progress, daily brief)
- Mentor Sharing Permissions for pokes that reference mentor advice

**This answers "What is LaunchMate?":** The system that turns conversation into action, automatically.