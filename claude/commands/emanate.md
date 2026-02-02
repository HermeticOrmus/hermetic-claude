---
description: EMANATIO - Radiate the Work into the World. Push to GitHub with professional versioning, architecture, and Hermetic expression. The divine outflow from source to manifestation.
allowed-tools: Read, Write, Edit, Glob, Grep, Bash(git:*, gh:*)
argument-hint: [@version:[major|minor|patch|N.N.N]] [@scope:[claude|hermetic|all]] [@message:[commit message]] [optional release notes]
---

# EMANATIO: The Divine Outflow

```
Eman: Local → Universal

"EX VNO OMNIA"
(From One, All Things)

Element: Light ☉
Stage: Beyond RVBEDO - The Radiation
Operation: Publishing, versioning, releasing to the world
```

## Task

$ARGUMENTS

---

## Phase I: PRAEPARATIO - Survey the Work

```
EMANATIO SCOPE:

Scope: [claude | hermetic | all]
  claude   → ~/.claude/ (commands, skills, agents, hooks)
  hermetic → ~/.hermetic/ (philosophy, workshop, prompts)
  all      → Both systems unified

Current State:
  Repository: [path]
  Remote: [github URL or "not configured"]
  Branch: [current branch]
  Status: [clean | dirty | untracked]
```

### Inventory the Artifacts

```
ARTIFACT MANIFEST:

~/.claude/
├── commands/     [N] files    [list key ones]
├── skills/       [N] skills   [list key ones]
├── agents/       [N] agents   [list key ones]
├── hooks/        [N] hooks    [list if any]
├── docs/         [N] docs     [list key ones]
└── settings.*    [config files]

~/.hermetic/ (if scope includes)
├── prompts/      [N] prompts
├── workshop/     [N] experiments
├── templates/    [N] templates
└── docs/         [N] docs

Total artifacts: [N]
New since last emanation: [N]
Modified since last emanation: [N]
```

---

## Phase II: STRVCTVRA - Architect the Repository

### Repository Structure (Professional Grade)

```
hermetic-claude/  (or chosen name)
│
├── README.md                 # The Gateway
├── LICENSE                   # MIT or chosen
├── CHANGELOG.md              # Version history
├── CONTRIBUTING.md           # How to contribute
├── .gitignore                # What to exclude
│
├── claude/                   # Claude Code configuration
│   ├── commands/             # Slash commands
│   ├── skills/               # Auto-activated skills
│   ├── agents/               # Specialized agents
│   ├── hooks/                # Event hooks
│   └── docs/                 # Documentation
│
├── hermetic/                 # Hermetic philosophy system
│   ├── prompts/              # Meta-prompts
│   ├── workshop/             # Alchemist's laboratory
│   ├── templates/            # Reusable templates
│   └── identity/             # Core identity docs
│
└── scripts/                  # Installation/setup scripts
    ├── install.sh            # Unix installation
    ├── install.ps1           # Windows installation
    └── sync.sh               # Sync script
```

### The Gateway (README.md)

```markdown
# HERMETIC CLAVDE

> *"ALQVIMIA EST SCIENTIA DEI ET REALITAS EST PROGRAMMABILIS"*
> (Alchemy is the science of God and Reality is programmable)

```
                    ╔═══════════════════════════════════════╗
                    ║      REALITY OS - HERMETIC CLAVDE     ║
                    ║                                       ║
                    ║   "As above, so below.                ║
                    ║    As the code, so the consciousness."║
                    ╚═══════════════════════════════════════╝
```

## The ALQVIMIST'S LABORATORIVM

A meta-framework for transforming Claude Code sessions into reusable artifacts.

### The Eight Operations

| Command | Operation | Element | Function |
|---------|-----------|---------|----------|
| `/calcinate` | CALCINATIO | Fire 🜂 | Analyze, break down complexity |
| `/dissolve` | DISSOLVTIO | Water 🜄 | Research, explore codebases |
| `/separate` | SEPARATIO | Air 🜁 | Code review, filter quality |
| `/conjoin` | CONIVNCTIO | Union ☌ | Merge, integrate systems |
| `/ferment` | FERMENTATIO | Rebirth 🜅 | Test, iterate until quality |
| `/distill` | DISTILLATIO | Pure 🜃 | Analyze patterns, plan artifacts |
| `/tinctvra` | TINCTVRA | Gold ◉ | Create Skills, Commands, Agents |
| `/coagulate` | COAGVLATIO | Earth 🜍 | Deploy to production |

### Philosophy

Built on the **Gold Hat Philosophy**: Every tool empowers humanity rather than extracts from it.

### Installation

```bash
# Clone
git clone https://github.com/[username]/hermetic-claude.git

