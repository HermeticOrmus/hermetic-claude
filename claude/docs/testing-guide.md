# Testing Enforcement (TDD Workflow)

**Philosophy**: Tests are not just validation - they are specifications that prove your code works.

**When to write tests**: BEFORE writing implementation code (Test-Driven Development)

## Why TDD

**Traditional approach** (Code-first):
```
Write code → Write tests → Hope it works
```
Problems: Tests are afterthought, coverage gaps, unclear requirements

**TDD approach** (Test-first):
```
Write failing test → Write minimal code to pass → Refactor → Repeat
```
Benefits: Clear requirements, complete coverage, better design, confidence

## The Red-Green-Refactor Cycle

**Red** (Write failing test):
```javascript
test('generateToken creates valid JWT with userId', () => {
  const token = generateToken('user-123');
  const decoded = jwt.verify(token, process.env.JWT_SECRET);

  expect(decoded.userId).toBe('user-123');
  expect(decoded.exp).toBeGreaterThan(Date.now() / 1000);
});

// ❌ FAIL: generateToken is not defined
```

**Green** (Write minimal code to pass):
```javascript
function generateToken(userId) {
  return jwt.sign(
    { userId },
    process.env.JWT_SECRET,
    { expiresIn: '24h' }
  );
}

// ✅ PASS: Test passes
```

**Refactor** (Improve code without changing behavior):
```javascript
function generateToken(userId, expiresIn = '24h') {
  if (!userId) throw new Error('userId required');

  return jwt.sign(
    { userId, iat: Date.now() },
    process.env.JWT_SECRET,
    { expiresIn }
  );
}

// ✅ PASS: Tests still pass, code is better
```

---

## Test Types & When to Use

### 1. Unit Tests (80% of tests)

**What**: Test individual functions/classes in isolation
**When**: Every new function, method, or class
**Coverage target**: 80%+ of all code

**Example**:
```javascript
describe('calculateTotal', () => {
  it('sums array of numbers', () => {
    expect(calculateTotal([1, 2, 3])).toBe(6);
  });

  it('handles empty array', () => {
    expect(calculateTotal([])).toBe(0);
  });

  it('handles negative numbers', () => {
    expect(calculateTotal([1, -2, 3])).toBe(2);
  });
});
```

**Python**:
```python
def test_calculate_total_sums_numbers():
    assert calculate_total([1, 2, 3]) == 6

def test_calculate_total_handles_empty_array():
    assert calculate_total([]) == 0

def test_calculate_total_handles_negatives():
    assert calculate_total([1, -2, 3]) == 2
```

---

### 2. Integration Tests (15% of tests)

**What**: Test multiple components working together
**When**: Testing workflows, database interactions, API calls
**Coverage target**: All critical user workflows

**Example**:
```javascript
describe('User Registration Flow', () => {
  it('creates user and sends welcome email', async () => {
    const userData = { email: 'test@example.com', password: 'secure123' };

    // Calls service → database → email service
    const result = await registerUser(userData);

    expect(result.user.email).toBe('test@example.com');
    expect(result.emailSent).toBe(true);

    // Verify database
    const dbUser = await db.users.findByEmail('test@example.com');
    expect(dbUser).toBeDefined();
  });
});
```

**Python**:
```python
def test_user_registration_flow(db_session, email_service):
    user_data = {"email": "test@example.com", "password": "secure123"}

    result = register_user(user_data)

    assert result["user"]["email"] == "test@example.com"
    assert result["email_sent"] == True

    db_user = db_session.query(User).filter_by(email="test@example.com").first()
    assert db_user is not None
```

---

### 3. E2E Tests (5% of tests)

**What**: Test complete user journeys through UI
**When**: Critical user flows (login, checkout, etc.)
**Coverage target**: 5-10 most important user flows

