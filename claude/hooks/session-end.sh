#!/bin/bash
# Enhanced Session End Hook - Highly Autonomous
# Runs when a Claude Code session ends

# Read hook input
HOOK_INPUT=$(cat)

# Extract current directory
CURRENT_DIR=$(pwd)

# Ensure log directory exists
mkdir -p ~/.claude/logs

# Log session end
echo "$(date '+%Y-%m-%d %H:%M:%S') - Session ended in $CURRENT_DIR" >> ~/.claude/logs/sessions.log

# ============================================
# AUTO-COMMIT UNCOMMITTED CHANGES
# ============================================
if [ -d "$CURRENT_DIR/.git" ]; then
    # Check if there are uncommitted changes
    if ! git diff-index --quiet HEAD -- 2>/dev/null || [ -n "$(git ls-files --others --exclude-standard)" ]; then

        echo "$(date '+%Y-%m-%d %H:%M:%S') - Uncommitted changes detected, creating auto-commit" >> ~/.claude/logs/auto-commit.log

        # Generate smart commit message based on changes
        COMMIT_MSG="Auto-commit: Session end $(date '+%Y-%m-%d %H:%M')"

        # Analyze what changed
        MODIFIED_FILES=$(git diff --name-only --cached 2>/dev/null | wc -l)
        UNSTAGED_FILES=$(git diff --name-only 2>/dev/null | wc -l)
        UNTRACKED_FILES=$(git ls-files --others --exclude-standard | wc -l)

        # Build more descriptive commit message
        CHANGES=""
        if [ "$MODIFIED_FILES" -gt 0 ]; then
            CHANGES="${CHANGES}Modified: $MODIFIED_FILES files. "
        fi
        if [ "$UNSTAGED_FILES" -gt 0 ]; then
            CHANGES="${CHANGES}Updated: $UNSTAGED_FILES files. "
        fi
        if [ "$UNTRACKED_FILES" -gt 0 ]; then
            CHANGES="${CHANGES}New: $UNTRACKED_FILES files. "
        fi

        # Get file types changed
        FILE_TYPES=$(git diff --name-only --cached HEAD 2>/dev/null; git diff --name-only 2>/dev/null | awk -F. '{if (NF>1) print $NF}' | sort -u | head -3 | tr '\n' ',' | sed 's/,$//')

        if [ -n "$FILE_TYPES" ]; then
            COMMIT_MSG="Auto-commit: $CHANGES($FILE_TYPES)"
        elif [ -n "$CHANGES" ]; then
            COMMIT_MSG="Auto-commit: $CHANGES"
        fi

        # Add all changes
        git add -A 2>/dev/null

        # Create commit with detailed message
        git commit -m "$COMMIT_MSG" -m "Automated commit created at session end." -m "Generated with Claude Code" 2>/dev/null

        if [ $? -eq 0 ]; then
            echo "$(date '+%Y-%m-%d %H:%M:%S') - Auto-commit successful: $COMMIT_MSG" >> ~/.claude/logs/auto-commit.log

            # Optionally auto-push if on a feature branch (not main/master)
            CURRENT_BRANCH=$(git branch --show-current 2>/dev/null)
            if [ "$CURRENT_BRANCH" != "main" ] && [ "$CURRENT_BRANCH" != "master" ] && [ -n "$CURRENT_BRANCH" ]; then
                # Check if branch has a remote
                if git rev-parse --abbrev-ref --symbolic-full-name @{u} &>/dev/null; then
                    git push 2>/dev/null
                    if [ $? -eq 0 ]; then
                        echo "$(date '+%Y-%m-%d %H:%M:%S') - Auto-pushed to remote: $CURRENT_BRANCH" >> ~/.claude/logs/auto-commit.log
                    fi
                fi
            fi
        fi
    fi
fi

# ============================================
# PROJECT CLEANUP
# ============================================

# Clean temporary files
find "$CURRENT_DIR" -maxdepth 2 -name "*.tmp" -mtime +1 -delete 2>/dev/null
find "$CURRENT_DIR" -maxdepth 2 -name "*.bak" -mtime +1 -delete 2>/dev/null
find "$CURRENT_DIR" -maxdepth 2 -name "*~" -delete 2>/dev/null

# Clean Node.js projects
if [ -f "$CURRENT_DIR/package.json" ]; then
    # Remove old test coverage
    if [ -d "$CURRENT_DIR/coverage" ]; then
        find "$CURRENT_DIR/coverage" -type f -mtime +7 -delete 2>/dev/null
    fi

    # Clean old build artifacts
    if [ -d "$CURRENT_DIR/dist" ]; then
        # Only clean if there's a build script (so we don't delete important dist files)
        if grep -q '"build":' "$CURRENT_DIR/package.json" 2>/dev/null; then
            find "$CURRENT_DIR/dist" -type f -mtime +7 -delete 2>/dev/null
        fi
    fi
fi

