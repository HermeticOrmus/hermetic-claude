# Claude Code Hooks System

Hooks allow you to automate actions when specific events occur in Claude Code. This enables powerful workflow automation and customization.

## Available Hook Events

### SessionStart
**When**: New Claude Code session begins
**Use cases**:
- Display project context
- Check environment status
- Load session-specific settings
- Warn about uncommitted changes
- Set up development environment

### SessionEnd
**When**: Claude Code session terminates
**Use cases**:
- Save session transcripts
- Cleanup temporary files
- Archive session data
- Send notifications
- Update logs

### UserPromptSubmit
**When**: User submits a prompt
**Use cases**:
- Add automatic context (current git branch, etc.)
- Preprocess user input
- Validate prompts
- Track usage
- Load relevant files

### PreToolUse
**When**: Before a tool is executed
**Use cases**:
- Validate tool parameters
- Modify tool inputs
- Create backups
- Log tool usage
- Check permissions

### PostToolUse
**When**: After a tool completes
**Use cases**:
- Auto-format code
- Run linters
- Git auto-add
- Generate documentation
- Trigger builds/tests

### PreCompact
**When**: Before conversation is compacted
**Use cases**:
- Save important context
- Archive full history
- Extract learnings
- Generate summaries

### SubagentStop
**When**: Subagent task completes
**Use cases**:
- Process subagent results
- Trigger follow-up actions
- Log completion
- Update project state

## Hook Input Format

Hooks receive JSON input via stdin:

```json
{
  "hook_event_name": "PostToolUse",
  "tool_name": "Edit",
  "tool_input": {
    "file_path": "/path/to/file.js",
    "old_string": "...",
    "new_string": "..."
  },
  "tool_output": "...",
  "session_id": "...",
  "timestamp": "2025-10-22T15:30:00.000Z"
}
```

## Hook Output Format

Hooks can output JSON to provide additional context or messages:

```json
{
  "additionalContext": [
    {
      "type": "text",
      "text": "Context information for Claude"
    }
  ],
  "systemMessage": "Message displayed to user"
}
```

Or simple text output:
```bash
echo "Hook completed successfully"
```

## Configuration

### Project-Level Hooks
Create `.claude/hooks/settings.json` in project directory:

```json
{
  "hooks": {
    "PostToolUse": {
      "command": "bash .claude/hooks/auto-format.sh",
      "timeout": 5000
    }
  }
}
```

### Global Hooks
Already configured in `~/.claude/hooks/settings.json`

### Disable Hooks
Set in `~/.claude/settings.json`:
```json
{
  "disableAllHooks": true
}
```

## Example Hooks

### Auto-format on Save
```bash
#!/bin/bash
HOOK_INPUT=$(cat)
TOOL_NAME=$(echo "$HOOK_INPUT" | jq -r '.tool_name')

if [ "$TOOL_NAME" = "Edit" ] || [ "$TOOL_NAME" = "Write" ]; then
    FILE_PATH=$(echo "$HOOK_INPUT" | jq -r '.tool_input.file_path')

    case "$FILE_PATH" in
        *.js|*.ts)
            prettier --write "$FILE_PATH"
            ;;
        *.py)
            black "$FILE_PATH"
            ;;
    esac
fi
```

### Git Auto-commit
```bash
#!/bin/bash
HOOK_INPUT=$(cat)
TOOL_NAME=$(echo "$HOOK_INPUT" | jq -r '.tool_name')

if [ "$TOOL_NAME" = "Edit" ] || [ "$TOOL_NAME" = "Write" ]; then
    if [ -d ".git" ]; then
        FILE_PATH=$(echo "$HOOK_INPUT" | jq -r '.tool_input.file_path')
        git add "$FILE_PATH"
        echo "Added $FILE_PATH to git staging"
    fi
fi
```

