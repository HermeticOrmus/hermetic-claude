# Meta-Saturn: Architecture & Structure Enforcer

**"What is built without foundations will not stand. What has no limits will collapse."**

Comprehensive architectural review that establishes long-term structure, enforces discipline, defines boundaries, and builds foundations that endure.

## Usage
```
/meta-saturn [path]            # Full architectural review
/meta-saturn --debt            # Technical debt inventory
/meta-saturn --boundaries      # Define system limits and constraints
/meta-saturn --conventions     # Enforce project standards
/meta-saturn --roadmap         # Long-term evolution planning
/meta-saturn --audit           # Quick architecture health check
```

## Arguments
$ARGUMENTS

---

## Orchestration Flow

```
@orchestration
  @sequential[

    ═══════════════════════════════════════════════════════
    PHASE 1: SURVEY - Map the Territory
    ═══════════════════════════════════════════════════════

    @parallel[
      → Map current architecture
      → Inventory technical debt
      → Document implicit conventions
      → Identify load-bearing structures
    ]

    ◆ territory:mapped

    ═══════════════════════════════════════════════════════
    PHASE 2: CONSTRAIN - Define Boundaries
    ═══════════════════════════════════════════════════════

    @run:now
    → What are the hard limits?
    → What should never be allowed?
    → What dependencies are acceptable?
    → What complexity ceiling exists?

    ◆ boundaries:set

    ═══════════════════════════════════════════════════════
    PHASE 3: STRUCTURE - Design Foundations
    ═══════════════════════════════════════════════════════

    @parallel[
      → Module/component boundaries
      → Data flow patterns
      → Dependency direction
      → Extension points
    ]

    → Synthesize: Recommended architecture

    ◆ structure:designed

    ═══════════════════════════════════════════════════════
    PHASE 4: DISCIPLINE - Enforce Standards
    ═══════════════════════════════════════════════════════

    @run:now
    → Define coding conventions
    → Establish naming patterns
    → Set file organization rules
    → Create review checklists

    ◆ discipline:codified

    ═══════════════════════════════════════════════════════
    PHASE 5: TIMELINE - Plan Evolution
    ═══════════════════════════════════════════════════════

    @run:now
    → What can be built now?
    → What must wait?
    → What will decay and need replacement?
    → Migration and upgrade paths

    ◆ timeline:planned

  ]
@end
```

---

## Phase 1: Survey

Before you can build, you must know what exists.

### Architecture Map

```markdown
### System Overview

```
┌─────────────────────────────────────────────────────┐
│                                                     │
│   [High-level architecture diagram]                 │
│                                                     │
│   Show: Components, data flow, external deps       │
│                                                     │
└─────────────────────────────────────────────────────┘
```

### Component Inventory

| Component | Purpose | Health | Dependencies | Risk |
|-----------|---------|--------|--------------|------|
| [Name] | [What it does] | [1-5] | [What it needs] | [High/Med/Low] |

### Load-Bearing Structures

**Critical paths** (if these break, everything breaks):
1. [Structure 1]: [Why critical]
2. [Structure 2]: [Why critical]

**Single points of failure**:
1. [SPOF 1]: [Impact if fails]
2. [SPOF 2]: [Impact if fails]

### Coupling Analysis

| From | To | Coupling Type | Strength | Problem? |
|------|-----|---------------|----------|----------|
| [A] | [B] | [Direct/Indirect] | [Tight/Loose] | [Yes/No] |
```

### Technical Debt Inventory

```markdown
### Debt Registry

| ID | Location | Type | Severity | Age | Cost to Fix | Risk of Leaving |
|----|----------|------|----------|-----|-------------|-----------------|
| D1 | [file:line] | [Category] | [1-5] | [How long] | [Hours/Days] | [What could happen] |

### Debt Categories

**Code Debt**:
- [ ] Duplicated code
- [ ] Dead code
- [ ] Overly complex functions
- [ ] Missing abstraction
- [ ] Poor naming

**Architecture Debt**:
- [ ] Wrong component boundaries
- [ ] Circular dependencies
- [ ] God objects/modules
- [ ] Missing layers

**Infrastructure Debt**:
- [ ] Outdated dependencies
- [ ] Missing automation
- [ ] Manual processes
- [ ] Configuration drift

**Knowledge Debt**:
- [ ] Missing documentation
- [ ] Tribal knowledge
- [ ] No onboarding path
- [ ] Unclear ownership

### Debt Heat Map

```
HIGH DEBT ████████████ [Area 1]
MEDIUM   ██████░░░░░░ [Area 2]
LOW      ███░░░░░░░░░ [Area 3]
CLEAN    █░░░░░░░░░░░ [Area 4]
```

### Debt Payoff Priority

1. [Highest-impact debt to fix]
2. [Second priority]
3. [Third priority]
```

### Convention Discovery

