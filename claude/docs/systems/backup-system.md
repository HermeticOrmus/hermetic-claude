# Backup System

Full system backup with incremental rsync to external drive.

## Quick Reference

```bash
# Manual backup
backup                    # Interactive backup
backup --dry-run          # Preview what would be backed up
backup --full             # Non-interactive (used by cron)

# Restore
restore                   # Restore from latest backup
restore --list            # List available backups
restore 20251212_140000   # Restore specific backup
restore --dry-run         # Preview restore
```

## What Gets Backed Up

| Directory | Description |
|-----------|-------------|
| `~/projects/` | Main work (~49GB) |
| `~/Projects/` | Additional projects |
| `~/Dev/` | Development files |
| `~/Documents/` | Documents |
| `~/Desktop/` | Desktop files |
| `~/.claude/` | Claude configuration |
| `~/.config/` | Application configs |
| `~/.hermetic/` | Hermetic files |
| `~/.ssh/` | SSH keys (encrypted on backup drive recommended) |
| `~/.gnupg/` | GPG keys |
| `~/.local/bin/` | Local scripts |
| Dotfiles | .bashrc, .zshrc, .gitconfig, etc. |

## Excluded (Re-downloadable)

- `node_modules/`, `__pycache__/`, `.venv/`
- `.cache/`, `.npm/_cacache/`
- `.cargo/registry/`, `.cargo/git/`
- Build artifacts: `dist/`, `build/`, `.next/`

## Automation

**Cron job**: Runs daily at 2:00 AM
- Only executes if backup drive is mounted
- Logs to `~/.claude-backups/logs/`
- Sends desktop notification on completion

```bash
# View cron job
crontab -l

# Edit schedule
crontab -e
```

## Setup: Connect Your Backup Drive

The scripts expect a drive mounted at `/media/hermeticormus/OrmusBackup`.

### Option 1: Label your drive "BackupDrive"

```bash
# Find your drive
lsblk -o NAME,SIZE,MOUNTPOINT,LABEL

# For ext4 filesystem
sudo e2label /dev/sdX1 HermeticOrmusBackup

# For exFAT/FAT32, use disk utility or:
sudo exfatlabel /dev/sdX1 HermeticOrmusBackup
```

### Option 2: Use a different mount point

Edit `~/bin/backup` and change `BACKUP_DRIVE`:
```bash
BACKUP_DRIVE="/media/hermeticormus/OrmusBackup"
```

Or set environment variable:
```bash
BACKUP_DRIVE=/path/to/drive backup
```

## Backup Strategy

- **Incremental**: Uses rsync hard links - only changed files use new space
- **Versioned**: Each backup is timestamped (e.g., `20251212_143000/`)
- **Rotation**: Keeps last 5 backups (configurable via `KEEP_BACKUPS`)
- **Space efficient**: Hard links mean unchanged files share disk blocks

## Restore Procedure

### Full Restore (Disaster Recovery)

```bash
# 1. Boot into fresh Pop!_OS installation
# 2. Mount backup drive
# 3. Copy restore script or run manually:

rsync -avh /media/user/BackupDrive/backups/latest/ ~/
```

### Selective Restore

```bash
# Restore specific directory
rsync -avh /path/to/backup/projects/ ~/projects/

# Restore single file
cp /path/to/backup/dotfiles/.zshrc ~/.zshrc
```

### Restore from Specific Backup

```bash
restore --list                    # See available backups
restore 20251210_020000           # Restore that backup
```

## Logs & Monitoring

```bash
# View auto-backup logs
ls ~/.claude-backups/logs/
tail -f ~/.claude-backups/logs/backup-$(date +%Y%m%d).log

# Check last backup status
cat ~/.claude-backups/logs/backup-*.log | tail -20
```

## Customization

Edit `~/bin/backup` to modify:

| Variable | Purpose |
|----------|---------|
| `BACKUP_DRIVE` | Mount point for backup drive |
| `BACKUP_DIRS` | Directories to back up |
| `DOTFILES` | Individual files to back up |
| `EXCLUDES` | Patterns to skip |
| `KEEP_BACKUPS` | Number of versions to retain |

## 3-2-1 Rule Compliance

Current setup provides:
- **3 copies**: Original + backup drive + Syncthing to Windows
- **2 media types**: NVMe SSD + External drive
- **1 offsite**: Consider adding cloud backup for true offsite

### Adding Cloud Backup (Future)

```bash
# Install rclone for cloud sync
sudo apt install rclone
rclone config  # Set up Google Drive, Backblaze, etc.

# Add to backup script or create separate cloud-backup script
rclone sync ~/projects remote:backups/projects
```

## Troubleshooting

| Issue | Solution |
|-------|----------|
| "Backup drive not found" | Mount drive, check label matches config |
| Permission denied | Check drive mount options (user access) |
| Backup too slow | First run is full copy; subsequent are incremental |
| Low disk space warning | Free space or increase threshold in script |

## File Locations

| File | Purpose |
|------|---------|
| `~/bin/backup` | Main backup script |
| `~/bin/restore` | Restore script |
| `~/bin/backup-auto` | Cron wrapper (silent if no drive) |
| `~/.claude-backups/logs/` | Auto-backup logs |
| `/media/.../backups/` | Backup destination on drive |
| `/media/.../backups/latest` | Symlink to most recent backup |
