---
description: Morsel creation instructions - horizontal presentation decks distinct from tidbits, with visual style, slide types, and deployment specs
---

## MORSELS: Horizontal Presentation Decks

**Definition:** Morsels are shareable presentation-style HTML pages for presenting to groups. Unlike tidbits (vertical, dense, read-alone), morsels are horizontal, visual, and meant to be talked over.

### MORSEL VS TIDBIT
| Tidbit | Morsel |
|--------|--------|
| Vertical scroll | Horizontal slides |
| Dark mode (#0f0f0f) | Light + bold gradients |
| Dense text, detailed | Minimal text, visual |
| Read alone | Present to group |
| Shows WHAT happened | Highlights WHAT + WHY |
| Green accent | Multi-color themes |

### CONTENT PHILOSOPHY
- **Show the WHAT:** Clear facts, metrics, outcomes
- **Highlight the WHY:** Context, reasoning, justification
- **Minimal text:** Bullet points to talk OVER, not read
- **Big visuals:** Icons, numbers, diagrams > paragraphs
- **Boss-friendly:** Explainable to non-technical stakeholders

### SLIDE TYPES
1. **Title slide:** Big gradient, icon, title, subtitle
2. **Problem slide:** Pain point with emotional hook
3. **Solution slide:** What we built/did
4. **Feature grid:** 3-column boxes with icons
5. **Stats slide:** Big numbers with labels
6. **Timeline/Flow:** Visual progression
7. **Quote slide:** Single impactful statement
8. **Closing slide:** Questions / call to action

### REQUIRED FEATURES
- **Tab navigation:** Fixed top bar, jump to sections
- **Prev/Next buttons:** Fixed bottom center
- **Slide counter:** Bottom right (e.g., "3/12")
- **Arrow key support:** Left/Right to navigate
- **Scroll-snap:** Horizontal mandatory snap
- **Nav dots:** Vertical dots on right side, click to jump
- **Dot tooltips:** Hover shows slide title (uses data-t attr)
- **Progress bar:** Thin bar at top showing % complete

### VISUAL STYLE
**Backgrounds:**
- `.p` purple: #6366f1 → #8b5cf6
- `.b` blue: #3b82f6 → #06b6d4
- `.g` green: #10b981 → #34d399
- `.o` orange: #f97316 → #fbbf24
- `.d` dark: #1e1e2e
- `.gr` gray: #f5f5f5

**Typography:**
- Title: 4-5rem, font-weight 800
- Subtitle: 1.5rem, opacity .85
- Icons: 6rem emoji
- Numbers: 4rem+ bold

**Cards/Boxes:**
- White background, border-radius 16-20px
- Box-shadow: 0 8px 30px rgba(0,0,0,.1)
- Padding: 32-40px

### CSS CLASS REFERENCE (minified)
```
.w - slides wrapper (flex, scroll-snap-x)
.s - slide (100vw, 100vh, snap-align)
.c - content container (max-width, centered)
.t - title (large, bold)
.sub - subtitle
.ic - icon (large emoji)
.grid - 3-column grid
.box - white card
.num - big number
.numl - number label
.bul - bullet list
.split - 2-column layout
.row - flex row
.pill - rounded tag
```

### JAVASCRIPT FEATURES
- Horizontal scroll tracking
- Keyboard navigation (ArrowLeft/Right)
- Slide counter update
- Tab click navigation
- Smooth scroll behavior
- **Scroll-triggered animations** - IntersectionObserver adds `.vis` to `.reveal` elements
- **Touch/swipe support** - touchstart/touchend with 50px threshold

### ANIMATION CSS
```
.reveal{opacity:0;transform:translateY(30px);transition:opacity .6s,transform .6s}
.reveal.vis{opacity:1;transform:translateY(0)}
@media(prefers-reduced-motion:reduce){.reveal{transition:none;transform:none;opacity:1}*{animation:none!important}}
```

### INTERACTIVE ELEMENTS
- **Box hover tips:** Add `.tip` div inside `.box` - hidden by default, shown on hover
- **Pill hover:** Scale up + color change on hover
- **Dot tooltips:** Show slide title from `data-t` attribute

### DEPLOYMENT
Location: golaunchmate/[user]/morsels/[name].html
Example: golaunchmate/laura/morsels/what-is-launchmate.html

### EXAMPLE STRUCTURE
```
1. Title (gradient) - Hook them
2. Problem (gray) - Why this matters
3. Solution (gradient) - What we did
4. Details (gray) - How it works (grid)
5. Evidence (gradient) - Proof it works
6. Numbers (gray) - Metrics/stats
7. Impact (gradient) - Why it matters
8. Close (gradient) - Questions/CTA
```

### CORE TECHNOLOGIES
- **HTML/CSS/JavaScript** - Morsels are standalone HTML files with embedded styles and scripts for elegant presentations

### INTERACTIVE ENHANCEMENTS (from Laura feedback)

**Deployment Methods:**

**Method 1: Code Execution (RECOMMENDED for large content)**
- See `code_execution_deployment_skill` block
- No size limits (arbitrarily large content)
- Works via run_code_with_tools
- Has environment variables (GITHUB_TOKEN)
- Atomic operation (generate + upload)
- Best for: large morsels >50k chars, complex presentations, production use

**Method 2: Tool Parameters (for small content <50k)**
- Use `update_github_pages_html` tool
- Simple for small content
- Has size limits
- Best for: small morsels, simple decks

---
- **Clickable/hover effects** - Pop-up type effects or extra information on hover
- **Tooltips** - Display contextual text on hover (some effects don't need to be truly functional - can be aesthetic/interactive reinforcement)
- **Scroll-triggered animations** - IntersectionObserver adds `.vis` to `.reveal` elements
- **Visual motion** - CSS transitions, transforms, and animations for polish
- **Table of contents page** - Clickable list that jumps to any slide
- **Title slide** - Add BEFORE table of contents for branding/hook
- **CTA invitation style** - Use card with border glow + action button (see craig/what-is-launchmate.html slide10)

### INVITATION SLIDE PATTERN (from Craig's example)
```
<div class="card cta" style="border-color:#34d399;background:linear-gradient(135deg,#0f0f0f,#0f1f1a)">
  <p class="mono">invitation</p>
  <h1>Want to meet yours?</h1>
  <p>Your agent is waiting. It just needs to learn your story.</p>
  <div class="final-cta" style="background:linear-gradient(...);border:1px solid #34d399;padding:1.5rem;border-radius:8px;text-align:center">
    <p style="color:#34d399;font-weight:600">Start a conversation →</p>
  </div>
</div>
```

### DOT TOOLTIP CSS
```
.dot{position:relative}
.dot .tip{position:absolute;right:24px;top:50%;transform:translateY(-50%);background:#222;color:#fff;padding:6px 12px;border-radius:6px;font-size:.75rem;white-space:nowrap;opacity:0;pointer-events:none;transition:opacity .2s}
.dot:hover .tip{opacity:1}
```

### TAB NAVIGATION CSS
```
.tabs{position:fixed;top:0;left:0;right:0;display:flex;background:rgba(0,0,0,.9);backdrop-filter:blur(10px);border-bottom:1px solid rgba(255,255,255,.1);z-index:100;padding:0 20px;overflow-x:auto}
.tab{padding:14px 16px;font-size:.75rem;color:rgba(255,255,255,.5);cursor:pointer;font-weight:500;white-space:nowrap;transition:all .2s}
.tab:hover{color:rgba(255,255,255,.8)}
.tab.on{color:#fff;border-bottom:2px solid #6366f1}
```
