#!/bin/bash
# Enhanced Post Tool Use Hook - Highly Autonomous
# Runs after each tool is used

# Read hook input (contains tool info)
HOOK_INPUT=$(cat)

# Extract tool name
TOOL_NAME=$(echo "$HOOK_INPUT" | grep -o '"tool_name":"[^"]*"' | cut -d'"' -f4)

# Ensure log directory exists
mkdir -p ~/.claude/logs

# Log tool usage
echo "$(date '+%Y-%m-%d %H:%M:%S') - Tool used: $TOOL_NAME" >> ~/.claude/logs/tools.log

# ============================================
# AUTO-FORMATTING AFTER FILE CHANGES
# ============================================
if [ "$TOOL_NAME" = "Edit" ] || [ "$TOOL_NAME" = "Write" ]; then
    FILE_PATH=$(echo "$HOOK_INPUT" | grep -o '"file_path":"[^"]*"' | cut -d'"' -f4)

    if [ -n "$FILE_PATH" ] && [ -f "$FILE_PATH" ]; then
        # Auto-format based on file type
        case "$FILE_PATH" in
            *.js|*.jsx|*.ts|*.tsx|*.json|*.css|*.html)
                if command -v prettier &> /dev/null; then
                    prettier --write "$FILE_PATH" 2>/dev/null
                    echo "$(date '+%Y-%m-%d %H:%M:%S') - Auto-formatted: $FILE_PATH" >> ~/.claude/logs/auto-format.log
                fi
                ;;
            *.py)
                if command -v black &> /dev/null; then
                    black "$FILE_PATH" 2>/dev/null
                    echo "$(date '+%Y-%m-%d %H:%M:%S') - Auto-formatted (black): $FILE_PATH" >> ~/.claude/logs/auto-format.log
                elif command -v autopep8 &> /dev/null; then
                    autopep8 --in-place "$FILE_PATH" 2>/dev/null
                    echo "$(date '+%Y-%m-%d %H:%M:%S') - Auto-formatted (autopep8): $FILE_PATH" >> ~/.claude/logs/auto-format.log
                fi
                ;;
            *.sh)
                if command -v shfmt &> /dev/null; then
                    shfmt -w "$FILE_PATH" 2>/dev/null
                    echo "$(date '+%Y-%m-%d %H:%M:%S') - Auto-formatted (shfmt): $FILE_PATH" >> ~/.claude/logs/auto-format.log
                fi
                ;;
            *.go)
                if command -v gofmt &> /dev/null; then
                    gofmt -w "$FILE_PATH" 2>/dev/null
                    echo "$(date '+%Y-%m-%d %H:%M:%S') - Auto-formatted (gofmt): $FILE_PATH" >> ~/.claude/logs/auto-format.log
                fi
                ;;
            *.rs)
                if command -v rustfmt &> /dev/null; then
                    rustfmt "$FILE_PATH" 2>/dev/null
                    echo "$(date '+%Y-%m-%d %H:%M:%S') - Auto-formatted (rustfmt): $FILE_PATH" >> ~/.claude/logs/auto-format.log
                fi
                ;;
        esac

        # Auto-lint and fix common issues
        case "$FILE_PATH" in
            *.js|*.jsx|*.ts|*.tsx)
                if command -v eslint &> /dev/null && [ -f "$(dirname "$FILE_PATH")/.eslintrc"* ] 2>/dev/null; then
                    eslint --fix "$FILE_PATH" 2>/dev/null
                    echo "$(date '+%Y-%m-%d %H:%M:%S') - Auto-linted: $FILE_PATH" >> ~/.claude/logs/auto-lint.log
                fi
                ;;
            *.py)
                if command -v ruff &> /dev/null; then
                    ruff check --fix "$FILE_PATH" 2>/dev/null
                    echo "$(date '+%Y-%m-%d %H:%M:%S') - Auto-linted (ruff): $FILE_PATH" >> ~/.claude/logs/auto-lint.log
                fi
                ;;
        esac

        # ============================================
        # AUTO-GIT ADD AFTER FILE CHANGES
        # ============================================
        # Find the git root directory
        FILE_DIR=$(dirname "$FILE_PATH")
        GIT_ROOT=$(cd "$FILE_DIR" && git rev-parse --show-toplevel 2>/dev/null)

        if [ -n "$GIT_ROOT" ] && [ -d "$GIT_ROOT/.git" ]; then
            # Auto-add the file to git
            (cd "$GIT_ROOT" && git add "$FILE_PATH" 2>/dev/null)
            echo "$(date '+%Y-%m-%d %H:%M:%S') - Auto-added to git: $FILE_PATH" >> ~/.claude/logs/auto-git.log
        fi
    fi
