# Charm Terminal UI

> Beautiful terminal interfaces with Go

**Source**: https://github.com/charmbracelet
**Updated**: 2024-12-29 via Manu (@cairo)

---

## Philosophy

Charm believes terminals deserve beauty. Their tools bring modern UI/UX principles to the command line - the same attention to design, interaction, and delight that web/mobile gets.

**Core Principle**: The terminal is a first-class interface, not a legacy afterthought.

---

## The Charm Ecosystem

### Core Libraries

| Library | Purpose | Stars | Analogy |
|---------|---------|-------|---------|
| **bubbletea** | TUI framework (Elm architecture) | 37.8k | React for terminals |
| **lipgloss** | Terminal styling | 10.2k | CSS for terminals |
| **bubbles** | Pre-built components | - | Component library |
| **gum** | Shell script interactions | 22.1k | Interactive prompts |
| **vhs** | Terminal recordings | 18.1k | Screen recorder |
| **glow** | Markdown rendering | 22k | Markdown viewer |
| **wish** | SSH apps | - | SSH server framework |
| **log** | Colorful logging | - | Structured logger |

### AI-Powered Tools (New)

| Library | Purpose | Stars | Note |
|---------|---------|-------|------|
| **crush** | AI coding agent for terminal | 16.5k | "The glamourous AI coding agent" |
| **mods** | AI in the terminal | 4.3k | Pipe anything to LLMs |
| **fantasy** | AI agent framework | - | Build agents in Go |
| **catwalk** | LLM inference providers | - | Multi-provider abstraction |

---

## AI Tools Deep Dive

### Crush - AI Coding Agent

Terminal-native AI coding assistant built on Charm's TUI stack.

```bash
# Start crush in your project
crush

# Features:
# - Beautiful terminal UI
# - Code understanding
# - File editing
# - Project navigation
```

### Mods - AI in Terminal

Pipe anything to LLMs:

```bash
# Summarize a file
cat README.md | mods "summarize this"

# Explain code
cat main.go | mods "explain what this does"

# Generate commit message
git diff | mods "write a commit message"

# Ask questions with context
mods "how do I parse JSON in Go?"
```

### Fantasy - Agent Framework

Build AI agents in Go:

```go
// Fantasy provides building blocks for agents:
// - LLM providers
// - Tool definitions
// - Conversation management
// - Streaming responses
```

---

## Bubbletea (The Core)

Elm Architecture for terminals:

```
Model → View → Update → Model
```

### Model
```go
type model struct {
    choices  []string
    cursor   int
    selected map[int]struct{}
}
```

### Update
```go
func (m model) Update(msg tea.Msg) (tea.Model, tea.Cmd) {
    switch msg := msg.(type) {
    case tea.KeyMsg:
        switch msg.String() {
        case "up", "k":
            m.cursor--
        case "down", "j":
            m.cursor++
        case "enter", " ":
            // toggle selection
        case "q":
            return m, tea.Quit
        }
    }
    return m, nil
}
```

### View
```go
func (m model) View() string {
    s := "What should we buy?\n\n"
    for i, choice := range m.choices {
        cursor := " "
        if m.cursor == i {
            cursor = ">"
        }
        checked := " "
        if _, ok := m.selected[i]; ok {
            checked = "x"
        }
        s += fmt.Sprintf("%s [%s] %s\n", cursor, checked, choice)
    }
    return s
}
```

---

## Lipgloss (Styling)

CSS-like styling for terminals:

```go
var style = lipgloss.NewStyle().
    Bold(true).
    Foreground(lipgloss.Color("#FAFAFA")).
    Background(lipgloss.Color("#7D56F4")).
    PaddingTop(2).
    PaddingLeft(4).
    Width(22)

fmt.Println(style.Render("Hello, Charm!"))
```

### Common Patterns

```go
// Border box
var boxStyle = lipgloss.NewStyle().
    Border(lipgloss.RoundedBorder()).
    BorderForeground(lipgloss.Color("63")).
    Padding(1, 2)

// Gradient text (adaptive)
var titleStyle = lipgloss.NewStyle().
    Foreground(lipgloss.AdaptiveColor{Light: "#343433", Dark: "#C1C1C1"}).
    Bold(true)

// Layout composition
lipgloss.JoinHorizontal(lipgloss.Top, left, right)
lipgloss.JoinVertical(lipgloss.Left, top, bottom)
```

