# Vibe Check

Generate a humorous community vibe report for Luxor Studios Discord.

---

## Metadata

```yaml
name: vibe-check
description: Analyze recent Discord activity and post a witty vibe check to #vibe-check
version: 1.0.0
author: Ormus
triggers:
  - /vibe-check
  - /vibe
```

---

## Instructions

When invoked, perform these steps:

### 1. Gather Messages

Read recent messages from these Luxor Studios Discord channels:
- `#repos` (ID: 1455244948663177384)
- `#dev-chat` (ID: 1450219590897369253)
- `#meta-prompting` (ID: 1455245392135327937)
- `#general` (ID: 1450206389174665239)

Use `mcp__discord__discord_read_messages` with limit 50 for each channel.

### 2. Analyze the Vibe

Review all messages and identify:
- What repos/tools are being shared
- What's being built or discussed
- The overall energy (research mode, build mode, chaos mode, etc.)
- Any notable quotes or insights
- How many "spinning plates" are in motion

### 3. Generate the Report

Create a vibe check in this format:

```markdown
**VIBE CHECK** | [Today's Date]

```
CURRENT VIBE: [FUNNY 2-4 WORD DESCRIPTION IN ALL CAPS]
```

**The Energy:**
[2-3 sentences humorously describing what's happening]

**What's Cooking:**
[3-5 bullet points of key activities]

**Spinning Plates Count:** [Humorous assessment]

**Vibe Trajectory:**
```
Research Mode ████████████░░░ [X]%
Build Mode    ███░░░░░░░░░░░░ [Y]%
Touch Grass   ░░░░░░░░░░░░░░░ [Z]%
```

**Quote of the Day:**
> [Something interesting from the messages or a fitting quote]

**Mood:** [One sentence overall assessment]

---
*Next vibe check when vibes shift*
```

### 4. Post to Discord

Send the report to `#vibe-check` (ID: 1455420479623008267) using `mcp__discord__discord_send`.

---

## Tone Guidelines

- **Witty** - Self-aware humor about the chaos of building things
- **Observant** - Reference specific repos, tools, or topics from messages
- **Slightly sarcastic** - But never mean-spirited
- **Informative** - Actually convey what's happening beneath the jokes

---

## Example Output

```markdown
**VIBE CHECK** | Dec 29, 2024

```
CURRENT VIBE: RESEARCH GOBLIN MODE
```

**The Energy:**
Manu dropped 12 repos in one day like someone clearing browser tabs before their laptop catches fire. The team is in full "collect all the things" mode.

**What's Cooking:**
- Categorical meta-prompting got a whole documentation website
- The Alchemist's Workshop absorbed 5 new agent infrastructure ingredients
- Someone quoted Alan Perlis about complexity removal (we're feeling intellectual)

**Spinning Plates Count:** Many. We discovered repo-swarm literally to track spinning plates.

**Vibe Trajectory:**
```
Research Mode ████████████░░░ 80%
Build Mode    ███░░░░░░░░░░░░ 20%
Touch Grass   ░░░░░░░░░░░░░░░  0%
```

**Quote of the Day:**
> "Fools ignore complexity. Pragmatists suffer it. Some can avoid it. Geniuses remove it."

**Mood:** Optimistically overwhelmed. The good kind of chaos.

---
*Next vibe check when vibes shift*
```

---

## Channel Reference

| Channel | ID | Purpose |
|---------|-----|---------|
| #vibe-check | 1455420479623008267 | Post destination |
| #repos | 1455244948663177384 | Repo shares |
| #dev-chat | 1450219590897369253 | Dev discussions |
| #meta-prompting | 1455245392135327937 | CMP project |
| #general | 1450206389174665239 | General chat |

Server ID: 1450206388155322525 (Luxor Studios)
