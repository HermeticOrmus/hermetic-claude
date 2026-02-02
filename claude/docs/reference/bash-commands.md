# Bash Commands Reference

**Quick command lookup for common operations**

## Package Management

### Node.js (npm)

```bash
npm install              # Install dependencies from package.json
npm install [package]    # Add new package
npm install -D [pkg]     # Add dev dependency
npm update              # Update all packages
npm outdated            # Check for outdated packages
npm run [script]        # Run package.json script
```

### Node.js (yarn)

```bash
yarn install            # Install dependencies
yarn add [package]      # Add new package
yarn add -D [pkg]      # Add dev dependency
yarn upgrade           # Update packages
yarn [script]          # Run package.json script
```

### Python (pip)

```bash
pip install -r requirements.txt  # Install dependencies
pip install [package]            # Add new package
pip install --upgrade [package]  # Update package
pip list                        # List installed packages
pip freeze > requirements.txt    # Save dependencies
```

### Python (Poetry)

```bash
poetry install          # Install dependencies
poetry add [package]    # Add new package
poetry update          # Update all packages
poetry run [command]   # Run command in venv
```

## Development

### Common scripts (adapt to your project)

```bash
npm run dev            # Start development server
npm run build          # Build for production
npm test              # Run tests
npm run format        # Format code
npm run lint          # Lint code
npm run type-check    # Type checking
```

### System Details

```bash
node --version        # Check Node.js version
npm --version         # Check npm version
python --version      # Check Python version
git --version         # Check Git version
```

## Git Workflow

### Basic operations

```bash
git status            # Check current state
git add .             # Stage all changes
git add [file]        # Stage specific file
git commit -m "msg"   # Commit with message
git push              # Push to remote
git pull              # Pull from remote
```

### Branching

```bash
git branch                    # List branches
git branch [name]             # Create branch
git checkout [branch]         # Switch branch
git checkout -b [branch]      # Create and switch
git merge [branch]            # Merge branch
git branch -d [branch]        # Delete branch
```

### History

```bash
git log                      # View commit history
git log --oneline            # Compact history
git log --graph --oneline    # Visual history
git diff                     # Show changes
git diff --staged            # Show staged changes
```

### Undo operations

```bash
git reset HEAD [file]        # Unstage file
git checkout -- [file]       # Discard changes
git revert [commit]          # Revert commit
git reset --soft HEAD~1      # Undo last commit (keep changes)
```

## File Operations

### Navigation

```bash
pwd                   # Print working directory
ls                    # List files
ls -la                # List all files (detailed)
cd [directory]        # Change directory
cd ..                 # Go up one level
cd ~                  # Go to home directory
```

### File manipulation

```bash
mkdir [directory]     # Create directory
mkdir -p [path]       # Create nested directories
touch [file]          # Create empty file
rm [file]             # Remove file
rm -rf [directory]    # Remove directory recursively
cp [src] [dest]       # Copy file
mv [src] [dest]       # Move/rename file
```

### File viewing

```bash
cat [file]            # Display file contents
less [file]           # Page through file
head [file]           # Show first lines
tail [file]           # Show last lines
tail -f [file]        # Follow file updates
```

## Project-Specific

### This machine (Pop!_OS)

```bash
# Node.js version management
nvm list              # List installed Node versions
nvm use [version]     # Switch Node version
nvm current           # Show current version

# System package management
apt search [package]  # Search for package
sudo apt update       # Update package list
sudo apt install [pkg]  # Install package
sudo apt upgrade      # Upgrade packages
```

## Process Management

```bash
ps aux                # List all processes
top                   # Monitor processes (interactive)
htop                  # Better process monitor (if installed)
kill [pid]            # Kill process by ID
killall [name]        # Kill processes by name
```

## Network

```bash
ping [host]           # Test connectivity
curl [url]            # Fetch URL
wget [url]            # Download file
ip addr               # Show IP addresses
netstat -tuln         # Show listening ports
```

## Compression

```bash
tar -czf file.tar.gz [files]   # Create compressed archive
tar -xzf file.tar.gz           # Extract archive
zip -r archive.zip [files]     # Create zip file
unzip archive.zip              # Extract zip
```

## Find & Search

```bash
find . -name "[pattern]"       # Find files by name
grep "[pattern]" [file]        # Search in file
grep -r "[pattern]" .          # Recursive search
which [command]                # Find command location
whereis [command]              # Locate command files
```

## Disk Usage

```bash
df -h                 # Disk space (human readable)
du -sh [directory]    # Directory size
du -h --max-depth=1   # Size of subdirectories
```

## Permissions

```bash
chmod +x [file]       # Make file executable
chmod 755 [file]      # Set specific permissions
chown [user] [file]   # Change file owner
sudo [command]        # Run as superuser
```

## Useful Shortcuts

```bash
Ctrl+C               # Cancel current command
Ctrl+D               # Exit shell / End of file
Ctrl+L               # Clear screen
Ctrl+R               # Search command history
!!                   # Repeat last command
sudo !!              # Repeat last command as sudo
```

## Project-Specific Commands

**Add your frequently-used commands here**:
```bash
# Example: Custom development workflow
# npm run dev:db        # Start local database
# npm run dev:api       # Start API server
# npm run dev:client    # Start frontend
```
