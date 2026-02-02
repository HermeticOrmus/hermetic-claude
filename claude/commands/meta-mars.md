# Meta-Mars: Production Hardening Workflow

**"Find it. Confirm it. Fix it."**

Comprehensive audit-to-remediation pipeline combining Mars enforcement, Meta-Review corroboration, and Meta-Build planning.

## Usage
```
/meta-mars [path]           # Full audit + plan for path or current project
/meta-mars --audit-only     # Just Mars + Meta-Review (no build plan)
/meta-mars --critical-only  # Focus only on critical/severe issues
```

## Arguments
$ARGUMENTS

---

## Orchestration Flow

```
@orchestration
  @sequential[

    ═══════════════════════════════════════════════════════
    PHASE 1: MARS AUDIT - Find the Sins
    ═══════════════════════════════════════════════════════

    @parallel[
      → Sin 1: Data Model Drift
      → Sin 2: Happy Path Delusion
      → Sin 3: Observability Void
      → Sin 4: Unit Economics Buried
      → Sin 5: Environment Confusion
    ]

    ◆ all:sins:audited

    ═══════════════════════════════════════════════════════
    PHASE 2: META-REVIEW - Corroborate Findings
    ═══════════════════════════════════════════════════════

    @parallel[
      → Correctness Pass
      → Security Pass
      → Performance Pass
      → Maintainability Pass
    ]

    → Synthesize: Confirm/Dispute each Mars finding
    → Prioritize by severity × exploitability

    ◆ findings:corroborated

    ═══════════════════════════════════════════════════════
    PHASE 3: META-BUILD - Plan Remediation
    ═══════════════════════════════════════════════════════

    @run:now
    → Group issues by fix locality
    → Sequence fixes (dependencies first)
    → Estimate effort per fix
    → Create implementation roadmap

    ◆ plan:ready

    ═══════════════════════════════════════════════════════
    PHASE 4: SUMMARY - Executive Report
    ═══════════════════════════════════════════════════════

    @run:now
    → Composite production-readiness score
    → Critical path to deployment
    → Recommended sprint allocation

  ]
@end
```

---

## Phase 1: Mars Audit

Run 5 parallel Task agents to hunt each Mortal Sin:

### Sin 1: Data Model Drift
- TypeScript types vs database schemas
- Optional/required field mismatches
- Inconsistent ID types
- Missing foreign key constraints

### Sin 2: Happy Path Delusion
- Missing error boundaries
- Swallowed exceptions
- No timeout handling
- Missing input validation
- Security vulnerabilities (XSS, injection)

### Sin 3: Observability Void
- Console.log only (no structured logging)
- No request correlation
- No error tracking (Sentry)
- No health checks
- Silent 200s on failure

### Sin 4: Unit Economics Buried
- Unbounded queries (no LIMIT)
- N+1 patterns
- Missing pagination
- No caching strategy
- Full table scans

### Sin 5: Environment Confusion
- Hardcoded URLs/secrets
- Missing env validation
- No .env.example
- Debug code in production
- Missing feature flags

**Output**: Issue list with severity (CRITICAL/SEVERE/MODERATE/MINOR) and file:line references

---

## Phase 2: Meta-Review Corroboration

Run 4 parallel review passes to validate Mars findings:

| Pass | Focus | Corroborates |
|------|-------|--------------|
| Correctness | Logic errors, edge cases | Sin 1, 2 |
| Security | OWASP Top 10 | Sin 2, 5 |
| Performance | Complexity, resources | Sin 4 |
| Maintainability | DRY, readability | All |

**Synthesis**:
- CONFIRMED: Mars finding validated by review
- DISPUTED: Finding is false positive or low-risk
- ESCALATED: Review found additional severity

**Output**: Corroborated issue list with confidence levels

---

## Phase 3: Meta-Build Planning

For each confirmed issue, generate a **Solution Architecture Card**:

```markdown
### Issue: [Name]
**Severity**: CRITICAL | SEVERE | MODERATE | MINOR
**Location**: file:line

#### Problem Analysis
**What's happening**: [Describe the current behavior]
**Why it's dangerous**: [Explain the risk/impact]
**Root cause**: [The underlying flaw that enables this]

#### Solution Approach
**Strategy**: [High-level approach]
**Why this approach**: [Reasoning for choosing this over alternatives]
**Alternatives considered**:
- [Alt 1]: [Why rejected]
- [Alt 2]: [Why rejected]

#### Implementation
**Changes required**:
1. [File 1]: [Specific change]
2. [File 2]: [Specific change]

**Code pattern**:
```[language]
// Before (vulnerable/problematic)
[current code]

