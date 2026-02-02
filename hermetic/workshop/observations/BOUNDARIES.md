# Boundaries Revealed

> "Like alchemy to chemistry, today's global experiments
> (especially the mistaken, failed ones) reveal boundaries."
> — Vibe Coding: Mistakes and Tradeoffs

This is not a shame file. It's a **boundary map**.

Failed experiments are the most valuable - they show where the edges are.

---

## Template

```markdown
## [BND-###] Boundary Name

**Discovered**: YYYY-MM-DD
**Experiment**: EXP-### (link to experiment)

### What I Tried
Brief description of the approach.

### What Broke
What failed, errored, or produced unexpected results.

### Boundary Revealed
The underlying constraint or limitation discovered.

### Now I Know
The lesson extracted. How this changes future experiments.

### Category
[ ] Model limitation
[ ] Context window constraint
[ ] Cost/performance trade-off
[ ] Architectural constraint
[ ] Integration limitation
[ ] Human/workflow constraint
```

---

## Discovered Boundaries

<!-- Add boundaries below as discovered -->

### From Vibe Coding Book (Pre-loaded)

#### [BND-001] LLM Over-Engineering Without Constraints
**Source**: CH_07 Performance Engineering
**Boundary**: LLMs assume large data sizes without asking (100K vs 10K accounts)
**Now I Know**: Always specify traffic expectations and data size constraints before requesting optimization

#### [BND-002] Parallel Solutions Slower Than Sequential
**Source**: CH_07 AccountFinder
**Boundary**: Parallel stream overhead exceeds benefits for datasets < 10K items
**Now I Know**: Measure before parallelizing. Simple often wins.

#### [BND-003] Custom Code 10x Maintenance Cost
**Source**: CH_07 Tracing Implementation
**Boundary**: LLM generated 800 lines vs 80 lines for equivalent tracing
**Now I Know**: Always prefer proven libraries (Micrometer, Dropwizard) over custom implementations

#### [BND-004] Eager Caching Memory Risk
**Source**: CH_07 Cache Implementation
**Boundary**: LLM chose eager caching without asking about word distribution
**Now I Know**: Ask about data distribution before choosing caching strategy

#### [BND-005] Assumptions Ripple Through Code
**Source**: CH_07 entire chapter
**Boundary**: One wrong assumption compounds into more wrong decisions
**Now I Know**: Validate assumptions explicitly before building on them

