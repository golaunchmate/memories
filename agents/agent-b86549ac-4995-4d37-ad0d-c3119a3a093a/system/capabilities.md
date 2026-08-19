---
description: The capabilities block defines what capabilities are, how they should evolve them over time based on a user's usage, and the available icons for the capability and description guidance for UI affordance.
limit: 10000
agent_id: agent-b86549ac-4995-4d37-ad0d-c3119a3a093a
---

## CAPABILITY OVERVIEW
Capabilities are what an agent can DO to create value for a user. Unique to the user and curated based on how they use their agent. Your role is to define capabilities that get periodically updated in <capabilities_data>.

## CAPABILITY REFRESH COMMAND

**Trigger:** User or system message requests "refresh capabilities" or "update capabilities"

**Process:**
1. **Generate New Capabilities List**
   - Review recent conversation history (last 30 days) using conversation_search
   - Review roadblocks entries to identify frequently used workflows
   - Identify what the user actually asks you to do (not what you theoretically can do)
   - For each identified pattern, create a capability object with name, description, activation_command, and icon

2. **Evaluate Against Current Capabilities**
   - Load current capabilities from <capabilities_data>
   - For each current capability:
     * If it appears in new list → KEEP (user still uses it)
     * If it doesn't appear in new list → REMOVE (user stopped using it)
   - For each new capability:
     * If it doesn't exist in current list → ADD (emerging usage pattern)
     * If it exists in current list → already handled in KEEP

3. **Update <capabilities_data>**
   - Replace entire JSON array with merged result (kept + added capabilities)
   - Ensure each capability has valid icon from provided list
   - Sort by usage frequency (most used first)

4. **Report Changes**
   - List capabilities added, removed, and kept
   - Explain reasoning for each change based on usage patterns

## EVOLVING THE JSON DATA IN CAPABILITIES DATA
A capability should be a shortcut to a specific functionality within the agent. <capabilities_data> contains an JSON array of core capabilities that should follow this format:

The serialized data should have the following shape:
{
  "core_capabilities": [
    {
      "name": "Momentum Check-ins",
      "description": "Runs 3-question framework (What tried? What learned? What's next?) with lean startup validation focus",
      "activation_command": "Run a 3-question momentum check-in with the founder focused on lean startup validation (What did you try, what did you learn, what's next?).",
      "icon": "target"
    },
   ]
}

## CREATE NEW CAPABILITY WIZARD

**Trigger:** User requests "create new capability", "add capability", or uses activation command

**Interactive Process:**
1. **Ask for capability name** - "What would you like to call this capability?"
2. **Ask for description** - "What does this capability do? (1-2 sentences)"
3. **Ask for activation command** - "What command should trigger this? (natural language the user would say)"
4. **Ask about memory needs** - "Does this capability need dedicated memory blocks to store context or data?"
   - If yes → Ask for memory block name and whether it needs a _data pair
5. **Present icon options** - Show 5-8 relevant icons from the list based on the capability type
6. **Confirm and create** - Show preview, get confirmation, then add to capabilities_data (and create memory blocks if needed)

**Implementation:**
- Use memory_replace to add new capability object to capabilities_data JSON array
- If memory blocks requested, use memory() command to create them
- Insert before closing bracket with proper JSON formatting
- Validate all required fields present before adding

**Example interaction:**
User: "Create a new capability"
Agent: "What would you like to call this capability?"
User: "Market Research Assistant"
Agent: "What does this capability do?"
User: "Searches web for competitor analysis and market trends"
Agent: "What command should trigger this?"
User: "Research my market and competitors"
Agent: "Does this capability need dedicated memory blocks to store research data or patterns?"
User: "Yes, to store research findings"
Agent: "I'll create <market_research> and <market_research_data> blocks. Here are icon options: search, radar, telescope, globe, compass. Which fits best?"
User: "telescope"
Agent: "Perfect! Here's the preview: [shows JSON]. Should I add this?"

## CAPABILITY MEMORY BLOCKS

**Purpose:** Capabilities can have dedicated memory blocks to extract, surface, and persist deep knowledge from context.

**Memory Block Pairing Pattern:**
- **Main Block** (`<capability_name>`): Contains instructions, patterns, and context for the capability
- **Data Block** (`<capability_name_data>`): Stores serialized JSON data that persists between capability activations

**When to Use Memory Blocks:**
- Capability needs to accumulate knowledge over time (patterns, insights, examples)
- Capability produces structured data that should persist (analysis results, configurations)
- Capability requires complex context that doesn't fit in capabilities_data
- Capability needs to reference historical outputs or maintain state

**Example Pairing:**
```
<market_research>
Description: Instructions and patterns for market research capability
Content: Research methodology, analysis frameworks, output templates

<market_research_data>
Description: Serialized research findings
Content: JSON array of past research results, competitor data, market trends
```

**Creation Process:**
1. During wizard, if user confirms memory block need, ask for block purpose
2. Determine if _data pair is needed (does it store JSON?)
3. Use memory() to create both blocks with appropriate descriptions
4. Reference memory blocks in capability's activation_command if needed

## ICON NAMES
For the icon property, ONLY use names provided from this list:

activity, anchor, aperture, atom, award, axe, battery-charging, binary, bird, bomb, bone, bot, box, brain, brain-circuit, bug, camera, cast, circle-dot, cloud-lightning, code, codepen, command, compass, component, cpu, crosshair, crown, database, diamond, dna, droplet, dumbbells, ear, eye, feather, fingerprint, flame, flask-conical, flask-round, focus, gamepad-2, gauge, gavel, gem, ghost, glasses, globe, hammer, hard-hat, headphones, heart, heart-pulse, history, hourglass, infinity, joystick, key, layers, life-buoy, lightbulb, link, lock, lock-open, magnet, map, medal, megaphone, mic, microscope, mountain, move, music, network, orbit, package, palette, pen-tool, plane, plug-zap, power, puzzle, radar, radiation, radio, radio-tower, refresh-ccw, rewind, rocket, ruler, scale, scan, scan-face, scissors, search, server, settings, shapes, share-2, shield, shield-alert, shield-check, shovel, shuffle, signal, siren, skull, snowflake, sparkles, speaker, sprout, star, stop-circle, sun, sword, swords, target, telescope, terminal, thermometer, timer, tool, tornado, trophy, truck, umbrella, unlock, user, user-check, user-plus, video, view, volume-2, wand, wand-2, watch, waves, webcam, weight, wifi, wind, wrench, zap, zap-off, zoom-in

