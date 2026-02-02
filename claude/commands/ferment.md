---
description: Through death comes rebirth. Run tests, find failures, iterate until quality. The decomposition that generates new life.
allowed-tools: Read, Write, Edit, Bash(npm:test*, pytest:*, go:test*, cargo:test*, jest:*, vitest:*), Task
argument-hint: [@mode:[tdd|coverage|mutation|integration]] [@iterate:[until-pass|until-coverage]] [test target or description]
---

# Ferment: The Rebirth Through Testing

```
Ferm: Code → Tested Code

"In death, there is transformation. In failure, there is learning."

Element: Earth + Spirit 🜅
Stage: Between CITRINITAS and RUBEDO
Operation: Testing, failing, fixing, iterating until quality emerges
```

## Task

$ARGUMENTS

---

## Phase 1: INOCULATION - Introduce the Tests

```
Fermentation Target:
  Path: [target path]
  Mode: [tdd | coverage | mutation | integration]
  Iterate: [until-pass | until-coverage:[N]%]

Current State:
  Test files: [N]
  Test cases: [N]
  Coverage: [N]%
```

### Test Inventory

```
Existing tests:
├── Unit tests: [N]
├── Integration tests: [N]
└── E2E tests: [N]

Missing coverage:
├── [function/module] - no tests
├── [function/module] - partial coverage
└── [edge case] - not tested
```

---

## Phase 2: DECOMPOSITION - Let Tests Find Weakness

### If @mode:tdd

```
TDD CYCLE: RED → GREEN → REFACTOR

═══════════════════════════════════════════════════════════════
                         🔴 RED
═══════════════════════════════════════════════════════════════

Write failing test first:

```[language]
// Test: [what we're testing]
test('[description]', () => {
  // Arrange
  [setup]

  // Act
  [action]

  // Assert
  [expectation]
});
```

Run: [test command]
Result: FAIL (expected)

═══════════════════════════════════════════════════════════════
                         🟢 GREEN
═══════════════════════════════════════════════════════════════

Write minimal code to pass:

```[language]
[implementation]
```

Run: [test command]
Result: PASS

═══════════════════════════════════════════════════════════════
                         🔄 REFACTOR
═══════════════════════════════════════════════════════════════

Improve without breaking tests:
- [refactoring action 1]
- [refactoring action 2]

Run: [test command]
Result: STILL PASSING
```

### If @mode:coverage

```
COVERAGE ANALYSIS

Current coverage: [N]%
Target coverage: [target]%
Gap: [N]%

Uncovered lines:
┌──────────────────────────────────────────────────────────────┐
│ File                    │ Lines    │ Uncovered              │
├──────────────────────────────────────────────────────────────┤
│ [file]                  │ [range]  │ [specific lines]       │
│ [file]                  │ [range]  │ [specific lines]       │
└──────────────────────────────────────────────────────────────┘

Tests to add:
1. [test for uncovered code]
2. [test for uncovered code]
```

### If @mode:mutation

```
MUTATION TESTING

Mutants generated: [N]
Mutants killed: [N]
Mutants survived: [N]
Mutation score: [N]%

Surviving mutants (weak tests):
┌──────────────────────────────────────────────────────────────┐
│ Location       │ Mutation           │ Why it survived       │
├──────────────────────────────────────────────────────────────┤
│ [file:line]    │ [what changed]     │ [missing assertion]   │
│ [file:line]    │ [what changed]     │ [boundary not tested] │
└──────────────────────────────────────────────────────────────┘

Tests to strengthen:
1. [specific assertion to add]
2. [boundary case to test]
```

### If @mode:integration

```
INTEGRATION TEST EXECUTION

Test suite: [name]
Environment: [test environment]

Results:
┌──────────────────────────────────────────────────────────────┐
│ Test                              │ Status  │ Duration      │
├──────────────────────────────────────────────────────────────┤
│ [test name]                       │ ✓ PASS  │ [time]        │
│ [test name]                       │ ✗ FAIL  │ [time]        │
│ [test name]                       │ ○ SKIP  │ -             │
└──────────────────────────────────────────────────────────────┘

Failed test details:
[test name]:
  Expected: [expected]
  Actual: [actual]
  Stack: [relevant stack trace]
```

---

## Phase 3: TRANSFORMATION - Iterate Until Quality

### Iteration Log

```
Iteration 1:
  Tests run: [N]
  Passed: [N]
  Failed: [N]
  Action: [what was fixed]

Iteration 2:
  Tests run: [N]
  Passed: [N]
  Failed: [N]
  Action: [what was fixed]

[Continue until target achieved]

Final:
  Tests run: [N]
  Passed: [N]
  Failed: 0
  Coverage: [N]%
```

### Fixes Applied

| Iteration | Issue | Fix | Tests Affected |
|-----------|-------|-----|----------------|
| 1 | [issue] | [fix] | [N] |
| 2 | [issue] | [fix] | [N] |

---

## Phase 4: NEW LIFE - Quality Emerges

### Test Suite Health

```
Final State:
  Total tests: [N]
  Passing: [N] (100%)
  Coverage: [N]%
  Mutation score: [N]%

Quality indicators:
  ✓ All tests pass
  ✓ Coverage meets threshold
  ✓ No flaky tests
  ✓ Fast execution ([time])
```

### Generated/Updated Tests

```
New tests written:
- [test file]: [N] new tests
- [test file]: [N] new tests

Tests modified:
- [test file]: [what changed]
```

---

## Fermentation Report

```yaml
FERMENTATION_COMPLETE:
  target:
    path: "[path]"
    mode: "[tdd|coverage|mutation|integration]"

  before:
    tests: [N]
    passing: [N]
    coverage: [N]%

  after:
    tests: [N]
    passing: [N]
    coverage: [N]%
    mutation_score: [N]%

  iterations:
    count: [N]
    fixes_applied: [N]

  tests_created:
    - path: "[test file]"
      cases: [N]

  quality_metrics:
    all_passing: [true/false]
    coverage_target_met: [true/false]
    no_flaky_tests: [true/false]
    execution_time: "[duration]"

  confidence:
    level: "[high|medium|low]"
    reason: "[why this confidence level]"
```

---

## Alchemical Correspondence

```
FERMENTATION in development:

Physical: Decay produces new life (wine, bread)
Mental:   Failures teach more than successes
Code:     Tests find weaknesses, fixes create strength

"The code must die to its bugs to be reborn robust."

The fermentation cycle:
  Write test → Run test → FAIL → Fix code → PASS → Repeat

What dies:
- Assumptions about correctness
- Untested code confidence
- Hidden bugs

What is born:
- Verified behavior
- Regression protection
- Confidence to refactor
```

---

## Quick Reference

```
/ferment @mode:tdd "user authentication"   # TDD new feature
/ferment @mode:coverage src/               # Increase coverage
/ferment @mode:mutation utils.ts           # Mutation testing
/ferment @mode:integration api/            # Integration tests
/ferment @iterate:until-coverage:80 .      # Iterate to 80%
/ferment @iterate:until-pass tests/        # Fix until green
```

---

*"In the fermentation of testing, bugs die and confidence is born."*

**— The Cycle of Quality**