```markdown
### Implicit Patterns Found

| Pattern | Where Used | Consistent? | Should Formalize? |
|---------|-----------|-------------|-------------------|
| [Pattern 1] | [Locations] | [Yes/Partial/No] | [Yes/No] |
| [Naming convention] | | | |
| [File structure] | | | |
| [Error handling] | | | |
```

---

## Phase 2: Constrain

Freedom without limits creates chaos. Define the boundaries.

### System Boundaries

```markdown
### Hard Limits

| Constraint | Limit | Rationale |
|------------|-------|-----------|
| Max bundle size | [X KB] | Performance budget |
| Max API response time | [X ms] | User experience |
| Max function complexity | [X cyclomatic] | Maintainability |
| Max file length | [X lines] | Readability |
| Max nesting depth | [X levels] | Comprehension |

### Never Allow

| Forbidden | Why | Alternative |
|-----------|-----|-------------|
| [Pattern/practice] | [Reason] | [What to do instead] |
| Direct DB access from UI | Breaks layers | Use API layer |
| Any in TypeScript | Type safety lost | Proper typing |
| console.log in prod | Noise/security | Structured logging |

### Dependency Rules

**Allowed dependencies**:
| Category | Allowed | Rationale |
|----------|---------|-----------|
| HTTP client | [Specific lib] | [Why this one] |
| State management | [Specific lib] | |
| Testing | [Specific lib] | |

**Dependency approval process**:
1. [Check size/maintenance]
2. [Security review]
3. [Document rationale]

### Complexity Ceiling

**Max acceptable complexity**:
- Single function: [X]
- Single file: [X]
- Single module: [X]
- Entire codebase: [X]

**When ceiling is hit**: [Split/refactor/redesign]
```

---

## Phase 3: Structure

Design the architecture that will hold.

### Module Boundaries

```markdown
### Module Map

```
┌──────────────────────────────────────────────────────┐
│  APPLICATION                                          │
├──────────────────────────────────────────────────────┤
│  ┌─────────┐  ┌─────────┐  ┌─────────┐              │
│  │ Feature │  │ Feature │  │ Feature │              │
│  │    A    │  │    B    │  │    C    │              │
│  └────┬────┘  └────┬────┘  └────┬────┘              │
│       │            │            │                    │
├───────┴────────────┴────────────┴────────────────────┤
│  SHARED SERVICES                                      │
│  ┌─────────┐  ┌─────────┐  ┌─────────┐              │
│  │   API   │  │  State  │  │  Utils  │              │
│  └─────────┘  └─────────┘  └─────────┘              │
├──────────────────────────────────────────────────────┤
│  INFRASTRUCTURE                                       │
│  ┌─────────┐  ┌─────────┐  ┌─────────┐              │
│  │   DB    │  │  Auth   │  │ External│              │
│  └─────────┘  └─────────┘  └─────────┘              │
└──────────────────────────────────────────────────────┘
```

### Module Contracts

| Module | Responsibility | Public API | Forbidden |
|--------|----------------|------------|-----------|
| [Module] | [Single responsibility] | [What it exports] | [What it must not do] |

### Dependency Direction

**Rule**: Dependencies flow downward only

```
Features → Shared → Infrastructure → External
   ↓          ↓           ↓             ↓
  Uses      Uses        Uses         Uses
```

**Never**:
- Infrastructure → Features
- Shared → Features
- Circular dependencies anywhere
```

### Data Flow Patterns

```markdown
### Data Flow Diagram

```
[User Action]
      ↓
[UI Component] ──→ [State Management]
      ↓                    ↓
[API Call] ←────── [Selectors/Derived]
      ↓
[Server Handler]
      ↓
[Database]
      ↓
[Response] ──→ [State Update] ──→ [UI Rerender]
```

### Data Flow Rules

1. **Unidirectional**: Data flows one way
2. **Single source of truth**: One canonical location
3. **Derived state**: Computed, not duplicated
4. **Immutability**: Transform, don't mutate

### Extension Points

| Extension Point | Purpose | Interface |
|-----------------|---------|-----------|
| [Plugin system] | [Allow third-party extension] | [API contract] |
| [Event hooks] | [React to lifecycle events] | [Event types] |
| [Theme system] | [Visual customization] | [Token structure] |
```

---

## Phase 4: Discipline

Standards that aren't enforced aren't standards.

### Coding Conventions

```markdown
### Naming Patterns

| Element | Pattern | Example |
|---------|---------|---------|
| Files | [kebab-case / PascalCase] | `user-service.ts` |
| Functions | [camelCase] | `getUserById` |
| Constants | [SCREAMING_SNAKE] | `MAX_RETRY_COUNT` |
| Types/Interfaces | [PascalCase] | `UserProfile` |
| Components | [PascalCase] | `UserCard` |
| Hooks | [use prefix] | `useAuth` |

### File Organization

```
src/
├── features/           # Feature modules
│   └── [feature]/
│       ├── components/
│       ├── hooks/
│       ├── utils/
│       ├── types.ts
│       └── index.ts    # Public exports only
├── shared/             # Cross-feature utilities
│   ├── components/
│   ├── hooks/
│   └── utils/
├── infrastructure/     # External integrations
│   ├── api/
│   ├── db/
│   └── auth/
└── app/                # Application shell
    └── routes/
