---
name: bootdev-review
description: Generate evening review of completed lessons - reinforce learning, update glossary, preview tomorrow.
---

# Boot.dev Evening Review

**Purpose**: Reinforce today's learning, capture key terms, preview tomorrow.

## Instructions

1. Navigate to boot.dev dashboard using Playwright
2. Check what lessons were completed today
3. For each completed lesson:
   - Extract key concepts and terminology
   - Add new terms to appropriate glossary file
   - Note any concepts that connect to previous learning
4. Look at tomorrow's upcoming lesson
5. Compose review message
6. Send to WhatsApp (Ormus-Claude channel)
7. Update PROGRESS.md with today's activity

## Message Format

```
🌙 BOOT.DEV EVENING REVIEW

📊 TODAY'S PROGRESS:
✅ Completed: {n} lessons
📚 Course: {course_name}
🔥 Streak: {streak_days} days

📝 KEY CONCEPTS LEARNED:
• {concept_1}: {brief_explanation}
• {concept_2}: {brief_explanation}
• {concept_3}: {brief_explanation}

📖 ADDED TO GLOSSARY:
• {term_1}
• {term_2}

🔗 CONNECTIONS:
This connects to {previous_concept} from {previous_lesson}.

📅 TOMORROW'S PREVIEW:
{next_lesson_title} - {brief_description}

🎯 Keep building. The compound effect is real.
```

## Glossary Update Process

1. Read the lesson content
2. Identify new terminology
3. Write definition in context
4. Add to ~/projects/boot.dev/glossary/{course}.md
5. Cross-reference with existing terms

## Execution Steps

```
1. browser_navigate → https://www.boot.dev/dashboard
2. browser_snapshot → check today's completions
3. browser_navigate → completed lesson(s)
4. browser_snapshot → extract content
5. Parse key concepts and terms
6. Update glossary files
7. Read tomorrow's lesson preview
8. Compose review message
9. Send via WhatsApp MCP
10. Update PROGRESS.md
```
