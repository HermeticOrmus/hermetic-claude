---
name: workshop
description: Alchemist's Workshop - Manage experiments, boundaries, recipes, and trade-offs
version: 1.0.0
author: Hermetic Ormus
commands:
  - name: experiment
    description: Start or update an experiment in the workshop
  - name: boundary
    description: Log a discovered boundary (failed experiment → lesson)
  - name: recipe
    description: Save a proven recipe (successful pattern)
  - name: tradeoff
    description: Log a conscious trade-off decision
  - name: workshop
    description: Show workshop status and quick reference
---

# Alchemist's Workshop Skill

Manage the transmutation laboratory at `~/.hermetic/workshop/`

## Commands

### /workshop
Show current workshop status: active experiments, recent boundaries, proven recipes.

### /experiment [name]
Start a new experiment or update an existing one.
- Creates entry in `experiments/EXPERIMENT_LOG.md`
- Prompts for: Intention, Ingredients, Hypothesis, Risk Acceptance

### /boundary [name]
Log a discovered boundary from a failed or partial experiment.
- Adds entry to `observations/BOUNDARIES.md`
- Prompts for: What broke, Boundary revealed, Lesson learned

### /recipe [name]
Save a proven pattern that works reliably.
- Creates file in `recipes/`
- Prompts for: Purpose, Ingredients, Procedure, Limitations

### /tradeoff [decision]
Log a conscious trade-off decision.
- Adds entry to `observations/TRADE_OFFS.md`
- Prompts for: Options considered, Decision made, Accepted costs

## The Protocol

Before any AI-assisted work:
1. **Intention** - What am I transmuting?
2. **Constraints** - Data size? Traffic? Memory? Latency?
3. **Hypothesis** - What do I expect?
4. **Risks** - What trade-offs am I accepting?

## Golden Rules

- Specify constraints (prevents 10x over-engineering)
- Measure before optimizing (prevents wasted complexity)
- Use proven libraries (prevents 10x maintenance cost)
- Document trade-offs (prevents decision amnesia)
- Record failures (prevents repeated mistakes)

## Workshop Locations

- Experiments: `~/.hermetic/workshop/experiments/`
- Ingredients: `~/.hermetic/workshop/ingredients/`
- Observations: `~/.hermetic/workshop/observations/`
- Recipes: `~/.hermetic/workshop/recipes/`
- Quick Reference: `~/.hermetic/workshop/QUICK_REFERENCE.md`
