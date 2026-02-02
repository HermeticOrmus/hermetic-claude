#!/bin/bash
# ═══════════════════════════════════════════════════════════════
#                 HERMETIC CLAVDE - Installation Script
#                          (Unix/Linux/macOS)
# ═══════════════════════════════════════════════════════════════
#
# "SOLVE ET COAGVLA"
#
# This script installs the Hermetic Claude system by creating
# symbolic links from this repository to ~/.claude and ~/.hermetic
#
# ═══════════════════════════════════════════════════════════════

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

# Paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"
CLAUDE_SOURCE="$REPO_DIR/claude"
HERMETIC_SOURCE="$REPO_DIR/hermetic"
CLAUDE_TARGET="$HOME/.claude"
HERMETIC_TARGET="$HOME/.hermetic"
BACKUP_DIR="$HOME/.hermetic-backup-$(date +%Y%m%d-%H%M%S)"

echo -e "${PURPLE}"
echo "╔═══════════════════════════════════════════════════════════════╗"
echo "║              HERMETIC CLAVDE - Installation                   ║"
echo "║                                                               ║"
echo "║     \"As above, so below. As the code, so the consciousness.\" ║"
echo "╚═══════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

# Function to backup existing directory
backup_if_exists() {
    local target=$1
    local name=$2

    if [ -e "$target" ] || [ -L "$target" ]; then
        echo -e "${YELLOW}Found existing $name at $target${NC}"

        if [ -L "$target" ]; then
            echo -e "${BLUE}  → Removing existing symlink${NC}"
            rm "$target"
        else
            echo -e "${BLUE}  → Backing up to $BACKUP_DIR/${NC}"
            mkdir -p "$BACKUP_DIR"
            mv "$target" "$BACKUP_DIR/$name"
        fi
    fi
}

# Check if source directories exist
if [ ! -d "$CLAUDE_SOURCE" ]; then
    echo -e "${RED}Error: Claude source directory not found at $CLAUDE_SOURCE${NC}"
    exit 1
fi

if [ ! -d "$HERMETIC_SOURCE" ]; then
    echo -e "${RED}Error: Hermetic source directory not found at $HERMETIC_SOURCE${NC}"
    exit 1
fi

echo -e "${BLUE}Installing from: $REPO_DIR${NC}"
echo ""

# Backup existing installations
backup_if_exists "$CLAUDE_TARGET" "claude"
backup_if_exists "$HERMETIC_TARGET" "hermetic"

# Create symbolic links
echo -e "${GREEN}Creating symbolic links...${NC}"

ln -sf "$CLAUDE_SOURCE" "$CLAUDE_TARGET"
echo -e "  ${GREEN}✓${NC} $CLAUDE_TARGET → $CLAUDE_SOURCE"

ln -sf "$HERMETIC_SOURCE" "$HERMETIC_TARGET"
echo -e "  ${GREEN}✓${NC} $HERMETIC_TARGET → $HERMETIC_SOURCE"

echo ""

# Verify installation
echo -e "${BLUE}Verifying installation...${NC}"

if [ -L "$CLAUDE_TARGET" ] && [ -d "$CLAUDE_TARGET" ]; then
    COMMANDS_COUNT=$(find "$CLAUDE_TARGET/commands" -name "*.md" 2>/dev/null | wc -l)
    SKILLS_COUNT=$(find "$CLAUDE_TARGET/skills" -mindepth 1 -maxdepth 1 -type d 2>/dev/null | wc -l)
    echo -e "  ${GREEN}✓${NC} Claude: $COMMANDS_COUNT commands, $SKILLS_COUNT skills"
else
    echo -e "  ${RED}✗${NC} Claude installation failed"
    exit 1
fi

if [ -L "$HERMETIC_TARGET" ] && [ -d "$HERMETIC_TARGET" ]; then
    echo -e "  ${GREEN}✓${NC} Hermetic: Installed"
else
    echo -e "  ${RED}✗${NC} Hermetic installation failed"
    exit 1
fi

echo ""
echo -e "${GREEN}╔═══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║                  Installation Complete!                       ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${PURPLE}The ALQVIMIST'S LABORATORIVM is ready.${NC}"
echo ""
echo "Quick start:"
echo "  /calcinate src/     # Analyze code"
echo "  /dissolve           # Research"
echo "  /distill            # Extract patterns"
echo ""
echo -e "${BLUE}SOLVE ET COAGVLA${NC}"
echo ""

if [ -d "$BACKUP_DIR" ]; then
    echo -e "${YELLOW}Note: Your previous installation was backed up to:${NC}"
    echo "  $BACKUP_DIR"
    echo ""
fi
