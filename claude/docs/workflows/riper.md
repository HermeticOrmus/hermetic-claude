# RIPER Workflow (Structured Development)

**For complex multi-phase work**, use the RIPER systematic approach:

**R**esearch → **I**nnovate → **P**lan → **E**xecute → **R**eview

## Philosophy

**Separation of concerns**: Research ≠ Planning ≠ Execution
**Context efficiency**: Each phase uses minimal tokens for its purpose
**Persistent knowledge**: Work documented in `~/dev/[task]/` for resumability
**Conscious progression**: Intentional phase transitions, not reactive coding

## The Five Phases

### Phase 1: Research (Read-only investigation)

```
Command: /riper:research [topic]
Purpose: Understand existing codebase and architecture
Output: ~/dev/[task]/research-notes.md
Access: Read-only (no code changes)
```

**What to do**:
- Examine current implementation
- Understand data flow and dependencies
- Document findings systematically
- Identify constraints and opportunities
- Ask questions, don't assume

**When complete**: Have clear understanding of "what exists now"

---

### Phase 2: Innovate (Optional brainstorming)

```
Command: /riper:innovate [topic]
Purpose: Explore solution possibilities
Output: ~/dev/[task]/approaches.md
Access: Read-only (still no changes)
```

**What to do**:
- Brainstorm multiple approaches
- Compare trade-offs (complexity, performance, maintainability)
- Consider edge cases
- Evaluate against Hermetic principles
- Document rationale for each approach

**When complete**: Have 2-3 viable approaches documented

---

### Phase 3: Plan (Specification and design)

```
Command: /riper:plan [task]
Purpose: Create detailed technical specification
Output: ~/dev/[task]/[task]-plan.md
Access: Can write to memory/docs
```

**What to do**:
- Choose best approach from Innovation phase
- Define success criteria (measurable)
- Break into implementable steps
- Identify tests needed
- Document API/interface changes
- Get approval before proceeding

**When complete**: Have executable specification

**Template**:
```markdown
# [Task] - Technical Plan

## Goal
[What we're building and why]

## Chosen Approach
[Selected approach from Innovation phase]

## Success Criteria
- [ ] Criterion 1 (measurable)
- [ ] Criterion 2
- [ ] Criterion 3

## Implementation Steps
1. Step 1 - [Est. 30 min]
2. Step 2 - [Est. 1 hour]
3. Step 3 - [Est. 45 min]

## Tests Required
- Unit: [Functions to test]
- Integration: [Workflows to test]
- E2E: [User flows to test]

## API Changes
[Document any interface changes]

## Migration Plan
[If applicable]

## Rollback Plan
[How to undo if needed]
```

---

### Phase 4: Execute (Implementation)

```
Command: /riper:execute
Command: /riper:execute [step-number]
Purpose: Implement according to approved plan
Output: Working code
Access: Full (read, write, test)
```

**What to do**:
- Follow the plan sequentially
- Run required commands after each change (format, lint, test)
- Document decisions/deviations in code comments
- Update plan if obstacles discovered
- Commit logical units, not giant batches

**Required after EVERY code change**:
```bash
npm run format && npm run lint && npm test
```

**When complete**: All implementation steps from plan are done, tests pass

---

### Phase 5: Review (Validation)

```
Command: /riper:review
Purpose: Validate against specifications
Output: ~/dev/[task]/review-report.md
Access: Read + Test
```

**What to do**:
- Verify each success criterion met
- Run full test suite
- Check code quality (lint, type-check)
- Review against Gold Hat principles
- Performance check (if applicable)
- Documentation complete
- Create PR checklist

**When complete**: Confident work meets all requirements

**Template**:
```markdown
# [Task] - Review Report

## Success Criteria Status
- [x] Criterion 1 - Met (test: test_criterion_1)
- [x] Criterion 2 - Met (verified manually)
- [ ] Criterion 3 - Partial (see notes)

## Quality Checks
- [x] Tests pass (npm test)
- [x] Lint clean (npm run lint)
- [x] Types valid (npm run type-check)
- [x] Build succeeds (npm run build)

## Gold Hat Validation
- Does this empower? Yes - [reason]
- Any dark patterns? No
- Privacy respected? Yes - [how]

## Performance
[Metrics if applicable]

## Ready for PR
- [x] All criteria met
- [x] Tests comprehensive
- [x] Documentation updated
- [x] CHANGELOG updated
```

---

## Commands Reference

**Start workflow**:
```bash
/riper:research user-authentication
# Investigates current auth system

/riper:innovate user-authentication
# Explores OAuth2, JWT, session-based approaches

/riper:plan user-authentication
# Creates detailed plan for OAuth2 implementation

/riper:execute
# Implements step-by-step

/riper:review
# Validates implementation
```

**Sequential execution** (execute one step at a time):
```bash
/riper:execute 1  # Implement step 1
/riper:execute 2  # Implement step 2
/riper:execute 3  # Implement step 3
```

---

## File Structure

```
~/dev/[task-name]/
├── research-notes.md       # Research phase output
├── approaches.md           # Innovation phase output
├── [task]-plan.md          # Plan phase output (approved spec)
├── [task]-context.md       # Background (from Dev Docs system)
├── [task]-tasks.md         # Task tracking (from Dev Docs system)
└── review-report.md        # Review phase output
```

---

## When to Use RIPER

**Use for**:
- ✅ Complex features (multi-file, multiple systems)
- ✅ Architecture changes
- ✅ Unfamiliar codebase areas
- ✅ High-risk modifications
- ✅ When need to pause/resume work

**Don't use for**:
- ❌ Simple bug fixes (just fix it)
- ❌ Typo corrections
- ❌ Documentation updates
- ❌ One-line changes

---

## Hermetic Principles in RIPER

**Mentalism** (Phase 1-2): Clarify intention before touching code
**Correspondence** (Phase 3): Design reflects requirements
**Vibration** (Phase 4): Ship incrementally, commit often
**Polarity** (Phase 3): Balance competing concerns
**Rhythm** (All phases): Sustainable pace, natural phase transitions
**Cause-Effect** (Phase 5): Verify intended outcomes
**Gender** (All phases): Analysis (planning) + Intuition (innovation)

---

## Phase Transition Checklist

**Research → Innovation**:
- [ ] Current system understood
- [ ] Constraints documented
- [ ] Questions answered

**Innovation → Planning**:
- [ ] Multiple approaches evaluated
- [ ] Trade-offs documented
- [ ] Best approach chosen

**Planning → Execution**:
- [ ] Plan approved (self or team)
- [ ] Success criteria clear
- [ ] Tests identified

**Execution → Review**:
- [ ] All steps implemented
- [ ] All tests pass
- [ ] Required commands run

**Review → Complete**:
- [ ] All criteria met
- [ ] Quality checks pass
- [ ] Ready for PR

---

## Benefits

**Token efficiency**: Each phase uses minimal context
**Resumability**: Can pause and resume at any phase
**Quality**: Forces intentional design before coding
**Documentation**: Process creates complete project history
**Learning**: Systematic approach teaches good patterns
