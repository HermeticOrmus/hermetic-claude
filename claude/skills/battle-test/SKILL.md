# Battle Test

**Purpose:** Comprehensive browser-based testing of web applications using Claude in Chrome extension. Systematically explores UI, tests functionality, identifies bugs, and validates user flows.

**Usage:** `/battle-test` or `/battle-test <url>`

---

## Prerequisites

- Claude in Chrome extension installed and connected
- Target application running (dev server or production URL)

---

## Battle Test Protocol

### Phase 1: Reconnaissance

1. **Get browser context**: `tabs_context_mcp` with `createIfEmpty: true`
2. **Create fresh tab**: `tabs_create_mcp` for clean testing environment
3. **Navigate to target**: Open the application URL
4. **Take initial screenshot**: Capture landing state
5. **Read page structure**: Use `read_page` to understand layout

### Phase 2: Visual Inspection

1. **Screenshot the page** at current viewport
2. **Check responsive design**: Resize to mobile (375x667), tablet (768x1024), desktop (1920x1080)
3. **Verify visual hierarchy**: Headers, CTAs, navigation visible
4. **Check for layout breaks**: Overflow, overlapping elements, cut-off text
5. **Validate loading states**: Spinners, skeletons render correctly

### Phase 3: Navigation Testing

1. **Test all visible links**: Click each navigation item
2. **Verify routing works**: URL changes, content updates
3. **Test back/forward**: Browser history works correctly
4. **Check 404 handling**: Navigate to non-existent route
5. **Test external links**: Open in new tab, don't break app

### Phase 4: Interactive Elements

1. **Buttons**: All buttons clickable and respond
2. **Forms**: Input fields accept text, validation works
3. **Dropdowns/Selects**: Open, select options, close properly
4. **Modals/Dialogs**: Open, close, escape key works
5. **Tooltips/Hovers**: Appear on hover, disappear on leave
6. **Accordions/Tabs**: Expand, collapse, switch correctly

### Phase 5: Authentication Flows

1. **Sign up flow**: Registration works end-to-end
2. **Sign in flow**: Login with valid credentials
3. **Sign out**: Logout clears session
4. **Protected routes**: Redirect when not authenticated
5. **Session persistence**: Refresh maintains auth state

### Phase 6: Core Feature Testing

1. **Primary user journeys**: Test main use cases
2. **CRUD operations**: Create, read, update, delete work
3. **Search/Filter**: Results match queries
4. **Pagination**: Navigate through pages
5. **Error states**: Graceful handling of failures

### Phase 7: Edge Cases & Stress

1. **Empty states**: No data displays correctly
2. **Long content**: Text overflow handled
3. **Special characters**: Unicode, emojis, scripts
4. **Rapid clicking**: No duplicate submissions
5. **Network errors**: Offline handling (if applicable)

### Phase 8: Console & Network

1. **Check console**: `read_console_messages` for errors
2. **Review network**: `read_network_requests` for failed API calls
3. **Identify warnings**: JS warnings, deprecation notices
4. **Performance**: Slow requests, large payloads

---

## Execution Steps

### Step 1: Initialize

```
1. Check if Chrome extension connected via tabs_context_mcp
2. If not connected, inform user to connect and wait
3. Create new tab for testing
4. Navigate to application URL (default: localhost:5000)
```

### Step 2: Systematic Testing

```
For each phase:
1. Announce what you're testing
2. Take screenshots before/after actions
3. Log findings (bugs, issues, observations)
4. Record successes too
```

### Step 3: Report Generation

Create a battle test report with:

```markdown
## Battle Test Report: [App Name]
**Date:** [timestamp]
**URL:** [tested URL]
**Duration:** [time spent]

### Summary
- Total issues found: X
- Critical: X | Major: X | Minor: X | Suggestions: X

### Findings

#### Critical Issues
1. [Issue description with screenshot reference]

#### Major Issues
1. [Issue description]

#### Minor Issues
1. [Issue description]

#### Suggestions
1. [Improvement ideas]

### Passed Tests
- [List of successful tests]

### Screenshots
[Reference to captured screenshots]
```

---

## Browser Tool Reference

| Tool | Use For |
|------|---------|
| `tabs_context_mcp` | Get/create browser context |
| `tabs_create_mcp` | Create new tab |
| `navigate` | Go to URL |
| `computer` (screenshot) | Capture current state |
| `computer` (left_click) | Click elements |
| `computer` (type) | Enter text |
| `computer` (scroll) | Scroll page |
| `read_page` | Get page structure |
| `find` | Locate elements by description |
| `form_input` | Fill form fields |
| `read_console_messages` | Check for JS errors |
| `read_network_requests` | Monitor API calls |
| `resize_window` | Test responsive design |

---

## Issue Severity Levels

| Level | Definition |
|-------|------------|
| **Critical** | App crashes, data loss, security flaw, blocks core functionality |
| **Major** | Feature broken, poor UX that frustrates users |
| **Minor** | Visual glitch, typo, non-blocking inconvenience |
| **Suggestion** | Enhancement idea, not a bug |

---

## Example Invocation

```
User: /battle-test
Claude: [Connects to Chrome, opens app, runs all phases, generates report]

User: /battle-test https://myapp.vercel.app
Claude: [Tests the specified production URL]

User: /battle-test --phase=auth
Claude: [Runs only authentication testing phase]
```

---

## Notes

- Take screenshots frequently - visual evidence is key
- Test as a real user would, not just happy paths
- Check mobile viewports - many bugs hide there
- Always check console for hidden errors
- Be thorough but efficient - cover ground systematically

---

**Last Updated:** 2026-01-09
**Status:** Active
