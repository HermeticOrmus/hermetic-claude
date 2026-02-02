---
name: meta-gods-fix
description: Execute automated fixes for issues identified by /meta-gods analysis
category: quality
author: Ormus
---

# Meta-Gods Fix - Automated Issue Resolution

You are executing remediation for issues identified by the `/meta-gods` seven-ray Hermetic transformation analysis.

## History Persistence

**IMPORTANT**: Before running diagnostics, check for and load previous analysis history. After completing, save the current analysis.

### Load Previous History

```bash
# Check for existing history file in project root
HISTORY_FILE=".meta-gods-history.json"
if [ -f "$HISTORY_FILE" ]; then
  echo "📜 Previous analysis found:"
  cat "$HISTORY_FILE" | jq -r '.lastRun, .summary'
fi
```

Or read the file directly: `.meta-gods-history.json`

### History File Format

```json
{
  "version": "1.0",
  "projectName": "project-name",
  "lastRun": "2026-01-24T12:00:00Z",
  "runs": [
    {
      "timestamp": "2026-01-24T12:00:00Z",
      "summary": {
        "mars": { "found": 5, "fixed": 5, "remaining": 0 },
        "saturn": { "found": 3, "fixed": 2, "remaining": 1 },
        "mercury": { "found": 2, "fixed": 2, "remaining": 0 },
        "jupiter": { "found": 0, "fixed": 0, "remaining": 0 },
        "venus": { "found": 1, "fixed": 1, "remaining": 0 },
        "moon": { "found": 0, "fixed": 0, "remaining": 0 },
        "sun": { "found": 0, "fixed": 0, "remaining": 0 }
      },
      "issues": [
        {
          "domain": "mars",
          "type": "react-purity-violation",
          "file": "src/pages/survey.tsx",
          "line": 69,
          "description": "Math.random() at module level",
          "status": "fixed",
          "fixApplied": "Converted to useState with lazy init"
        }
      ],
      "verification": {
        "lint": { "status": "pass", "errors": 0, "warnings": 0 },
        "typeCheck": { "status": "pass", "errors": 0 },
        "build": { "status": "pass" }
      }
    }
  ]
}
```

### Save History After Run

After completing the fix session, create or update `.meta-gods-history.json` in the project root with:
1. Current timestamp
2. Summary of issues found/fixed per domain
3. List of specific issues and their status
4. Verification results

### Compare With Previous Run

When history exists, show a delta report:

```
## Comparison with Previous Run (2026-01-20)

### Progress
- Mars: 5 → 0 issues (-5) ✅
- Saturn: 3 → 1 issues (-2) 🔶
- Mercury: 2 → 0 issues (-2) ✅

### New Issues Since Last Run
- None / List of new issues

### Persistent Issues
- saturn: Missing sitemap entry for /admin routes (deferred)
```

## Context

The `/meta-gods` analysis identified issues across these planetary domains:
- **Mars (Production)**: Build errors, lint failures, missing error handling
- **Saturn (Structure)**: Architecture issues, missing patterns
- **Mercury (Communication)**: Accessibility, SEO gaps
- **Jupiter (Growth)**: Missing features, scalability issues
- **Venus (Aesthetics)**: Design inconsistencies, animation issues
- **Moon (Empathy)**: UX problems, form validation gaps
- **Sun (Identity)**: Brand inconsistencies, trust signals

## Execution Protocol

### 1. Diagnose Current State

Run comprehensive diagnostics:

```bash
# Full lint check
npm run lint 2>&1

# Type checking
npx tsc --noEmit 2>&1

# Build verification
npm run build 2>&1
```

### 2. Fix Categories

#### Mars Fixes (Production Hardening)
- **React Purity Violations**: Replace `Math.random()` with `useId()` hook
- **Unescaped Entities**: Use `&ldquo;` `&rdquo;` for quotes
- **Missing Error Boundaries**: Add `error.tsx` at route levels
- **Missing Loading States**: Add `loading.tsx` at route levels
- **Missing 404 Pages**: Add `not-found.tsx` at app level
- **Environment URLs**: Replace hardcoded URLs with env vars

#### Saturn Fixes (Structure)
- **Unused Imports**: Remove with eslint `--fix` or manual cleanup
- **Effect Anti-patterns**: Replace `setState` in effects with lazy initialization
- **Missing Sitemap Entries**: Update sitemap.ts for all routes

#### Mercury Fixes (Communication)
- **Missing Meta Tags**: Add title, description, keywords
- **Missing Schema.org**: Add structured data for pages
- **Missing Alt Text**: Add alt attributes to images

### 3. Verification Loop

After each fix category:
1. Run `npm run lint`
2. Run `npm run build`
3. Report remaining issues
4. Continue to next fix category

### 4. Common Fix Patterns

#### Math.random() to useId()

```tsx
// Before
import { forwardRef } from "react";
const id = someId || `input-${Math.random().toString(36).substr(2, 9)}`;

// After
import { forwardRef, useId } from "react";
const generatedId = useId();
const id = someId || `input-${generatedId}`;
```

#### setState in Effect to Lazy Init

```tsx
// Before
const [isSupported, setIsSupported] = useState(true);
useEffect(() => {
  setIsSupported(checkSupport());
}, []);

// After
const [isSupported] = useState(checkSupport);  // Lazy initialization
```

#### Unescaped Entities

```tsx
// Before
<p>This is "quoted text" here</p>

// After
<p>This is &ldquo;quoted text&rdquo; here</p>
```

## Success Criteria

The fix session is complete when:
- [ ] `npm run lint` returns 0 errors and 0 warnings
- [ ] `npm run build` completes successfully
- [ ] All identified Mars/Saturn issues resolved
- [ ] Changes committed with descriptive message

## Output Format

After fixing, report:

```
## Meta-Gods Fix Report

### Fixes Applied
- [ ] Category: Description of fix

### Verification
- Lint: PASS/FAIL (X errors, Y warnings)
- Build: PASS/FAIL
- TypeCheck: PASS/FAIL

### Remaining Issues
- None / List of deferred items
```
