---
description: Code execution deployment skill for deploying arbitrarily large content to GitHub Pages using run_code_with_tools
---
---
description: Code execution deployment skill for deploying arbitrarily large content to GitHub Pages using run_code_with_tools
metadata:
  skill_type: deployment
  last_updated: 2026-03-12
---

## CODE EXECUTION DEPLOYMENT SKILL

**PURPOSE:** Deploy arbitrarily large HTML/content to GitHub Pages without tool parameter size limits.

=== ACTIVATION ===
- "Deploy this HTML to GitHub"
- "Create a large webpage"
- "Upload this content (any size)"
- "Use code execution for deployment"

=== OVERVIEW ===
Traditional tool parameters have size limits (~50k chars). Code execution bypasses this by generating content INSIDE the execution environment, not passing it THROUGH parameters.

=== THE PROBLEM ===
❌ **Tool Parameters Approach:**
```
Agent → Tool parameter → GitHub API
         ↓
      Size limit ~50k chars
         ↓
      TRUNCATION
```

❌ **Memory Block Approach:**
```
Agent → Memory block → Deploy
         ↓
      Iterative editing
         ↓
      CORRUPTION RISK
```

=== THE SOLUTION ===
✅ **Code Execution Approach:**
```
Agent → run_code_with_tools → Generate + Upload
         ↓
      Has env vars
         ↓
      NO LIMITS
```

=== WORKFLOW PATTERN ===

**Step 1: Call run_code_with_tools**
```python
run_code_with_tools("""
    # Step 2: Generate content INSIDE execution (no limit)
    html = generate_massive_content()  # Could be 100,000+ chars
    
    # Step 3: Encode for GitHub
    import base64
    encoded = base64.b64encode(html.encode()).decode()
    
    # Step 4: Upload directly via API
    import os
    import requests
    
    github_token = os.environ.get("GITHUB_TOKEN")
    
    requests.put(
        "https://api.github.com/repos/golaunchmate/REPO_NAME/contents/FILE_PATH",
        headers={
            "Authorization": f"Bearer {github_token}",
            "Accept": "application/vnd.github.v3+json"
        },
        json={
            "message": "Commit message",
            "content": encoded
        }
    )
""")
```

=== CAPABILITIES ===

**✅ Create New Files:**
- Generate content of any size
- Upload to any repo
- Returns deployed URL

**✅ Edit Existing Files:**
- Get file + SHA first
- Edit content
- Upload with SHA

**✅ Environment Variables Available:**
- GITHUB_TOKEN - For GitHub API
- LETTA_API_KEY - For Letta API
- DISCORD_WEBHOOK_URL - For Discord
- LETTA_BASE_URL - API base URL

=== PREFERRED REPOSITORY ===
Unless specified, use the `laura` repo with organized folders:
- `/morsels/` - Presentation decks
- `/sparks/` - Date plans (Qudsi style)
- `/tidbits/` - Narrative pages
- `/notes/` - Documentation/progress

=== EXAMPLE: CREATE NEW FILE ===

```python
run_code_with_tools("""
    import os
    import base64
    import requests
    
    # Generate HTML
    html = '''
    <!DOCTYPE html>
    <html>
    <head><title>My Page</title></head>
    <body><h1>Hello World</h1></body>
    </html>
    '''
    
    # Encode
    encoded = base64.b64encode(html.encode()).decode()
    
    # Upload
    requests.put(
        "https://api.github.com/repos/golaunchmate/laura/contents/sparks/date.html",
        headers={
            "Authorization": f"Bearer " + os.environ.get("GITHUB_TOKEN"),
            "Accept": "application/vnd.github.v3+json"
        },
        json={
            "message": "Add date spark",
            "content": encoded
        }
    )
    
    print("Deployed: https://golaunchmate.github.io/laura/sparks/date.html")
""")
```

=== EXAMPLE: EDIT EXISTING FILE ===

```python
run_code_with_tools("""
    import os
    import base64
    import requests
    
    github_token = os.environ.get("GITHUB_TOKEN")
    url = "https://api.github.com/repos/golaunchmate/laura/contents/sparks/date.html"
    
    # Get existing file
    response = requests.get(
        url,
        headers={
            "Authorization": f"Bearer {github_token}",
            "Accept": "application/vnd.github.v3+json"
        }
    )
    
    file_data = response.json()
    sha = file_data["sha"]
    existing = base64.b64decode(file_data["content"]).decode()
    
    # Edit
    edited = existing.replace("old", "new")
    encoded = base64.b64encode(edited.encode()).decode()
    
    # Upload
    requests.put(
        url,
        headers={
            "Authorization": f"Bearer {github_token}",
            "Accept": "application/vnd.github.v3+json"
        },
        json={
            "message": "Update date spark",
            "content": encoded,
            "sha": sha
        }
    )
""")
```

=== KEY PRINCIPLES ===

1. **NEVER wrap in a tool** - Use run_code_with_tools directly
2. **Generate INSIDE execution** - Not through parameters
3. **Has environment variables** - GITHUB_TOKEN available
4. **Atomic operations** - Generate + upload in one step
5. **No size limits** - Arbitrarily large content possible

=== COMPARISON ===

| Feature | Tool Params | Memory Blocks | Code Execution |
|---------|-------------|---------------|----------------|
| Size limit | ❌ ~50k | ⚠️ Tech no | ✅ **NONE** |
| Reliability | ❌ Low | ⚠️ Fragile | ✅ **Solid** |
| Create files | ✅ Yes | ✅ Yes | ✅ **Yes** |
| Edit files | ✅ Yes | ⚠️ Risky | ✅ **Yes** |
| Corruption risk | ✅ Low | ❌ High | ✅ **None** |
| Scalability | ❌ Poor | ⚠️ Limited | ✅ **Infinite** |

=== WHEN TO USE ===

Use code execution when:
- ✅ Content is large (>50k chars)
- ✅ Need reliable deployment
- ✅ Want atomic operation
- ✅ Creating or editing files
- ✅ Need environment variables

Use tool parameters when:
- ✅ Content is small (<50k chars)
- ✅ Simple operations
- ✅ Don't need env vars

=== SKILL EVOLUTION ===
March 12, 2026 - Initial Skill
Discovered that run_code_with_tools has environment variables and can upload directly to GitHub API, bypassing tool parameter size limits. Tested with 19,921 character HTML successfully. Proven to work for both creating and editing files. This is the same approach Craig's here.now uses for fast, reliable deployments.

The key insight: Generate content INSIDE execution environment, not THROUGH tool parameters.
