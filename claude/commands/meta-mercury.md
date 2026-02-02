# Meta-Mercury: Communication Synthesis Workflow

**"From mind to mind, with nothing lost in translation."**

Comprehensive communication pipeline that synthesizes complex ideas, tests their reception, and builds artifacts that land with clarity, grace, and certainty.

## Usage
```
/meta-mercury [content]        # Full synthesis workflow for content/idea
/meta-mercury --audience X     # Target specific audience profile
/meta-mercury --format X       # Output as: thread, article, pitch, docs, explain
/meta-mercury --test-only      # Just run reception testing on existing draft
```

## Arguments
$ARGUMENTS

---

## Orchestration Flow

```
@orchestration
  @sequential[

    ═══════════════════════════════════════════════════════
    PHASE 1: DECODE - Extract the Signal
    ═══════════════════════════════════════════════════════

    @run:now
    → Identify core thesis (1 sentence)
    → Extract key concepts (max 5)
    → Map prerequisite knowledge
    → Surface implicit assumptions
    → Determine emotional weight

    ◆ signal:extracted

    ═══════════════════════════════════════════════════════
    PHASE 2: AUDIENCE MAP - Know Thy Receiver
    ═══════════════════════════════════════════════════════

    @run:now
    → Profile knowledge level
    → Identify mental models they already hold
    → Map potential resistance points
    → Discover what they already care about
    → Find the bridge concepts (familiar → unfamiliar)

    ◆ audience:profiled

    ═══════════════════════════════════════════════════════
    PHASE 3: TRANSLATE - Build the Bridge
    ═══════════════════════════════════════════════════════

    @parallel[
      → Clarity Pass: Remove jargon, simplify structure
      → Resonance Pass: Find analogies and anchors
      → Flow Pass: Sequence for progressive understanding
      → Precision Pass: Ensure nothing critical is lost
    ]

    → Synthesize: Unified translation that balances all four

    ◆ bridge:built

    ═══════════════════════════════════════════════════════
    PHASE 4: STRESS TEST - Simulate Reception
    ═══════════════════════════════════════════════════════

    @parallel[
      → Hostile Reader Test: What would a skeptic attack?
      → Confused Reader Test: Where would someone get lost?
      → Distracted Reader Test: Would they finish? What's the hook?
      → Expert Reader Test: Would they find it reductive?
    ]

    → Identify failure modes
    → Prioritize fixes by impact

    ◆ stress:tested

    ═══════════════════════════════════════════════════════
    PHASE 5: CRAFT - Build Final Artifact
    ═══════════════════════════════════════════════════════

    @run:now
    → Apply stress test learnings
    → Polish opening (the hook)
    → Strengthen transitions
    → Craft memorable close
    → Add structural aids (headers, callouts, summary)

    ◆ artifact:ready

    ═══════════════════════════════════════════════════════
    PHASE 6: DELIVER - Transmission Package
    ═══════════════════════════════════════════════════════

    @run:now
    → Final artifact
    → Key quotes for sharing
    → One-line summary
    → Visual/diagram suggestions (if applicable)
    → Adaptation notes for other formats

  ]
@end
```

---

## Phase 1: Decode

The hardest part of communication is knowing what you're actually trying to say.

### Signal Extraction Template

```markdown
### Core Thesis
**In one sentence**: [The irreducible claim or idea]

### Key Concepts (max 5)
1. [Concept]: [One-line definition]
2. [Concept]: [One-line definition]
3. ...

### Prerequisite Knowledge
**Assumes the reader knows**:
- [Thing they must already understand]
- [Mental model they need]
- [Context they should have]

### Hidden Assumptions
**Implicit beliefs embedded in this content**:
- [Assumption 1]
- [Assumption 2]

### Emotional Payload
**This content is trying to make the reader feel**:
- Primary: [Curious / Alarmed / Inspired / Validated / etc.]
- Secondary: [Additional emotional aim]

### Complexity Level
- **Conceptual depth**: [1-5] How abstract is the idea?
- **Technical depth**: [1-5] How much domain knowledge required?
- **Novelty**: [1-5] How unfamiliar is this to most people?
```

---

## Phase 2: Audience Map

You cannot build a bridge without knowing both shores.

### Audience Profile Template

```markdown
### Target Audience
**Who this is for**: [Specific description]

### Current State
**What they already know**:
- [Existing knowledge 1]
- [Existing knowledge 2]

**Mental models they hold**:
- [How they currently think about this domain]
- [Analogies they'd naturally reach for]

**What they care about**:
- [Their priorities]
- [Their pain points]
- [What's in it for them]

### Resistance Points
**Where they might push back**:
| Objection | Root Cause | Preemptive Address |
|-----------|------------|-------------------|
| [Objection 1] | [Why they'd think this] | [How to acknowledge/defuse] |
| [Objection 2] | | |

### Bridge Concepts
**Familiar → Unfamiliar mappings**:
| They Know | This Maps To |
|-----------|--------------|
| [Familiar concept] | [New concept in your content] |
| [Common experience] | [Abstract idea you're introducing] |

### Attention Budget
**Expected attention span**: [Tweet / 2-min read / 10-min read / deep dive]
**Competition for attention**: [What else are they thinking about?]
```

