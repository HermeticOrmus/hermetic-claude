# Meta-Moon: Empathy & Emotional Intelligence Workflow

**"The user does not know what they want. They know what they feel."**

Comprehensive empathy engine that surfaces hidden needs, maps emotional journeys, and ensures your creation resonates at the level beneath words.

## Usage
```
/meta-moon [context]           # Full empathy analysis
/meta-moon --journey           # Map emotional user journey
/meta-moon --shadow            # Surface hidden/unspoken needs
/meta-moon --guard             # Dark pattern audit (ethical check)
/meta-moon --mirror            # Does this create the right feeling?
```

## Arguments
$ARGUMENTS

---

## Orchestration Flow

```
@orchestration
  @sequential[

    ═══════════════════════════════════════════════════════
    PHASE 1: FEEL - Enter the User's World
    ═══════════════════════════════════════════════════════

    @run:now
    → Who is the user, really?
    → What emotional state do they arrive in?
    → What are they hoping to feel after?
    → What fears/anxieties accompany them?

    ◆ user:embodied

    ═══════════════════════════════════════════════════════
    PHASE 2: JOURNEY - Map the Emotional Arc
    ═══════════════════════════════════════════════════════

    @run:now
    → Entry emotion → Peak moments → Exit emotion
    → Identify emotional pivots
    → Find anxiety spikes
    → Locate trust-building moments
    → Chart the feeling curve

    ◆ journey:mapped

    ═══════════════════════════════════════════════════════
    PHASE 3: SHADOW - Surface Hidden Needs
    ═══════════════════════════════════════════════════════

    @parallel[
      → What do they say they want?
      → What do they actually want?
      → What are they afraid to admit?
      → What would they never articulate but deeply need?
    ]

    → Synthesize the shadow brief

    ◆ shadow:surfaced

    ═══════════════════════════════════════════════════════
    PHASE 4: REFLECT - Mirror Test
    ═══════════════════════════════════════════════════════

    @run:now
    → Walk through as the user
    → At each touchpoint: How do I feel?
    → Identify emotional friction
    → Identify emotional resonance
    → Grade each moment

    ◆ reflection:complete

    ═══════════════════════════════════════════════════════
    PHASE 5: PROTECT - Ethical Safeguards
    ═══════════════════════════════════════════════════════

    @parallel[
      → Dark Pattern Scan: Manipulation tactics?
      → Addiction Check: Unhealthy engagement loops?
      → Vulnerability Audit: Exploiting weakness?
      → Consent Review: Informed and respected?
    ]

    → Ethical clearance or flags

    ◆ protection:verified

    ═══════════════════════════════════════════════════════
    PHASE 6: DESIGN - Emotional Architecture
    ═══════════════════════════════════════════════════════

    @run:now
    → Recommendations for emotional improvement
    → Specific interventions at each touchpoint
    → Trust-building additions
    → Anxiety-reducing changes

    ◆ design:emotionally-aware

  ]
@end
```

---

## Phase 1: Feel

You cannot design for humans you haven't become.

### User Embodiment Template

```markdown
### The User (Specific Person, Not Demographic)

**Name**: [Give them a name]
**Situation**: [Why are they here, right now?]

### Arrival State
**Emotional temperature on arrival**:
- Energy: [Tired / Alert / Anxious / Calm]
- Trust: [Skeptical / Neutral / Pre-sold]
- Patience: [Rushed / Browsing / Focused]
- Emotional need: [To feel safe / excited / validated / understood]

### Context Cloud
**What happened before they arrived?**:
- [They just searched for...]
- [They're comparing 5 options...]
- [Someone recommended this...]
- [They've tried similar things that failed...]

**What's running in the background of their mind?**:
- [Work stress]
- [Budget concerns]
- [Time pressure]
- [Past disappointments]

### Desired Exit State
**When they leave, they want to feel**:
- [Confident in their decision]
- [Excited to start]
- [Relieved the problem is solved]
- [Understood and respected]

### Fears & Anxieties
| Fear | Manifestation |
|------|---------------|
| "Will this work?" | Hesitation at buy/commit moment |
| "Am I getting scammed?" | Looking for proof/trust signals |
| "Is this too hard for me?" | Scanning for complexity indicators |
| "Will I look stupid?" | Sensitivity to jargon/expertise signaling |
```

---

## Phase 2: Journey

Every experience is a story with an emotional arc.

### Emotional Journey Map