fi

# ============================================
# AUTO-TEST AFTER CODE CHANGES
# ============================================
if [ "$TOOL_NAME" = "Edit" ] || [ "$TOOL_NAME" = "Write" ]; then
    FILE_PATH=$(echo "$HOOK_INPUT" | grep -o '"file_path":"[^"]*"' | cut -d'"' -f4)

    if [ -n "$FILE_PATH" ] && [ -f "$FILE_PATH" ]; then
        FILE_DIR=$(dirname "$FILE_PATH")

        # Find project root (look for package.json, pyproject.toml, Cargo.toml, go.mod, etc.)
        PROJECT_ROOT=""
        CURRENT_DIR="$FILE_DIR"

        while [ "$CURRENT_DIR" != "/" ]; do
            if [ -f "$CURRENT_DIR/package.json" ] || \
               [ -f "$CURRENT_DIR/pyproject.toml" ] || \
               [ -f "$CURRENT_DIR/Cargo.toml" ] || \
               [ -f "$CURRENT_DIR/go.mod" ] || \
               [ -f "$CURRENT_DIR/Makefile" ]; then
                PROJECT_ROOT="$CURRENT_DIR"
                break
            fi
            CURRENT_DIR=$(dirname "$CURRENT_DIR")
        done

        if [ -n "$PROJECT_ROOT" ]; then
            # Run tests based on project type (in background to not slow down workflow)
            (
                cd "$PROJECT_ROOT"

                # Node.js projects
                if [ -f "package.json" ]; then
                    if grep -q '"test":' package.json 2>/dev/null; then
                        npm test --silent >> ~/.claude/logs/auto-test.log 2>&1 &
                        echo "$(date '+%Y-%m-%d %H:%M:%S') - Auto-test triggered (npm) for: $FILE_PATH" >> ~/.claude/logs/auto-test.log
                    fi
                fi

                # Python projects
                if [ -f "pyproject.toml" ] || [ -f "pytest.ini" ] || [ -f "setup.py" ]; then
                    if command -v pytest &> /dev/null; then
                        pytest --quiet >> ~/.claude/logs/auto-test.log 2>&1 &
                        echo "$(date '+%Y-%m-%d %H:%M:%S') - Auto-test triggered (pytest) for: $FILE_PATH" >> ~/.claude/logs/auto-test.log
                    fi
                fi

                # Go projects
                if [ -f "go.mod" ]; then
                    go test ./... >> ~/.claude/logs/auto-test.log 2>&1 &
                    echo "$(date '+%Y-%m-%d %H:%M:%S') - Auto-test triggered (go) for: $FILE_PATH" >> ~/.claude/logs/auto-test.log
                fi

                # Rust projects
                if [ -f "Cargo.toml" ]; then
                    cargo test --quiet >> ~/.claude/logs/auto-test.log 2>&1 &
                    echo "$(date '+%Y-%m-%d %H:%M:%S') - Auto-test triggered (cargo) for: $FILE_PATH" >> ~/.claude/logs/auto-test.log
                fi
            ) &
        fi
    fi
fi

# ============================================
# AUTO-DOCUMENTATION GENERATION
# ============================================
if [ "$TOOL_NAME" = "Edit" ] || [ "$TOOL_NAME" = "Write" ]; then
    FILE_PATH=$(echo "$HOOK_INPUT" | grep -o '"file_path":"[^"]*"' | cut -d'"' -f4)

    # Generate docs for exported functions/classes
    if [ -n "$FILE_PATH" ]; then
        case "$FILE_PATH" in
            *.ts|*.js)
                # Could integrate with TypeDoc, JSDoc, etc.
                # Placeholder for future enhancement
                ;;
            *.py)
                # Could integrate with Sphinx, pdoc, etc.
                # Placeholder for future enhancement
                ;;
        esac
    fi
fi

# Exit successfully
exit 0
