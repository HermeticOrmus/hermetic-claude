# ═══════════════════════════════════════════════════════════════
#                 HERMETIC CLAVDE - Installation Script
#                          (Windows PowerShell)
# ═══════════════════════════════════════════════════════════════
#
# "SOLVE ET COAGVLA"
#
# This script installs the Hermetic Claude system by creating
# symbolic links from this repository to ~/.claude and ~/.hermetic
#
# NOTE: Requires Administrator privileges for symbolic links
#       OR Developer Mode enabled in Windows Settings
#
# ═══════════════════════════════════════════════════════════════

$ErrorActionPreference = "Stop"

# Paths
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoDir = Split-Path -Parent $ScriptDir
$ClaudeSource = Join-Path $RepoDir "claude"
$HermeticSource = Join-Path $RepoDir "hermetic"
$ClaudeTarget = Join-Path $env:USERPROFILE ".claude"
$HermeticTarget = Join-Path $env:USERPROFILE ".hermetic"
$BackupDir = Join-Path $env:USERPROFILE ".hermetic-backup-$(Get-Date -Format 'yyyyMMdd-HHmmss')"

Write-Host ""
Write-Host "╔═══════════════════════════════════════════════════════════════╗" -ForegroundColor Magenta
Write-Host "║              HERMETIC CLAVDE - Installation                   ║" -ForegroundColor Magenta
Write-Host "║                                                               ║" -ForegroundColor Magenta
Write-Host "║     `"As above, so below. As the code, so the consciousness.`" ║" -ForegroundColor Magenta
Write-Host "╚═══════════════════════════════════════════════════════════════╝" -ForegroundColor Magenta
Write-Host ""

# Function to backup existing directory
function Backup-IfExists {
    param (
        [string]$Target,
        [string]$Name
    )

    if (Test-Path $Target) {
        Write-Host "Found existing $Name at $Target" -ForegroundColor Yellow

        # Check if it's a symbolic link
        $item = Get-Item $Target -Force
        if ($item.LinkType -eq "SymbolicLink") {
            Write-Host "  → Removing existing symlink" -ForegroundColor Blue
            Remove-Item $Target -Force
        } else {
            Write-Host "  → Backing up to $BackupDir\" -ForegroundColor Blue
            if (-not (Test-Path $BackupDir)) {
                New-Item -ItemType Directory -Path $BackupDir | Out-Null
            }
            Move-Item $Target (Join-Path $BackupDir $Name)
        }
    }
}

# Check if source directories exist
if (-not (Test-Path $ClaudeSource)) {
    Write-Host "Error: Claude source directory not found at $ClaudeSource" -ForegroundColor Red
    exit 1
}

if (-not (Test-Path $HermeticSource)) {
    Write-Host "Error: Hermetic source directory not found at $HermeticSource" -ForegroundColor Red
    exit 1
}

Write-Host "Installing from: $RepoDir" -ForegroundColor Blue
Write-Host ""

# Backup existing installations
Backup-IfExists -Target $ClaudeTarget -Name "claude"
Backup-IfExists -Target $HermeticTarget -Name "hermetic"

# Create symbolic links
Write-Host "Creating symbolic links..." -ForegroundColor Green

try {
    New-Item -ItemType SymbolicLink -Path $ClaudeTarget -Target $ClaudeSource -Force | Out-Null
    Write-Host "  ✓ $ClaudeTarget → $ClaudeSource" -ForegroundColor Green
} catch {
    Write-Host "  ✗ Failed to create Claude symlink" -ForegroundColor Red
    Write-Host "    Try running as Administrator or enable Developer Mode" -ForegroundColor Yellow
    exit 1
}

try {
    New-Item -ItemType SymbolicLink -Path $HermeticTarget -Target $HermeticSource -Force | Out-Null
    Write-Host "  ✓ $HermeticTarget → $HermeticSource" -ForegroundColor Green
} catch {
    Write-Host "  ✗ Failed to create Hermetic symlink" -ForegroundColor Red
    Write-Host "    Try running as Administrator or enable Developer Mode" -ForegroundColor Yellow
    exit 1
}

Write-Host ""

# Verify installation
Write-Host "Verifying installation..." -ForegroundColor Blue

if ((Test-Path $ClaudeTarget) -and (Get-Item $ClaudeTarget).LinkType -eq "SymbolicLink") {
    $CommandsCount = (Get-ChildItem -Path (Join-Path $ClaudeTarget "commands") -Filter "*.md" -Recurse -ErrorAction SilentlyContinue).Count
    $SkillsCount = (Get-ChildItem -Path (Join-Path $ClaudeTarget "skills") -Directory -ErrorAction SilentlyContinue).Count
    Write-Host "  ✓ Claude: $CommandsCount commands, $SkillsCount skills" -ForegroundColor Green
} else {
    Write-Host "  ✗ Claude installation failed" -ForegroundColor Red
    exit 1
}

if ((Test-Path $HermeticTarget) -and (Get-Item $HermeticTarget).LinkType -eq "SymbolicLink") {
    Write-Host "  ✓ Hermetic: Installed" -ForegroundColor Green
} else {
    Write-Host "  ✗ Hermetic installation failed" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "╔═══════════════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║                  Installation Complete!                       ║" -ForegroundColor Green
Write-Host "╚═══════════════════════════════════════════════════════════════╝" -ForegroundColor Green
Write-Host ""
Write-Host "The ALQVIMIST'S LABORATORIVM is ready." -ForegroundColor Magenta
Write-Host ""
Write-Host "Quick start:"
Write-Host "  /calcinate src/     # Analyze code"
Write-Host "  /dissolve           # Research"
Write-Host "  /distill            # Extract patterns"
Write-Host ""
Write-Host "SOLVE ET COAGVLA" -ForegroundColor Blue
Write-Host ""

if (Test-Path $BackupDir) {
    Write-Host "Note: Your previous installation was backed up to:" -ForegroundColor Yellow
    Write-Host "  $BackupDir"
    Write-Host ""
}
