# Code Standards

**Philosophy**: Functional, Formless, Accurate, Divine, Elegant, No Schemes

## Quick Checklist

- ✅ **Clarity > Cleverness** (future maintainers will thank you)
- ✅ **Consistency within project** (follow existing patterns)
- ✅ **Naming is sacred** (spend time on good names)
- ✅ **Test everything** (verify, don't assume)
- ✅ **Comments explain WHY, not WHAT**
- ✅ **Error messages that teach** (help users understand and fix)

## The Litmus Test

> "Will I be proud of this code in six months, or regret cutting corners?"

## Code Generation Standards

**Always include:**
- Clear intent comments (WHY, not WHAT)
- Error handling that teaches users
- Tests that document behavior
- Meaningful variable/function names

**Never include:**
- Dark patterns (pre-checked boxes, confusing flows, disguised ads)
- Surveillance without consent (tracking without opt-in)
- Addiction mechanics (infinite scroll, variable rewards, notification spam)

---

## ⚡ Required Commands After Code Changes

**MUST RUN after any code modification** (non-negotiable):

### The Quality Pipeline

Run these commands in order before every commit:

**1. Format Code**
```bash
# JavaScript/TypeScript
npm run format
# or: prettier --write .

# Python
black .
# or: ruff format

# Go
gofmt -w .

# Rust
cargo fmt
```
**Purpose**: Consistent style across codebase
**Philosophy**: Correspondence - structure mirrors team agreement

**2. Lint Code**
```bash
# JavaScript/TypeScript
npm run lint
# or: eslint . --fix

# Python
ruff check --fix
# or: pylint src/

# Go
golangci-lint run

# Rust
cargo clippy
```
**Purpose**: Catch errors and enforce best practices
**Philosophy**: Cause-Effect - prevent issues before they manifest

**3. Type Check** (if using typed language)
```bash
# TypeScript
npm run type-check
# or: tsc --noEmit

# Python
mypy src/

# Flow
flow check
```
**Purpose**: Prevent type-related runtime errors
**Philosophy**: Mentalism - clarify intention through types

**4. Run Tests**
```bash
# JavaScript/TypeScript
npm test
# Run affected tests, or full suite

# Python
pytest
# or: python -m pytest tests/

# Go
go test ./...

# Rust
cargo test
```
**Purpose**: Verify functionality, prevent regressions
**Philosophy**: Rhythm - sustainable quality over heroic firefighting

**5. Build** (if applicable)
```bash
# JavaScript/TypeScript
npm run build

# Python (if packaging)
python -m build

# Go
go build

# Rust
cargo build --release
```
**Purpose**: Verify production-ready state
**Philosophy**: Vibration - ship working code

### One-Line Pre-Commit Check

**Node.js projects**:
```bash
npm run format && npm run lint && npm test && npm run build
```

**Python projects**:
```bash
black . && ruff check --fix && mypy src/ && pytest && python -m build
```

**Go projects**:
```bash
gofmt -w . && golangci-lint run && go test ./... && go build
```

**Rust projects**:
```bash
cargo fmt && cargo clippy && cargo test && cargo build --release
```

### When to Skip

**Never skip** format, lint, or type-check.

**Can skip tests/build** only if:
- ✅ Documentation-only changes (README, comments)
- ✅ Configuration files (non-code)
- ⚠️ But still run before final commit

### Automation

**Recommended**: Set up pre-commit hooks
```bash
# Using husky (Node.js)
npx husky add .husky/pre-commit "npm run format && npm run lint && npm test"

# Using pre-commit (Python)
# Create .pre-commit-config.yaml with hooks

# Using git hooks directly
# Create .git/hooks/pre-commit script
```

**Philosophy alignment**:
- **Rhythm**: Regular quality checks prevent accumulation
- **Cause-Effect**: Intentional quality yields reliable code
- **Correspondence**: Code quality reflects consciousness quality

**Violation = Technical Debt**: Skipping these commands creates shadow work that will demand attention later.

---

## 📝 Pull Request Guidelines

**Before creating any PR**, ensure quality and completeness:

### Pre-PR Checklist

**Code Quality**:
- [ ] All required commands run successfully (format, lint, type-check, test, build)
- [ ] No console.log(), debug statements, or commented code
- [ ] Code follows project style guide
- [ ] Variable/function names are clear and descriptive

**Testing**:
- [ ] Tests added for new functionality
- [ ] All tests pass (`npm test` or equivalent)
- [ ] Edge cases covered
- [ ] Test coverage meets project threshold (typically 80%+)

**Documentation**:
- [ ] README updated (if public API changed)
- [ ] CHANGELOG.md updated with changes
- [ ] Code comments explain WHY, not WHAT
- [ ] Complex logic has explanation comments

**Git Hygiene**:
- [ ] Commits are logical, atomic units
- [ ] Commit messages follow convention (see below)
- [ ] No merge commits (rebase if needed)
- [ ] Branch is up to date with main/master

**Feature Flags** (if applicable):
- [ ] Incomplete features behind feature flags
- [ ] Flags documented in PR description

### Commit Message Format

**Convention**: `type(scope): description`

**Types**:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation only
- `style`: Formatting, missing semicolons, etc. (no code change)
- `refactor`: Code restructuring (no functionality change)
- `perf`: Performance improvement
- `test`: Adding tests
- `chore`: Maintenance, dependencies, config

**Examples**:
```
feat(auth): add OAuth2 login support
fix(api): handle null response in user endpoint
docs(readme): update installation instructions
refactor(utils): simplify date formatting logic
test(auth): add integration tests for login flow
```

### PR Title Format

**Use same format as commit messages**: `type(scope): description`

**Examples**:
- `feat(dashboard): add user analytics widget`
- `fix(checkout): prevent duplicate order submission`
- `refactor(api): extract validation logic`

### PR Description Template

```markdown
## Summary
[Brief description of what changed and why]

## Motivation
[Why is this change needed? What problem does it solve?]

## Changes
- Change 1 (specific, actionable)
- Change 2
- Change 3

## Testing
[How to test these changes]
1. Step 1
2. Step 2
3. Expected result

## Screenshots (if UI changes)
[Before/After images or GIFs]

## Breaking Changes
[List any breaking changes, or write "None"]

## Checklist
- [ ] Tests pass
- [ ] Documentation updated
- [ ] CHANGELOG updated
- [ ] No breaking changes (or documented if exist)
```

### PR Size Guidelines

**Ideal**: 20-200 lines changed
**Maximum**: ~1000 lines (larger = harder to review)

**If PR is large**:
- Consider breaking into smaller PRs
- Use feature flags to ship incrementally
- Document organization in PR description

**Philosophy**: Small, focused PRs = faster review, less risk, easier revert

### Review Process

**As author**:
1. Self-review before requesting (check diff on GitHub)
2. Respond to all comments (even if just "Fixed ✅")
3. Re-request review after changes
4. Don't merge your own PRs (unless approved practice)

**As reviewer**:
1. Review within 24 hours (respect author's momentum)
2. Be specific: "Consider extracting line 42-58 to separate function"
3. Use conventional comments:
   - **nit**: Minor suggestion (non-blocking)
   - **question**: Seeking clarification
   - **suggestion**: Consider this approach
   - **issue**: Must be addressed
4. Approve when satisfied, don't nitpick

### Hermetic Principles in PRs

**Mentalism**: Clear intention in description ("why" this change)
**Correspondence**: Code structure mirrors design intent
**Vibration**: Ship incrementally, iterate based on feedback
**Polarity**: Balance thoroughness vs. speed
**Rhythm**: Regular, sustainable PR cadence (not giant batches)
**Cause-Effect**: Consider downstream impacts
**Gender**: Analysis (code review) + Intuition (user experience)

### Common PR Anti-Patterns

❌ **"Fix stuff"** - Vague title/description
❌ **Mixed concerns** - Multiple unrelated changes in one PR
❌ **No tests** - Changed code without test coverage
❌ **Merge commits** - Messy history from not rebasing
❌ **Force push after review** - Erases review context
❌ **Premature merge** - Merging before tests pass
❌ **Giant PRs** - 2000+ line changes

### Automation

**Recommended GitHub Actions / CI checks**:
```yaml
# .github/workflows/pr-checks.yml
- Format check (prettier/black)
- Lint check (eslint/ruff)
- Type check (tsc/mypy)
- Tests (jest/pytest)
- Build verification
- Coverage report
```

**Branch protection rules**:
- Require 1+ approvals
- Require CI passing
- Require up-to-date with base
- No force push to main
