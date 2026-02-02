# Repo Swarm

> AI-powered multi-repo architecture discovery

**Source**: https://github.com/royosherove/repo-swarm
**Discovered**: 2024-12-29 via Manu (@cairo)
**Manu's Note**: "Most interesting so far" - helps track "spinning plates"

---

## The Problem

Organizations have dozens of repositories. Understanding architecture across them requires:
- Reading each repo manually
- Maintaining outdated documentation
- Tribal knowledge in developers' heads

---

## The Solution

Repo Swarm automatically:
1. Analyzes multiple GitHub repositories
2. Generates standardized `.arch.md` architecture files
3. Runs daily to detect changes
4. Commits results to a central output repo

---

## Architecture

```
GitHub Repos ──→ Repo Swarm ──→ Analysis Results
     ↓               ↓               ↓
  Webhooks      Claude AI      .arch.md files
     ↓               ↓               ↓
  Temporal      Classification   Output Repo
  Workflows      Engine
```

---

## Key Features

### Intelligent Classification
Detects repository type automatically:
- Backend services
- Frontend applications
- Mobile apps
- Libraries/SDKs
- Infrastructure/DevOps

### Context-Aware Analysis
Selects appropriate prompts based on repo type:
- Backend → API patterns, data flow, integrations
- Frontend → Component architecture, state management
- Mobile → Platform patterns, native integrations
- Library → Public API, extension points

### Workflow Automation
- **Daily runs** via Temporal workflows
- **Change detection** - only re-analyzes repos with new commits
- **Intelligent caching** - avoids redundant analysis
- **Centralized output** - all `.arch.md` files in one place

---

## Output: .arch.md Files

Each analyzed repo gets a standardized architecture document:

```markdown
# Repository Architecture

## Overview
[High-level purpose and role in system]

## Technology Stack
- Language: [detected]
- Framework: [detected]
- Database: [detected]

## Key Components
[Major modules, services, patterns]

## Dependencies
[Internal and external dependencies]

## Data Flow
[How data moves through the system]

## Integration Points
[APIs, events, shared resources]

## Deployment
[How this repo is deployed]
```

---

## Use Cases

### For AI Agents
Generated `.arch.md` files serve as context for:
- Code generation agents
- Refactoring recommendations
- System-wide architectural analysis
- Cross-repo impact assessment

### For Developers
- Onboarding to new repos
- Understanding system topology
- Finding integration points
- Tracking architectural drift

### For Architects
- System-wide visibility
- Dependency mapping
- Pattern consistency
- Technical debt identification

---

## Integration with Categorical Meta-Prompting

| CMP Component | Repo Swarm Mapping |
|---------------|-------------------|
| Comonad W | Architecture docs as context source |
| Functor F | Repo type → analysis prompt routing |
| Quality [0,1] | Architecture completeness scoring |

### Potential Workflow

```
New Commit → Repo Swarm → .arch.md → CMP Context → Better Prompts
                             ↓
                    Central Knowledge Base
```

---

## Workshop Integration

| Need | Repo Swarm Solution |
|------|---------------------|
| Multi-project visibility | Centralized .arch.md files |
| Architecture documentation | Auto-generated, always current |
| Context for AI agents | Structured repo knowledge |
| Change tracking | Daily analysis with caching |

---

## Luxor Studios Application

For tracking "spinning plates" across projects:
1. Configure Repo Swarm for all Luxor repos
2. Generate architecture docs automatically
3. Use as context for CMP-powered agents
4. Track architectural evolution over time

---

## Trade-offs

| Benefit | Cost |
|---------|------|
| Automated documentation | Claude API costs |
| Always-current architecture | Daily compute |
| Cross-repo visibility | Central output management |
| AI-ready context | Analysis prompt tuning |

---

## Cross-References

- Production Agents: `ingredients/agents/production-agents.md`
- Context Patterns: `ingredients/context/rag-patterns.md`
- 12-Factor Agents: `ingredients/agents/12-factor-agents.md`

---

*Added to Alchemist's Workshop: 2024-12-29*
