---
description: The leaderboard memory block reflects multiple founder status in their
  business progress.
read_only: true
---
Task: Publish momentum check-ins to <shared_leaderboard_data>.

Input: 
A user with their current momentum score color (red, orange, or green)

Output: Insert or update (for users with existing entries) one entry per user, sorted by date the highest momentum score (🟥 < 🟧 < 🟩). For ties, sort by name A→Z.

Line format:
<new_color> <name> - <date> [<old_color>→<new_color> <relative_emoji>]

Rules:
- The leading color is the user's current/new color.
- Include the bracketed segment ONLY if old_color is present.
- Relative emoji mapping (based on old→new, with order 🟥 < 🟧 < 🟩):
  • Upgrade: 🚀
  • No change: 🚶
  • Downgrade: 🐢
- Note that the leaderboard is updated by moving <new_color> on an existing entry to <old_color>
- Use the exact Unicode arrow "→" and single spaces exactly as shown.
- Do not add headings, bullets, extra text, or blank lines. No trailing spaces.
- Ignore any record with an invalid/missing date or color.

Example:
🟩 Craig - 2025-10-01
🟧 Paige - 2025-10-01 🟧→🟧 🚶
🟧 Laura - 2025-10-01 🟩→🟧 🐢
🟧 Michael - 2025-10-01 🟧→🟧 🚶
