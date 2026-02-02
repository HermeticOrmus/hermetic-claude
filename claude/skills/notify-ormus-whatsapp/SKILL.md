---
name: notify-ormus-whatsapp
description: Send WhatsApp notification to Ormus about completed work, errors, or important updates
version: 1.0.0
hermetic_principle: Rhythm - Timely communication maintains flow
auto_trigger:
  keywords:
    - "send me a whatsapp"
    - "notify me on whatsapp"
    - "whatsapp me when done"
    - "message me on whatsapp"
  contexts:
    - task_completion
    - significant_updates
    - errors
---

# Notify Ormus via WhatsApp

**Purpose:** Send WhatsApp notifications to Ormus about completed work, significant updates, or issues requiring attention.

**Hermetic Principle:** Rhythm - Maintain communication flow through timely updates

---

## When to Use This Skill

**Always use when:**
- User explicitly requests "send me a WhatsApp"
- Major task completion (research, refactoring, deployment)
- Errors requiring Ormus's attention
- Significant updates to projects
- User says "notify me when done"

**For client projects (Serprana, etc.):**
- Send TWO separate messages: technical update for Ormus + client-ready message
- Client message: NO wrapper, NO title, just the message content ready to forward
- NO technical jargon in client message (no commits, files, deployments)

**Configuration Location:** `~/.claude/config/whatsapp-notification-config.json`
**Contact Info:** `~/.hermetic/ormus-contact-info.json`

---

## Step-by-Step Procedure

### Step 1: Determine Notification Type

Based on context, identify:
- **Task Completion**: Major work finished (research, refactoring, implementation)
- **Research Complete**: Deep research or analysis finished
- **Deployment**: Code pushed, systems deployed
- **Error**: Issue requiring attention
- **Custom**: User-requested specific message

### Step 2: Gather Key Information

Collect:
- **What was completed**: Brief description (1-2 sentences)
- **Key results**: Top 3-5 outcomes
- **Statistics**: Files changed, lines added, commits, etc.
- **Next steps**: What should happen next (if applicable)
- **File locations**: Where to find deliverables

### Step 3: Format Message

