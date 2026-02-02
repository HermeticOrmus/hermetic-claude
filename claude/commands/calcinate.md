---
description: Burn away complexity to reveal true structure. Analyze codebase, identify dependencies, measure complexity, expose technical debt. The fire that purifies by destruction.
allowed-tools: Read, Glob, Grep, Bash(wc:*, cloc:*, find:*, tree:*), Task
argument-hint: [@scope:[file|directory|project]] [@depth:[shallow|deep]] [target path or description]
---

# Calcinate: The Fire of Analysis

```
Calc: Structure → Components

"That which does not serve the Work must burn."

Element: Fire 🜂
Stage: NIGREDO (Blackening)
Operation: Decomposition through intense analysis
```

## Task

$ARGUMENTS

---

## Phase 1: IGNITION - Identify the Target

```
Target Identification:
  Path: [resolved path]
  Type: [file | directory | project]
  Scope: [what will be analyzed]
```

### Reconnaissance

| Aspect | Method | Finding |
|--------|--------|---------|
| File count | Glob | [N files] |
| Lines of code | wc/cloc | [N lines] |
| Languages | Detection | [list] |
| Entry points | Analysis | [list] |

---

## Phase 2: COMBUSTION - Break Down Structure

### Dependency Graph

```
[Root]
├── [Dependency 1]
│   ├── [Sub-dep]
│   └── [Sub-dep]
├── [Dependency 2]
└── [Dependency 3]
```

### Complexity Metrics

```
Cyclomatic Complexity Analysis:

File/Function                    CC    Risk
─────────────────────────────────────────────
[file/function]                  [N]   [low|med|high]
[file/function]                  [N]   [low|med|high]

Legend:
  CC 1-10:   Low risk (simple)
  CC 11-20:  Moderate risk (more complex)
  CC 21-50:  High risk (complex, hard to test)
  CC 50+:    Very high risk (untestable, refactor)
```

### Coupling Analysis

```
Afferent Coupling (Ca): [N]  - Who depends on this?
Efferent Coupling (Ce): [N]  - What does this depend on?

Instability = Ce / (Ca + Ce) = [0-1]
  0 = Maximally stable (many dependents)
  1 = Maximally unstable (depends on many)
```

---

## Phase 3: ASH - What Remains

### Technical Debt Inventory

| Debt Type | Location | Severity | Estimated Effort |
|-----------|----------|----------|------------------|
| [type] | [file:line] | [1-5] | [estimate] |
| [type] | [file:line] | [1-5] | [estimate] |

**Debt Categories:**
- Code smells (long methods, deep nesting)
- Missing tests
- Outdated dependencies
- TODO/FIXME/HACK comments
- Duplicated code
- Dead code

### Dead Code Detection

```
Potentially unused:
- [function/class] in [file]
- [function/class] in [file]

Unreachable paths:
- [location]
```

### Security Hotspots

```
Areas requiring security review:
- [file:line] - [reason]
- [file:line] - [reason]
```

---

## Phase 4: RESIDUE - The Pure Elements

### Core Architecture

```
After burning away accretions, the essential structure:

[ASCII diagram of core components]
```

### Key Abstractions

| Abstraction | Purpose | Health |
|-------------|---------|--------|
| [name] | [what it does] | [good/needs work] |
| [name] | [what it does] | [good/needs work] |

### Bottlenecks Identified

```
Performance hotspots:
1. [location] - [issue]
2. [location] - [issue]

Scalability concerns:
1. [location] - [issue]
```

---

## Calcination Report

```yaml
CALCINATION_COMPLETE:
  target:
    path: "[path]"
    type: "[file|directory|project]"

  metrics:
    files_analyzed: [N]
    lines_of_code: [N]
    cyclomatic_complexity:
      average: [N]
      max: [N]
      high_risk_count: [N]
    coupling:
      afferent: [N]
      efferent: [N]
      instability: [0-1]

  technical_debt:
    items_found: [N]
    severity_distribution:
      critical: [N]
      high: [N]
      medium: [N]
      low: [N]
    estimated_effort: "[estimate]"

  dead_code:
    unused_functions: [N]
    unreachable_paths: [N]

  security:
    hotspots: [N]

  recommendations:
    - priority: [1-3]
      action: "[what to do]"
      impact: "[expected improvement]"
```

---

## Alchemical Correspondence

```
CALCINATION in development:

Physical: Fire burns away impurities
Mental:   Analysis destroys false assumptions
Code:     Complexity metrics expose hidden structure

"The first matter must be destroyed before it can be purified."

What burns away:
- Unnecessary complexity
- False dependencies
- Untested assumptions
- Technical debt illusions

What remains:
- Core abstractions
- Essential structure
- True dependencies
- Actionable insights
```

---

## Quick Reference

```
/calcinate src/                     # Analyze src directory
/calcinate @depth:deep .            # Deep analysis of current project
/calcinate @scope:file utils.ts     # Single file analysis
/calcinate "the authentication module"  # Natural language target
```

---

*"In the crucible of analysis, complexity burns to reveal truth."*

**— The Fire of Understanding**
