# RIPER: Research Phase

**Phase 1 of 5** - Read-only investigation of existing codebase

## Purpose

Understand the current system before making any changes. This phase is purely investigative - NO code modifications.

## What This Does

1. Creates task directory structure in `~/dev/[task-name]/`
2. Investigates existing codebase related to the task
3. Documents findings in `research-notes.md`
4. Identifies constraints, dependencies, and opportunities
5. Prepares foundation for Innovation phase

## Usage

```bash
/riper:research [task-name]

# Examples:
/riper:research user-authentication
/riper:research payment-processing
/riper:research database-migration
```

## Implementation

**Step 1: Create directory structure**
```bash
mkdir -p ~/dev/[task-name]
cd ~/dev/[task-name]
```

**Step 2: Initialize research notes**
```markdown
# [Task Name] - Research Notes

## Date
[Current date]

## Goal
[What we're trying to understand]

## Current Implementation
[Document what exists now]

### Architecture
- Component A: [Purpose, location]
- Component B: [Purpose, location]
- Component C: [Purpose, location]

### Data Flow
[How data moves through the system]

### Dependencies
- Internal: [Other system components]
- External: [Libraries, services]

### Constraints
- Technical: [Language, framework limitations]
- Business: [Requirements, regulations]
- Performance: [Speed, scale requirements]

## Key Files
- `path/to/file1.ts` - [Purpose]
- `path/to/file2.ts` - [Purpose]

## Questions
- [ ] Question 1
- [ ] Question 2
- [ ] Question 3

## Opportunities
- Improvement 1
- Improvement 2

## Risks
- Risk 1 and mitigation
- Risk 2 and mitigation

## Next Steps
Move to Innovation phase to explore approaches
```

**Step 3: Investigate codebase**

Read relevant files:
```bash
# Find files related to the task
find . -name "*auth*" -o -name "*login*"  # Example for auth task

# Read key files
cat src/auth/login.ts
cat src/auth/middleware.ts

# Check tests
cat tests/auth/*.test.ts

# Review documentation
cat docs/authentication.md
```

**Step 4: Document findings**

Fill in the research notes template with:
- Current architecture
- Data flow diagrams (text-based)
- Dependencies identified
- Constraints discovered
- Questions that need answering
- Opportunities for improvement

## Research Checklist

- [ ] Identified all components involved
- [ ] Understood data flow
- [ ] Documented dependencies (internal and external)
- [ ] Listed constraints (technical, business, performance)
- [ ] Found relevant files and their purposes
- [ ] Identified tests covering this area
- [ ] Noted opportunities for improvement
- [ ] Documented risks and potential issues
- [ ] All questions answered or documented
- [ ] Ready to move to Innovation phase

## Access Level

**READ ONLY** - No code modifications allowed in this phase

- ✅ Read files
- ✅ Search codebase
- ✅ Run tests (read-only)
- ✅ Review documentation
- ❌ Modify code
- ❌ Create new files (except research notes)
- ❌ Change configuration

## When Complete

You should have:
1. Complete understanding of current implementation
2. All questions answered
3. Constraints documented
4. Opportunities identified
5. `~/dev/[task-name]/research-notes.md` filled out

**Next phase**: `/riper:innovate [task-name]` to explore solution approaches

## Tips

**Be thorough**: Time spent in research saves time in execution
**Ask questions**: Document what you don't understand
**No assumptions**: Verify everything by reading code
**Follow the data**: Trace how data flows through the system
**Check tests**: They reveal expected behavior
**Note patterns**: Existing patterns should guide new code

## Philosophy

**Mentalism**: Understand the system's mental model before changing it
**Correspondence**: Map how components relate to each other
**Rhythm**: Natural pacing - don't rush to coding

## Example Output

```markdown
# User Authentication - Research Notes

## Current Implementation

### Architecture
- `src/auth/login.ts` - Express route handler for login
- `src/auth/middleware.ts` - JWT validation middleware
- `src/auth/user.service.ts` - Database operations
- `src/auth/crypto.ts` - Password hashing (bcrypt)

### Data Flow
1. User POST /login with credentials
2. Login handler validates input
3. User service queries database
4. Crypto service verifies password
5. JWT token generated and returned

### Dependencies
- Internal: Database service, Logger
- External: jsonwebtoken (v9.0.0), bcrypt (v5.1.0)

### Constraints
- Must support existing JWT tokens (breaking change risk)
- GDPR compliance required (password handling)
- 99.9% uptime SLA

## Opportunities
- Add refresh tokens (currently only access tokens)
- Implement rate limiting (currently missing)
- Add 2FA support

## Risks
- Changing JWT structure breaks mobile app
- Password reset flow has no tests
```
