# /boundary - Log a Discovered Boundary

## Invocation

```
/boundary [name]
```

## Philosophy

> "Like alchemy to chemistry, today's global experiments
> (especially the mistaken, failed ones) reveal boundaries."

This is NOT a shame file. It's a **boundary map**.
Failed experiments are the most valuable - they show where the edges are.

## Procedure

### 1. Generate Boundary ID
Format: `BND-###` (sequential)

### 2. Gather Information

Ask the user (or infer from context):

**Related Experiment**: Link to EXP-### if applicable

**What I Tried**: Brief description of the approach

**What Broke**: What failed, errored, or produced unexpected results

**Boundary Revealed**: The underlying constraint or limitation discovered

**Now I Know**: The lesson extracted. How this changes future experiments.

**Category**:
- [ ] Model limitation
- [ ] Context window constraint
- [ ] Cost/performance trade-off
- [ ] Architectural constraint
- [ ] Integration limitation
- [ ] Human/workflow constraint

### 3. Write to Boundaries

Append to: `~/.hermetic/workshop/observations/BOUNDARIES.md`

```markdown
## [BND-###] {Boundary Name}

**Discovered**: {today}
**Experiment**: {EXP-### or "N/A"}

### What I Tried
{description}

### What Broke
{failure_description}

### Boundary Revealed
{the constraint or limitation}

### Now I Know
{lesson learned - how this changes future work}

### Category
{category}
```

### 4. Update Experiment (if linked)

If this came from an experiment, update that experiment's status:
- Mark as "Boundary Found"
- Link to the boundary ID

### 5. Confirm

Tell the user:
- Boundary ID created
- The lesson is now captured
- This prevents repeating the same mistake
- Reference this boundary in future related experiments
