---
description: Create automation scripts for repetitive tasks
thinking: true
---

# Create Automation

Help me automate a repetitive task with a script or tool.

## Automation Design Process

### 1. Understand the Task
- What needs to be automated?
- How often is it done?
- What are the steps?
- What are the inputs/outputs?
- Any edge cases or variations?

### 2. Choose the Right Tool

**Bash Script** - For:
- File operations
- System commands
- Simple workflows
- Cron jobs

**Python Script** - For:
- Complex logic
- API interactions
- Data processing
- Error handling

**Make/Makefile** - For:
- Build automation
- Multi-step processes
- Project tasks

**Systemd Timer** - For:
- Scheduled tasks
- System services
- Better than cron

**Cron Job** - For:
- Simple scheduled tasks
- Traditional approach

### 3. Script Structure

```bash
#!/bin/bash
# Script: name
# Purpose: what it does
# Usage: how to run it

set -euo pipefail  # Exit on error

# Configuration
VAR="value"

# Functions
function main() {
    # Main logic
}

# Error handling
trap 'echo "Error on line $LINENO"' ERR

# Run
main "$@"
```

### 4. Make It Robust

- Error handling
- Input validation
- Logging
- Dry-run mode
- Confirmation prompts for destructive operations
- Exit codes

### 5. Documentation

- What the script does
- How to use it
- Required dependencies
- Configuration options
- Examples

### 6. Testing

- Test with various inputs
- Test error cases
- Test edge cases
- Dry-run mode

### 7. Installation

- Where to put the script
- Make it executable
- Add to PATH (if global)
- Create alias (if frequently used)

### 8. Maintenance

- Version the script
- Document changes
- Keep it simple
- Review periodically

## Example Automation Ideas

- Daily backup script
- Project setup script
- Deployment automation
- Log cleanup
- Report generation
- File organization
- Batch processing
- Environment setup
- Testing workflows
- Git workflows

Let's create a well-designed, maintainable automation for your task!
