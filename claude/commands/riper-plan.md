# RIPER: Plan Phase

**Phase 3 of 5** - Specification and design

## Purpose

Create detailed technical specification for implementation. This phase transforms research insights and chosen approach into executable plan.

## What This Does

1. Reviews research findings and innovation options
2. Selects best approach with clear rationale
3. Creates detailed technical specification
4. Breaks work into implementable steps
5. Defines success criteria (measurable)
6. Identifies required tests
7. Documents API/interface changes
8. Creates migration/rollback plans if needed

## Prerequisites

**Required before planning**:
- ✅ Research phase complete (`research-notes.md` exists)
- ✅ Approaches evaluated (or single clear approach identified)
- ✅ Constraints understood
- ✅ Current system architecture documented

## Usage

```bash
/riper:plan [task-name]

# Examples:
/riper:plan user-authentication
/riper:plan payment-processing
/riper:plan database-migration
```

## Implementation

**Step 1: Verify prerequisites**
```bash
cd ~/dev/[task-name]

# Check research exists
if [ ! -f research-notes.md ]; then
    echo "❌ Error: Research phase not complete"
    echo "Run: /riper:research [task-name] first"
    exit 1
fi

echo "✅ Research found, proceeding to planning..."
```

**Step 2: Create plan document**
```bash
# Create [task-name]-plan.md
cat > [task-name]-plan.md <<'EOF'
# [Task Name] - Technical Plan

**Date**: [Current date]
**Status**: Draft → Approved → In Progress → Complete

---

## Goal

**What**: [What we're building - one sentence]

**Why**: [Business/technical justification - why this matters]

**Success Looks Like**: [Clear end state description]

---

## Chosen Approach

**Selected**: [Approach name from Innovation phase]

**Rationale**:
- Reason 1 (why this over alternatives)
- Reason 2
- Reason 3

**Trade-offs Accepted**:
- Trade-off 1 (what we're sacrificing)
- Trade-off 2

**Rejected Approaches**:
- Alternative A - [Why not chosen]
- Alternative B - [Why not chosen]

---

## Success Criteria

**Must Have** (blocking):
- [ ] Criterion 1 - [Measurable, verifiable]
- [ ] Criterion 2 - [Measurable, verifiable]
- [ ] Criterion 3 - [Measurable, verifiable]

**Should Have** (important):
- [ ] Criterion 4
- [ ] Criterion 5

**Nice to Have** (optional):
- [ ] Criterion 6

**Verification Method**: [How to verify each criterion]

---

## Implementation Steps

**Estimated Total Time**: [X hours/days]

### Phase 1: Foundation
**Est**: [X hours]

1. **Step 1** - [Action verb: Create, Update, Refactor, etc.]
   - What: [Specific change]
   - Where: [File paths]
   - Why: [Rationale]
   - Est: 30 min

2. **Step 2** - [Action verb]
   - What: [Specific change]
   - Where: [File paths]
   - Why: [Rationale]
   - Est: 1 hour

### Phase 2: Core Implementation
**Est**: [X hours]

3. **Step 3** - [Action verb]
   - What: [Specific change]
   - Where: [File paths]
   - Why: [Rationale]
   - Est: 45 min

4. **Step 4** - [Action verb]
   - What: [Specific change]
   - Where: [File paths]
   - Why: [Rationale]
   - Est: 2 hours

### Phase 3: Integration
**Est**: [X hours]

5. **Step 5** - [Action verb]
   - What: [Specific change]
   - Where: [File paths]
   - Why: [Rationale]
   - Est: 1 hour

---

## Tests Required

### Unit Tests
**Coverage Target**: 80%+

- `test_function_1()` - [What it verifies]
- `test_function_2()` - [What it verifies]
- `test_edge_case_1()` - [What it verifies]

**Files**: `tests/unit/[module].test.js`

### Integration Tests

- `test_workflow_1()` - [End-to-end workflow]
- `test_integration_point_1()` - [System interaction]

**Files**: `tests/integration/[feature].test.js`

### E2E Tests (if applicable)

- User flow 1: [Description]
- User flow 2: [Description]

**Files**: `tests/e2e/[feature].spec.js`

### Manual Testing Checklist

- [ ] Test case 1
- [ ] Test case 2
- [ ] Test case 3

---

## API / Interface Changes

**Breaking Changes**: [Yes/No - list if yes]

### New Endpoints (if applicable)
```
POST /api/endpoint
GET /api/endpoint/:id
```

### Modified Endpoints
```
PUT /api/endpoint/:id
- Added field: newField (string)
- Deprecated field: oldField (use newField instead)
```

### New Functions/Classes
```typescript
function newFunction(params: Type): ReturnType
class NewClass { ... }
```

### Modified Signatures
```typescript
// Before
function oldSignature(param: string): void

