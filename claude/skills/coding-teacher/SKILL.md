---
description: Transform code into educational material with comprehensive comments explaining WHY, comparing languages, and teaching programming concepts
user_invocable: true
---

# Coding Teacher Skill

Transform any code file or project into an educational resource with comprehensive comments that explain:
- **WHY** things are done a certain way (not just WHAT)
- **HOW** the code works under the hood
- **LANGUAGE COMPARISONS** showing how the same concept works in other languages
- **DESIGN DECISIONS** explaining trade-offs and alternatives
- **BEST PRACTICES** and common pitfalls to avoid

## When to Use This Skill

Invoke `/coding-teacher` after completing any coding mini-project to add educational comments that make the code a learning resource for future reference.

## Workflow

1. **Analyze the project** - Identify the language, framework, and key patterns used
2. **Add file header** - Explain the project's purpose and why certain technologies were chosen
3. **Document imports/dependencies** - Explain what each import does and why it's needed
4. **Comment data structures** - Explain struct/class design decisions
5. **Document functions** - Explain logic flow, algorithms, and edge cases
6. **Add language comparisons** - Show how the same concept works in Python, JavaScript, Java, C++, etc.
7. **Highlight Go-specific patterns** (or language-specific patterns for other languages)

## Comment Style Guide

### File Headers
```
// =============================================================================
// PROJECT NAME - Brief Description
// =============================================================================
//
// WHY THIS EXISTS:
// [Explain the problem this solves]
//
// WHY THIS LANGUAGE/FRAMEWORK:
// [Explain technology choices]
//
// =============================================================================
```

### Import Blocks
```go
import (
    "fmt"    // WHY: Formatted I/O - printing, formatting strings
    "os"     // WHY: OS interactions - file I/O, env vars, args
)
```

### Data Structures
```go
// StructName represents [what it models]
// WHY THIS STRUCTURE:
// [Explain design decisions]
//
// GO VS OTHER LANGUAGES:
//   Go:     type Foo struct { ... }
//   Python: class Foo: or @dataclass
//   Java:   public class Foo { ... }
type StructName struct {
    Field1 string  // [Purpose of this field]
    Field2 int     // [Purpose of this field]
}
```

### Functions
```go
// functionName does [what it does]
//
// WHY THIS APPROACH:
// [Explain algorithm choice, trade-offs]
//
// GO VS OTHER LANGUAGES:
//   [Show equivalent in 2-3 other languages]
//
// PARAMETERS:
//   - param1: [what it represents]
//   - param2: [what it represents]
//
// RETURNS:
//   [What the return value means]
//
func functionName(param1 Type1, param2 Type2) ReturnType {
    // Step 1: [What this block does]
    // WHY: [Why we do it this way]

    // Step 2: [What this block does]
    // NOTE: [Important considerations]
}
```

### Language Comparison Blocks
```go
// GO VS OTHER LANGUAGES - [CONCEPT NAME]:
//   Go:          [Go syntax]
//   Python:      [Python equivalent]
//   JavaScript:  [JS equivalent]
//   Java:        [Java equivalent]
//   C++:         [C++ equivalent]
```

## Key Concepts to Always Explain

