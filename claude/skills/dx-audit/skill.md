# DX Audit Skill

> Systematically audit and improve Developer Experience in any codebase

**Trigger**: `/dx-audit` or when user asks about improving developer experience, onboarding, or documentation

---

## Purpose

Analyze a codebase for developer experience friction points and generate actionable improvements. This skill helps:

- New developers onboard faster
- Reduce cognitive load when navigating code
- Establish documentation standards
- Identify naming inconsistencies

---

## Audit Checklist

### 1. Documentation Discovery

| Item | Check | Fix |
|------|-------|-----|
| Root README | Does it explain how to get started? | Add Quick Start section |
| App READMEs | Does each app/package have one? | Create missing READMEs |
| CLAUDE.md | Project context for AI assistants? | Create if missing |
| Architecture docs | System design documented? | Create ARCHITECTURE.md |

### 2. Code Navigation

| Item | Check | Fix |
|------|-------|-----|
| Component index | Are components listed/categorized? | Create COMPONENTS.md |
| Composable/hook index | Are utilities documented? | Create COMPOSABLES.md or HOOKS.md |
| API routes | Are endpoints documented? | Create SERVER-API.md or API.md |
| Types | Are type files explained? | Create types/README.md |

### 3. Naming Consistency

| Item | Check | Fix |
|------|-------|-----|
| Singular/plural conflicts | `useX.ts` vs `useXs.ts` with unclear purpose | Rename to clarify (e.g., `useXManager.ts`) |
| Consistent casing | camelCase, PascalCase, kebab-case mixed? | Establish and document convention |
| Feature alignment | Files grouped by feature or type? | Document the pattern |

### 4. Environment Setup

| Item | Check | Fix |
|------|-------|-----|
| .env.example | Does it exist with comments? | Create with grouped, documented vars |
| Consistent across apps | Same format in all packages? | Standardize format |
| Secrets documented | Which are required vs optional? | Add comments |

### 5. Middleware & Guards

| Item | Check | Fix |
|------|-------|-----|
| Auth middleware | Documented behavior? | Add JSDoc or MIDDLEWARE.md |
| Route guards | Clear what each protects? | Document in file or separate doc |

---

## Execution Steps

When user invokes `/dx-audit`:

### Phase 1: Discovery (5 min)

1. **Scan structure**:
   ```
   Glob: **/README.md
   Glob: **/CLAUDE.md
   Glob: **/.env.example
   Glob: **/docs/**/*.md
   ```

2. **Inventory code**:
   ```
   Glob: **/composables/*.ts (or **/hooks/*.ts)
   Glob: **/components/**/*.vue (or *.tsx)
   Glob: **/server/api/**/*.ts (or **/api/**/*.ts)
   Glob: **/middleware/*.ts
   Glob: **/types/*.ts
   ```

3. **Check naming conflicts**:
   - Look for singular/plural pairs
   - Look for similar names with unclear distinction

### Phase 2: Gap Analysis (3 min)

Compare inventory against checklist. For each missing item, note:
- What's missing
- Where it should go
- Priority (Quick win / Medium / Large)

### Phase 3: Report (2 min)

Output structured report:

```markdown
## DX Audit Report

### Quick Wins (5-15 min each)
- [ ] Item 1
- [ ] Item 2

### Medium Effort (30-60 min)
- [ ] Item 1
- [ ] Item 2

### Larger Refactors (2+ hours)
- [ ] Item 1
- [ ] Item 2

### Critical Paths
What a new developer CAN'T do without these fixes.
```

### Phase 4: Implementation (Optional)

If user approves, generate all documentation files in parallel.

---

## Documentation Templates

### README.md (App)

```markdown
# [App Name]

> [One-line description]

**Port**: [dev port]
**Status**: [Active/Planned/Deprecated]

---

## Purpose

[What this app does in 2-3 sentences]

---

## Quick Start

\`\`\`bash
npm install
cp .env.example .env
npm run dev
\`\`\`

---

## Key Files

| File | Purpose |
|------|---------|
| `path/to/file` | Description |

---

## Related Docs

- [Link to other relevant docs]
```

### COMPONENTS.md

```markdown
# Components

> [Framework] components organized by [feature/type]

**Total**: [N] components

---

## Directory Structure

\`\`\`
components/
├── category1/
├── category2/
└── category3/
\`\`\`

---

## [Category 1]

| Component | Purpose | Props |
|-----------|---------|-------|
| `Name.vue` | Description | `prop1`, `prop2` |
```

### COMPOSABLES.md

```markdown
# Composables

> Reusable composition functions

**Total**: [N] composables

---

## Standard Return Pattern

\`\`\`typescript
return {
  data,
  loading,
  error,
  // actions
}
\`\`\`

---

## By Category

### [Category]

| Composable | Purpose | Returns |
|------------|---------|---------|
| `useName` | Description | `data`, `loading`, `action` |
```

### SERVER-API.md

```markdown
# Server API

> API routes documentation

**Base URL**: `http://localhost:[port]/api`

---

## [Feature Group]

### [METHOD] `/api/path`

[Description]

**Query/Body**:
| Param | Type | Required | Description |
|-------|------|----------|-------------|
| `param` | string | Yes | Description |

**Response**:
\`\`\`json
{ "field": "value" }
\`\`\`
```

### types/README.md

```markdown
# Type Definitions

---

## Files

| File | Source | Purpose |
|------|--------|---------|
| `name.ts` | Auto/Manual | Description |

---

## [File Name] (Auto-Generated)

**Regenerate**: `command to regenerate`

## [File Name] (Manual)

**Contains**: Type1, Type2, Type3
```

---

## Quality Criteria

A well-documented codebase should enable:

1. **5-minute orientation**: New dev understands what the project does
2. **15-minute setup**: New dev has app running locally
3. **30-minute productivity**: New dev can find where to make changes
4. **1-hour contribution**: New dev can submit a meaningful PR

---

## Anti-Patterns to Flag

- README that only says "TODO" or is empty
- .env.example with no comments
- Composables without JSDoc
- API routes without request/response shapes
- Middleware without behavior documentation
- Types without explanation of source (auto vs manual)
- Duplicate or confusingly-named files

---

## Integration

This skill works well with:
- `/review` - Code review can reference DX gaps
- `/docs` - Generate specific documentation
- `/onboard` - Create onboarding guide from DX audit
