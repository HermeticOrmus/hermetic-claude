---
name: bootdev
description: Boot.dev learning platform helper - complete lessons, track progress, manage glossary, and review learning. Use for streak protection, lesson auto-complete, or study sessions.
---

# Boot.dev Learning Assistant

**Purpose**: Comprehensive helper for boot.dev learning platform - complete lessons, track progress, review concepts, and maintain streaks.

## Quick Commands

| Command | Description |
|---------|-------------|
| `/bootdev` | Show dashboard status and next lesson |
| `/bootdev complete` | Auto-complete current lesson |
| `/bootdev progress` | Show detailed progress report |
| `/bootdev review` | Start concept review session |
| `/bootdev brief` | Morning briefing for today's learning |

## Subcommands

### /bootdev (default)
Show current status:
1. Read PROGRESS.md for current state
2. Navigate to boot.dev dashboard
3. Report: current lesson, streak status, level, daily XP

### /bootdev complete
Auto-complete the current lesson:
1. Navigate to boot.dev dashboard
2. Click "Continue Learning"
3. Analyze lesson type and requirements
4. Complete the lesson (quiz/code/reading)
5. Update PROGRESS.md
6. Update glossary if new concepts
7. Send WhatsApp notification

### /bootdev progress
Detailed progress report:
1. Read PROGRESS.md
2. Navigate to dashboard
3. Report all courses, chapters, completion percentages
4. Calculate path completion
5. Show streak and level info

### /bootdev review
Interactive review session:
1. Read glossary files
2. Identify terms due for review (spaced repetition)
3. Quiz on 5-10 terms
4. Update review dates
5. Suggest concepts to reinforce

### /bootdev brief
Morning learning briefing:
1. Check current lesson topic
2. Preview today's concepts
3. Review yesterday's learning
4. Set daily goal
5. Send to WhatsApp

## File Locations

| File | Purpose |
|------|---------|
| `~/projects/boot.dev/PROGRESS.md` | Progress tracking |
| `~/projects/boot.dev/glossary/` | Term definitions |
| `~/projects/boot.dev/platform-analysis/` | Platform documentation |
| `~/.claude/commands/bootdev-*.md` | Sub-skills |

## Lesson Completion Protocol

### Quiz Lessons
```
1. Read question
2. Analyze options
3. Click correct answer
4. Click "Next" to proceed
```

### Code Lessons
```
1. Read instructions
2. Analyze expected solution
3. Type code in editor
4. Submit and verify tests pass
5. Click "Next" to proceed
```

### Reading Lessons
```
1. Read content
2. Answer quiz if present
3. Click "Next" to proceed
```

## Technical Notes

### Browser Automation
- Use Playwright MCP for boot.dev interaction
- Dashboard: https://www.boot.dev/dashboard
- "Continue Learning" button starts current lesson
- Snapshot reveals lesson type and content

### Editor Quirks
- Multiple textboxes may exist (main.py, test files)
- Use `.first()` to select primary editor
- Use `fill()` to replace entire content (avoids indentation issues)
- Reset lesson if editor state becomes corrupted

### Progress Tracking
Update PROGRESS.md after each session:
- Current lesson number
- Chapter progress
- XP gained
- Streak status
- Level changes

## Platform Knowledge

### Course Structure
```
Path: Back-end Developer (Python & Go)
├── Learn to Code in Python (179 lessons) - COMPLETED
├── Learn Linux (66 lessons) - IN PROGRESS
├── Learn Git (75 lessons)
├── Build a Bookbot (15 lessons)
├── Learn OOP (61 lessons)
├── Build Asteroids (19 lessons)
├── Learn FP (88 lessons)
├── Build AI Agent (19 lessons)
├── Learn DSA (175 lessons)
├── Build Static Site Generator (28 lessons)
├── Learn Memory Management in C (102 lessons)
├── First Personal Project (4 lessons)
├── Learn Go (188 lessons)
├── Learn HTTP Clients (83 lessons)
├── Build Pokedex (12 lessons)
├── Learn SQL (124 lessons)
├── Build Blog Aggregator (18 lessons)
├── Learn HTTP Servers (69 lessons)
├── Learn File Servers & CDNs (45 lessons)
├── Learn Docker (43 lessons)
├── Learn Pub/Sub RabbitMQ (49 lessons)
├── Capstone Project (3 lessons)
└── Learn Job Search (52 lessons)
Total: ~1500 lessons
```

### Gamification
- **Streak**: Daily lesson requirement, protectable with frozen flames
- **XP**: Earned per lesson (40-200+), bonuses for course completion
- **Level**: Titles like "Acolyte" (30), increases with XP
- **Leagues**: Competitive 25-person groups, ~23 day seasons

### AI Assistant (Boots)
- Context-aware help within lessons
- Voice chat option available
- Free help in some courses, costs gems in others
- Personality changes per course

## Integration Points

### WhatsApp Notifications
Send to Ormus-Claude channel after:
- Course completion
- Major milestone
- Streak protection needed
- Session summary

### Core Memory
Store in memory after:
- New concepts learned
- Platform insights
- Progress milestones

### Glossary Updates
Add to appropriate glossary file:
- New terms from lessons
- Commands learned (Linux)
- Patterns discovered (Python/Go)

## Error Handling

### Common Issues

1. **Indentation errors in code editor**
   - Solution: Use `fill()` to replace entire file content
   - Don't try to append lines individually

2. **Quiz not advancing after answer**
   - Solution: Click "Next" link instead of waiting

3. **Multiple textboxes selected**
   - Solution: Use `.first()` selector

4. **Streak about to expire**
   - Priority: Complete any lesson immediately
   - Fallback: Purchase frozen flame if available

### Recovery
If browser state becomes corrupted:
1. Reset lesson (if available)
2. Navigate to dashboard
3. Click "Continue Learning"
4. Retry operation

## Example Workflows

### Daily Learning Session
```
1. /bootdev brief - Get morning briefing
2. Navigate to boot.dev
3. Complete 3-5 lessons
4. /bootdev progress - Check status
5. /bootdev-glossary add <terms> - Save new concepts
6. Update PROGRESS.md
```

### Streak Emergency
```
1. /bootdev complete - Auto-complete one lesson
2. Verify streak protected
3. Send WhatsApp notification
4. Schedule proper learning session
```

### Review Session
```
1. /bootdev review - Start review
2. Answer term quizzes
3. Identify weak areas
4. Practice in Training Grounds
5. Update glossary with clarifications
```

---

*Skill created: 2025-12-20*
*Platform: boot.dev*
*Path: Back-end Developer (Python & Go)*
