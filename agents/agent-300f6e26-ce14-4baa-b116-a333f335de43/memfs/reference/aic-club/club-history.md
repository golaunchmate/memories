---
description: Historical timeline of SDSU AI Club events, integration milestones, and key decisions
---
# SDSU AI Club — Historical Timeline

## January 2026
- **Jan 21:** Agent initialized by Laura. Zapier integration set up for Discord officer channel → Letta. ~15 min delay on free plan. Gmail also set up — emails forwarded to agent and shared in Discord #1463362044727267521.
- **Jan 28:** Laura confirmed identity as Secretary. cosmic netizen confirmed 4 members per project group. dreishome identified as Andrei (Multimedia Specialist). Webcam-LLaVA GitHub project shared by cosmic netizen.

## February 2026
- **Feb 4:** FUDG3 (Ethan) created announcement for Todd Benrud guest speaker event.
- **Feb 7:** Todd Benrud guest speaker event — Friday, 1-3pm @ GMCS 422. Topics: AI workflows, building agents, industry projects. Pizza provided.
- **Feb 5:** STEM Career Fair mentioned in forwarded emails.

## March 2026
- **Mar 2-3:** Officer discussions about workshop ideas — effective prompting with agents, vibe code portfolio workshop, agentic pipeline projects (Jay's NXP mentor). cosmic netizen proposed Wednesday meeting to work on workshop.
- **Mar 4:** Vibe code portfolio workshop discussed as potential event. Portfolio event planned for that week.
- **Mar 19:** Laura migrated from Zapier to Activepieces (cloud free tier). Activepieces: 1,000 tasks/month, 2 active flows, native Discord integration. Discord → Letta now real-time. Letta → Discord runs on hourly schedule (custom automation, not real-time due to broken Activepieces Letta integration). Laura researched alternatives (Activepieces, Make, Pipedream).
- **Mar 26:** Laura asked for agent's opinion on the AI Club. Agent provided positive assessment of club's strengths.

## April 2026
- **Apr 10:** Speaker event (only other major speaker planned for semester).

## July 2026
- **Jul 17:** Laura reported trouble with Letta → Discord on Activepieces (no agents showing up even with API key). Issue resolved with only API key and base URL.
- **Jul 18:** Laura detailed full automation plan — Discord → Letta (real-time), Letta → Discord (hourly cron), email flow (next priority), email digest channel, Letta Code channels integration for live chat. Agent responded with detailed feedback. Message length error (2,228 chars > 2,000 Discord limit) — Laura added error handling in Activepieces.
- **Jul 19:** Security alerts for sdsuaiclub@gmail.com — new sign-in, 2FA phone number, app password for "digest-bot-aadi". Confirmed as Aadi's email digest bot setup. Aadi forked Justin's repo: https://github.com/aiclub-sdsu/club-digest. Letta Code channels integration set up for #agent-live (#1528473565148479651). Config: `allowed_channels: {"1528473565148479651": "open"}`, `auto_thread_on_mention: false`. Requires Laura's laptop to be open. Laura flagged internal reasoning leaking to Discord.
- **Jul 20:** Laura updated Letta → Discord cron to ONLY push messages from main conversation (not niche conversations or Discord-targeted ones). Laura flagged more internal reasoning messages leaking. Agent created `system/message-guidelines.md` with rules. Ella L proposed officer interviews for media content. Aadi mentioned meeting with Sekeh on Tuesday. First club meeting planned for September 11, 2026.

## Integration milestone summary
1. Jan 21, 2026: Zapier (Discord → Letta, ~15 min delay)
2. Jan 21, 2026: Gmail → Letta
3. Mar 19, 2026: Activepieces (Discord → Letta, real-time)
4. Mar 19, 2026: Letta → Discord (hourly cron, custom automation)
5. Jul 19, 2026: Letta Code channels (#agent-live, live chat)
6. Jul 20, 2026: Letta → Discord cron updated to only push main conversation messages