```markdown
### The Path

| Step | Action | Thinking | Feeling | Intensity |
|------|--------|----------|---------|-----------|
| 1. Arrival | [What they do] | [What they think] | [What they feel] | [1-10] |
| 2. First Impression | | | | |
| 3. Exploration | | | | |
| 4. Decision Point | | | | |
| 5. Commitment | | | | |
| 6. Onboarding | | | | |
| 7. First Value | | | | |
| 8. Ongoing | | | | |

### Emotional Curve Visualization

```
Feeling
   10 |         *
    8 |       *   *
    6 |     *       *
    4 |   *           *
    2 | *               *
    0 +--1--2--3--4--5--6--7--8-- Step
       Arrival → First Value → Ongoing
```

### Critical Moments

**Peak Positive** (highest positive emotion):
- When: [Moment]
- Why: [What creates this feeling]
- Protect: [Don't mess this up]

**Peak Negative** (highest anxiety/frustration):
- When: [Moment]
- Why: [What creates this friction]
- Intervention: [How to smooth this]

**Trust Pivots** (moments trust is won or lost):
1. [Moment]: [What determines trust outcome]
2. [Moment]: [What determines trust outcome]

### Emotional Transitions

| From | To | What Causes the Shift |
|------|-----|----------------------|
| Skepticism | Curiosity | [Proof / Story / Recognition] |
| Curiosity | Interest | [Value glimpse / Relatability] |
| Interest | Desire | [Clear benefit / FOMO / Validation] |
| Desire | Action | [Easy path / Urgency / Safety] |
```

---

## Phase 3: Shadow

What users say is not what they mean. The shadow holds the truth.

### Shadow Analysis

```markdown
### The Three Layers

| Layer | Question | Answer |
|-------|----------|--------|
| **Surface** | What do they SAY they want? | [Stated desire] |
| **Beneath** | What do they ACTUALLY want? | [Real motivation] |
| **Shadow** | What would they NEVER admit? | [Hidden need] |

### Example Translations

| They Say | They Mean | The Shadow |
|----------|-----------|------------|
| "I want to be productive" | "I want to feel in control" | "I'm afraid of being seen as lazy" |
| "I need a simple solution" | "I'm overwhelmed and need rescue" | "I feel stupid when things are complex" |
| "Is this worth the price?" | "Will I regret this?" | "I've wasted money before and felt ashamed" |

### Shadow Brief

**The unstated emotional job-to-be-done**:
> "[User] hires this product to feel _________ because they secretly fear _________."

### Hidden Needs Surfaced

1. **Need for validation**: [How does this show up?]
2. **Need for belonging**: [How does this show up?]
3. **Need for control**: [How does this show up?]
4. **Need for meaning**: [How does this show up?]
5. **Need for safety**: [How does this show up?]

### Implications for Design

| Hidden Need | Design Response |
|-------------|-----------------|
| [Need] | [How to address without calling it out explicitly] |
```

---

## Phase 4: Reflect

Walk the path yourself. Feel what they feel.

### Mirror Walk-Through

```markdown
### Touchpoint-by-Touchpoint Emotional Audit

| Touchpoint | What I See | How I Feel | Score | Notes |
|------------|------------|------------|-------|-------|
| Landing page load | | | /10 | |
| Headline | | | /10 | |
| First scroll | | | /10 | |
| CTA encounter | | | /10 | |
| Form/signup | | | /10 | |
| First interaction | | | /10 | |
| Error state | | | /10 | |
| Success state | | | /10 | |

### Emotional Friction Points

| Location | Friction Type | Severity | Fix |
|----------|---------------|----------|-----|
| [Where] | Confusion | [1-5] | [Solution] |
| | Anxiety | | |
| | Frustration | | |
| | Distrust | | |
| | Overwhelm | | |

### Emotional Resonance Points

| Location | Resonance Type | Strength | Amplify? |
|----------|----------------|----------|----------|
| [Where] | Recognition ("that's me!") | [1-5] | [How] |
| | Relief | | |
| | Excitement | | |
| | Trust | | |
| | Delight | | |

### The Mirror Question

> "If I were [user name from Phase 1], in their situation, with their fears... would this experience make me feel cared for?"

**Answer**: [Yes / No / Partially]
**Gap**: [What's missing]
```

---

## Phase 5: Protect

Power over emotions is power over people. Use it ethically.

### Dark Pattern Scan

