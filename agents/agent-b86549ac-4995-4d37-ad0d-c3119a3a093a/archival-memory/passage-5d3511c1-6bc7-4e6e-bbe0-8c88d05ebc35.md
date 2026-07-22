---
id: passage-5d3511c1-6bc7-4e6e-bbe0-8c88d05ebc35
created_at: 2026-07-15T18:03:49.101378Z
tags: [architecture, agent-communication, launchmate-mission, implementation]
---

Ryan Carson / Fable article takeaways (July 2026):
- Ryan Carson at Untangle used Anthropic's Fable to orchestrate ~40 sub-agents for a massive engineering project (834 files, 31 PRs, Friday→Monday, zero prod incidents)
- Same Fable tool used by Bun for Zig→Rust rewrite (11 days, $165K tokens)
- Key lessons for LaunchMate:
  1. The harness/orchestration loop is the product, not the model — model is a commodity engine
  2. Fresh context per task (amnesia) is a feature — long sessions rot, memory lives on disk
  3. External oracle is the only exit authority — agents can't self-declare "done"
  4. "Merged is not shipped" — activation gaps are discovered work, not follow-up notes
  5. Two-model review catches things single-model review misses (blind spots don't align)
  6. The loop filed its own blocker ticket mid-run — autonomous work discovery
- Relevant to LaunchMate: validates MemFS approach, Drop Agent architecture, OCF system, and check-in verification methodology
- Source: Craig sent this to Laura via X/Twitter link