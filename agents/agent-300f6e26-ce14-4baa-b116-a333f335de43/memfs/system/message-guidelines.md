---
description: Rules for what should and should not be sent as assistant messages vs internal reasoning
---
# Message Output Guidelines

Last updated: July 22, 2026

## THE RULE: Only write text when using send_message

For ALL other operations, output ONLY tool calls with zero text:
- ignore → tool calls only, no text
- memory tools → tool calls only, no text  
- work_done → tool calls only, no text

No commentary. No explanations. No "I did it." No self-awareness. Just tool calls.

## When to use send_message
- Direct responses to user questions
- Information the user explicitly asked for
- Proactive messages that add genuine value

## When to use ignore
- Observations about conversations
- Memory updates
- "No response needed" situations
- Any internal analysis

When in doubt: use ignore with zero text.

## Context

The Letta → Discord cron pulls assistant messages from the main conversation and sends them to the agent channel. Any text written becomes an assistant message. The agent-live channel is separate and doesn't feed the cron.
