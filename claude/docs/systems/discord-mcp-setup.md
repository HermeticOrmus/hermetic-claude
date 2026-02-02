# Discord MCP Setup Guide

## Overview

**Purpose**: Discord bot integration for Claude Code
**Package**: `mcp-discord` (npm)
**Status**: ⏳ Needs bot token

## Required Credential

You need ONE credential:
- **DISCORD_BOT_TOKEN** - Bot authentication token

---

## Step 1: Create Discord Application

### A. Visit Discord Developer Portal

Go to: **https://discord.com/developers/applications**

### B. Login to Discord

Use your Discord account credentials

### C. Create New Application

1. Click **"New Application"** (top right)
2. **Name your application**:
   - Example: `Claude Code Bot` or `Ormus MCP Bot`
3. Accept Terms of Service
4. Click **"Create"**

---

## Step 2: Create Bot User

### A. Navigate to Bot Section

1. In left sidebar, click **"Bot"**
2. Click **"Add Bot"**
3. Confirm by clicking **"Yes, do it!"**

### B. Configure Bot Settings

**Privileged Gateway Intents** (important):
- ✅ Enable **"Presence Intent"**
- ✅ Enable **"Server Members Intent"**
- ✅ Enable **"Message Content Intent"**

These allow the bot to read messages and user info.

### C. Bot Permissions

Scroll down to **"Bot Permissions"** and select:

**Essential**:
- ✅ Read Messages/View Channels
- ✅ Send Messages
- ✅ Send Messages in Threads
- ✅ Embed Links
- ✅ Attach Files
- ✅ Read Message History
- ✅ Add Reactions

**Optional** (based on needs):
- Manage Messages
- Manage Channels
- Kick Members
- Ban Members

---

## Step 3: Get Bot Token

### A. Copy Token

1. In the "Bot" section, find **"TOKEN"**
2. Click **"Reset Token"** (if first time) or **"Copy"**
3. **⚠️ IMPORTANT**: Copy the token immediately
   - You can only see it once
   - If you lose it, you must reset it

Example token format:
```
YOUR_DISCORD_BOT_TOKEN_HERE
```

### B. Keep It Secure

- ⚠️ Never share publicly
- ⚠️ Never commit to git
- ⚠️ Treat like a password

---

## Step 4: Invite Bot to Server

### A. Generate OAuth URL

1. In left sidebar, click **"OAuth2"** → **"URL Generator"**

2. **Scopes**: Select:
   - ✅ `bot`
   - ✅ `applications.commands` (for slash commands)

3. **Bot Permissions**: Same as configured earlier
   - The permissions will auto-populate based on Step 2C

4. **Copy the generated URL** at bottom

### B. Add Bot to Your Server

1. Paste URL in browser
2. Select the Discord server to add bot to
3. Click **"Authorize"**
4. Complete CAPTCHA if prompted

The bot will now appear in your server (offline until configured)

---

## Step 5: Configure MCP

Once you have your bot token, I'll update mcp.json:

```json
"discord": {
  "command": "npx",
  "args": ["-y", "mcp-discord"],
  "env": {
    "DISCORD_BOT_TOKEN": "YOUR_BOT_TOKEN_HERE"
  }
}
```

---

## Features

Once configured, you can:

**Send Messages**:
```
Send Discord message to #general channel: "Hello from Claude!"
```

**Manage Channels**:
```
List all channels in my Discord server
Create a new Discord channel called "announcements"
```

**Send to Specific Users**:
```
Send Discord DM to @username: "Private message from Claude"
```

**Read Messages**:
```
Show me the last 10 messages from #general
```

**Manage Server**:
```
List all members in Discord server
Get server information
```

---

## Security Considerations

**Bot Token**:
- ⚠️ Stored in plaintext in mcp.json
- ✅ File permissions are 600 (owner only)
- ✅ Never commit to git repositories
- ⚠️ Full access to bot's capabilities

**Bot Permissions**:
- Only grant necessary permissions
- Review what the bot can do
- Can be updated later in Discord settings

**Best Practices**:
1. Use minimum necessary permissions
2. Create dedicated bot for this integration
3. Rotate token if compromised
4. Monitor bot activity in Discord
5. Use role restrictions in Discord server

---

## Troubleshooting

### "Invalid token"
- Verify token is correct (no spaces)
- Check if token was reset
- Generate new token if lost

### "Insufficient permissions"
- Check bot permissions in Discord Developer Portal
- Verify bot role in server has needed permissions
- Ensure intents are enabled

### "Bot appears offline"
- Verify token is configured
- Restart Claude Code
- Check MCP loaded successfully

### "Cannot send messages"
- Verify Message Content Intent is enabled
- Check bot has Send Messages permission
- Ensure bot can access the channel

---

## Quick Setup Checklist

- [ ] Visit https://discord.com/developers/applications
- [ ] Create new application
- [ ] Add bot user
- [ ] Enable privileged intents
- [ ] Set bot permissions
- [ ] Copy bot token
- [ ] Generate OAuth URL
- [ ] Invite bot to server
- [ ] Provide token to configure mcp.json
- [ ] Restart Claude Code
- [ ] Test by sending a message

---

## Discord Server Setup (Optional)

If you don't have a Discord server:

1. Open Discord app
2. Click **"+"** button (left sidebar)
3. Choose **"Create My Own"**
4. Select server type
5. Name your server
6. Invite bot using OAuth URL from Step 4

---

## Use Cases

**Personal**:
- Notifications from automation
- Task completion alerts
- Personal reminders

**Business**:
- Team notifications
- Status updates
- Automated reports
- Integration with workflows

**Integration**:
- Combine with n8n for workflows
- Link with WhatsApp for cross-platform
- Connect to GitHub for dev updates

---

## Resources

- **Discord Dev Portal**: https://discord.com/developers/applications
- **Bot Documentation**: https://discord.com/developers/docs/topics/gateway
- **npm Package**: https://www.npmjs.com/package/mcp-discord
- **MCP Config**: `~/.claude/mcp.json`

---

## Next Steps

1. **Create bot** at https://discord.com/developers/applications
2. **Get token** from Bot section
3. **Invite bot** to your Discord server
4. **Provide token** so I can update mcp.json
5. **Restart** Claude Code
6. **Test** by sending a message

**Ready to configure? Provide your DISCORD_BOT_TOKEN!**
