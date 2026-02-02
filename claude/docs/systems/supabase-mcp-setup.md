# Supabase MCP Setup Guide

## Overview

**Purpose**: Database integration with Supabase
**Package**: `@modelcontextprotocol/server-supabase` (npm)
**Status**: ⏳ Needs access token
**Priority**: Low (configure only if you use Supabase)

## Required Credentials

You need:
1. **SUPABASE_ACCESS_TOKEN** - Personal access token (required)
2. **SUPABASE_PROJECT_ID** - Specific project ID (optional, per-project)

---

## What is Supabase?

Supabase is an open-source Firebase alternative providing:
- PostgreSQL database
- Authentication
- Real-time subscriptions
- Storage
- Edge functions

**Do you need this?**
- ✅ If you have Supabase projects and want to manage them via Claude
- ✅ If you want database operations through MCP
- ❌ If you don't use Supabase (skip this MCP)

---

## Step 1: Create/Login to Supabase Account

### A. Visit Supabase

Go to: **https://supabase.com**

### B. Sign Up or Login

1. Click **"Start your project"** or **"Sign In"**
2. Use GitHub, GitLab, or email authentication
3. Complete signup if new user

---

## Step 2: Generate Access Token

### A. Navigate to Account Settings

1. Click your **profile icon** (top right)
2. Select **"Account Settings"** or **"Settings"**

### B. Access Tokens Section

1. In left sidebar, click **"Access Tokens"**
2. You'll see the tokens management page

### C. Create New Token

1. Click **"Generate new token"**

2. **Token name**: Give it a descriptive name
   - Example: `Claude Code MCP` or `pop_os-mcp`

3. **Scopes**: Select permissions needed
   - ✅ Read access to projects
   - ✅ Manage projects
   - ✅ Database operations
   - Choose based on what you need

4. Click **"Generate Token"**

### D. Copy Token

**⚠️ CRITICAL**: Copy the token immediately
- Token format: `sbp_abc123...`
- You can only see it once
- Store it securely

---

## Step 3: Get Project ID (Optional)

If you want to work with a specific project:

### A. Navigate to Project

1. Go to **https://app.supabase.com**
2. Select your project

### B. Find Project ID

**Method 1 - Project Settings**:
1. Click **"Settings"** (left sidebar)
2. Click **"General"**
3. Find **"Reference ID"** or **"Project ID"**

**Method 2 - URL**:
The project ID is in the URL:
```
https://app.supabase.com/project/YOUR_PROJECT_ID/...
```

Example: `abcdefghijklmnop`

---

## Step 4: Configure MCP

Once you have credentials, I'll update mcp.json:

**With just access token** (all projects):
```json
"supabase": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-supabase"],
  "env": {
    "SUPABASE_ACCESS_TOKEN": "sbp_your_token_here"
  }
}
```

**With specific project**:
```json
"supabase": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-supabase"],
  "env": {
    "SUPABASE_ACCESS_TOKEN": "sbp_your_token_here",
    "SUPABASE_PROJECT_ID": "your_project_id"
  }
}
```

---

## Features

Once configured, you can:

**Project Management**:
```
List all my Supabase projects
Get details about project "my-app"
```

**Database Operations**:
```
Query the users table in my Supabase database
Insert a new row into table "posts"
```

**Schema Management**:
```
Show me the schema of table "users"
List all tables in my Supabase project
```

**Authentication**:
```
List users in my Supabase auth system
```

---

## Use Cases

**When to use Supabase MCP**:

✅ **Database Management**:
- Query data without SQL client
- Quick data checks
- Update records

✅ **Project Administration**:
- Check project status
- Review database schema
- Monitor usage

✅ **Development**:
- Test queries
- Debug database issues
- Prototype features

❌ **When NOT to use**:
- You don't have Supabase projects
- You prefer direct SQL access
- Low priority for current workflow

---

## Security Considerations

**Access Token**:
- ⚠️ Stored in plaintext in mcp.json
- ✅ File permissions are 600 (owner only)
- ⚠️ Full access to all projects (unless scoped)
- ✅ Can be revoked at any time

**Database Access**:
- Token has same permissions as your account
- Can read/write to databases
- Can manage projects

**Best Practices**:
1. Use minimum necessary token scopes
2. Create dedicated token for MCP integration
3. Rotate token regularly
4. Revoke immediately if compromised
5. Consider using service role keys for production

**Revoke Token**:
1. Go to https://supabase.com/dashboard/account/tokens
2. Find the token
3. Click "Revoke"

---

## Troubleshooting

### "Invalid access token"
- Verify token is correct (starts with `sbp_`)
- Check if token was revoked
- Ensure no extra spaces in mcp.json

### "Project not found"
- Verify project ID is correct
- Check project still exists
- Ensure token has access to project

### "Permission denied"
- Check token scopes
- Verify you own the project
- Ensure token hasn't expired

### MCP not loading
- Check JSON syntax in mcp.json
- Restart Claude Code
- Verify npm can access package

---

## Quick Setup Checklist

- [ ] Determine if you need Supabase MCP
- [ ] Create/login to Supabase account
- [ ] Generate access token with appropriate scopes
- [ ] Copy token securely
- [ ] (Optional) Get project ID if needed
- [ ] Provide credentials to configure mcp.json
- [ ] Restart Claude Code
- [ ] Test with a simple query

---

## Alternative: Supabase CLI

If you prefer command-line access:

```bash
# Install Supabase CLI
npm install -g supabase

# Login
supabase login

# Link project
supabase link --project-ref YOUR_PROJECT_ID
```

MCP provides AI-friendly interface, CLI provides direct control.

---

## Resources

- **Supabase Dashboard**: https://app.supabase.com
- **Generate Tokens**: https://supabase.com/dashboard/account/tokens
- **Documentation**: https://supabase.com/docs
- **npm Package**: https://www.npmjs.com/package/@modelcontextprotocol/server-supabase
- **MCP Config**: `~/.claude/mcp.json`

---

## Next Steps

**If you use Supabase**:
1. **Generate token** at https://supabase.com/dashboard/account/tokens
2. **Get project ID** (optional)
3. **Provide credentials** so I can update mcp.json
4. **Restart** Claude Code
5. **Test** with a simple query

**If you don't use Supabase**:
- Skip this MCP (it's optional)
- Can add later if needed
- No impact on other MCPs

**Ready to configure? Provide your SUPABASE_ACCESS_TOKEN (and optional PROJECT_ID)!**
