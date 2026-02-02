---
name: docti-deploy
description: Deploy specific Docti Pro client to Vercel
version: 1.0.0
invocation: /docti-deploy
---

# /docti-deploy - Deploy Docti Pro Client

Deploy a specific client application to Vercel.

## When to Use
- Deploy new version of client app
- Deploy after feature completion
- Deploy to staging or production

## Available Clients

| Client | Directory | Vercel Project |
|--------|-----------|----------------|
| `biogenesis` | `clients/biogenesis/` | docti-pro-biogenesis |

## Usage

```
/docti-deploy <client> [--prod]
```

Examples:
- `/docti-deploy biogenesis` - Deploy to preview
- `/docti-deploy biogenesis --prod` - Deploy to production

## Process

### Step 1: Navigate to Client Directory
```bash
cd ~/projects/09-CLIENT-WORK/Docti/clients/<client>
```

### Step 2: Pre-deploy Checks
```bash
# Type check
npm run typecheck

# Build locally to verify
npm run build
```

### Step 3: Deploy to Vercel

**Preview deployment:**
```bash
vercel --token "$VERCEL_TOKEN"
```

**Production deployment:**
```bash
vercel --prod --token "$VERCEL_TOKEN"
```

### Step 4: Verify Deployment
- Check Vercel dashboard for build status
- Test preview URL
- Verify environment variables are set

## Environment Variables (Vercel)

Ensure these are configured in Vercel project settings:

```
SUPABASE_URL=
SUPABASE_KEY=
GOOGLE_CLIENT_ID=
GOOGLE_CLIENT_SECRET=
PERISKOPE_API_KEY=
RESEND_API_KEY=
RESEND_FROM_EMAIL=noreply@docti.io
```

## Deployment Checklist

Before deploying:
- [ ] All type checks pass
- [ ] Build succeeds locally
- [ ] No console errors
- [ ] Environment variables verified

After deploying:
- [ ] Preview URL accessible
- [ ] Auth flow works
- [ ] API endpoints respond
- [ ] Notifications functional (if enabled)

## Rollback

If deployment fails:
```bash
# List recent deployments
vercel ls --token "$VERCEL_TOKEN"

# Rollback to specific deployment
vercel rollback <deployment-url> --token "$VERCEL_TOKEN"
```

## Troubleshooting

**Build fails:**
- Check Vercel build logs
- Verify Node.js version (use 20.x)
- Check for missing dependencies

**Environment variable issues:**
- Verify all required vars set in Vercel
- Check for typos in variable names
- Ensure no trailing whitespace

**Auth issues after deploy:**
- Verify callback URLs in Google Console
- Check SUPABASE_URL and SUPABASE_KEY
