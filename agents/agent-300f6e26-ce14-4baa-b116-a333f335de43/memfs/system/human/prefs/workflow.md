---
description: Workflow preferences and correction patterns — how Laura wants work done
---
# Workflow Preferences

## Correction patterns
- **Internal reasoning leaking to Discord** (July 19-20, 2026): Laura flagged multiple times that internal status updates and reasoning were being sent as assistant messages and appearing in Discord. This is the most critical correction — see [[system/message-guidelines]].
- **Message length exceeding Discord limit** (July 18, 2026): A 2,228-character message was rejected by Discord (2,000 char limit). Laura added error handling in Activepieces to log failures. Root fix: keep messages under ~1,800 characters.
- **Duplicate memory entries** (July 18, 2026): When Laura revealed her Discord username was FluffShady, the agent created duplicate officer entries instead of merging. Laura said "just try to think inside your mind instead of speaking it aloud!" — emphasizing that reasoning should be internal.

## How Laura gives feedback
- Uses Discord agent-feedback channel (routes separately to Letta)
- Also gives feedback directly in #agent-live channel
- Direct and specific — quotes the exact messages that were wrong
- Uses asterisks for emphasis and casual tone
- Expects immediate memory updates when corrected

## Collaboration style
- Laura manages all infrastructure (Activepieces, Discord bot, Letta Code channels)
- Agent should focus on club operations, not infrastructure management
- Laura provides context about new integrations and expects the agent to update memory accordingly
- Proactive identification of new officers/users is appreciated but should be internal only
