---
description: Apply beautiful terminal styling using Charm's lipgloss library
---

# Charm Style Generator

Generate lipgloss styles for beautiful terminal output.

## Usage

```
/charm-style [style-type] [options]
```

## Examples

```
/charm-style box rounded
/charm-style header gradient
/charm-style list items
/charm-style status bar
/charm-style dialog modal
```

---

## Instructions for Claude

When the user runs `/charm-style`, generate lipgloss styling code with these patterns:

### 1. Basic Styling

```go
import "github.com/charmbracelet/lipgloss"

var style = lipgloss.NewStyle().
    Bold(true).
    Italic(true).
    Underline(true).
    Strikethrough(true).
    Foreground(lipgloss.Color("#FAFAFA")).
    Background(lipgloss.Color("#7D56F4")).
    Padding(1, 2).      // vertical, horizontal
    Margin(1, 2).       // vertical, horizontal
    Width(40).
    Height(10).
    Align(lipgloss.Center)
```

### 2. Color Systems

```go
// Hex colors
lipgloss.Color("#FF5733")

// ANSI 256 colors
lipgloss.Color("205")

// Adaptive (light/dark terminals)
lipgloss.AdaptiveColor{
    Light: "#343433",
    Dark:  "#C1C1C1",
}

// Complete adaptive
lipgloss.CompleteAdaptiveColor{
    Light: lipgloss.CompleteColor{TrueColor: "#d7ffae", ANSI256: "193", ANSI: "11"},
    Dark:  lipgloss.CompleteColor{TrueColor: "#d75fee", ANSI256: "163", ANSI: "5"},
}
```

### 3. Border Styles

```go
// Border types
lipgloss.NormalBorder()
lipgloss.RoundedBorder()
lipgloss.ThickBorder()
lipgloss.DoubleBorder()
lipgloss.HiddenBorder()

// Apply border
var boxStyle = lipgloss.NewStyle().
    Border(lipgloss.RoundedBorder()).
    BorderForeground(lipgloss.Color("63")).
    BorderBackground(lipgloss.Color("0")).
    BorderTop(true).
    BorderBottom(true).
    BorderLeft(true).
    BorderRight(true)

// Custom border
customBorder := lipgloss.Border{
    Top:         "─",
    Bottom:      "─",
    Left:        "│",
    Right:       "│",
    TopLeft:     "╭",
    TopRight:    "╮",
    BottomLeft:  "╰",
    BottomRight: "╯",
}
```

### 4. Layout Composition

```go
// Horizontal join
row := lipgloss.JoinHorizontal(lipgloss.Top, left, middle, right)
row := lipgloss.JoinHorizontal(lipgloss.Center, items...)
row := lipgloss.JoinHorizontal(lipgloss.Bottom, items...)

// Vertical join
column := lipgloss.JoinVertical(lipgloss.Left, top, middle, bottom)
column := lipgloss.JoinVertical(lipgloss.Center, items...)
column := lipgloss.JoinVertical(lipgloss.Right, items...)

// Place content
placed := lipgloss.Place(width, height, lipgloss.Center, lipgloss.Center, content)
```

### 5. Common Style Patterns

#### Header/Title
```go
var titleStyle = lipgloss.NewStyle().
    Bold(true).
    Foreground(lipgloss.Color("#FAFAFA")).
    Background(lipgloss.Color("#7D56F4")).
    Padding(0, 2).
    MarginBottom(1)
```

#### Card/Box
```go
var cardStyle = lipgloss.NewStyle().
    Border(lipgloss.RoundedBorder()).
    BorderForeground(lipgloss.Color("62")).
    Padding(1, 2).
    Width(40)
```

#### Selected Item
```go
var selectedStyle = lipgloss.NewStyle().
    Foreground(lipgloss.Color("170")).
    Bold(true).
    PaddingLeft(2)

var normalStyle = lipgloss.NewStyle().
    PaddingLeft(4)
```

