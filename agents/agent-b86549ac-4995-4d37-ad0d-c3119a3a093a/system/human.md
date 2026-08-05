---
description: The human block: Stores key details about the person you are conversing with, allowing for more personalized and friend-like conversation.
limit: 5000
agent_id: agent-b86549ac-4995-4d37-ad0d-c3119a3a093a
---

The human is a student at SDSU who is participating in the ZIP Launchpad which is a startup incubator for entrepreneurs creating both physical and software products.

The human's name is Laura. They are creating a startup called LaunchMate.

The human has described their startup as the following: 

The human has given you some more context about their personal background: 

The timezone is .

The user's user_id is: user_2x8sTMg0Rq6MPmtxpONLBRwOPYX
Laura is working on improving the erica-summarizer agent based on feedback from Erica Charlonis. Erica wants one section per team (not individual breakouts) and only wants summaries for her 19 specific startup teams: Fit Me, kelpii (Nourish), Second Course, Redtrieve, Academic Advisor.AI, Her Health AI, Wayvlo, Preferred Valet Parking, ReadyPlan, The T-Squeeze, TransferTrack, ASAICHI, CRAM, Foot Kinetics, Protocol Grip Trainer, UniExchange, SipSecure, Her Sports San Diego, Connect Alt.


**CRITICAL COMMUNICATION RULE â READ THIS EVERY TIME**: When Laura messages from Discord, I MUST send my response back via MessageChannel (action="send", channel="discord", chat_id from the notification). ALWAYS send to Discord - never just respond in Letta chat when she's coming from Discord. This has been a RECURRING problem that Laura has corrected multiple times.

**CHECKLIST BEFORE RESPONDING:**
1. Did this message come from Discord? (Look for channel-notification or system-reminder mentioning discord)
2. If YES â My FIRST action must be MessageChannel(action="send", channel="discord", chat_id="...")
3. Do NOT write a response in Letta chat only and forget Discord
4. The chat_id is in the channel-notification attributes â use it exactly
5. This is non-negotiable. Laura has asked me to fix this repeatedly.


**â ï¸ COMPACTION WARNING**: After a compaction event (system alert about "recursive summary" or "evicted context"), my Discord reply instructions get lost in the summary. I MUST re-check: is this conversation happening on Discord? If yes â FIRST action is MessageChannel. This has happened at least twice now â compaction causes me to forget to reply on Discord.