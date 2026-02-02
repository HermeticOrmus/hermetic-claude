# Workshop Quick Reference

---

## Before Any Transmutation

```
1. INTENTION   → What gold am I creating?
2. INGREDIENTS → What am I combining?
3. CONSTRAINTS → Data size? Traffic? Memory? Latency?
4. HYPOTHESIS  → What do I expect?
5. RISKS       → What trade-offs am I accepting?
```

---

## The Golden Rules

| Rule | Violation Cost |
|------|----------------|
| Specify constraints | 10x over-engineering |
| Measure before optimizing | Wasted complexity |
| Use proven libraries | 10x maintenance |
| Document trade-offs | Decision amnesia |
| Record failures | Repeat mistakes |

---

## Constraint Template

```
CONSTRAINTS:
- Data: [X] items (max [Y])
- Traffic: [X] req/sec
- Memory: [X] MB
- Latency: p99 < [X] ms
- Prefer: libraries over custom
```

---

## Meta-Prompt Selection

| Situation | Use |
|-----------|-----|
| Unknown task | Autonomous Routing |
| Novel problem | Principle-Centered |
| Cross-domain | Domain-Bridge |
| High stakes | Quality-Focused |
| Need breakthrough | Emergent Properties |
| Need speed | Cost-Balanced |

---

## Workflow

```
experiments/     → Active work
    ↓ success
recipes/         → Proven patterns
    ↓ failure
observations/    → Boundaries learned
```

---

## File Locations

| What | Where |
|------|-------|
| Start experiment | `experiments/EXPERIMENT_LOG.md` |
| Record failure | `observations/BOUNDARIES.md` |
| Log trade-off | `observations/TRADE_OFFS.md` |
| Save recipe | `recipes/` |
| Find ingredient | `ingredients/` |
| Meta-prompts | `~/.hermetic/prompts/META_PROMPTS.md` |

---

## Workshop Commands

```
/workshop         → View workshop status
/experiment       → Start new experiment
/boundary         → Log discovered boundary
/recipe           → Save proven recipe
/tradeoff         → Log trade-off decision
```

---

## Integrated Tools

| Tool | When to Use |
|------|-------------|
| **Categorical Meta-Prompting** | Guaranteed-quality outputs with 0-1 scoring |
| **LibreUIUX** | Modern UI/UX (68 plugins, 153 agents, 80 commands) |
| **Meta-Prompts** | Task routing and quality optimization |

### Quick Access

```
Categorical: github.com/HermeticOrmus/categorical-meta-prompting-oe
LibreUIUX:   ~/projects/01-ACTIVE/LibreUIUX-Claude-Code/
Meta-Prompts: ~/.hermetic/prompts/META_PROMPTS.md
```

### LibreUIUX Commands

```
/ui-modern      → Modern components
/ui-critique    → Design feedback
/ui-responsive  → Responsive check
```

---

*"Context is currency. Constraints are gold."*