#### Status Bar
```go
var statusBarStyle = lipgloss.NewStyle().
    Foreground(lipgloss.AdaptiveColor{Light: "#343433", Dark: "#C1C1C1"}).
    Background(lipgloss.AdaptiveColor{Light: "#D9DCCF", Dark: "#353533"}).
    Padding(0, 1).
    Width(width)
```

#### Help Text
```go
var helpStyle = lipgloss.NewStyle().
    Foreground(lipgloss.Color("241")).
    Italic(true)
```

#### Error/Warning/Success
```go
var errorStyle = lipgloss.NewStyle().
    Foreground(lipgloss.Color("#FF0000")).
    Bold(true)

var warningStyle = lipgloss.NewStyle().
    Foreground(lipgloss.Color("#FFA500"))

var successStyle = lipgloss.NewStyle().
    Foreground(lipgloss.Color("#00FF00"))
```

### 6. Responsive Styles

```go
import "golang.org/x/term"

func getTerminalWidth() int {
    width, _, _ := term.GetSize(int(os.Stdout.Fd()))
    if width == 0 {
        width = 80 // fallback
    }
    return width
}

// Dynamic width style
func responsiveBox(content string) string {
    width := getTerminalWidth()
    return lipgloss.NewStyle().
        Width(width - 4).
        Border(lipgloss.RoundedBorder()).
        Render(content)
}
```

### 7. Style Inheritance

```go
// Base style
var baseStyle = lipgloss.NewStyle().
    Padding(1, 2).
    Border(lipgloss.RoundedBorder())

// Inherit and extend
var primaryStyle = baseStyle.Copy().
    BorderForeground(lipgloss.Color("63")).
    Foreground(lipgloss.Color("63"))

var dangerStyle = baseStyle.Copy().
    BorderForeground(lipgloss.Color("196")).
    Foreground(lipgloss.Color("196"))
```

### 8. Complete Theme Example

```go
type Theme struct {
    Title       lipgloss.Style
    Subtitle    lipgloss.Style
    Body        lipgloss.Style
    Card        lipgloss.Style
    Selected    lipgloss.Style
    Help        lipgloss.Style
    Error       lipgloss.Style
    Success     lipgloss.Style
}

var DefaultTheme = Theme{
    Title: lipgloss.NewStyle().
        Bold(true).
        Foreground(lipgloss.Color("#FAFAFA")).
        Background(lipgloss.Color("#7D56F4")).
        Padding(0, 2),

    Subtitle: lipgloss.NewStyle().
        Foreground(lipgloss.Color("241")).
        Italic(true),

    Body: lipgloss.NewStyle().
        Foreground(lipgloss.AdaptiveColor{Light: "#343433", Dark: "#C1C1C1"}),

    Card: lipgloss.NewStyle().
        Border(lipgloss.RoundedBorder()).
        BorderForeground(lipgloss.Color("62")).
        Padding(1, 2),

    Selected: lipgloss.NewStyle().
        Foreground(lipgloss.Color("170")).
        Bold(true),

    Help: lipgloss.NewStyle().
        Foreground(lipgloss.Color("241")),

    Error: lipgloss.NewStyle().
        Foreground(lipgloss.Color("196")).
        Bold(true),

    Success: lipgloss.NewStyle().
        Foreground(lipgloss.Color("82")).
        Bold(true),
}
```

---

## Output Requirements

1. Complete Go code with imports
2. Adaptive colors for light/dark terminals
3. Responsive to terminal width where appropriate
4. Consistent spacing (Charm uses 4-space padding often)
5. Example usage/rendering

---

## Quality Checklist

- [ ] Uses adaptive colors
- [ ] Consistent border style
- [ ] Proper padding/margin
- [ ] Inheritable base styles
- [ ] Terminal width awareness
- [ ] Readable color contrast

---

**Make terminals beautiful!**
