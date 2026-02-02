---
description: Set up development environment for a project or technology
---

# Setup Development Environment

Help me set up a complete development environment for this project or technology.

## Setup Process

### 1. Requirements Check
- Operating system requirements
- Required tools and versions
- Hardware requirements
- Disk space needed

### 2. Install Dependencies

**System Packages**:
```bash
sudo apt update
sudo apt install [packages]
```

**Language Runtime**:
- Node.js (via nvm)
- Python (via pyenv)
- Ruby (via rbenv)
- Go, Rust, etc.

**Package Managers**:
- npm/yarn/pnpm
- pip/poetry
- gem/bundler
- cargo

### 3. Project Setup

**Clone & Install**:
```bash
git clone [repo]
cd [project]
[install command]
```

**Configuration**:
- Copy .env.example to .env
- Fill in required environment variables
- Set up config files
- Generate secrets/keys

**Database Setup** (if needed):
```bash
# Create database
# Run migrations
# Seed data
```

### 4. Verify Installation

**Run Tests**:
```bash
npm test
# or appropriate test command
```

**Start Development Server**:
```bash
npm run dev
# or appropriate start command
```

**Check Health**:
- Open app in browser
- Check all features work
- Verify database connection
- Check API endpoints

### 5. Development Tools

**Editor Setup**:
- VSCode extensions
- Linter configuration
- Formatter setup
- Debugger setup

**Git Setup**:
- Configure git user
- Set up SSH keys
- Configure git hooks
- Set up pre-commit checks

**Optional Tools**:
- Docker & docker-compose
- Database GUI
- API testing tool (Postman, Insomnia)
- Debugging tools

### 6. Documentation

Create local setup guide:
- Installation steps
- Configuration
- Common commands
- Troubleshooting

### 7. Troubleshooting Common Issues

- Port conflicts
- Permission errors
- Missing dependencies
- Version mismatches
- Database connection issues

Guide me through setting up everything correctly!