// After
function oldSignature(param: string, newParam?: boolean): void
```

---

## Data Changes

**Database Migrations**: [Yes/No]

**Migration Script**: `migrations/YYYY-MM-DD-[description].sql`

```sql
-- Example migration
ALTER TABLE users ADD COLUMN new_field VARCHAR(255);
CREATE INDEX idx_users_new_field ON users(new_field);
```

**Data Migration**: [Steps to migrate existing data]

---

## Dependencies

**New Dependencies**:
- `package-name@version` - [Why needed]
- `another-package@version` - [Why needed]

**Updated Dependencies**:
- `existing-package`: `1.0.0` → `2.0.0` - [Breaking changes]

**Dev Dependencies**:
- `test-library@version` - [For testing new feature]

---

## Configuration Changes

**Environment Variables**:
```bash
NEW_CONFIG_VAR=value  # Description of what this controls
```

**Config Files**:
- `config/[file].json` - [Changes needed]

---

## Migration Plan

**Deployment Strategy**: [Blue-green / Rolling / Feature flag / etc.]

**Steps**:
1. Deploy code with feature flag OFF
2. Run database migration
3. Enable feature flag for 10% users
4. Monitor metrics for 24 hours
5. Gradually increase to 100%

**Monitoring**:
- Metric 1 to watch
- Metric 2 to watch
- Error rate threshold

---

## Rollback Plan

**If things go wrong**:

1. **Immediate**: Toggle feature flag OFF
2. **Code rollback**: Revert to commit `[hash]`
3. **Database rollback**: Run `migrations/rollback/[date]-[description].sql`

**Rollback Script**:
```bash
#!/bin/bash
# Automated rollback
git revert [commit-hash]
npm run db:rollback
npm run deploy
```

---

## Documentation Updates

**Files to update**:
- [ ] `README.md` - [What to add]
- [ ] `docs/api.md` - [New endpoints]
- [ ] `CHANGELOG.md` - [Entry for this feature]
- [ ] Inline code comments - [Complex logic]

**New Documentation**:
- [ ] `docs/[feature]-guide.md` - [User guide]

---

## Security Considerations

**Sensitive Data**: [How handling sensitive data]
**Authentication**: [Changes to auth flow]
**Authorization**: [New permissions/roles]
**Input Validation**: [What inputs validated and how]
**SQL Injection**: [Parameterized queries used]
**XSS Prevention**: [Output sanitization]

---

## Performance Considerations

**Expected Load**: [Requests/second, data volume]
**Optimization Strategy**: [Caching, indexing, etc.]
**Bottlenecks Identified**: [Potential slow points]
**Scalability**: [How this scales]

---

## Hermetic Alignment

**Mentalism**: [Intention clarified - why this approach]
**Correspondence**: [Structure mirrors requirements]
**Vibration**: [Incremental shipping strategy]
**Polarity**: [Trade-offs balanced - X vs Y]
**Rhythm**: [Sustainable pace - no heroics]
**Cause-Effect**: [Intentional outcomes defined]
**Gender**: [Analysis + Intuition combined]

**Gold Hat**: Does this empower or extract? [Answer and why]

---

## Risks & Mitigations

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
| Breaking change to mobile app | Medium | High | Feature flag + versioned API |
| Database migration takes too long | Low | Medium | Run during low-traffic window |
| External API rate limits | High | Medium | Implement caching layer |

---

## Timeline

**Total Estimated Time**: [X hours/days]

**Breakdown**:
- Planning: [X hours] ← (This document)
- Implementation: [X hours]
- Testing: [X hours]
- Documentation: [X hours]
- Review: [X hours]

**Target Completion**: [Date]

---

## Sign-off

**Plan Status**: [ ] Draft / [ ] Approved / [ ] In Progress / [ ] Complete

**Approved By**: [Name/Self] on [Date]

**Ready to Execute**: [Yes/No]

---

## Notes

[Any additional context, gotchas, or considerations]

---

**Next Phase**: `/riper:execute` to begin implementation
EOF
```

**Step 3: Populate plan from research**

Read `research-notes.md` to inform:
- Current implementation details
- Constraints to respect
- Opportunities to leverage
- Questions that need answers

Read `approaches.md` (if Innovation phase was run):
- Approach comparisons
- Trade-off analysis
- Recommendation

**Step 4: Break work into concrete steps**

Each step should be:
- **Actionable**: Start with verb (Create, Update, Refactor, Delete)
- **Specific**: Exact file paths and changes
- **Estimable**: Time estimate (15min, 30min, 1hr, 2hr)
- **Testable**: How to verify it worked
- **Ordered**: Dependencies clear (step 2 needs step 1)

