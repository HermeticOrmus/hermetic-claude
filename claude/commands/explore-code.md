---
description: Explore and understand a codebase systematically
thinking: true
---

# Explore Codebase

Help me understand this codebase by exploring it systematically.

## Exploration Strategy

### 1. High-Level Overview
- **Purpose**: What does this project do?
- **Architecture**: How is it structured?
- **Technologies**: What's the tech stack?
- **Entry Points**: Where does execution start?

### 2. Directory Structure
```bash
tree -L 2 -I 'node_modules|dist|build'
```

Understand organization:
- Source code location
- Tests location
- Configuration files
- Documentation
- Build artifacts

### 3. Key Files

**Configuration**:
- package.json / requirements.txt
- .env.example
- config files
- .gitignore

**Documentation**:
- README.md
- ARCHITECTURE.md
- CONTRIBUTING.md
- Inline comments

**Entry Points**:
- main.js / index.js
- app.py / __main__.py
- Main function

### 4. Dependencies Analysis

**External Dependencies**:
- What libraries are used?
- Why were they chosen?
- Are they up to date?

**Internal Dependencies**:
- Module relationships
- Import patterns
- Dependency graph

### 5. Code Patterns

**Common Patterns**:
- Architecture (MVC, layered, etc.)
- Design patterns used
- Coding conventions
- File naming patterns

**Data Flow**:
- How data moves through the system
- State management
- Database interactions

### 6. Key Components

Identify and understand:
- Core business logic
- Authentication/authorization
- Data models
- API endpoints
- UI components
- Utilities

### 7. Testing Strategy

- Test coverage
- Testing frameworks
- How to run tests
- Test patterns

### 8. Build & Deploy

- How to build
- How to run locally
- Environment setup
- Deployment process

### 9. Areas to Explore Deeper

Based on initial exploration, identify:
- Complex areas needing more understanding
- Unclear patterns or decisions
- Potential improvements
- Security considerations

## Exploration Questions

As we explore, answer:
1. How would I add a new feature?
2. Where would I look to fix a bug in [area]?
3. What happens when [event] occurs?
4. How does [component] interact with [component]?
5. Why was [decision] made this way?

## Documentation Output

Create a mental map:
- Component diagram
- Data flow diagram
- Key files list
- Important notes
- Questions for maintainers

Let's explore the codebase together and build understanding!
