# /dx-audit

> Audit and improve Developer Experience in the current codebase

---

## Usage

```
/dx-audit                    # Full audit of current project
/dx-audit [path]             # Audit specific directory
/dx-audit --report-only      # Report without implementing fixes
/dx-audit --implement        # Generate all documentation
```

---

## What It Does

1. **Scans** the codebase for documentation gaps
2. **Inventories** components, composables, API routes, types
3. **Identifies** naming conflicts and inconsistencies
4. **Reports** prioritized improvements (quick wins → large refactors)
5. **Generates** missing documentation (with approval)

---

## Checklist

### Documentation
- [ ] Root README with Quick Start
- [ ] App-level READMEs
- [ ] CLAUDE.md for AI context
- [ ] Architecture documentation

### Code Navigation
- [ ] Component index (COMPONENTS.md)
- [ ] Composable/hook index
- [ ] API route documentation
- [ ] Type definitions README

### Consistency
- [ ] No naming conflicts (singular vs plural)
- [ ] Consistent casing conventions
- [ ] .env.example with comments

### Onboarding
- [ ] 5-minute orientation possible
- [ ] 15-minute local setup possible
- [ ] 30-minute productivity possible

---

## Output

Generates a prioritized report:

```
## DX Audit Report

### Quick Wins (5-15 min)
- Create missing README
- Rename confusing files

### Medium Effort (30-60 min)
- Create COMPONENTS.md
- Document API routes

### Larger Refactors (2+ hours)
- Standardize composable patterns
- Create architecture docs
```

---

## Related

- `skill:dx-audit` - Full skill with templates
- `/docs` - Generate specific documentation
- `/review` - Code review
