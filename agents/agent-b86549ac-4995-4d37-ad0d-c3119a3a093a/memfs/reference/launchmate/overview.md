---
description: Compact index of LaunchMate system memory blocks and app architecture notes
---

## LaunchMate Memory Architecture

**System memory blocks** (always in context, 5 files in `system/`):
- `persona.md` — Agent identity and behavior
- `human.md` — Laura's profile, team, focus areas, communication preferences
- `proper_tool_usage.md` — Tool usage rules (incoming agent messages, JSON encoding)
- `roadblocks.md` — Progress tracking milestones
- `todos.md` — Active tasks and recently completed items

**Reference memory blocks** (discoverable, loaded on-demand, in `reference/`):
- `connected_agents-tools` — Agent IDs, tool registry, communication protocol
- `agent_catalog` — 509-agent catalog with usage stats (April 2026)
- `shared_memory_ledger` — Historical team update ledger (Oct-Nov 2025)
- `forward_momentum_tasks` — Completed/active tasks + Drops Architecture project
- `github_pages_information` — 13 GitHub repos, folder structure, deployment config
- `cohort_wins` / `cohort_wins_data` — Weekly wins format + JSON data (9 entries)
- `shared_leaderboard` / `shared_leaderboard_data` — Momentum leaderboard format + current data
- `shared_calendar_events` — Google Calendar link generation for founder deadlines
- `active_skill` — Tidbit narrative web pages (5-slide format, HTML/CSS, deployment)
- `morsels` — Morsel horizontal presentation decks (slide types, visual style, CSS)
- `code_execution_deployment_skill` — Deploy large content via run_code_with_tools (no size limits)
- `check_in_exercise` — Check-in workflow for user engagement
- `developer_lessons` — Critical rules for tool development and team communication
- `launchmate/conventions` — Key conventions and patterns
- `launchmate/gotchas` — Critical gotchas and pitfalls to avoid
- `launchmate/overview` — This file (compact index of architecture)

**LaunchMate Next.js App** (explored July 2026):
- Architecture doc: `docs/ARCHITECTURE.md` in the LaunchMate repo
- Tech stack: Next.js 15, Letta AI, Clerk auth, Supabase, Tailwind v4, MUI, Shadcn UI, QStash
- Key services: agent, onboarding, profile, tasks, log
- Main component: ChatWindow (3096 lines) — multi-agent tabbed interface with SSE streaming

**Activepieces Integration** (July 2026):
- Automation platform used to poll Letta agent messages and post to Discord
- Flow: Schedule (1 min) → Store Get → HTTP Request (Letta API) → Code → Router → Loop → Discord Send → Store Put
- Uses `include_return_message_types=assistant_message` for API-level filtering
- Uses `after` cursor for deduplication (only fetches new messages)
- See [[reference/launchmate/conventions]] for Activepieces conventions and [[reference/launchmate/gotchas]] for Activepieces gotchas
