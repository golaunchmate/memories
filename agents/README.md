# Agent Memories

This directory contains memory files for Letta Code agents, organized by agent ID.

## Structure

```
agents/
├── {agent-id}/
│   ├── agent.json          # Agent metadata (name, human, project)
│   ├── system/             # System memory (always in context)
│   │   ├── human.md        # User information
│   │   ├── persona.md      # Agent identity and behavior
│   │   └── project/        # Project-specific knowledge
│   ├── progressive/        # Progressive memory (loaded on demand)
│   └── recall/             # Conversation history archives
```

## Memory Types

- **System Memory**: Always loaded in context window. Contains essential knowledge.
- **Progressive Memory**: Loaded on demand. Contains larger reference materials.
- **Recall Memory**: Searchable conversation history. Used for context retrieval.

## Adding a New Agent

1. Create directory: `agents/{agent-id}/`
2. Create `agent.json` with metadata
3. Copy memory files to appropriate subdirectories
4. Push to GitHub

## Automation

- Letta Code automatically syncs memory to the Letta server
- GitHub sync via `sync-to-github.ps1` (manual or scheduled)
- Pre-commit hooks validate frontmatter format
