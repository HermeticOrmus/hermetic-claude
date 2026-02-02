# TDD: Test-Driven Development Workflow

**Purpose**: Guide implementation using test-first approach (Red-Green-Refactor)

## What This Does

Facilitates Test-Driven Development workflow:
1. Creates test file structure
2. Provides test template
3. Guides Red-Green-Refactor cycle
4. Enforces test-first discipline

## Philosophy

**Write tests BEFORE implementation code**

**Benefits**:
- Clear requirements (test defines what code should do)
- Better design (writing test first reveals API issues)
- Complete coverage (every function has tests)
- Confidence (tests prove it works)
- Documentation (tests show how to use code)

## Usage

```bash
/tdd [feature-name]

# Examples:
/tdd user-login
/tdd calculate-total
/tdd oauth-url-generator
```

## Implementation

**Step 1: Identify what to build**

Before creating tests, clarify:
- What is the function/feature?
- What inputs does it take?
- What output should it produce?
- What edge cases exist?

**Example**: Building `calculateTotal(items)` function
- Input: Array of numbers
- Output: Sum of numbers
- Edge cases: Empty array, null, negative numbers

---

**Step 2: Create test file**

```bash
# Determine test file location
FEATURE_NAME="[feature-name]"

# JavaScript/TypeScript structure
if [ -d "src" ]; then
    # Find logical location in src/
    echo "Where will the implementation go?"
    echo "Example: src/utils/calculator.ts"
    read -p "Implementation path: " IMPL_PATH

    # Create test path
    TEST_PATH="${IMPL_PATH/.ts/.test.ts}"
    TEST_PATH="${TEST_PATH/.js/.test.js}"
    TEST_PATH="${TEST_PATH/src/tests}"

    mkdir -p "$(dirname "$TEST_PATH")"
    echo "Creating test at: $TEST_PATH"
fi

# Python structure
if [ -f "pyproject.toml" ] || [ -f "requirements.txt" ]; then
    echo "Where will the implementation go?"
    echo "Example: src/utils/calculator.py"
    read -p "Implementation path: " IMPL_PATH

    # Create test path
    TEST_PATH="${IMPL_PATH/src/tests}"
    TEST_PATH="${TEST_PATH/.py/test_.py}"
    TEST_PATH="tests/${TEST_PATH##*/}"

    mkdir -p "tests"
    echo "Creating test at: $TEST_PATH"
fi
```

---

**Step 3: Write test template**

**JavaScript/TypeScript**:
```javascript
// tests/[path]/[feature].test.ts
import { [functionName] } from '../[path]/[feature]';

describe('[FeatureName]', () => {
  // Test 1: Happy path (most common use case)
  test('[describes what it should do]', () => {
    // ARRANGE: Set up test data
    const input = [/* test input */];

    // ACT: Call function
    const result = [functionName](input);

    // ASSERT: Verify expected outcome
    expect(result).toBe([expected]);
  });

  // Test 2: Edge case 1
  test('handles [edge case]', () => {
    const input = [/* edge case input */];
    const result = [functionName](input);
    expect(result).toBe([expected]);
  });

  // Test 3: Edge case 2
  test('handles [another edge case]', () => {
    const input = [/* edge case input */];
    const result = [functionName](input);
    expect(result).toBe([expected]);
  });

  // Test 4: Error case (if applicable)
  test('throws error when [invalid input]', () => {
    expect(() => [functionName]([invalid input])).toThrow('[error message]');
  });
});
```

**Python**:
```python
# tests/test_[feature].py
import pytest
from src.[module] import [function_name]

class Test[FeatureName]:
    def test_[describes_what_it_should_do](self):
        """Test happy path (most common use case)"""
        # ARRANGE
        input_data = [# test input]

        # ACT
        result = [function_name](input_data)

        # ASSERT
        assert result == [expected]

    def test_handles_[edge_case](self):
        """Test edge case 1"""
        input_data = [# edge case input]
        result = [function_name](input_data)
        assert result == [expected]

    def test_handles_[another_edge_case](self):
        """Test edge case 2"""
        input_data = [# edge case input]
        result = [function_name](input_data)
        assert result == [expected]

    def test_raises_error_when_[invalid_input](self):
        """Test error case"""
        with pytest.raises([ErrorType], match="[error message]"):
            [function_name]([invalid input])
```

---

**Step 4: The Red-Green-Refactor Cycle**

### 🔴 RED: Write Failing Test

**Step 4a**: Write ONE test for the simplest case

```javascript
test('calculateTotal sums array of numbers', () => {
  expect(calculateTotal([1, 2, 3])).toBe(6);
});
```

**Step 4b**: Run test (it should FAIL)

```bash
npm test

# Expected output:
# ❌ FAIL: calculateTotal is not defined
```

**Why fail is good**: Confirms test is actually running and will catch issues

---

### 🟢 GREEN: Write Minimal Code to Pass

**Step 5a**: Write simplest implementation that passes

