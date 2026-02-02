# Site Battle-Test Command

**"Browser automation meets production enforcement."**

Comprehensive website audit combining live browser testing with Mars-style ruthless evaluation.

## Usage
```
/site-battle-test <url>                    # Full audit of URL
/site-battle-test --current-tab            # Test active browser tab
/site-battle-test <url> --quick            # Quick audit (visual + console only)
/site-battle-test <url> --focus performance # Performance-focused audit
```

## Arguments
$ARGUMENTS

---

## Execution Flow

When this command is invoked:

### Pre-flight Check
1. Verify Claude in Chrome MCP is connected
2. Get browser tab context via `tabs_context_mcp`
3. Create new tab if needed via `tabs_create_mcp`

### Phase 1: Load & Capture
```
1. Navigate to target URL
2. Wait for page to fully load (2-3 seconds)
3. Take initial desktop screenshot
4. Read console messages for immediate errors
5. Read network requests for failures
```

### Phase 2: Responsive Testing
```
For each breakpoint [375px, 768px, 1440px]:
  1. Resize window
  2. Wait for reflow
  3. Take screenshot
  4. Check for horizontal overflow via JavaScript:
     document.documentElement.scrollWidth > document.documentElement.clientWidth
  5. Note any visual issues
```

### Phase 3: Console & Network Audit
```
1. Read console messages with pattern "error|warning|fail"
2. Read network requests
3. Filter for:
   - 4xx/5xx status codes
   - CORS errors
   - Resources > 500KB
   - Requests > 2 seconds
```

### Phase 4: Performance Audit (Core Web Vitals)
```
1. Measure Core Web Vitals via JavaScript:
   - LCP (Largest Contentful Paint) - target < 2.5s
   - FCP (First Contentful Paint) - target < 1.8s
   - CLS (Cumulative Layout Shift) - target < 0.1
   - TTFB (Time to First Byte) - target < 800ms
2. Analyze resource breakdown by type
3. Identify large resources (> 200KB)
4. Check total page weight (target < 3MB)
5. Count DOM nodes (target < 1500)
6. Identify third-party script impact
7. Generate performance grade (A-F)
```

### Phase 5: Accessibility Snapshot
```
1. Read page accessibility tree (depth: 5)
2. Find all images - check for alt text
3. Find all form inputs - check for labels
4. Find all buttons - check for accessible names
5. Run JavaScript accessibility checks:
   - Heading hierarchy (h1 > h2 > h3)
   - Link text (not "click here")
   - Color contrast (via computed styles)
```

### Phase 6: Interactive Testing
```
1. Find all navigation links
2. Find primary CTA buttons
3. Test critical interactions:
   - Click main nav items (verify navigation)
   - Click CTA buttons (verify response)
   - Test any visible forms
4. Document failures with screenshots
```

### Phase 7: Full Page Journey
```
1. Scroll to top
2. Scroll down in increments, taking screenshots
3. Verify:
   - Lazy loading works
   - No layout shifts
   - Footer reaches bottom
   - No infinite scroll issues
```

### Phase 8: Report Generation

Generate comprehensive report with:
- Severity-rated findings
- Screenshots with annotations
- Prioritized fix list
- Production readiness verdict

---

## JavaScript Audit Snippets

Use these with `javascript_tool` during audit:

### Check for Horizontal Overflow
```javascript
document.documentElement.scrollWidth > document.documentElement.clientWidth
```

### Get All Console Errors
```javascript
// Errors are captured via read_console_messages
```

### Check Image Alt Text
```javascript
Array.from(document.images).filter(img => !img.alt).map(img => ({
  src: img.src,
  width: img.width,
  height: img.height
}))
```

### Check Heading Hierarchy
```javascript
Array.from(document.querySelectorAll('h1,h2,h3,h4,h5,h6')).map(h => ({
  level: h.tagName,
  text: h.textContent.slice(0, 50)
}))
```

### Check Form Labels
```javascript
Array.from(document.querySelectorAll('input,select,textarea')).map(input => ({
  type: input.type,
  id: input.id,
  hasLabel: !!document.querySelector(`label[for="${input.id}"]`) || !!input.closest('label'),
  ariaLabel: input.getAttribute('aria-label')
}))
```