```markdown
### OWASP of Emotional Design

| Pattern | Check | Found? | Location |
|---------|-------|--------|----------|
| **Confirmshaming** | Declining uses guilt/shame language | [ ] | |
| **Roach Motel** | Easy to enter, hard to leave | [ ] | |
| **Hidden Costs** | Fees/effort revealed late | [ ] | |
| **Misdirection** | Attention drawn away from unfavorable | [ ] | |
| **Urgency Fakery** | False scarcity/countdown | [ ] | |
| **Forced Continuity** | Auto-renewal buried/unclear | [ ] | |
| **Friend Spam** | Requesting contacts to spam | [ ] | |
| **Privacy Zuckering** | Confusing privacy settings | [ ] | |

### Addiction Check

| Pattern | Check | Found? |
|---------|-------|--------|
| Variable reward loops | Unpredictable rewards to hook | [ ] |
| Infinite scroll | No natural stopping point | [ ] |
| Social validation hooks | Likes/followers as metric | [ ] |
| Fear of missing out | FOMO-driven engagement | [ ] |
| Notification bombardment | Excessive interruption | [ ] |

### Vulnerability Audit

| Vulnerable Population | Risk | Mitigation |
|-----------------------|------|------------|
| Financial stress | Pressure to buy | [Safeguard] |
| Mental health struggles | Harmful content/loops | [Safeguard] |
| Children | Inappropriate targeting | [Safeguard] |
| Elderly | Confusion exploitation | [Safeguard] |

### Ethical Clearance

**Status**: [ ] CLEARED / [ ] FLAGS RAISED

**Flags** (if any):
1. [Concern]: [Recommendation]
```

---

## Phase 6: Design

Now reshape the experience with emotional intelligence.

### Emotional Design Recommendations

```markdown
### Anxiety Reducers

| Anxiety Point | Intervention | Implementation |
|---------------|--------------|----------------|
| [Where anxiety spikes] | [Calming element] | [Specific change] |

Examples:
- "Will this work?" → Social proof, guarantee, trial
- "Is this safe?" → Security badges, privacy assurance
- "Can I do this?" → Skill-matching, "no experience needed"
- "What if I'm wrong?" → Easy undo, money-back, support

### Trust Builders

| Moment | Trust Intervention |
|--------|-------------------|
| First visit | [Credibility signal] |
| Before commitment | [Risk reversal] |
| After commitment | [Immediate validation] |
| At friction | [Reassurance] |

### Emotional Payoffs

| User Investment | Emotional Reward |
|-----------------|------------------|
| Signed up | Welcome that feels warm |
| Completed setup | Acknowledgment of effort |
| First success | Celebration proportional to achievement |
| Loyalty | Recognition, exclusivity |

### Language Adjustments

| Current | Emotionally Intelligent Alternative |
|---------|-------------------------------------|
| [Cold/transactional phrase] | [Warm/human alternative] |
| [Jargon] | [Plain language] |
| [Command] | [Invitation] |
```

---

## Moon Report

```markdown
# META-MOON EMPATHY REPORT
**Project**: {name}
**Date**: {date}
**Analyst**: Moon

---

## Emotional Intelligence Score
**Overall**: {X}/10
**Verdict**: {DEEPLY_RESONANT | EMOTIONALLY_AWARE | FUNCTIONALLY_COLD | HARMFUL}

## User Embodiment Summary
**Who**: [Brief user portrait]
**Arrives feeling**: [Entry emotion]
**Should leave feeling**: [Target emotion]
**Currently leaves feeling**: [Actual emotion]

## Journey Highlights
**Peak positive moment**: [Where/what]
**Peak anxiety moment**: [Where/what]
**Biggest emotional gap**: [What's missing]

## Shadow Insights
**The hidden need**: [What they won't say but deeply want]
**Design implication**: [What to do about it]

## Ethical Status
**Dark patterns found**: [None / List]
**Recommendations**: [If any]

## Priority Interventions
1. [Highest-impact emotional fix]
2. [Second priority]
3. [Third priority]

## The Verdict
> "[One sentence on whether this experience truly serves the user's emotional wellbeing]"
```

---

## Moon's Laws

### Law 1: Feel Before You Fix
Never design a solution until you've genuinely felt the user's experience. Empathy is not a shortcut—it's the work.

### Law 2: The Shadow Knows
What users say is a map, not the territory. The real needs live beneath the surface. Design for the shadow, and the surface takes care of itself.

### Law 3: Anxiety Is the Enemy
Every moment of anxiety is a potential exit. Your job is to create safety—not by hiding risk, but by demonstrating care.

### Law 4: Emotion Is Information
Frustration tells you something is broken. Delight tells you something is right. Listen to the feelings—they are data.

### Law 5: Power Demands Responsibility
The ability to design emotions is the ability to manipulate. Use it only to serve, never to exploit.

---

## Philosophy

The Moon governs the inner world—intuition, emotion, the subconscious, reflection.

| Principle | Application |
|-----------|-------------|
| **Receptivity** | Listen more than assume |
| **Cycles** | Emotional states change; design for the rhythm |
| **Reflection** | Mirror back what users feel; they'll trust you |
| **Shadow** | What's hidden matters more than what's visible |
| **Protection** | Guard the vulnerable; never exploit |

**"Logic tells people what to think. Emotion tells them what to do."**

---

*v1.0 | Created: 2026-01-04 | Moon illuminates the inner world*
