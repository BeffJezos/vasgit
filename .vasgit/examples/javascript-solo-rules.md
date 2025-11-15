---
description: "JavaScript Solo Rules - Solo Development with Node.js/Frontend"
globs: []
alwaysApply: true
---

<!-- USE AT YOUR OWN RISK: This template has been tested but may not work in all environments. Always backup your work and test in non-production environments first. -->

# JavaScript Solo Rules - Solo Development Template

Professional solo workflow optimized for JavaScript development across frontend and backend.

⸻

## Git Workflow: Solo Dev-First (JavaScript Optimized)

```
• All development on dev branch for rapid JavaScript iteration
• Merge to main for production deployments
• Perfect for Node.js APIs, React apps, Vue projects, vanilla JS
• Compatible with npm/yarn workflows
```

### JavaScript Solo Development Commands
```bash
# Daily JavaScript development
git checkout dev
git pull origin dev

# Develop new feature/endpoint (multiple logical changes)
git add src/api/users.js src/utils/validation.js
# User tests everything, then says "top"
# AI commits each logical change separately:
# git commit -m "feat: add user API endpoints (v0.8.0+45)"
# git commit -m "feat: add input validation utils (v0.8.0+46)"
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
• **NEVER** commit without linting (ESLint) passing
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
1. **User gives tasks** → "Make button smaller, fix the API validation, add dark mode"
2. **AI makes ALL changes** → 3 logical changes ready
3. **User tests everything** → Checks if it all works
4. **User says "top"** → AI commits each logical change as separate commit
5. **Continue working** → "top - now let's add user authentication"

### **"TOP" EFFICIENCY:**
- **Combine requests**: "top - and also optimize the database queries"
- **Save tokens**: Don't send "top" alone
- **Keep momentum**: "top - now let's work on the mobile responsive design"

⸻

## Universal Coding Principles (JavaScript-Optimized)
- Use const/let appropriately (never var)
- Arrow functions for short functions and callbacks
- **JavaScript-specific:** Use modern ES6+ features consistently
- Trailing commas – more readable, better diffs in arrays/objects
- Structure files logically: imports → constants → main logic → exports
- **Dynamic configuration:** Version numbers MUST be loaded from package.json, never hardcoded
- **Follow JavaScript/Node.js documentation** and best practices at all times
- **Document complex logic**, especially async operations and business logic

⸻

## Commit Standards

### Commit Message Format
```
type: description (v0.X.Y+Z)
```

**JavaScript-specific types:**
- `feat`: New functions, endpoints, components
- `fix`: Bug fixes in logic or API
- `refactor`: Code restructuring without behavior change
- `perf`: Performance improvements
- `test`: Jest/Mocha test additions
- `deps`: Dependency updates
- `build`: Build system changes (webpack, babel, etc.)

**Examples:**
- `feat: add user authentication API (v0.8.0+45)`
- `fix: resolve memory leak in data processing (v0.7.15+46)`
- `perf: optimize database query performance (v0.7.16+47)`

⸻

## Semantic Versioning: JavaScript/Node.js

### Version File: `package.json`

**MINOR (0.X.0) - JavaScript specific:**
- New API endpoints
- New major features
- Database schema changes
- New middleware
- Major refactoring
- New external integrations

**PATCH (0.X.Y) - JavaScript specific:**
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

## JavaScript Quality Standards

### Pre-commit Requirements
```bash
# Always run before commit
npm run lint        # ESLint
npm test           # Jest/Mocha
npm run build      # Ensure build works
```

### ESLint Configuration
```json
{
  "extends": [
    "eslint:recommended",
    "@typescript-eslint/recommended"
  ],
  "rules": {
    "no-unused-vars": "error",
    "no-console": "warn",
    "prefer-const": "error"
  }
}
```

⸻

## Healthy JavaScript Project

### Technical Health
• Bundle size optimized (frontend)
• Zero ESLint warnings
• 80%+ test coverage
• All dependencies up to date
• Proper error handling throughout
• Clean package.json

### Development Health
• Fast build times
• Reliable test suite
• Clear project structure
• Good separation of concerns
• Consistent code style

⸻

**JavaScript Solo Rule:**
If you think "Should I add another feature to this function?" → No, split it.
Clean, focused functions are the foundation of maintainable JavaScript.

**Solo Start Rule:**
1. "JAVASCRIPT SOLO RULES ACTIVE: Following solo JavaScript development standards!"
2. `git status` - check current state
3. `npm run lint && npm test` - verify code quality
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
