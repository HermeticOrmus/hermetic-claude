# LibreUIUX for Claude Code

> Skills, Agents, Commands, and Workflows for Modern UI/UX Development

**Location**: `~/projects/01-ACTIVE/LibreUIUX-Claude-Code/`

## What It Provides

| Component | Count | Purpose |
|-----------|-------|---------|
| Plugins | 68 | Domain-specific collections |
| Agents | 153 | Task-specialized AI personas |
| Commands | 80 | Slash commands for Claude Code |
| Skills | 68 | Reusable capability modules |

## The Problem It Solves

> "No matter what I try, the UI components look outdated. They resemble older Bootstrap-era designs and are not responsive."

Claude needs **specific, structured guidance** to generate modern UI/UX. LibreUIUX provides that structure.

## Key Principle

**Precision beats aesthetics**:

| Vague | Precise |
|-------|---------|
| "Make it look modern" | "bg-blue-600, hover:bg-blue-700, px-6 py-3, rounded-lg, shadow-md" |
| "Improve the design" | "Change shadow-md to shadow-lg and p-4 to p-6" |
| "Make it sleek" | "glassmorphism card with backdrop-blur-md, subtle border, 12px padding" |

## Skill Levels

### Beginner
- Ready-to-use prompts for modern components
- Design vocabulary guide
- Quick-start checklist

### Intermediate
- Design system templates
- CLAUDE.md configurations
- Component library integrations (Shadcn, Aceternity)
- Iteration workflows

### Advanced
- MCP Server setups (Chrome DevTools)
- Custom slash commands
- Automated design systems
- Production-ready architectures

## Plugin Categories

| Category | Focus |
|----------|-------|
| Frontend & UI | design-mastery, frontend-mobile-development, accessibility-compliance |
| Backend | backend-development, api-scaffolding, database-design |
| Quality | unit-testing, tdd-workflows, code-review-ai |
| DevOps | cicd-automation, deployment-strategies, kubernetes-operations |
| Specialized | game-development, blockchain-web3, machine-learning-ops |

## Core Commands

```
/ui-modern      → Generate modern UI components
/ui-critique    → Get instant design feedback
/ui-responsive  → Check responsive behavior
```

## Integration with Workshop

| Workshop Tool | LibreUIUX Integration |
|---------------|----------------------|
| `/experiment` | Test new UI patterns from LibreUIUX |
| `/boundary` | Log when Claude reverts to Bootstrap-era |
| `/recipe` | Save working prompt + component combinations |
| `/tradeoff` | Document design system vs flexibility choices |

## The Golden Rules (from LibreUIUX)

**Do**:
- Be specific (Tailwind classes, exact values)
- Reference examples ("Like the pricing card on shadcn.com")
- Use design systems (define colors, spacing, typography upfront)
- Iterate with context (use browser inspector)
- Think mobile-first

**Don't**:
- "Make it look modern" (no shared definition)
- "Improve the design" (which dimension?)
- "Make it sleek and beautiful" (subjective)
- Start without a design system
- Accept first output without iteration

## Recommended Tools

| Level | Tools |
|-------|-------|
| Essential | Shadcn UI, v0.dev, Chrome DevTools |
| Intermediate | Mobbin, 21st.dev, Aceternity |
| Advanced | Chrome DevTools MCP, Fancy Components, Motion Primitives |

## Quick Start

```bash
# Add commands to Claude Code
cp -r LibreUIUX-Claude-Code/.claude/commands/* ~/.claude/commands/

# Use specific plugins
cp plugins/design-mastery/agents/* .claude/agents/
cp plugins/design-mastery/skills/*/SKILL.md .claude/skills/
```

## Connection to Workshop Philosophy

LibreUIUX embodies the alchemist's approach:
- **Constraint Specification**: Tailwind classes = precise constraints
- **Measure-First**: Browser inspector = live measurement
- **Proven Libraries**: Shadcn, Aceternity = battle-tested components
- **Document Trade-offs**: Design system vs flexibility choices

*"The craft grows when knowledge flows."*