---

## Phase 3: Translate

Translation is not replacement - it's bridge-building.

### Four Translation Passes

| Pass | Goal | Question |
|------|------|----------|
| **Clarity** | Remove friction | Can this be said with fewer/simpler words? |
| **Resonance** | Create connection | What familiar thing does this feel like? |
| **Flow** | Enable progression | Does each idea prepare for the next? |
| **Precision** | Preserve truth | Is the essential meaning intact? |

### Clarity Pass
```markdown
**Jargon Audit**:
| Original Term | Replacement | Notes |
|---------------|-------------|-------|
| [Technical word] | [Plain language] | [Why this translation works] |

**Sentence Surgery**:
- Before: [Long, complex sentence]
- After: [Shorter, clearer version]

**Structure Simplification**:
- Cut: [What can be removed without loss]
- Merge: [What can be combined]
- Reorder: [What should come earlier/later]
```

### Resonance Pass
```markdown
**Analogies**:
| Concept | Analogy | Why It Works |
|---------|---------|--------------|
| [Abstract idea] | "It's like [familiar thing]" | [Mapping explanation] |

**Anchors** (connecting to reader's experience):
- [Experience most readers have had]
- [How your idea connects to that experience]

**Emotional Hooks**:
- Opening hook: [First line that creates curiosity/stakes]
- Tension: [The problem or gap that makes this matter]
- Release: [The resolution or insight]
```

### Flow Pass
```markdown
**Idea Sequence**:
1. [Start with what they know]
2. [Introduce first new element]
3. [Build on that foundation]
4. [Introduce complexity gradually]
5. [Arrive at full understanding]

**Transitions**:
| From | To | Bridge Phrase |
|------|-----|---------------|
| [Idea A] | [Idea B] | "This means that..." / "But here's the catch..." |

**Breathing Room**:
- Pause points: [Where reader needs time to absorb]
- Summary moments: [Where to reinforce key points]
```

### Precision Pass
```markdown
**Truth Preservation Check**:
| Original Claim | Simplified Version | Accuracy |
|----------------|-------------------|----------|
| [Technical statement] | [Plain version] | [Is nuance lost? Acceptable?] |

**Necessary Complexity**:
- [What CANNOT be simplified without distortion]
- [Why this complexity must remain]

**Caveats to Include**:
- [Important limitations to acknowledge]
- [Edge cases worth mentioning]
```

---

## Phase 4: Stress Test

If you can't anticipate objections, you'll be ambushed by them.

### Four Reader Simulations

#### Hostile Reader Test
```markdown
**The Skeptic asks**:
1. "Why should I believe this?" → [Your answer]
2. "What's your evidence?" → [Your answer]
3. "Isn't this just [dismissive reframe]?" → [Your answer]
4. "Who benefits from this narrative?" → [Your answer]

**Strongest attack vector**: [Their best argument against you]
**Your defense**: [How you address it]
```

#### Confused Reader Test
```markdown
**Loss points** (where understanding breaks):
| Location | What's Confusing | Fix |
|----------|-----------------|-----|
| [Para/section] | [Why it's unclear] | [How to clarify] |

**Missing context**:
- [What you assumed they knew but probably don't]

**Jargon that slipped through**:
- [Terms still needing translation]
```

#### Distracted Reader Test
```markdown
**First 30 seconds**: [Will they keep reading? Why/why not?]
**Skim test**: [If they only read headers and first sentences, do they get it?]
**TL;DR check**: [Is the core message clear even for skimmers?]

**Attention killers**:
- [Where they might abandon]
- [What's competing for their attention]

**Hooks to add**:
- [Curiosity gaps to introduce]
- [Stakes to raise earlier]
```

#### Expert Reader Test
```markdown
**Oversimplification risks**:
| Simplified Claim | Expert's Objection | Mitigation |
|------------------|-------------------|------------|
| [Your plain version] | "Actually, it's more nuanced..." | [How to acknowledge without losing audience] |

**Credibility signals**:
- [Evidence that you know the deeper complexity]
- [Caveats that earn expert respect]

**Expert takeaway**: [What an expert would appreciate vs. dismiss]
```

---

## Phase 5: Craft

The final artifact is shaped by everything learned.

### Communication Architecture Card

```markdown
### [Title]
**Format**: [Thread / Article / Pitch / Documentation / Explanation]
**Length**: [Word count / Time to read]
**Goal**: [What reader should think/feel/do after]

---

#### Opening (The Hook)
**First line**: [Attention-grabbing opener]
**Promise**: [What the reader will get from continuing]
**Stakes**: [Why this matters to them specifically]

#### Body (The Bridge)
**Structure**:
1. **[Section 1]**: [Purpose - What this section accomplishes]
2. **[Section 2]**: [Purpose]
3. **[Section 3]**: [Purpose]

**Key moments**:
- Aha moment: [Where the insight clicks]
- Proof moment: [Where skepticism dissolves]
- Action moment: [Where motivation crystallizes]

#### Close (The Landing)
**Summary**: [Core message restated (fresh words)]
**Resonance**: [Emotional note to end on]
**Call to action**: [What to do next (if applicable)]

---

#### Structural Aids
**Headers**: [List of headers that guide skimmers]
**Callouts**: [Key quotes to highlight/box]
**Visual**: [Diagram or image suggestions]

#### Quotable Lines
1. "[Memorable phrase for sharing]"
2. "[Another shareable line]"

#### One-Line Summary
"[The entire piece in 10-15 words]"
```

