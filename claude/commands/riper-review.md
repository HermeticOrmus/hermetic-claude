# RIPER: Review Phase

**Phase 5 of 5** - Validation and quality assurance

## Purpose

Validate implementation against specifications created in Plan phase. Ensure work meets all success criteria, quality standards, and ethical principles before considering it complete.

## What This Does

1. Verifies each success criterion met
2. Runs comprehensive quality checks
3. Reviews against Gold Hat principles
4. Checks performance (if applicable)
5. Validates documentation completeness
6. Creates PR readiness checklist
7. Generates review report

## Prerequisites

**Required before review**:
- ✅ Execute phase complete (all plan steps implemented)
- ✅ All tests passing
- ✅ Quality pipeline clean
- ✅ Commits pushed to branch

## Usage

```bash
/riper:review [task-name]

# Examples:
/riper:review user-authentication
/riper:review payment-processing
/riper:review database-migration
```

## Implementation

**Step 1: Verify execution complete**
```bash
cd ~/dev/[task-name]

# Check plan exists
if [ ! -f [task-name]-plan.md ]; then
    echo "❌ Error: Plan not found"
    exit 1
fi

# Check if all steps marked complete
if grep -q "🔄 In Progress" [task-name]-plan.md; then
    echo "⚠️  Warning: Plan shows steps still in progress"
    echo "Complete all steps before review"
    exit 1
fi

echo "✅ Execution appears complete, starting review..."
```

**Step 2: Create review report**
```bash
cat > review-report.md <<'EOF'
# [Task Name] - Review Report

**Date**: [Current date]
**Reviewer**: [Your name or "Self"]
**Branch**: [feature-branch-name]
**Status**: 🔍 In Review → ✅ Approved / ⚠️ Issues Found

---

## Success Criteria Validation

Review each criterion from `[task]-plan.md`:

### Must Have (Blocking)

- [ ] **Criterion 1**: [Description from plan]
  - **Status**: ✅ Met / ⚠️ Partial / ❌ Not Met
  - **Evidence**: [How verified - test name, manual check, etc.]
  - **Notes**: [Any relevant details]

- [ ] **Criterion 2**: [Description from plan]
  - **Status**: ✅ Met / ⚠️ Partial / ❌ Not Met
  - **Evidence**: [How verified]
  - **Notes**: [Details]

- [ ] **Criterion 3**: [Description from plan]
  - **Status**: ✅ Met / ⚠️ Partial / ❌ Not Met
  - **Evidence**: [How verified]
  - **Notes**: [Details]

### Should Have (Important)

- [ ] **Criterion 4**: [Description]
  - **Status**: ✅ Met / ⚠️ Partial / ❌ Not Met / ⏭️ Deferred
  - **Evidence**: [How verified]
  - **Notes**: [Details]

### Nice to Have (Optional)

- [ ] **Criterion 5**: [Description]
  - **Status**: ✅ Met / ⏭️ Deferred
  - **Rationale**: [If deferred, why]

---

## Quality Checks

### Code Quality

**Format Check**:
```bash
# JavaScript/TypeScript
npm run format
# Result: ✅ Pass / ❌ Fail

# Python
black --check .
# Result: ✅ Pass / ❌ Fail
```

**Lint Check**:
```bash
# JavaScript/TypeScript
npm run lint
# Result: ✅ Pass / ❌ Fail
# Issues: [List any lint errors/warnings]

# Python
ruff check .
# Result: ✅ Pass / ❌ Fail
# Issues: [List any issues]
```

**Type Check** (if applicable):
```bash
# TypeScript
npm run type-check
# Result: ✅ Pass / ❌ Fail
# Errors: [List any type errors]

# Python
mypy src/
# Result: ✅ Pass / ❌ Fail
# Errors: [List any type errors]
```

**Build Check**:
```bash
# JavaScript/TypeScript
npm run build
# Result: ✅ Pass / ❌ Fail
# Output size: [e.g., 245 KB]

# Python
python -m build
# Result: ✅ Pass / ❌ Fail
```

---

### Test Coverage

**Unit Tests**:
```bash
npm test -- --coverage
# or: pytest --cov=src tests/