### Get Core Web Vitals (Comprehensive)
```javascript
(() => {
  const navEntry = performance.getEntriesByType('navigation')[0];
  const paintEntries = performance.getEntriesByType('paint');
  const fcp = paintEntries.find(e => e.name === 'first-contentful-paint');
  const resources = performance.getEntriesByType('resource');

  // Calculate page weight by type
  const byType = resources.reduce((acc, r) => {
    const type = r.initiatorType || 'other';
    acc[type] = (acc[type] || 0) + (r.transferSize || 0);
    return acc;
  }, {});

  // Find largest resources
  const largest = resources
    .filter(r => r.transferSize > 0)
    .sort((a, b) => b.transferSize - a.transferSize)
    .slice(0, 5)
    .map(r => ({
      name: r.name.split('/').pop().slice(0, 40),
      size: Math.round(r.transferSize / 1024) + 'KB',
      type: r.initiatorType
    }));

  // Third-party resources
  const origin = location.origin;
  const thirdParty = resources
    .filter(r => !r.name.startsWith(origin))
    .reduce((acc, r) => acc + (r.transferSize || 0), 0);

  return {
    ttfb: navEntry ? Math.round(navEntry.responseStart) + 'ms' : 'N/A',
    fcp: fcp ? Math.round(fcp.startTime) + 'ms' : 'N/A',
    domContentLoaded: navEntry ? Math.round(navEntry.domContentLoadedEventEnd) + 'ms' : 'N/A',
    loadComplete: navEntry ? Math.round(navEntry.loadEventEnd) + 'ms' : 'N/A',
    domNodes: document.querySelectorAll('*').length,
    totalPageWeight: Math.round(resources.reduce((a,r) => a + (r.transferSize || 0), 0) / 1024) + 'KB',
    resourcesByType: Object.fromEntries(
      Object.entries(byType).map(([k, v]) => [k, Math.round(v / 1024) + 'KB'])
    ),
    thirdPartyWeight: Math.round(thirdParty / 1024) + 'KB',
    largestResources: largest,
    totalRequests: resources.length
  };
})()
```

### Get LCP Element
```javascript
(() => {
  return new Promise(resolve => {
    new PerformanceObserver((list) => {
      const entries = list.getEntries();
      const last = entries[entries.length - 1];
      resolve({
        lcp: Math.round(last.startTime) + 'ms',
        element: last.element?.tagName || 'Unknown',
        size: last.size,
        url: last.url || 'N/A'
      });
    }).observe({ type: 'largest-contentful-paint', buffered: true });
    setTimeout(() => resolve({ lcp: 'Timeout', element: 'N/A' }), 3000);
  });
})()
```

### Check for Large Resources (> 200KB)
```javascript
performance.getEntriesByType('resource')
  .filter(r => r.transferSize > 200000)
  .sort((a, b) => b.transferSize - a.transferSize)
  .map(r => ({
    name: r.name.split('/').pop(),
    size: Math.round(r.transferSize / 1024) + 'KB',
    duration: Math.round(r.duration) + 'ms',
    type: r.initiatorType,
    status: r.transferSize > 500000 ? 'CRITICAL' : 'WARN'
  }))
```

### Check Render-Blocking Resources
```javascript
Array.from(document.querySelectorAll('link[rel="stylesheet"], script:not([async]):not([defer])'))
  .filter(el => !el.async && !el.defer)
  .map(el => ({
    tag: el.tagName,
    src: (el.href || el.src || '').split('/').pop(),
    blocking: true,
    fix: el.tagName === 'SCRIPT' ? 'Add defer or async' : 'Consider critical CSS'
  }))
```

