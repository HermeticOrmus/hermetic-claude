# LibreUIUX Commands Guide

> How to use the 5 LibreUIUX commands installed in `~/.claude/commands/`

**Source**: `~/projects/01-ACTIVE/LibreUIUX-Claude-Code/`

---

## Quick Reference

| Command | Purpose | When to Use |
|---------|---------|-------------|
| `/ui-critique` | Get design feedback | After building a component |
| `/ui-modern` | Generate modern components | Starting new UI work |
| `/ui-responsive` | Check responsive design | Before shipping |
| `/ui-synth` | Full synthesis orchestration | Major UI features |
| `/ui-review` | 7-dimensional analysis | Audit existing UI |

---

## /ui-critique

**Get comprehensive design feedback and improvement suggestions.**

### Usage
```
/ui-critique
```

Run while viewing a component file. Analyzes across 8 dimensions:
1. Design System Compliance
2. Visual Hierarchy
3. Spacing & Rhythm
4. Color & Contrast
5. Typography
6. Responsive Design
7. Interactions & States
8. Accessibility

### Output Format
- Scorecard (X/10 per dimension)
- Prioritized fixes (High/Medium/Low)
- Before/after code examples
- Best practices references

### When to Use
- After completing a component
- Before code review
- When something "feels off"
- To learn modern patterns

---

## /ui-modern

**Generate modern, production-ready UI components.**

### Usage
```
/ui-modern [component-type] [variant]
```

### Examples
```
/ui-modern button
/ui-modern card pricing
/ui-modern form contact
/ui-modern nav sidebar
/ui-modern hero
/ui-modern dashboard
```

### Features Generated
- Modern design patterns (2024-2025)
- Hover/focus/active states
- Responsive breakpoints
- WCAG accessibility
- Tailwind classes

### Variants
- `pricing` - Pricing card with plan, features, CTA
- `contact` - Contact form with validation
- `sidebar` - Sidebar navigation
- `hero` - Hero section with headline, CTAs
- `dashboard` - Stats card

---

## /ui-responsive

**Check and fix responsive design issues across all breakpoints.**

### Usage
```
/ui-responsive
```

### Checks At
```
Mobile:        320px - 639px
Tablet:        640px - 1023px
Laptop:        1024px - 1279px
Desktop:       1280px - 1535px
Large Desktop: 1536px+
```

### What It Checks
- Layout responsiveness (fixed widths, overflow)
- Typography scaling
- Spacing/padding at each breakpoint
- Touch targets (44x44px minimum)
- Images and media
- Navigation patterns

### When to Use
- Before shipping any UI
- When users report mobile issues
- After major layout changes

---

## /ui-synth

**Master orchestration - synthesizes ALL LibreUIUX plugins into complete solutions.**

### Usage
```
/ui-synth [Archetype]+[Card] [component] for [project type]
```

### Examples
```
/ui-synth Hero+Sun pricing page for fitness SaaS
/ui-synth Magician+Moon modal for meditation app
/ui-synth Sage+Hermit blog layout for knowledge platform
/ui-synth complete authentication flow for Hero+Sun fitness app
```

### What It Orchestrates
1. **Archetypal Alchemy** - Psychological meaning
2. **Design Mastery** - Timeless principles (Bass, Vignelli, Rams)
3. **Accessibility** - WCAG compliance
4. **Security** - XSS prevention, input validation
5. **Performance** - Core Web Vitals
6. **Testing** - Unit + accessibility tests
7. **Documentation** - APIs, usage examples

### Output Includes
- Complete component code
- Design tokens
- Test suite
- Documentation
- Deployment checklist

### When to Use
- Major UI features
- Production components
- When meaning + quality matter

---

## /ui-review

**7-dimensional analysis of existing UI/UX.**

### Usage
```
/ui-review                    # Full project review
/ui-review [path]             # Specific component
/ui-review --focus [dimension]  # Deep dive
/ui-review --quick            # Fast overview
```

### Focus Options
```
--focus accessibility
--focus performance
--focus security
--focus archetypal
--focus design
```

### The 7 Dimensions
1. **Archetypal Coherence** - Psychological story
2. **Design Mastery** - Timeless principles
3. **Accessibility** - WCAG, keyboard, screen readers
4. **Security** - XSS, CSRF, input handling
5. **Performance** - Core Web Vitals, bundle size
6. **Code Quality** - Architecture, types, tests
7. **User Experience** - CTAs, navigation, mobile

### Scoring
```
10 - Exemplary (reference quality)
9  - Excellent (production-ready)
8  - Good (few improvements)
7  - Adequate (notable improvements needed)
6  - Acceptable (needs attention)
5  - Mediocre (significant gaps)
4  - Poor (needs redesign)
3  - Bad (fundamental problems)
2  - Broken (rebuild needed)
1  - Failed (start over)
```

### Verdict
- **ELEVATE** (8-10): Polish and enhance
- **REFINE** (5-7): Address systematically
- **REBUILD** (1-4): Fundamental redesign

---

## Workshop Integration

| Workshop Tool | LibreUIUX Integration |
|---------------|----------------------|
| `/experiment` | Test new UI patterns |
| `/boundary` | Log when Claude reverts to Bootstrap-era |
| `/recipe` | Save working prompt + component combinations |
| `/tradeoff` | Document design system vs flexibility |

---

## Golden Rules

### Do
- Be specific (Tailwind classes, exact values)
- Reference examples ("Like the pricing card on shadcn.com")
- Use design systems (define colors, spacing upfront)
- Iterate with browser inspector
- Think mobile-first

### Don't
- "Make it look modern" (no shared definition)
- "Improve the design" (which dimension?)
- "Make it sleek" (subjective)
- Start without design system
- Accept first output without iteration

---

## Precision Beats Aesthetics

| Vague | Precise |
|-------|---------|
| "Make it modern" | `bg-blue-600, hover:bg-blue-700, px-6 py-3, rounded-lg, shadow-md` |
| "Improve design" | "Change shadow-md to shadow-lg and p-4 to p-6" |
| "Make it sleek" | "glassmorphism card with backdrop-blur-md, subtle border, 12px padding" |

---

*"The craft grows when knowledge flows."*