### Run Tests After Code Changes
```bash
#!/bin/bash
HOOK_INPUT=$(cat)
FILE_PATH=$(echo "$HOOK_INPUT" | jq -r '.tool_input.file_path')

if [[ "$FILE_PATH" == *".test."* ]] || [[ "$FILE_PATH" == *".spec."* ]]; then
    # Run tests in background
    npm test -- "$FILE_PATH" &
fi
```

### Project Context Injection
```bash
#!/bin/bash
# UserPromptSubmit hook

HOOK_INPUT=$(cat)

if [ -f "./.claude/CLAUDE.md" ]; then
    cat << EOF
{
  "additionalContext": [
    {
      "type": "text",
      "text": "$(cat ./.claude/CLAUDE.md)"
    }
  ]
}
EOF
fi
```

### Environment Checker
```bash
#!/bin/bash
# SessionStart hook

# Check if required tools are installed
MISSING_TOOLS=()

command -v node &> /dev/null || MISSING_TOOLS+=("node")
command -v git &> /dev/null || MISSING_TOOLS+=("git")
command -v npm &> /dev/null || MISSING_TOOLS+=("npm")

if [ ${#MISSING_TOOLS[@]} -gt 0 ]; then
    cat << EOF
{
  "systemMessage": "⚠️  Missing tools: ${MISSING_TOOLS[*]}"
}
EOF
fi
```

### Backup Before Destructive Operations
```bash
#!/bin/bash
# PreToolUse hook

HOOK_INPUT=$(cat)
TOOL_NAME=$(echo "$HOOK_INPUT" | jq -r '.tool_name')

if [ "$TOOL_NAME" = "Edit" ] || [ "$TOOL_NAME" = "Write" ]; then
    FILE_PATH=$(echo "$HOOK_INPUT" | jq -r '.tool_input.file_path')

    if [ -f "$FILE_PATH" ]; then
        # Create backup
        BACKUP_DIR="$HOME/.claude/backups/$(date +%Y%m%d)"
        mkdir -p "$BACKUP_DIR"
        cp "$FILE_PATH" "$BACKUP_DIR/$(basename $FILE_PATH).$(date +%H%M%S).bak"
    fi
fi
```

## Best Practices

### Performance
- Keep hooks fast (< 1 second)
- Set appropriate timeouts
- Run slow operations in background
- Use async where possible

### Safety
- Validate inputs
- Handle errors gracefully
- Don't block on failures
- Test hooks thoroughly
- Use idempotent operations

### Debugging
- Log hook execution
- Output diagnostic info
- Test hooks independently
- Check exit codes

### Organization
- One hook per file
- Clear naming
- Document purpose
- Version control hooks
- Share with team

## Debugging Hooks

### Test Hook Manually
```bash
# Create test input
echo '{"hook_event_name":"PostToolUse","tool_name":"Edit"}' | bash ~/.claude/hooks/post-tool-use.sh
```

### Enable Hook Logging
```bash
# Add to hook scripts
echo "Hook executed: $(date)" >> ~/.claude/logs/hooks.log
```

### Check Hook Errors
Look for error messages in Claude Code output or logs.

## Disabling Specific Hooks

Comment out or remove from `hooks/settings.json`:
```json
{
  "hooks": {
    // "SessionStart": { ... },  // Disabled
    "SessionEnd": {
      "command": "bash ~/.claude/hooks/session-end.sh"
    }
  }
}
```

## Security Considerations

- Hooks have same permissions as Claude Code
- Be careful with sudo in hooks
- Validate all inputs
- Don't expose sensitive data
- Review hooks from others before using

## Sharing Hooks

Project hooks in `.claude/hooks/` can be committed to git for team sharing:

```bash
git add .claude/hooks/
git commit -m "Add project-specific hooks"
```

## Resources

- [Claude Code Hooks Documentation](https://docs.claude.com/en/docs/claude-code/hooks)
- Community hook examples: https://github.com/anthropics/claude-code/discussions
- Share your hooks with the community!
