---
name: thm-automation
description: TryHackMe automation - sync progress, generate flashcards, room notes
---

# TryHackMe Automation

Full automation for TryHackMe learning management.

## Commands

### Sync Progress
```
/thm-sync
```
Scrape TryHackMe profile and update PROGRESS.md with latest stats.
Sends WhatsApp notification with progress summary.

### Generate Flashcards
```
/thm-flashcards <room-slug>
```
Generate Anki-ready flashcards from a room's Q&A.

### Create Room Notes
```
/thm-notes <room-slug>
```
Create a structured writeup template for a room.

### Login
```
/thm-login
```
Open browser for manual login and save session for future automation.

### Capture Room
```
/thm-capture
```
Capture Q&A from the current room in an open browser.

## Automation Directory

All automation code lives in: `~/projects/tryhackme/automation/`

```bash
# Run directly
cd ~/projects/tryhackme/automation
npm run sync
npm run flashcards -- linux-fundamentals-1
npm run notes -- networking-concepts
```

## Integration

The automation integrates with:
- **PROGRESS.md** - Auto-updates stats, streak, rooms completed
- **flashcards/** - Generates Anki-compatible flashcard files
- **rooms/** - Creates structured room writeup templates
- **WhatsApp** - Sends notifications via MCP on sync

## Example Workflow

1. Complete a room on TryHackMe
2. Run `/thm-sync` to update progress
3. Run `/thm-flashcards <room>` to generate flashcards
4. Run `/thm-notes <room>` to create writeup template
5. Ormus gets WhatsApp notification with progress

## Quick Stats

To check current progress without syncing:
```bash
cat ~/projects/tryhackme/PROGRESS.md | head -20
```
