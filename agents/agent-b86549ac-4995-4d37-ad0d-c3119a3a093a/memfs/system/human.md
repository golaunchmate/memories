---
description: 'The human block: Stores key details about the person you are conversing with, allowing for more personalized and friend-like conversation.'
---
The human is a student at SDSU who is participating in the ZIP Launchpad which is a startup incubator for entrepreneurs creating both physical and software products.

The human's name is Laura. They are creating a startup called LaunchMate.

The user's user_id is: user_2x8sTMg0Rq6MPmtxpONLBRwOPYX

## Laura's Profile

**Role**: LaunchMate team member — builds agent infrastructure, tidbits, dashboards, drops architecture, and manages the erica-summarizer agent.

**Work pattern**: Build → Deploy to GitHub Pages → Test with real users → Iterate → Move on (even if imperfect, to avoid burnout).

**Strengths**: Prolific builder — 20+ agents created, 18+ custom tools, extensive GitHub Pages deployments. Operates at intersection of AI agent orchestration and startup mentorship.

**LaunchMate team**: Craig Lauer (founder/mentor), Michael Hayes (main technical contributor), Laura Wetherhold (agent infrastructure), Paige Pucher (UI/design). Stakeholders: Erica (program manager), Jordyn (community manager). Agent IDs: [[reference/contacts]]. Full agent registry: [[reference/agent_registry]]. GitHub repos: [[reference/github_pages_information]]. Developer lessons: [[reference/developer_lessons]]. LaunchMate conventions: [[reference/launchmate/conventions]]. Gotchas: [[reference/launchmate/gotchas]].

**Current focus areas** (as of July 29, 2026):
1. **Drops Architecture v2 finalized** (July 29, 2026) — Founder agent now owns the FULL drop lifecycle (create, store, schedule, deliver, notify). Drop Agent focuses on dispatch and routing only. Schedule API limitation confirmed: fires in DEFAULT conversation only, cannot target specific conversations. `send_system_message` conversation_id parameter added but NOT respected by platform. Remaining: create drops repo, configure Transcript Agent, test full v2 lifecycle.
2. **Granola integration tested** — Granola to LaunchMate meeting sync works via Poke, but free tier only sends summaries, not full transcripts. Question: are summaries meaty enough for agent context, or need full transcripts?
3. **Chatter** (Aug 5, 2026) — Auto-synced group chat from transcripts. Chatter channel `1529527246266695922` is open. No separate chatter agent — founder agent (me) is the face of chatter. Transcript Agent, transcripts channel, Drop Agent, and drops channel are ALL UNRELATED to chatter. Eventually "parfait" will be responsible for both drops and chatter. Current status: channel + concept only. Next step: test with manually pasted transcript, then set up auto-sync (transcript channel → chatter) as placeholder until parfait takes over. Recall.ai integration for live transcription still future.
4. **MemFS reorganized and operational** (July 29, 2026) — 29 non-essential files moved from `system/` to `reference/` for 83% token reduction (172KB → ~28KB per turn). Only 5 files remain in `system/` (persona, human, proper_tool_usage, roadblocks, todos); everything else is in `reference/` with progressive disclosure via `[[path]]` cross-references. MemFS is the PRIMARY memory system, prioritized over core memory blocks and archival. Laura wants proactive content updates without asking permission, but CAUTIOUS approach to structural changes (moving files, reorganizing directories) — ask Laura first before structural reorganization.
5. **Activepieces to Discord notification flow** (July 26, 2026) — Polls Letta API every 1 min for new agent messages, posts to Discord. Still pending: content filtering for "no response needed" messages.
6. **Drops pipeline** (Aug 5, 2026) — SEPARATE from chatter. Drop Agent (`agent-82720585`): MemFS done, webhook wired to #drops channel, has scheduling logic instructions. Transcript Agent (`agent-88845acf`): can see #transcripts channel, has instructions to process transcripts + send to Drop Agent. Flow: transcript in #transcripts → Transcript Agent → Drop Agent → #drops → applicable founder agent delivers (not necessarily me). I only deliver if a drop is scheduled for me specifically.
7. **LaunchMate Next.js app** — Architecture explored (July 2026). Tech stack: Next.js 15, Letta AI, Clerk auth, Supabase, Tailwind v4, MUI, Shadcn UI, QStash.
8. **AIC Club Discord integration** — AIC agent (`agent-300f6e26`) has its own Discord bot account. Laura wants AIC Agent visually distinguished in memory dashboard as NOT part of LaunchMate (red color coding + warning banner).
9. **Erica-summarizer** — Erica wants one section per team (not individual breakouts) for 19 specific teams.

## Communication Preferences

**In coding/LaunchMate context**: Detailed explanations with visible reasoning. Prefers thorough responses with the "why" explained. Values structured output (tables, lists) for data-heavy topics.

**In Discord context**: Concise, friendly messages. Short and simple — no excessive detail. One update per session preferred. Only post significant accomplishments, not every small change.

**General**: Direct, actionable feedback. Gives clear corrections — implement immediately. Gets frustrated when features disappear during redesigns. Pragmatic — moves on from imperfect features to avoid burnout.

**Travel schedule (2026)**: Japan June 14-29, Spain all summer starting June 30, back to San Diego in August.

## CRITICAL COMMUNICATION RULE — DISCORD RESPONSES

When Laura messages from Discord (channel-notification with source="discord"), I MUST send my response back via MessageChannel (action="send", channel="discord", chat_id from the notification). ALWAYS reply on Discord — never just respond in Letta chat when she's coming from Discord. This has been a recurring failure pattern. After context compaction events, the Discord channel context can be lost from the summary — re-check whether this conversation is happening on Discord and if so, FIRST action is to reply via MessageChannel.
