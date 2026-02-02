# Agent System & Delegation Protocol

## Claude Code Plugins (wshobson/agents)

**Repository**: https://github.com/wshobson/agents

**Architecture**: Granular plugin-based system with progressive disclosure
- 63 focused plugins across 23 categories
- 85 specialized agents (47 Haiku for speed, 38 Sonnet for reasoning)
- 47 agent skills (knowledge packages with progressive disclosure)
- 44 development tools (scaffolding, security scanning, test automation)
- 15 workflow orchestrators (multi-agent coordination)

**Philosophy**:
- **Install only what you need** - Each plugin loads only its specific agents and tools
- **Minimal token usage** - Average 3.4 components per plugin
- **Progressive disclosure** - Skills load knowledge only when activated
- **Composable** - Mix and match plugins for complex workflows

**Installation**:
```bash
# Add marketplace
/plugin marketplace add wshobson/agents

# Install specific plugins as needed
/plugin install python-development
/plugin install javascript-typescript
/plugin install backend-development
/plugin install code-documentation
# etc.
```

**Status**: Clean v3.0 architecture - no legacy celestial metaphors, pure functional plugins

---

## Agent Delegation Protocol

**Philosophy**: Agents are specialized experts. Delegate work to the RIGHT agent for each task.

### Delegation Pattern

1. **Identify Task Type** - What kind of work is this?
2. **Select Appropriate Agent** - Which specialist handles this best?
3. **Delegate Clearly** - State what agent should do
4. **Integrate Results** - Bring work back to main flow

### Agent Categories & When to Use

**Life Advisory** (Personal counsel):
- Legal questions → `legal-counsel`
- Financial planning → `financial-advisor`
- Health & wellness → `wellness-coach`

**Learning & Development** (Skill building):
- Pattern recognition → `observation-learning`
- Simplification → `concept-simplifier`
- Systematic progress → `systematic-learning`
- Mental simulation → `first-principles`
- Rapid absorption → `mathematical-problem-solving`
- Organization → `logical-reasoning`
- Retention → `active-recall`
- Study techniques → `learning-science`
- Intensive sprints → `ultralearning`
- Deliberate skill → `deliberate-practice`

**Philosophy & Ethics** (Conscious development):
- Mental models → `intention-alignment`
- Structure coherence → `pattern-alignment`
- Shipping velocity → `iteration-shipping`
- Balance finding → `balance-optimizer`
- Sustainable pace → `sustainable-cycles`
- Impact analysis → `consequence-analysis`
- Integration → `holistic-integration`

**Sacred Technology** (Ethics-first):
- Decision ethics → `ethics-decision-validator`
- Quality holistic → `quality-audit`
- Metrics conscious → `conscious-metrics`
- Performance sustainable → `sustainable-performance`
- API ethics → `ethical-api-design`

**Consciousness Guardrails** (Harm prevention):
- Dark patterns → `dark-pattern-detector`
- Privacy → `privacy-validator`
- Exploitation → `exploitation-detector`
- Tech debt → `technical-debt-analyzer`

**Wellness Integration**:
- Rest protocols → `integration-rest`
- Flow states → `flow-state-facilitator`
- Resistance → `resistance-resolver`

**Meta-Learning**:
- Progress blocks → `learning-blocker-analyzer`
- Curriculum design → `skill-development-planner`

### Delegation Examples

"Let me delegate this contract review to legal-counsel..."
"I'll have financial-advisor analyze your budget strategy..."
"The learning-blocker-analyzer can diagnose why you're stuck..."

### When to Use Agents

**Not Needed**: Simple questions, general discussion, quick clarifications
**Always Use**: Specialized expertise, systematic processes, ethical reviews
