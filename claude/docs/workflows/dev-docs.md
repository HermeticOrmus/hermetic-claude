# Dev Docs System

**Purpose**: Task-specific documentation workflow for complex projects

**Location**: `~/dev/`

## Structure (per task)

```
~/dev/
└── [task-name]/
    ├── [task]-plan.md      # Strategic approach, phases, milestones
    ├── [task]-context.md   # Background, requirements, constraints
    └── [task]-tasks.md     # Specific actionable tasks
```

## When to Use

**Use for**:
- ✅ Complex multi-day projects
- ✅ Need to pause and resume work
- ✅ Multiple interrelated tasks
- ✅ Context needs preservation

**Don't use for**:
- ❌ Simple quick tasks
- ❌ Single-session work

## Commands

- `/dev-docs [task-name]` - Create new dev docs structure
- `/update-dev-docs [task-name]` - Update existing docs

## Templates

### Template - plan.md

```markdown
# [Task Name] - Plan

## Goal
[What we're trying to achieve]

## Phases
1. [Phase 1 name]: [Description]
2. [Phase 2 name]: [Description]
...

## Milestones
- [ ] Milestone 1
- [ ] Milestone 2

## Success Criteria
[How we know it's done]
```

### Template - context.md

```markdown
# [Task Name] - Context

## Background
[Why this matters]

## Requirements
- Requirement 1
- Requirement 2

## Constraints
- Constraint 1
- Constraint 2

## Related Work
[Links to related projects/docs]
```

### Template - tasks.md

```markdown
# [Task Name] - Tasks

## Current Focus
[What we're working on right now]

## Todo
- [ ] Task 1
- [ ] Task 2

## In Progress
- [ ] Task being worked on

## Blocked
- [ ] Task blocked (reason)

## Completed
- [x] Completed task
```

## Workflow

1. Start complex project → `/dev-docs project-name`
2. Plan approach in `-plan.md`
3. Document context in `-context.md`
4. Track tasks in `-tasks.md`
5. Update as work progresses → `/update-dev-docs project-name`
6. Archive when complete

## Integration

**Links to relevant code**: Connect to `.claude/memory/`
**Preserves context**: Across sessions
**Related to RIPER**: Can be used alongside RIPER workflow

## Example Usage

```bash
# Start new project documentation
/dev-docs oauth-implementation

# Creates:
# ~/dev/oauth-implementation/
#   ├── oauth-implementation-plan.md
#   ├── oauth-implementation-context.md
#   └── oauth-implementation-tasks.md

# Work on implementation, then update
/update-dev-docs oauth-implementation
```

## Benefits

**Context preservation**: Never lose track of where you left off
**Resumability**: Pick up complex work after days or weeks
**Documentation**: Automatic project history
**Planning**: Forces structured thinking before implementation
