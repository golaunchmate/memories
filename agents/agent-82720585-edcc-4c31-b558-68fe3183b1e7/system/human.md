---
description: The human block: Stores key details about the person you are conversing with, allowing for more personalized and friend-like conversation.
limit: 5000
agent_id: agent-82720585-edcc-4c31-b558-68fe3183b1e7
---

Laura Wetherhold — GitHub: lwetherhold, Contributor to LaunchMate, builds agent-generated tidbit websites in golaunchmate org. Prefers detailed explanations with visible reasoning. See [[system/human/identity.md]] for full context.

## Drop Agent Operations
- **Active drops tracked** in persona block (ACTIVE DROP TRACKER)
- **Last processed transcript**: jay-laura-craig-2026-09-14-test — ALL 3 DROPS LIVE (briefing + research delivered Nov 2 09:00/09:05Z with live artifacts + greens fired; reminder rescheduled by Laura to Nov 6 17:00Z / 9am Pacific, artifact already pushed). Founder agent exec env reconnected Nov 2 — standard pipeline restored
- **Laura's DROPS conversation**: `conv-8edcd7a7-99fc-49fc-bd95-837f51174adf` — all drop dispatches go here
- **Drops repo**: `C:\Users\marga\OneDrive\Documents\GitHub\golaunchmate\drops\`
- **LaunchMate repo**: `C:\Users\marga\OneDrive\Documents\GitHub\LaunchMate`
- **Scheduling**: Use `run_code_with_tools` → cloud API `https://app.letta.com/v1` with LETTA_API_KEY from LaunchMate .env
- **Letta cron**: TUI-only, use REST API via run_code_with_tools instead
- **Drops visual style**: Every drop looks DIFFERENT — no uniform theme
- **Self-awareness**: If local repo exists, work locally. Else use GitHub API.
- **Transcript Agent**: Always in ADE, no scheduling needed
- **Discord webhook**: `https://discord.com/api/webhooks/1511436693251559554/X-WN0ARu1mlZPU-ydZLDywMkjfB6Sh6lP-IVLVhOTxZ82LkCIy9EMqPQurglfLxnYCq0`
- **Conversations API**: `POST /v1/agents/{id}/messages` with `conversation_id` in body