**Bad step**:
```
- Implement authentication
```

**Good step**:
```
3. Create JWT token generation utility
   - What: Add `generateToken(userId)` function
   - Where: `src/auth/jwt.ts`
   - Why: Centralize token logic, enable testing
   - Test: Unit test with mock userId
   - Est: 30 min
```

**Step 5: Define measurable success criteria**

**Bad criterion**:
```
- Authentication works well
```

**Good criterion**:
```
- User can log in with email + password and receive valid JWT token (verify with /api/me endpoint returning 200)
```

**Step 6: Get approval**

Before executing:
- Review plan yourself (sleep on it)
- Share with team/lead if applicable
- Ensure all questions answered
- Verify estimates realistic

Mark as **Approved** when ready.

## Access Level

**Can write**: Documentation, plan files
**Cannot modify**: Production code (that's Execute phase)

- ✅ Create plan documents
- ✅ Read codebase for planning
- ✅ Document architecture
- ❌ Modify production code
- ❌ Change configuration
- ❌ Create feature branches (Execute phase)

## Plan Quality Checklist

**Before marking plan as Approved**:

- [ ] Goal is clear and measurable
- [ ] Chosen approach has clear rationale
- [ ] Success criteria are verifiable
- [ ] Implementation steps are ordered logically
- [ ] Each step has time estimate
- [ ] Tests identified for all new code
- [ ] API/interface changes documented
- [ ] Migration plan exists (if data changes)
- [ ] Rollback plan exists
- [ ] Security considered
- [ ] Performance considered
- [ ] Documentation updates listed
- [ ] Risks identified with mitigations
- [ ] Hermetic principles applied
- [ ] Gold Hat litmus test passed
- [ ] Timeline realistic
- [ ] Plan approved (self or team)

## When Complete

You should have:
1. **Executable specification** - Clear enough that anyone could implement
2. **Success criteria** - Know when you're done
3. **Risk awareness** - Understand what could go wrong
4. **Approval** - Green light to proceed
5. **~/dev/[task-name]/[task-name]-plan.md** - Complete and approved

**Next phase**: `/riper:execute` to begin implementation

## Tips

**Be specific**: "Add field to User model" → "Add `lastLoginAt` (timestamp) to User model in `models/user.ts`"

**Estimate conservatively**: Add 25% buffer to time estimates

**Plan for failure**: Always have rollback strategy

**Think in phases**: Foundation → Core → Integration (not all at once)

**Document decisions**: Future you will thank you

**Get feedback**: Share plan before executing (if working with others)

## Philosophy

**Mentalism**: Clarify intention completely before acting
**Correspondence**: Plan structure mirrors implementation structure
**Rhythm**: Sustainable estimates, not heroic effort
**Cause-Effect**: Intentional design yields predictable results

## Example Output

```markdown
# OAuth2 Login - Technical Plan

## Goal
Add OAuth2 authentication using Google and GitHub providers to replace password-only auth

## Chosen Approach
**Selected**: OAuth2 with Passport.js

**Rationale**:
- Battle-tested library (1M+ downloads/week)
- Supports multiple providers easily
- Integrates with existing Express middleware
- Good documentation

## Success Criteria
- [ ] User can log in with Google account (redirects, returns JWT)
- [ ] User can log in with GitHub account (redirects, returns JWT)
- [ ] Existing password login still works (backward compatible)
- [ ] User profile syncs from OAuth provider (name, email, avatar)

## Implementation Steps

### Phase 1: Foundation (2 hours)
1. Install dependencies - 15 min
   - passport, passport-google-oauth20, passport-github2
   - @types/passport (TypeScript)

2. Create OAuth config - 30 min
   - src/auth/oauth-config.ts
   - Environment variables for client IDs/secrets
   - Callback URLs configuration

### Phase 2: Core Implementation (3 hours)
3. Implement Google OAuth strategy - 1.5 hours
   - src/auth/strategies/google.ts
   - Passport strategy configuration
   - Profile to user mapping

4. Implement GitHub OAuth strategy - 1.5 hours
   - src/auth/strategies/github.ts
   - Similar to Google

### Phase 3: Integration (2 hours)
5. Add OAuth routes - 1 hour
   - GET /auth/google
   - GET /auth/google/callback
   - GET /auth/github
   - GET /auth/github/callback

6. Update user model - 1 hour
   - Add oauthProvider field
   - Add oauthId field
   - Migration script

## Tests Required
- test_google_oauth_flow() - Full OAuth flow with mocked Google
- test_github_oauth_flow() - Full OAuth flow with mocked GitHub
- test_profile_sync() - User data synced correctly
- test_backward_compatibility() - Password login still works
```