// After (fixed)
[new code]
```

**Dependencies**: [What must be fixed/exist first]
**Effort**: S (30min) | M (1-2hr) | L (3-4hr) | XL (1+ day)

#### Verification
**How to test**: [Manual verification steps]
**Regression check**: [What could break]
**Success criteria**: [How we know it's fixed]
```

---

## Solution Reasoning Framework

When designing fixes, apply these thinking patterns:

### Defense in Depth
Don't just fix the symptom—add layers:
```
Layer 1: Input validation (prevent bad data entering)
Layer 2: Schema enforcement (catch at boundary)
Layer 3: Runtime checks (fail safely if bypassed)
Layer 4: Monitoring (detect if exploited)
```

### Trade-off Analysis
For each solution, explicitly state:
- **Complexity cost**: How much harder is the codebase to understand?
- **Performance cost**: Any runtime overhead?
- **Maintenance cost**: Will this require ongoing attention?
- **Risk reduction**: How much safer are we?

### Pattern Recognition
Identify if the issue is:
- **Isolated**: Fix in one place
- **Systemic**: Needs architectural change
- **Symptomatic**: Fixing this reveals deeper issues

### Fix Locality Principle
Prefer fixes that are:
1. **Closest to the source** (validate at input, not output)
2. **Least invasive** (minimal blast radius)
3. **Most general** (fixes class of problems, not just this instance)

---

## Sequencing Rules

**Order of operations**:
1. **Security vulnerabilities first** - Attackers don't wait
2. **Data integrity issues** - Corruption compounds
3. **Stability issues** - Users notice crashes
4. **Performance issues** - Slow is better than broken
5. **Maintainability** - Future you will thank present you

**Dependency awareness**:
- Map which fixes depend on others
- Identify "keystone fixes" that unblock multiple issues
- Group related fixes for atomic commits

---

## Example: Completed Solution Architecture Card

Here's a real example from a Shape of Dreams KB audit:

```markdown
### Issue: CSS Injection via traveler.color
**Severity**: CRITICAL
**Location**: src/app/travelers/[slug]/page.tsx:116,130

#### Problem Analysis
**What's happening**: User-controlled `traveler.color` from JSON is interpolated
directly into inline styles without validation:
```tsx
style={{ background: `linear-gradient(135deg, ${traveler.color}20, transparent)` }}
style={{ color: traveler.color }}
```

**Why it's dangerous**: An attacker who can modify the JSON data could inject:
- CSS expressions that execute JavaScript (older browsers)
- Exfiltration via `url()` to external servers
- UI redressing attacks to trick users
- Breaking the page layout entirely

**Root cause**: No validation that `color` is actually a hex color. The schema
accepts any string: `color: z.string()`.

#### Solution Approach
**Strategy**: Validate color format at the schema level using regex.

**Why this approach**:
- Validates at data boundary (earliest possible point)
- Single source of truth for color format
- Zod will reject invalid data before it enters the system
- Zero runtime cost after initial parse

**Alternatives considered**:
- Sanitize at render time: Rejected—would need to repeat in every component
- CSS-escape the value: Rejected—only prevents some attacks, not all
- Use CSS variables: Rejected—still need to validate the source value

#### Implementation
**Changes required**:
1. `src/lib/schemas.ts`: Add regex validation to color field
2. `data/en/travelers.json`: Verify all colors match format (should already)

**Code pattern**:
```typescript
// Before (vulnerable)
color: z.string()