**Example** (Playwright):
```javascript
test('user can complete OAuth login', async ({ page }) => {
  // Navigate
  await page.goto('http://localhost:3000/login');

  // Click OAuth button
  await page.click('button:has-text("Login with Google")');

  // Mock OAuth (in test env)
  await page.waitForURL('**/auth/google/callback**');

  // Verify redirected to dashboard
  await expect(page).toHaveURL('/dashboard');
  await expect(page.locator('h1')).toContainText('Welcome');
});
```

---

## Coverage Requirements

**Minimum targets** (project-specific, but common standards):

- **Overall**: 80% coverage
- **New code**: 100% coverage (all new functions must have tests)
- **Critical paths**: 100% coverage (auth, payments, data loss prevention)
- **Edge cases**: Covered for all user-facing features

**Check coverage**:
```bash
# JavaScript/TypeScript
npm test -- --coverage

# Python
pytest --cov=src --cov-report=html

# Go
go test -cover ./...

# Rust
cargo tarpaulin --out Html
```

**Coverage is not enough**:
- 100% coverage doesn't mean good tests
- Test behavior, not implementation
- Cover edge cases and error paths

---

## Test Structure (AAA Pattern)

**Arrange-Act-Assert**:

```javascript
test('user login with valid credentials', async () => {
  // ARRANGE: Set up test data and mocks
  const credentials = { email: 'user@example.com', password: 'correct' };
  const mockUser = { id: '123', email: 'user@example.com' };
  db.findUser = jest.fn().mockResolvedValue(mockUser);

  // ACT: Execute the function being tested
  const result = await login(credentials);

  // ASSERT: Verify expected outcome
  expect(result.success).toBe(true);
  expect(result.token).toBeDefined();
  expect(db.findUser).toHaveBeenCalledWith('user@example.com');
});
```

**Python**:
```python
def test_user_login_with_valid_credentials(mocker):
    # ARRANGE
    credentials = {"email": "user@example.com", "password": "correct"}
    mock_user = {"id": "123", "email": "user@example.com"}
    mocker.patch('auth.db.find_user', return_value=mock_user)

    # ACT
    result = login(credentials)

    # ASSERT
    assert result["success"] == True
    assert result["token"] is not None
```

---

## Naming Conventions

**Test file naming**:
```
src/auth/login.ts       → tests/auth/login.test.ts
src/utils/format.ts     → tests/utils/format.test.ts
components/Button.tsx   → components/Button.test.tsx
```

**Test function naming** (Be descriptive):

**Good**:
```javascript
test('login fails with invalid password')
test('calculateTotal returns 0 for empty array')
test('user can submit form with all required fields')
```

**Bad**:
```javascript
test('login')  // Not specific enough
test('test1')  // Meaningless
test('it works')  // Not descriptive
```

**Python naming**:
```python
def test_login_fails_with_invalid_password():
def test_calculate_total_returns_zero_for_empty_array():
def test_user_can_submit_form_with_required_fields():
```

---

## Mocking Strategies

**When to mock**:
- External APIs (don't hit real APIs in tests)
- Databases (use in-memory or mocks for unit tests)
- Time-dependent functions (Date.now(), timestamps)
- File system operations
- Email/SMS services
- Payment gateways

**JavaScript mocking**:
```javascript
// Mock external API
jest.mock('axios');
axios.get.mockResolvedValue({ data: { user: 'test' } });

// Mock Date
jest.spyOn(Date, 'now').mockReturnValue(1234567890);

// Mock module
jest.mock('../services/email', () => ({
  sendEmail: jest.fn().mockResolvedValue(true)
}));
```

**Python mocking**:
```python
# Mock with pytest
def test_with_mock(mocker):
    mocker.patch('requests.get', return_value=Mock(status_code=200))
    mocker.patch('time.time', return_value=1234567890)

# Mock with unittest
@patch('services.email.send_email')
def test_sends_email(mock_send):
    mock_send.return_value = True
    result = register_user({"email": "test@example.com"})
    assert mock_send.called
```

**Don't over-mock**:
- Mock external dependencies, not internal logic
- Integration tests should use real components when possible
- Balance: Too much mocking = tests don't prove real behavior

---

## TDD Workflow (Step-by-Step)

**For every new feature**:

**Step 1**: Write failing test
```bash
# Create test file
vim tests/auth/oauth.test.ts

# Write test that describes desired behavior
test('generateOAuthUrl creates valid Google OAuth URL', () => {
  const url = generateOAuthUrl('google');

  expect(url).toContain('accounts.google.com');
  expect(url).toContain('client_id=');
  expect(url).toContain('redirect_uri=');
});

# Run test (should fail)
npm test
# ❌ FAIL: generateOAuthUrl is not defined
```

**Step 2**: Write minimal code to pass
```javascript
// src/auth/oauth.ts
export function generateOAuthUrl(provider) {
  if (provider === 'google') {
    return `https://accounts.google.com/o/oauth2/v2/auth?client_id=${process.env.GOOGLE_CLIENT_ID}&redirect_uri=${process.env.REDIRECT_URI}`;
  }
}

