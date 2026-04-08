---
description: Build, dev, and lint commands for LaunchMate. Reference when running project commands.
limit: 100000
---

# Commands

## Development

```bash
npm run dev    # Next.js dev server with Turbopack
bun dev        # Alternative using Bun
```

## Build & Deploy

```bash
npm run build  # Production build
npm run start   # Start production server
npm run lint    # ESLint check
```

## Scripts

```bash
npm run push:nudges     # Push mentor nudges (ts-node)
npm run test:linkAgent  # Test agent linking
```

## Package Manager

Project uses npm but can also use Bun. Turbopack is enabled for dev.