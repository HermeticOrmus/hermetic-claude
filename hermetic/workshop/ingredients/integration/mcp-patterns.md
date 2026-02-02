# MCP Patterns (Model Context Protocol)

> "MCP provides standardized tool interfaces for AI agents,
> bridging LLMs with external services and capabilities."
> — Vibe Coding CH_03

---

## What MCP Does

```
LLM (Claude)
    │
    ▼ MCP Protocol (JSON-RPC over stdio/SSE)
MCP Client
    │
    ├── MCP Server: GitHub
    ├── MCP Server: Filesystem
    ├── MCP Server: Database
    ├── MCP Server: Custom Tools
    └── MCP Server: LSP Bridge
```

---

## MCP Components

| Component | Purpose |
|-----------|---------|
| **Tools** | Actions the LLM can invoke |
| **Resources** | Data the LLM can read |
| **Prompts** | Pre-built prompt templates |

---

## Current MCP Servers

Location: `~/.mcp/`

| Server | Purpose | Tools |
|--------|---------|-------|
| GitHub | Repo operations | create_issue, create_pr, search_code |
| Filesystem | File operations | read_file, write_file, list_directory |
| Supabase | Database | execute_sql, list_tables, apply_migration |
| Discord | Messaging | send_message, read_messages, create_channel |
| WhatsApp | Messaging | send_message, list_chats, search_contact |
| Puppeteer | Browser automation | navigate, screenshot, click, fill |
| Fetch | HTTP requests | fetch URL content |
| Memory | Knowledge graph | create_entities, search_nodes |

---

## MCP Server Architecture

```
┌─────────────────────────────────────────┐
│           MCP Server                     │
├─────────────────────────────────────────┤
│  Tools:                                  │
│    - tool_name(params) → result         │
│                                          │
│  Resources:                              │
│    - resource://uri → content           │
│                                          │
│  Prompts:                                │
│    - prompt_name(args) → messages       │
└─────────────────────────────────────────┘
         │
         ▼ JSON-RPC
┌─────────────────────────────────────────┐
│         External Service                 │
│    (API, Database, Filesystem, etc.)    │
└─────────────────────────────────────────┘
```

---

## Building Custom MCP Servers

### Python (FastMCP)

```python
from fastmcp import FastMCP

mcp = FastMCP("my-server")

@mcp.tool()
def search_documents(query: str, limit: int = 10) -> list[dict]:
    """Search the document database."""
    return db.search(query, limit=limit)

@mcp.resource("docs://{doc_id}")
def get_document(doc_id: str) -> str:
    """Get a specific document by ID."""
    return db.get(doc_id)

if __name__ == "__main__":
    mcp.run()
```

### TypeScript (MCP SDK)

```typescript
import { McpServer } from "@modelcontextprotocol/sdk/server";

const server = new McpServer({ name: "my-server" });

server.tool("search_documents", {
  query: { type: "string" },
  limit: { type: "number", default: 10 }
}, async ({ query, limit }) => {
  return await db.search(query, limit);
});

server.run();
```

---

## MCP Configuration

Location: `~/.claude.json` or project `.mcp.json`

```json
{
  "mcpServers": {
    "my-server": {
      "command": "python",
      "args": ["/path/to/server.py"],
      "env": {
        "API_KEY": "..."
      }
    }
  }
}
```

---

## Best Practices

### Tool Design
- Single responsibility per tool
- Clear, descriptive names
- Validate inputs
- Return structured data (JSON)
- Handle errors gracefully

### Resource Design
- Use URI patterns: `type://path/to/resource`
- Support filtering via query params
- Return appropriate content types

### Security
- Never expose secrets in tool responses
- Validate all inputs
- Use environment variables for credentials
- Implement rate limiting for external APIs

---

## Integration Patterns

### RAG via MCP
```
MCP Server: knowledge-base
  ├── Tool: search(query, top_k) → chunks
  ├── Tool: get_document(id) → content
  └── Resource: stats://usage → metrics
```

### LSP via MCP
```
MCP Server: lsp-bridge
  ├── Tool: go_to_definition(file, line, col)
  ├── Tool: find_references(file, line, col)
  └── Tool: get_symbols(file)
```

### Database via MCP
```
MCP Server: database
  ├── Tool: query(sql) → results
  ├── Tool: schema(table) → columns
  └── Resource: tables://list → table names
```

---

## Cross-Reference

- MCP Servers: `~/.mcp/`
- Claude Config: `~/.claude.json`
- Skill: `/mcp-builder` (create new servers)
- Docs: `~/.claude/skills/mcp-builder/`
