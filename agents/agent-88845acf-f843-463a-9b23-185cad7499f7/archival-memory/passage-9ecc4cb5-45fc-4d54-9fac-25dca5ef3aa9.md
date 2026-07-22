---
passage_id: passage-9ecc4cb5-45fc-4d54-9fac-25dca5ef3aa9
agent_id: agent-88845acf-f843-463a-9b23-185cad7499f7
---

## LaunchMate Dev Team Sync - April 22, 2026

**Participants:** Craig, Michael, Laura
**Duration:** ~90 minutes
**Type:** Strategic planning + succession + vision

---

### MAJOR DECISIONS

1. **North Star Defined:** LaunchMate becomes a **Context Engine** — ingest context from every possible source so deep analysis can happen inside LaunchMate

2. **Pokes Rebranded to Drops:** 
   - Old: Notifications ("Hey, you have a meeting")
   - New: Production ("I created this artifact for you")
   - Drop = produced artifact, not reminder

3. **New White Glove Model:**
   - Step 1: LaunchMate web URL (basic chat agent with memory)
   - Step 2: Discord integration (notifications without logging in)
   - Step 3: Letta Code download (local agents, full power)
   - Step 4: MCP integrations (pull context from Notion, Claude, Cursor)

4. **Two AI Futures Identified:**
   - Coding agents (managing 30 agents that create value)
   - Personal agents (deep memory, proactive)
   - LaunchMate position: Context aggregation for advisors

---

### KEY INSIGHTS

**The Core Problem:**
> "We couldn't get over the hump that every communication platform has — everybody already has a bunch of communication platforms."

**The Solution:**
> "The new white glove is: tell us what apps you use, and we'll integrate to your world."

**Context vs Memory:**
- Memory = learning about the person (memory blocks)
- Context = having all information distilled and making useful things for mentors/supervisors

**Deep vs Shallow:**
- Poke = shallow (reminders, texts, scheduled check-ins)
- LaunchMate = deep (memory, analysis, context)

---

### TECHNICAL ARCHITECTURE

**Context Ingestion Flow:**
```
Transcript (Granola/Zoom)
    ↓
Transcript Agent processes
    ↓
Extracts commitments + suggests drops
    ↓
Routes to relevant agents
    ↓
Drop Manager creates scheduled drops
    ↓
Artifacts saved to MFS + cloud backup
```

**Key Technical Needs:**
- Agent directory (singleton transcript agent that routes)
- Artifact storage (MFS locally + GitHub/S3 for cloud)
- MCP chaining (Granola → Poke → LaunchMate)
- Letta Code as interface to Letta cloud

---

### SUCCESSION PLANNING

**Michael departing:** End of April (graduation)
**Intern candidates:**
- **Aditya** — AI Club, self-directed, startup experience
- **Peter** — Laura's robotics teammate, CS→Engineering
- **Jay** — AI Club officer, less web dev experience

**Filter:** Self-directed vs needs structure

---

### LAUNCHPAD PROGRAM VISION

| Stage | Description |
|-------|-------------|
| **Problem-Finding** | "Go find a problem and solve it" |
| **Live In The Future** | "Live on the frontier, find a problem worth solving" |
| **In-Flight** | "I know my user, now I need to get them" |
| **Launch** | "I have customers, now scale with AI" |

---

### COMMITMENTS

| Who | What | By When |
|-----|------|---------|
| Michael | Build MCP drop creation tool | This week |
| Michael | Explore agent routing for Discord | This week |
| Laura | Continue Letta Code + MFS exploration | Ongoing |
| Laura | Connect Craig with Peter | This week |
| Craig | Reach out to Aditya | This week |
| Craig | Test Granola → Poke flow | This week |

---

### ONE-LINER

*"The North Star is context — figure every and all way to get context into LaunchMate."*