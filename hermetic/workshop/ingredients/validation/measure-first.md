# Measure-First Pattern

> "LLM already assumed that this is problematic part
> without the proper metrics to prove it."
> — Vibe Coding CH_07

---

## The Anti-Pattern

Optimizing without measuring:
1. Assume what's slow
2. Build complex optimization
3. Discover assumption was wrong
4. Wasted effort, added complexity

---

## The Pattern

### Step 1: Instrument
Add minimal tracing to suspected hot paths:

```java
Timer loadFile = metricRegistry.timer("loadFile");
Timer scan = metricRegistry.timer("scan");

Scanner scanner = loadFile.time(() -> new Scanner(file));
return scan.time(() -> {
    while (scanner.hasNextLine()) {
        // ... actual work
    }
});
```

**Key**: Measure separately what you suspect (load vs scan, not combined)

### Step 2: Run Realistic Load
Use actual traffic patterns, not synthetic:

```scala
setUp(
  scenario.inject(
    constantUsersPerSec(20) during (1.minute)  // Match production
  )
)
```

### Step 3: Analyze Results
```json
{
  "loadFile": { "p99": 0.000730684 },
  "scan": { "p99": 4.860273076 }
}
```

**Now you know**: scan is 6,600x slower than load. Optimize scan.

### Step 4: Optimize Hot Path Only
- Don't optimize cold paths
- Don't add complexity to fast code
- Target the measured bottleneck

---

## Tool Recommendations

| Purpose | Tool | Why |
|---------|------|-----|
| Micro-benchmarks | JMH | Handles JIT warmup, GC properly |
| Load testing | Gatling | Realistic traffic patterns |
| Metrics | Micrometer/Dropwizard | Proven, low overhead |
| Tracing | OpenTelemetry | Industry standard |

**Avoid**: Custom timing code (800 lines vs 80 lines problem)

---

## Quick Checklist

Before optimizing:
- [ ] Instrumented the suspected area?
- [ ] Run under realistic load?
- [ ] Know which specific part is slow?
- [ ] Measured, not assumed?

After optimizing:
- [ ] Re-measured with same load?
- [ ] Improvement confirmed with numbers?
- [ ] Tracing kept for future regression detection?