Use appropriate template from config:
- Keep under 4096 characters
- **Functional/Direct** tone (from Ormus's WhatsApp style guide)
- Include emoji sparingly (✅ 🔍 🚀 ⚠️ 📊 🎯)
- Structured with clear sections
- Actionable next steps

### Step 4: Send via MCP

```javascript
// Claude Code notifications go to Ormus-Claude group
const ormusClaude = "120363422067085557@g.us";

// Use MCP WhatsApp tool
mcp__periskope-whatsapp__periskope_send_message({
  phone: ormusClaude,
  message: formattedMessage
});
```

### Step 5: Confirm Delivery

- Verify send success
- Log notification in session notes
- Continue with any remaining work

---

## Message Templates

### Task Completion Template

```
✅ {Task Name} complete

{2-3 sentence summary of what was done}

📊 Stats:
• Files modified: {count}
• New components: {count}
• Lines changed: {count}
• Commit: {hash}

🎯 Next steps:
• {Next action 1}
• {Next action 2}

📁 Details: {file_location}
```

### Research Completion Template

```
🔍 Research complete: {Topic}

{Key insight or finding}

📚 Deliverables:
• {Document 1}
• {Document 2}
• {Document 3}

💡 Top insights:
• {Insight 1}
• {Insight 2}
• {Insight 3}

🎯 Recommended next action:
{Action description}

📁 Location: {path}
```

### Deployment Template

```
🚀 Deployed: {Project/Feature}

Commit: {hash}

Changes:
• {Change 1}
• {Change 2}
• {Change 3}

Status: ✅ Live
URL: {url if applicable}

🎯 Next: {Next action}
```

### Error/Attention Template

```
⚠️ Attention needed: {Error type}

{Brief description of what happened}

Impact: {What's affected}

🔧 Suggested fix:
{What you recommend Ormus should do}

📁 Details: {file location or context}
```

### Client Update Template (Copy/Paste Ready)

**When to include:** Always include a client-facing message when the work involves client projects (e.g., Serprana, client websites). Send as a **separate WhatsApp message** that Ormus can forward directly - no wrapper, no title, just the message itself.

```
Hi {Client Name}! ✨

All your updates are now live on the website:

• {Change 1 in plain language}
• {Change 2 in plain language}
• {Change 3 in plain language}

Take a look and let me know if you'd like any adjustments!
```

**Guidelines for client messages:**
- **No wrapper/title** - Just the message content, ready to forward
- **No technical jargon** - No commits, files, lines changed, deployments
- **Plain language** - Describe WHAT changed, not HOW
- **Friendly tone** - Emojis okay, warm greeting
- **Action-oriented** - Invite feedback
- **Brief** - 5-10 bullet points max

---

## Example Usage

### Example 1: After Major Refactoring

**Context:** Just completed gaming-native language refactoring

**Message:**
```
✅ Gaming-Native Platform Transformation complete

Transformed ALL platform copy from spiritual/academic → gaming-fluent language for 11-18 year old gamers.

📊 Stats:
• Files modified: 7 (components + pages)
• Gaming metaphors: 20+ integrated
• Lines changed: 200+
• Commit: 0954656

🎯 Key changes:
• "Sabbath" → "Cooldown Day"
• "Journey" → "Solo Queue Rank"
• "Sacred Rhythm" → "Clean Rotation"
• Homepage: "Level Up IRL" hook

🎯 Next steps:
• Deploy to staging
• Test with 16-year-old League players
• Iterate based on feedback

📁 Details: ~/projects/01-ACTIVE/hermetic-academy/GAMING-NATIVE-IMPLEMENTATION-REPORT.md
```

### Example 2: Research Complete

**Context:** Completed demographic research

**Message:**
```
🔍 Research complete: Gaming-Fluent Youth (11-18)

Deep research on reaching League/Fortnite/WoW players with Hermetic wisdom.

📚 Deliverables:
• 8 strategic documents (150+ pages)
• 20+ gaming metaphors library
• Meme strategy guide
• 90-day action plan

💡 Top insights:
• They've already practiced principles in games
• "Revelation" > "Teaching" approach
• Blue Ocean opportunity (no direct competitors)

🎯 Next: Apply research to platform (rewrite all copy)

📁 Location: ~/projects/01-ACTIVE/hermetic-academy/research/
```

### Example 3: Client Project Update (Serprana)

**Context:** Completed content updates for Kate's Serprana website

**Technical Message (for Ormus):**
```
✅ Serprana Website Content Update Complete

Applied Kate's content changes:
• Updated "Hi My Loves" text on homepage
• Added NEW service: Vibrational Alchemy Healing
• Updated all service descriptions
• Reordered services per request
• Replaced "coaching" with "intuitive guidance"

📊 2 files changed, 50 insertions(+), 37 deletions(-)
🔗 Commit: b5dd715
🚀 Pushed to GitHub → Vercel auto-deploying

🎯 Next: Verify live site after deploy
```

**Client Message (for Kate - sent as separate message, ready to forward):**
```
Hi Kate! ✨

All your updates are now live on the website:

• Updated the "Hi My Loves" intro text
• Added the new *Vibrational Alchemy Healing* service
• Updated all service descriptions as requested
• Reordered the offerings
• Changed "coaching" to "intuitive guidance" throughout the packages

Take a look and let me know if you'd like any adjustments!
```

---

## Configuration Reference

**Destination:** Ormus-Claude group (`120363422067085557@g.us`)

**Channel Architecture:**
- `Ormus-Claude` - Claude Code work notifications (this skill)
- `Ormus-Caduceus` - Morning/evening digests, system status
- `Ormus-Voice` - Voice transcriptions
- `Ormus-Nurture` - Relationship reminders
- `Ormus-Teacher` - Learning encounters
- `Ormus-Calendar` - Calendar events
- `Ormus-Finance` - Expense tracking
- `Ormus-Ideas` - Quick idea capture

**Auto-notify triggers** (from config):
- Major task completion
- Research completion
- Deployment complete
- Error requiring attention
- User explicitly requests notification

**Message style** (from Ormus's WhatsApp guide):
- Functional/Direct
- Brief but complete
- Structured (bullets, sections)
- Minimal emoji (purposeful only)
- Clear next steps

---

## Important Notes

1. **Always check config files first** - Don't ask for phone number if it's in config
2. **Respect quiet hours** - If configured (currently disabled)
3. **Keep messages under 4096 chars** - WhatsApp limit
4. **Include actionable next steps** - Ormus wants to know what to do next
5. **Reference file locations** - Where to find detailed info
6. **Use functional tone** - Direct, no fluff, from WhatsApp style guide

---

## Files to Reference

- `~/.hermetic/ormus-contact-info.json` - Ormus's contact information
- `~/.claude/config/whatsapp-notification-config.json` - Notification settings
- `~/.hermetic/communication/whatsapp-style-guide.md` - Communication style guidelines

---

**Last Updated:** 2025-11-10
**Status:** Active
**Auto-trigger:** Yes (on completion keywords)
