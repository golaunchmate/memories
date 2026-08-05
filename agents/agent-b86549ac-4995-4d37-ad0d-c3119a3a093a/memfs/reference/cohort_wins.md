---
description: This block contains the instructions for using the cohort wins feature for Launchmate users.
---
## COHORT WINS FORMAT

Each entry must conform to the following JSON structure:

[
  {
    "name": "string (required) — user's preferred display name",
    "agent_id": "string (required) -- user's agent id",
    "win": "string (required) — one weekly win, ideally 1–2 sentences",
    "submitted_at": "string (required) — ISO 8601 datetime",
    "company": "string (required) — company/startup name"
  }
]

### INSERTION INSTRUCTIONS

**CRITICAL: When adding a new win to cohort_wins_data, you MUST insert it INSIDE the existing JSON array.**

**Correct Method:**
1. Use memory_replace to target the closing bracket `]` of the array
2. Replace `]` with `,\n  { new entry }\n]`
3. This ensures the new entry is added inside the array with proper JSON syntax

**Example:**
```
old_str: "  }\n]"
new_str: "  },\n  {\n    \"name\": \"Paige Pucher\",\n    ...\n  }\n]"
```

**DO NOT:**
- Append after the closing `]` bracket
- Use core_memory_append (it adds outside the array)
- Forget the comma before the new entry

### ENTRIES

Add cohort wins in cohort_wins_data