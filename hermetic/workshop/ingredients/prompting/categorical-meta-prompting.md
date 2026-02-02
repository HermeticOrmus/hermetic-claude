# Categorical Meta-Prompting

> Transform prompt engineering from alchemy to systematic engineering with measurable quality guarantees.

**Source**: https://github.com/HermeticOrmus/categorical-meta-prompting-oe

## The Problem It Solves

Traditional prompting is "alchemy" - trial-and-error with no reproducibility or quality assurance. Categorical meta-prompting brings the rigor of software engineering to AI development.

## Core Concepts

### Quality Scoring (0-1)

Every output receives a measurable quality rating:

| Score | Meaning |
|-------|---------|
| 0.9+ | Production-ready |
| 0.8-0.9 | Good |
| 0.7-0.8 | Acceptable |
| <0.7 | Needs iteration |

### Recursive Improvement

The system automatically refines outputs through iterative cycles until meeting specified quality thresholds. You set the bar, the framework reaches it.

### Composable Pipelines

Operations chain sequentially - each step's output becomes the next step's input:

```
Task → Analyze → Generate → Evaluate → Refine → Result
                              ↑___________↓
                           (loop until quality met)
```

### Mathematical Foundations

- **Functors**: Predictable transformations between categories
- **Monads**: Clean composition chains with context preservation
- **Natural transformations**: Change interpretation while preserving structure

## Execution Pipeline

1. **Analyze** task complexity
2. **Generate** initial solutions
3. **Evaluate** quality (0-1 score)
4. **Refine** iteratively if below threshold
5. **Return** guaranteed-quality results

## Proven Results

- **Game of 24**: 100% accuracy (vs GPT-4's 36% with chain-of-thought)
- **Code generation**: Complete, tested implementations in single executions

## Integration with Workshop

| Workshop Tool | Integration |
|---------------|-------------|
| `/experiment` | Test quality thresholds for different task types |
| `/boundary` | Log when recursive improvement plateaus |
| `/recipe` | Save proven quality threshold configurations |
| `/tradeoff` | Document quality vs speed trade-offs |

## When to Use

- Tasks requiring guaranteed quality levels
- Multi-step reasoning with measurable outcomes
- Production pipelines needing reproducibility
- Any prompt that "sometimes works, sometimes doesn't"

## When NOT to Use

- Simple one-shot queries
- Exploratory/creative tasks without quality metrics
- Time-critical responses (recursive improvement adds latency)

## Quick Start

```
1. Define task
2. Set quality threshold (e.g., 0.85)
3. Execute pipeline
4. System iterates until threshold met or max iterations
5. Receive quality-guaranteed output
```

## Connection to Meta-Prompts

The six meta-prompts at `~/.hermetic/prompts/META_PROMPTS.md` can be enhanced with quality scoring:

| Meta-Prompt | Recommended Threshold |
|-------------|----------------------|
| Quality-Focused | 0.9+ |
| Principle-Centered | 0.85+ |
| Domain-Bridge | 0.8+ |
| Autonomous Routing | 0.8+ |
| Emergent Properties | 0.75+ |
| Cost-Balanced | 0.7+ |
