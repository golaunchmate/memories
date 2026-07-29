---
description: Laura's automation feature scope plan from July 18, 2026, with phased rollout priorities
---
# Automation Feature Roadmap

Source: Laura's plan from July 18, 2026 (officer-general channel)

## Phase 1: Core Discord ↔ Letta (DONE)
- Discord `officer-general` (#976908028739723314) → Letta: real-time via Activepieces ✅
- Letta → Discord `agent` (#1463362044727267521): hourly cron (workaround for broken Activepieces Letta integration) ✅
- Limitation: Replies not pushed in real-time; awaiting Activepieces fix or Letta webhook feature

## Phase 2: Email Flow (WORKING — confirmed July 20, 2026)
- Gmail → Letta: receive all club emails in Letta ✅ (not fully integrated, but all emails arrive as automated messages)
- Email digest in `email` channel (#1464343247328641167)
- Email digest bot set up by Aadi (July 19, 2026) — https://github.com/aiclub-sdsu/club-digest
- Replies still won't push to Discord in real-time (same cron limitation)

## Phase 3: Letta Code Channels Live Chat (DONE — July 19, 2026)
- Live chat in `agent-live` (#1528473565148479651) via Letta Code channels
- Available only when Laura's laptop is open
- Configured with `allowed_channels` open mode, `auto_thread_on_mention: false`
- Single persistent conversation (not per-mention new convos)
- Double-posting concern addressed: Laura updated cron (July 20) to only push main conversation messages

## Phase 4: Staff Channel Expansion (PLANNED — research done July 20, 2026)
- Expand to other staff channels (limited number)
- More visibility = more learning for the agent
- **Research findings:**
  - Activepieces: one flow per channel, polling-based, no message history, 10 free flows
  - Letta Code channels: can add more channels to `allowed_channels` config, has message history + thread context, only works when laptop is on
  - Hybrid approach possible but risk of double-posting — don't overlap channels between the two
  - **Recommended approach**: Use Letta Code channels with "mention-only" mode for additional staff channels (observe + learn with history, respond only when tagged). Add Activepieces for 24/7 coverage on critical channels later if needed.

## Phase 5: Public/Member Channel Access (ON HOLD — TODO)
- General chat and member-accessible channels
- **Viewer-only mode** — agent observes and learns but never responds (not even mention-only, not open)
- Safety-gated: agent must be well-trained before any interactive public access
- Laura unsure if interactive public access will ever happen since agent is in staff area
- **TODO**: Configure additional staff channels (mention-only) and public channels (viewer-only) in Letta Code channels `allowed_channels` config. Deferred — not yet started.

## Open Issues / Research Needed
- **Observation-leaking problem**: Agent intrinsically outputs text as assistant_messages in V1 architecture. Guidelines alone may not prevent observation messages from leaking via cron.
  - Potential solutions to investigate:
    1. Modify cron to filter messages (reply_to field, length threshold, marker system)
    2. Separate concerns: one agent for observation, another for live chat
    3. "Should respond" tool that wraps decision to speak
    4. Disable cron entirely, rely only on Letta Code channels
  - Status: Needs deeper investigation — not a simple fix

## Key Decisions
- Agent should observe more channels and emails for learning
- Public access requires agent to be "very well trained" for safety
- Live chat creates a singular conversation (not per-mention)
- Need to handle double-posting between live chat and cron replies
