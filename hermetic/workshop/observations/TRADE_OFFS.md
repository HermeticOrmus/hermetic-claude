# Trade-Off Decisions

> "The chaos isn't failure - it's the necessary exploration that precedes
> a scientific discipline... which risks to accept, which costs to pay,
> what to simplify, and what to keep flexible."
> — Vibe Coding: Mistakes and Tradeoffs

Conscious documentation of decisions made.

---

## Active Trade-Offs

### System-Wide Decisions

| Decision | Trade-Off | Choice | Rationale |
|----------|-----------|--------|-----------|
| Sync method | Cloud vs P2P | Syncthing (P2P) | Privacy, no vendor lock-in |
| Meta-prompts | Speed vs Quality | 7 specialized prompts | Right tool for right task |
| Agent architecture | Monolith vs Specialized | Specialized agents | Clear boundaries, single responsibility |

---

## Trade-Off Template

```markdown
## [TRD-###] Decision Name

**Date**: YYYY-MM-DD
**Context**: What prompted this decision

### The Trade-Off
What opposing forces are in tension?

### Options Considered
1. Option A: [description] - pros/cons
2. Option B: [description] - pros/cons
3. Option C: [description] - pros/cons

### Decision
Which option chosen and why.

### Accepted Costs
What we're consciously giving up.

### Review Trigger
When should this decision be revisited?
```

---

## Logged Trade-Offs

<!-- Add trade-offs below -->

