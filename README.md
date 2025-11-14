# Vasgit

![Vasgit Logo](VASGIT.png)

> **Use at your own risk**: While the solo workflow has been extensively tested over hundreds of hours, always backup your work and test in non-production environments first.

**Professional Git workflows and AI IDE rules for solo developers.**

Vasgit is a collection of battle-tested development workflow templates specifically designed for AI-assisted solo development. Get clean Git history, professional commit standards, and robust version management with the "top" confirmation workflow.

## What is Vasgit?

Vasgit is a **template repository** - not a framework or library. It provides ready-to-use AI IDE rules files that you copy into your own projects. Think of it as a cookbook: you pick the recipes (rules) you need for your specific tech stack.

## Features

- **Solo Dev-First Workflow** (battle-tested over hundreds of hours)
- **Automated Commit Standards** with semantic versioning
- **"Top" Confirmation System** for clean, logical commits
- **Multi-IDE Support** for Cursor, GitHub Copilot, CodeWhisperer, and more
- **Technology-Specific** templates for React, JavaScript, TypeScript, Python, Flutter, Go

## Quick Start

Choose your setup method based on your situation:

### For Existing Projects

Copy the rules file for your tech stack into your project:

```bash
# Navigate to your project
cd ~/my-existing-project

# Copy the rules file you need (choose one)
curl -o .cursor/rules https://raw.githubusercontent.com/BeffJezos/vasgit/main/examples/flutter-solo-rules.md
# OR for React:
curl -o .cursor/rules https://raw.githubusercontent.com/BeffJezos/vasgit/main/examples/react-solo-rules.md
# OR for Python:
curl -o .cursor/rules https://raw.githubusercontent.com/BeffJezos/vasgit/main/examples/python-solo-rules.md
# OR for JavaScript:
curl -o .cursor/rules https://raw.githubusercontent.com/BeffJezos/vasgit/main/examples/javascript-solo-rules.md
# OR for TypeScript:
curl -o .cursor/rules https://raw.githubusercontent.com/BeffJezos/vasgit/main/examples/typescript-solo-rules.md
# OR for Go:
curl -o .cursor/rules https://raw.githubusercontent.com/BeffJezos/vasgit/main/examples/go-solo-rules.md

# Tell your AI assistant:
# "Read and follow the rules in .cursor/rules. Pay attention to the 'top' workflow."
```

### For New Projects

**Option 1: Use GitHub Template (Recommended)**
1. Click "Use this template" on GitHub
2. Create your new repository
3. Clone it and start coding

**Option 2: Clone and Customize**
```bash
# Clone vasgit
git clone https://github.com/BeffJezos/vasgit my-new-project
cd my-new-project

# Remove vasgit's git history
rm -rf .git
git init

# Copy the rules you need
cp examples/react-solo-rules.md .cursor/rules

# Remove example files you don't need
rm -rf examples/ templates/ golden\ rules/

# Start your project
git add .
git commit -m "initial commit (v1.0.0)"
```

### Using the Setup Script

For more interactive setup with validation:

```bash
# Clone vasgit
git clone https://github.com/BeffJezos/vasgit
cd vasgit

# Run setup
chmod +x scripts/setup.sh
./scripts/setup.sh

# The script will:
# - Ask for your target project path
# - Let you choose your tech stack
# - Copy the right rules file to your project
```

## How It Works

### The "Top" Confirmation Workflow

Vasgit's core feature is the **"top" confirmation system**:

1. **You give tasks** → "Add login screen, fix navigation, update colors"
2. **AI makes changes** → All changes completed
3. **You test** → Check everything works
4. **You say "top"** → AI commits each logical change separately

This prevents broken commits and maintains a clean Git history. Read the [golden rules](golden%20rules/golden-rules.md) for complete workflow guidance.

### Solo Dev-First Workflow

All templates use the **dev-first workflow**:
- Development on `dev` branch
- Merge to `main` for releases with `--no-ff`
- Clean, professional Git history
- Battle-tested over hundreds of hours

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