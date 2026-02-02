# RIPER: Execute Phase

**Phase 4 of 5** - Implementation according to approved plan

## Purpose

Implement the technical specification created in Plan phase. This phase turns design into working code following a systematic, testable approach.

## What This Does

1. Executes implementation steps from approved plan
2. Enforces quality pipeline after every change
3. Documents decisions and deviations
4. Commits logical units (not giant batches)
5. Updates plan if obstacles discovered
6. Maintains focus on one step at a time

## Prerequisites

**Required before executing**:
- ✅ Plan phase complete (`[task]-plan.md` exists and approved)
- ✅ Success criteria defined
- ✅ Implementation steps documented
- ✅ Tests identified
- ✅ Development environment ready

## Usage

```bash
# Execute all steps sequentially
/riper:execute [task-name]

# Execute specific step
/riper:execute [task-name] [step-number]

# Examples:
/riper:execute user-authentication
/riper:execute user-authentication 1
/riper:execute payment-processing 3
```

## Implementation

**Step 1: Verify prerequisites**
```bash
cd ~/dev/[task-name]

# Check plan exists and is approved
if [ ! -f [task-name]-plan.md ]; then
    echo "❌ Error: Plan phase not complete"
    echo "Run: /riper:plan [task-name] first"
    exit 1
fi

# Verify plan is approved
if ! grep -q "Approved" [task-name]-plan.md; then
    echo "⚠️  Warning: Plan not marked as Approved"
    echo "Review and approve plan before executing"
    read -p "Continue anyway? (y/N) " -n 1 -r
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

echo "✅ Plan approved, proceeding to execution..."
```

**Step 2: Execution workflow**

For each implementation step:

### 2.1: Read the step
```markdown
From plan.md:

3. **Create JWT token generation utility**
   - What: Add `generateToken(userId)` function
   - Where: `src/auth/jwt.ts`
   - Why: Centralize token logic, enable testing
   - Est: 30 min
```

### 2.2: Implement the step
```bash
# Create/modify the specified files
# Follow the "What" and "Where" from the step

# Example:
# Create src/auth/jwt.ts
# Add generateToken function
# Add tests in tests/auth/jwt.test.ts
```

### 2.3: Run quality pipeline (REQUIRED)
```bash
# JavaScript/TypeScript
npm run format && npm run lint && npm test

# Python
black . && ruff check --fix && mypy src/ && pytest

# Go
gofmt -w . && golangci-lint run && go test ./...

# Rust
cargo fmt && cargo clippy && cargo test
```

**This is NON-NEGOTIABLE.** After EVERY code change.

### 2.4: Document decisions
```bash
# If you deviate from plan or make important decision:
echo "## Execution Notes" >> [task-name]-plan.md
echo "" >> [task-name]-plan.md
echo "**Step 3 - Decision**: Used bcrypt instead of argon2 because..." >> [task-name]-plan.md
```

### 2.5: Commit logical unit
```bash
# Commit this step before moving to next
git add .
git commit -m "feat(auth): add JWT token generation utility

Implements step 3 of user-authentication plan.

- Created src/auth/jwt.ts with generateToken()
- Added unit tests with 90% coverage
- Centralized token logic for reusability
"
```

### 2.6: Update plan status
```markdown
## Implementation Steps

### Phase 1: Foundation

1. ~~Step 1 - Install dependencies~~ ✅ Complete
2. ~~Step 2 - Create OAuth config~~ ✅ Complete
3. **Step 3 - Create JWT utility** ← 🔄 In Progress
4. Step 4 - Implement Google strategy
```

### 2.7: Move to next step

Repeat 2.1-2.6 for each step in the plan.

---

## Execution Modes

### Mode 1: Sequential Execution (Recommended)

Execute all steps one by one:

```bash
/riper:execute user-authentication
```

**Process**:
1. Start with step 1
2. Implement → Test → Commit
3. Move to step 2
4. Implement → Test → Commit
5. Continue until all steps complete

**Best for**: Complex features, unfamiliar code, learning

---

### Mode 2: Step-by-Step Execution

Execute specific step only:

```bash
/riper:execute user-authentication 3
```

**Process**:
1. Read step 3 from plan
2. Implement just that step
3. Run quality pipeline
4. Commit
5. Stop (wait for next command)

**Best for**: When interrupted, resuming work, parallel development

---

### Mode 3: Manual Execution

Use plan as guide, execute manually:

1. Open `~/dev/[task-name]/[task-name]-plan.md`
2. Implement each step yourself
3. Mark steps complete as you go
4. Run quality pipeline after each step
5. Commit logical units

**Best for**: Experienced developers, simple features

---

## Quality Enforcement

**After EVERY code modification**, run:

### JavaScript/TypeScript Projects
```bash
npm run format    # Prettier/ESLint fix
npm run lint      # Catch errors
npm test          # Verify functionality
npm run build     # Ensure builds

# Or one-liner:
npm run format && npm run lint && npm test && npm run build
```