---

## Phase 6: Deliver

The transmission package includes everything needed for the message to spread.

### Transmission Package Template

```markdown
# MERCURY TRANSMISSION PACKAGE
**Content**: [Title/Description]
**Date**: [Date]
**Synthesized for**: [Audience]

---

## Final Artifact
[The complete, polished communication]

---

## Quick Reference

### One-Line Summary
> [10-15 word essence]

### Key Quotes (for sharing)
1. > "[Quote 1]"
2. > "[Quote 2]"
3. > "[Quote 3]"

### Visual Suggestions
- [Diagram concept 1]: [What it would show]
- [Diagram concept 2]: [What it would show]

---

## Adaptation Notes

### For Twitter/X Thread
- Opening tweet: [Adapted hook]
- Thread length: [Suggested # of tweets]
- Key structural change: [What to adjust for format]

### For Verbal Pitch (2 min)
- Opening line: [Spoken hook]
- Core sequence: [3 key points in order]
- Close: [Call to action]

### For Technical Documentation
- What to add: [Precision/depth needed]
- What to remove: [Narrative elements to cut]
- Structure: [Doc-appropriate organization]

### For Visual Presentation (Slides)
- # of slides: [Suggested count]
- Key visuals: [Slide concepts]
- Speaker notes focus: [What to say vs. show]

---

## Confidence Assessment

| Dimension | Score | Notes |
|-----------|-------|-------|
| **Clarity** | [1-5] | [Will they understand?] |
| **Resonance** | [1-5] | [Will they care?] |
| **Credibility** | [1-5] | [Will they believe?] |
| **Memorability** | [1-5] | [Will they remember?] |
| **Actionability** | [1-5] | [Will they act?] |

**Overall Reception Prediction**: [How this will land]
```

---

## Mercury's Laws

### Law 1: Meet Them Where They Are
The messenger's job is not to speak truth into the void, but to build a path from the listener's current understanding to the new idea. Every communication starts from familiar ground.

### Law 2: Clarity Is Kindness
Every moment of confusion is a moment where the reader might leave. Every unnecessary word is friction. Clarity is not dumbing down—it's respecting the reader's time and attention.

### Law 3: Test Before You Transmit
The message you think you're sending is not the message received. Simulate hostile, confused, distracted, and expert readers before you publish. Find your failures first.

### Law 4: Preserve the Essence
In the pursuit of accessibility, don't sacrifice truth. Know what can be simplified and what must remain complex. Some ideas cannot be made easy—only made clearer.

### Law 5: Emotion Carries Meaning
Facts inform but feelings motivate. Every communication has an emotional architecture—acknowledge it and design it intentionally.

---

## Example Invocation

```bash
# Full synthesis of a complex concept
/meta-mercury "Explain how monads work to frontend developers"

# Target specific audience
/meta-mercury --audience "executives with no tech background" "Why we need to migrate our infrastructure"

# Output as specific format
/meta-mercury --format pitch "Our new authentication system"

# Test existing draft
/meta-mercury --test-only < existing_blog_post.md
```

---

## Audience Presets

When `--audience` is used with these keywords, apply predefined profiles:

| Preset | Profile |
|--------|---------|
| `general` | No specialized knowledge, everyday vocabulary, concrete examples |
| `technical` | Developer literacy, can handle code snippets, values precision |
| `executive` | Time-starved, needs bottom-line, cares about impact/risk/cost |
| `academic` | Values rigor, citations, nuance—tolerates complexity |
| `skeptic` | Assumes bad faith, needs strong evidence, preemptive objection handling |
| `student` | Learning mode, needs scaffolding, appreciates analogies |

---

## Format Templates

When `--format` is used, structure the final artifact accordingly:

| Format | Structure |
|--------|-----------|
| `thread` | Hook tweet → 5-15 linked tweets → Call to action |
| `article` | Title → Intro → 3-5 sections → Conclusion |
| `pitch` | Problem → Solution → Proof → Ask |
| `docs` | Overview → Concepts → Examples → Reference |
| `explain` | What → Why it matters → How it works → What to do |

---

## Philosophy

Mercury sits between worlds—the messenger who carries fire from the gods without burning.

| Principle | Application |
|-----------|-------------|
| **Speed with precision** | Fast communication that doesn't sacrifice accuracy |
| **Translation, not reduction** | Bridge-building, not dumbing down |
| **Audience-first** | The receiver's understanding matters more than the sender's expression |
| **Multiple forms** | Same message, adapted for different contexts and media |
| **Test everything** | Simulate reception before transmission |

**"The quality of communication is measured by the understanding it creates, not the eloquence it displays."**

---

*v1.0 | Created: 2026-01-04 | Mercury carries the message with grace, precision, and certainty*
