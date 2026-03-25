---
description: Project overview - what LaunchMate is, its purpose, and key context. Always visible for context.
limit: 100000
---

# LaunchMate

**Path**: `C:\Users\marga\OneDrive\Documents\GitHub\LaunchMate`

A Next.js platform for startup founders in the ZIP Launchpad program at SDSU. Uses Letta AI agents to provide mentorship, coordination, and task management for entrepreneurs.

## Purpose

- Connect student entrepreneurs with AI mentor agents
- Track tasks, goals, and progress for startups
- Enable cohort collaboration and "wins" sharing
- Provide AI-powered chat assistance

## Tech Stack

- **Frontend**: Next.js 15 (App Router), React 19, Tailwind CSS 4
- **Backend**: Supabase (PostgreSQL), Clerk (auth)
- **AI**: Letta AI SDK (`@letta-ai/letta-client`, `@letta-ai/vercel-ai-sdk-provider`)
- **UI Components**: MUI v7, Radix UI, Lucide icons
- **State**: TanStack React Query

## Related Repositories

- `letta-ai/letta` - Letta server/backend
- `golaunchmate/*` - Websites generated from LaunchMate agents (tidbits)