# Coverage: [X]%
# Result: ✅ Pass / ❌ Fail
# Failed tests: [List any failures]
```

**Coverage Report**:
| File | Coverage | Notes |
|------|----------|-------|
| src/auth/jwt.ts | 95% | ✅ Excellent |
| src/auth/oauth.ts | 78% | ⚠️ Below target (80%) |
| src/auth/routes.ts | 85% | ✅ Good |

**Overall**: [X]% (Target: 80%)

**Integration Tests**:
```bash
npm test:integration
# Result: ✅ Pass / ❌ Fail
# Scenarios covered: [List workflows tested]
```

**E2E Tests** (if applicable):
```bash
npm test:e2e
# Result: ✅ Pass / ❌ Fail
# User flows covered: [List flows tested]
```

---

## Gold Hat Validation

**Core Question**: Does this empower or extract?

### Empowerment Check

✅ **Empowers users with**:
- [Specific capability 1]
- [Specific capability 2]
- [Specific capability 3]

✅ **Respects user autonomy**:
- [How - e.g., "Clear opt-in required", "No data collected without consent"]

✅ **Operates transparently**:
- [How - e.g., "OAuth permissions clearly stated", "Privacy policy updated"]

✅ **Teaches while helping**:
- [How - e.g., "Error messages explain what went wrong and how to fix"]

### Ethical Concerns

❌ **Dark patterns**: [None found / List any concerns]

❌ **Privacy issues**: [None found / List any concerns]

❌ **Manipulation**: [None found / List any concerns]

❌ **Exploitation**: [None found / List any concerns]

### Verdict

- [ ] ✅ **Passes Gold Hat test** - Empowers genuinely, no ethical concerns
- [ ] ⚠️ **Has concerns** - Needs addressing (list below)
- [ ] ❌ **Fails Gold Hat test** - Extractive or harmful (explain below)

**Notes**: [Any ethical considerations or improvements]

---

## Hermetic Principles Alignment

**Mentalism**:
- [ ] Intention clear in code (comments explain WHY)
- [ ] Documentation reflects purpose
- **Notes**: [How well code expresses intention]

**Correspondence**:
- [ ] Architecture reflects requirements
- [ ] File structure mirrors mental model
- **Notes**: [How well structure matches design]

**Vibration**:
- [ ] Code shipped incrementally (commit history)
- [ ] Iteration based on tests
- **Notes**: [Quality of iterative development]

**Polarity**:
- [ ] Trade-offs balanced (performance vs readability, etc.)
- [ ] Competing concerns addressed
- **Notes**: [How balance was achieved]

**Rhythm**:
- [ ] Sustainable pace maintained (no heroics)
- [ ] Regular commits (not giant batch)
- **Notes**: [Development rhythm quality]

**Cause-Effect**:
- [ ] Intentional changes, verified outcomes
- [ ] Tests prove intended effects
- **Notes**: [How well outcomes match intentions]

**Gender**:
- [ ] Analysis + Intuition balanced
- [ ] Logical structure + User empathy
- **Notes**: [Balance of technical and human considerations]

---

## Performance Validation

**If performance is a success criterion**:

### Load Testing
```bash
# Example: API endpoint
ab -n 1000 -c 10 http://localhost:3000/api/endpoint

# Results:
# Requests per second: [X]
# Average response time: [Y] ms
# 95th percentile: [Z] ms
```

**Target**: [Target from plan]
**Actual**: [Actual result]
**Status**: ✅ Meets target / ⚠️ Below target / ❌ Fails target

### Bundle Size (if frontend)
```bash
npm run build
ls -lh dist/

# Main bundle: [X] KB
# Target: < [Y] KB
# Status: ✅ / ⚠️ / ❌
```

### Database Query Performance
```sql
EXPLAIN ANALYZE [query];