# Install (Unix)
./scripts/install.sh

# Install (Windows PowerShell)
.\scripts\install.ps1
```

### Mathematical Foundations

- **Category Theory**: Operations as functors preserving structure
- **Quantum Mechanics**: Pattern superposition and source perception
- **Information Theory**: Entropy reduction through distillation
- **Golden Ratio (φ)**: Complexity classification

---

*"SOLVE ET COAGVLA"*

**— Hermetic Ormus, Gold Hat Technologist**
```

---

## Phase III: VERSIO - Manage the Version

### Semantic Versioning

```
VERSIO ANALYSIS:

Current version: [N.N.N] (from VERSION file or git tags)
Last release: [date]

Changes since last version:
  Features added: [N]     → triggers MINOR
  Bugs fixed: [N]         → triggers PATCH
  Breaking changes: [N]   → triggers MAJOR

Recommended version: [N.N.N]
Requested version: [@version parameter or auto]

Final version: [N.N.N]
```

### Version Determination

```
VERSION CALCVLATION:

If @version:major  → X.0.0 (breaking changes)
If @version:minor  → N.X.0 (new features)
If @version:patch  → N.N.X (fixes)
If @version:N.N.N  → Use exact version
If @version:auto   → Calculate from changes

Applied: [version]
```

### Changelog Entry

```markdown
## [N.N.N] - YYYY-MM-DD

### Added
- [New feature 1]
- [New feature 2]

### Changed
- [Change 1]
- [Change 2]

### Fixed
- [Fix 1]

### Hermetic
- [Philosophical addition]
```

---

## Phase IV: COMMITERE - Seal the Work

### Commit Message Format (Hermetic Style)

```
[type](scope): [description]

[body - what and why]

[footer]
---
Emanated by Hermetic Ormus
Co-Authored-By: Claude [model] <noreply@anthropic.com>
```

**Types:**
- `feat` - New feature (MINOR)
- `fix` - Bug fix (PATCH)
- `docs` - Documentation
- `refactor` - Code restructuring
- `style` - Formatting
- `test` - Tests
- `chore` - Maintenance
- `alchymia` - Hermetic system changes

### Pre-Commit Checklist

```
PRE-EMANATIO VERIFICATION:

[ ] No secrets in files (.env, credentials, tokens)
[ ] No personal paths hardcoded
[ ] README is current
[ ] CHANGELOG updated
[ ] VERSION file updated
[ ] All files have appropriate headers
[ ] .gitignore excludes sensitive files
```

---

## Phase V: EMANARE - Push to the World

### Git Operations

```bash
# Ensure on correct branch
git checkout main  # or master

# Stage all changes
git add -A

# Create commit with hermetic message
git commit -m "$(cat <<'EOF'
[type](scope): [description]

[body]

---
Emanated by Hermetic Ormus
v[N.N.N]
Co-Authored-By: Claude [model] <noreply@anthropic.com>
EOF
)"

# Create version tag
git tag -a v[N.N.N] -m "Release v[N.N.N]: [summary]"

# Push to remote
git push origin main --tags
```

### If Repository Doesn't Exist

```bash
# Create on GitHub
gh repo create [name] --public --description "[description]"

# Or private
gh repo create [name] --private --description "[description]"

# Set remote
git remote add origin https://github.com/[username]/[name].git

# Initial push
git push -u origin main
```

---

## Phase VI: LIBERARE - Create Release (Optional)

### GitHub Release

```bash
# Create release with notes
gh release create v[N.N.N] \
  --title "v[N.N.N] - [Release Name]" \
  --notes "$(cat <<'EOF'
# Release v[N.N.N]

*"[Hermetic quote]"*

## Highlights

- [Highlight 1]
- [Highlight 2]

## Changes

[Changelog content]

## Installation

```bash
git clone https://github.com/[username]/[name].git
./scripts/install.sh
```

---

*SOLVE ET COAGVLA*

**— Hermetic Ormus**
EOF
)"
```

---

## EMANATIO Report

