# Git Workflows for Solo Development

**Overview**

Vasgit provides Git workflow strategies specifically designed for solo developers using AI assistants. This guide explains the different Git approaches you can use and when to choose each one.

## Core Concepts

### Linear vs No-Fast-Forward (no-ff) 

**Linear Workflow:**
```
A---B---C---D (main)
```
- Simple, straight line of commits
- Each commit builds directly on the previous
- Easy to follow, clean history
- Perfect for solo development with frequent small commits

**No-Fast-Forward (no-ff) Workflow:**
```
A---B-------E (main)
     \     /
      C---D (dev)
```
- Preserves branch structure
- Shows logical groupings of work
- Clear separation between development and releases
- Better for tracking feature development

## Available Solo Workflows

### 1. Dev-First Workflow (Recommended)

**Best For:** Solo developers, rapid iteration, AI-assisted development

**Structure:**
```bash
# Development happens on dev branch
git checkout dev
# Work, work, work... multiple logical changes
# User says "top" → AI commits each logical change separately
git push origin dev

# When ready for release
git checkout main
git merge --no-ff dev  # Preserves branch structure
git tag v0.8.0
git push origin main --tags
git checkout dev
```

**Advantages:**
- Fast iteration with AI assistant
- "Top" confirmation prevents broken commits
- Clear separation of development vs releases
- Battle-tested over hundreds of hours
- Preserves logical grouping with no-ff merges

**When to Use:**
- Solo development projects
- AI-assisted coding sessions
- Rapid prototyping and MVPs
- Projects where you want clean release points

### 2. Linear Workflow (Alternative)

**Best For:** Simple projects, single-feature development

**Structure:**
```bash
# All work happens directly on main
git checkout main
# Work, work, work... 
# User says "top" → AI commits each logical change separately
git push origin main
```

**Advantages:**
- Simplest possible workflow
- No branch management needed
- Perfect for small projects or experiments

**When to Use:**
- Small experimental projects
- Single-feature repositories
- Learning projects
- When you don't need release management

## Comparison: no-ff vs Linear

### No-Fast-Forward (Dev-First)

**Git History:**
```
* a1b2c3d (main) Merge branch 'dev' - Release v0.8.0
|\
| * e4f5g6h (dev) feat: add authentication system (v0.8.0+47)
| * h7i8j9k feat: add user validation (v0.8.0+46) 
| * k1l2m3n feat: add user model (v0.8.0+45)
|/
* n4o5p6q Previous release v0.7.0
```

**Benefits:**
- Clear release points visible in history
- Logical grouping of related changes
- Easy to revert entire features
- Professional-looking commit history

### Linear Workflow

**Git History:**
```
* a1b2c3d (main) feat: add authentication system (v0.8.0+47)
* e4f5g6h feat: add user validation (v0.8.0+46)
* h7i8j9k feat: add user model (v0.8.0+45)
* k1l2m3n feat: previous feature (v0.7.15+44)
```

**Benefits:**
- Simplest possible history
- No merge commits
- Each commit tells the story
- Perfect for solo development

## The "Top" Confirmation System

**How it Works (Both Workflows):**

1. **User gives tasks:** "Add user auth, fix the button styling, optimize the API"
2. **AI makes changes:** 3 logical changes ready
3. **User tests everything:** Makes sure it all works
4. **User says "top":** AI commits each logical change separately
5. **Continue:** "top - now let's add the dashboard component"

**Example Commits After "top":**
```bash
git commit -m "feat: add user authentication with JWT (v0.8.0+45)"
git commit -m "fix: improve button styling and responsiveness (v0.8.1+46)" 
git commit -m "perf: optimize API response time (v0.8.2+47)"
```

## Choosing Your Workflow

### Use Dev-First (no-ff) When:
- You want professional-looking Git history
- You need clear release management
- You want to easily revert features
- You're building a portfolio project
- You plan to eventually collaborate with others

### Use Linear When:
- You want maximum simplicity
- You're doing experimental work
- You prefer chronological commit history
- You're building quick prototypes

## Version Management

**Both workflows support semantic versioning:**

```bash
# MINOR version (new features)
feat: add user dashboard (v0.8.0+45)

# PATCH version (fixes/improvements)  
fix: resolve login validation bug (v0.7.15+46)

# Build number always increments
perf: optimize database queries (v0.7.16+47)
```

## Solo Workflow Commands Reference

### Dev-First Commands
```bash
# Daily workflow
git checkout dev
git pull origin dev
# [Make changes, user says "top"]
git push origin dev

# Release workflow
git checkout main
git merge --no-ff dev
git tag v0.8.0
git push origin main --tags
git checkout dev
```

### Linear Commands
```bash
# Daily workflow
git checkout main
git pull origin main  
# [Make changes, user says "top"]
git push origin main
```

## Best Practices for Solo Development

### 1. Consistent Workflow Choice
- Pick one workflow and stick with it
- Don't mix linear and no-ff in the same project

### 2. Meaningful Commit Messages
```bash
# Good
feat: add user authentication with password validation (v0.8.0+45)
fix: resolve memory leak in data processing (v0.7.15+46)

# Bad
fix stuff (v0.8.0+45)
updates (v0.7.15+46)
```

### 3. Logical Grouping
- Group related changes together before "top"
- Don't mix unrelated changes in one session
- Keep sessions manageable (3-5 logical changes max)

### 4. Version Discipline
- Always check current version before committing
- Never skip version numbers
- Use semantic versioning consistently

## Troubleshooting

### "I mixed workflows accidentally"
```bash
# Reset to clean state
git checkout main
git pull origin main
# Choose one workflow going forward
```

### "My history looks messy"
- This is normal during development
- The "top" system prevents broken commits
- Focus on logical commits, not perfect history

### "When should I use tags?"
```bash
# Dev-First: Tag on main after merges
git tag v0.8.0  # After merging dev to main

# Linear: Tag important milestones
git tag v0.8.0  # After completing major features
```

## Conclusion

For solo AI-assisted development, we recommend the **Dev-First workflow** with no-ff merges. It provides the best balance of simplicity and professionalism while working perfectly with the "top" confirmation system.

The key to success is consistency - pick your workflow and stick with it throughout your project.

**Happy solo vibe-coding!**