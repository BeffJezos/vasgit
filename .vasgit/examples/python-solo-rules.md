---
description: "Python Solo Rules - Solo Development for Backend/Data Science"
globs: []
alwaysApply: true
---

<!-- USE AT YOUR OWN RISK: This template has been tested but may not work in all environments. Always backup your work and test in non-production environments first. -->

# Python Solo Rules - Solo Development Template

Professional solo workflow optimized for Python development in backend, data science, and automation.

⸻

## Git Workflow: Solo Dev-First (Python Optimized)

```
• All development on dev branch for rapid Python iteration
• Merge to main for production deployments  
• Perfect for Django/Flask APIs, data science, automation scripts
• Compatible with pip/conda/poetry workflows
```

### Python Solo Development Commands
```bash
# Daily Python development
git checkout dev
git pull origin dev

# Develop new feature (multiple logical changes)
git add src/models/user.py src/api/auth.py tests/test_auth.py
# User tests everything, then says "top"
# AI commits each logical change separately:
# git commit -m "feat: add user model with validation (v0.8.0+45)"
# git commit -m "feat: add authentication API endpoints (v0.8.0+46)"
# git commit -m "test: add comprehensive auth tests (v0.8.0+47)"
git push origin dev

# When ready for production deployment
git checkout main
git merge --no-ff dev
git tag v0.8.0
git push origin main --tags
git checkout dev
```

⸻

## Forbidden Operations

• **NEVER** `git reset --hard` on dev/main
• **NEVER** force-push without `--force-with-lease`
• **NEVER** commit directly to main
• **NEVER** commit with failing tests
• **NEVER** commit without linting (black, flake8) passing
• **NEVER** commit without type checking (mypy) passing
• **CRITICAL VERSION RULE:** NEVER "invent" versions - ALWAYS check `git log` first!
• **VERSION VALIDATION:** Before each commit validate current version and correctly calculate next version!
• **VERSION SEQUENCE RULE:** No duplicate patch versions and no skipped build numbers!
• **MANDATORY:** After every file change IMMEDIATELY check read_lints and fix!
• **NEVER** mix multiple logical changes in one commit!
• **NEVER** unsafe error handling - always handle errors properly!
• **NEVER** use uppercase or unclear commit messages!
• **NEVER** push when build is failing!
• **CRITICAL:** NEVER leave syntax errors or build errors open!
• **NEVER** commit without "top" confirmation from user!

### **VERSION SEQUENCE CHECKLIST:**
- [ ] **Check Patch Version**: Is the previous patch version identical?
- [ ] **Check Build Number**: Is the next build number +1?
- [ ] **Validate Version Type**: PATCH vs MINOR correctly determined?
- [ ] **No Duplicates**: Use same patch version only once
- [ ] **No Jumps**: Build numbers must be sequential

⸻

## SOLO "TOP" CONFIRMATION WORKFLOW:
**BASIC PRINCIPLE: User says "top" → AI commits all logical changes separately**

### **SOLO WORKFLOW:**
1. **User gives tasks** → "Add user model, create API endpoints, write tests"
2. **AI makes ALL changes** → 3 logical changes ready
3. **User tests everything** → Runs tests, checks functionality
4. **User says "top"** → AI commits each logical change as separate commit
5. **Continue working** → "top - now let's add data visualization"

### **"TOP" EFFICIENCY:**
- **Combine requests**: "top - and also optimize the database queries"
- **Save tokens**: Don't send "top" alone
- **Keep momentum**: "top - now let's add machine learning models"

⸻

## 🚨 CRITICAL: MINOR RELEASE MERGE TO MAIN

**RULE:** Every commit with version 0.X.0 (where X changes) = IMMEDIATE merge to main!

**WORKFLOW FOR MINOR RELEASES (0.X.0):**
1. ✅ Commit on dev: `git commit -m "feat: add ML model API (v0.9.0)"`
2. ⚠️ **STOP! This is a MINOR release (0.9.0)!**
3. 🔄 **IMMEDIATELY merge to main:**
   ```bash
   git checkout main
   git merge --no-ff dev
   git tag v0.9.0
   git push origin main --tags
   git checkout dev
   ```
