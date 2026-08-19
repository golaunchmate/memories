---
description: Currently loaded skill instructions - swapped based on context/phase
limit: 10000
agent_id: agent-b86549ac-4995-4d37-ad0d-c3119a3a093a
---

TIDBIT CREATION & PUBLISHING SKILL

=== ACTIVATION ===
- "Create tidbit"
- "Summarize my work"
- "Share work with mentors"

=== OVERVIEW ===
Tidbits are narrative web pages that tell the story of someone's week/progress. Goal: everyone comes to meetings already knowing each other's stories.

=== STEP 1: GATHER THE NARRATIVE ===
Source: The current agent's recent context and memory blocks
Contact the subject's agent to get their recent context

Determine: what they worked on, what surprised them, pivots made, current status
For founders: focus on discovery insights, validation learnings, decisions made

Key narrative elements to capture:
- Starting intention ("I thought I'd do X...")
- New information that landed ("...but realized Y was in play...")
- The trade-off or decision fork
- How they reasoned through it
- What they decided
- Where things stand now

=== STEP 2: WRITE THE NARRATIVE ===
TONE:
- Engineer explaining their thought process
- Direct, practical, conversational
- NOT flowery, literary, or fable-like
- First person, casual but clear

STRUCTURE BY TYPE:

**FOUNDER TIDBITS (5 slides):**
1. Cover: Name + Company + Date + "scroll ↓"
2. "Where I Started" - Initial assumption/intention
3. "What I Discovered" - Key realizations + BIG NUMBERS for impact
4. "The Real Opportunity" - Reframed insight + business model
5. "Where I'm At" - Current actions + CLOSING QUOTE

Closing quote format: "I thought I needed X. I actually needed Y."

**TEAM/MULTI-WEEK TIDBITS (5-6 slides):**
1. Cover: Title + subtitle explaining journey + "↓ scroll"
2-4. Week sections with labels: "WEEK 1 · Jan 6-13"
   - Use named callout boxes: "The Realization", "The Problem", "The Discovery"
   - Include "Decision:" statements
5-6. "The Arc" summary: Started with → Narrowed to → Hit → Building

VISUAL TECHNIQUES:
- ✓/✗ symbols for what works vs doesn't
- Big numbers with labels: "500-1,200 people/month"
- Named callout boxes for key moments
- Bullet lists for business model/action items

