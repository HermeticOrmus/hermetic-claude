# Resume Project

Resume work on a project by loading its context and status.

## Usage
```
/resume-project [project-name]
/resume-project TheJourney
/resume-project         # Uses current directory
```

## Arguments
$ARGUMENTS - Optional project name or path. Defaults to current working directory.

---

## Workflow

### 1. Locate Project
```
@if $ARGUMENTS is empty:
  → Use current working directory
@else:
  → Search ~/projects/01-ACTIVE/ for matching project
  → Search ~/projects/ recursively if not found
```

### 2. Load Context Files (Priority Order)
```
@sequential[
  → Read DEV_STATUS.md (primary status file)
  → Read CLAUDE.md (project-specific instructions)
  → Read .claude-session.md if exists (last session state)
  → Scan for TODO.md, ROADMAP.md, or similar
]
```

### 3. Quick Scan
```
@parallel[
  → git status (uncommitted changes)
  → git log -3 (recent commits)
  → Check for error logs or test failures
]
```

### 4. Present Summary
Output a concise summary:
```markdown
## Project: {name}
**Phase**: {current phase from DEV_STATUS}
**Last Session**: {date and summary}

### Recent Changes
- {git log summary}

### Uncommitted Work
- {git status summary}

### Ready to Continue
{Next logical task based on DEV_STATUS}

What would you like to work on?
```

---

## Context Loading Strategy

| File | Purpose | Priority |
|------|---------|----------|
| `DEV_STATUS.md` | Development progress, session notes | 1 |
| `CLAUDE.md` | Project-specific AI instructions | 2 |
| `.claude-session.md` | Last session handoff state | 3 |
| `TODO.md` / `ROADMAP.md` | Task lists | 4 |
| `docs/*.md` | Architecture docs | 5 |

---

## Session Handoff Format

When ending a session, save to `.claude-session.md`:
```markdown
# Session Handoff - {date}

## What Was Done
- {completed tasks}

## Current State
- {where we stopped}
- {any running processes}

## Next Steps
- {immediate next task}
- {blockers or decisions needed}

## Key Files Modified
- {file}: {what changed}
```

---

## Example Output

```
## Project: TheJourney
**Phase**: 3.5 - Bazaar-Style Card System
**Last Session**: 2025-12-20 - Implemented 10-slot board with drag-drop

### Recent Changes
- Fixed double header UI bug
- Added F5 restart keybind
- Created card system (CardData, CardInstance, Board)

### Uncommitted Work
- Modified: scripts/battle/battle_arena.gd
- Modified: scripts/cards/board.gd

### Ready to Continue
Test full game loop with new card system, add more card types.

What would you like to work on?
```

---

*v1.0 | Created: 2025-12-20*
