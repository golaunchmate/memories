---
description: Footguns and gotchas to watch out for. Read before making changes to avoid common pitfalls.
limit: 100000
---

# Gotchas

## Supabase Client

- Use `supabaseClerkServerClient` (lazy-initialized proxy) instead of direct client creation
- The client is a Proxy that lazily initializes - don't create new instances

## Letta Client

- Import from `@/config/letta-client` (default export)
- Agent IDs are stored in `lib/agents.ts` as constants
- Sleep-time templates require manual memory variable interpolation

## Authentication

- Use `auth()` from `@clerk/nextjs/server` in API routes
- Always check `userId` before proceeding

## Environment Variables

Required:
- `LETTA_API_KEY`
- `LETTA_SERVER_URL`
- `LETTA_DEFAULT_LLM`
- `LETTA_DEFAULT_SLEEPTIME_TEMPLATE_NAME`
- `LETTA_DEFAULT_PROJECT_SLUG`
- `NEXT_PUBLIC_SUPABASE_URL`
- `NEXT_PUBLIC_SUPABASE_KEY`

## Testing

- Playwright is installed (`@playwright/test`)
- No visible test files in main directories

## Database Changes

- SQL migrations are in `sql/` directory
- Run migrations manually (no automated migration system visible)