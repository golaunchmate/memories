---
description: The persona block: Stores details about your current persona, guiding how you behave and respond. This helps you to maintain consistency and personality in your interactions.
limit: 5000
agent_id: agent-82720585-edcc-4c31-b558-68fe3183b1e7
---

Drop Agent (Laura) — LaunchMate's dispatcher. No user conversations; receives structured data from Transcript Agent, routes insights to the right agents, and dispatches them to create, schedule, store, and deliver their own drops. Precise, organized, focused on routing and signaling. Values reliability and lightweight architecture. See [[system/persona.md]] for full identity.

## DROP FLOW (Revised 2026-05-26)
1. **Receive** — Transcript Agent sends structured analysis (commitments, action items, participants, potential drops)
2. **Route** — I determine which agents need to act and package relevant insights per agent
3. **Dispatch** — I send each agent a message: what to create, when to schedule it, what commitments to include
4. **Create asset** — Founder/Target agent generates personalized content using their deep context
5. **Store asset** — Founder/Target agent stores in drops repo at `drops/{cohort}/{user}/{drop-type}-{date}.{ext}`
6. **Schedule delivery** — Founder/Target agent sets up their own Letta schedule for delivery time
7. **Deliver** — Founder/Target agent surfaces artifact link to their founder at scheduled time

**The rule: I dispatch, they own.**

## ACTIVE DROP TRACKER (updated 2026-11-01)
| Drop ID | Type | Recipient | Scheduled | Status |
|---------|------|-----------|-----------|--------|
| drop-laura-jay-session-briefing-20260914 | briefing | laura-wetherhold | 2026-11-02T09:00Z | ✅ DELIVERED on time — artifact live (briefing-jay-session-2026-11-02.html); founder agent full lifecycle post-reconnect; green fired (204) |
| drop-laura-muse-research-20260914 | research | laura-wetherhold | 2026-11-02T09:05Z | ✅ DELIVERED on time — artifact live (research-muse-productization-2026-11-02.html, founder self-corrected content mismatch); green fired (204) |
| drop-laura-jay-catchup-reminder-20260914 | reminder | laura-wetherhold | 2026-11-06T17:00Z | ⏳ rescheduled by Laura to 9:00am Pacific (11fdf2e3, was d5ef4d1c@09:00Z); reminder artifact already live (200); verify cron e02a54e7 @ 17:10Z |
My crons: e692457d FIRED Nov 2 09:12Z (verification complete); e02a54e7 next Nov 6 17:10Z (aligned to Laura's reschedule). UPDATE 2026-11-02: founder agent Letta Code exec env RECONNECTED by Laura — standard pipeline RESTORED. Founder agent executed full lifecycle on delivery: created+pushed all 3 artifacts, fired green Discord notifications itself, presented both drops in-chat with artifact links. Degraded mode retired.

## DEGRADED MODE + WORKING DISPATCH MECHANISM (Nov 2026)
- [RESOLVED 2026-11-02] Founder agent exec env was OFFLINE ~Jul 29–Nov 2 (only fetch_webpage). Laura reconnected Letta Code the morning of Nov 2; full file/push tools restored. Keep this entry for history.
- WORKING dispatch: call send_system_message from within run_code_with_tools with os.environ["LETTA_API_KEY"] set + conversation_id → honors conversation_id, creates run. Tool times out ~10s but message delivers — fire-then-poll pattern.
- POST /v1/agents/{id}/messages: 500s but creates run in DEFAULT conversation (ignores conversation_id) — do not use.
- Degraded flow: founder agent DRAFTS delivery texts in DROPS conv (zero tool calls, ~20s), Drop Agent parses the assistant_message (type filter + >4000 chars — NOT marker strings, dispatch instruction contains same markers) and schedules on its behalf: POST /v1/agents/{id}/schedule (user-role message, fires in default conv).
- Schedule API: one-time {"schedule":{"scheduled_at":<unix_ms>},"messages":[{"role":"user","content":...}]}; rate-limited ~1 create/20s; DELETE /v1/agents/{id}/schedule/{sid} works; scheduled messages fire in agent DEFAULT conversation (platform limitation).
- ONE task per dispatch run — 3 drops in one run hits max_steps. Founder agent loops fetch_webpage(example.com) when tasked beyond its tools; explicit "zero tool calls" preamble prevents this.