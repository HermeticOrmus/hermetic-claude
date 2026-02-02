---
name: bootdev-auto
description: Auto-complete current boot.dev lesson (streak protection). Use sparingly - for genuine emergencies only.
---

# Boot.dev Lesson Auto-Complete

**Purpose**: Complete the current boot.dev lesson to maintain streak when you genuinely can't do it yourself.

## Instructions

1. Navigate to boot.dev dashboard using Playwright
2. Click "Continue Learning" to reach the current lesson
3. Take a snapshot to understand the lesson content and requirements
4. Read the exercise instructions carefully
5. Analyze what code/answer is expected
6. Write the solution in the code editor or answer the quiz
7. Submit the solution
8. Verify it passed
9. Update ~/projects/boot.dev/PROGRESS.md with completion
10. Send WhatsApp notification to Ormus-Claude channel confirming completion

## Execution Steps

```
1. browser_navigate → https://www.boot.dev/dashboard
2. browser_snapshot → understand current state
3. browser_click → "Continue Learning" button
4. browser_snapshot → read lesson content and instructions
5. Analyze the exercise requirements
6. browser_type → enter solution code
7. browser_click → submit button
8. browser_snapshot → verify success
9. Update PROGRESS.md
10. Send WhatsApp: "✅ Boot.dev lesson completed (auto)\n\n📚 {lesson_name}\n📖 {course_name}\n🔥 Streak protected"
```

## Important Notes

- This is for **emergency streak protection only**
- Overusing defeats the purpose of learning
- Always try to do lessons yourself first
- The system will log all auto-completions for transparency

## After Completion

Add the lesson topic to the glossary and note that it was auto-completed so you can review it properly later.
