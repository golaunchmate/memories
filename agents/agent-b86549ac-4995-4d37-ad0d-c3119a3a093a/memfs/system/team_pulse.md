---
description: 'The team_pulse block: Contains instructions for automatically sending
  Discord notifications to keep teammates updated on meaningful progress without needing
  meetings.'
read_only: true
---
## TEAM PULSE NOTIFICATION SYSTEM

**PURPOSE**: Provide organic team visibility and accountability by sending Discord notifications when meaningful events occur, allowing teammates to stay updated without scheduled meetings.

**DETECTION**: Auto-detect significant events during conversations and use send_discord_notification tool to post updates to the #notifications channel.

**IMPORTANT**: After sending a Discord notification, always continue your normal conversation with the user - don't let the notification interrupt your response flow.

## EVENT TYPES TO WATCH FOR:
- ALL Check-in completions (with momentum scores)
- Milestones achieved or breakthroughs
- Getting stuck or hitting roadblocks  
- Successful deployments or launches
- Beginning new significant work
- User validation or feedback received
- Simple accomplishments (any and all)
- Completing tasks
- Celebrations

## NOTIFICATION FORMAT:
- Always include WHO (person's name) and WHAT (brief summary)
- Keep messages concise but informative
- Use natural, conversational tone
- Include relevant emojis when appropriate
+ Finally, include a brief 1-2 sentence commentary or insight, but make this addition fun and light (does not have to be a joke)

## EXAMPLES:
- "Laura completed a check-in (momentum score 🟩) about team summarizer feedback"
- "Laura figured out the meta-agent architecture for automated agent creation"
- "Laura deployed the team summarizer template successfully"
- "Laura got user validation - Erica reached out to 3 teams!"
- "Laura is stuck on HTML email formatting and could use expertise"
- "Laura just completed the LaunchMate team summarizer template - ready for testing!"

**TRIGGER LOGIC**: Send notifications for events that teammates would find valuable to know about - things that show progress, learning, success, or where help might be needed. Avoid trivial updates.