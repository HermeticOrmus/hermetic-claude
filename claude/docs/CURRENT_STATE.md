# Current State - December 2025

> Active work overview and system inventory

---

## System Inventory

| Component | Count | Location |
|-----------|-------|----------|
| **Agents** | 13 | `~/.claude/agents/` |
| **Commands** | 109 | `~/.claude/commands/` |
| **Skills** | 129 | `~/.claude/skills/` |
| **Hooks** | 2 | `~/.claude/hooks/` |

### Key Agents
- `meta2/` - Universal meta-meta-prompt generator
- `MARS.md` - Multi-agent research synthesis
- `MERCURIO.md` - Orchestration agent
- `strategic-plan-architect.md` - Comprehensive planning
- `filesystem-organizer.md` - Directory organization

### Recent Skills Added
- `charm/` - Terminal UI (tui, style, gum, vhs)
- `hermetic-laws/` - 7 principles + 7 virtues
- `meta-prompting/` - Meta-prompt patterns

---

## Active Projects

| Directory | Focus | Status |
|-----------|-------|--------|
| `01-ACTIVE/` | Current primary work | Active |
| `02-COACHING-SPIRITUAL/` | Midnight Sun coaching | Ongoing |
| `04-HERMETIC-TECH/` | Meta-prompting, spec-kit | Active |
| `05-AUTOMATION-TOOLS/` | n8n workflows, automation | Maintained |
| `06-ALQVIMIA/` | PandaCompanion, product descriptions | Ongoing |

---

## Infrastructure

### MCP Servers (Active)
- Supabase (database, edge functions)
- WhatsApp (Periskope - messaging)
- GitHub (repos, issues, PRs)
- Discord (community management)
- Memory (knowledge graph)
- Filesystem (file operations)
- Puppeteer (browser automation)

### Sync (Syncthing)
- `~/.hermetic/` - Philosophy system
- `~/.claude/` - Agents, commands, skills
- `~/projects/` - Project files

---

## Current Learning Path

1. **AI-Assisted Development** - Meta-prompting, agentic workflows
2. **Terminal UI** - Charm ecosystem
3. **Spec-Driven Development** - spec-kit workflows
4. **Category Theory** - DisCoPy, compositional computing

---

## Key Frameworks

| Framework | Purpose | Location |
|-----------|---------|----------|
| **Meta-Prompting** | Recursive prompt improvement | `~/projects/04-HERMETIC-TECH/meta-prompting-framework/` |
| **Spec-Kit** | Intent-driven development | `~/projects/04-HERMETIC-TECH/spec-kit/` |
| **Alchemist's Workshop** | Prompt organization | `~/.hermetic/workshop/` |

---

## Documentation Structure

```
~/.claude/docs/           # Operational (source of truth)
├── identity.md           # Identity & philosophy
├── code-standards.md     # Quality pipeline
├── testing-guide.md      # Testing standards
├── CURRENT_STATE.md      # This file
├── organization/         # Filesystem, projects
├── reference/            # Bash, troubleshooting
├── systems/              # MCP, agents, orchestration
└── workflows/            # RIPER, 6-day cycle

~/.hermetic/docs/         # Conceptual/architectural
├── stateless-architecture-mapping.md
├── knowledge-graph-foundation.md
├── multi-agent-orchestration.md
├── SYSTEM-MAP.md
└── architecture-decision-records.md
```

---

## Recent Cleanup (December 2025)

- Memory graph audited: removed 30+ stale entities, credentials
- Documentation consolidated: 17 files archived
- Operational guides moved to `.claude/docs/systems/`
- Identity.md updated with current learning focus

---

*Last updated: December 2025*
