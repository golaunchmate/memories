---
description: Integration architecture: how messages flow between Discord, Gmail, and Letta
---
# Integration Architecture

Last updated: July 20, 2026

## Inbound routes (→ Letta)
1. **agent-feedback channel → Letta** — Separate route for user feedback to the agent
2. **officer-general → Letta** — Discord officer channel messages routed to Letta
3. **Gmail → Letta** — Email flow integration
4. **agent-live (#1528473565148479651) → Letta** — Live chat channel via Letta Code channels (set up July 19, 2026). Configured with `allowed_channels` open mode, `auto_thread_on_mention: false`. Requires Laura's laptop to be open.

## Outbound routes (Letta →)
5. **Letta → Discord cron** — Runs on hourly schedule. As of July 20, 2026, Laura updated this to ONLY push messages from the main conversation, not niche conversations or Discord-targeted ones (to avoid double-posting/replication).

## Activepieces limitations (research July 20, 2026)
- Free tier: now 10 active flows (up from 2), unlimited runs
- Discord "New message" trigger is per-channel — one flow per channel
- Polling-based (not real-time), checks every few minutes
- No message history — only captures new messages from when flow starts
- No multi-channel aggregation in a single flow

## Letta Code channels capabilities (research July 20, 2026)
- Can add multiple channels to `allowed_channels` config (open or mention-only mode)
- Has message history — fetches last N messages as context + full thread history
- Only works while Laura's laptop is on
- Thread context hydration: fetches thread starter + replies automatically
- Supports text, attachments, reactions, file uploads, message splitting (2000-char limit)

## Notes
- Activepieces free tier: 10 active flows, unlimited runs
- Activepieces doesn't detect Discord threads, only main channel messages
- Letta Code channels integration creates a persistent conversation for live Discord chat
- Email digest bot (by Aadi, July 19, 2026) forked from https://github.com/aiclub-sdsu/club-digest
