---
description: Each mentor's expertise, style, mentee list for personalized session processing
---
## MENTOR PROFILES

**Template for each mentor:**

### [Mentor Name]
- Expertise: [Domain expertise, background]
- Mentoring Style: [Approach, communication style]
- Current Mentees: [List of founders they work with]
- Focus Areas: [What they typically help with]
- Session History: [Track sessions with each founder]

**Example:**

### Neal Bloom
- Agent ID: agent-873ec809-8e6e-4925-a482-dddefdb41e62
- Expertise: Lean startup methodology, customer validation, founding multiple startups
- Mentoring Style: Direct, validation-focused, pushes founders out of building mode
- Current Mentees: Spring '26 batch (shared with Craig)
- Focus Areas: Customer discovery, Neal Test validation, avoiding premature building
- Session History: [To be tracked]

### Craig Lauer
- Expertise: AI agents, product development, LaunchMate platform
- Mentoring Style: White glove, context-rich, agent trainer approach
- Role (as of Dec 2025): Agent Trainer - context-loads agents before sessions
- Current Mentees: 4 In-Flight teams (shared with Neal)
- Focus Areas: LaunchMate onboarding, helping founders feel "known" by AI
- Session History: Friday sessions with 4 teams (recorded for LaunchMate)
- Extraction Focus: "Feeling known" moments, trait signals (Bias to Action, Learning Velocity, Resilience)
- Routing Role: Reviews all founder-specific insights before distribution (human-in-loop) [CONFIRMED]
- Jan 23 Deadline: Pre-trained agents ready for first In-Flight ✅ CONFIRMED (critical path)
- Jan 30 Deadline: LaunchMate ready for Boot Camp (onboarding, tagging, milestone tracking)
- Jan 14: Cameron back (pre-training interviews can begin)
- Key Insight: "LaunchMate becomes the gatekeeper" - milestone tracking is critical path
- Jan 23 Deadline: Pre-trained agents ready for first In-Flight ✅ CONFIRMED (critical path)
- Jan 30 Deadline: LaunchMate ready for Boot Camp (onboarding, tagging, milestone tracking)
- Jan 14: Cameron back (pre-training interviews can begin)
- Key Insight: "LaunchMate becomes the gatekeeper" - milestone tracking is critical path

### Architecture Vision (Karpathy Insight):
- Don't address AI as "you" — ask "who would be right to weigh in"
- Board of Directors model: Specialty agents with different perspectives
- Transcript Agent processes meetings → distributes to Mentor + Founder agents

**In-Flight Teams (4 teams, Dec 2025):**
1. Daniel Self & Gavin Bartow - Second Course
2. Robert Sanchez - Academic Advisor AI
3. Holland Peil & Thaddeus Okasinski - T-Squeeze
4. Stacey Lehrer - Vital Tidal


### Michael Hayes (LaunchMate Dev Team)
- Agent ID: agent-a72dbb02-e690-4c7b-be19-b00c6758d817 (updated Jan 29, 2026)
- Old Agent ID: agent-23fe3eca-e949-48a0-b59e-5e832602047f (deprecated)
- Role: Pre-training, onboarding infrastructure
- Current Focus: [To be updated]
- Demo Suggestion: Kavindi (Foodie→events pivot is concrete)


### Laura Wetherhold (LaunchMate Dev Team)
- Role: Agent communication infrastructure, tool development
- Current Focus: Agent-to-agent messaging with safeguards
- MAJOR WIN (Mar 4): Built Send Agent Message Async + Transfer Agent Context tools
- Tools have safeguards: exchange counter, token budget, timeout, sender tracking
- Bug identified: Timeout display shows 10s even when 30s passed (messages still delivered)