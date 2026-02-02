# LSP Patterns (Language Server Protocol)

> "LSP provides semantic code understanding - the AI can navigate
> definitions, find references, and understand code structure
> beyond simple text matching."
> — Vibe Coding CH_03

---

## What LSP Provides

```
Developer Request: "refactor the login service"
         │
         ▼
    LSP Server
         │
    ├── Go to Definition (find where LoginService is defined)
    ├── Find References (where is it used?)
    ├── Hover Info (what's its type signature?)
    ├── Document Symbols (what methods does it have?)
    └── Workspace Symbols (related classes?)
         │
         ▼
    Rich semantic context for LLM
```

---

## LSP Operations for AI Context

| Operation | Purpose | AI Use Case |
|-----------|---------|-------------|
| `goToDefinition` | Find where symbol is defined | Understand implementation |
| `findReferences` | Find all usages | Impact analysis |
| `hover` | Get type info, docs | Understand contracts |
| `documentSymbol` | List all symbols in file | Code structure |
| `workspaceSymbol` | Search symbols across project | Find related code |
| `prepareCallHierarchy` | Get call hierarchy | Trace execution flow |
| `incomingCalls` | Who calls this? | Dependency analysis |
| `outgoingCalls` | What does this call? | Dependency analysis |

---

## MCP + LSP Architecture

From the book (CH_03 Figure 3-4):

```
Developer
    │
    ▼
MCP Client (Claude)
    │
    ▼ MCP (JSON-RPC)
MCP Server for LSP
    │
    ▼ LSP (JSON-RPC)
Language Server (e.g., Metals, tsserver, pylsp)
    │
    ├── Build Tool (semantic info)
    ├── Compiler (type checking)
    └── Artifact Repos (dependencies)
```

---

## Practical Usage

### Before Refactoring

```python
# 1. Get definition
definition = lsp.go_to_definition(file, line, column)

# 2. Find all references
references = lsp.find_references(file, line, column)

# 3. Get call hierarchy
callers = lsp.incoming_calls(file, line, column)

# 4. Build context for LLM
context = f"""
DEFINITION:
{read_file(definition.path, definition.range)}

REFERENCES ({len(references)} total):
{format_references(references[:10])}

CALLERS:
{format_callers(callers)}
"""
```

### For Code Understanding

```python
# Get all symbols in a file
symbols = lsp.document_symbols(file)

# Build structure map
structure = """
FILE: {file}
CLASSES:
{format_classes(symbols)}
FUNCTIONS:
{format_functions(symbols)}
"""
```

---

## Language Servers

| Language | Server | Notes |
|----------|--------|-------|
| TypeScript/JS | tsserver | Built into VS Code |
| Python | pylsp, pyright | Pyright faster, stricter |
| Rust | rust-analyzer | Excellent |
| Go | gopls | Official |
| Java/Scala | Metals | JVM languages |
| C/C++ | clangd | LLVM-based |

---

## Integration Points

### Claude Code LSP Tool
Claude Code has built-in LSP support:

```
LSP tool operations:
- goToDefinition
- findReferences
- hover
- documentSymbol
- workspaceSymbol
- goToImplementation
- prepareCallHierarchy
- incomingCalls
- outgoingCalls
```

### When to Use LSP vs Grep

| Task | Use |
|------|-----|
| Find exact symbol definition | LSP `goToDefinition` |
| Find all usages of a function | LSP `findReferences` |
| Search for text pattern | Grep |
| Find files by name | Glob |
| Understand type signature | LSP `hover` |
| List all functions in file | LSP `documentSymbol` |

---

## Trade-Offs

| Approach | Pro | Con |
|----------|-----|-----|
| LSP only | Semantic accuracy | Requires running server |
| Grep only | Fast, simple | No semantic understanding |
| LSP + Grep | Best of both | Complexity |

**Recommended**: Use LSP for semantic operations, Grep for text search.

---

## Boundary

LSP requires:
- Language server installed and configured
- Project properly set up (package.json, pyproject.toml, etc.)
- Server running

Without these, fall back to Grep/Glob.
