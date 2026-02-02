---
name: open
description: Open a project from ~/projects by name or partial match. Lists projects if no match found.
version: 1.0.0
hermetic_principle: Correspondence - Navigate the filesystem as you navigate reality
auto_trigger:
  keywords:
    - "open project"
    - "switch to project"
    - "go to project"
    - "work on"
---

# Open Project

**Purpose:** Quickly navigate to any project in `~/projects/` by name or partial match.

**Usage:** `/open <project-name>` or `/open` to list all projects

---

## Project Directory Structure

```
~/projects/
├── 01-ACTIVE/          <- Primary work (most used)
├── 02-COACHING-SPIRITUAL/
├── 03-BUSINESS-VENTURES/
├── 04-HERMETIC-TECH/
├── 05-AUTOMATION-TOOLS/
├── 06-ALQVIMIA/
├── 07-CONTENT-KNOWLEDGE/
├── 08-DEVELOPMENT/
├── 09-CLIENT-WORK/
├── 10-ARCHIVED/
└── [loose projects at root]
```

---

## Step-by-Step Procedure

### Step 1: Parse Input

If `{args}` is provided:
- Treat as project name or partial match
- Case-insensitive matching

If no args:
- List all projects with categories

### Step 2: Search for Project

**Search order (priority):**
1. Exact match in any category
2. Partial match (contains) in 01-ACTIVE first
3. Partial match in other categories
4. Fuzzy match if no direct matches

**Search command:**
```bash
# Find all project directories (depth 2 for categorized, depth 1 for loose)
find ~/projects -maxdepth 2 -type d -name "*{query}*" 2>/dev/null | grep -v "^\.$"
```

### Step 3: Handle Results

**If single match found:**
1. Change working directory to project
2. Read project's CLAUDE.md if it exists
3. Show project status (git status, recent files)
4. Report ready to work

**If multiple matches found:**
1. List all matches with full paths
2. Ask user to specify which one
3. Show category for each (e.g., "01-ACTIVE", "10-ARCHIVED")

**If no matches found:**
1. List similar project names (fuzzy suggestions)
2. Offer to list all projects in a category

### Step 4: Open the Project

When project is identified:

```bash
# Change to project directory
cd ~/projects/{category}/{project-name}

# Check for project-specific instructions
if [ -f CLAUDE.md ]; then
    echo "Found project CLAUDE.md"
fi

# Show project status
git status --short 2>/dev/null || echo "Not a git repo"
ls -la
```

**Actions to perform:**
1. Read CLAUDE.md (project instructions) if exists
2. Read README.md if exists and no CLAUDE.md
3. Show git status
4. List recent files modified

---

## Output Format

### When Opening Successfully

```
Opened: {project-name}
Path: ~/projects/{category}/{project-name}

{Show CLAUDE.md contents if exists}

Git Status:
{git status output}

Recent Activity:
{5 most recently modified files}
```

### When Listing Projects

```
Projects in ~/projects/:

01-ACTIVE (primary work):
  - hermetic-ormus-caduceus
  - LibreUIUX-Claude-Code
  - meta-learning
  ...

02-COACHING-SPIRITUAL:
  - chaos-wheel-site
  ...

[continue for other categories]
```

### When Multiple Matches

```
Multiple projects match "{query}":

1. 01-ACTIVE/hermetic-ormus-caduceus
2. 01-ACTIVE/hermetic-ormus-dojo
3. 10-ARCHIVED/hermetic-agents-pack

Which one? (enter number or more specific name)
```

---

## Example Usage

### Example 1: Exact Match
```
User: /open caduceus
Claude: Opens ~/projects/01-ACTIVE/hermetic-ormus-caduceus
```

### Example 2: Partial Match
```
User: /open lib
Claude: Opens ~/projects/01-ACTIVE/LibreUIUX-Claude-Code (only match containing "lib")
```

### Example 3: Multiple Matches
```
User: /open hermetic
Claude: Lists all projects containing "hermetic", asks which one
```

### Example 4: List All
```
User: /open
Claude: Lists all projects organized by category
```

### Example 5: Category Browse
```
User: /open active
Claude: Lists all projects in 01-ACTIVE/
```

---

## Quick Reference - Active Projects

These are in `01-ACTIVE/` (most used):

| Short Name | Full Path |
|------------|-----------|
| caduceus | hermetic-ormus-caduceus |
| libre | LibreUIUX-Claude-Code |
| dojo | hermetic-ormus-dojo |
| academy | hermetic-academy |
| diego | diego-bodart-site |
| biogenesis | biogenesis-regenerative |
| learning | meta-learning |
| bazaar | bazaar-companion |
| ctrl | ctrl-alt-fix |
| turpi | turpi-ai |
| atlantis | atlantis-trader |
| panda | PandaCompanion |
| realityos | RealityOS |
| luxor | luxor-studios |

---

## Notes

- **01-ACTIVE is primary** - Search there first
- **10-ARCHIVED contains old projects** - Warn if opening archived
- **CLAUDE.md is priority** - Always read if exists
- **Git status matters** - Show uncommitted changes immediately
- **Syncthing synced** - These sync to Windows machine

---

**Last Updated:** 2026-01-06
**Status:** Active
