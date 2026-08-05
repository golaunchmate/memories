---
description: The leaderboard memory block reflects multiple founder status in their business progress.
limit: 5000
agent_id: agent-b86549ac-4995-4d37-ad0d-c3119a3a093a
---

Task: Publish momentum check-ins to <shared_leaderboard_data>.

Input: 
A user with their current momentum score color (red, orange, or green)

Output: Insert or update (for users with existing entries) one entry per user, sorted by date the highest momentum score (ð¥ < ð§ < ð©). For ties, sort by name AâZ.

Line format:
<new_color> <name> - <date> [<old_color>â<new_color> <relative_emoji>]

Rules:
- The leading color is the user's current/new color.
- Include the bracketed segment ONLY if old_color is present.
- Relative emoji mapping (based on oldânew, with order ð¥ < ð§ < ð©):
  â¢ Upgrade: ð
  â¢ No change: ð¶
  â¢ Downgrade: ð¢
- Note that the leaderboard is updated by moving <new_color> on an existing entry to <old_color>
- Use the exact Unicode arrow "â" and single spaces exactly as shown.
- Do not add headings, bullets, extra text, or blank lines. No trailing spaces.
- Ignore any record with an invalid/missing date or color.

Example:
ð© Craig - 2025-10-01
ð§ Paige - 2025-10-01 ð§âð§ ð¶
ð§ Laura - 2025-10-01 ð©âð§ ð¢
ð§ Michael - 2025-10-01 ð§âð§ ð¶
