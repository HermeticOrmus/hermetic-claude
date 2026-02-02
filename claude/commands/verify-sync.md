# Verify Multi-Machine Sync Status

Verify synchronization status across Windows and Linux machines. Checks synced domains and identifies any conflicts or sync issues.

## What This Does

1. Checks sync service status (Syncthing or configured method)
2. Verifies synced directories exist and are accessible
3. Identifies any sync conflicts
4. Reports last sync times
5. Shows pending changes

## Implementation

```bash
#!/bin/bash

echo "═══════════════════════════════════════════════════════"
echo "  Multi-Machine Sync Status - Reality OS v3.5"
echo "  Machine: $(hostname) (Linux)"
echo "═══════════════════════════════════════════════════════"
echo ""

# Check if Syncthing is running (if using Syncthing)
echo "📡 Sync Service Status:"
if systemctl --user is-active --quiet syncthing 2>/dev/null; then
    echo "  ✅ Syncthing: Running"
    echo "  🌐 Web UI: http://localhost:8384"
elif pgrep -x "syncthing" > /dev/null; then
    echo "  ✅ Syncthing: Running (non-systemd)"
else
    echo "  ❌ Syncthing: Not running"
    echo "     To start: systemctl --user start syncthing"
fi
echo ""

# Check synced directories
echo "📂 Synced Domains Status:"

# Check ~/projects/
if [ -d ~/projects ]; then
    PROJECT_COUNT=$(find ~/projects -maxdepth 2 -type d | wc -l)
    echo "  ✅ ~/projects/ exists ($PROJECT_COUNT directories)"

    # Check for sync conflicts
    CONFLICTS=$(find ~/projects -name "*.sync-conflict*" 2>/dev/null | wc -l)
    if [ $CONFLICTS -gt 0 ]; then
        echo "     ⚠️  Warning: $CONFLICTS sync conflicts found"
        find ~/projects -name "*.sync-conflict*" 2>/dev/null | head -3
    fi
else
    echo "  ❌ ~/projects/ not found"
fi

# Check ~/.hermetic/
if [ -d ~/.hermetic ]; then
    HERMETIC_COUNT=$(find ~/.hermetic -maxdepth 2 -type d | wc -l)
    echo "  ✅ ~/.hermetic/ exists ($HERMETIC_COUNT directories)"

    # Check for conflicts
    CONFLICTS=$(find ~/.hermetic -name "*.sync-conflict*" 2>/dev/null | wc -l)
    if [ $CONFLICTS -gt 0 ]; then
        echo "     ⚠️  Warning: $CONFLICTS sync conflicts found"
    fi
else
    echo "  ❌ ~/.hermetic/ not found"
fi

# Check ~/.claude/ (entire folder)
if [ -d ~/.claude ]; then
    CLAUDE_ITEMS=$(find ~/.claude -maxdepth 1 -type d | wc -l)
    AGENT_COUNT=$(find ~/.claude/agents -name "*.md" 2>/dev/null | wc -l)
    echo "  ✅ ~/.claude/ exists ($CLAUDE_ITEMS subdirs, $AGENT_COUNT agents)"

    # Check for conflicts
    CONFLICTS=$(find ~/.claude -name "*.sync-conflict*" 2>/dev/null | wc -l)
    if [ $CONFLICTS -gt 0 ]; then
        echo "     ⚠️  Warning: $CONFLICTS sync conflicts found"
    fi
else
    echo "  ❌ ~/.claude/ not found"
fi

echo ""

# Check for any sync-conflict files across all synced areas
echo "🔍 Overall Sync Health:"
TOTAL_CONFLICTS=$(find ~/projects ~/.hermetic ~/.claude -name "*.sync-conflict*" 2>/dev/null | wc -l)
if [ $TOTAL_CONFLICTS -eq 0 ]; then
    echo "  ✅ No sync conflicts detected"
else
    echo "  ⚠️  $TOTAL_CONFLICTS total conflicts found"
    echo ""
    echo "  Resolve conflicts by:"
    echo "  1. Review conflicted files"
    echo "  2. Choose correct version"
    echo "  3. Delete .sync-conflict files"
fi

echo ""

# Check disk space (important for sync)
echo "💾 Disk Space (synced directories):"
du -sh ~/projects 2>/dev/null && echo "     ~/projects/ size" || echo "  ⚠️  Unable to check ~/projects/ size"
du -sh ~/.hermetic 2>/dev/null && echo "     ~/.hermetic/ size" || echo "  ⚠️  Unable to check ~/.hermetic/ size"

echo ""
echo "═══════════════════════════════════════════════════════"
echo "  Sync strategy: ~/.claude/MULTI-MACHINE-SYNC-STRATEGY.md"
echo "═══════════════════════════════════════════════════════"
```

## When to Use

- Before starting work session (ensure synced with other machine)
- After making major changes (verify sync completion)
- When experiencing unexpected file states (check for conflicts)
- During sync setup/troubleshooting

## Related Commands

- `/sync-conflicts` - Show and help resolve sync conflicts
- `/sync-setup` - Initial sync configuration guide
