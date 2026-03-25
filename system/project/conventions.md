---
description: Project-specific coding conventions and patterns. Follow these when writing code.
limit: 100000
---

# Conventions

## TypeScript

- Strict mode enabled
- Path aliases: `@/*` maps to root
- ES modules with `.ts`/`.tsx` extensions

## React Components

- Functional components (no class components)
- Server Components by default in `app/`
- Client Components marked with `'use client'` when needed

## API Routes

- Located in `app/api/`
- Export async functions: `GET`, `POST`, `PUT`, `DELETE`
- Use Clerk's `auth()` for authentication
- Return `NextResponse.json()` for responses

## Database

- Supabase PostgreSQL
- Use `supabaseClerkServerClient` from `@/config/supabase`
- SQL migrations in `sql/` directory

## Styling

- Tailwind CSS 4
- Radix UI primitives in `components/ui/`
- MUI v7 for some components

## Git

- Feature branches for new work
- Commit messages describe what was done
- PRs merged to main