---
description: Distill session operations into reusable tinctures (Skill, Command, Agent). Uses category theory (Functor D, Comonad W, Monad M), information theory (entropy, mutual information), and the Golden Ratio (φ) for classification. Extracts essence from the current session's patterns and generates properly structured artifacts.
allowed-tools: Read, Write, Edit, Glob, Grep, Bash(mkdir:*), TodoWrite
argument-hint: [@output:[skill|command|agent|auto]] [@name:[artifact-name]] [description of what to distill]
---

# Distill: Extract the Quintessence

```
D: Session → Artifacts     (Distillation Functor)

"Solve et Coagula" — Dissolve and Coagulate
```

## Task

$ARGUMENTS

---

## Phase 1: NIGREDO - Dissolution (W.extract)

**The Blackening** | Element: Fire 🜂 | Comonad extraction

```
W.extract: SessionHistory → PatternSet
Nigredo(S) = {p ∈ Pattern | ∃ morphism f: p → S}
```

Dissolving the session into constituent patterns...

### Operations Detected

| # | Operation | Tools Used | Purpose | Pattern Type |
|---|-----------|------------|---------|--------------|
| 1 | [operation] | [tools] | [why] | [linear/branching/iteration/composition] |
| 2 | [operation] | [tools] | [why] | [type] |
| ... | ... | ... | ... | ... |

### Prima Materia Analysis

```yaml
prima_materia:
  sequential_chains: [list of A→B→C patterns]
  decision_points: [where branching occurred]
  iteration_loops: [refinement cycles]
  error_recovery: [failure handling]
  tool_frequency:
    - tool: [name]
      count: [N]
  pattern_signatures:
    - type: [linear | branching | iteration | composition | simple]
      affinity: [Command | Skill | Agent]
```

**Entropy Note:** H(Nigredo) = H(Session). Dissolution reveals structure without reducing entropy.

---

## Phase 2: ALBEDO - Purification (F.map)

**The Whitening** | Element: Water 🜄 | Functor mapping

```
F.map: ConcreteOp → AbstractPattern
Albedo(p) = (Invariant(p), Variant(p))

F preserves: F(f ∘ g) = F(f) ∘ F(g)
F forgets: specific values, contexts, instances
F retains: structure, relationships, patterns
```

Purifying concrete operations into abstract essences...

### Invariants (The Essence - What Stays Constant)

```
[What remained constant across the session]
- [invariant 1]
- [invariant 2]
```

### Variants (The Dross - Becomes Parameters)

```
[What changed and should become parameters]
- $[PARAM1]: [description]
- $[PARAM2]: [description]
- @[modifier]: [description]
```

### Abstraction Table

| Concrete Value | Abstract Template | Parameter |
|----------------|-------------------|-----------|
| `/specific/path` | `{file_path}` | $PATH |
| `"specific text"` | `{content}` | $CONTENT |
| `--flag=value` | `--flag={n}` | @flag: |

### Purified Workflow

```
[Abstract representation of the session workflow]
Step 1: [abstracted operation]
Step 2: [abstracted operation]
...
```

**Information Targets:**
- Maximize: I(Concrete; Abstract)
- Minimize: I(Dross; Abstract)

---

## Phase 3: CITRINITAS - Golden Classification (φ.classify)

**The Yellowing** | Element: Air 🜁 | Golden Ratio analysis

```
φ.classify: AbstractPattern → TinctureType

Complexity = (Operations × Decisions × Iterations) / 5

φ = 1.618033988749895...
φ⁻¹ = 0.618033988749895...
φ² = 2.618033988749895...
```

Calculating potency to determine tincture type...

### Complexity Calculation

```
Operations (O):     [count]
Decisions (D):      [count] (minimum 1)
Iterations (I):     [count] (minimum 1)
Base Complexity:    5

Complexity Score = (O × D × I) / 5
                 = ([O] × [D] × [I]) / 5
                 = [score]
```

