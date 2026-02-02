---
description: "Trigger a roguelike learning encounter and send via WhatsApp"
---

# Roguelike Learning Encounter

Generate a random learning encounter and send it to the Ormus-Teacher WhatsApp channel.

## Boot.dev Integration

The learning system now **prioritizes boot.dev content** based on your current course progress:
- 70% of encounters will feature boot.dev terms (configurable)
- Current course terms are prioritized over completed courses
- Recently learned terms (within 7 days) get extra review weight
- Code examples from your glossary are included when available

## Instructions

1. Run the roguelike learning script to generate an encounter:
   ```bash
   python3 ~/projects/Ormus-Library/.curriculum/roguelike_learning.py
   ```

2. Send the generated message via WhatsApp to **Ormus-Teacher** channel:
   - Channel ID: `120363405912178008@g.us`
   - This is the dedicated teaching channel for learning encounters

3. If the encounter type is CHALLENGE or BOSS_QUIZ, mention that a voice note response is expected.

## Encounter Types (by rarity)

| Type | Chance | XP | Description |
|------|--------|-----|-------------|
| QUICK_TERM | 35% | 5 | Single term + definition |
| CONTEXT_DROP | 25% | 10 | Term in context from repos |
| LESSON_HOOK | 15% | 15 | Teaser from a lesson |
| CHALLENGE | 15% | 25 | Voice note prompt |
| DEEP_DIVE | 7% | 50 | Full lesson details |
| BOSS_QUIZ | 3% | 100 | Multi-question quiz |

## Command Options

```bash
# Normal encounter (boot.dev prioritized)
python3 ~/projects/Ormus-Library/.curriculum/roguelike_learning.py

# Force boot.dev content (100%)
python3 ~/projects/Ormus-Library/.curriculum/roguelike_learning.py --bootdev

# Force specific encounter type
python3 ~/projects/Ormus-Library/.curriculum/roguelike_learning.py --type challenge

# Show status (includes boot.dev stats)
python3 ~/projects/Ormus-Library/.curriculum/roguelike_learning.py --status

# Show configuration
python3 ~/projects/Ormus-Library/.curriculum/roguelike_learning.py --config

# Toggle boot.dev priority
python3 ~/projects/Ormus-Library/.curriculum/roguelike_learning.py --set-bootdev on
python3 ~/projects/Ormus-Library/.curriculum/roguelike_learning.py --set-bootdev off

# Get JSON output with target channel
python3 ~/projects/Ormus-Library/.curriculum/roguelike_learning.py --json
```

## WhatsApp Channels

| Channel | ID | Purpose |
|---------|-----|---------|
| **Ormus-Teacher** | `120363405912178008@g.us` | Learning encounters (primary) |
| Ormus-Claude | `120363422067085557@g.us` | Session updates |
| Ormus direct | `50769830878@c.us` | Urgent/personal |

## Boot.dev Content Sources

The system pulls terms from your boot.dev glossary:
- `~/projects/boot.dev/glossary/linux.md` - Current focus
- `~/projects/boot.dev/glossary/python.md` - Review content
- `~/projects/boot.dev/glossary/*.md` - All courses

Current course is auto-detected from `~/projects/boot.dev/PROGRESS.md`.

## Example Flow

```
1. Claude runs: python3 ~/projects/Ormus-Library/.curriculum/roguelike_learning.py --bootdev
2. Gets output like:
   *QUICK TERM* (boot.dev/linux)

   *grep*

   "Global Regular Expression Print" - searches for text patterns in files...

   ```
   grep "CRITICAL" logs/2024-01-10.log
   ```

   _Currently learning: Linux_

   ---
   Level 3 | 450 XP | 5 day streak | #2 today

3. Claude sends to Ormus-Teacher channel (120363405912178008@g.us)
```

## Configuration

Stored in: `~/projects/Ormus-Library/.curriculum/learning_config.json`

```json
{
  "prefer_bootdev": true,
  "bootdev_weight": 70,
  "target_channel": "teacher"
}
```
