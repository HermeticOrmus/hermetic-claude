---
description: Create interactive shell scripts using Charm's gum tool
---

# Charm Gum Script Generator

Generate interactive bash scripts using gum for beautiful CLI experiences.

## Usage

```
/charm-gum [interaction-type]
```

## Examples

```
/charm-gum confirm
/charm-gum choose
/charm-gum input
/charm-gum filter
/charm-gum spin
/charm-gum style
/charm-gum write
```

---

## Instructions for Claude

When the user runs `/charm-gum`, generate shell scripts using gum commands:

### 1. Installation Check

Always start scripts with:

```bash
#!/bin/bash

# Check for gum
if ! command -v gum &> /dev/null; then
    echo "gum is required. Install: brew install gum (or go install github.com/charmbracelet/gum@latest)"
    exit 1
fi
```

### 2. Gum Commands

#### Confirm (Yes/No)
```bash
# Basic confirm
gum confirm "Delete all files?" && rm -rf ./temp

# With custom labels
gum confirm --affirmative "Yes, delete" --negative "No, keep" "Are you sure?"

# Styled
gum confirm --prompt.foreground "#FF0000" "This is dangerous. Continue?"
```

#### Choose (Single Selection)
```bash
# Basic choose
COLOR=$(gum choose "red" "green" "blue")

# With header
OPTION=$(gum choose --header "Select environment:" "development" "staging" "production")

# From array
OPTIONS=("Option 1" "Option 2" "Option 3")
SELECTED=$(gum choose "${OPTIONS[@]}")

# Styled cursor
gum choose --cursor "→ " --cursor.foreground "#FF5733" "one" "two" "three"
```

#### Input (Text Entry)
```bash
# Basic input
NAME=$(gum input --placeholder "Enter your name")

# With default value
EMAIL=$(gum input --value "user@example.com" --placeholder "Email")

# Password (hidden)
PASSWORD=$(gum input --password --placeholder "Enter password")

# With prompt
gum input --prompt "Username: " --placeholder "johndoe"

# Character limit
gum input --char-limit 50 --width 40 --placeholder "Short description"
```

#### Write (Multi-line)
```bash
# Basic write
DESCRIPTION=$(gum write --placeholder "Enter description...")

# For commit messages
COMMIT_MSG=$(gum write --placeholder "Commit message" --header "What did you change?")

# With dimensions
CONTENT=$(gum write --width 60 --height 10 --placeholder "Enter content...")
```

#### Filter (Fuzzy Find)
```bash
# Filter from list
FILE=$(ls | gum filter)

# Filter from file
ITEM=$(gum filter < items.txt)

# With placeholder
gum filter --placeholder "Search files..." < <(find . -type f)

# Styled
gum filter --indicator "→" --indicator.foreground "#FF5733" < options.txt
```

#### Spin (Loading)
```bash
# Basic spinner
gum spin --spinner dot --title "Installing..." -- npm install

# Different spinners: line, dot, minidot, jump, pulse, points, globe, moon, monkey, meter, hamburger
gum spin --spinner moon --title "Processing..." -- sleep 3

# Styled
gum spin --spinner.foreground "#FF5733" --title "Loading..." -- ./long-task.sh
```

#### Style (Styled Output)
```bash
# Basic style
gum style "Hello, World!"

# With formatting
gum style --foreground "#FF5733" --bold "Important message"

# Box with border
gum style --border double --padding "1 2" --margin 1 "Boxed content"

# Centered with width
gum style --align center --width 50 "Centered text"

# Complete styling
gum style \
    --foreground 212 \
    --border-foreground 212 \
    --border double \
    --align center \
    --width 50 \
    --margin "1 2" \
    --padding "2 4" \
    "Charm" "Beautiful CLI"
```

#### Format (Markdown/Code)
```bash
# Render markdown
gum format -t markdown < README.md

# Render code with syntax highlighting
gum format -t code -l go < main.go

# Inline
echo "# Title" | gum format -t markdown
```

#### Join (Layout)
```bash
# Horizontal join
gum join --horizontal "Left" "Middle" "Right"

# Vertical join
gum join --vertical "Top" "Middle" "Bottom"

# Aligned
gum join --horizontal --align center "One" "Two"
```

### 3. Complete Script Examples

#### Interactive Git Commit
```bash
#!/bin/bash

# Commit type
TYPE=$(gum choose "feat" "fix" "docs" "style" "refactor" "test" "chore")

# Scope (optional)
SCOPE=$(gum input --placeholder "scope (optional)")

# Description
DESC=$(gum input --placeholder "short description" --char-limit 50)

# Body (optional)
gum confirm "Add detailed body?" && BODY=$(gum write --placeholder "Detailed description...")

# Build commit message
if [ -n "$SCOPE" ]; then
    COMMIT="$TYPE($SCOPE): $DESC"
else
    COMMIT="$TYPE: $DESC"
fi

[ -n "$BODY" ] && COMMIT="$COMMIT

$BODY"

# Confirm and commit
gum confirm "Commit with message: $COMMIT" && git commit -m "$COMMIT"
```

#### Environment Selector
```bash
#!/bin/bash

gum style --border double --padding "1 2" "Environment Setup"

ENV=$(gum choose --header "Select environment:" "development" "staging" "production")

case $ENV in
    development)
        export API_URL="http://localhost:3000"
        ;;
    staging)
        export API_URL="https://staging.example.com"
        ;;
    production)
        gum confirm "Are you sure you want to use production?" || exit 1
        export API_URL="https://api.example.com"
        ;;
esac

gum style --foreground 82 "✓ Environment set to $ENV"
gum style --foreground 241 "API_URL: $API_URL"
```

#### File Processor
```bash
#!/bin/bash

gum style --bold "File Processor"

# Select file
FILE=$(find . -type f -name "*.txt" | gum filter --placeholder "Select a file...")

if [ -z "$FILE" ]; then
    gum style --foreground 196 "No file selected"
    exit 1
fi

# Select action
ACTION=$(gum choose --header "What to do with $FILE?" \
    "View contents" \
    "Count lines" \
    "Search in file" \
    "Delete file")

case "$ACTION" in
    "View contents")
        gum pager < "$FILE"
        ;;
    "Count lines")
        LINES=$(wc -l < "$FILE")
        gum style "File has $LINES lines"
        ;;
    "Search in file")
        PATTERN=$(gum input --placeholder "Search pattern...")
        grep --color=always "$PATTERN" "$FILE" | gum pager
        ;;
    "Delete file")
        gum confirm "Really delete $FILE?" && rm "$FILE" && gum style --foreground 82 "Deleted!"
        ;;
esac
```

### 4. Styling Reference

```bash
# Colors (ANSI 256)
--foreground 205          # Pink
--foreground 82           # Green
--foreground 196          # Red
--foreground 241          # Gray

# Colors (Hex)
--foreground "#FF5733"

# Text formatting
--bold
--italic
--underline
--strikethrough

# Borders
--border none|normal|rounded|thick|double|hidden

# Spacing
--padding "1"             # all sides
--padding "1 2"           # vertical horizontal
--margin "1 2"

# Alignment
--align left|center|right

# Dimensions
--width 50
--height 10
```

---

## Output Requirements

1. Complete bash script with shebang
2. gum availability check
3. Error handling
4. Styled output where appropriate
5. Comments explaining each section

---

## Quality Checklist

- [ ] Shebang and gum check
- [ ] Appropriate command for interaction type
- [ ] Styled output for polish
- [ ] Error handling for empty inputs
- [ ] Confirm before destructive actions

---

**Make shell scripts delightful!**
