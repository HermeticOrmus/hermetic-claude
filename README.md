# HERMETIC CLAUDE

**A development system for Claude Code. Built over months of daily use.**

---

## What This Is

A complete toolkit for Claude Code: 150 slash commands, 50+ skills, multi-machine infrastructure, and a session lifecycle that turns AI-assisted work into repeatable process.

This is not a starter template. It is a production system extracted from real work — software development, business operations, content pipelines, and tool-building.

---

## By the Numbers

| Component | Count | Description |
|-----------|-------|-------------|
| Commands | 150 | Domain-specific prompt collections as slash commands |
| Active skills | 50+ | Reusable behavioral plugins (39 structured, 12 standalone) |
| Archived skills | 65 | Retired or superseded skills, kept for reference |
| Published skills | 13 | Open-source skills in [claude-code-skills](https://github.com/HermeticOrmus/claude-code-skills) |
| Open-source tools | 3 | Standalone apps extracted from the system |

---

## The 8 Operations (ALQVIMIA)

A naming convention for development stages, not a framework.

| Command | What It Does |
|---------|-------------|
| `/calcinate` | Analyze code. Find complexity. Expose debt. |
| `/dissolve` | Research. Explore. Understand. |
| `/separate` | Review. Filter quality. Separate signal from noise. |
| `/conjoin` | Merge. Integrate. Unify. |
| `/ferment` | Test until it works. TDD. Iterate. |
| `/distill` | Extract patterns. Plan artifacts. |
| `/tinctvra` | Create the actual skill, command, or agent. |
| `/coagulate` | Deploy. Ship. Make it real. |

---

## Skills System

Skills are Claude Code's plugin format. Each skill is a directory containing a `SKILL.md` file (or a standalone `.md` file) that gives Claude behavioral instructions, templates, and domain knowledge for a specific task.

**How they work**: When you invoke a skill (via slash command or direct reference), Claude reads the SKILL.md and follows its instructions. Skills can include sub-files, templates, and reference data.

**Examples of active skills**: `handoff` (session transfer between machines), `pickup` (resume a previous session), `ship` (deploy to production), `close` (end-of-session cleanup), `vibe-proof` (audit AI-generated code), `unwoke` (direct communication style), `osint` (open-source intelligence gathering).

**Published skills**: 13 skills are publicly available in the [claude-code-skills](https://github.com/HermeticOrmus/claude-code-skills) repo. These are general-purpose and work in any Claude Code setup.

---

## Commands

Commands are `.md` files in `~/.claude/commands/` that become slash commands in Claude Code. They range from simple prompts to multi-step workflows with parameters.

Organized by domain: development, documentation, deployment, research, collaboration, automation, and more. 150 commands covering the full development lifecycle.

---

## Session Lifecycle

Sessions follow a defined lifecycle:

1. **Handoff** — Transfer context between machines or sessions with structured state
2. **Pickup** — Resume work from a handoff or previous session
3. **Ship** — Deploy, commit, push, and verify
4. **Close** — End-of-session cleanup, summary, and notification

This turns ad-hoc AI sessions into a repeatable workflow with continuity across machines and time.

---

## Multi-Machine Infrastructure

Three machines connected via Tailscale (private mesh VPN) and synced via Syncthing:

| Machine | OS | Role |
|---------|----|------|
| Moon | Pop!_OS | Portable dev laptop |
| Mercury | Pop!_OS | Heavy compute workhorse |
| Venus | macOS | Mac host, runs local tools |

Configuration (commands, skills, docs) syncs automatically. Machine-specific config stays local.

---

## Open-Source Tools

Three tools from the Venus toolchain have been open-sourced:

### [ormus-recorder](https://github.com/HermeticOrmus/ormus-recorder)
Voice recorder PWA with local Whisper transcription. Record audio in the browser, transcribe locally on Apple Silicon using MLX Whisper. No cloud APIs, no data leaves the machine.

### [ormus-links](https://github.com/HermeticOrmus/ormus-links)
Link intelligence PWA. Save URLs from Android (via native APK share target) or browser, extract content, and organize with AI processing. Includes a Haiku-powered intelligence pipeline.

### [zen-proxy](https://github.com/HermeticOrmus/zen-proxy)
Minimal reverse proxy that strips Authorization headers before forwarding requests. Built to connect tools that always send Bearer tokens to APIs that reject them.

---

## Install

```bash
git clone https://github.com/HermeticOrmus/hermetic-claude.git
cd hermetic-claude
./scripts/install.sh
```

---

## The Gold Hat Philosophy

Every tool follows one rule: **does it empower or extract?**

| We Do | We Don't |
|-------|----------|
| Empower users | Dark patterns |
| Teach while helping | Surveillance |
| Respect autonomy | Addiction mechanics |
| Build long-term | Quick hacks |

If a tool doesn't make the user more capable, it doesn't belong here.

---

## Built By

**Hermetic Ormus** — Gold Hat Technologist

---

## License

MIT + Gold Hat Addendum

Use it freely. Don't use it to harm people.

---

*SOLVE ET COAGVLA*