# Clean Python projects
if [ -f "$CURRENT_DIR/pyproject.toml" ] || [ -f "$CURRENT_DIR/setup.py" ]; then
    # Remove __pycache__ older than 7 days
    find "$CURRENT_DIR" -type d -name "__pycache__" -mtime +7 -exec rm -rf {} + 2>/dev/null

    # Remove .pyc files
    find "$CURRENT_DIR" -type f -name "*.pyc" -delete 2>/dev/null

    # Clean pytest cache
    if [ -d "$CURRENT_DIR/.pytest_cache" ]; then
        find "$CURRENT_DIR/.pytest_cache" -type f -mtime +7 -delete 2>/dev/null
    fi
fi

# ============================================
# CLAUDE CODE MAINTENANCE
# ============================================

# Archive old session snapshots
SNAPSHOT_DIR=~/.claude/shell-snapshots
if [ -d "$SNAPSHOT_DIR" ]; then
    SNAPSHOT_COUNT=$(find "$SNAPSHOT_DIR" -type f | wc -l)
    if [ "$SNAPSHOT_COUNT" -gt 50 ]; then
        # Keep only the 30 most recent snapshots
        find "$SNAPSHOT_DIR" -type f -printf '%T@ %p\n' | sort -rn | tail -n +31 | cut -d' ' -f2- | xargs rm -f 2>/dev/null
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Cleaned old shell snapshots" >> ~/.claude/logs/maintenance.log
    fi
fi

# Rotate large log files (>10MB)
LOG_DIR=~/.claude/logs
if [ -d "$LOG_DIR" ]; then
    find "$LOG_DIR" -type f -name "*.log" -size +10M -exec sh -c 'mv "$1" "$1.old" && touch "$1"' _ {} \; 2>/dev/null
fi

# Compact history if it's getting large (>50MB)
HISTORY_FILE=~/.claude/history.jsonl
if [ -f "$HISTORY_FILE" ]; then
    HISTORY_SIZE=$(stat -f%z "$HISTORY_FILE" 2>/dev/null || stat -c%s "$HISTORY_FILE" 2>/dev/null || echo "0")
    if [ "$HISTORY_SIZE" -gt 52428800 ]; then
        # Keep only last 10000 lines
        tail -10000 "$HISTORY_FILE" > "${HISTORY_FILE}.tmp"
        mv "${HISTORY_FILE}.tmp" "$HISTORY_FILE"
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Compacted history file" >> ~/.claude/logs/maintenance.log
    fi
fi

# ============================================
# SESSION STATISTICS
# ============================================

# Log session duration (if session start time is available)
SESSION_LOG=~/.claude/logs/sessions.log
if [ -f "$SESSION_LOG" ]; then
    LAST_START=$(grep "Session started" "$SESSION_LOG" | tail -1)
    if [ -n "$LAST_START" ]; then
        # Could calculate session duration here
        SESSIONS_TODAY=$(grep "$(date '+%Y-%m-%d')" "$SESSION_LOG" | grep -c "Session started")
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Sessions today: $SESSIONS_TODAY" >> ~/.claude/logs/sessions.log
    fi
fi

# ============================================
# PROJECT-SPECIFIC END TASKS
# ============================================

# Stop development servers if running (to prevent port conflicts)
if [ -f "$CURRENT_DIR/package.json" ]; then
    # Check for common dev server processes
    pkill -f "webpack-dev-server" 2>/dev/null
    pkill -f "vite.*--.*$CURRENT_DIR" 2>/dev/null
    pkill -f "next dev.*$CURRENT_DIR" 2>/dev/null
fi

# ============================================
# BACKUP IMPORTANT FILES
# ============================================

# Create daily backup of .claude directory (once per day)
BACKUP_MARKER=~/.claude/logs/last-backup
if [ ! -f "$BACKUP_MARKER" ] || [ $(( $(date +%s) - $(stat -c %Y "$BACKUP_MARKER" 2>/dev/null || echo 0) )) -gt 86400 ]; then
    (
        BACKUP_DIR=~/.claude-backups/$(date '+%Y-%m-%d')
        mkdir -p "$BACKUP_DIR"

        # Backup settings and configuration
        cp ~/.claude/settings.json "$BACKUP_DIR/" 2>/dev/null
        cp ~/.claude/settings.local.json "$BACKUP_DIR/" 2>/dev/null
        cp ~/.claude/CLAUDE.md "$BACKUP_DIR/" 2>/dev/null
        cp ~/.claude/mcp.json "$BACKUP_DIR/" 2>/dev/null
        cp -r ~/.claude/memory "$BACKUP_DIR/" 2>/dev/null
        cp -r ~/.claude/commands "$BACKUP_DIR/" 2>/dev/null
        cp -r ~/.claude/agents "$BACKUP_DIR/" 2>/dev/null

        # Remove backups older than 30 days
        find ~/.claude-backups -type d -mtime +30 -exec rm -rf {} + 2>/dev/null

        touch "$BACKUP_MARKER"
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Created daily backup" >> ~/.claude/logs/maintenance.log
    ) &
fi

# ============================================
# COMPLETION MESSAGE
# ============================================

echo "$(date '+%Y-%m-%d %H:%M:%S') - Session cleanup complete" >> ~/.claude/logs/sessions.log

# Output friendly message
echo "Session ended. Workspace cleaned and organized. Thanks for using Claude Code!"

# Exit successfully
exit 0
