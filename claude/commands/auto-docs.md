# Auto-Documentation Command

Automatically generate, update, and maintain project documentation without user intervention.

## Your Task

Autonomously analyze the current project and generate/update comprehensive documentation.

## Autonomous Documentation Steps

1. **Analyze Project Structure**
   - Scan all code files
   - Identify main components, modules, and functions
   - Detect project type (Node.js, Python, etc.)
   - Find existing documentation

2. **Generate/Update README.md**
   - Project description
   - Installation instructions
   - Usage examples
   - API reference (if applicable)
   - Contributing guidelines
   - License information

3. **Create API Documentation**
   - For each exported function/class:
     - Purpose and description
     - Parameters and types
     - Return values
     - Usage examples
     - Edge cases and errors

4. **Update Code Comments**
   - Add JSDoc/docstring comments where missing
   - Update outdated comments
   - Document complex logic
   - Add type annotations

5. **Generate Architecture Docs**
   - System architecture overview
   - Data flow diagrams (in markdown)
   - Component relationships
   - Design decisions

6. **Create CLAUDE.md**
   - Project context for Claude
   - Development patterns
   - Testing approach
   - Deployment process
   - Common commands

7. **Auto-commit Documentation**
   - Stage all documentation changes
   - Create commit: "docs: Auto-generate/update project documentation"
   - Show summary of what was documented

## Documentation Standards

### README.md Template
```markdown
# Project Name

Brief description of what this project does.

## Installation

[Auto-generated installation steps]

## Usage

[Auto-generated usage examples]

## API

[Auto-generated API documentation]

## Development

[Auto-generated development guide]

## Contributing

[Auto-generated contributing guidelines]

## License

[License information]
```

### Code Comment Standards
- **Functions**: Purpose, parameters, return value, example
- **Classes**: Purpose, key methods, usage example
- **Complex Logic**: Why this approach, edge cases handled
- **Configuration**: What each option does, valid values

## Execution Instructions

Execute autonomously:
1. Scan the project
2. Generate all documentation
3. Write files
4. Format everything
5. Commit changes
6. Report what was documented

Do NOT ask for permission - just generate comprehensive documentation and commit it.

If the project already has docs, update and enhance them rather than replacing.

Be thorough. Be clear. Be autonomous.
