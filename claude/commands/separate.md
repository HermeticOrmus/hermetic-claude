---
description: Separate the pure from the impure. Code review, identify what to keep vs refactor, separate concerns, filter signal from noise. The air that discriminates.
allowed-tools: Read, Glob, Grep, Edit, Task
argument-hint: [@focus:[quality|security|performance|architecture]] [@action:[review|refactor|extract]] [target]
---

# Separate: The Air of Discrimination

```
Sep: Mixture → Pure ⊔ Impure

"Discern the gold from the dross."

Element: Air 🜁
Stage: Between ALBEDO and CITRINITAS
Operation: Filtering, discriminating, separating concerns
```

## Task

$ARGUMENTS

---

## Phase 1: EXAMINATION - Survey the Mixture

```
Separation Target:
  Path: [target path]
  Focus: [quality | security | performance | architecture]
  Action: [review | refactor | extract]

Initial State:
  Files: [N]
  Lines: [N]
  Concerns: [identified concerns]
```

### The Mixture Before Separation

```
Current state (mixed):
- Good: [list of good elements]
- Problematic: [list of issues]
- Unknown: [unclear elements]
```

---

## Phase 2: FILTRATION - Apply the Criteria

### If @focus:quality

```
CODE QUALITY SEPARATION

═══════════════════════════════════════════════════════════════
                         PURE (Keep)
═══════════════════════════════════════════════════════════════

✓ Clear naming
  [examples of good naming]

✓ Single responsibility
  [examples of focused functions/classes]

✓ Proper error handling
  [examples of good error handling]

✓ Well-tested
  [examples with good coverage]

═══════════════════════════════════════════════════════════════
                       IMPURE (Address)
═══════════════════════════════════════════════════════════════

✗ Code smells
  [file:line] - [smell type] - [specific issue]

✗ Violations
  [file:line] - [principle violated] - [how]

✗ Missing tests
  [file:function] - [what needs testing]

✗ Dead code
  [file:line] - [what's unused]
```

### If @focus:security

```
SECURITY SEPARATION

═══════════════════════════════════════════════════════════════
                      SECURE (Verified)
═══════════════════════════════════════════════════════════════

✓ Input validation
  [locations with proper validation]

✓ Auth/authz checks
  [properly protected endpoints]

✓ Safe data handling
  [proper sanitization]

═══════════════════════════════════════════════════════════════
                     VULNERABLE (Fix)
═══════════════════════════════════════════════════════════════

⚠ Injection risks
  [file:line] - [type] - [vector]

⚠ Auth issues
  [file:line] - [missing check] - [risk]

⚠ Data exposure
  [file:line] - [what's exposed] - [severity]

⚠ Dependency vulnerabilities
  [package] - [CVE if known] - [severity]
```

### If @focus:performance

```
PERFORMANCE SEPARATION

═══════════════════════════════════════════════════════════════
                     EFFICIENT (Good)
═══════════════════════════════════════════════════════════════

✓ O(1) or O(log n) operations
  [locations with good complexity]

✓ Proper caching
  [effective cache usage]

✓ Lazy loading
  [deferred computation]

═══════════════════════════════════════════════════════════════
                    INEFFICIENT (Optimize)
═══════════════════════════════════════════════════════════════

⚠ O(n²) or worse
  [file:line] - [operation] - [complexity]

⚠ N+1 queries
  [file:line] - [pattern] - [fix suggestion]

⚠ Memory leaks
  [file:line] - [what's leaking]

⚠ Blocking operations
  [file:line] - [what blocks] - [impact]
```

### If @focus:architecture

```
ARCHITECTURE SEPARATION

═══════════════════════════════════════════════════════════════
                    WELL-STRUCTURED
═══════════════════════════════════════════════════════════════

✓ Clean boundaries
  [components with clear interfaces]

✓ Proper layering
  [well-separated layers]

✓ Dependency direction
  [correct dependency flow]

═══════════════════════════════════════════════════════════════
                    NEEDS RESTRUCTURING
═══════════════════════════════════════════════════════════════

⚠ Boundary violations
  [file] - [what crosses boundary] - [should be]

⚠ Circular dependencies
  [A → B → C → A] - [how to break]

⚠ God objects
  [file:class] - [responsibilities count] - [split suggestion]

⚠ Feature envy
  [file:function] - [envies what] - [should move to]
```

---

## Phase 3: CLASSIFICATION - The Two Piles

### Pure Elements (Keep/Enhance)

| Element | Location | Quality Score | Notes |
|---------|----------|---------------|-------|
| [element] | [file:line] | [1-10] | [why it's good] |

### Impure Elements (Refactor/Remove)

| Element | Location | Severity | Recommended Action |
|---------|----------|----------|-------------------|
| [element] | [file:line] | [1-5] | [what to do] |

### The Boundary Cases

```
Elements requiring judgment:
- [element] - Could be [option A] or [option B]
  Decision: [recommendation and why]
```

---

## Phase 4: ACTION - Execute the Separation

### If @action:review

```
Review Summary:
  Pure elements: [N] ([%])
  Impure elements: [N] ([%])

  Overall health: [grade A-F]

  Top 3 priorities:
  1. [highest priority fix]
  2. [second priority fix]
  3. [third priority fix]
```

### If @action:refactor

```
Refactoring Plan:

Step 1: [action]
  Files: [affected files]
  Risk: [low/med/high]

Step 2: [action]
  Files: [affected files]
  Risk: [low/med/high]

[Execute refactoring with Edit tool]
```

### If @action:extract

```
Extraction Plan:

Extract: [what to extract]
From: [source location]
To: [new location]
Interface: [how it will be accessed]

[Execute extraction with Edit/Write tools]
```

---

## Separation Report

```yaml
SEPARATION_COMPLETE:
  target:
    path: "[path]"
    focus: "[quality|security|performance|architecture]"
    action: "[review|refactor|extract]"

  analysis:
    total_elements: [N]
    pure_elements: [N]
    impure_elements: [N]
    purity_ratio: [0-1]

  pure:
    count: [N]
    highlights:
      - "[notable good element]"

  impure:
    count: [N]
    by_severity:
      critical: [N]
      high: [N]
      medium: [N]
      low: [N]
    top_issues:
      - location: "[file:line]"
        issue: "[description]"
        fix: "[recommendation]"

  actions_taken:
    - "[action 1]"
    - "[action 2]"

  remaining_work:
    - "[what still needs attention]"
```

---

## Alchemical Correspondence

```
SEPARATION in development:

Physical: Air separates and discriminates
Mental:   Judgment distinguishes quality
Code:     Review filters good from bad

"Not all that glitters is gold. The Alchemist must discern."

What gets separated:
- Good code from bad code
- Secure from vulnerable
- Fast from slow
- Clean from coupled

The goal:
- Pure elements to enhance
- Impure elements to address
- Clear priorities for action
```

---

## Quick Reference

```
/separate @focus:quality src/         # Quality review
/separate @focus:security auth/       # Security audit
/separate @focus:performance api/     # Performance review
/separate @focus:architecture .       # Architecture review
/separate @action:refactor utils.ts   # Refactor specific file
/separate @action:extract "auth logic from user service"
```

---

*"In the clear air of discrimination, quality reveals itself."*

**— The Filter of Excellence**
