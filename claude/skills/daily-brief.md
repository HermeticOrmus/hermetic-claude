---
name: daily-brief
description: Morning briefing for all learning platforms (boot.dev, TryHackMe, LeetCode)
---

# Daily Learning Brief

Generate a morning briefing that covers all active learning platforms.

## Steps

1. **Read current progress** from:
   - `~/projects/boot.dev/PROGRESS.md`
   - `~/projects/tryhackme/PROGRESS.md`
   - `~/projects/DAILY-LEARNING.md`

2. **Generate briefing** including:
   - Current streak status (boot.dev)
   - Today's recommended focus
   - Quick wins available
   - Milestone proximity

3. **Format as concise summary**:

```
=== DAILY LEARNING BRIEF ===
Date: [today]

BOOT.DEV
├─ Streak: X days
├─ Current: [course] - [chapter]
├─ Progress: X% overall
└─ Today's target: [X lessons]

TRYHACKME
├─ Current path: [path name]
├─ Rooms completed: X
└─ Today's target: [X rooms]

FOCUS TODAY
[Primary platform and specific task]

MILESTONE CHECK
[Nearest milestone and % to completion]
=============================
```

4. **Optionally send to WhatsApp** using:
   `mcp__whatsapp__periskope_send_message` to `50769815142@c.us`

## Usage

```
/daily-brief           # Generate briefing
/daily-brief --send    # Generate and send to WhatsApp
```
