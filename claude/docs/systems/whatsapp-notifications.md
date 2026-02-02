# WhatsApp Notification System

**Purpose**: Automatic notifications to Ormus when significant work completes

**⚠️ Updated**: Now supports DUAL WhatsApp MCPs - see `~/.claude/docs/systems/whatsapp-mcps.md` for full details

## Contact Configuration

- **Primary**: `~/.hermetic/ormus-contact-info.json`
- **Phone Number**: `+507 6981-5142`
- **Periskope Format**: `50769815142` (numbers only)
- **Gh4stware Format**: Uses local WhatsApp connection

## Auto-Trigger Rules (when to send)

- ✅ Major task completions (multi-file changes, deployments)
- ✅ Research finished (comprehensive analysis complete)
- ✅ Deployments executed (system changes live)
- ⚠️ Errors requiring attention (critical issues)
- 💬 Explicit request ("send me a whatsapp")

## Message Templates

### Task Completion

```
✅ Task Complete: [Brief Description]

Summary: [2-3 sentences of what was accomplished]
Files: [Count] changed
Commit: [hash if applicable]

Next: [Clear next step or "Awaiting direction"]

Location: [Relevant file paths]
```

### Research Findings

```
🔍 Research Complete: [Topic]

Key Findings:
- [Finding 1]
- [Finding 2]
- [Finding 3]

Deliverables: [What was created]
Timeline: [How long it took]

Next: [Recommended action]
```

### Deployment

```
🚀 Deployment Complete

Changes: [What was deployed]
Status: [Success/Issues]

Actions Pending: [What needs attention]
```

## Style Requirements (Ormus's preferences)

- **Functional/Direct**: No fluff, get to point
- **Structured**: Clear sections, scannable
- **Emoji Usage**: Minimal, purposeful only (✅ 🔍 🚀 ⚠️ 💬)
- **Brevity**: 3-5 sentences max per section
- **Next Steps**: Always include clear next action
- **File References**: Include relevant paths

## Technical Implementation

**Two WhatsApp MCPs Available**:

### Option 1: Gh4stware MCP (Local - Currently Active)
- MCP Name: `whatsapp`
- Type: Python-based local server
- Location: `~/.local/whatsapp-mcp/`
- Status: ✅ Active now

### Option 2: Periskope MCP (Cloud - Needs Setup)
- MCP Name: `periskope-whatsapp`
- Type: Cloud API service
- Package: `@periskope/whatsapp-mcp`
- Status: ⏳ Needs API key configuration

**See complete guide**: `~/.claude/docs/systems/whatsapp-mcps.md`

## Status

✅ Gh4stware MCP active (as of install date)
⏳ Periskope MCP added (needs credentials)

## When NOT to Send

- ❌ Trivial completions (reading single file, simple queries)
- ❌ Work in progress (only when complete or blocked)
- ❌ User already present in conversation
- ❌ Routine operations (file reads, searches)

## Skill

`/notify-ormus-whatsapp` (auto-activates on trigger conditions)
