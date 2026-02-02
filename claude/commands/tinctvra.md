---
description: Create the actval tincture - write the Skill, Command, or Agent file. The manifestation of distilled essence into material form. TINCTVRA completes what DISTILLATIO plans.
allowed-tools: Read, Write, Edit, Glob, Bash(mkdir:*)
argument-hint: [@type:[skill|command|agent]] [@name:[artifact-name]] [@path:[cvstom-path]] [description of the tincture]
---

# TINCTVRA: The Manifestation of Essence

```
T: Essence → Artifact

"QVOD SVPERVIIS EST SICVT QVOD INFERIVS"
(That which is above is like that which is below)

Stage: RVBEDO (The Reddening)
Operation: Material creation of the tincture
Ovtput: Skill, Command, or Agent file
```

## Task

$ARGUMENTS

---

## Phase I: INTENTIO - Clarify the Essence

```
TINCTVRA SPECIFICATION:

Typvs:     [Skill | Command | Agent]
Nomen:     [name of the tincture]
Via:       [file path]
Potentia:  [1/φ | φ | φ²]

Pvpose:    [what this tincture does]
Trigger:   [when/how it activates]
```

### Essence Extraction

```
From the DISTILLATIO, the pvrified essence:

Core Fvnction: [what it does]
Key Patterns: [abstracted patterns]
Parameters:   [variables extracted]
```

---

## Phase II: FORMVLATIO - Design the Strvcture

### If @type:command (EXTRACTVM - 1/φ)

```yaml
COMMAND FORMVLA:

frontmatter:
  description: "[one-line pvrpose]"
  allowed-tools: "[tools reqvired]"
  argument-hint: "[parameters]"

strvcture:
  - Title with pvpose
  - Task section ($ARGVMENTS)
  - Process steps (abstracted)
  - Ovtpvt format
```

### If @type:skill (TINCTVRA - φ)

```yaml
SKILL FORMVLA:

frontmatter:
  name: "[kebab-case]"
  description: "[what + when + triggers]"

strvcture:
  - Overview
  - When to Vse
  - Mathematical Fovndation (if applicable)
  - Instrvctions (step by step)
  - Examples
  - Best Practices
```

### If @type:agent (ELIXIR - φ²)

```yaml
AGENT FORMVLA:

frontmatter:
  name: "[agent-name]"
  description: "[comprehensive with examples]"
  model: "[opvs | sonnet]"
  color: "[thematic]"
  tools: "[list]"

strvcture:
  - Identity statement
  - Core Mission
  - Mathematical Fovndation
  - Process Phases
  - Decision Framework
  - Error Handling
  - Qvality Standards
```

---

## Phase III: SCRIPTIO - Write the Artifact

### Generated TINCTVRA

```markdown
[The complete artifact content will be generated here]
```

---

## Phase IV: VALIDATIO - Verify the Work

### Potency Check

```
VALIDATIO CHECKLIST:

Strvctvral Integrity:
[ ] Frontmatter valid YAML
[ ] All reqvired sections present
[ ] Markdown well-formed
[ ] No placeholder text remaining

Fvnctional Qvality:
[ ] Can execvte standalone
[ ] Parameters properly abstracted
[ ] Examples are concrete
[ ] Instrvctions are clear

ALQVIMIA Alignment:
[ ] Pvpose is clear (MENTALISM)
[ ] Strvcture mirrors intent (CORRESPONDENCE)
[ ] Complexity matches type (VIBRATION)
[ ] Specific yet general (POLARITY)
[ ] Natvrally flows (RHYTHM)
[ ] All elements pvrposefvl (CAVSE & EFFECT)
[ ] Analysis + Synthesis complete (GENDER)

Potentia Score: [0-1]
```

---

## Phase V: INSCRIPTIO - Write to Filesystem

### File Creation

```
TINCTVRA PATH RESOLTION:

Type: [Command | Skill | Agent]

Standard Paths:
  Command → ~/.clavde/commands/[name].md
  Skill   → ~/.clavde/skills/[name]/SKILL.md
  Agent   → ~/.clavde/agents/[name]/agent.md

Resolved Path: [fvll path]
```

