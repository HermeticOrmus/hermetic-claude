# WhatsApp MCPs - Dual Setup Guide

**You now have TWO WhatsApp MCPs configured** - each serving different purposes and use cases.

---

## Overview

| MCP | Type | Status | Best For |
|-----|------|--------|----------|
| **Gh4stware** | Python, Local | ✅ Active | Local control, privacy, free |
| **Periskope** | Cloud API | ⏳ Needs credentials | Advanced features, hosted service |

---

## 1. Gh4stware WhatsApp MCP

### Configuration

```json
"whatsapp": {
  "comment": "Gh4stware WhatsApp MCP - Python-based local server",
  "command": "python3",
  "args": ["/home/hermeticormus/.local/whatsapp-mcp/whatsapp-mcp-server/main.py"],
  "env": {}
}
```

### Details

**Type**: Python-based local server
**Location**: `~/.local/whatsapp-mcp/`
**Source**: https://github.com/Gh4stware/whatsapp-mcp
**Status**: ✅ Currently active

### Features

- Local control (runs on your machine)
- No cloud dependency
- Direct WhatsApp Web connection
- Free to use
- Full privacy (data stays local)

### When to Use

✅ **Use Gh4stware when you want:**
- Complete privacy and local control
- No subscription/API costs
- Direct connection to WhatsApp
- Self-hosted solution

### Setup Status

**Already installed and configured** at `~/.local/whatsapp-mcp/`

Check setup guide:
```bash
cat ~/.local/whatsapp-mcp/SETUP_GUIDE.md
```

---

## 2. Periskope WhatsApp MCP

### Configuration

```json
"periskope-whatsapp": {
  "comment": "Periskope WhatsApp MCP - Cloud-based API service",
  "command": "npx",
  "args": ["-y", "@periskope/whatsapp-mcp"],
  "env": {
    "PERISKOPE_API_KEY": "NEEDS_CONFIGURATION",
    "PERISKOPE_PHONE_ID": "NEEDS_CONFIGURATION"
  }
}
```

### Details

**Type**: Cloud-hosted API service
**Package**: `@periskope/whatsapp-mcp` (npm)
**Website**: https://periskope.app
**Status**: ⏳ Needs API key and phone ID

### Features

- Hosted infrastructure (no local setup)
- Advanced features (bulk operations, analytics)
- Multi-device support
- Ticket management and workflows
- Contact management at scale
- Message search and history
- Scheduled messages

### When to Use

✅ **Use Periskope when you want:**
- Hosted solution (no local server)
- Advanced business features
- Multi-user/team access
- Professional WhatsApp management
- Workflow automation
- Analytics and reporting

### Setup Required

#### Step 1: Create Periskope Account

1. Go to https://periskope.app
2. Sign up for account
3. Connect your WhatsApp number
4. Generate API key from dashboard

#### Step 2: Get Credentials

You need two things:

**PERISKOPE_API_KEY**: From Periskope dashboard
- Login to Periskope account
- Navigate to Settings → API
- Generate/copy your API key

**PERISKOPE_PHONE_ID**: Your WhatsApp number
- Format: Country code + number (no spaces/special chars)
- Example: `50769815142` (Panama +507 number)
- Your number: Based on Ormus contact info

#### Step 3: Update Configuration

```bash
# Edit mcp.json
nano ~/.claude/mcp.json

# Find the periskope-whatsapp section and update:
"PERISKOPE_API_KEY": "your_actual_api_key_here",
"PERISKOPE_PHONE_ID": "50769815142"  # Your actual WhatsApp number
```

#### Step 4: Restart Claude Code

After updating credentials, restart Claude Code to load the new MCP.

### Cost

Periskope is a **paid service**:
- Check https://periskope.app/pricing for current plans
- Typically includes free tier for basic usage
- Paid plans for advanced features and higher volumes

---

## Comparison: Which One to Use?

### Use Gh4stware (Local) If:

✅ You want **complete privacy**
✅ You prefer **self-hosted solutions**
✅ You need **no monthly costs**
✅ You're comfortable with **local setup**
✅ You have **technical control** preferences

### Use Periskope (Cloud) If:

✅ You want **hosted infrastructure**
✅ You need **advanced business features**
✅ You're managing **high message volumes**
✅ You want **team/multi-user access**
✅ You need **analytics and reporting**
✅ You're willing to **pay for convenience**

### Use BOTH If:

✅ **Redundancy**: Fallback if one fails
✅ **Different purposes**: Local for personal, cloud for business
✅ **Testing**: Compare features and performance
✅ **Flexibility**: Choose based on specific task needs

---

## Usage Examples

### With Gh4stware (whatsapp)