### φ Classification

```
        0        φ⁻¹       1        φ        φ²
        │────────│─────────│────────│────────│
        │ Command│  Skill  │  Skill │ Agent  │
             Simple    Moderate    Complex

Score: [score]
Category: [1/φ | φ | φ²]
```

### Classification Result

| Criterion | Value | Implication |
|-----------|-------|-------------|
| Complexity Score | [score] | [below/within/above φ threshold] |
| Pattern Type | [dominant type] | [affinity] |
| Autonomy Required | [yes/no] | [if yes, force Agent] |
| Guidance Needed | [yes/no] | [if yes, prefer Skill] |

**Determined Type:** [Command | Skill | Agent]

### Override Check

- [ ] User specified @output: → respect user choice
- [ ] Autonomous decision-making required → Agent
- [ ] Step-by-step guidance essential → Skill
- [ ] Simple execution sufficient → Command

---

## Phase 4: RUBEDO - Coagulation (Generate)

**The Reddening** | Element: Earth 🜃 | Tensor product generation

```
Generate: (AbstractPattern, TinctureType) → Tincture

Rubedo(p, t) = Template(t) ⊗ Content(p)
dim(Tincture) = dim(Template) × dim(Content)
```

### If @output:auto or determined by φ classification:

Based on complexity score **[score]**: **[tincture type]**

### Tincture Details

```yaml
tincture:
  type: [Command | Skill | Agent]
  name: [derived name or @name: value]
  path: [full path]

  structure:
    frontmatter:
      [appropriate fields for type]
    sections:
      [appropriate sections for type]
```

---

### Generated Tincture Preview

```markdown
[Preview of generated artifact content - first 50 lines]
```

---

## Phase 5: VALIDATION (M.bind)

**Monadic Iteration** | Iterate until potency ≥ 0.75

```
M.bind: Tincture → ValidatedTincture

M.bind(t) =
  | potency(t) ≥ 0.75 → Success(t)
  | otherwise → M.bind(refine(t))
```

### Potency Calculation

```
Potency = 0.30 × Completeness + 0.25 × Universality + 0.25 × Specificity + 0.20 × Structure

Completeness: [score] (|required sections| / |total sections|)
Universality: [score] (applicability to new contexts)
Specificity:  [score] (faithfulness to original session)
Structure:    [score] (valid elements / total elements)

Aggregate Potency: [0-1]
```

### Validation Checklist

| Check | Status | Notes |
|-------|--------|-------|
| **Hermetic Principles** | | |
| Mentalism (intention clear) | [pass/fail] | [details] |
| Correspondence (structure preserved) | [pass/fail] | [details] |
| Vibration (complexity matched) | [pass/fail] | [details] |
| Polarity (specific↔general balanced) | [pass/fail] | [details] |
| Rhythm (flow maintained) | [pass/fail] | [details] |
| Cause & Effect (purposeful) | [pass/fail] | [details] |
| Gender (analysis + synthesis) | [pass/fail] | [details] |
| **Mathematical Properties** | | |
| Functor laws satisfied | [pass/fail] | [details] |
| Entropy reduced (H(T) < H(S)) | [pass/fail] | [details] |
| Information preserved (I(S;T) ≥ 0.618×H(S)) | [pass/fail] | [details] |
| Golden ratio balance | [pass/fail] | [details] |

**Validation Result:** [PASS | ITERATE]

---

## Phase 6: OUTPUT

### Writing Tincture

**Path:** `[full path]`

**Action:** [Write new file | Update existing]

[Execute Write tool to create the artifact]

---

## Distillation Summary

