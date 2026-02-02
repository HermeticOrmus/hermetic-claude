---
description: Solidify the refined work into manifest form. Deploy, ship, release. The earth that makes the ethereal concrete.
allowed-tools: Read, Bash(npm:*, pnpm:*, yarn:*, docker:*, vercel:*, netlify:*, git:*, gh:*), Task
argument-hint: [@target:[vercel|netlify|docker|npm|github]] [@env:[dev|staging|prod]] [what to deploy]
---

# Coagulate: The Solidification of Shipping

```
Coag: Refined → Manifest

"What was potential becomes actual. What was idea becomes reality."

Element: Earth 🜍
Stage: RUBEDO (Reddening) - Final stage
Operation: Deployment, release, manifestation
```

## Task

$ARGUMENTS

---

## Phase 1: PREPARATION - Verify Readiness

```
Coagulation Target:
  What: [project/package/artifact]
  Target: [vercel | netlify | docker | npm | github]
  Environment: [dev | staging | prod]
```

### Pre-Flight Checks

```
Quality gates:
┌──────────────────────────────────────────────────────────────┐
│ Check                           │ Status  │ Details         │
├──────────────────────────────────────────────────────────────┤
│ All tests pass                  │ [✓/✗]   │ [N]/[N] passing │
│ Build succeeds                  │ [✓/✗]   │ [build output]  │
│ Lint clean                      │ [✓/✗]   │ [N] warnings    │
│ Type check passes               │ [✓/✗]   │ [status]        │
│ Dependencies audited            │ [✓/✗]   │ [N] vulns       │
│ Environment variables set       │ [✓/✗]   │ [list]          │
│ Version bumped                  │ [✓/✗]   │ [version]       │
└──────────────────────────────────────────────────────────────┘

Ready to deploy: [YES/NO]
Blocking issues: [list if any]
```

---

## Phase 2: CRYSTALLIZATION - Build the Artifact

### Build Process

```
Building artifact...

Command: [build command]
Environment: [env vars]

Build output:
  Duration: [time]
  Size: [size]
  Artifacts:
    - [artifact 1] ([size])
    - [artifact 2] ([size])

Optimizations applied:
  ✓ Minification
  ✓ Tree shaking
  ✓ Code splitting
  ✓ Asset optimization
```

### Artifact Verification

```
Artifact health:
  Bundle analysis:
    Main: [size] ([gzipped])
    Chunks: [N] totaling [size]

  Lighthouse scores (if web):
    Performance: [score]
    Accessibility: [score]
    Best Practices: [score]
    SEO: [score]
```

---

## Phase 3: MANIFESTATION - Deploy to Target

### If @target:vercel

```
VERCEL DEPLOYMENT

Project: [project name]
Environment: [env]

Deploying...
  ├── Uploading artifacts
  ├── Building (if needed)
  ├── Deploying to edge
  └── Propagating to regions

Result:
  URL: [deployment URL]
  Status: [success/failed]
  Duration: [time]

Deployment details:
  ID: [deployment id]
  Branch: [branch]
  Commit: [commit hash]
  Regions: [list]
```

### If @target:netlify

```
NETLIFY DEPLOYMENT

Site: [site name]
Environment: [env]

Deploying...
  ├── Uploading build
  ├── Processing assets
  ├── Deploying to CDN
  └── Invalidating cache

Result:
  URL: [deployment URL]
  Deploy ID: [id]
  Status: [success/failed]
```

### If @target:docker

```
DOCKER BUILD & PUSH

Image: [image name]
Tag: [tag]
Registry: [registry]

Building...
  Step 1/N: [step description]
  Step 2/N: [step description]
  ...

Pushing...
  [registry]/[image]:[tag]

Result:
  Image ID: [id]
  Size: [size]
  Digest: [sha]
```

### If @target:npm

```
NPM PUBLISH

Package: [package name]
Version: [version]
Registry: [registry]

Pre-publish checks:
  ✓ package.json valid
  ✓ README present
  ✓ LICENSE present
  ✓ Files included: [list]
  ✓ Files excluded: [list]

Publishing...

Result:
  Package: [name]@[version]
  URL: https://npmjs.com/package/[name]
  Status: [success/failed]
```

### If @target:github

```
GITHUB RELEASE

Repository: [owner/repo]
Tag: [tag]
Title: [release title]

Creating release...
  ├── Creating tag
  ├── Generating changelog
  ├── Uploading assets
  └── Publishing release

Result:
  Release URL: [url]
  Tag: [tag]
  Assets: [list]
```

---

## Phase 4: VERIFICATION - Confirm Manifestation

### Smoke Tests

```
Post-deployment verification:

┌──────────────────────────────────────────────────────────────┐
│ Check                           │ Status  │ Response        │
├──────────────────────────────────────────────────────────────┤
│ Health endpoint                 │ [✓/✗]   │ [status code]   │
│ Homepage loads                  │ [✓/✗]   │ [time]          │
│ API responds                    │ [✓/✗]   │ [status]        │
│ Auth flow works                 │ [✓/✗]   │ [status]        │
│ Critical path functional        │ [✓/✗]   │ [status]        │
└──────────────────────────────────────────────────────────────┘
```

### Rollback Plan

```
If issues detected:

Rollback command: [command]
Previous version: [version/deployment]
Rollback time estimate: [time]

Monitoring:
  Error rate: [current vs baseline]
  Response time: [current vs baseline]

Alerts configured: [yes/no]
```

---

## Coagulation Report

```yaml
COAGULATION_COMPLETE:
  target:
    platform: "[vercel|netlify|docker|npm|github]"
    environment: "[dev|staging|prod]"

  artifact:
    type: "[build|image|package|release]"
    version: "[version]"
    size: "[size]"

  deployment:
    status: "[success|failed|rolled-back]"
    url: "[deployment URL]"
    id: "[deployment ID]"
    duration: "[time]"

  verification:
    smoke_tests: "[pass|fail]"
    health_check: "[pass|fail]"

  rollback:
    available: [true/false]
    previous_version: "[version]"
    command: "[rollback command]"

  metadata:
    deployed_by: "[who]"
    deployed_at: "[timestamp]"
    commit: "[hash]"
    branch: "[branch]"
```

---

## Alchemical Correspondence

```
COAGULATION in development:

Physical: The liquid becomes solid, fixed
Mental:   The vision becomes reality
Code:     The work manifests in production

"The Great Work is complete when the stone is fixed."

What coagulates:
- Source code → Running system
- Package → Published artifact
- Feature → User value
- Idea → Reality

The Philosopher's Stone:
- A working system in production
- Serving users
- Creating value
- The gold of software alchemy
```

---

## Quick Reference

```
/coagulate @target:vercel @env:prod      # Deploy to Vercel prod
/coagulate @target:netlify .             # Deploy to Netlify
/coagulate @target:docker api/           # Build and push Docker
/coagulate @target:npm                   # Publish to npm
/coagulate @target:github "v1.0.0"       # Create GitHub release
```

---

## The Complete Opus

```
The Alchemist's Laboratory - Complete Cycle:

CALCINATION  → Analyze, break down complexity
DISSOLUTION  → Research, explore, understand
SEPARATION   → Review, filter, discriminate
CONJUNCTION  → Fuse, combine, integrate (/fusion)
FERMENTATION → Test, fail, fix, iterate
DISTILLATION → Capture patterns, create tinctures
COAGULATION  → Deploy, ship, manifest

Prima Materia (Idea) → Philosopher's Stone (Production)
```

---

*"The Work is complete. What was ethereal is now solid. Ship it."*

**— The Manifestation of Value**