# Execution time: [X] ms
# Target: < [Y] ms
# Status: ✅ / ⚠️ / ❌
```

**Performance Notes**: [Any optimizations made or needed]

---

## Security Review

### Security Checklist

- [ ] **Input validation**: All user inputs validated
- [ ] **SQL injection**: Parameterized queries used
- [ ] **XSS prevention**: Output sanitized
- [ ] **CSRF protection**: CSRF tokens implemented
- [ ] **Authentication**: Secure auth flow (no plain passwords)
- [ ] **Authorization**: Permissions checked
- [ ] **Secrets management**: No secrets in code (use env vars)
- [ ] **HTTPS**: Enforced in production
- [ ] **Rate limiting**: Implemented (if public endpoint)
- [ ] **Error messages**: Don't leak sensitive info

**Security Concerns**: [None / List any issues found]

**Security Improvements**: [Any hardening recommendations]

---

## Documentation Review

### Code Documentation

- [ ] **Inline comments**: Complex logic explained (WHY, not WHAT)
- [ ] **Function docs**: Public APIs documented
- [ ] **Types**: TypeScript types complete (or Python type hints)
- [ ] **TODOs**: None (or documented in issues)

### Project Documentation

- [ ] **README.md**: Updated (if public API changed)
- [ ] **CHANGELOG.md**: Entry added for this feature
- [ ] **API docs**: Updated (if API changes)
- [ ] **User guide**: Created/updated (if needed)

**Documentation Status**: ✅ Complete / ⚠️ Incomplete (details below)

**Missing Documentation**: [List any gaps]

---

## Git Hygiene Review

### Commit Quality

**Commit count**: [X] commits
**Commit message quality**: ✅ Good / ⚠️ Needs improvement

**Sample commits**:
```
feat(auth): add OAuth2 login support ✅
fix stuff ❌
wip ❌
```

**Issues**: [Any poorly written commit messages]

### Branch Status

```bash
git status

# Clean working tree: ✅ Yes / ❌ No (uncommitted changes)
# Pushed to remote: ✅ Yes / ❌ No
# Up to date with main: ✅ Yes / ❌ No (needs rebase)
```

---

## Issues Found

### Blocking Issues (Must fix before PR)

1. **Issue 1**: [Description]
   - **Severity**: 🔴 Blocking
   - **Impact**: [What breaks]
   - **Fix**: [How to resolve]
   - **Status**: ⏳ Open / ✅ Resolved

2. **Issue 2**: [Description]
   - **Severity**: 🔴 Blocking
   - **Impact**: [What breaks]
   - **Fix**: [How to resolve]
   - **Status**: ⏳ Open / ✅ Resolved

### Non-Blocking Issues (Should fix)

1. **Issue 1**: [Description]
   - **Severity**: 🟡 Warning
   - **Impact**: [Minor concern]
   - **Fix**: [How to improve]
   - **Status**: ⏳ Open / ✅ Resolved / ⏭️ Deferred

### Suggestions (Nice to have)

1. **Suggestion 1**: [Description]
   - **Benefit**: [Why this would help]
   - **Effort**: [Low / Medium / High]
   - **Status**: 💡 Consider / ⏭️ Future work

---

## PR Readiness Checklist

**Before creating PR**:

- [ ] All "Must Have" success criteria met
- [ ] All quality checks pass (format, lint, type, test, build)
- [ ] Test coverage ≥ 80% (or project threshold)
- [ ] Gold Hat principles validated
- [ ] Security review complete
- [ ] Documentation updated
- [ ] Commit messages clear
- [ ] Branch pushed to remote
- [ ] No uncommitted changes
- [ ] Up to date with main branch

**PR readiness**: [ ] ✅ Ready / [ ] ⚠️ Issues to fix first

---

## Review Summary

### What Went Well

- [Positive 1]
- [Positive 2]
- [Positive 3]

### What Could Improve

- [Improvement 1]
- [Improvement 2]

### Lessons Learned

- [Lesson 1]
- [Lesson 2]

### Time Analysis

**Estimated Total**: [X hours from plan]
**Actual Total**: [Y hours from execution]
**Variance**: [+/- Z hours]

**Time breakdown**:
- Research: [X hours]
- Planning: [X hours]
- Execution: [X hours]
- Review: [X hours]

**Estimation Accuracy**: [Good / Needs improvement]
**Why**: [Reason for variance]

---

## Final Verdict

- [ ] ✅ **APPROVED** - Ready for PR, meets all criteria
- [ ] ⚠️ **APPROVED WITH NOTES** - Ready for PR, minor improvements noted
- [ ] 🔴 **CHANGES REQUIRED** - Fix blocking issues before PR
- [ ] ❌ **REJECTED** - Fundamental issues, restart execution

**Reviewer Notes**: [Final thoughts, recommendations]

---

## Next Steps

**If Approved**:
1. Create pull request
2. Link this review report in PR description
3. Request team review (if applicable)
4. Address PR feedback
5. Merge when approved

**If Changes Required**:
1. Fix blocking issues listed above
2. Re-run quality pipeline
3. Run `/riper:review` again
4. Repeat until approved

**PR Template** (if approved):
```markdown
## Summary
[Brief description of feature]

## Related Plan
See `~/dev/[task-name]/[task]-plan.md` for detailed specification