```
# Simple message send
Send WhatsApp message to +507 6981-5142: "Hello from Gh4stware MCP!"

# Notification example
Send WhatsApp notification: "Task completed successfully"
```

### With Periskope (periskope-whatsapp)

```
# Using Periskope for advanced features
Use periskope-whatsapp to:
- Search my last 100 WhatsApp messages for "payment"
- Send bulk messages to contact list "clients"
- Get analytics on message response times
- Schedule message for tomorrow 9am

# Notification with scheduling
Use periskope-whatsapp to schedule notification for tomorrow: "Daily standup reminder"
```

---

## Notification System Integration

### Current WhatsApp Notification Setup

**Primary**: Uses whichever MCP you invoke
**Auto-notifications**: Currently set to use available MCP

### Recommended Setup for Notifications

**Option A: Use Gh4stware for all notifications**
- Reliable, local, free
- Already configured
- Works immediately

**Option B: Use Periskope for business notifications**
- Professional features
- Analytics on delivery
- Scheduled notifications
- Team visibility

**Option C: Smart routing**
- Personal notifications → Gh4stware
- Business/client notifications → Periskope
- Critical notifications → Both (redundancy)

### Update Auto-Notification Script

See: `~/.claude/docs/systems/whatsapp-notifications.md`

You can specify which MCP to use:
```
Send notification via Gh4stware: "Task done"
Send notification via Periskope: "Client message sent"
```

---

## Troubleshooting

### Gh4stware Issues

**MCP not loading**:
```bash
# Check Python script exists
ls -la ~/.local/whatsapp-mcp/whatsapp-mcp-server/main.py

# Check Python version
python3 --version

# View setup guide
cat ~/.local/whatsapp-mcp/SETUP_GUIDE.md
```

**Connection issues**:
- Verify WhatsApp Web QR code scanned
- Check local server is running
- Review logs in `~/.local/whatsapp-mcp/`

### Periskope Issues

**API key errors**:
- Verify key is correct (no extra spaces)
- Check key hasn't expired
- Ensure account is active

**Phone ID errors**:
- Format: Numbers only, no +, spaces, or dashes
- Include country code
- Example: `50769815142` not `+507 6981-5142`

**Connection refused**:
- Check internet connection
- Verify Periskope service status
- Ensure npm can reach registry

---

## Security Considerations

### Gh4stware (Local)

**Pros**:
- ✅ Data stays on your machine
- ✅ No cloud exposure
- ✅ Full control over data

**Cons**:
- ⚠️ Local server must stay running
- ⚠️ You manage security updates

### Periskope (Cloud)

**Pros**:
- ✅ Professional infrastructure
- ✅ Managed security updates
- ✅ Enterprise-grade reliability

**Cons**:
- ⚠️ Data stored in cloud
- ⚠️ API key in config file (secure permissions required)
- ⚠️ Third-party access to messages

### Best Practices

1. **File permissions**: Ensure mcp.json is 600 (owner only)
   ```bash
   chmod 600 ~/.claude/mcp.json
   ```

2. **API key rotation**: Regularly update Periskope API key

3. **Sensitive data**: Consider which MCP for sensitive communications

4. **Backup**: Keep both configured for redundancy

---

## Testing Both MCPs

After configuring Periskope credentials and restarting Claude Code:

### Test Gh4stware
```
Using the whatsapp MCP, send a test message to myself: "Testing Gh4stware MCP"
```

### Test Periskope
```
Using the periskope-whatsapp MCP, send a test message to myself: "Testing Periskope MCP"
```

### Verify Both Work
```
List available WhatsApp MCPs and their capabilities
```

---

## Next Steps

**Immediate**:
1. ✅ Gh4stware is already working
2. ⏳ Get Periskope credentials (if you want to use it)
3. ⏳ Update mcp.json with credentials
4. ⏳ Restart Claude Code
5. ⏳ Test both MCPs

**Later**:
- Define notification routing strategy
- Set up scheduled messages (Periskope)
- Configure team access (Periskope if needed)
- Document custom workflows using each MCP

---

## Resources

**Gh4stware**:
- Repository: https://github.com/Gh4stware/whatsapp-mcp
- Local docs: `~/.local/whatsapp-mcp/README.md`
- Setup guide: `~/.local/whatsapp-mcp/SETUP_GUIDE.md`

**Periskope**:
- Website: https://periskope.app
- Signup: https://periskope.app/signup
- npm package: `@periskope/whatsapp-mcp`
- Pricing: https://periskope.app/pricing

**MCP Configuration**:
- Config file: `~/.claude/mcp.json`
- General MCP docs: `~/.claude/docs/systems/mcp.md`
- Status: `~/.claude/docs/systems/mcp-configuration-status.md`
