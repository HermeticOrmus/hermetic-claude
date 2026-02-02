---
description: Clean up project files, dependencies, and artifacts
---

# Clean Project

Help me clean up this project and remove unnecessary files.

## Cleanup Tasks

### 1. Dependencies Cleanup

**Node.js**:
```bash
rm -rf node_modules
rm package-lock.json
npm install
```

**Python**:
```bash
rm -rf venv __pycache__ *.pyc
pip install -r requirements.txt
```

### 2. Build Artifacts

Remove generated files:
- dist/
- build/
- out/
- target/
- *.o, *.so, *.dylib
- Compiled files

### 3. Cache & Temp Files

Clean up:
- .cache/
- .tmp/
- *.log files
- Coverage reports
- Test artifacts

### 4. IDE Files (if not in .gitignore)

- .vscode/ (if not shared)
- .idea/
- *.swp, *.swo
- .DS_Store
- Thumbs.db

### 5. Git Cleanup

**Untracked files**:
```bash
git clean -n  # Dry run
git clean -fd # Actually clean
```

**Old branches**:
```bash
git branch --merged | grep -v "main" | xargs git branch -d
```

**Large files**:
```bash
git rev-list --objects --all | \
  git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' | \
  awk '/^blob/ {print substr($0,6)}' | sort --numeric-sort --key=2 | tail -20
```

### 6. Docker Cleanup (if using)

```bash
docker system prune -a
docker volume prune
```

### 7. System Cache

**npm**:
```bash
npm cache clean --force
```

**pip**:
```bash
pip cache purge
```

### 8. Disk Space Check

Before and after:
```bash
du -sh .
df -h
```

### 9. What NOT to Delete

Preserve:
- Source code
- Configuration files (unless regenerating)
- Documentation
- Tests
- .git directory
- .env files (though they're usually in .gitignore)

### 10. Verification

After cleanup:
- Reinstall dependencies
- Run tests
- Build project
- Verify everything still works

Help me safely clean up this project!
