# MCP Configuration Status (Linux)

**Last Updated**: 2025-11-18
**System**: Pop!_OS 22.04
**Config File**: `~/.claude/mcp.json`

---

## ✅ Fully Configured & Working

### 1. Filesystem
```json
"filesystem": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-filesystem", "/home/hermeticormus"]
}
```
**Status**: ✅ Active
**Purpose**: Enhanced file operations across home directory
**Test**: File read/write/search operations

### 2. Memory
```json
"memory": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-memory"]
}
```
**Status**: ✅ Active
**Purpose**: Knowledge graph and persistent memory
**Test**: Store and retrieve information across sessions

### 3. Git
```json
"git": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-git"]
}
```
**Status**: ✅ Active
**Purpose**: Git operations
**Test**: Git status, commit, push operations

### 4. GitHub
```json
"github": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-github"],
  "env": {
    "GITHUB_PERSONAL_ACCESS_TOKEN": "[CONFIGURED]"
  }
}
```
**Status**: ✅ Active
**Purpose**: GitHub repository integration, issues, PRs
**Test**: List repositories, create issues
**Security**: ⚠️ Token exposed in config (see security notes)

### 5. Puppeteer
```json
"puppeteer": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-puppeteer"]
}
```
**Status**: ✅ Active
**Purpose**: Browser automation, web scraping
**Test**: Navigate to URL, screenshot

### 6. Fetch
```json
"fetch": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-fetch"]
}
```
**Status**: ✅ Active
**Purpose**: HTTP requests, API calls
**Test**: Fetch URL content

### 7. Brave Search
```json
"brave-search": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-brave-search"],
  "env": {
    "BRAVE_API_KEY": "[CONFIGURED]"
  }
}
```
**Status**: ✅ Active
**Purpose**: Web search capabilities
**Test**: Search query
**Security**: ⚠️ API key exposed in config

### 8. WhatsApp (Gh4stware - Local)
```json
"whatsapp": {
  "comment": "Gh4stware WhatsApp MCP - Python-based local server",
  "command": "python3",
  "args": ["/home/hermeticormus/.local/whatsapp-mcp/whatsapp-mcp-server/main.py"]
}
```
**Status**: ✅ Active
**Purpose**: Local WhatsApp messaging integration
**Type**: Python-based, self-hosted
**Test**: Send message to Ormus
**Location**: `~/.local/whatsapp-mcp/`
**Source**: https://github.com/Gh4stware/whatsapp-mcp

### 9. WhatsApp (Periskope - Cloud)
```json
"periskope-whatsapp": {
  "comment": "Periskope WhatsApp MCP - Cloud-based API service",
  "command": "npx",
  "args": ["-y", "@periskope/whatsapp-mcp"],
  "env": {
    "PERISKOPE_API_KEY": "[CONFIGURED]",
    "PERISKOPE_PHONE_ID": "50769815142"
  }
}
```
**Status**: ✅ Configured (needs Claude Code restart to activate)
**Purpose**: Cloud-hosted WhatsApp API with advanced features
**Type**: Cloud API service
**API Key**: Configured for pop_os-mcp (expires 2035)
**Phone**: +507 6981-5142
**Next Step**: Restart Claude Code to load the MCP

**Detailed Comparison**: `~/.claude/docs/systems/whatsapp-mcps.md`

---

---

## ✅ Newly Configured (Needs Restart)

### 10. Telegram
```json
"telegram": {
  "command": "npx",
  "args": ["-y", "telegram-mcp"],
  "env": {
    "TG_APP_ID": "28030282",
    "TG_API_HASH": "[CONFIGURED]"
  }
}
```
**Status**: ✅ Configured (needs restart)
**Purpose**: Telegram messaging integration
**App**: Shared with Windows laptop
**Next Step**: Restart Claude Code, then authenticate on first use

### 11. Discord
```json
"discord": {
  "command": "npx",
  "args": ["-y", "mcp-discord"],
  "env": {
    "DISCORD_BOT_TOKEN": "[CONFIGURED]"
  }
}
```
**Status**: ✅ Configured (needs restart)
**Purpose**: Discord bot integration
**Bot Name**: Sol (shared with Windows laptop)
**Next Step**: Restart Claude Code to activate

### 12. Supabase
```json
"supabase": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-supabase"],
  "env": {
    "SUPABASE_ACCESS_TOKEN": "[CONFIGURED]"
  }
}
```
**Status**: ✅ Configured (needs restart)
**Purpose**: Database integration for all Supabase projects
**Scope**: All projects (no specific project ID)
**Next Step**: Restart Claude Code to activate

---

## ⚠️ Previously Needs Configuration (NOW COMPLETE)

### n8n
```json
"n8n": {
  "command": "npx",
  "args": ["-y", "@n8n/mcp-server"],
  "env": {
    "N8N_API_KEY": "[CONFIGURED]",
    "N8N_BASE_URL": "http://localhost:5678",  ❌ WRONG - Should be cloud URL
    "N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS": "true",
    "N8N_RUNNERS_ENABLED": "true"
  }
}
```
**Status**: ⚠️ Misconfigured
**Issue**: URL points to localhost instead of cloud instance
**Fix Needed**: Change to `https://ormus.app.n8n.cloud`
**Purpose**: Workflow automation orchestration

