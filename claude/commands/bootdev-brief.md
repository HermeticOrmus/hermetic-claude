---
name: bootdev-brief
description: Get a morning briefing on today's boot.dev lesson - concepts, what you'll learn, mental prep.
---

# Boot.dev Morning Briefing

**Purpose**: Prepare you mentally for today's learning by summarizing what's coming up.

## Instructions

1. Navigate to boot.dev dashboard using Playwright
2. Take a snapshot to see current course and lesson status
3. Click to view the current/next lesson
4. Extract:
   - Lesson title and number
   - Chapter context
   - Key concepts covered
   - Prerequisites (what you should already know)
   - Estimated time
5. Look up relevant YouTube videos from ~/projects/boot.dev/YOUTUBE-COMPANION.md
6. Check if there are related terms in ~/projects/boot.dev/glossary/
7. Compose a briefing message
8. Send to WhatsApp (Ormus-Claude channel)

## Message Format

```
🌅 BOOT.DEV MORNING BRIEFING

📚 Course: {course_name}
📖 Chapter: {chapter_name}
📝 Today's Lesson: {lesson_title}

🎯 WHAT YOU'LL LEARN:
• {concept_1}
• {concept_2}
• {concept_3}

🔗 PREREQUISITES:
• {prereq_1}
• {prereq_2}

📺 COMPANION VIDEO:
{youtube_link} - {video_title}

⏱️ Estimated: {time} minutes

💪 Let's build something today.
```

## Execution Steps

```
1. browser_navigate → https://www.boot.dev/dashboard
2. browser_snapshot → get current status
3. browser_click → current lesson link
4. browser_snapshot → read lesson preview
5. Read YOUTUBE-COMPANION.md for relevant videos
6. Compose briefing message
7. Send via WhatsApp MCP to 120363422067085557@g.us
```

## Notes

- Run this each morning to prepare mentally
- The briefing primes your brain for the concepts
- Knowing what's coming reduces friction to starting
