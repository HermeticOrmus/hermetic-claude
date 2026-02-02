# Memori

> SQL-native memory layer for LLMs and AI agents

**Source**: https://github.com/MemoriLabs/Memori
**Tagline**: "The memory fabric for enterprise AI"
**Discovered**: 2024-12-29 via Manu (@cairo)

---

## The Problem

LLMs have "goldfish memory" - each conversation starts fresh. Users repeat context. Agents forget preferences. Relationships reset.

---

## The Solution

Memori provides persistent, contextual memory across:
- Sessions
- Conversations
- Users
- Agents

---

## Memory Hierarchy

```
Entity Level    → User/actor information (persistent)
Process Level   → Agent/task-specific data (scoped)
Session Level   → Current interaction context (ephemeral)
```

---

## What Gets Remembered

Memori's "Advanced Augmentation" extracts:

| Memory Type | Examples |
|-------------|----------|
| Facts | "User is a Python developer" |
| Preferences | "Prefers concise answers" |
| Relationships | "Works with Sarah on Project X" |
| Skills | "Expert in distributed systems" |
| Events | "Deployed v2.0 last week" |
| Rules | "Never suggest deprecated APIs" |

---

## Key Features

### Framework Agnostic
Works with all major LLM providers:
- OpenAI
- Anthropic
- Google (Gemini)
- Local models

### Database Flexible
Supports multiple backends:
- PostgreSQL
- MySQL
- MongoDB
- SQLite

### Zero-Latency Augmentation
Memory processing happens asynchronously - no interaction slowdown.

### Semantic Search
Vectorized memories for accurate context retrieval.

### Knowledge Graphs
Stores semantic triples for relationship mapping:
```
(User) --[works_on]--> (Project)
(User) --[prefers]--> (Communication Style)
(Agent) --[knows_about]--> (Domain)
```

---

## Integration Pattern

```python
# Minimal setup
from memori import Memori

memory = Memori(
    user_id="user_123",
    agent_id="support_agent"
)

# Automatic memory extraction and retrieval
response = agent.chat(
    message=user_input,
    memory=memory.get_context()
)

# Memories extracted automatically
memory.process(user_input, response)
```

---

## Memory Flow

```
User Input → Memory Retrieval → Context Augmentation → LLM → Response
                 ↓                                          ↓
          Knowledge Graph                           Memory Extraction
                 ↑                                          ↓
                 ←──────────── Memory Store ←───────────────
```

---

## Use Cases

| Scenario | Memory Benefit |
|----------|----------------|
| Customer Support | Remember past issues, preferences |
| Personal Assistant | Learn user habits over time |
| Sales Agent | Track relationship history |
| Coding Agent | Remember codebase decisions |
| Education | Adapt to learning style |

---

## Integration with Categorical Meta-Prompting

| CMP Component | Memori Mapping |
|---------------|----------------|
| Comonad W | Memory as context extraction source |
| Quality [0,1] | Memory relevance scoring |
| Composition | Memory-augmented prompt chains |

### Potential Synthesis

```
Task → [W: Extract Memory] → [F: Route] → [M: Refine] → Output
              ↓
        Memori Store
```

---

## Workshop Integration

| Need | Memori Solution |
|------|-----------------|
| Persistent user context | Entity-level memory |
| Agent learning | Process-level memory |
| Relationship tracking | Knowledge graphs |
| Context relevance | Semantic search |

---

## Trade-offs

| Benefit | Cost |
|---------|------|
| Persistent context | Storage overhead |
| User personalization | Privacy considerations |
| Relationship awareness | Graph maintenance |
| Zero-latency | Async processing complexity |

---

## Cross-References

- Agent Infrastructure: `ingredients/agents/production-agents.md`
- Context Patterns: `ingredients/context/rag-patterns.md`
- MCP Integration: `ingredients/integration/mcp-patterns.md`

---

*Added to Alchemist's Workshop: 2024-12-29*