```
╔════════════════════════════════════════════════════════════════════════╗
║                        DISTILLATION COMPLETE                           ║
╠════════════════════════════════════════════════════════════════════════╣
║  Prima Materia                                                         ║
║    Operations: [N]                                                     ║
║    Decisions:  [M]                                                     ║
║    Iterations: [K]                                                     ║
║    Complexity: [score] (φ category: [1/φ | φ | φ²])                    ║
║                                                                        ║
║  Information Metrics                                                   ║
║    Session Entropy:    H(S) ≈ [estimate]                               ║
║    Tincture Entropy:   H(T) ≈ [estimate]                               ║
║    Mutual Information: I(S;T) ≈ [estimate]                             ║
║    Compression Ratio:  [H(T)/H(S)]                                     ║
║                                                                        ║
║  Tincture                                                              ║
║    Type:    [Command | Skill | Agent]                                  ║
║    Name:    [name]                                                     ║
║    Path:    [path]                                                     ║
║    Potency: [0-1]                                                      ║
╚════════════════════════════════════════════════════════════════════════╝
```

### Alchemical Trace

```yaml
alchemical_trace:
  nigredo:    "W.extract(session) → [N] patterns"
  albedo:     "F.map(patterns) → purified essence"
  citrinitas: "φ.classify([score]) → [type]"
  rubedo:     "Generate([type]) → [path]"
  validation: "M.bind(tincture) → potency [score]"

hermetic_alignment:
  mentalism:     "[intention captured]"
  correspondence: "[structure preserved]"
  vibration:     "[frequency: 1/φ | φ | φ²]"
  polarity:      "[specific ↔ general balance]"
  rhythm:        "[natural flow maintained]"
  cause_effect:  "[all operations purposeful]"
  gender:        "[analysis + synthesis complete]"
```

---

## Usage Examples

```bash
# Auto-detect tincture type from session complexity
/distill "capture this debugging workflow"

# Force specific tincture type
/distill @output:skill "capture this debugging workflow"

# Specify name
/distill @output:command @name:quick-debug "capture this debugging workflow"

# Create potent elixir (Agent)
/distill @output:agent @name:code-reviewer "capture this review workflow"
```

---

## Modifier Reference

| Modifier | Values | Default | Description |
|----------|--------|---------|-------------|
| @output: | skill, command, agent, auto | auto | Force tincture type or auto-detect via φ |
| @name: | string | derived | Override auto-generated name |
| @path: | string | standard | Override default path |
| @potency: | 0-1 | 0.75 | Minimum potency threshold |

---

## The Alchemist's Stages

```
NIGREDO  → ALBEDO  → CITRINITAS → RUBEDO → VALIDATION
(Black)    (White)    (Yellow)     (Red)    (Gold)

W.extract  F.map     φ.classify   Generate  M.bind
Dissolve   Purify    Classify     Coagulate Validate
Session    Essence   Potency      Tincture  Quality
```

---

## Quick Reference Formulas

```
Golden Ratio:
  φ = (1 + √5)/2 ≈ 1.618
  φ² = φ + 1 ≈ 2.618
  1/φ = φ - 1 ≈ 0.618

Complexity Score:
  C = (O × D × I) / 5
  C < 0.618 → Command
  C < 1.618 → Skill
  C ≥ 1.618 → Agent

Quality Balance:
  Q = 0.618 × Specificity + 1.618 × Generality
  Optimal when S × G = 1

Potency:
  P = 0.30C + 0.25U + 0.25S + 0.20St
  Threshold: P ≥ 0.75

Information Laws:
  H(Tincture) < H(Session)
  I(Session; Tincture) ≥ 0.618 × H(Session)
```

---

## Hermetic Alignment

```
Mentalism:      Session patterns = mental models made visible
Correspondence: Tincture structure mirrors session structure
Vibration:      Complexity determines tincture frequency (1/φ, φ, φ²)
Polarity:       Specificity ↔ Generality balanced at φ
Rhythm:         Session flow distills into repeatable rhythm
Cause & Effect: Each operation contributes to tincture purpose
Gender:         Analysis (W.extract) + Generation (Rubedo) = Tincture
```

---

*"In the Alembic, all things are transformed."*

**— Solve et Coagula**
