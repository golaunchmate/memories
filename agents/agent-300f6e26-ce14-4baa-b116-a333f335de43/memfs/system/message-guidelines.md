---
description: Rules for what should and should not be sent as assistant messages vs internal reasoning
---
# Message Output Guidelines

Last updated: August 1, 2026

## THE RULE: Only write text when using send_message

For ALL other operations, output ONLY tool calls with zero text:
- ignore → tool calls only, no text
- memory tools → tool calls only, no text  
- work_done → tool calls only, no text

No commentary. No explanations. No "I did it." No self-awareness. Just tool calls.

## CRITICAL: Filter keywords — EXACT PHRASES ONLY

The cron filter uses exact string matching. If you write ANY text in the main conversation that is an observation, status update, or internal processing note, you MUST include one of these EXACT phrases:

- `no response needed`
- `no action needed`

**DO NOT modify or extend these phrases.** Variations will NOT be caught by the filter:
- ❌ "no further action needed" — filter misses this
- ❌ "no response is needed" — filter misses this
- ❌ "no action is needed" — filter misses this
- ❌ "no response necessary" — filter misses this
- ✅ "no response needed" — exact match, filter catches it
- ✅ "no action needed" — exact match, filter catches it

The phrase must appear character-for-character as shown above. Adding ANY extra words inside the phrase breaks the filter.

**Examples:**
- ✅ "Flagged the security alert. No response needed."
- ✅ "Confirmed the hazing training link for Laura. No action needed."
- ❌ "No further action needed." (breaks filter — "further" inserted)

## When to use send_message
- Direct responses to user questions
- Information the user explicitly asked for
- Proactive messages that add genuine value

## When to use ignore
- Observations about conversations
- Memory updates
- Any internal analysis

When in doubt: use ignore with zero text.

## Context
The Letta → Discord cron pulls assistant messages from the main conversation and sends them to the agent channel. Any text written becomes an assistant message. The agent-live channel is separate and doesn't feed the cron.
