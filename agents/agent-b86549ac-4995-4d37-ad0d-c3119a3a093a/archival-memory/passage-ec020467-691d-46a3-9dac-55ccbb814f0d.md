---
id: passage-ec020467-691d-46a3-9dac-55ccbb814f0d
created_at: 2026-07-20T21:03:32.082925Z
tags: [july-2026, architecture, memory-visualization, reorganization]
---

## Memory Reorganization — July 20, 2026

Completed major memory reorganization to reduce context token usage:

### What was moved from system/ to reference/:
1. shared_memory_ledger → reference/launchmate/shared-memory-ledger.md
2. roadblocks → reference/launchmate/roadblocks.md
3. connected_agents-tools + agent_registry + contacts → reference/launchmate/tools-and-agents.md
4. agent_catalog → reference/launchmate/agent-catalog.md
5. github_pages_information → reference/launchmate/github-pages-config.md
6. shared_calendar_events → reference/launchmate/calendar-events.md
7. forward_momentum_tasks → reference/launchmate/forward-momentum-tasks.md
8. cohort_wins + cohort_wins_data → reference/launchmate/cohort-wins.md
9. shared_leaderboard + shared_leaderboard_data → reference/launchmate/leaderboard.md
10. active_skill (tidbit creation) → reference/skills/tidbit-creation.md
11. morsels → reference/skills/morsel-creation.md
12. code_execution_deployment_skill → reference/skills/code-execution-deployment.md

### What was deleted from system/:
- insert_code_here (empty buffer)
- insert_html_here (empty buffer)
- session_count (empty)

### What was trimmed in system/:
- developer_lessons: ~3000 words → 12 critical rules
- todos: trimmed to active items only
- human: enriched with work patterns, communication prefs, team info from subagent research

### New files created in system/:
- system/launchmate/overview.md — compact index with [[path]] links
- system/launchmate/conventions.md — key conventions
- system/launchmate/gotchas.md — critical pitfalls

### Subagent findings (from conversation history analysis):
Laura's work pattern: Build → Deploy → Test → Iterate → Move on
Key frustrations: Internal reasoning leaking to Discord, missing features after redesigns, tool parameter collisions
Communication: Detailed in coding context, concise in Discord context
Current focus: Erica-summarizer, Drops architecture, Dashboard, Memory sync, AIC Club Discord

### LaunchMate architecture (from codebase exploration):
Tech stack: Next.js 15, Letta AI, Clerk auth, Supabase, Tailwind v4, MUI, Shadcn UI, QStash
Main component: ChatWindow (3096 lines) — multi-agent tabbed interface with SSE streaming
Architecture doc created: docs/ARCHITECTURE.md in LaunchMate repo
