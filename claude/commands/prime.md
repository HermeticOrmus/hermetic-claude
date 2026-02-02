# Prime Context for Current Project

Load essential project context quickly at the start of any session.

## Purpose

Eliminates "cold start" problem - gives Claude immediate understanding of:
- What project this is
- How it's structured
- What tools/frameworks are used
- Key files and their purposes
- Current state

## What It Does

Systematically loads project context in optimal order:

1. **Project identity** - README.md, package info
2. **Structure** - Directory tree (3 levels deep)
3. **Configuration** - Package manager files
4. **Key source files** - Main entry points
5. **This file** - CLAUDE.md for project-specific guidance

## Implementation

```bash
#!/bin/bash

echo "🔄 Priming project context..."
echo ""

# 1. Project Identity
echo "📋 PROJECT IDENTITY"
echo "==================="
if [ -f README.md ]; then
    echo "Reading README.md..."
    cat README.md | head -50
    echo ""
fi

# 2. Directory Structure
echo "📁 DIRECTORY STRUCTURE"
echo "======================"
echo "Project tree (3 levels):"
if command -v tree &> /dev/null; then
    tree -L 3 -I 'node_modules|venv|__pycache__|.git|dist|build|target' .
else
    echo "Warning: 'tree' not installed. Using find instead:"
    find . -maxdepth 3 -type d -not -path '*/\.*' -not -path '*/node_modules/*' -not -path '*/venv/*' | head -30
fi
echo ""

# 3. Package Configuration
echo "📦 PACKAGE CONFIGURATION"
echo "========================"

# Node.js
if [ -f package.json ]; then
    echo "Found: package.json"
    cat package.json
    echo ""
fi

# Python (Poetry)
if [ -f pyproject.toml ]; then
    echo "Found: pyproject.toml"
    cat pyproject.toml
    echo ""
fi

# Python (pip)
if [ -f requirements.txt ]; then
    echo "Found: requirements.txt"
    cat requirements.txt | head -20
    echo ""
fi

# Rust
if [ -f Cargo.toml ]; then
    echo "Found: Cargo.toml"
    cat Cargo.toml
    echo ""
fi

# Go
if [ -f go.mod ]; then
    echo "Found: go.mod"
    cat go.mod
    echo ""
fi

# 4. Key Source Files
echo "🔑 KEY SOURCE FILES"
echo "==================="

# Find main entry points
if [ -d src ]; then
    echo "Source directory structure:"
    ls -la src/ | head -20
    echo ""

    # Common entry points
    for file in src/index.js src/index.ts src/main.py src/main.rs src/main.go; do
        if [ -f "$file" ]; then
            echo "Entry point: $file (first 20 lines)"
            head -20 "$file"
            echo ""
        fi
    done
fi

# 5. CLAUDE.md
echo "🤖 CLAUDE.md GUIDANCE"
echo "====================="
if [ -f CLAUDE.md ]; then
    echo "Reading CLAUDE.md..."
    cat CLAUDE.md | head -100
    echo ""
fi

# 6. Git Status (if git repo)
if [ -d .git ]; then
    echo "📊 GIT STATUS"
    echo "============="
    echo "Current branch:"
    git branch --show-current
    echo ""
    echo "Recent commits (last 5):"
    git log --oneline -5
    echo ""
    echo "Working tree status:"
    git status --short
    echo ""
fi

# Summary
echo "✅ CONTEXT PRIMED"
echo "================="
echo "Project is now loaded into context."
echo ""
echo "Summary:"
echo "- Project: $(basename $(pwd))"
echo "- Type: $(if [ -f package.json ]; then echo "Node.js"; elif [ -f pyproject.toml ]; then echo "Python"; elif [ -f Cargo.toml ]; then echo "Rust"; elif [ -f go.mod ]; then echo "Go"; else echo "Unknown"; fi)"
echo "- Structure understood: Yes"
echo "- Ready to work: Yes"
echo ""
echo "What would you like to work on?"
```

## When to Use

**Use at start of EVERY session:**
- Beginning of work day
- Switching between projects
- After break/interruption
- When context feels "cold"

**Especially important for:**
- Complex projects with many files
- Projects you haven't worked on recently
- Unfamiliar codebases
- When you need quick orientation

## Related Commands

- `/context-deep` - More comprehensive context loading (architecture docs, tests)
- `/context-terminology` - Load domain-specific vocabulary
- `/analyze-project` - Deep analysis of project structure and patterns

## Philosophy Alignment

**Mentalism**: Prime consciousness with project intention before acting
**Rhythm**: Start each session with consistent orientation ritual
**Correspondence**: Structure context load to mirror mental model formation

## Notes

- Run this **before** asking Claude to do any work
- Takes 5-10 seconds but saves 5-10 minutes of confusion
- Can be run multiple times (harmless, refreshes context)
- Output is verbose by design - gives Claude rich context

## Example Usage

```bash
# Start of day
$ /prime
🔄 Priming project context...
[... loads all context ...]
✅ CONTEXT PRIMED
Project: my-awesome-app
Type: Node.js
Ready to work: Yes

# Now Claude knows everything about the project
$ "Add a new user authentication feature"
# Claude can now work effectively with full context
```

## Tips

- If project has unusual structure, update this command
- Add project-specific context loading as needed
- Combine with `/context-deep` for architecture work
- Use output to verify context loaded correctly