```javascript
// src/utils/calculator.ts
export function calculateTotal(items) {
  return items.reduce((sum, item) => sum + item, 0);
}
```

**Step 5b**: Run test again (should PASS)

```bash
npm test

# Expected output:
# ✅ PASS: calculateTotal sums array of numbers
```

**Why minimal**: Don't over-engineer. Write what's needed to pass.

---

### 🔵 REFACTOR: Improve Code

**Step 6a**: Make code better without changing behavior

```javascript
export function calculateTotal(items: number[]): number {
  if (!items || !Array.isArray(items)) {
    throw new Error('items must be an array');
  }

  return items.reduce((sum, item) => sum + item, 0);
}
```

**Step 6b**: Run tests (should still PASS)

```bash
npm test

# Expected output:
# ✅ PASS: All tests pass
```

**Refactoring checklist**:
- [ ] Add types (TypeScript)
- [ ] Add input validation
- [ ] Improve variable names
- [ ] Extract magic numbers to constants
- [ ] Add documentation comments
- [ ] Tests still pass

---

**Step 7: Repeat for Next Case**

**Add edge case test** (RED):
```javascript
test('calculateTotal handles empty array', () => {
  expect(calculateTotal([])).toBe(0);
});

npm test
# ✅ PASS (already handles this)
```

**Add error case test** (RED):
```javascript
test('calculateTotal throws for null', () => {
  expect(() => calculateTotal(null)).toThrow('items must be an array');
});

npm test
# ✅ PASS (refactoring added this)
```

**Keep cycling**: Red → Green → Refactor until feature complete

---

## Complete TDD Example

### Example: Building OAuth URL Generator

**RED - Test 1**:
```javascript
test('generateOAuthUrl creates valid Google URL', () => {
  const url = generateOAuthUrl('google');

  expect(url).toContain('accounts.google.com');
  expect(url).toContain('client_id=');
});

// Run: npm test
// ❌ FAIL: generateOAuthUrl is not defined
```

**GREEN - Implementation 1**:
```javascript
export function generateOAuthUrl(provider) {
  return `https://accounts.google.com/o/oauth2/v2/auth?client_id=123`;
}

// Run: npm test
// ✅ PASS
```

**RED - Test 2** (GitHub support):
```javascript
test('generateOAuthUrl creates valid GitHub URL', () => {
  const url = generateOAuthUrl('github');
  expect(url).toContain('github.com');
});

// Run: npm test
// ❌ FAIL: Expected GitHub URL, got Google URL
```

**GREEN - Implementation 2**:
```javascript
const PROVIDERS = {
  google: 'https://accounts.google.com/o/oauth2/v2/auth',
  github: 'https://github.com/login/oauth/authorize',
};

export function generateOAuthUrl(provider) {
  const baseUrl = PROVIDERS[provider];
  return `${baseUrl}?client_id=123`;
}

// Run: npm test
// ✅ PASS
```

**RED - Test 3** (Error handling):
```javascript
test('generateOAuthUrl throws for unknown provider', () => {
  expect(() => generateOAuthUrl('unknown')).toThrow('Unknown provider');
});

// Run: npm test
// ❌ FAIL: Did not throw error
```

**GREEN - Implementation 3**:
```javascript
export function generateOAuthUrl(provider) {
  const baseUrl = PROVIDERS[provider];

  if (!baseUrl) {
    throw new Error(`Unknown provider: ${provider}`);
  }

  return `${baseUrl}?client_id=123`;
}

// Run: npm test
// ✅ PASS
```

**REFACTOR**:
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

export function generateOAuthUrl(provider: string): string {
  const config = OAUTH_PROVIDERS[provider];

  if (!config) {
    throw new Error(`Unknown provider: ${provider}`);
  }

  return `${config.authUrl}?client_id=${config.clientId}`;
}

// Run: npm test
// ✅ PASS (tests still pass after refactor)
```

**Final test suite**:
```javascript
describe('generateOAuthUrl', () => {
  test('creates valid Google OAuth URL', () => {
    const url = generateOAuthUrl('google');
    expect(url).toContain('accounts.google.com');
    expect(url).toContain('client_id=');
  });

  test('creates valid GitHub OAuth URL', () => {
    const url = generateOAuthUrl('github');
    expect(url).toContain('github.com');
    expect(url).toContain('client_id=');
  });

  test('throws error for unknown provider', () => {
    expect(() => generateOAuthUrl('unknown')).toThrow('Unknown provider: unknown');
  });
});

// All tests: ✅ PASS
// Coverage: 100%
```

---

## TDD Checklist

**For each new function/feature**:

- [ ] Clarify requirements (what should it do?)
- [ ] Create test file
- [ ] Write test for simplest case (RED)
- [ ] Run test, verify it fails
- [ ] Write minimal code to pass (GREEN)
- [ ] Run test, verify it passes
- [ ] Refactor code for quality (REFACTOR)
- [ ] Run test, verify still passes
- [ ] Repeat for edge cases
- [ ] Repeat for error cases
- [ ] Review test coverage (aim for 100% for new code)
- [ ] Commit with tests and implementation together