### Python Projects
```bash
black .                    # Format
ruff check --fix          # Lint
mypy src/                 # Type check
pytest                    # Test

# Or one-liner:
black . && ruff check --fix && mypy src/ && pytest
```

### Go Projects
```bash
gofmt -w .               # Format
golangci-lint run        # Lint
go test ./...            # Test
go build                 # Build

# Or one-liner:
gofmt -w . && golangci-lint run && go test ./... && go build
```

### Rust Projects
```bash
cargo fmt                # Format
cargo clippy             # Lint
cargo test               # Test
cargo build --release    # Build

# Or one-liner:
cargo fmt && cargo clippy && cargo test && cargo build --release
```

**If quality pipeline fails**: Fix the issue before proceeding. Never skip.

---

## Handling Obstacles

### When You Hit a Blocker

**Don't push through blindly.** Document and adapt:

1. **Document the obstacle**:
```markdown
## Execution Blockers

**Step 5 - Blocked**: Cannot implement Google OAuth callback

**Issue**: Google OAuth requires HTTPS in production but local dev is HTTP

**Impact**: Cannot test OAuth flow locally

**Options**:
- A: Use ngrok for local HTTPS (quick but adds dependency)
- B: Use mocks for local OAuth (cleaner but less realistic)
- C: Deploy to staging to test (slow feedback loop)

**Decision**: Option B - Mock OAuth locally, test on staging
**Rationale**: Keeps dev env simple, staging tests are realistic enough
```

2. **Update plan**:
```markdown
5. **Implement Google OAuth callback** - Modified
   - What: Add callback route (mock locally, real on staging)
   - Where: `src/auth/routes.ts`
   - Why: HTTPS requirement prevents local OAuth
   - Test: Mock tests locally, E2E on staging
   - Est: 2 hours → 3 hours (added staging deploy)
```

3. **Continue with modified approach**

### When Estimates Are Wrong

**If step takes longer than estimated**:

```markdown
## Execution Notes

**Step 3 - Time Adjustment**: Estimated 30 min, actual 2 hours

**Reason**: JWT library documentation outdated, had to read source code

**Learning**: Always check library version against docs

**Updated Total**: 8 hours → 9.5 hours
```

**Don't feel bad.** Estimates are guesses. Document reality.

### When You Discover Better Approach

**Mid-execution insight**:

```markdown
## Execution Notes

**Step 4 - Approach Change**: Switched from custom JWT to Auth0

**Original Plan**: Implement JWT manually with passport-jwt

**New Approach**: Use Auth0 SDK (managed service)

**Rationale**:
- Reduces security risk (expert team manages tokens)
- Faster implementation (SDK handles edge cases)
- Better monitoring (Auth0 dashboard)

**Trade-off**: Monthly cost ($25), external dependency

**Decision**: Proceed with Auth0, update steps 4-6 accordingly
```

**Update plan to reflect new reality.**

---

## Commit Strategy

### Commit Frequently (Logical Units)

**Good commit size**: One step from plan = one commit

**Example**:
```bash
git commit -m "feat(auth): add JWT token generation

Implements step 3 of user-authentication plan.

- Created src/auth/jwt.ts with generateToken()
- Added unit tests (90% coverage)
- Centralized token logic for reuse
- Handles expiration and signing

Tests: npm test
"
```

**Bad commit**:
```bash
git commit -m "wip"  # No context
git commit -m "fixed stuff"  # Not specific
git commit -m "added auth system"  # Too large (many steps)
```

### Commit Message Format

Follow conventional commits:

```
type(scope): brief description

Detailed explanation of what changed and why.

- Bullet point 1
- Bullet point 2

Tests: [how to verify]
Related: #issue-number (if applicable)
```

**Types**:
- `feat`: New feature
- `fix`: Bug fix
- `refactor`: Code restructuring
- `test`: Adding tests
- `docs`: Documentation

### When to Commit

✅ **Do commit**:
- After each plan step completes
- After quality pipeline passes
- Before switching context
- At end of coding session

❌ **Don't commit**:
- Mid-step (unless saving WIP on separate branch)
- With failing tests
- Before running quality pipeline
- Broken/untested code

---

## Progress Tracking

### Update Plan Status

Mark steps as you complete them:

```markdown
## Implementation Steps

### Phase 1: Foundation
1. ~~Install dependencies~~ ✅ Complete (15 min actual)
2. ~~Create OAuth config~~ ✅ Complete (45 min actual)

### Phase 2: Core
3. **Create JWT utility** ← 🔄 In Progress
4. Implement Google strategy
5. Implement GitHub strategy

### Phase 3: Integration
6. Add OAuth routes
7. Update user model
```

**Symbols**:
- ~~Strikethrough~~ ✅ = Complete
- **Bold** 🔄 = In Progress
- Regular = Not started
- ⚠️ = Blocked

### Track Actual vs Estimated Time