# Run test again
npm test
# ✅ PASS
```

**Step 3**: Add edge case test
```javascript
test('generateOAuthUrl throws for unknown provider', () => {
  expect(() => generateOAuthUrl('unknown')).toThrow('Unknown provider');
});

# ❌ FAIL: Test doesn't throw
```

**Step 4**: Implement edge case
```javascript
export function generateOAuthUrl(provider) {
  if (provider === 'google') {
    return `https://accounts.google.com/o/oauth2/v2/auth?client_id=${process.env.GOOGLE_CLIENT_ID}&redirect_uri=${process.env.REDIRECT_URI}`;
  }
  throw new Error(`Unknown provider: ${provider}`);
}

# ✅ PASS: All tests pass
```

**Step 5**: Refactor
```javascript
const OAUTH_PROVIDERS = {
  google: {
    authUrl: 'https://accounts.google.com/o/oauth2/v2/auth',
    clientId: process.env.GOOGLE_CLIENT_ID,
  },
  github: {
    authUrl: 'https://github.com/login/oauth/authorize',
    clientId: process.env.GITHUB_CLIENT_ID,
  },
};

export function generateOAuthUrl(provider) {
  const config = OAUTH_PROVIDERS[provider];
  if (!config) throw new Error(`Unknown provider: ${provider}`);

  return `${config.authUrl}?client_id=${config.clientId}&redirect_uri=${process.env.REDIRECT_URI}`;
}

# ✅ PASS: Tests still pass, code is cleaner
```

**Step 6**: Commit
```bash
git add src/auth/oauth.ts tests/auth/oauth.test.ts
git commit -m "feat(auth): add OAuth URL generation

Implements OAuth provider URL generation with tests.

- Supports Google and GitHub providers
- Validates provider parameter
- Test coverage: 100%
"
```

---

## Test Quality Checklist

**Every test should**:

- [ ] **Have a clear purpose** - What behavior is it verifying?
- [ ] **Be independent** - Can run alone or with others in any order
- [ ] **Be deterministic** - Same input = same result every time
- [ ] **Be fast** - Unit tests < 100ms, integration < 1s
- [ ] **Test behavior, not implementation** - Don't test internal details
- [ ] **Have meaningful assertions** - Verify the right things
- [ ] **Cover edge cases** - Empty arrays, null, undefined, errors
- [ ] **Use descriptive names** - Anyone can understand what it tests
- [ ] **Follow AAA pattern** - Arrange, Act, Assert
- [ ] **Mock external dependencies** - Don't hit real APIs/databases

**Good test**:
```javascript
test('user registration fails with duplicate email', async () => {
  // ARRANGE: Existing user
  await db.users.create({ email: 'existing@example.com' });

  // ACT: Try to register with same email
  const result = await registerUser({ email: 'existing@example.com', password: 'pass' });

  // ASSERT: Registration fails with specific error
  expect(result.success).toBe(false);
  expect(result.error).toBe('Email already registered');
});
```

**Bad test**:
```javascript
test('registration', async () => {
  // Too vague, testing multiple things, unclear what it proves
  const result = await registerUser({ email: 'test@example.com', password: 'pass' });
  expect(result).toBeDefined();  // Weak assertion
});
```

---

## Command Reference

**Run tests**:
```bash
# JavaScript/TypeScript
npm test                    # All tests
npm test -- --watch         # Watch mode
npm test path/to/test.ts    # Specific test