## Review Report
See `~/dev/[task-name]/review-report.md` for complete validation

## Success Criteria
- [x] Criterion 1
- [x] Criterion 2
- [x] Criterion 3

## Changes
- Change 1
- Change 2

## Testing
All tests pass. Coverage: [X]%

## Screenshots
[If UI changes]
```

---

**Reviewed**: [Date]
**Reviewer**: [Name]
**Status**: [Approved / Changes Required]

EOF
```

**Step 3: Run automated checks**

```bash
echo "Running quality pipeline..."

# Format
npm run format
FORMAT_STATUS=$?

# Lint
npm run lint
LINT_STATUS=$?

# Type check (if applicable)
npm run type-check 2>/dev/null
TYPE_STATUS=$?

# Tests
npm test -- --coverage
TEST_STATUS=$?

# Build
npm run build
BUILD_STATUS=$?

echo ""
echo "📊 Quality Pipeline Results"
echo "============================"
echo "Format:     $([ $FORMAT_STATUS -eq 0 ] && echo '✅ Pass' || echo '❌ Fail')"
echo "Lint:       $([ $LINT_STATUS -eq 0 ] && echo '✅ Pass' || echo '❌ Fail')"
echo "Type Check: $([ $TYPE_STATUS -eq 0 ] && echo '✅ Pass' || echo '❌ Fail')"
echo "Tests:      $([ $TEST_STATUS -eq 0 ] && echo '✅ Pass' || echo '❌ Fail')"
echo "Build:      $([ $BUILD_STATUS -eq 0 ] && echo '✅ Pass' || echo '❌ Fail')"
echo ""

# Coverage report
echo "📈 Test Coverage"
echo "================"
# Display coverage summary (implementation depends on test framework)
```

**Step 4: Manual validation**

Open `[task-name]-plan.md` and review each success criterion:

```bash
# Open plan and review report side-by-side
code ~/dev/[task-name]/[task-name]-plan.md
code ~/dev/[task-name]/review-report.md

# Manually verify each criterion
# Update review-report.md with evidence
```

**Step 5: Gold Hat check**

Ask critical questions:

1. **Does this empower users?**
   - What genuine capability does it provide?
   - Do users have more autonomy after this?

2. **Are there dark patterns?**
   - Infinite scroll? FOMO mechanics? Hidden opt-outs?
   - Manipulative notifications?

3. **Privacy respected?**
   - Data collection minimal and consented?
   - Transparent about what's tracked?

4. **Would you be proud of this in production?**
   - Ethical? Sustainable? Empowering?

Document honest answers in review report.

**Step 6: Performance check (if applicable)**

If performance was a success criterion:

```bash
# Load test API endpoint
ab -n 1000 -c 10 http://localhost:3000/api/endpoint

# Check bundle size
npm run build
ls -lh dist/

# Profile database queries
# [Project-specific tooling]
```

Compare against targets in plan.

**Step 7: Finalize review report**

Fill in all sections of `review-report.md`:
- Success criteria validation (with evidence)
- Quality check results
- Gold Hat validation
- Performance metrics
- Issues found (blocking, warning, suggestions)
- PR readiness checklist
- Final verdict

---

## Review Modes

### Mode 1: Self-Review (Recommended)

**You review your own work**:

1. Run automated checks
2. Validate success criteria manually
3. Fill out review report honestly
4. Fix issues found
5. Re-review until approved

**Best for**: Solo development, learning, quality discipline

---

### Mode 2: Peer Review

**Another developer reviews**:

1. You run automated checks, create draft report
2. Peer reviews code and report
3. Peer adds findings to report
4. You address feedback
5. Repeat until approved

**Best for**: Team development, knowledge sharing, quality gates

---

### Mode 3: Automated Review

**CI/CD system runs checks**:

1. Push branch to remote
2. CI runs quality pipeline
3. Generate automated report
4. Manual validation for success criteria
5. Approve if all pass

**Best for**: Large teams, regulated environments, consistency

---

## Common Review Findings

### Code Quality Issues

**Lint errors**:
```
❌ 'variable' is assigned a value but never used
❌ Expected '===' but found '=='
❌ Missing return type on function
```

**Fix**: Address each lint error before PR

**Type errors**:
```
❌ Property 'name' does not exist on type 'User'
❌ Type 'string | undefined' is not assignable to type 'string'
```

**Fix**: Add proper types, handle undefined cases

