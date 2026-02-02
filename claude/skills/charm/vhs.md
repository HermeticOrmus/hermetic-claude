---
description: Generate terminal demo recordings using Charm's VHS tape files
---

# Charm VHS Recorder

Generate VHS tape files to create beautiful terminal GIF/video demos.

## Usage

```
/charm-vhs [demo-type]
```

## Examples

```
/charm-vhs simple
/charm-vhs cli-tool
/charm-vhs installation
/charm-vhs feature-showcase
```

---

## Instructions for Claude

When the user runs `/charm-vhs`, generate a VHS tape file for terminal recording:

### 1. Basic Tape Structure

```tape
# demo.tape

# Output settings
Output demo.gif

# Terminal settings
Set FontSize 14
Set Width 1200
Set Height 600
Set Theme "Catppuccin Mocha"

# Recording commands
Type "echo 'Hello, World!'"
Sleep 500ms
Enter
Sleep 2s
```

### 2. Output Formats

```tape
# GIF (default, most common)
Output demo.gif

# WebM video
Output demo.webm

# MP4 video
Output demo.mp4

# PNG frames
Output frames/

# Multiple outputs
Output demo.gif
Output demo.webm
```

### 3. Terminal Settings

```tape
# Dimensions
Set Width 1200
Set Height 600

# Typography
Set FontSize 14
Set FontFamily "JetBrains Mono"

# Appearance
Set Theme "Catppuccin Mocha"
Set Padding 20
Set Framerate 60

# Window chrome
Set WindowBar Colorful  # Colorful | Rings | Default
Set WindowBarSize 40

# Cursor
Set CursorBlink false

# Shell
Set Shell "bash"
Set TypingSpeed 50ms
```

### 4. Available Themes

```tape
# Popular themes
Set Theme "Catppuccin Mocha"
Set Theme "Catppuccin Latte"
Set Theme "Dracula"
Set Theme "GitHub Dark"
Set Theme "GitHub Light"
Set Theme "Monokai"
Set Theme "Nord"
Set Theme "One Dark"
Set Theme "Tokyo Night"
Set Theme "Solarized Dark"
Set Theme "Solarized Light"
```

### 5. Commands

#### Typing
```tape
# Type text (with realistic typing speed)
Type "echo 'Hello'"

# Type faster/slower
Type@100ms "slow typing"
Type@20ms "fast typing"

# Type without executing
Type "command"
# vs typing and running
Type "command"
Enter
```

#### Timing
```tape
# Sleep (pause)
Sleep 500ms
Sleep 1s
Sleep 2.5s

# Wait for output to settle
Sleep 100ms
```

#### Keys
```tape
# Enter/Return
Enter

# Special keys
Backspace
Delete
Tab
Space
Escape

# Arrow keys
Up
Down
Left
Right

# Ctrl combinations
Ctrl+C
Ctrl+D
Ctrl+L

# Multiple presses
Backspace 5    # Press 5 times
Up 3           # Press 3 times
```

#### Screen Control
```tape
# Hide/show commands
Hide
Type "secret command"
Enter
Show

# Clear screen (Ctrl+L)
Ctrl+L
```

### 6. Demo Templates

#### Simple Command Demo
```tape
# simple-demo.tape
Output simple.gif

Set FontSize 16
Set Width 800
Set Height 400
Set Theme "Catppuccin Mocha"

Type "echo 'Hello, World!'"
Sleep 500ms
Enter
Sleep 1s

Type "date"
Sleep 300ms
Enter
Sleep 2s
```

#### CLI Tool Demo
```tape
# cli-tool.tape
Output cli-demo.gif

Set FontSize 14
Set Width 1000
Set Height 600
Set Theme "Dracula"
Set TypingSpeed 75ms

# Title
Type "# My CLI Tool Demo"
Enter
Sleep 500ms

# Show help
Type "mytool --help"
Enter
Sleep 2s

# Basic usage
Type "mytool create project-name"
Enter
Sleep 3s

# Show result
Type "ls -la project-name/"
Enter
Sleep 2s
```

