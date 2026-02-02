# The Alchemist's Workshop

> "Each of us, as software engineers, has become something of an alchemist
> searching for the philosopher's stone - the perfectly functioning,
> intelligent application."
> — Vibe Coding: Mistakes and Tradeoffs

---

## Philosophy

This workshop embodies the **AIchemy** paradigm: mixing LLM APIs, vector databases,
prompting techniques, and esoteric context strategies with intuition, feel, and
that elusive "vibe" - hoping to transmute raw ideas into digital gold.

**The chaos isn't failure - it's necessary exploration.**

Like alchemy to chemistry, our experiments (especially the failed ones) reveal
boundaries and surface the decisions we must make:
- Which risks to accept
- Which costs to pay
- What to simplify
- What to keep flexible

---

## Workshop Structure

```
workshop/
├── experiments/      # Active transmutations in progress
├── ingredients/      # Prompts, contexts, techniques, patterns
├── observations/     # What emerged - boundaries revealed
└── recipes/          # Proven compounds - validated combinations
```

---

## The Alchemist's Protocol

Before each transmutation:

### 1. Intention (Mentalism)
What am I transmuting? Raw idea → what gold?

### 2. Ingredients
What am I combining?
- Model(s):
- Context strategy:
- Prompting technique:
- External tools:

### 3. Hypothesis
What do I expect to emerge?

### 4. Risk Acceptance
What trade-offs am I consciously making?
- Speed vs Quality:
- Cost vs Precision:
- Simplicity vs Flexibility:

### 5. Observation
What actually happened? (Especially failures - they reveal boundaries)

---

## Key Principles

### From the Gold Hat Manifesto
- Build technology that serves the sacred in humanity
- Code with consciousness and intention
- Create tools that heal, never harm

### From Vibe Coding
- Context is Currency (high-signal prompts matter)
- Measure before optimizing (JMH-style validation)
- Prefer proven libraries over custom alchemy
- Mistakes ripple - document trade-offs consciously
- 10x maintenance cost for custom implementations

### The Hermetic Laws Applied
| Principle | Workshop Application |
|-----------|---------------------|
| Mentalism | Clarify intention before prompting |
| Correspondence | Workspace reflects consciousness |
| Vibration | Ship imperfect; iterate rapidly |
| Polarity | Balance exploration/standardization |
| Rhythm | Learning cycles, not failures |
| Cause & Effect | Every recipe: empower or extract? |
| Gender | Balance analysis + intuition |

---

## Quick Reference

**Starting an experiment**: Create file in `experiments/`
**Recipe works**: Move to `recipes/`, document in observations
**Recipe fails**: Document boundary in `observations/BOUNDARIES.md`
**New technique discovered**: Add to `ingredients/`

---

## Workshop Commands

| Command | Purpose |
|---------|---------|
| `/workshop` | Show workshop status |
| `/experiment [name]` | Start new experiment |
| `/boundary [name]` | Log discovered boundary |
| `/recipe [name]` | Save proven recipe |
| `/tradeoff [name]` | Log trade-off decision |

---

## Integrated Tools

### Categorical Meta-Prompting

**Source**: https://github.com/HermeticOrmus/categorical-meta-prompting-oe

Transform prompt engineering from alchemy to systematic engineering:

| Feature | Purpose |
|---------|---------|
| Quality Scoring | 0-1 measurable ratings |
| Recursive Improvement | Auto-refine until threshold met |
| Composable Pipelines | Chain operations functorially |

See: `ingredients/prompting/categorical-meta-prompting.md`

### LibreUIUX

**Location**: `~/projects/01-ACTIVE/LibreUIUX-Claude-Code/`

Modern UI/UX development infrastructure:

| Component | Count |
|-----------|-------|
| Plugins | 68 |
| Agents | 153 |
| Commands | 80 |
| Skills | 68 |

Key commands: `/ui-modern`, `/ui-critique`, `/ui-responsive`

See: `ingredients/integration/libreuiux.md`

### Meta-Prompts

Six production-ready meta-prompts at `~/.hermetic/prompts/META_PROMPTS.md`:

| Meta-Prompt | Best For |
|-------------|----------|
| Autonomous Routing | Default choice |
| Principle-Centered | Novel problems |
| Domain-Bridge | Cross-domain tasks |
| Quality-Focused | High-stakes |
| Emergent Properties | Creative synthesis |
| Cost-Balanced | Speed critical |

---

## File Locations

| Purpose | Location |
|---------|----------|
| Workshop skills | `~/.claude/skills/workshop/` |
| Meta-prompts | `~/.hermetic/prompts/META_PROMPTS.md` |
| Categorical meta-prompting | `github.com/HermeticOrmus/categorical-meta-prompting-oe` |
| LibreUIUX | `~/projects/01-ACTIVE/LibreUIUX-Claude-Code/` |

---

*"As above, so below. As the prompt, so the output."*