### Test Coverage Gaps

```
⚠️ src/auth/oauth.ts: 65% coverage (below 80% target)

Uncovered lines:
- Line 42: Error handling branch
- Line 58-62: Edge case for expired tokens
```

**Fix**: Add tests for uncovered branches

### Security Concerns

```
🔴 Password transmitted in plain text (line 125)
🔴 SQL query uses string concatenation (line 89)
⚠️ No rate limiting on login endpoint
```

**Fix**: Use HTTPS, parameterized queries, add rate limiting

### Documentation Gaps

```
⚠️ README.md not updated with new OAuth setup instructions
⚠️ No inline comments explaining JWT refresh logic
```

**Fix**: Update documentation

---

## When Issues Found

### Blocking Issues (Stop, Fix, Re-Review)

**Examples**:
- Tests failing
- Security vulnerabilities
- Success criteria not met
- Ethical concerns

**Process**:
1. Document issue in review report
2. Mark verdict as "Changes Required"
3. Return to Execute phase
4. Fix the issues
5. Run `/riper:review` again

### Non-Blocking Issues (Fix or Defer)

**Examples**:
- Coverage slightly below target (78% vs 80%)
- Minor refactoring opportunity
- Documentation improvement

**Process**:
1. Document in review report
2. Decide: Fix now or defer to future work
3. If deferring, create issue/TODO
4. Can still approve PR with notes

### Suggestions (Nice to Have)

**Examples**:
- "Could extract this to separate function"
- "Consider using library X instead of custom code"
- "Performance could be improved with caching"

**Process**:
1. Note in review report
2. Discuss with team
3. Defer to future optimization
4. Approve PR

---

## Review Report Usage

### As PR Description

Include review report summary in PR:

```markdown
## Review Summary

**Success Criteria**: All 5/5 met ✅
**Quality Checks**: All passing ✅
**Test Coverage**: 87% ✅
**Gold Hat**: Empowering, no ethical concerns ✅

Full review: `~/dev/user-authentication/review-report.md`
```

### As Documentation

Keep review report for future reference:

- Shows quality was validated
- Documents trade-offs made
- Captures lessons learned
- Helps estimate future work

### As Learning Tool

Review your review reports:

- Are you improving at estimation?
- Common issues patterns?
- What slows you down?
- Where do you excel?

---

## Access Level

**Read + Test + Document**:

- ✅ Read all code
- ✅ Run tests
- ✅ Create review report
- ✅ Update documentation
- ⚠️ Fix issues (return to Execute phase if needed)
- ❌ Major code changes (should re-execute if needed)

---

## Review Checklist

**Complete review requires**:

- [ ] All automated checks run (format, lint, type, test, build)
- [ ] All success criteria validated with evidence
- [ ] Test coverage meets target (typically 80%+)
- [ ] Gold Hat principles validated
- [ ] Security review complete
- [ ] Performance validated (if applicable)
- [ ] Documentation reviewed
- [ ] Git hygiene checked
- [ ] Issues categorized (blocking, warning, suggestion)
- [ ] PR readiness checklist complete
- [ ] Review report filled out completely
- [ ] Final verdict decided
- [ ] Next steps documented

---

## When Complete

You should have:

1. **Complete review report** - `~/dev/[task-name]/review-report.md`
2. **Quality validated** - All checks passing
3. **Criteria verified** - Success criteria met with evidence
4. **Ethics validated** - Gold Hat principles upheld
5. **PR ready** - Either approved or clear list of fixes needed

**Next actions**:
- **If approved**: Create pull request
- **If changes needed**: Return to Execute phase, fix issues, re-review

---

## Tips

**Be honest**: Self-review requires discipline. Don't skip issues.

**Document evidence**: "Criterion met" isn't enough. How did you verify?

**Run all checks**: Don't assume tests pass. Run them.

**Test manually**: Automated tests don't catch everything. Click through UI.

**Think like a user**: Does this actually empower? Or just technically correct?

**Sleep on it**: Review next day with fresh eyes. You'll catch more.

**Learn from issues**: Patterns in review findings teach what to avoid.

---

## Philosophy

**Cause-Effect**: Verify intended outcomes achieved

**Mentalism**: Reflect on whether intention manifested in reality

**Correspondence**: Implementation matches plan

**Polarity**: Balance thoroughness vs. perfectionism

---

**Systematic validation. Quality proven. Ethics upheld. Ready to ship.**

