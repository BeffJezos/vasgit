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
- **Technology-Specific** templates for React, JavaScript, TypeScript, Python, Flutter, Go

## Quick Start

### Step 1: Clone Repository
```bash
git clone https://github.com/BeffJezos/vasgit
cd vasgit
```

### Step 2: Choose Setup Method

#### Option A: Automated Setup (Recommended)
```bash
chmod +x scripts/setup.sh
./scripts/setup.sh
```
The setup script will guide you through:
- Selecting your technology stack (React, JavaScript, TypeScript, Python, Flutter, Go, or generic)
- Automatically copying the right template to `.ai-ide/rules`
- Setting up your solo development workflow

#### Option B: Manual Setup
```bash
# Copy technology-specific template (choose one)
cp examples/react-solo-rules.md .ai-ide/rules
# OR
cp examples/javascript-solo-rules.md .ai-ide/rules
# OR
cp examples/typescript-solo-rules.md .ai-ide/rules
# OR
cp examples/python-solo-rules.md .ai-ide/rules
# OR
cp examples/flutter-solo-rules.md .ai-ide/rules
# OR
cp examples/go-solo-rules.md .ai-ide/rules
# OR (fallback for other tech stacks)
cp templates/solo-workflow.md .ai-ide/rules
```

### Step 3: Start Using Your AI Assistant
Tell your AI assistant:
```
"Please read and follow all rules in .ai-ide/rules. 
Pay special attention to the 'top' confirmation workflow."
```

### Solo Workflow Best Practices
1. **Always start each chat** by asking your AI assistant to read and follow the rules
2. **Keep uncommitted changes manageable** - commit when you have more than 3-5 logical groups
3. **Use the "top" confirmation** - this prevents broken commits and maintains clean history
4. **Read the Golden Rules** - see [golden-rules.md](golden%20rules/golden-rules.md) for complete setup guide

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
- **TypeScript**: Type-safe development with strict type checking
- **Python**: Backend/data science development with type hints and testing
- **Flutter/Dart**: Cross-platform mobile development with widgets
- **Go**: Backend/CLI/microservices with performance focus

### Examples Available
- **`react-solo-rules.md`**: React solo development with modern tooling
- **`javascript-solo-rules.md`**: JavaScript/Node.js solo development
- **`typescript-solo-rules.md`**: TypeScript solo development with strict type safety
- **`python-solo-rules.md`**: Python solo development for backend/data science
- **`flutter-solo-rules.md`**: Flutter/Dart solo development for mobile apps
- **`go-solo-rules.md`**: Go solo development for backend/CLI tools

## Documentation

- **[Git Workflows](docs/git-workflows.md)**: Detailed workflow explanations and best practices
- **[Solo Workflow Golden Rules](golden%20rules/golden-rules.md)**: Complete "top" workflow guide

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

Made by Vasily aka BeffJezos.