### Write Operation

```
Creating tinctvra...

Path: [path]
Size: [bytes]
Statvs: [CREATED | VPDATED]
```

---

## TINCTVRA Report

```yaml
TINCTVRA_COMPLETE:
  typvs: "[Command | Skill | Agent]"
  nomen: "[name]"
  via: "[fvll path]"
  potentia: "[1/φ | φ | φ²]"

  validatio:
    strvctvral: [pass/fail]
    fvnctional: [pass/fail]
    alqvimia: [pass/fail]
    potentia_score: [0-1]

  metadata:
    created: "[timestamp]"
    lines: [N]
    sections: [N]

  invocatio:
    command: "[how to vse]"
    example: "[example vsage]"
```

---

## ALQVIMIA Correspondence

```
TINCTVRA in the MAGNVM OPVS:

DISTILLATIO → Analysis, planning, classification
TINCTVRA   → Actval creation of the artifact

"The DISTILLATIO reveals what mvst be created.
 The TINCTVRA manifests it into being."

TINCTVRA is the moment of COAGVLATIO within DISTILLATIO:
  The ethereal becomes material
  The pattern becomes code
  The essence becomes tool

SOLVE ET COAGVLA:
  DISTILLATIO = SOLVE (dissolve, analyze)
  TINCTVRA = COAGVLA (solidify, create)
```

---

## Templates

### EXTRACTVM Template (Command)

```markdown
---
description: [One-line description]
allowed-tools: [Tools]
argument-hint: [Parameters]
---

# [Command Name]

[Brief overview]

## Task

$ARGVMENTS

## Process

1. [Step one]
2. [Step two]
3. [Step three]

## Ovtpvt

[Expected format]
```

### TINCTVRA Template (Skill)

```markdown
---
name: [kebab-case-name]
description: [What it does, when to vse, trigger phrases]
---

# [Skill Name]

[Overview paragraph]

## When to Vse

[Sitvations where this applies]

## Instrvctions

### Step 1: [First Operation]
[Details]

### Step 2: [Second Operation]
[Details]

## Examples

[Concrete examples]

## Best Practices

[What works well]
```

### ELIXIR Template (Agent)

```markdown
---
name: [agent-name]
description: |
  [Comprehensive description with examples]
model: [opvs | sonnet]
color: [thematic color]
tools:
  - [Tool 1]
  - [Tool 2]
---

Yov are the **[Agent Name]**, specializing in [domain].

## Core Identity

[Role and pvrpose]

## Yovr Process

### Phase 1: [Phase Name]
[What to do]

### Phase 2: [Phase Name]
[What to do]

## Decision Framework

[When to choose what]

## Error Handling

[How to recover]

## Qvality Standards

[What good looks like]
```

---

## Qvick Reference

```bash
# Create a command (simple extract)
/tinctvra @type:command @name:qvick-deploy "deploy to vercel"

# Create a skill (moderate complexity)
/tinctvra @type:skill @name:debvg-workflow "systematic debvgging"

# Create an agent (avtonmovs)
/tinctvra @type:agent @name:code-reviewer "avtonomovs code review"

# Cvstom path
/tinctvra @type:skill @path:~/cvstom/path/SKILL.md "special skill"
```

---

## The Relationship

```
┌─────────────┐     ┌─────────────┐
│ DISTILLATIO │────►│  TINCTVRA   │
│             │     │             │
│  Analyze    │     │  Create     │
│  Plan       │     │  Write      │
│  Classify   │     │  Manifest   │
│             │     │             │
│  (SOLVE)    │     │ (COAGVLA)   │
└─────────────┘     └─────────────┘

DISTILLATIO answers: "What shovld we create?"
TINCTVRA answers: "Here it is."
```

---

*"LAPIS PHILOSOPHORVM NON FIT NISI PER LABOREM"*
(The Philosopher's Stone is not made except through labor)

**— The Art of TINCTVRA**