# Python
pytest                      # All tests
pytest -v                   # Verbose
pytest tests/test_auth.py   # Specific test
pytest -k "user"            # Tests matching "user"

# Go
go test ./...               # All packages
go test -v ./auth           # Specific package
go test -run TestLogin      # Specific test

# Rust
cargo test                  # All tests
cargo test --test integration # Integration tests
cargo test test_login       # Specific test
```

**Coverage**:
```bash
# JavaScript/TypeScript
npm test -- --coverage

# Python
pytest --cov=src --cov-report=html
open htmlcov/index.html

# Go
go test -cover ./...

# Rust
cargo tarpaulin --out Html
```

---

## TDD Command

**Quick command for test-first workflow**:
```bash
/tdd [feature-name]

# Examples:
/tdd user-login
/tdd payment-processing
/tdd api-rate-limiting
```

**What `/tdd` does**:
1. Creates test file structure
2. Provides TDD workflow template
3. Sets up test scaffolding
4. Reminds of Red-Green-Refactor cycle

**See**: `~/.claude/commands/tdd.md` for full implementation

---

## Testing Anti-Patterns

**❌ Don't do this**:

**Testing implementation details**:
```javascript
// BAD: Testing internal state
test('user service calls database', () => {
  expect(userService.db).toHaveBeenCalled();  // Don't test this
});

// GOOD: Test behavior
test('user service returns user data', () => {
  const user = userService.getUser('123');
  expect(user.id).toBe('123');  // Test outcome
});
```

**Giant test files**:
```
tests/auth.test.ts  // 2000 lines ❌

tests/auth/
  login.test.ts     // 200 lines ✅
  register.test.ts  // 150 lines ✅
  oauth.test.ts     // 180 lines ✅
```

**Flaky tests**:
```javascript
// BAD: Depends on timing
test('async operation completes', () => {
  setTimeout(() => {
    expect(result).toBe(true);  // Might not have completed
  }, 100);
});

// GOOD: Use proper async testing
test('async operation completes', async () => {
  await waitFor(() => expect(result).toBe(true));
});
```

**No edge case coverage**:
```javascript
// Incomplete
test('calculateTotal sums numbers', () => {
  expect(calculateTotal([1, 2, 3])).toBe(6);
});

// Complete
test('calculateTotal handles empty array', () => {
  expect(calculateTotal([])).toBe(0);
});

test('calculateTotal handles null', () => {
  expect(calculateTotal(null)).toBe(0);
});

test('calculateTotal handles negative numbers', () => {
  expect(calculateTotal([1, -2, 3])).toBe(2);
});
```

---

## Hermetic Principles in Testing

**Mentalism**: Tests clarify intention - they document what code should do

**Correspondence**: Test structure mirrors code structure (src/auth → tests/auth)

**Vibration**: Tests enable rapid iteration with confidence

**Rhythm**: Regular test-writing (every function gets tests)

**Cause-Effect**: Tests prove intended effects occur

**Polarity**: Balance test coverage vs. test maintenance cost

**Gender**: Tests are both analytical (verification) and intuitive (design tool)

---

## Philosophy

**Tests are specifications**: They document how code should behave

**Tests enable confidence**: Refactor fearlessly when tests are comprehensive

**Tests guide design**: Writing tests first leads to better API design

**Tests save time**: 10 minutes writing tests saves hours debugging later

**Tests are living documentation**: Tests show how to use the code

---

## When NOT to Test

**Skip tests for** (rare cases):
- Proof-of-concept code (throwaway)
- Generated code (from tools)
- Simple getters/setters (if truly trivial)
- Configuration files

**Always test**:
- Business logic
- User-facing features
- Security-critical code
- Data validation
- Error handling

---

**Test-first workflow. Comprehensive coverage. Behavior verification. Ship with confidence.**