```markdown
## Time Tracking

| Step | Estimated | Actual | Variance |
|------|-----------|--------|----------|
| 1. Install deps | 15 min | 15 min | On target |
| 2. OAuth config | 30 min | 45 min | +15 min (unfamiliar) |
| 3. JWT utility | 30 min | 2 hours | +1.5 hr (docs outdated) |

**Total**: 3 hours estimated → 3 hours actual (so far)
```

**Why track**: Learn to estimate better, identify patterns

---

## Testing During Execution

### Test Each Step

Don't wait until end to test. Test incrementally:

**Step 3: Create JWT utility**
```bash
# Implement function
vim src/auth/jwt.ts

# Write test immediately
vim tests/auth/jwt.test.ts

# Run test
npm test tests/auth/jwt.test.ts

# Verify it passes
✓ generateToken creates valid JWT (15ms)
✓ generateToken includes userId in payload (8ms)
✓ generateToken sets correct expiration (12ms)

# Commit
git add src/auth/jwt.ts tests/auth/jwt.test.ts
git commit -m "feat(auth): add JWT token generation"
```

### Test Types by Step

**Unit tests** (most steps):
- Test individual functions
- Mock dependencies
- Fast feedback (milliseconds)

**Integration tests** (integration steps):
- Test component interactions
- Real dependencies (database, etc.)
- Slower (seconds)

**E2E tests** (final steps):
- Test user workflows
- Full system
- Slowest (seconds to minutes)

---

## Access Level

**Full access** - This is the implementation phase:

- ✅ Read files
- ✅ Modify code
- ✅ Create new files
- ✅ Change configuration
- ✅ Run tests
- ✅ Commit changes
- ✅ Update plan (if needed)

---

## Execution Checklist

**For each step**:

- [ ] Read step from plan
- [ ] Understand "What", "Where", "Why"
- [ ] Implement the changes
- [ ] Write/update tests
- [ ] Run quality pipeline (format, lint, test, build)
- [ ] All checks pass
- [ ] Document any deviations
- [ ] Commit with descriptive message
- [ ] Mark step complete in plan
- [ ] Move to next step

**When all steps complete**:

- [ ] All plan steps marked complete
- [ ] All tests passing
- [ ] Quality pipeline clean
- [ ] Commits pushed to branch
- [ ] Plan updated with actual times
- [ ] Obstacles documented
- [ ] Ready for Review phase

---

## When Complete

You should have:
1. **Working implementation** - All plan steps executed
2. **All tests passing** - Quality pipeline clean
3. **Logical commits** - Clear git history
4. **Updated plan** - Reflects reality (deviations, time, obstacles)
5. **Ready for review** - Confident in quality

**Next phase**: `/riper:review` to validate implementation

---

## Tips

**Start small**: Implement simplest step first (build confidence)

**Test immediately**: Write test right after implementation (not at end)

**Commit often**: One step = one commit (easy to revert)

**Document surprises**: Found something unexpected? Document it

**Ask for help**: Stuck >30 min? Ask (don't waste time)

**Take breaks**: Pomodoro technique (25 min work, 5 min break)

**Review your commits**: `git log --oneline` - does it tell a story?

---

## Philosophy

**Vibration**: Ship incrementally, commit often, iterate based on tests

**Rhythm**: Sustainable pace, regular breaks, don't burn out

**Cause-Effect**: Intentional changes, run tests, verify outcomes

**Correspondence**: Implementation mirrors plan, code reflects design

---

## Example Execution Session

```bash
# Session start
cd ~/dev/user-authentication
git checkout -b feature/oauth-login

# Step 1: Install dependencies (15 min)
npm install passport passport-google-oauth20 passport-github2
npm install -D @types/passport
npm run format && npm run lint && npm test
git add package.json package-lock.json
git commit -m "chore(auth): add OAuth dependencies

Installs Passport.js and OAuth providers for step 1.
"

# Step 2: Create OAuth config (30 min)
vim src/auth/oauth-config.ts
vim .env.example  # Add OAuth client ID/secret placeholders
npm run format && npm run lint && npm test
git add src/auth/oauth-config.ts .env.example
git commit -m "feat(auth): add OAuth configuration

Creates config for Google and GitHub OAuth providers.

- Loads from environment variables
- Exports passport strategies
- Documents required env vars in .env.example
"

# Step 3: JWT utility (30 min)
vim src/auth/jwt.ts
vim tests/auth/jwt.test.ts
npm run format && npm run lint && npm test
git add src/auth/jwt.ts tests/auth/jwt.test.ts
git commit -m "feat(auth): add JWT token generation

Centralized token creation and verification.

- generateToken(userId): Creates signed JWT
- verifyToken(token): Validates and decodes
- 90% test coverage
- Handles expiration edge cases
"

# ... continue for remaining steps

# Push when complete
git push -u origin feature/oauth-login

# Ready for review
echo "✅ All steps complete, ready for /riper:review"
```

---

**Systematic execution. Quality enforced. Progress tracked. Ready to ship.**