FOCUS ON:
- The journey, not status updates
- Trade-offs and tensions (use orange #f97316)
- Insights and pivots
- What they learned that others wouldn't know

AVOID:
- Technical implementation details (unless that IS the insight)
- Generic status updates
- More than 6 slides - compress ruthlessly

=== STEP 3: BUILD THE HTML ===

**Deployment Method Options:**

**Method 1: Code Execution (RECOMMENDED for large content)**
- See `code_execution_deployment_skill` block
- No size limits (arbitrarily large content)
- Works via run_code_with_tools
- Has environment variables (GITHUB_TOKEN)
- Atomic operation (generate + upload)
- Best for: tidbits >50k chars, complex pages, production use

**Method 2: Tool Parameters (for small content <50k)**
- Use `update_github_pages_html` tool
- Simple for small content
- Has size limits (~50k chars)
- Best for: small tidbits, simple updates

---

**Deployment Methods:**

**Method 1: Code Execution (RECOMMENDED for large content)**
- See `code_execution_deployment_skill` block for full details
- No size limits (arbitrarily large content)
- Works via run_code_with_tools
- Has environment variables (GITHUB_TOKEN)
- Atomic operation (generate + upload)
- Best for: tidbits >50k chars, complex pages, production use

**Method 2: Tool Parameters (for small content <50k)**
- Use `update_github_pages_html` tool
- Simple for small content
- Has size limits
- Best for: small tidbits, simple updates

**Base CSS (both types):**
* { margin: 0; padding: 0; box-sizing: border-box; }
html { scroll-snap-type: y mandatory; scroll-behavior: smooth; }
body { font-family: 'Inter', -apple-system, sans-serif; background: #0f0f0f; color: #e5e5e5; line-height: 1.6; }

**COLOR CLASSES:**
.highlight { color: #60a5fa; }  /* blue - key info */
.decision { color: #34d399; }   /* green - outcomes */
.tension { color: #f97316; }    /* orange - challenges */
.label { font-family: 'JetBrains Mono', monospace; font-size: 0.75rem; color: #6b7280; text-transform: uppercase; letter-spacing: 0.1em; }

**FOUNDER TIDBIT LAYOUT:**
- Cards centered, max-width: 600px
- Cards have border: 1px solid #2a2a2a
- Page numbers absolute bottom-right
- Uses stat-row for big numbers
- Arrow bullets (→) for lists

**TEAM TIDBIT LAYOUT:**
- Content flows down page, max-width: 800px
- Cards inline (no border)
- Page numbers at top
- Uses timeline for arc summary
- Uses skill-grid for 2-col layouts

**KEY COMPONENTS:**

Stat Row (founder):
<div class="stat-row">
  <div class="stat">
    <div class="stat-value">500-1,200</div>
    <div class="stat-label">people/month</div>
  </div>
</div>

Timeline (team arc):
<div class="timeline">
  <div class="timeline-item">
    <h3>Started with: "..."</h3>
    <p>Description</p>
  </div>
</div>

Callout Card:
<div class="card">
  <p class="label">The Realization</p>
  <p>Content with <span class="tension">tension</span>...</p>
</div>

Check/X Pattern:
<p>✓ Thing that works</p>
<p style="color: #ef4444;">✗ Thing that fails</p>

**REQUIRED META TAGS:**
<meta name="tidbit-type" content="founder|team">
<meta name="tidbit-subject" content="Full Name">
<meta name="tidbit-company" content="Company Name">
<meta name="tidbit-date" content="YYYY-MM-DD">
<meta name="tidbit-period" content="2026-W05">

**FONTS:** Include Google Fonts link:
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=JetBrains+Mono&display=swap" rel="stylesheet">

**KEYBOARD NAV SCRIPT:**
document.addEventListener('keydown', (e) => {
  if (e.key === 'ArrowDown' || e.key === 'ArrowRight') {
    window.scrollBy({ top: window.innerHeight, behavior: 'smooth' });
  } else if (e.key === 'ArrowUp' || e.key === 'ArrowLeft') {
    window.scrollBy({ top: -window.innerHeight, behavior: 'smooth' });
  }
});

=== STEP 4: PUBLISH ===
GitHub repo: golaunchmate/tidbits/inflight-spring-26/{user_firstname}-{user_lastname}/{file}.html
URL pattern: https://golaunchmate.github.io/tidbits/inflight-spring-26/{user}/{filename}.html

File naming:
- Founders: {firstname}-{company}-{YYYY-MM-DD}.html
- Team: {firstname}-{YYYY}-w{XX}.html

Use update_github_pages_html:
- Do NOT pass github_token (configured in environment)
- repo_owner: "golaunchmate"
- repo_name: "tidbits/inflight-spring-26"
- file_path: the filename
- html_content: complete HTML

=== STEP 5: UPDATE MEMORY ===
After publishing, update tidbit_publishing block:
- Add to appropriate week section
- Mark with ✓

=== FOUNDER-SPECIFIC GUIDANCE ===
Launch readiness criteria:
- Founder knows "the secret" (unique insight about their market)
- Discovery phase is over
- Execution is now primary focus

For founder tidbits, highlight:
- Market insight journey (broad → focused)
- Validation evidence (real customer interactions)
- Model clarity (how they'll make money)

=== KNOWN FOUNDERS ===
- Kavindi (Fooni): agent-8247fbfd-c600-4ab1-a133-8fee44c39480 - LAUNCH READY
- Cameron (Dad Bod Protein Health): agent-7531a942-f99a-4a4d-b4e0-6bc3da0c8137

=== TEAM AGENTS ===
- Craig: agent-3ee68a5a-a32a-4208-82d5-9523b523e23b
- Michael: agent-c7dfe49e-c6c6-45d3-8a43-901be7a5f042
- Paige: agent-297cd755-05a5-421f-8d2b-5fc34a9282e7
- Laura: agent-b86549ac-4995-4d37-ad0d-c3119a3a093a

=== SKILL EVOLUTION ===
Dec 19, 2025 - Initial System
Craig wanted informal, narrative-driven pre-meeting updates (not status reports)
Format: "I thought I'd do X → realized Y was in play → changed course → came up with Z"
First test: reached Craig's own agent to synthesize a weekly story
Dec 19, 2025 - First Tone Correction
Craig rejected first attempt: "the tone is all wrong. The storytelling should feel like an experienced engineer laying out the story of her thought process, not like you're reading a fable."
Key shift: engineer explaining → not literary/flowery
Dec 21-31, 2025 - Team Rollout
Published narratives for Craig, Paige, Michael, Laura, Kavindi
Discovered agent routing issues (agents sometimes thought I was the founder)
Jan 16, 2026 - Simplification Push
Craig: "this storytelling is too technical... do it in 3-4 slides"
Shortened Michael's pipeline tidbit from 8 to 4 slides
Established: 4-5 slides max
Jan 2026 - Founder Tidbits
Expanded from team narratives to founder updates
Added metadata standards (tidbit-type, tidbit-subject, tidbit-date)
Now tracking: Kavindi, Cameron, Billy, Zach, Juan, Qudsi
The core insight: journey over status, engineer tone, keep it tight.