---

## Bubbles (Components)

Pre-built bubbletea components:

| Component | Use Case |
|-----------|----------|
| `spinner` | Loading states |
| `textinput` | Text entry |
| `textarea` | Multi-line input |
| `list` | Scrollable lists |
| `table` | Data tables |
| `viewport` | Scrollable content |
| `paginator` | Page navigation |
| `progress` | Progress bars |
| `stopwatch` | Timing |
| `timer` | Countdown |
| `filepicker` | File selection |

### Example: Spinner

```go
import "github.com/charmbracelet/bubbles/spinner"

type model struct {
    spinner spinner.Model
}

func initialModel() model {
    s := spinner.New()
    s.Spinner = spinner.Dot
    s.Style = lipgloss.NewStyle().Foreground(lipgloss.Color("205"))
    return model{spinner: s}
}
```

---

## Gum (Shell Scripts)

Interactive shell scripts without code:

```bash
# Confirm
gum confirm "Are you sure?" && rm -rf ./

# Choose from list
COLOR=$(gum choose "red" "green" "blue")

# Input with placeholder
NAME=$(gum input --placeholder "Enter your name")

# Multi-line input
COMMIT_MSG=$(gum write --placeholder "Commit message...")

# Spinner while running command
gum spin --spinner dot --title "Installing..." -- npm install

# Styled output
gum style --foreground 212 --border-foreground 212 --border double \
    --align center --width 50 --margin "1 2" --padding "2 4" \
    "Charm" "Terminal UI"

# Filter/fuzzy find
FILE=$(gum filter < files.txt)

# Format text
gum format -t markdown < README.md
```

---

## VHS (Recordings)

Generate terminal GIFs from tape files:

```tape
# demo.tape
Output demo.gif

Set FontSize 14
Set Width 1200
Set Height 600

Type "echo 'Hello, World!'"
Sleep 500ms
Enter
Sleep 2s

Type "gum spin --spinner dot -- sleep 3"
Enter
Sleep 4s
```

Run: `vhs demo.tape`

---

## Workshop Integration

| Workshop Tool | Charm Integration |
|---------------|-------------------|
| `/experiment` | Test new TUI patterns |
| `/boundary` | Log terminal capability limits |
| `/recipe` | Save working bubbletea patterns |
| `/tradeoff` | Document TUI vs web decisions |

---

## When to Use Charm

### Good Fit
- CLI tools that need user interaction
- Developer tooling (git helpers, build tools)
- System administration interfaces
- SSH-based applications
- Terminal dashboards
- AI coding assistants (Crush, Mods)

### Consider Alternatives
- Simple one-shot scripts (just use flags)
- GUI needed (use web/native)
- Non-technical users (terminal intimidating)

---

## Key Patterns

### 1. Progressive Disclosure
Start simple, reveal complexity on demand:
```go
// Initial view: minimal
// Tab to expand: details
// ? for help: full documentation
```

### 2. Vim-like Navigation
```go
j/k or ↑/↓  - Navigate
h/l or ←/→  - Horizontal
g/G         - Top/bottom
/           - Search
q           - Quit
```

### 3. Adaptive Colors
```go
lipgloss.AdaptiveColor{
    Light: "#000000",  // For light terminals
    Dark:  "#FFFFFF",  // For dark terminals
}
```

### 4. Responsive Layout
```go
width, height, _ := term.GetSize(int(os.Stdout.Fd()))
// Adjust layout based on terminal size
```

---

## Resources

- **Docs**: https://charm.sh/
- **GitHub**: https://github.com/charmbracelet
- **Examples**: https://github.com/charmbracelet/bubbletea/tree/master/examples
- **Tutorials**: https://charm.sh/blog/

---

## Skills Available

```
~/.claude/skills/charm/
├── tui.md      # /charm-tui - Generate TUI components
├── style.md    # /charm-style - Lipgloss patterns
├── gum.md      # /charm-gum - Interactive scripts
└── vhs.md      # /charm-vhs - Demo recordings
```

---

## Cross-References

- Agent Frameworks: `ingredients/agents/production-agents.md`
- 12-Factor Agents: `ingredients/agents/12-factor-agents.md`

---

*"Make the terminal beautiful."*
