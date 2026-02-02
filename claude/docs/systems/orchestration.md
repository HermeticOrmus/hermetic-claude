# Agent Orchestration & Plugin System

## Plugin Marketplace

Claude Code supports external plugin marketplaces for specialized agents.

### Configured Marketplaces

**wshobson/agents** - 85 specialized agents across 63 plugins
```bash
/plugin marketplace add wshobson/agents
```

### Plugin Commands

| Command | Purpose |
|---------|---------|
| `/plugin` | Browse and install plugins (interactive) |
| `/plugin install <name>` | Install specific plugin |
| `/plugin marketplace list` | List configured marketplaces |
| `/plugin marketplace update <name>` | Update marketplace metadata |
| `/plugin enable/disable <name>` | Toggle plugin without removing |
| `/plugin uninstall <name>` | Remove plugin completely |

### Recommended Plugins (wshobson/agents)

**Development:**
- `python-development` - Python expertise
- `javascript-typescript` - JS/TS development
- `backend-development` - Backend architecture
- `full-stack-orchestration` - End-to-end features

**Infrastructure:**
- `kubernetes-operations` - K8s expertise
- `cloud-infrastructure` - AWS/GCP/Azure
- `cicd-pipelines` - CI/CD optimization

**Quality:**
- `security-audit` - Security analysis
- `code-documentation` - Documentation generation
- `performance-optimization` - Performance tuning

---

## Spec-Driven Development (spec-kit)

**Tool**: `specify` CLI from GitHub's spec-kit

### Installation
```bash
uv tool install specify-cli --from git+https://github.com/github/spec-kit.git
```

### Workflow

1. **Initialize**: `specify init <project-name>`
2. **Specify**: `/speckit.specify` - Define what to build
3. **Plan**: `/speckit.plan` - Create technical plan
4. **Tasks**: `/speckit.tasks` - Break into actionable tasks
5. **Implement**: `/speckit.implement` - Execute with guidance

### When to Use spec-kit vs RIPER

| Use spec-kit | Use RIPER |
|--------------|-----------|
| New features from scratch | Modifications to existing code |
| Cross-cutting concerns | Single-domain work |
| Team handoff needed | Solo development |
| Requirements unclear | Requirements clear |

---

## Agent Selection Guide

### Built-in Agents (Claude Code native)

| Agent Type | Use For |
|------------|---------|
| `Explore` | Codebase exploration, finding files |
| `Plan` | Planning implementation approaches |
| `code-reviewer` | Code quality review |
| `test-engineer` | Test creation |
| `git-helper` | Git workflows |
| `sysadmin` | System administration |

### When to Use External Plugins

**Use wshobson/agents when:**
- Domain-specific expertise needed (K8s, MLOps, security)
- Multi-agent orchestration required
- Cost optimization matters (Haiku/Sonnet hybrid)
- Specialized workflows (incident response, observability)

**Use built-in agents when:**
- General development tasks
- Quick exploration/planning
- Standard code review/testing

---

## Orchestration Patterns

### Sequential Delegation
```
Task → Agent A → Agent B → Agent C → Result
```
Use when each step depends on previous output.

### Parallel Delegation
```
Task → [Agent A, Agent B, Agent C] → Merge → Result
```
Use for independent subtasks that can run simultaneously.

### Hierarchical Delegation
```
Orchestrator Agent → Specialist Agents → Sub-specialists → Result
```
Use for complex multi-domain problems.

---

## Cost Optimization

wshobson/agents uses hybrid model selection:
- **Haiku agents** (47): Fast execution, simple tasks
- **Sonnet agents** (38): Complex reasoning, critical decisions

Let the orchestrator choose appropriate model based on task complexity.

---

## Meta-Prompting Framework

**Tool**: Python library for recursive prompt improvement via real Claude API calls.

### Installation
```bash
cd ~/.local
git clone https://github.com/manutej/meta-prompting-framework.git
cd meta-prompting-framework
pip install -r requirements.txt
# Add ANTHROPIC_API_KEY to .env
```

### How It Works

Complexity-based strategy selection:
- **Simple (< 0.3)**: Direct single API call
- **Medium (0.3-0.7)**: Multi-approach synthesis (2-3 solutions, evaluate, merge)
- **Complex (> 0.7)**: Autonomous iterative refinement until quality threshold

### Usage
```python
from meta_prompting_engine.core import MetaPromptingEngine
from meta_prompting_engine.llm_clients.claude import ClaudeClient

engine = MetaPromptingEngine(ClaudeClient(api_key="..."))
result = engine.execute_with_meta_prompting(
    skill="python-programmer",
    task="Create function with error handling",
    max_iterations=3,
    quality_threshold=0.90
)
```

### When to Use

- Prompt optimization for production systems
- Quality-critical outputs (15-21% measured improvement)
- Complex generation tasks requiring iteration
- When you need measurable quality scores

### Integration with Claude Code

Use meta-prompting for:
1. Refining prompts in custom slash commands
2. Optimizing skill definitions
3. Improving agent system prompts
4. Quality-gating critical outputs
