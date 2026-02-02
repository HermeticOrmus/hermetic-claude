# /tradeoff - Log a Conscious Trade-Off Decision

## Invocation

```
/tradeoff [decision name]
```

## Philosophy

> "Which risks to accept, which costs to pay,
> what to simplify, and what to keep flexible."

Every significant decision involves trade-offs.
Documenting them prevents decision amnesia and enables future review.

## Procedure

### 1. Generate Trade-Off ID
Format: `TRD-###` (sequential)

### 2. Gather Information

Ask the user (or infer from context):

**Context**: What prompted this decision?

**The Trade-Off**: What opposing forces are in tension?

**Options Considered**:
1. Option A: description - pros/cons
2. Option B: description - pros/cons
3. Option C: description - pros/cons (if applicable)

**Decision**: Which option chosen and why

**Accepted Costs**: What we're consciously giving up

**Review Trigger**: When should this decision be revisited?

### 3. Write to Trade-Offs Log

Append to: `~/.hermetic/workshop/observations/TRADE_OFFS.md`

```markdown
## [TRD-###] {Decision Name}

**Date**: {today}
**Context**: {what prompted this}

### The Trade-Off
{opposing forces in tension}

### Options Considered

**Option A**: {description}
- Pro: {benefit}
- Con: {cost}

**Option B**: {description}
- Pro: {benefit}
- Con: {cost}

**Option C**: {description} (if applicable)
- Pro: {benefit}
- Con: {cost}

### Decision
{which option and why}

### Accepted Costs
{what we're giving up}

### Review Trigger
{when to revisit - e.g., "if data exceeds 100K", "if latency > 500ms"}
```

### 4. Confirm

Tell the user:
- Trade-off ID created
- Decision documented
- Review trigger noted
- Future self will thank them for this clarity
