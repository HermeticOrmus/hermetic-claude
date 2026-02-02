# Constraint Specification Protocol

> "LLM can help us with improving the performance, but it requires
> the input data about the expected traffic and data size.
> Without it, it can make wrong assumptions and propose
> over-engineered solutions that are not needed in practice."
> — Vibe Coding CH_07

---

## The Problem

LLMs over-engineer without explicit bounds:
- Assume 100K items when you have 10K
- Add parallelization when sequential is faster
- Build custom solutions when libraries exist
- Choose eager caching when lazy is appropriate

**Each wrong assumption ripples into more wrong code.**

---

## The Protocol

Before requesting optimization or implementation, specify:

### 1. Data Constraints
```
Data size: [exact numbers]
- Current: X records
- Expected growth: Y records over Z time
- Maximum reasonable: N records
```

### 2. Traffic Patterns
```
Traffic expectations:
- Requests per second: X
- Peak load: Y rps
- Burst patterns: [describe]
```

### 3. Resource Constraints
```
Resource limits:
- Memory budget: X MB/GB
- CPU cores available: N
- Latency requirement: X ms (p50/p95/p99)
```

### 4. Simplicity Preference
```
Complexity budget:
- Prefer simple over clever: YES
- Max acceptable code lines: ~N
- Must use existing libraries: [list]
- Custom code only if: [conditions]
```

---

## Template Prompt Addition

Add this block to optimization/implementation requests:

```
CONSTRAINTS:
- Data size: [X] items (max [Y])
- Traffic: [X] requests/second
- Memory: [X] MB available
- Latency: p99 < [X] ms
- Prefer: proven libraries over custom code
- Simplicity: fewer lines > clever optimization
```

---

## Example: Before & After

### Without Constraints (Bad)
> "Improve the performance of AccountFinder"

Result: 800 lines of custom parallel code, slower than original

### With Constraints (Good)
> "Improve the performance of AccountFinder.
> CONSTRAINTS:
> - Data size: 10,000 accounts (max 15,000)
> - Traffic: 20 requests/second
> - Prefer: HashMap lookup over parallel streams
> - Simplicity: keep under 50 lines"

Result: 5-line HashMap solution, 100x faster

---

## Boundary Reference

See `BOUNDARIES.md`:
- BND-001: LLM Over-Engineering Without Constraints
- BND-002: Parallel Solutions Slower Than Sequential
- BND-003: Custom Code 10x Maintenance Cost
