#!/bin/bash
# Enhanced Session Start Hook - Highly Autonomous
# Runs when a new Claude Code session starts

# Read hook input (contains session info)
HOOK_INPUT=$(cat)

# Extract current directory
CURRENT_DIR=$(pwd)

# Ensure log directory exists
mkdir -p ~/.claude/logs

# Log session start
echo "$(date '+%Y-%m-%d %H:%M:%S') - Session started in $CURRENT_DIR" >> ~/.claude/logs/sessions.log

# Initialize output arrays
CONTEXT_MESSAGES=()
SYSTEM_MESSAGES=()
WARNINGS=()

# ============================================
# PROJECT DETECTION
# ============================================
PROJECT_NAME=$(basename "$CURRENT_DIR")
PROJECT_TYPE=""

# Detect project type
if [ -f "$CURRENT_DIR/package.json" ]; then
    PROJECT_TYPE="Node.js"
elif [ -f "$CURRENT_DIR/pyproject.toml" ] || [ -f "$CURRENT_DIR/setup.py" ]; then
    PROJECT_TYPE="Python"
elif [ -f "$CURRENT_DIR/Cargo.toml" ]; then
    PROJECT_TYPE="Rust"
elif [ -f "$CURRENT_DIR/go.mod" ]; then
    PROJECT_TYPE="Go"
elif [ -f "$CURRENT_DIR/pom.xml" ]; then
    PROJECT_TYPE="Java/Maven"
elif [ -f "$CURRENT_DIR/build.gradle" ]; then
    PROJECT_TYPE="Java/Gradle"
fi

if [ -n "$PROJECT_TYPE" ]; then
    CONTEXT_MESSAGES+=("📦 $PROJECT_TYPE project: $PROJECT_NAME")
fi

# ============================================
# GIT STATUS CHECKS
# ============================================
if [ -d "$CURRENT_DIR/.git" ]; then
    # Check for uncommitted changes
    if ! git diff-index --quiet HEAD -- 2>/dev/null; then
        UNCOMMITTED_COUNT=$(git status --short | wc -l)
        WARNINGS+=("⚠️  $UNCOMMITTED_COUNT uncommitted changes detected")
    fi

    # Check current branch
    CURRENT_BRANCH=$(git branch --show-current 2>/dev/null)
    if [ -n "$CURRENT_BRANCH" ]; then
        CONTEXT_MESSAGES+=("🌿 Branch: $CURRENT_BRANCH")

        # Check if branch is up to date with remote
        git fetch --quiet 2>/dev/null
        LOCAL=$(git rev-parse @{0} 2>/dev/null)
        REMOTE=$(git rev-parse @{u} 2>/dev/null)

        if [ "$LOCAL" != "$REMOTE" ]; then
            AHEAD=$(git rev-list --count @{u}..HEAD 2>/dev/null || echo "0")
            BEHIND=$(git rev-list --count HEAD..@{u} 2>/dev/null || echo "0")

            if [ "$AHEAD" -gt 0 ]; then
                CONTEXT_MESSAGES+=("↑ $AHEAD commits ahead of remote")
            fi
            if [ "$BEHIND" -gt 0 ]; then
                WARNINGS+=("⚠️  $BEHIND commits behind remote - consider pulling")
            fi
        fi
    fi

    # Check for merge conflicts
    if git status | grep -q "Unmerged paths\|both modified"; then
        WARNINGS+=("🚨 Merge conflicts detected!")
    fi
fi

# ============================================
# SYSTEM HEALTH CHECKS
# ============================================

# Check disk space
DISK_USAGE=$(df -h "$CURRENT_DIR" | awk 'NR==2 {print $5}' | sed 's/%//')
if [ "$DISK_USAGE" -gt 90 ]; then
    WARNINGS+=("⚠️  Disk space low: ${DISK_USAGE}% used")
elif [ "$DISK_USAGE" -gt 80 ]; then
    CONTEXT_MESSAGES+=("💾 Disk usage: ${DISK_USAGE}%")
fi

# Check for available updates (once per day to avoid slowdown)
UPDATE_CHECK_FILE=~/.claude/logs/last-update-check
if [ ! -f "$UPDATE_CHECK_FILE" ] || [ $(( $(date +%s) - $(stat -c %Y "$UPDATE_CHECK_FILE" 2>/dev/null || echo 0) )) -gt 86400 ]; then
    # Check for system updates (in background)
    (
        if command -v apt &> /dev/null; then
            UPDATES=$(apt list --upgradable 2>/dev/null | grep -c upgradable || echo "0")
            if [ "$UPDATES" -gt 0 ]; then
                echo "$(date '+%Y-%m-%d %H:%M:%S') - $UPDATES system updates available" >> ~/.claude/logs/system-health.log
            fi
        fi
        touch "$UPDATE_CHECK_FILE"
    ) &
fi

