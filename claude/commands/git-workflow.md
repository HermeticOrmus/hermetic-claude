---
description: Guide through complete git workflow for a feature or fix
---

# Git Workflow

Guide me through a proper git workflow for this change.

## Workflow Steps

### 1. Start Fresh
```bash
# Ensure main is up to date
git checkout main
git pull origin main

# Check for uncommitted changes
git status
```

### 2. Create Feature Branch
```bash
# Create and checkout branch
git checkout -b feature/descriptive-name

# Or for fixes
git checkout -b fix/descriptive-name
```

### 3. Make Changes
- Work on your feature/fix
- Test as you go
- Keep commits focused

### 4. Commit Work
```bash
# Stage changes
git add <files>

# Check what's staged
git diff --staged

# Commit with good message
git commit -m "type(scope): description"
```

**Commit Message Format**:
- feat: New feature
- fix: Bug fix
- docs: Documentation
- style: Formatting
- refactor: Code restructure
- test: Add tests
- chore: Maintenance

### 5. Keep Updated
```bash
# Regularly sync with main
git fetch origin
git rebase origin/main

# Resolve conflicts if any
```

### 6. Clean Up Commits (Before PR)
```bash
# Interactive rebase to clean history
git rebase -i HEAD~5

# Options: pick, squash, fixup, reword
```

### 7. Push to Remote
```bash
# First push
git push -u origin feature/branch-name

# Subsequent pushes
git push
```

### 8. Create Pull Request
- Go to GitHub/GitLab
- Create PR from your branch
- Fill in description
- Request reviewers

### 9. Address Review Feedback
```bash
# Make changes
git add <files>
git commit -m "Address review feedback"
git push
```

### 10. Merge
```bash
# After approval, merge (usually done via web UI)
# Then cleanup
git checkout main
git pull origin main
git branch -d feature/branch-name
```

## Best Practices

- Commit early and often
- Write meaningful commit messages
- Keep commits atomic (one logical change)
- Rebase to keep history clean
- Test before pushing
- Update branch regularly from main
- Review your own PR first

Guide me through each step for this specific change.
