# /experiment - Start or Update an Experiment

## Invocation

```
/experiment [name]
```

## Procedure

### 1. Generate Experiment ID
Format: `EXP-YYYYMMDD-###` (e.g., EXP-20251228-001)

### 2. Gather Information

Ask the user (or infer from context):

**Intention**: What are you transmuting? (raw idea → what gold?)

**Ingredients**:
- Model(s) being used
- Context strategy (RAG, LSP, few-shot, etc.)
- Prompting technique
- Tools/APIs involved

**Hypothesis**: What do you expect to emerge?

**Constraints** (critical - prevents over-engineering):
- Data size: X items (max Y)
- Traffic: X requests/second
- Memory: X MB available
- Latency: p99 < X ms

**Risk Acceptance**:
| Trade-off | Choice | Rationale |
|-----------|--------|-----------|
| Speed vs Quality | | |
| Cost vs Precision | | |
| Simplicity vs Flexibility | | |

### 3. Write to Experiment Log

Append to: `~/.hermetic/workshop/experiments/EXPERIMENT_LOG.md`

```markdown
## [EXP-YYYYMMDD-###] {Experiment Name}

**Date**: {today}
**Status**: [ ] In Progress

### Intention
{intention}

### Ingredients
- Model: {model}
- Context: {context_strategy}
- Technique: {prompting_technique}
- Tools: {tools}

### Constraints
- Data: {data_size}
- Traffic: {traffic}
- Memory: {memory}
- Latency: {latency}

### Hypothesis
{hypothesis}

### Risk Acceptance
| Trade-off | Choice | Rationale |
|-----------|--------|-----------|
| Speed vs Quality | {choice} | {rationale} |
| Cost vs Precision | {choice} | {rationale} |
| Simplicity vs Flexibility | {choice} | {rationale} |

### Observations
{to be filled during/after experiment}

### Outcome
[ ] Recipe proven → move to recipes/
[ ] Boundary found → document in BOUNDARIES.md
[ ] Needs iteration → update hypothesis
```

### 4. Confirm

Tell the user:
- Experiment ID created
- Log location
- Remind them to update observations as they work
- Remind them to mark outcome when complete

## When Experiment Completes

If successful → use `/recipe` to save the pattern
If failed/partial → use `/boundary` to log the lesson
