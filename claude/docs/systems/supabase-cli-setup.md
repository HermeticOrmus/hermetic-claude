# Supabase CLI Setup

## Quick Setup (One-time)

### 1. Get Access Token

1. Go to: https://supabase.com/dashboard/account/tokens
2. Click "Generate new token"
3. Name it: "Claude Code CLI"
4. Copy the token (starts with `sbp_`)

### 2. Set Environment Variable

Add to your shell profile (`~/.bashrc` or Windows environment):

```bash
export SUPABASE_ACCESS_TOKEN="sbp_your_token_here"
```

### 3. Verify Setup

```bash
~/bin/supabase.exe projects list
```

Should list your projects (biogenesis, docti, etc.)

---

## Running Migrations

### Via Supabase CLI

```bash
cd ~/projects/01-ACTIVE/biogenesis-regenerative/website-panama
~/bin/supabase.exe link --project-ref mevizoxvacsamsnxyjki
~/bin/supabase.exe db push
```

### Via Custom Script

```bash
node ~/bin/supabase-migrate.js mevizoxvacsamsnxyjki supabase/migrations/001_create_intake_submissions.sql
```

### Via Supabase Dashboard (Manual)

1. Go to: https://supabase.com/dashboard/project/mevizoxvacsamsnxyjki/sql
2. Paste migration SQL
3. Click "Run"

---

## Project References

| Project | Ref ID |
|---------|--------|
| BioGenesis | `mevizoxvacsamsnxyjki` |
| Docti | `repzrsqutuktdzzxoiio` |

---

## MCP Configuration

The MCP servers in `~/.claude/mcp.json` use Supabase's hosted MCP service.
They authenticate via OAuth (browser popup) on first use per project.

If MCP times out, use the CLI or Dashboard as fallback.

---

*Created: 2026-01-14*