# Check if important services are running (for development)
if command -v systemctl &> /dev/null; then
    # Check Docker if in use
    if command -v docker &> /dev/null; then
        if ! systemctl is-active --quiet docker 2>/dev/null; then
            WARNINGS+=("⚠️  Docker service not running")
        fi
    fi

    # Check PostgreSQL if installed
    if command -v psql &> /dev/null; then
        if ! systemctl is-active --quiet postgresql 2>/dev/null; then
            CONTEXT_MESSAGES+=("ℹ️  PostgreSQL not running")
        fi
    fi
fi

# ============================================
# PROJECT-SPECIFIC CHECKS
# ============================================

# Node.js project checks
if [ -f "$CURRENT_DIR/package.json" ]; then
    # Check if node_modules exists
    if [ ! -d "$CURRENT_DIR/node_modules" ]; then
        WARNINGS+=("⚠️  node_modules missing - run 'npm install'")
    fi

    # Check for outdated dependencies (once per day)
    NPM_CHECK_FILE=~/.claude/logs/npm-check-$(echo "$CURRENT_DIR" | md5sum | cut -d' ' -f1)
    if [ ! -f "$NPM_CHECK_FILE" ] || [ $(( $(date +%s) - $(stat -c %Y "$NPM_CHECK_FILE" 2>/dev/null || echo 0) )) -gt 86400 ]; then
        (
            cd "$CURRENT_DIR"
            if command -v npm &> /dev/null; then
                OUTDATED=$(npm outdated 2>/dev/null | tail -n +2 | wc -l)
                if [ "$OUTDATED" -gt 0 ]; then
                    echo "$(date '+%Y-%m-%d %H:%M:%S') - $OUTDATED outdated npm packages in $PROJECT_NAME" >> ~/.claude/logs/dependencies.log
                fi
            fi
            touch "$NPM_CHECK_FILE"
        ) &
    fi
fi

# Python project checks
if [ -f "$CURRENT_DIR/pyproject.toml" ] || [ -f "$CURRENT_DIR/requirements.txt" ]; then
    # Check for virtual environment
    if [ -z "$VIRTUAL_ENV" ] && [ ! -d "$CURRENT_DIR/venv" ] && [ ! -d "$CURRENT_DIR/.venv" ]; then
        WARNINGS+=("⚠️  No virtual environment detected")
    fi
fi

# ============================================
# DEVELOPMENT ENVIRONMENT CHECKS
# ============================================

# Check Node.js version if in Node project
if [ -f "$CURRENT_DIR/package.json" ] && [ -f "$CURRENT_DIR/.nvmrc" ]; then
    REQUIRED_NODE=$(cat "$CURRENT_DIR/.nvmrc")
    CURRENT_NODE=$(node --version 2>/dev/null | sed 's/v//')
    if [ "$CURRENT_NODE" != "$REQUIRED_NODE" ]; then
        WARNINGS+=("⚠️  Node version mismatch: using $CURRENT_NODE, project requires $REQUIRED_NODE")
    fi
fi

# ============================================
# CLEANUP OLD ARTIFACTS
# ============================================
(
    # Clean old build artifacts (older than 7 days)
    if [ -d "$CURRENT_DIR/dist" ]; then
        find "$CURRENT_DIR/dist" -type f -mtime +7 -delete 2>/dev/null
    fi
    if [ -d "$CURRENT_DIR/build" ]; then
        find "$CURRENT_DIR/build" -type f -mtime +7 -delete 2>/dev/null
    fi

    # Clean old log files (older than 30 days)
    find ~/.claude/logs -type f -name "*.log" -mtime +30 -delete 2>/dev/null

    # Clean old shell snapshots (older than 7 days)
    find ~/.claude/shell-snapshots -type f -mtime +7 -delete 2>/dev/null
) &

# ============================================
# OUTPUT STRUCTURED RESPONSE
# ============================================

# Build JSON output
OUTPUT="{"

# Add context messages
if [ ${#CONTEXT_MESSAGES[@]} -gt 0 ]; then
    OUTPUT="$OUTPUT\"additionalContext\":["
    FIRST=true
    for msg in "${CONTEXT_MESSAGES[@]}"; do
        if [ "$FIRST" = true ]; then
            FIRST=false
        else
            OUTPUT="$OUTPUT,"
        fi
        OUTPUT="$OUTPUT{\"type\":\"text\",\"text\":\"$msg\"}"
    done
    OUTPUT="$OUTPUT]"
fi

# Add warnings as system messages
if [ ${#WARNINGS[@]} -gt 0 ]; then
    if [ ${#CONTEXT_MESSAGES[@]} -gt 0 ]; then
        OUTPUT="$OUTPUT,"
    fi
    OUTPUT="$OUTPUT\"systemMessage\":\""
    for warn in "${WARNINGS[@]}"; do
        OUTPUT="$OUTPUT$warn\n"
    done
    OUTPUT="$OUTPUT\""
fi

OUTPUT="$OUTPUT}"

# Output JSON only if we have messages
if [ ${#CONTEXT_MESSAGES[@]} -gt 0 ] || [ ${#WARNINGS[@]} -gt 0 ]; then
    echo "$OUTPUT"
fi

# Exit successfully
exit 0