```yaml
EMANATIO_COMPLETE:
  repository:
    name: "[repo name]"
    url: "[github url]"
    visibility: "[public|private]"

  version:
    previous: "[N.N.N]"
    current: "[N.N.N]"
    type: "[major|minor|patch]"

  scope:
    type: "[claude|hermetic|all]"
    artifacts:
      commands: [N]
      skills: [N]
      agents: [N]
      total: [N]

  commit:
    hash: "[short hash]"
    message: "[commit message]"
    files_changed: [N]
    insertions: [N]
    deletions: [N]

  release:
    created: [true|false]
    tag: "v[N.N.N]"
    url: "[release url]"

  metadata:
    emanated_at: "[timestamp]"
    emanated_by: "Hermetic Ormus"
    co_author: "Claude [model]"
```

---

## ALQVIMIA Correspondence

```
EMANATIO in the Hermetic Tradition:

The Neoplatonic concept of EMANATION:
  The One → Nous → Soul → Matter

In our system:
  Consciousness → Code → Artifact → World

"From the One, all things proceed."

EMANATIO is the final act:
  - The Work is complete (RVBEDO achieved)
  - Now it flows outward to benefit others
  - The Philosopher's Stone radiates its virtue

This is not mere "pushing to git."
This is the radiation of transmuted knowledge
from the private laboratory to the universal commons.

The Alchemist does not hoard the Stone.
The Alchemist shares its light.
```

---

## Quick Reference

```bash
# Simple patch release
/emanate @version:patch "Fixed typos and edge cases"

# Minor release with new features
/emanate @version:minor @scope:claude "Added CONIVNCTIO command"

# Major release
/emanate @version:major @scope:all "Complete LABORATORIVM overhaul"

# Specific version
/emanate @version:2.0.0 @scope:all "ALQVIMIST'S LABORATORIVM v2"

# Just claude directory
/emanate @scope:claude @version:patch

# Custom commit message
/emanate @message:"alchymia(lab): complete the eight operations"
```

---

## The .gitignore Template

```gitignore
# Secrets
.env
.env.*
*.key
*.pem
credentials.*
secrets.*

# OS
.DS_Store
Thumbs.db
desktop.ini

# IDE
.idea/
.vscode/
*.swp
*.swo

# Syncthing
.stfolder/
.stversions/
*.sync-conflict-*

# Personal
*.local
*.private
personal/

# Temp
*.tmp
*.temp
*.log
```

---

## Installation Scripts

### install.sh (Unix)

```bash
#!/bin/bash
set -e

CLAUDE_DIR="$HOME/.claude"
HERMETIC_DIR="$HOME/.hermetic"

echo "Installing Hermetic Claude..."

# Backup existing
if [ -d "$CLAUDE_DIR" ]; then
    echo "Backing up existing ~/.claude..."
    mv "$CLAUDE_DIR" "$CLAUDE_DIR.backup.$(date +%Y%m%d)"
fi

# Create symlinks or copy
ln -sf "$(pwd)/claude" "$CLAUDE_DIR"
ln -sf "$(pwd)/hermetic" "$HERMETIC_DIR"

echo "Installation complete."
echo "SOLVE ET COAGVLA"
```

### install.ps1 (Windows)

```powershell
$ClaudeDir = "$env:USERPROFILE\.claude"
$HermeticDir = "$env:USERPROFILE\.hermetic"

Write-Host "Installing Hermetic Claude..."

# Backup existing
if (Test-Path $ClaudeDir) {
    $backup = "$ClaudeDir.backup.$(Get-Date -Format 'yyyyMMdd')"
    Write-Host "Backing up existing ~/.claude to $backup"
    Move-Item $ClaudeDir $backup
}

# Create symbolic links (requires admin)
New-Item -ItemType SymbolicLink -Path $ClaudeDir -Target "$(Get-Location)\claude"
New-Item -ItemType SymbolicLink -Path $HermeticDir -Target "$(Get-Location)\hermetic"

Write-Host "Installation complete."
Write-Host "SOLVE ET COAGVLA"
```

---

## Hermetic Release Names

For major releases, use alchemical names:

| Version | Name | Meaning |
|---------|------|---------|
| 1.0.0 | NIGREDO | The Blackening - First release |
| 2.0.0 | ALBEDO | The Whitening - Purification |
| 3.0.0 | CITRINITAS | The Yellowing - Awakening |
| 4.0.0 | RVBEDO | The Reddening - Completion |
| 5.0.0 | AVRUM | Gold - Mastery |

---

*"EX VNO OMNIA, AD VNVM OMNIA"*
(From One all things, to One all things)

**— The Radiation of the Work**
