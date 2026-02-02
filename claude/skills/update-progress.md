---
name: update-progress
description: Update learning progress across all platforms
---

# Update Learning Progress

Interactively update progress for boot.dev and TryHackMe.

## Steps

1. **Ask what was completed today**:
   - boot.dev lessons/courses
   - TryHackMe rooms/paths
   - LeetCode problems

2. **Update relevant files**:
   - `~/projects/boot.dev/PROGRESS.md`
   - `~/projects/tryhackme/PROGRESS.md`

3. **Add to weekly log** in each progress file

4. **Check for milestones** reached

5. **Provide summary** of today's learning

## Usage

```
/update-progress
```

## Example Flow

```
User: /update-progress

Claude: What did you complete today?

User: 3 boot.dev lessons (Linux Ch2), 1 THM room (Nmap)

Claude: Updated progress:
- boot.dev: Linux course now 40% (was 33%)
- TryHackMe: 1 room added
- Weekly total: 5 lessons, 2 rooms

Milestone check: 5 more rooms to "10 rooms completed" milestone!
```