4. ✅ Continue work on dev

**WHEN TO MERGE TO MAIN:**
- ✅ **YES:** v0.6.0, v0.7.0, v0.8.0, v1.0.0 (X changes in 0.X.0)
- ❌ **NO:** v0.6.1, v0.6.2, v0.6.33 (only Y changes in 0.X.Y)

**EXAMPLES OF MINOR FEATURES:**
- New API endpoints (✓ = 0.X.0)
- Authentication system (✓ = 0.X.0)
- README/Documentation updates (✓ = 0.X.0)
- Database models (✓ = 0.X.0)
- Bug fixes, type hints (✗ = 0.X.Y - PATCH only)

⸻

## Universal Coding Principles (Python-Optimized)
- Use type hints for all function parameters and returns
- **Python-specific:** Follow PEP 8 style guide strictly
- **Python-specific:** Use dataclasses/pydantic for structured data
- Trailing commas in lists/dicts – more readable, better diffs
- Structure files logically: imports → constants → classes → functions → main
- **Dynamic configuration:** Version numbers MUST be loaded from pyproject.toml/setup.py, never hardcoded
- **Follow Python documentation** and best practices at all times
- **Document complex logic** with docstrings and type hints

⸻

## Commit Standards

### Commit Message Format
```
type: description (v0.X.Y+Z)
```

**Python-specific types:**
- `feat`: New models, endpoints, functions
- `fix`: Bug fixes in logic or data processing
- `refactor`: Code restructuring without behavior change
- `perf`: Performance improvements
- `test`: pytest test additions
- `deps`: Dependency updates (requirements.txt, pyproject.toml)
- `data`: Data schema or migration changes

**Examples:**
- `feat: add user authentication with JWT (v0.8.0+45)`
- `fix: resolve pandas memory leak in data processing (v0.7.15+46)`
- `perf: optimize database queries with SQLAlchemy (v0.7.16+47)`

⸻

## Semantic Versioning: Python

### Version File: `pyproject.toml` or `setup.py`

**MINOR (0.X.0) - Python specific:**
- New API endpoints
- New data models
- Database schema changes
- New external integrations
- Major algorithm changes
- New machine learning models

**PATCH (0.X.Y) - Python specific:**
- Bug fixes
- Performance optimizations
- Code refactoring (no behavior change)
- Dependency updates
- Documentation improvements

### **CRITICAL VERSION TYPE RULES:**
- **Content revisions** = MINOR (0.X.0) - NOT PATCH!
- **README/Documentation updates** = MINOR (0.X.0) - NOT PATCH!
- **Fundamental text changes** = MINOR (0.X.0) - NOT PATCH!
- **Only small corrections** = PATCH (0.X.Y)

⸻

## Python Quality Standards

### Pre-commit Requirements
```bash
# Always run before commit
python -m black .           # Code formatting
python -m flake8 .         # Linting
python -m mypy .           # Type checking
python -m pytest          # Test suite
```

### Development Tools Configuration
```toml
# pyproject.toml
[tool.black]
line-length = 88
target-version = ['py38']

[tool.mypy]
python_version = "3.8"
strict = true

[tool.pytest.ini_options]
testpaths = ["tests"]
python_files = ["test_*.py"]
```

⸻

## Python Architecture

### Project Structure
```
src/
├── models/           # Data models (SQLAlchemy, Pydantic)
├── api/             # FastAPI/Flask routes
├── services/        # Business logic
├── utils/           # Helper functions
├── data/            # Data processing modules
├── config/          # Configuration management
└── tests/           # Test files
```

### Error Handling Standards
- Always use try/except for external calls
- Proper logging with structured data
- Custom exceptions for business logic
- Type-safe error handling with Result types
- Never expose internal errors to users

⸻

## Healthy Python Project

### Technical Health
• Zero flake8 warnings
• 90%+ test coverage
• All type hints present
• Fast test execution
• Proper error handling throughout
• Clean dependency management