### For Go Projects
- `package main` vs library packages
- `:=` (short declaration) vs `var` (full declaration)
- Slices vs arrays (dynamic vs fixed)
- Maps (Go's hash map/dictionary)
- Struct tags (JSON, XML serialization)
- Multiple return values
- Error handling patterns (`value, err := ...`)
- Goroutines and channels (if used)
- Interfaces and duck typing
- Defer, panic, recover
- Pointers vs values

### For Python Projects
- `if __name__ == "__main__":`
- List comprehensions
- Decorators
- Context managers (`with`)
- Type hints
- Virtual environments
- Package structure

### For JavaScript/TypeScript Projects
- `const` vs `let` vs `var`
- Arrow functions
- Promises and async/await
- Destructuring
- Spread operator
- Module systems (ESM vs CommonJS)
- Type annotations (TypeScript)

### For Any Language
- Why certain libraries/frameworks were chosen
- Performance considerations
- Security implications
- Error handling strategies
- Testing approaches

## Example Invocation

```
User: /coding-teacher

Claude: I'll analyze your project and add comprehensive educational comments.

1. First, let me identify all source files...
2. Now I'll add file headers explaining the project...
3. Documenting imports with WHY explanations...
4. Adding language comparison blocks...
5. Commenting key functions with design decisions...

Done! Your code now serves as both a working program AND a learning resource.
```

## Output

After running this skill, every source file should:
- Have a comprehensive header explaining purpose and technology choices
- Document all imports with WHY explanations
- Include language comparison blocks for key concepts
- Explain design decisions and trade-offs
- Be readable by someone learning the language

## Project Glossary (End-of-File Reference)

After documenting the code, append a comprehensive glossary at the end of each source file. The glossary should be sorted by **frequency of use** to show what matters most.

### Glossary Structure

```go
// =============================================================================
// PROJECT GLOSSARY - Sorted by Frequency of Use
// =============================================================================
//
// Generated by: coding-teacher skill
// Project: [Project Name]
// Lines of Code: [count]
// Functions: [count]
// Structs: [count]
//
// =============================================================================

// SECTION 1: STANDARD LIBRARY IMPORTS (by frequency)
// Import         Uses    WHY IT'S NEEDED
// ─────────────────────────────────────────────────────────────────
// fmt            220+    Formatted I/O - printing, user prompts
// strings        65+     String manipulation - TrimSpace, Repeat
// ...

// SECTION 2: TYPES USED (by frequency)
// Type      Uses    PURPOSE
// ─────────────────────────────────────────────────────────────────
// string    95+     Text data - questions, answers, content
// int       22+     Whole numbers - IDs, counts, scores
// ...

// SECTION 3: CUSTOM STRUCTS (by importance)
// ┌─────────────────────────────────────────────────────────────────┐
// │ STRUCT: Progress (most referenced - 78+ uses)                   │
// ├─────────────────────────────────────────────────────────────────┤
// │ PURPOSE: Tracks all user learning state                         │
// │ FIELDS:                                                          │
// │   LessonsCompleted    []int    IDs of completed lessons         │
// │   ...                                                            │
// │ WHY THIS DESIGN:                                                │
// │   - Maps for O(1) lookup                                        │
// │   - Slices for ordered lists that can grow                      │
// └─────────────────────────────────────────────────────────────────┘

// SECTION 4: VARIABLES (by frequency)
// SECTION 5: CONTROL FLOW PATTERNS (by frequency)
// SECTION 6: FUNCTIONS DEFINED (grouped by purpose)
// SECTION 7: IDIOMS & PATTERNS
// SECTION 8: JSON SERIALIZATION TAGS (if applicable)
// SECTION 9: TERMINAL UI PATTERNS (if applicable)
// SECTION 10: LEARNING TAKEAWAYS
```

### Glossary Analysis Commands

To gather data for the glossary, run these analysis commands:

```bash
# Count type usage
grep -oE '\b(string|int|bool|error|float64)\b' main.go | sort | uniq -c | sort -rn

# Count standard library functions
grep -oE '\b(fmt|strings|strconv|bufio|os|time|json)\.[A-Za-z]+' main.go | sort | uniq -c | sort -rn

# List all struct definitions
grep -oE 'type [A-Z][a-zA-Z]+ struct' main.go

# Count function definitions
grep -oE 'func [a-zA-Z0-9_]+\(' main.go | sort | uniq -c

# Count control flow patterns
grep -oE '\b(for|if|switch|case|return|range|defer|break|continue)\b' main.go | sort | uniq -c | sort -rn

# Count variable usage
grep -oE '\b[a-z][a-zA-Z]*\b' main.go | sort | uniq -c | sort -rn | head -20
```

### Why Frequency Matters

Sorting by frequency teaches:
1. **What's actually important** - Most-used patterns are most valuable to learn
2. **Real-world priorities** - Shows what you'll encounter most often
3. **Learning efficiency** - Focus on high-frequency patterns first
4. **Project architecture** - Reveals design patterns through usage

## Notes

- This skill works with any programming language
- Focus on concepts that differ from other languages
- Assume the reader knows basic programming but is learning this specific language
- Comments should be educational, not just descriptive
- Quality over quantity - explain the important stuff deeply
- Always include the glossary for projects over 500 lines
