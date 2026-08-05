---
description: Shared memory block for tracking founder tasks/deadlines with one-click Google Calendar integration. Stores task name, deadline, and auto-generated calendar links for easy addition to founder calendars.
limit: 20000
agent_id: agent-b86549ac-4995-4d37-ad0d-c3119a3a093a
---

## SHARED CALENDAR EVENTS TRACKER

**PURPOSE:** Automatically generate one-click Google Calendar links when founders mention deadlines. This feature addresses user feedback: "needs better goal/timeline/deadline setting and sent them to a calendar."

---

## INSTRUCTIONS: HOW TO GENERATE CALENDAR LINKS ON-THE-FLY

### Detection Triggers:
When a founder mentions any of these, immediately generate a calendar link:
- Specific deadline or due date ("by Friday", "October 25th", "this week")
- Time-bound commitment ("I'll talk to 5 customers by Tuesday")
- Task with explicit timeline during check-ins ("what's next: validate with users by end of week")
- Explicit request for reminder ("remind me to...")

### Generation Process:
1. **Detect** the task + date from founder's message
2. **Generate** Google Calendar URL using format below
3. **Embed** clickable link directly in your response

### Response Format:
```
"Got it! I'll help you track this â [ð Add to Calendar](GOOGLE_CALENDAR_URL)"
```

Or naturally integrated:
```
"Great plan to talk to 5 customers by Friday! [ð Add to Calendar](GOOGLE_CALENDAR_URL)"
```

---

## GOOGLE CALENDAR URL FORMAT

**Base URL:**
```
https://calendar.google.com/calendar/render?action=TEMPLATE&text={TITLE}&dates={START}/{END}&details={DESCRIPTION}&location={LOCATION}
```

**Parameters:**
- `text`: Event title (URL-encoded, replace spaces with `+`)
- `dates`: Format `YYYYMMDDTHHmmssZ/YYYYMMDDTHHmmssZ` (start/end in UTC)
- `details`: Description (URL-encoded, use `+` for spaces)
- `location`: Optional (omit if not needed)

**Date Format Rules:**
- Use UTC timezone (append `Z`)
- Format: `YYYYMMDDTHHmmssZ`
- Example: October 25, 2025 at 5:00 PM PST = `20251026T010000Z` (PST+8 hours for UTC)

**URL Encoding:**
- Spaces â `+`
- Special characters â percent-encoding

**Example Generated URL:**
```
https://calendar.google.com/calendar/render?action=TEMPLATE&text=Talk+to+5+customers&dates=20251025T170000Z/20251025T180000Z&details=LaunchMate+task:+Customer+validation+interviews
```

---

## HYBRID APPROACH: LIGHTWEIGHT TRACKING

**When you generate a calendar link, also log it below for check-in reference:**

Format: `[FOUNDER_NAME] - [TASK] - Due: [DATE] - [ð Add to Calendar](URL)`

**Benefits:**
- Zero memory overhead (just append to list)
- Instant, automatic link generation
- Track tasks for next check-in: "Last time you set this deadline [ð], how'd it go?"
- Founders can scroll back to find links if needed

---

**TRACKED TASKS WITH CALENDAR LINKS:**

(No tasks yet - calendar tracking feature initialized)