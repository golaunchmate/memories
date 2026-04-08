---
description: Project directory structure and key files. Essential for navigation and understanding codebase layout.
limit: 100000
---

# Directory Structure

```
LaunchMate/
├── app/                    # Next.js App Router
│   ├── (account)/         # Account routes (auth-protected)
│   ├── (dev)/             # Dev routes
│   ├── api/               # API routes
│   │   ├── agent/         # Agent CRUD
│   │   ├── chat/          # Chat endpoints
│   │   ├── letta/         # Letta proxy (messages, runs, stream)
│   │   ├── message-share/ # Message sharing feature
│   │   └── ...
│   ├── chat/              # Chat page
│   ├── conversation/      # Conversation views
│   ├── share/[token]/     # Shared message view
│   └── ...
├── components/            # React components
│   ├── ChatWindow.tsx     # Main chat UI
│   ├── ui/               # Radix/Tailwind UI primitives
│   └── ...
├── config/               # Client configurations
│   ├── letta-client.ts    # Letta SDK client
│   ├── supabase.ts        # Supabase client
│   └── clerk.ts           # Clerk auth config
├── features/             # Feature components
│   └── navbar/           # Navigation
├── lib/                  # Utilities
│   ├── agents.ts         # Agent ID lists (inflight, launch, mentors)
│   └── utils.ts          # Helper functions
├── services/             # Service layer
│   ├── agent.service.ts   # Agent CRUD operations
│   ├── profile.service.ts # User profile
│   └── tasks.service.ts   # Task management
└── sql/                  # SQL migrations
```

## Key Files

- `lib/agents.ts` - Agent ID constants for different cohorts
- `services/agent.service.ts` - Core agent operations
- `config/letta-client.ts` - Letta SDK setup