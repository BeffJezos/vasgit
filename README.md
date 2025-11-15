![Vasgit Logo](.vasgit/VASGIT.png)

**Professional Git workflows and AI IDE rules for solo developers.**

Vasgit is a collection of battle-tested development workflow templates for AI-assisted solo development. Get clean Git history, professional commit standards, and the "top" confirmation workflow that prevents broken commits.

## What is Vasgit?

A **template repository** that provides ready-to-use AI IDE rules files. Not a framework or library - just templates you copy into your projects.

## Features

- **Solo Dev-First Workflow** (battle-tested over hundreds of hours)
- **"Top" Confirmation System** prevents broken commits
- **Semantic Versioning** with automated standards
- **Technology-Specific Templates** for React, JavaScript, TypeScript, Python, Flutter, Go
- **Multi-IDE Support** for Cursor, GitHub Copilot, and others

## Quick Start

### Option 1: GitHub Template (Recommended for New Projects)

1. Click **"Use this template"** on GitHub
2. Create your new repository
3. Clone it: `git clone <your-repo>`
4. Run setup: `bash .vasgit/scripts/setup.sh`
5. Delete `.vasgit/` when done: `rm -rf .vasgit/`

### Option 2: Setup Script (For Any Project)

For existing projects or manual setup:

```bash
# For existing projects: navigate to your project
cd ~/my-existing-project

# For new projects: clone vasgit
git clone https://github.com/BeffJezos/vasgit my-new-project
cd my-new-project

# Run setup script
bash .vasgit/scripts/setup.sh

# The script will:
# - Ask if this is a new or existing project
# - Let you choose your IDE (Cursor, Universal, GitHub Copilot)
# - Let you choose your tech stack
# - Automatically create the right rules directory
# - Copy the template to the right location
```

## How It Works

### The "Top" Confirmation Workflow

1. **You give tasks** → "Add login screen, fix navigation, update colors"
2. **AI makes changes** → All changes completed
3. **You test** → Check everything works
4. **You say "top"** → AI commits each logical change separately

This prevents broken commits and maintains clean Git history.

### Git Workflows

The setup script lets you choose your workflow:

**Dev-First (Recommended)**
- Development on `dev` branch
- Merge to `main` for releases with `--no-ff`
- Clear release points in history
- Best for projects with planned releases

**Linear**
- All work directly on `main` branch
- Simplest possible history
- Good for small projects or experiments

Both use semantic versioning (v0.X.Y+Z) and the "top" confirmation system.

## Available Technologies

### React
Component-based development with hooks, modern patterns, ESLint, React Testing Library.

### JavaScript/Node.js
Full-stack development with ES6+, npm/yarn workflows, Jest testing.

### TypeScript
Type-safe development with strict checking, no `any` types, comprehensive type definitions.

### Python
Backend/data science with type hints, black/flake8/mypy, pytest, dataclasses.

### Flutter/Dart
Cross-platform mobile with widgets, const constructors, Provider/Riverpod, widget tests.

### Go
Backend/CLI/microservices with explicit error handling, goroutines, table-driven tests.

### Generic
Fallback template for other tech stacks.

## Documentation

- **[Golden Rules](.vasgit/docs/golden-rules.md)**: Complete "top" workflow guide
- **[Git Workflows](.vasgit/docs/git-workflows.md)**: Detailed workflow explanations
- **[Contributing](.vasgit/CONTRIBUTING.md)**: How to contribute templates

## After Setup

The setup script automatically cleans up unnecessary files and keeps only:

- Your selected rules file (`.cursor/rules`, `.ai-ide/rules`, etc.)
- `.vasgit/docs/` with golden rules and workflow documentation
- `.vasgit/CONTRIBUTING.md` and `.vasgit/LICENSE`

Your project stays clean and ready for development.

## Installation for Different IDEs

The setup script handles this automatically, but manual paths:

- **Cursor**: `.cursor/rules`
- **GitHub Copilot**: `.github/copilot-rules.md`
- **Universal**: `.ai-ide/rules`

## Validate Your Rules

```bash
python3 .vasgit/scripts/validate-rules.py <rules-file-path> --verbose
```

## Support

- **Documentation**: [github.com/BeffJezos/vasgit](https://github.com/BeffJezos/vasgit)
- **Issues**: [github.com/BeffJezos/vasgit/issues](https://github.com/BeffJezos/vasgit/issues)

---

Made by Vasily aka BeffJezos.
