---
name: bootdev-glossary
description: Search or add to the boot.dev learning glossary. Usage: /bootdev-glossary <term> or /bootdev-glossary add <term> <definition>
---

# Boot.dev Glossary Manager

**Purpose**: Build and search your personal programming glossary as you learn.

## Usage

### Search for a term
```
/bootdev-glossary <term>
```
Searches all glossary files for the term and returns definition + context.

### Add a new term
```
/bootdev-glossary add <term>: <definition>
```
Adds the term to the appropriate glossary file based on current course context.

## Instructions

### For Search:
1. Parse the search term from args
2. Read all files in ~/projects/boot.dev/glossary/
3. Search for matches (fuzzy matching OK)
4. Return:
   - Definition
   - Which course it's from
   - Related terms
   - Example usage if available

### For Add:
1. Parse term and definition from args
2. Determine which glossary file based on current course (from config.json)
3. Append in format:
   ```
   ### {Term}
   **Definition**: {definition}
   **Course**: {current_course}
   **Added**: {date}
   ```
4. Confirm addition

## Glossary File Structure

Each course has its own glossary file:
- `~/projects/boot.dev/glossary/python.md`
- `~/projects/boot.dev/glossary/linux.md`
- `~/projects/boot.dev/glossary/git.md`
- `~/projects/boot.dev/glossary/go.md`
- `~/projects/boot.dev/glossary/sql.md`
- `~/projects/boot.dev/glossary/docker.md`
- `~/projects/boot.dev/glossary/dsa.md` (Data Structures & Algorithms)
- `~/projects/boot.dev/glossary/general.md` (Cross-cutting concepts)

## Term Format

```markdown
### {Term}
**Definition**: Clear, concise explanation in your own words.
**Example**: Code example or usage scenario.
**Related**: Links to related terms.
**Course**: Where you learned this.
**Added**: YYYY-MM-DD
```

## Spaced Repetition

When reviewing glossary, prioritize terms:
1. Added in last 24 hours (new)
2. Not reviewed in 7+ days (due for review)
3. Marked as "tricky" or "important"