#### Installation Demo
```tape
# install.tape
Output install.gif

Set FontSize 14
Set Width 1200
Set Height 600
Set Theme "Tokyo Night"

# Install command
Type "# Installing mytool"
Enter
Sleep 500ms

Type "curl -sSL https://get.mytool.dev | bash"
Enter
Sleep 3s

# Verify installation
Type "mytool --version"
Enter
Sleep 1s

# Success message
Type "echo '✓ Installation complete!'"
Enter
Sleep 2s
```

#### Interactive TUI Demo
```tape
# tui-demo.tape
Output tui.gif

Set FontSize 14
Set Width 1200
Set Height 800
Set Theme "Catppuccin Mocha"
Set TypingSpeed 100ms

# Launch TUI
Type "mytui"
Enter
Sleep 1s

# Navigate
Down
Sleep 300ms
Down
Sleep 300ms

# Select
Enter
Sleep 500ms

# Show details
Tab
Sleep 500ms

# Exit
Type "q"
Sleep 1s
```

#### Feature Showcase
```tape
# features.tape
Output features.gif

Set FontSize 14
Set Width 1200
Set Height 700
Set Theme "Nord"

# Feature 1
Type "# Feature 1: Fast Search"
Enter
Sleep 500ms
Type "mytool search 'query'"
Enter
Sleep 2s

Ctrl+L  # Clear screen

# Feature 2
Type "# Feature 2: Auto-complete"
Enter
Sleep 500ms
Type "mytool com"
Tab
Sleep 1s
Tab
Sleep 1s
Enter
Sleep 2s

Ctrl+L

# Feature 3
Type "# Feature 3: Beautiful Output"
Enter
Sleep 500ms
Type "mytool status --pretty"
Enter
Sleep 3s
```

### 7. Advanced Techniques

#### Hiding Setup Commands
```tape
# Hide setup, only show the important parts
Hide
Type "cd ~/demo-project"
Enter
Type "source .env"
Enter
Show

# Now record the actual demo
Type "mytool run"
Enter
Sleep 3s
```

#### Simulating Typing Errors
```tape
Type "mytooll"  # Typo
Sleep 300ms
Backspace
Type "l"        # Fix
Sleep 200ms
Enter
```

#### Split-Screen Effect (Simulation)
```tape
# Use tmux for split screen
Hide
Type "tmux new-session -d -s demo"
Enter
Type "tmux split-window -h"
Enter
Type "tmux attach -t demo"
Enter
Sleep 500ms
Show

# Now interact with split screen
Type "echo 'Left pane'"
Enter
Ctrl+B
Right  # Move to right pane
Type "echo 'Right pane'"
Enter
```

### 8. Running VHS

```bash
# Basic usage
vhs demo.tape

# Specify output (overrides tape setting)
vhs demo.tape -o custom-output.gif

# Publish to vhs.charm.sh (shareable link)
vhs publish demo.gif

# Validate tape syntax
vhs validate demo.tape
```

---

## Output Requirements

1. Complete .tape file
2. Appropriate dimensions for content
3. Good theme choice
4. Realistic typing speeds
5. Proper pauses for readability
6. Comments explaining sections

---

## Quality Checklist

- [ ] Output format specified
- [ ] Appropriate dimensions
- [ ] Theme matches project branding
- [ ] Typing speed is readable
- [ ] Pauses allow reading output
- [ ] Clear progression/story
- [ ] Ends with visible result

---

## Best Practices

1. **Keep it short** - 15-30 seconds ideal for GIFs
2. **Start clean** - Clear terminal or fresh session
3. **Show, don't tell** - Let the output speak
4. **Pause on results** - Give time to read
5. **Use realistic typing** - 50-100ms feels natural
6. **Match your brand** - Use consistent themes

---

**Create stunning terminal demos!**