### 10. Telegram
```json
"telegram": {
  "command": "npx",
  "args": ["-y", "telegram-mcp"],
  "env": {
    "TG_APP_ID": "NEEDS_CONFIGURATION",
    "TG_API_HASH": "NEEDS_CONFIGURATION"
  }
}
```
**Status**: ⏳ Pending API keys
**Purpose**: Telegram messaging integration
**Setup Required**:
1. Create Telegram app at https://my.telegram.org/apps
2. Get APP_ID and API_HASH
3. Update mcp.json

### 11. Discord
```json
"discord": {
  "command": "npx",
  "args": ["-y", "mcp-discord"],
  "env": {
    "DISCORD_BOT_TOKEN": "NEEDS_CONFIGURATION"
  }
}
```
**Status**: ⏳ Pending bot token
**Purpose**: Discord bot integration
**Setup Required**:
1. Create Discord bot at https://discord.com/developers/applications
2. Get bot token
3. Update mcp.json

### 12. Supabase
```json
"supabase": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-supabase"],
  "env": {
    "SUPABASE_ACCESS_TOKEN": "NEEDS_CONFIGURATION",
    "SUPABASE_PROJECT_ID": "OPTIONAL_PER_PROJECT"
  }
}
```
**Status**: ⏳ Pending access token
**Purpose**: Database integration
**Priority**: Low (no immediate use case)
**Setup Required**:
1. Create/access Supabase project
2. Generate access token
3. Update mcp.json

---

## ➕ Not Yet Added (From Windows)

Based on Windows configuration, these MCPs exist but aren't yet in Linux config:

### Obsidian
**Purpose**: AI-powered note management
**Priority**: Medium (if using Obsidian)
**Setup**: Requires Obsidian Local REST API plugin

### Qdrant
**Purpose**: Semantic search & AI memory
**Priority**: Medium (advanced use case)
**Setup**: Requires Docker + OpenAI key OR Ollama

### Scheduler
**Purpose**: Cron-based task automation
**Priority**: Low (n8n handles this)
**Note**: Can use existing n8n for scheduling

---

## 🔒 Security Considerations

### Current State
- **File permissions**: `rw-------` (600) - only owner can read/write ✅
- **Tokens exposed**: GitHub PAT, Brave API key, n8n API key visible in plaintext ⚠️
- **Location**: Personal machine, single user ✅

### Recommendations

**Immediate** (Low priority for personal machine):
- Current setup is reasonably secure for personal use
- File permissions prevent other users from reading

**Future improvements** (optional):
1. **Environment variables**:
   ```bash
   # In ~/.bashrc
   export GITHUB_TOKEN="..."
   export BRAVE_API_KEY="..."
   ```
   Then reference in mcp.json: `"GITHUB_PERSONAL_ACCESS_TOKEN": "${GITHUB_TOKEN}"`

2. **Secret management**:
   - Use `pass` (password store)
   - Use `keyring` for secure storage
   - Use `.env` file with restrictive permissions

3. **Token rotation**:
   - Regularly rotate API keys
   - Use scoped tokens (minimum necessary permissions)

**For sync to Windows**:
- ⚠️ If syncing mcp.json, tokens will be on both machines
- Consider machine-specific credentials
- Or use environment variables unique to each machine

---

## 📋 Immediate Action Items

### 1. Fix n8n URL (HIGH PRIORITY)
```bash
# Current (wrong)
"N8N_BASE_URL": "http://localhost:5678"

# Should be
"N8N_BASE_URL": "https://ormus.app.n8n.cloud"
```

### 2. Test Working MCPs
Verify these are actually functional:
- [ ] Filesystem operations
- [ ] Memory storage/retrieval
- [ ] GitHub operations
- [ ] WhatsApp messaging
- [ ] Brave search
- [ ] Puppeteer automation

### 3. Document API Key Requirements
Create step-by-step guides for:
- [ ] Telegram setup
- [ ] Discord setup
- [ ] Supabase setup (if needed)

### 4. Optional: Add New MCPs
If desired:
- [ ] Obsidian (for note management)
- [ ] Qdrant (for semantic search)

---

## 🧪 Testing Checklist

After fixing n8n URL, test each MCP:

### Filesystem
```
List files in ~/projects/01-ACTIVE
```

### Memory
```
Remember: My favorite color is blue
[Later] What's my favorite color?
```

### GitHub
```
List my GitHub repositories
```

### WhatsApp (Critical for notifications)
```
Send a test message to my WhatsApp
```

### n8n (After URL fix)
```
List my n8n workflows
```

### Brave Search
```
Search Brave for "Hermetic principles"
```

### Puppeteer
```
Take a screenshot of anthropic.com
```

---

## 📖 Next Steps

1. **Fix n8n URL** → Test n8n integration
2. **Test all working MCPs** → Verify functionality
3. **Decide on Telegram/Discord** → Configure if needed
4. **Optional: Add Obsidian/Qdrant** → If use cases exist
5. **Document workflows** → How to use MCPs effectively

---

## 🔗 Related Documentation

- **MCP Infrastructure**: `~/.claude/docs/systems/mcp.md`
- **WhatsApp Notifications**: `~/.claude/docs/systems/whatsapp-notifications.md`
- **Windows Source**: `~/CLAUDE OPERATING SYSTEM CONCEPT/Reality-OS-Bootstrap/04-MCP-INFRASTRUCTURE/`
