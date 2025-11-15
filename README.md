![Vasgit Logo](.vasgit/VASGIT.png)

**Professional Git workflows and AI IDE rules for solo developers.**

A **template repository** with battle-tested development workflow templates for AI-assisted solo development. Not a framework or library - just ready-to-use rules files you copy into your projects. Get clean Git history, professional commit standards, and the "top" confirmation workflow that prevents broken commits.

## Features

- **Solo Dev-First Workflow** (battle-tested over hundreds of hours)
- **"Top" Confirmation System** prevents broken commits
- **Semantic Versioning** with automated standards
- **Technology-Specific Templates** for React, JavaScript, TypeScript, Python, Flutter, Go
- **Multi-IDE Support** for Cursor, GitHub Copilot, and others

## Quick Start

### Option 1: GitHub Template (New Projects)

1. Click **"Use this template"** on GitHub
2. Create your new repository
3. Clone it: `git clone <your-repo>`
4. Run setup: `bash .vasgit/scripts/setup.sh`
5. Setup automatically cleans up unnecessary files

**The setup script will ask you about workflow and tech stack, then automatically remove all unnecessary files.**

### Option 2: Existing Projects

```bash
# Navigate to your existing project
cd ~/my-existing-project

# Clone vasgit temporarily
git clone https://github.com/BeffJezos/vasgit /tmp/vasgit

# Run setup (it will ask for your project path)
bash /tmp/vasgit/.vasgit/scripts/setup.sh

# Cleanup
rm -rf /tmp/vasgit

# The script will:
# - Copy the rules file to your project
# - Ask you about workflow and tech stack
# - Create the correct IDE directory (.cursor/, .ai-ide/, etc.)
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
- **[Updating](.vasgit/docs/updating.md)**: How to update vasgit rules
- **[GitHub Token Setup](.vasgit/docs/github-token-setup.md)**: Enable AI auto-push (optional)
- **[Contributing](.vasgit/CONTRIBUTING.md)**: How to contribute templates

## After Setup

The setup script automatically cleans up unnecessary files and keeps only:

- Your selected rules file (`.cursor/rules`, `.ai-ide/rules`, etc.)
- `.vasgit/docs/` with golden rules and workflow documentation
- `.vasgit/CONTRIBUTING.md` and `.vasgit/LICENSE`

Your project stays clean and ready for development.

## Supported IDEs

The setup script handles this automatically, but manual paths:

- **Cursor**: `.cursor/rules`
- **Windsurf**: `.wind/rules`
- **VS Code / Visual Studio (Copilot)**: `.github/copilot-instructions.md`
- **JetBrains (IntelliJ, PyCharm, etc.)**: `.github/copilot-instructions.md`
- **Universal**: `.ai-ide/rules` (for any other AI IDE)

## Getting Updates

Vasgit is a template - you get a snapshot when you create your project. To update to the latest rules:

**Quick Update:**
```bash
# Re-run the setup script (backs up your current rules automatically)
cd /tmp && git clone https://github.com/BeffJezos/vasgit
bash vasgit/.vasgit/scripts/setup.sh  # Choose "existing project"
```

**Manual Update:**
```bash
# Download latest rules for your tech stack
curl -o .cursor/rules https://raw.githubusercontent.com/BeffJezos/vasgit/main/.vasgit/examples/react-solo-rules.md
```

Read the full [update guide](.vasgit/docs/updating.md) for details.

## Validate Your Rules

```bash
python3 .vasgit/scripts/validate-rules.py <rules-file-path> --verbose
```

## Support

- **Documentation**: [github.com/BeffJezos/vasgit](https://github.com/BeffJezos/vasgit)
- **Issues**: [github.com/BeffJezos/vasgit/issues](https://github.com/BeffJezos/vasgit/issues)

---

Made by Vasya aka BeffJezos.
