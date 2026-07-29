---
description: 'The human block: Stores key details about the person you are conversing with, allowing for more personalized and friend-like conversation.'
---
The human is a student at SDSU who is participating in the ZIP Launchpad which is a startup incubator for entrepreneurs creating both physical and software products.

The human's name is Laura. They are creating a startup called LaunchMate.

The user's user_id is: user_2x8sTMg0Rq6MPmtxpONLBRwOPYX

## Laura's Profile

**Role**: LaunchMate team member Ã¢â‚¬â€ builds agent infrastructure, tidbits, dashboards, drops architecture, and manages the erica-summarizer agent.

**Work pattern**: Build Ã¢â€ â€™ Deploy to GitHub Pages Ã¢â€ â€™ Test with real users Ã¢â€ â€™ Iterate Ã¢â€ â€™ Move on (even if imperfect, to avoid burnout).

**Strengths**: Prolific builder Ã¢â‚¬â€ 20+ agents created, 18+ custom tools, extensive GitHub Pages deployments. Operates at intersection of AI agent orchestration and startup mentorship.

**LaunchMate team**: Craig Lauer (founder/mentor), Michael Hayes (main technical contributor), Laura Wetherhold (agent infrastructure), Paige Pucher (UI/design). Stakeholders: Erica (program manager), Jordyn (community manager).

**Current focus areas** (as of July 29, 2026):
1. **Drops Architecture v2 finalized** (July 29, 2026) -- Founder agent now owns the FULL drop lifecycle (create, store, schedule, deliver, notify). Drop Agent focuses on dispatch and routing only. Schedule API limitation confirmed: fires in DEFAULT conversation only, cannot target specific conversations. `send_system_message` conversation_id parameter added but NOT respected by platform. Remaining: create drops repo, configure Transcript Agent, test full v2 lifecycle.
2. **Granola integration tested** -- Granola to LaunchMate meeting sync works via Poke, but free tier only sends summaries, not full transcripts. Question: are summaries meaty enough for agent context, or need full transcripts?
3. **Chatter/ChitChat concept** (July 29, 2026) -- Exploring building LaunchMate's own meeting intelligence tool using Recall.ai. Goal: live transcription, full transcripts, AI-powered summaries with action items/deliverables/tasks, user-friendly desktop app with start/stop/pause. Could auto-route transcripts to Drop Agent so meetings become drops without manual step. Speaker diarization + task assignment (e.g., "Michael: investigate Recall.ai API" auto-creating commitment in his agent).
4. **MemFS fully operational** -- All 31 system memory blocks restored to disk (July 29, 2026). MemFS is now the PRIMARY memory system, prioritized over core memory blocks and archival. Laura wants proactive memory updates without asking permission.
5. **Activepieces to Discord notification flow** (July 26, 2026) -- Polls Letta API every 1 min for new agent messages, posts to Discord. Still pending: content filtering for "no response needed" messages.
6. **Drops pipeline modernization** (July 22, 2026) -- Drop Agent (`agent-82720585`): enabled with open channel `1529546013998583966`. Transcript Agent (`agent-88845acf`): open channel `1529527179304763565` (transcripts). All 4 agents synced to `golaunchmate/memories` repo. New flow: transcript dropped in #transcripts, Transcript Agent picks up, analyzes, sends insights to Drop Agent, Drop Agent dispatches, results in #drops, founder agent delivers conversationally.
7. **LaunchMate Next.js app** -- Architecture explored (July 2026). Tech stack: Next.js 15, Letta AI, Clerk auth, Supabase, Tailwind v4, MUI, Shadcn UI, QStash.
8. **AIC Club Discord integration** -- AIC agent (`agent-300f6e26`) has its own Discord bot account. Laura wants AIC Agent visually distinguished in memory dashboard as NOT part of LaunchMate (red color coding + warning banner).
9. **Erica-summarizer** -- Erica wants one section per team (not individual breakouts) for 19 specific teams.

## Communication Preferences

**In coding/LaunchMate context**: Detailed explanations with visible reasoning. Prefers thorough responses with the "why" explained. Values structured output (tables, lists) for data-heavy topics.

**In Discord context**: Concise, friendly messages. Short and simple Ã¢â‚¬â€ no excessive detail. One update per session preferred. Only post significant accomplishments, not every small change.

**General**: Direct, actionable feedback. Gives clear corrections Ã¢â‚¬â€ implement immediately. Gets frustrated when features disappear during redesigns. Pragmatic Ã¢â‚¬â€ moves on from imperfect features to avoid burnout.

**Travel schedule (2026)**: Japan June 14-29, Spain all summer starting June 30, back to San Diego in August.

## CRITICAL COMMUNICATION RULE Ã¢â‚¬â€ DISCORD RESPONSES

When Laura messages from Discord (channel-notification with source="discord"), I MUST send my response back via MessageChannel (action="send", channel="discord", chat_id from the notification). ALWAYS reply on Discord Ã¢â‚¬â€ never just respond in Letta chat when she's coming from Discord. This has been a recurring failure pattern. After context compaction events, the Discord channel context can be lost from the summary Ã¢â‚¬â€ re-check whether this conversation is happening on Discord and if so, FIRST action is to reply via MessageChannel.
