# Alchemical Ingredients

> The raw materials for transmutation.
> Prompts, contexts, techniques, and patterns.

**Updated**: 2024-12-29 (Agent Infrastructure from Manu's research)

---

## Ingredient Categories

### Prompting Techniques
Methods for structuring LLM interactions.

| Ingredient | Purpose | Source |
|------------|---------|--------|
| Chain-of-Thought | Multi-stage reasoning | Standard |
| Few-Shot Examples | Pattern demonstration | Standard |
| Meta-Prompts | Self-improving prompts | `~/.hermetic/prompts/META_PROMPTS.md` |
| Constraint Specification | Bound the solution space | Vibe Coding |
| Categorical Meta-Prompting | Quality-scored recursive improvement | `github.com/HermeticOrmus/categorical-meta-prompting-oe` |

### Context Strategies
Ways to provide relevant information.

| Ingredient | Purpose | When to Use |
|------------|---------|-------------|
| RAG | Vector-based retrieval | Large knowledge bases |
| LSP | Semantic code understanding | Code navigation |
| MCP | Tool/service integration | External capabilities |
| Few-Shot Context | Example-based priming | Pattern matching tasks |

### Validation Techniques
Methods for verifying output quality.

| Ingredient | Purpose | Source |
|------------|---------|--------|
| JMH Benchmarking | Performance measurement | Vibe Coding CH_07 |
| Precision Testing | Output accuracy | Vibe Coding CH_06 |
| Hot-Path Detection | Bottleneck identification | Vibe Coding CH_07 |
| Trade-Off Documentation | Decision tracking | Workshop standard |

### Agent Infrastructure (New)
Production-ready AI agent patterns and tools.

| Ingredient | Purpose | Source |
|------------|---------|--------|
| 12-Factor Agents | Production principles | humanlayer/12-factor-agents |
| Production Agents | End-to-end tutorials | NirDiamant/agents-towards-production |
| Parlant | Behavioral control engine | emcie-co/parlant |
| Memori | Persistent memory layer | MemoriLabs/Memori |
| Repo Swarm | Multi-repo architecture discovery | royosherove/repo-swarm |

---

## Key Ingredients from Vibe Coding

### Constraint Specification Protocol
Before asking LLM for optimization/implementation:
1. Specify data size (10K vs 100K)
2. Specify traffic patterns
3. Specify memory constraints
4. Specify latency requirements

*Prevents over-engineering and assumption ripple*

### Context is Currency
High-resolution context = high-precision output
- Include relevant code snippets
- Specify file paths and line numbers
- Provide example inputs/outputs
- State explicit constraints

### Measure-First Pattern
Before optimizing:
1. Instrument current code
2. Run under realistic load
3. Identify actual hot paths
4. Then (and only then) optimize

---

## Key Insight from 12-Factor Agents

> "Fools ignore complexity. Pragmatists suffer it. Some can avoid it. Geniuses remove it."
> — Alan J. Perlis

The best agents are explicit, controlled, and focused. Don't hide behind frameworks.

---

## Ingredient Storage

```
ingredients/
├── prompting/
│   ├── constraint-specification.md    # Essential protocol
│   └── categorical-meta-prompting.md  # Quality-scored recursive improvement
├── context/
│   ├── rag-patterns.md                # Vector search, chunking
│   └── lsp-patterns.md                # Semantic code understanding
├── validation/
│   └── measure-first.md               # JMH, Gatling patterns
├── integration/
│   ├── finops.md                      # Token tracking, cost control
│   ├── mcp-patterns.md                # Tool integration
│   ├── charm-tui.md                   # Terminal UI + AI tools
│   └── libreuiux.md                   # Modern UI/UX (68 plugins, 153 agents)
└── agents/                            # NEW: Agent infrastructure
    ├── 12-factor-agents.md            # Production principles
    ├── production-agents.md           # End-to-end tutorials
    ├── parlant.md                     # Behavioral control
    ├── memori.md                      # Memory layer
    └── repo-swarm.md                  # Multi-repo intelligence
```

---

## Quick Ingredient Selection

| Task | Ingredient |
|------|------------|
| Prevent over-engineering | `prompting/constraint-specification.md` |
| Guaranteed-quality outputs | `prompting/categorical-meta-prompting.md` |
| Find performance bottleneck | `validation/measure-first.md` |
| Search large knowledge base | `context/rag-patterns.md` |
| Understand code semantically | `context/lsp-patterns.md` |
| Control LLM costs | `integration/finops.md` |
| Add external tools | `integration/mcp-patterns.md` |
| Modern UI/UX components | `integration/libreuiux.md` |
| Beautiful terminal UI | `integration/charm-tui.md` |
| **Production agent patterns** | `agents/12-factor-agents.md` |
| **Agent tutorials** | `agents/production-agents.md` |
| **Behavioral control** | `agents/parlant.md` |
| **Persistent memory** | `agents/memori.md` |
| **Multi-repo visibility** | `agents/repo-swarm.md` |

---

## Cross-References

- Meta-Prompts: `~/.hermetic/prompts/META_PROMPTS.md`
- Categorical Meta-Prompting: `github.com/HermeticOrmus/categorical-meta-prompting-oe`
- LibreUIUX: `~/projects/01-ACTIVE/LibreUIUX-Claude-Code/`
- MCP Servers: `~/.mcp/`
- Agents: `~/.claude/agents/`
- Skills: `~/.claude/skills/`

---

*Last updated: 2024-12-29 - Added Agent Infrastructure category*
