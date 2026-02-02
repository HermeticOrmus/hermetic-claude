---
description: Generate beautiful terminal UI components using Charm's bubbletea and lipgloss
---

# Charm TUI Generator

Generate Elm-architecture TUI components for Go using Charm libraries.

## Usage

```
/charm-tui [component-type] [options]
```

## Examples

```
/charm-tui spinner loading
/charm-tui list selection
/charm-tui form multi-field
/charm-tui progress download
/charm-tui table data
/charm-tui viewport scrollable
```

---

## Instructions for Claude

When the user runs `/charm-tui`, generate a complete bubbletea component with these requirements:

### 1. Component Structure

Every bubbletea component needs:

```go
package main

import (
    "fmt"
    tea "github.com/charmbracelet/bubbletea"
    "github.com/charmbracelet/lipgloss"
)

// Model holds application state
type model struct {
    // state fields
}

// Init returns initial command
func (m model) Init() tea.Cmd {
    return nil // or initial command
}

// Update handles messages
func (m model) Update(msg tea.Msg) (tea.Model, tea.Cmd) {
    switch msg := msg.(type) {
    case tea.KeyMsg:
        switch msg.String() {
        case "q", "ctrl+c":
            return m, tea.Quit
        }
    }
    return m, nil
}

// View renders the UI
func (m model) View() string {
    return "Hello, Charm!"
}

func main() {
    p := tea.NewProgram(initialModel())
    if _, err := p.Run(); err != nil {
        fmt.Printf("Error: %v", err)
    }
}
```

### 2. Component Types

#### Spinner
```go
import "github.com/charmbracelet/bubbles/spinner"

type model struct {
    spinner  spinner.Model
    loading  bool
    message  string
}

func initialModel() model {
    s := spinner.New()
    s.Spinner = spinner.Dot  // or MiniDot, Line, Jump, Pulse, Points, Globe, Moon, Monkey
    s.Style = lipgloss.NewStyle().Foreground(lipgloss.Color("205"))
    return model{spinner: s, loading: true}
}
```

#### List
```go
import "github.com/charmbracelet/bubbles/list"

type item struct {
    title, desc string
}
func (i item) Title() string       { return i.title }
func (i item) Description() string { return i.desc }
func (i item) FilterValue() string { return i.title }

type model struct {
    list list.Model
}
```

#### Text Input
```go
import "github.com/charmbracelet/bubbles/textinput"

type model struct {
    textInput textinput.Model
    err       error
}

func initialModel() model {
    ti := textinput.New()
    ti.Placeholder = "Enter something..."
    ti.Focus()
    ti.CharLimit = 156
    ti.Width = 20
    return model{textInput: ti}
}
```

#### Progress Bar
```go
import "github.com/charmbracelet/bubbles/progress"

type model struct {
    progress progress.Model
    percent  float64
}

func initialModel() model {
    return model{
        progress: progress.New(progress.WithDefaultGradient()),
    }
}
```

#### Table
```go
import "github.com/charmbracelet/bubbles/table"

columns := []table.Column{
    {Title: "Name", Width: 20},
    {Title: "Age", Width: 10},
}

rows := []table.Row{
    {"Alice", "25"},
    {"Bob", "30"},
}

t := table.New(
    table.WithColumns(columns),
    table.WithRows(rows),
    table.WithFocused(true),
    table.WithHeight(7),
)
```

### 3. Styling with Lipgloss

Always include styled output:

```go
var (
    titleStyle = lipgloss.NewStyle().
        Bold(true).
        Foreground(lipgloss.Color("#FAFAFA")).
        Background(lipgloss.Color("#7D56F4")).
        PaddingLeft(2).
        PaddingRight(2)

    itemStyle = lipgloss.NewStyle().
        PaddingLeft(4)

    selectedStyle = lipgloss.NewStyle().
        PaddingLeft(2).
        Foreground(lipgloss.Color("170"))

    helpStyle = lipgloss.NewStyle().
        Foreground(lipgloss.Color("241"))
)
```

### 4. Keyboard Navigation

Standard vim-like bindings:

```go
case tea.KeyMsg:
    switch msg.String() {
    case "up", "k":
        m.cursor--
    case "down", "j":
        m.cursor++
    case "enter", " ":
        // select/confirm
    case "q", "ctrl+c":
        return m, tea.Quit
    case "?":
        m.showHelp = !m.showHelp
    }
```

### 5. Output Requirements

Provide:
1. Complete, runnable Go code
2. Required imports
3. go.mod dependencies
4. Usage instructions
5. Customization hints

### 6. go.mod Template

```go
module myapp

go 1.21

require (
    github.com/charmbracelet/bubbletea v0.25.0
    github.com/charmbracelet/bubbles v0.17.0
    github.com/charmbracelet/lipgloss v0.9.0
)
```

---

## Quality Checklist

- [ ] Elm architecture (Model, Update, View)
- [ ] Proper Init() with commands if needed
- [ ] Keyboard navigation (vim-style + arrows)
- [ ] Quit handling (q, ctrl+c)
- [ ] Lipgloss styling
- [ ] Responsive to terminal size
- [ ] Help text/hints
- [ ] Error handling

---

**Build beautiful terminal interfaces!**
