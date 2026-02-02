# Agents Towards Production

> End-to-end tutorials for production-grade GenAI agents

**Source**: https://github.com/NirDiamant/agents-towards-production
**Stars**: 16.3k
**Discovered**: 2024-12-29 via Manu (@cairo)

---

## Overview

Comprehensive, code-first tutorials covering every layer of production-grade GenAI agents. From prototype to enterprise deployment.

---

## Tutorial Categories

### Core Infrastructure

| Topic | Tools Covered |
|-------|---------------|
| Agent Frameworks | LangGraph, LangChain |
| Memory Systems | Redis, Mem0, Cognee |
| Tool Integration | Arcade, MCP Protocol |

### Data & Knowledge

| Topic | Tools Covered |
|-------|---------------|
| RAG Systems | Contextual AI, vector DBs |
| Web Data | Bright Data, Tavily |
| Document Processing | Chunking, retrieval |

### Deployment & Operations

| Topic | Tools Covered |
|-------|---------------|
| Containerization | Docker |
| GPU Scaling | RunPod |
| Cloud Deployment | AWS Bedrock AgentCore |
| Local Models | Ollama |

### Advanced Capabilities

| Topic | Tools Covered |
|-------|---------------|
| Multi-Agent | Coordination protocols |
| Fine-Tuning | Domain expertise |
| Security | LlamaFirewall, guardrails |
| Observability | LangSmith tracing |
| Evaluation | Automated frameworks |

### User Interface

| Topic | Tools Covered |
|-------|---------------|
| Chat UI | Streamlit |
| API Endpoints | FastAPI |

---

## Priority Implementation Areas

Based on Manu's research task to identify "7 best pieces of gold":

### Tier 1: Foundation
1. **Memory Systems** - Persistent context (Redis, Mem0)
2. **MCP Integration** - Tool standardization
3. **Observability** - LangSmith tracing

### Tier 2: Production
4. **Security/Guardrails** - LlamaFirewall
5. **Multi-Agent Coordination** - Protocols
6. **Evaluation Frameworks** - Automated testing

### Tier 3: Scale
7. **GPU Deployment** - RunPod patterns
8. **Fine-Tuning** - Domain specialization

---

## Key Patterns

### Memory Architecture
```
Session Memory → Short-term context
Entity Memory → User/actor info
Process Memory → Agent/task data
Semantic Memory → Knowledge graphs
```

### Evaluation Loop
```
Agent Output → Evaluator → Score → Feedback → Improvement
                  ↓
            Ground Truth
```

### Security Layers
```
Input → Guardrails → Agent → Output Filter → Response
           ↓                      ↓
       LlamaFirewall         Content Policy
```

---

## Workshop Integration

| Need | Relevant Tutorial |
|------|-------------------|
| Add memory to agent | Memory Systems (Redis, Mem0) |
| Integrate external tools | MCP Protocol tutorial |
| Debug agent behavior | LangSmith observability |
| Secure production agent | LlamaFirewall patterns |
| Test agent quality | Evaluation frameworks |

---

## Cross-References

- Memory Layer: `ingredients/agents/memori.md`
- Production Principles: `ingredients/agents/12-factor-agents.md`
- Behavioral Control: `ingredients/agents/parlant.md`
- MCP Patterns: `ingredients/integration/mcp-patterns.md`

---

*Added to Alchemist's Workshop: 2024-12-29*