// After (validated)
color: z.string().regex(
  /^#([0-9A-Fa-f]{3}|[0-9A-Fa-f]{6}|[0-9A-Fa-f]{8})$/,
  "Color must be valid hex format (#RGB, #RRGGBB, or #RRGGBBAA)"
)
```

**Dependencies**: None—this is a keystone fix
**Effort**: S (30min)

#### Verification
**How to test**:
1. Modify a traveler's color to `red; background: url(https://evil.com)`
2. Run the app—should fail at build time with Zod validation error
3. Verify existing travelers still render correctly

**Regression check**: Ensure all 26 travelers have valid hex colors in JSON
**Success criteria**: Invalid color formats rejected at build time, not runtime
```

---

### Example 2: Performance Fix with Trade-offs

```markdown
### Issue: 572KB Bundle from Static JSON Imports
**Severity**: CRITICAL
**Location**: src/lib/data.ts:1-15

#### Problem Analysis
**What's happening**: All game data (travelers, memories, stars, essences) is
imported statically at the top of data.ts:
```typescript
import travelersData from "../../data/en/travelers.json";
import memoriesData from "../../data/en/memories.json";
import starsData from "../../data/en/stars.json";
import essencesData from "../../data/en/essences.json";
```

**Why it's dangerous**:
- 572KB added to initial JS bundle
- Every page loads ALL data even if only showing travelers
- Mobile users on slow connections wait 2-5+ seconds
- Lighthouse performance score tanks

**Root cause**: Convenience over optimization. Static imports are simple but
don't consider the cost at scale.

#### Solution Approach
**Strategy**: Dynamic imports with route-based code splitting.

**Why this approach**:
- Next.js handles code splitting automatically with dynamic()
- Data only loads when needed
- Can show loading states while fetching
- No architectural changes to data structure

**Alternatives considered**:
- API routes: Rejected—this is a static site (`output: "export"`), no server
- getStaticProps per page: Rejected—still bundles all data per page
- External CDN for JSON: Rejected—adds latency, CORS complexity
- IndexedDB caching: Overkill for read-only game data

**Trade-off analysis**:
| Factor | Static Import | Dynamic Import |
|--------|--------------|----------------|
| Initial load | 572KB | ~50KB |
| Code complexity | Simple | Moderate |
| Loading states | Not needed | Need skeleton/spinner |
| Type safety | Full | Same (with async wrapper) |

#### Implementation
**Changes required**:
1. `src/lib/data.ts`: Convert to async data fetchers
2. `src/components/pages/*-content.tsx`: Add loading states
3. Consider: SWR or React Query for caching (optional)

**Code pattern**:
```typescript
// Before (eager load everything)
import travelersData from "../../data/en/travelers.json";
export function getTravelers() { return parse(travelersData); }

// After (lazy load on demand)
export async function getTravelers(): Promise<Traveler[]> {
  const data = await import("../../data/en/travelers.json");
  return parse(data.default);
}

// In component
const [travelers, setTravelers] = useState<Traveler[]>([]);
const [loading, setLoading] = useState(true);

useEffect(() => {
  getTravelers().then(data => {
    setTravelers(data);
    setLoading(false);
  });
}, []);
```

**Dependencies**: None
**Effort**: L (3-4hr) - Multiple components need updating

#### Verification
**How to test**:
1. Build production bundle: `npm run build`
2. Check bundle analyzer: Should show separate chunks per data type
3. Network tab: Verify data loads only when page accessed

**Regression check**: All pages still display correct data
**Success criteria**: Initial bundle < 100KB, LCP < 2.5s on 3G
```

---

## Phase 4: Executive Summary

```markdown
# META-MARS REPORT
**Project**: {name}
**Date**: {date}
**Audited By**: Mars + Meta-Review

## Production Readiness
**Score**: {X}/10
**Verdict**: {DEPLOY_READY | NEEDS_HARDENING | STOP_SHIP}

## Issue Counts
| Severity | Mars Found | Confirmed | False Positive |
|----------|------------|-----------|----------------|
| CRITICAL | | | |
| SEVERE | | | |
| MODERATE | | | |
| MINOR | | | |

## Critical Path to Production
1. [Highest priority fix] - {effort}
2. [Second priority fix] - {effort}
3. [Third priority fix] - {effort}

## Recommended Sprint Allocation
- Sprint 1: Security + Stability ({X} issues)
- Sprint 2: Performance ({Y} issues)
- Sprint 3: Maintainability ({Z} issues)

## Next Action
{Single most important thing to do right now}
```

---

## Example Invocation

```bash
# Full audit of current project
/meta-mars

# Audit specific directory
/meta-mars src/lib

# Only critical/severe (for pre-deploy check)
/meta-mars --critical-only
```

---

## Philosophy

Meta-Mars combines three complementary forces:

| Phase | Metaphor | Purpose |
|-------|----------|---------|
| Mars | The Warrior | Find every weakness |
| Meta-Review | The Council | Validate and prioritize |
| Meta-Build | The Engineer | Plan the fixes |

**"In production, ignorance is not bliss. It's an incident."**

---

*v1.1 | Created: 2025-12-20 | Added Solution Architecture Cards with reasoning framework*
