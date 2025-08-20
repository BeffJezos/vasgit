# Vasgit

![Vasgit Logo](VASGIT.png)

> **Use at your own risk**: While the solo workflow has been extensively tested over hundreds of hours, always backup your work and test in non-production environments first.

**Professional Git workflows and AI IDE rules for solo developers.**

Vasgit provides battle-tested development workflows specifically designed for AI-assisted solo development. Get clean Git history, professional commit standards, and robust version management with the "top" confirmation workflow.

## Features Overview

- **Solo Dev-First Workflow** (battle-tested over hundreds of hours)
- **Automated Commit Standards** with semantic versioning
- **Quality Assurance** through comprehensive rules and validation
- **"Top" Confirmation System** for clean, logical commits
- **Multi-IDE Support** for Cursor, GitHub Copilot, CodeWhisperer, and more
- **Technology-Specific** templates for React, JavaScript, Python

## Quick Start

### 1. Clone Repository
```bash
git clone https://github.com/BeffJezos/vasgit
cd vasgit
```

### 2. Manual Setup (Quick)

#### For Solo Development
```bash
# Copy solo template
cp templates/solo-workflow.md .ai-ide/rules
```

#### For Technology-Specific Rules
```bash
# Copy technology-specific template
cp templates/examples/react-solo-rules.md .ai-ide/rules
# or javascript-solo-rules.md, python-solo-rules.md, typescript-solo-rules.md
```

### 3. Run Automated Setup
```bash
chmod +x scripts/setup.sh
./scripts/setup.sh
```

### 4. Choose Your Workflow
The setup script will guide you through:
- Selecting your Git workflow (Solo Dev-First)
- Choosing your technology stack
- Configuring solo development rules
- Automatic version management setup (no manual configuration needed)

### 5. Start Using Your AI Assistant
Tell your AI assistant:
```
"Please read and follow all rules in .ai-ide/rules. 
Pay special attention to the 'top' confirmation workflow."
```

### Solo Workflow Best Practices
1. **Always start each chat** by asking your AI assistant to read and follow the rules
2. **Keep uncommitted changes manageable** - commit when you have more than 3-5 logical groups
3. **Use the "top" confirmation** - this prevents broken commits and maintains clean history
4. **Read the Golden Rules** - see `golden-rules.md` for complete setup guide

## Available Workflows

### Dev-First Workflow (Solo Development)
- Development on dev branch, merge to main for releases
- Fast iteration with user confirmation ("top" workflow)
- Perfect for MVPs, solo developers, rapid prototyping
- **Status**: **Battle-tested** - Proven over hundreds of hours

## Available Technologies

### Core Templates
- **`solo-workflow.md`**: Universal solo development workflow
- **`golden-rules.md`**: Complete setup and usage guide

### Technology-Specific Templates
- **React**: Component-based development with hooks and modern patterns
- **JavaScript/Node.js**: Full-stack development with modern ES6+ features
- **Python**: Backend/data science development with type hints and testing
- **TypeScript**: Type-safe development with strict type checking

### Examples Available
- **`react-solo-rules.md`**: React solo development with modern tooling
- **`javascript-solo-rules.md`**: JavaScript/Node.js solo development
- **`python-solo-rules.md`**: Python solo development for backend/data science
- **`typescript-solo-rules.md`**: TypeScript solo development with strict type safety

## Documentation

- **[Git Workflows](docs/git-workflows.md)**: Detailed workflow explanations and best practices
- **[Solo Workflow Golden Rules](golden rules/golden-rules.md)**: Complete "top" workflow guide

## Validate Your Rules (Check Template Syntax)
```bash
python3 scripts/validate-rules.py .ai-ide/rules --verbose
```
*This checks if your rules file has correct syntax and required sections*

## Installation for Different IDEs

### Cursor IDE
1. Place rules in `.cursor/rules` 
2. Tell AI: "Read and follow the rules in .cursor/rules"

### GitHub Copilot
1. Place rules in `.github/copilot-rules.md`
2. Reference in your prompts

### Universal Setup
1. Place rules in `.ai-ide/rules`
2. Works with any AI-powered IDE

## Contributing

I welcome contributions from the community! See [CONTRIBUTING.md](CONTRIBUTING.md) for:

- How to submit templates for new technologies
- Guidelines for improving existing workflows
- Testing and validation procedures
- Documentation standards

---

**Made by Vasily aka BeffJezos.**

Happy coding!