```

### Code Patterns

**Prefer**:
```typescript
// Explicit over clever
const isActive = status === 'active';

// Early return over nested conditions
if (!user) return null;
if (!user.isActive) return <Inactive />;
return <Active user={user} />;

// Named exports over default
export { UserCard };

// Composition over inheritance
```

**Avoid**:
```typescript
// Ternary hell
const x = a ? (b ? c : d) : (e ? f : g);

// Magic numbers
setTimeout(fn, 86400000);

// Any
const data: any = fetchData();
```
```

### Review Checklist

```markdown
### Pre-Commit Checklist

- [ ] Follows naming conventions
- [ ] No lint errors
- [ ] Types are complete (no any)
- [ ] Tests pass
- [ ] No console.log
- [ ] Error handling present
- [ ] No hardcoded values
- [ ] Documentation updated

### PR Review Checklist

- [ ] Single responsibility
- [ ] Appropriate size (< 400 lines)
- [ ] Tests included
- [ ] No unnecessary changes
- [ ] Follows architecture
- [ ] No new debt introduced
- [ ] Breaking changes documented
```

---

## Phase 5: Timeline

Architecture evolves. Plan for change.

### Evolution Roadmap

```markdown
### Current State → Target State

```
NOW                    6 MONTHS                 1 YEAR
──────────────────────────────────────────────────────
[Monolith]      →     [Modular Monolith]   →   [Services]
[Local state]   →     [Central store]      →   [Distributed]
[Manual deploy] →     [CI/CD]              →   [GitOps]
```

### Migration Phases

**Phase 1: Foundation** (Now)
- [ ] [Task 1]
- [ ] [Task 2]
- [ ] [Task 3]

**Phase 2: Stabilization** (Month 3)
- [ ] [Task 1]
- [ ] [Task 2]

**Phase 3: Evolution** (Month 6+)
- [ ] [Task 1]
- [ ] [Task 2]

### Decay Forecast

| Component | Expected Lifespan | Replacement Trigger | Successor |
|-----------|-------------------|---------------------|-----------|
| [Component] | [X months/years] | [When to replace] | [What replaces it] |

### Upgrade Paths

| Current | When | Next | Effort |
|---------|------|------|--------|
| [Tech/version] | [Trigger] | [New version/tech] | [S/M/L/XL] |
```

---

## Saturn Report

```markdown
# META-SATURN ARCHITECTURE REPORT
**Project**: {name}
**Date**: {date}
**Architect**: Saturn

---

## Structural Health Score
**Overall**: {X}/10
**Verdict**: {SOLID | STABLE | NEEDS_WORK | UNSTABLE}

## Architecture Summary
**Pattern**: [Monolith / Modular / Microservices / etc.]
**Layers**: [List main layers]
**Critical paths**: [X]
**Single points of failure**: [Y]

## Debt Status
**Total items**: [X]
**Critical**: [Y]
**Oldest debt**: [Age]
**Estimated payoff**: [Hours/Days]

## Boundary Health
**Modules well-bounded**: [X/Y]
**Coupling issues**: [Z]
**Dependency violations**: [N]

## Convention Status
**Documented**: [Yes/Partial/No]
**Enforced**: [Automated/Manual/Not]
**Compliance**: [X%]

## Priority Actions
1. [Most important structural work]
2. [Second priority]
3. [Third priority]

## Timeline
**Can build now**: [What's ready]
**Must fix first**: [What blocks progress]
**Plan for later**: [Future work]
```

---

## Saturn's Laws

### Law 1: Foundations First
No feature matters if the foundation crumbles. Invest in structure before you build on top.

### Law 2: Limits Create Freedom
Unbounded systems become unmanageable. Constraints enable sustainable velocity.

### Law 3: Debt Compounds
Technical debt earns interest. Pay it down or watch it consume you.

### Law 4: Structure Outlasts Builders
Good architecture survives the departure of its creators. Bad architecture dies with them.

### Law 5: Time Reveals Truth
Given time, all structural weaknesses manifest. Build for the long term.

---

## Philosophy

Saturn governs structure, discipline, time, boundaries, and karma (consequences).

| Principle | Application |
|-----------|-------------|
| **Structure** | Clear boundaries, defined layers |
| **Discipline** | Standards that are enforced |
| **Time** | Build for longevity, not speed |
| **Limits** | Constraints that enable |
| **Consequences** | Every shortcut has a cost |

**"The quality of your architecture is revealed by how long you can maintain velocity."**

---

*v1.0 | Created: 2026-01-04 | Saturn builds what endures*
