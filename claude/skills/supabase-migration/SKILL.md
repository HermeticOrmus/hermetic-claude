# Supabase Migration Helper

**Purpose:** Open Supabase dashboard and migration files for manual SQL execution.

**Trigger:** When user needs to run migrations, update Supabase schema, or deploy Edge Functions.

---

## What This Skill Does

1. Opens Supabase Dashboard (projects page)
2. Opens migration file(s) in Notepad for easy copy/paste
3. Provides step-by-step instructions

---

## Procedure

### Step 1: Open Supabase Dashboard
```bash
start https://supabase.com/dashboard/projects
```

### Step 2: Open Migration File(s) in Notepad
```bash
# Single migration
notepad "path/to/migration.sql"

# Multiple migrations (open each)
notepad "path/to/001_first.sql"
notepad "path/to/002_second.sql"
```

### Step 3: Guide User

**For SQL Migrations:**
1. Select your project in Supabase Dashboard
2. Go to **SQL Editor** (left sidebar)
3. Click **New Query**
4. Paste the migration content from Notepad
5. Click **Run** (or Ctrl+Enter)
6. Verify no errors in the output

**For Edge Functions:**
1. Go to **Edge Functions** (left sidebar)
2. Click **Deploy a new function**
3. Or use CLI: `supabase functions deploy function-name`

**For Environment Variables:**
1. Go to **Project Settings** > **API**
2. Copy the URL and anon key to your `.env` file

---

## Common Supabase URLs

| Page | URL Pattern |
|------|-------------|
| Projects | `https://supabase.com/dashboard/projects` |
| SQL Editor | `https://supabase.com/dashboard/project/{ref}/sql` |
| Edge Functions | `https://supabase.com/dashboard/project/{ref}/functions` |
| API Settings | `https://supabase.com/dashboard/project/{ref}/settings/api` |
| Auth Settings | `https://supabase.com/dashboard/project/{ref}/auth/settings` |

---

## Example Usage

**User:** "I need to run the notifications migration"

**Claude:**
```bash
# Open dashboard
start https://supabase.com/dashboard/projects

# Open migration in notepad
notepad "C:\Users\ormus\projects\docti-pro\supabase\migrations\008_notifications.sql"
```

Then guide: "Select your project > SQL Editor > New Query > Paste > Run"

---

## Notes

- Always open files in Notepad for Windows users (easy copy/paste)
- Migration files should be run in order (001, 002, etc.)
- Check for errors after each migration before proceeding
- Edge Functions require CLI deployment or manual upload

---

**Last Updated:** 2026-01-22
**Status:** Active
