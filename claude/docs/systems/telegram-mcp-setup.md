# Telegram MCP Setup Guide

## Overview

**Purpose**: Telegram messaging integration for Claude Code
**Package**: `telegram-mcp` (npm)
**Status**: ⏳ Needs API credentials

## Required Credentials

You need TWO credentials from Telegram:
1. **TG_APP_ID** - Application ID (numeric)
2. **TG_API_HASH** - API Hash (alphanumeric string)

---

## Step 1: Get Telegram API Credentials

### A. Visit Telegram API Developer Portal

Go to: **https://my.telegram.org/apps**

### B. Login to Your Telegram Account

1. Enter your phone number (with country code)
   - Example: `+50769815142`
2. Click "Next"
3. Enter the confirmation code sent to your Telegram app
4. You may need to enter your 2FA password if enabled

### C. Create a New Application

Once logged in:

1. **App title**: Enter a name
   - Example: `Claude Code MCP` or `pop_os-mcp`

2. **Short name**: Enter a short identifier
   - Example: `claude_mcp` or `popos_mcp`

3. **Platform**: Select `Desktop`

4. **Description** (optional): Brief description
   - Example: `MCP integration for Claude Code on Pop!_OS`

5. Click **"Create application"**

### D. Copy Your Credentials

After creating, you'll see:

```
App api_id: 12345678
App api_hash: abcdef1234567890abcdef1234567890
```

**⚠️ IMPORTANT**:
- Copy both values immediately
- Keep them secure
- Don't share publicly

---

## Step 2: Configure MCP

Once you have your credentials, I'll update the mcp.json file:

```json
"telegram": {
  "command": "npx",
  "args": ["-y", "telegram-mcp"],
  "env": {
    "TG_APP_ID": "YOUR_APP_ID_HERE",      // e.g., "12345678"
    "TG_API_HASH": "YOUR_API_HASH_HERE"   // e.g., "abcdef..."
  }
}
```

---

## Step 3: First-Time Authentication

After configuration, the **first time** you use the Telegram MCP:

1. It will ask you to enter your phone number
2. You'll receive a code in your Telegram app
3. Enter the code to authenticate
4. Session will be saved for future use

---

## Features

Once configured, you can:

**Send Messages**:
```
Send a Telegram message to @username: "Hello from Claude!"
```

**Manage Chats**:
```
List my recent Telegram conversations
```

**Send to Groups**:
```
Send message to Telegram group "Team Chat": "Meeting in 10 minutes"
```

**Read Messages**:
```
Show me my last 10 Telegram messages
```

---

## Security Considerations

**API Credentials**:
- ⚠️ Stored in plaintext in mcp.json
- ✅ File permissions are 600 (owner only)
- ✅ Never commit to git repositories

**Session Data**:
- Telegram MCP stores session locally
- Keeps you logged in between uses
- Location: `~/.telegram-mcp/` (or similar)

**Best Practices**:
1. Use dedicated API credentials for this integration
2. Don't share your api_hash publicly
3. Revoke credentials if compromised (from my.telegram.org)
4. Regularly check active sessions in Telegram app

---

## Troubleshooting

### "Invalid API credentials"
- Double-check TG_APP_ID and TG_API_HASH
- Ensure no extra spaces in mcp.json
- Verify credentials at https://my.telegram.org/apps

### "Phone number required"
- This is normal on first use
- Enter your phone number when prompted
- Check Telegram app for verification code

### "Session expired"
- Re-authenticate by entering phone number
- Check code in Telegram app
- Session will be saved again

### MCP not loading
- Check JSON syntax in mcp.json
- Restart Claude Code
- Verify npm can access telegram-mcp package

---

## Quick Setup Checklist

- [ ] Visit https://my.telegram.org/apps
- [ ] Login with phone number + verification code
- [ ] Create new application
- [ ] Copy API ID and API Hash
- [ ] Provide credentials to configure mcp.json
- [ ] Restart Claude Code
- [ ] Complete first-time authentication
- [ ] Test by sending a message

---

## Resources

- **Telegram API Portal**: https://my.telegram.org/apps
- **Telegram API Docs**: https://core.telegram.org/api
- **npm Package**: https://www.npmjs.com/package/telegram-mcp
- **MCP Config**: `~/.claude/mcp.json`

---

## Next Steps

1. **Get credentials** from https://my.telegram.org/apps
2. **Provide them** so I can update mcp.json
3. **Restart** Claude Code
4. **Authenticate** on first use
5. **Test** by sending a message

**Ready to configure? Provide your TG_APP_ID and TG_API_HASH!**