---

## Common TDD Patterns

### Pattern 1: Data Transformation

**Function**: Transform input to output

**Test structure**:
```javascript
test('happy path', () => expect(transform(validInput)).toBe(expectedOutput));
test('edge case 1', () => expect(transform(edgeCase)).toBe(edgeOutput));
test('error case', () => expect(() => transform(invalid)).toThrow());
```

**Examples**: Formatters, parsers, calculators

---

### Pattern 2: State Change

**Function**: Modify state or database

**Test structure**:
```javascript
test('creates resource', async () => {
  await createResource(data);
  const resource = await db.find(data.id);
  expect(resource).toBeDefined();
});
```

**Examples**: CRUD operations, state mutations

---

### Pattern 3: Side Effects

**Function**: Sends email, calls API, logs

**Test structure**:
```javascript
test('sends email', async () => {
  const mockSend = jest.fn();
  await sendWelcomeEmail(user, { sendEmail: mockSend });
  expect(mockSend).toHaveBeenCalledWith(expect.objectContaining({
    to: user.email,
    subject: 'Welcome'
  }));
});
```

**Examples**: Notifications, external API calls

---

## When to Use TDD

**Always use TDD for**:
- ✅ New features from scratch
- ✅ Complex business logic
- ✅ Bug fixes (write failing test that proves bug, then fix)
- ✅ Refactoring (write tests first to ensure no behavior change)
- ✅ APIs and libraries (clear contracts)

**TDD might be overkill for**:
- ⚠️ Proof-of-concept code (throwaway)
- ⚠️ UI layout tweaks (visual testing better)
- ⚠️ Simple CRUD with no logic
- ⚠️ Generated code

**Use judgment, but default to TDD when uncertain.**

---

## TDD Anti-Patterns

**❌ Writing all tests first**:
```
Don't: Write 20 tests, then write all code
Do: One test → implement → next test → implement
```

**❌ Testing implementation**:
```javascript
// Bad: Testing internal method
test('calls _internalHelper', () => {
  expect(obj._internalHelper).toHaveBeenCalled();
});

// Good: Testing behavior
test('returns correct result', () => {
  expect(obj.publicMethod()).toBe(expected);
});
```

**❌ Over-mocking**:
```javascript
// Bad: Mock everything
jest.mock('./module1');
jest.mock('./module2');
jest.mock('./module3');
// Now you're testing mocks, not real behavior

// Good: Mock external dependencies only
jest.mock('axios'); // External API
// Let internal modules run real code
```

---

## Tips for Successful TDD

**Start small**: Write simplest possible test first

**One thing at a time**: One test, one implementation, repeat

**Run tests frequently**: After every change (seconds, not minutes)

**Trust the red**: If test doesn't fail first, it's not testing anything

**Keep tests fast**: Unit tests should be <100ms

**Descriptive names**: Test name should say what it tests

**Refactor fearlessly**: Tests give you confidence to improve code

**Commit test + code together**: They're a unit

---

## Commands Reference

**Run tests in watch mode** (recommended for TDD):
```bash
# JavaScript/TypeScript
npm test -- --watch

# Python
pytest-watch  # or: ptw

# Shows results instantly as you code
```

**Run specific test** (focus on current work):
```bash
# JavaScript
npm test -- path/to/test.test.ts

# Python
pytest tests/test_feature.py::test_specific_case

# Go
go test -run TestSpecific ./pkg/feature

# Rust
cargo test test_specific
```

**Run with coverage**:
```bash
npm test -- --coverage --watchAll=false
```

---

## Integration with RIPER Workflow

**TDD fits into RIPER Execute phase**:

1. **Research**: Understand existing code (read-only)
2. **Plan**: Define what to build (specification)
3. **Execute**: Use TDD to implement
   - For each step in plan:
     - Write test (RED)
     - Implement (GREEN)
     - Refactor (REFACTOR)
     - Commit
4. **Review**: All tests passing proves success criteria

**TDD ensures**:
- Every plan step has tests
- Implementation matches specification
- Edge cases covered
- Refactoring is safe

---

## Hermetic Principles in TDD

**Mentalism**: Tests clarify intention before code exists

**Correspondence**: Test structure mirrors desired API

**Vibration**: Red-Green-Refactor is rapid iteration

**Rhythm**: Consistent cycle (always same pattern)

**Cause-Effect**: Test defines desired effect, code causes it

**Polarity**: Balance test rigor vs. pragmatism

**Gender**: Tests are analytical (verification) and generative (design tool)

---

## Philosophy

**Tests are your north star**: They define "done"

**Failing tests are good**: Red phase proves test works

**Minimal code is best**: Write only what's needed to pass

**Refactoring is essential**: Green code can always be improved

**Cycle is sacred**: Red → Green → Refactor, always in that order

**Coverage is outcome**: TDD naturally achieves 100% coverage

---

**Test first. Code second. Refactor always. Ship with confidence.**

