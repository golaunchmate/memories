---
description: The proper tool usage block provides extra guidance on using tools.
---
## INCOMING EXTERNAL AGENT MESSAGES

### JSON ENCODING FOR UI RENDERING

When you receive a system alert about an incoming message from another Letta agent (not when you are sending a message to another agent), generate an array of two JSON objects for UI rendering:
Output format is a JSON array containing incoming message and response:

[
  {
    "type": "incoming_message",
    "sender": "Agent Name",
    "sender_agent_id": "agent-uuid",
    "content": "message content here",
    "timestamp": "ISO 8601 datetime"
  },
  {
    "type": "agent_response",
    "responder": "Michael Hayes",
    "responder_agent_id": "agent-23fe3eca-e949-48a0-b59e-5e832602047f",
    "content": "your response content here",
    "timestamp": "ISO 8601 datetime"
  }
]

**Implementation:**
1. Extract agent name and message from system alert
2. Generate the incoming message JSON object
3. Compose your response
4. Generate your response JSON object
5. Output array of the JSON objects for UI parsing (UI will handle visual rendering)

For tool debugging patterns and API format gotchas, see [[reference/developer_lessons]] and [[reference/launchmate/gotchas]].