### Development Health
• Fast development server startup
• Reliable test suite
• Clear module separation
• Good documentation coverage
• Consistent code style

⸻

**Python Solo Rule:**
If you think "Should I add another responsibility to this class?" → No, create a new class.
Single responsibility principle is the foundation of maintainable Python.

**Solo Start Rule:**
1. "PYTHON SOLO RULES ACTIVE: Following solo Python development standards!"
2. `git status` - check current state  
3. `python -m black . && python -m flake8 . && python -m pytest` - verify code quality
4. Always work on dev branch, wait for "top" confirmation before committing!

⸻

## 🔴 CRITICAL REMINDERS (READ TWICE!)

These rules are repeated because they are CRITICAL:

### **PROJECT TYPE DETECTION (CRITICAL!)**
**🚨 NEVER DELETE GIT HISTORY FROM EXISTING PROJECTS! 🚨**

**How to detect:**
```bash
git log --oneline 2>/dev/null | wc -l
```

**Results:**
- **0 commits:** New project (no git) → initialize fresh
- **1 commit:** New project (GitHub template) → delete & reinitialize  
- **2+ commits:** Existing project → KEEP HISTORY, implant vasgit

**NEVER assume! ALWAYS count commits first!**

This prevents catastrophic data loss from deleting existing git histories!

### **VERSION VALIDATION (CRITICAL!)**
**NEVER "INVENT" VERSIONS - ALWAYS CHECK GIT LOG FIRST!**

Before EVERY commit:
1. Execute: `git log --oneline -3`
2. Identify the ACTUAL last version
3. Calculate next version based on change type
4. NEVER guess or assume versions

### **"TOP" CONFIRMATION (CRITICAL!)**
**WHEN USER SAYS "top" - AUTOMATICALLY DETECT PROJECT TYPE:**

**STEP 1: Check git state**
```bash
git log --oneline 2>/dev/null | wc -l
```

**SCENARIO A: No git repo (count = 0) → NEW PROJECT**
```bash
git init
git add .
git commit -m "initial commit (v0.1.0+1)"
git branch dev
git checkout dev
```

**SCENARIO B: Only 1 commit (GitHub template) → NEW PROJECT**
```bash
rm -rf .git
git init
git add .
git commit -m "initial commit (v0.1.0+1)"
git branch dev
git checkout dev
```

**⚠️ CRITICAL: First push needs --force!**
- Why? Git history was reinitialized (old remote history diverged)
- Command: `git push origin main --force`
- Later pushes: Normal `git push origin main`

**SCENARIO C: Multiple commits (2+) → EXISTING PROJECT**
- Message: `chore: implant vasgit into project (vX.Y.Z+N)`
- Version detection:
  1. Check last commit for version: `git log --oneline -1 | grep -oE 'v[0-9]+\.[0-9]+\.[0-9]+\+[0-9]+'`
  2. If found → continue from there (e.g., v1.2.3+45 → v1.2.4+46)
  3. If NOT found → use commit count: `0.1.0+{commit_count}` (e.g., 23 commits → v0.1.0+23)
- Create `dev` branch if it doesn't exist
- Switch to `dev` branch

**KEY POINT:** User ONLY says "top" - YOU detect and handle automatically!

### **SEMANTIC VERSIONING (CRITICAL!)**
- README/Documentation updates = MINOR (0.X.0)
- New features = MINOR (0.X.0)
- Bug fixes = PATCH (0.X.Y)

### **ONE LOGICAL CHANGE = ONE COMMIT (CRITICAL!)**
NEVER MIX MULTIPLE LOGICAL CHANGES IN ONE COMMIT!

### **VERSION SEQUENCE (CRITICAL!)**
NO DUPLICATE PATCH VERSIONS! NO SKIPPED BUILD NUMBERS!

Correct: v0.8.0+45 → v0.8.0+46 → v0.8.1+47 ✓
Wrong: v0.8.0+45 → v0.8.0+47 ✗ (skipped +46)

⸻

**These rules are non-negotiable. Follow them EXACTLY. Every time.**
