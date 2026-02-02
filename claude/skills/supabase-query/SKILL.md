---
name: supabase-query
description: Execute SQL queries on any Supabase project via Management API. Use when needing to run SQL on Supabase, create tables, query data, or manage database schemas.
triggers:
  - supabase query
  - run sql on supabase
  - supabase sql
  - query midnight sun
  - query biogenesis
  - create table supabase
  - supabase database
version: 1.0.0
---

# Supabase Query Skill

Execute SQL queries on any Supabase project using the Management API. Bypasses MCP project-binding issues.

## When This Skill Activates

- User wants to run SQL on a Supabase project
- User needs to create/alter tables
- User wants to query data from Supabase
- User mentions "midnight sun database" or "biogenesis database"

## Available Projects

### Hermetic Account (Token: sbp_64d15ce2602aced67109aa4324130f7eafa389f6)

| Alias | Project | Ref |
|-------|---------|-----|
| `midnight-sun`, `stefano` | Midnight Sun | `yjpiapfrayxaavhccher` |
| `biogenesis-intel`, `war-room` | Biogenesis War-Room | `tnrtofrdfzjbrlqorgvl` |
| `community`, `turpi` | Community Projects | `oexpwvjvnblxjmxfbksd` |

### Docti Account (Token: sbp_7d35e363115a3952471185b627bbf7971be75151)

| Alias | Project | Ref |
|-------|---------|-----|
| `docti`, `docti-biogenesis` | Docti BioGenesis App | `gfncnmrlhctdtzkenxtp` |
| `docti-mcp` | Docti (MCP-connected) | `repzrsqutuktdzzxoiio` |

## Workflow Steps

### 1. Identify Project & Account

Map user's project reference to the correct ref and token:

**Hermetic Account** (sbp_64d15ce...):
- "midnight sun", "stefano", "stefano portal" → `yjpiapfrayxaavhccher`
- "biogenesis intel", "war room" → `tnrtofrdfzjbrlqorgvl`
- "community", "turpi", "hermetic academy" → `oexpwvjvnblxjmxfbksd`

**Docti Account** (sbp_7d35e3...):
- "docti", "docti-biogenesis", "docti app" → `gfncnmrlhctdtzkenxtp`
- "docti-mcp" → `repzrsqutuktdzzxoiio`

### 2. Construct Query

For special commands:
- **list-tables**: `SELECT tablename FROM pg_tables WHERE schemaname = 'public' ORDER BY tablename`
- **describe <table>**: `SELECT column_name, data_type, is_nullable FROM information_schema.columns WHERE table_schema = 'public' AND table_name = '<table>' ORDER BY ordinal_position`

### 3. Execute Query

```bash
curl -s -X POST "https://api.supabase.com/v1/projects/{PROJECT_REF}/database/query" \
  -H "Authorization: Bearer sbp_64d15ce2602aced67109aa4324130f7eafa389f6" \
  -H "Content-Type: application/json" \
  -d '{"query": "{SQL_QUERY}"}'
```

### 4. Format Response

- **Empty array `[]`** → DDL success (CREATE, ALTER, DROP), confirm the operation
- **Array with objects** → Format as markdown table for readability
- **Error object** → Display error message clearly

## List All Projects

```bash
curl -s "https://api.supabase.com/v1/projects" \
  -H "Authorization: Bearer sbp_64d15ce2602aced67109aa4324130f7eafa389f6"
```

## Example Usage

User: "Query the tasks table in midnight sun"

Claude:
1. Resolves "midnight sun" → `yjpiapfrayxaavhccher`
2. Runs: `SELECT * FROM tasks LIMIT 10`
3. Formats results as table
4. Shows to user

User: "Create a users table in biogenesis"

Claude:
1. Resolves "biogenesis" → `tnrtofrdfzjbrlqorgvl`
2. Runs the CREATE TABLE statement
3. Confirms success

## API Reference

| Item | Value |
|------|-------|
| Endpoint | `https://api.supabase.com/v1/projects/{ref}/database/query` |
| Method | POST |
| Auth | `Bearer {TOKEN}` (use correct token for account) |
| Body | `{"query": "SQL statement"}` |

## Tokens

| Account | Token | Projects |
|---------|-------|----------|
| Hermetic | `sbp_64d15ce2602aced67109aa4324130f7eafa389f6` | midnight-sun, biogenesis-intel, community |
| Docti | `sbp_7d35e363115a3952471185b627bbf7971be75151` | docti-biogenesis, docti-mcp |

Each token provides account-level access to all projects under that account.

## MCP vs Management API

The Supabase MCP server is currently configured with `repzrsqutuktdzzxoiio` but has connection timeout issues. Use this skill's curl approach as a reliable fallback.

**When to use this skill:**
- MCP times out on database queries
- Need to run DDL (CREATE, ALTER, DROP)
- Querying a different project than MCP default

**Updated:** 2026-01-12
