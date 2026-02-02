---
name: supabase-switch
description: Switch active Supabase project for MCP connection
version: 2.0.0
author: Claude
user_invocable: true
arguments: "[project-name] - Name of project to switch to (e.g., biogenesis, docti)"
---

# Supabase Project Switcher

Switch between configured Supabase projects for MCP database operations.

## Usage

```
/supabase-switch              # List available projects
/supabase-switch biogenesis   # Switch to BioGenesis project
/supabase-switch docti        # Switch to Docti project
```

## Behavior

1. Read `~/.claude/supabase-projects.json` for available projects
2. If no argument: display current project and list available options
3. If argument provided: update activeProject and mcp.json URL
4. Notify user to restart Claude Code for changes to take effect

## Implementation

When invoked, perform these steps:

### Step 1: Read current configuration
```
Read: ~/.claude/supabase-projects.json
Read: ~/.claude/mcp.json (to find current project_ref in URL)
```

### Step 2: If no argument provided
Display:
- Current active project (name, ref, description)
- List of all available projects

### Step 3: If project name provided
1. Validate project exists in config
2. Update `activeProject` in supabase-projects.json
3. Update the `url` field in ~/.claude/mcp.json under supabase server:
   - Change: `https://mcp.supabase.com/mcp?project_ref=OLD_REF`
   - To: `https://mcp.supabase.com/mcp?project_ref=NEW_REF`
4. Display success message with restart instruction

### MCP Config Format (HTTP-based)

```json
"supabase": {
  "comment": "Supabase MCP - ProjectName (ref). Use /supabase-switch to change.",
  "type": "http",
  "url": "https://mcp.supabase.com/mcp?project_ref=PROJECT_REF_HERE",
  "headers": {
    "Authorization": "Bearer ACCESS_TOKEN_HERE"
  }
}
```

### Step 4: Adding new projects
To add a new project, edit `~/.claude/supabase-projects.json`:
```json
{
  "activeProject": "biogenesis",
  "projects": {
    "new-project": {
      "name": "Human Readable Name",
      "ref": "supabase-project-ref-here",
      "description": "What this project is for"
    }
  }
}
```

## Project Registry Location
`~/.claude/supabase-projects.json`

## MCP Config Location
`~/.claude/mcp.json` (supabase server entry - HTTP type with URL containing project_ref)

## Notes
- Uses Supabase's hosted MCP server at mcp.supabase.com
- Project selection via `project_ref` URL parameter
- Authentication via PAT in Authorization header
- Requires Claude Code restart after switching
