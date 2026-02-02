# MCP Infrastructure

## Overview

MCPs (Model Context Protocol servers) extend Claude Code's capabilities by connecting to external services and tools. Each MCP provides specific functionality to enhance productivity and automation.

**Configuration File**: `~/.claude/mcp.json`
**Detailed Status**: `~/.claude/docs/systems/mcp-configuration-status.md`

---

## Currently Active MCPs (8)

### Communication & Automation
- **WhatsApp** ✅ - Messaging integration (Python-based)
- **n8n** ✅ - Workflow automation (https://ormus.app.n8n.cloud)

### Development & Git
- **Filesystem** ✅ - Enhanced file operations
- **Git** ✅ - Git operations
- **GitHub** ✅ - Repository integration, issues, PRs

### Web & Search
- **Puppeteer** ✅ - Browser automation
- **Fetch** ✅ - HTTP requests, API calls
- **Brave Search** ✅ - Web search capabilities

### Knowledge
- **Memory** ✅ - Knowledge graph and persistent memory

---

## Pending Configuration (3)

### Telegram ⏳
**Purpose**: Telegram messaging integration
**Needs**: TG_APP_ID, TG_API_HASH
**Setup**: Create app at https://my.telegram.org/apps

### Discord ⏳
**Purpose**: Discord bot integration
**Needs**: DISCORD_BOT_TOKEN
**Setup**: Create bot at https://discord.com/developers/applications

### Supabase ⏳
**Purpose**: Database integration
**Needs**: SUPABASE_ACCESS_TOKEN
**Priority**: Low (no immediate use case)

---

## Optional MCPs (Not Yet Added)

### Obsidian
**Purpose**: AI-powered note management
**Requires**: Obsidian + Local REST API plugin
**Priority**: Medium (if using Obsidian)

### Qdrant
**Purpose**: Semantic search & AI memory
**Requires**: Docker + OpenAI key OR Ollama
**Priority**: Medium (advanced use case)

### Scheduler
**Purpose**: Cron-based task automation
**Note**: n8n already handles scheduling
**Priority**: Low

---

## Quick Start: Using MCPs

### WhatsApp Notifications
```
Send a WhatsApp message to Ormus: "Task complete!"
```

### n8n Workflows
```
List my n8n workflows
Trigger workflow "daily-backup"
```

### GitHub Operations
```
List my repositories
Create an issue in repo "project-name"
```

### Browser Automation
```
Take a screenshot of anthropic.com
Navigate to example.com and extract all links
```

### Web Search
```
Search Brave for "Hermetic principles philosophy"
```

### Knowledge Memory
```
Remember: My favorite color is blue
[Later] What's my favorite color?
```

---

## Configuration Structure

MCPs are configured in `~/.claude/mcp.json` with this format:

```json
{
  "mcpServers": {
    "server-name": {
      "command": "npx",
      "args": ["-y", "@package/name"],
      "env": {
        "API_KEY": "your-key-here"
      }
    }
  }
}
```

### Environment Variables

Some MCPs require API keys or tokens in the `env` section:
- **GitHub**: `GITHUB_PERSONAL_ACCESS_TOKEN`
- **Brave Search**: `BRAVE_API_KEY`
- **n8n**: `N8N_API_KEY`, `N8N_BASE_URL`
- **Telegram**: `TG_APP_ID`, `TG_API_HASH`
- **Discord**: `DISCORD_BOT_TOKEN`

---

## Security Considerations

**Current Setup**:
- File permissions: `rw-------` (600) - only owner can read/write ✅
- API keys stored in plaintext in mcp.json ⚠️
- Personal machine, single user ✅

**Best Practices**:
1. Keep restrictive file permissions (600)
2. Never commit mcp.json to public repositories
3. Rotate API keys regularly
4. Use minimum necessary token scopes

**See**: `~/.claude/docs/systems/mcp-configuration-status.md` for detailed security notes

---

## Troubleshooting

### MCP Not Loading

1. **Check JSON syntax** - No trailing commas
2. **Restart Claude Code** - Full restart required
3. **Check MCP logs** - View in Claude Code console
4. **Verify dependencies** - Ensure `npx` available (Node.js installed)

### Connection Errors

**n8n**: Verify cloud URL is `https://ormus.app.n8n.cloud` (not localhost)
**GitHub**: Check token has required scopes
**WhatsApp**: Verify Python script path exists

### Permission Errors

```bash
# Fix file permissions
chmod 600 ~/.claude/mcp.json

# Verify npm global access
npm config get prefix
```

---

## Adding New MCPs

1. **Find MCP package**: Search npm or MCP directory
2. **Add to mcp.json**:
   ```json
   "new-mcp": {
     "command": "npx",
     "args": ["-y", "@package/name"],
     "env": {}
   }
   ```
3. **Configure environment**: Add required API keys
4. **Restart Claude Code**: Required for new MCPs
5. **Test functionality**: Verify MCP loads and works

---

## MCP Sources & Documentation

**Official MCPs**: https://github.com/modelcontextprotocol
**Community MCPs**: https://github.com/topics/mcp-server
**Windows Source**: `~/CLAUDE OPERATING SYSTEM CONCEPT/Reality-OS-Bootstrap/04-MCP-INFRASTRUCTURE/`

---

## Workflows & Integration

MCPs work together to create powerful workflows:

**Example**: Automated research pipeline
1. **Brave Search** - Find relevant content
2. **Puppeteer** - Extract detailed information
3. **Memory** - Store findings
4. **WhatsApp** - Notify when complete

**Example**: Development workflow
1. **GitHub** - Create issue for bug
2. **Git** - Create branch and commit fix
3. **n8n** - Trigger test pipeline
4. **WhatsApp** - Notify deployment status

**See**: `~/CLAUDE OPERATING SYSTEM CONCEPT/Reality-OS-Bootstrap/04-MCP-INFRASTRUCTURE/.mcp/integrations/` for more patterns

---

## Next Steps

1. **Test active MCPs** - Verify all 8 working MCPs function correctly
2. **Configure pending** - Set up Telegram, Discord if needed
3. **Explore workflows** - Combine MCPs for automation
4. **Document patterns** - Create reusable integration patterns

**Detailed status and testing checklist**: `~/.claude/docs/systems/mcp-configuration-status.md`