### Performance Grade Calculator
```javascript
(() => {
  const navEntry = performance.getEntriesByType('navigation')[0];
  const fcp = performance.getEntriesByType('paint')
    .find(e => e.name === 'first-contentful-paint');
  const resources = performance.getEntriesByType('resource');

  let score = 100;
  const issues = [];

  // TTFB check
  if (navEntry?.responseStart > 800) {
    score -= 15;
    issues.push('TTFB > 800ms');
  }

  // FCP check
  if (fcp?.startTime > 1800) {
    score -= 20;
    issues.push('FCP > 1.8s');
  }

  // Page weight check
  const totalWeight = resources.reduce((a,r) => a + (r.transferSize || 0), 0);
  if (totalWeight > 3000000) {
    score -= 20;
    issues.push('Page > 3MB');
  } else if (totalWeight > 1500000) {
    score -= 10;
    issues.push('Page > 1.5MB');
  }

  // DOM nodes check
  const domNodes = document.querySelectorAll('*').length;
  if (domNodes > 1500) {
    score -= 10;
    issues.push('DOM > 1500 nodes');
  }

  // Large resources check
  const largeResources = resources.filter(r => r.transferSize > 500000).length;
  if (largeResources > 0) {
    score -= largeResources * 5;
    issues.push(`${largeResources} resources > 500KB`);
  }

  const grade = score >= 90 ? 'A' : score >= 80 ? 'B' : score >= 70 ? 'C' : score >= 60 ? 'D' : 'F';

  return { grade, score, issues };
})()
```

---

## Severity Definitions

| Severity | Criteria | Examples |
|----------|----------|----------|
| **CRITICAL** | Blocks core functionality | JS errors preventing load, broken checkout |
| **SEVERE** | Major UX degradation | Mobile layout broken, forms don't submit |
| **MODERATE** | Noticeable issues | Slow load, missing images, poor contrast |
| **MINOR** | Polish issues | Console warnings, minor spacing issues |

---

## Verdicts

| Verdict | Criteria |
|---------|----------|
| **SHIP_IT** | No critical/severe issues, minor issues documented |
| **FIX_BEFORE_LAUNCH** | Severe issues exist but fixable in hours |
| **MAJOR_ISSUES** | Critical issues require significant work |
| **DO_NOT_DEPLOY** | Fundamental problems, needs rebuild |

---

## Example Report Output

```markdown
# SITE BATTLE-TEST REPORT
**URL**: https://biogenesispanama.vercel.app
**Date**: 2026-01-12
**Verdict**: FIX_BEFORE_LAUNCH

## Executive Summary
Site loads successfully with good visual presentation on desktop. Found 3 console errors related to missing service worker, 2 accessibility issues (missing alt text on team photos), and footer spacing was off on mobile. No critical issues blocking launch, but the items below should be addressed.

## Visual Issues (2)
### Moderate
- Footer content too close to top edge on mobile (375px)
  - Screenshot: [ss_123]
- Dr. Moreno photo had square background instead of circular
  - Status: FIXED during session

## Console Errors (3)
### Errors
- GET /sw.js 404 (service worker not found)
- [Repeated 5 times during session]

### Warnings
- None

## Network Issues (1)
- /sw.js returns 404 on every page load
  - Impact: Minor (PWA feature not working)
  - Fix: Add service worker or remove registration

## Interactive Failures (0)
All navigation links functional
CTA buttons responsive
Forms not tested (none visible)

## Accessibility Issues (2)
### Moderate
- 3 team member images missing meaningful alt text
- Form inputs in contact section should have visible labels

## Performance Report
**Grade**: B (Score: 82)

### Core Web Vitals
| Metric | Value | Target | Status |
|--------|-------|--------|--------|
| TTFB | 245ms | < 800ms | PASS |
| FCP | 1.2s | < 1.8s | PASS |
| LCP | 2.1s | < 2.5s | PASS |
| DOM Nodes | 847 | < 1500 | PASS |

### Resource Analysis
| Category | Size | Count |
|----------|------|-------|
| Total | 1.8MB | 42 |
| Images | 1.2MB | 18 |
| JavaScript | 412KB | 8 |
| CSS | 89KB | 3 |
| Fonts | 124KB | 4 |

### Performance Issues
- hero-background.png (890KB) - Consider WebP format
- third-party analytics adding 180ms to load

## Priority Fix List
1. **MODERATE**: Add service worker or remove registration - sw.js
2. **MODERATE**: Fix footer top padding - Footer.tsx
3. **MODERATE**: Optimize hero-background.png - /public/images
4. **MINOR**: Add alt text to team images - Team.tsx
```

---

## Related Commands

- `/mars` - Code-level production audit
- `/meta-mars` - Full audit with remediation planning
- `/ui-critique` - Design-focused feedback

---

*v1.1.0 | Updated: 2026-01-13 | Added Core Web Vitals & Performance Audit*
