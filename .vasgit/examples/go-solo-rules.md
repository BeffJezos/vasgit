---
description: "Go Solo Rules - Solo Development for Backend/CLI/Microservices"
globs: []
alwaysApply: true
---

<!-- USE AT YOUR OWN RISK: This template has been tested but may not work in all environments. Always backup your work and test in non-production environments first. -->

# Go Solo Rules - Solo Development Template

Professional solo workflow optimized for Go development in backend services, CLI tools, and microservices.



## AFTER SETUP - FIRST CHAT BEHAVIOR

**IMPORTANT: When user starts a new chat after running setup, YOU must proactively guide them!**

### ON FIRST MESSAGE:
1. Say: "RULE VALIDATION: I now automatically follow all rules!"

2. Execute `git log --oneline 2>/dev/null | wc -l` to count commits

3. **If NEW PROJECT (0 or 1 commit):**
   - **Tell user:** "This looks like a new project! You can say 'top' and I'll initialize git properly with clean history."
   - **Explain:** "The 'top' command triggers git initialization and first commit."
   - **WAIT for user to say "top"** before doing anything!

4. **If EXISTING PROJECT (2+ commits):**
   - **Count commits** and remember this number for versioning
   - **Check if versions exist:** `git log --oneline -1 | grep -oE 'v[0-9]+\.[0-9]+\.[0-9]+\+[0-9]+'`
   - **If version found:** Continue from that version (e.g., v1.2.3+45 → v1.2.4+46)
   - **If NO version found:** Use commit count: `v0.1.0+{commit_count}` (e.g., 23 commits → v0.1.0+23)
   - **Tell user:** "Ready to work! Say 'top' after testing your changes to commit."

**This ensures correct version numbering from the start!**

⸻

##  ULTRA-CRITICAL: NEVER COMMIT WITHOUT "TOP" CONFIRMATION! 

**ABSOLUTE RULE #1: DO NOT COMMIT ANYTHING WITHOUT USER SAYING "TOP"!**

### **THE ONLY WAY TO COMMIT:**
1. User gives tasks → You make ALL changes
2. User tests functionality → Checks if everything works
3. **User says "top"** → ONLY THEN you commit!

### **FORBIDDEN:**
-  Auto-committing after changes
-  Committing because "work is done"
-  Committing without explicit "top" confirmation
-  Asking "should I commit?" (just wait for "top")

### **ALLOWED:**
-  ONLY commit when user explicitly says "top"
-  Wait patiently after completing changes
-  User says "top" = green light to commit

**IF YOU COMMIT WITHOUT "TOP" = YOU VIOLATED THE MOST CRITICAL RULE!**

This prevents broken commits and gives user control over when commits happen.



##  BEFORE EVERY COMMIT - VERSION TYPE DETECTION (MANDATORY!)

**ABSOLUTE RULE #2: ALWAYS DETERMINE CORRECT VERSION TYPE BEFORE COMMITTING!**

### **MANDATORY CHECKLIST - ASK YOURSELF THESE QUESTIONS:**

**Question 1: Does this change ADD NEW FUNCTIONALITY?**
- **YES** → This is a **MINOR (0.X.0)** release!
- **NO** → Continue to Question 2

**Question 2: Does this change FIX A BUG or IMPROVE EXISTING functionality?**
- **YES** → This is a **PATCH (0.X.Y)** release!
- **NO** → Continue to Question 3

**Question 3: Does this change BREAK EXISTING functionality?**
- **YES** → This is a **MAJOR (X.0.0)** release!
- **NO** → Re-evaluate the change type

### **CRITICAL COMMIT TYPE RULES:**
```
feat: = MINOR (0.X.0) - ALWAYS! NO EXCEPTIONS!
fix: = PATCH (0.X.Y) - Unless it's a breaking change
docs: = MINOR (0.X.0) - If substantial content changes
refactor: = PATCH (0.X.Y) - Unless architecture changes
style: = PATCH (0.X.Y) - UI/cosmetic changes
chore: = PATCH (0.X.Y) - Maintenance tasks
```

### **EXAMPLES - WHAT IS WHAT:**

**MINOR (0.X.0) - New functionality:**
```
feat: add HTTP server with graceful shutdown
feat: implement user API handler
feat: add database models
feat: add middleware with logging
docs: rewrite entire README with new features
```

**PATCH (0.X.Y) - Bug fixes / Improvements:**
```
fix: correct error handling
fix: resolve goroutine leak
refactor: simplify handler logic
style: format with gofmt
chore: update go modules
```

**MAJOR (X.0.0) - Breaking changes:**
```
feat!: upgrade to Go 1.22 (breaking)
refactor!: change API structure (breaking)
```

### **BEFORE EVERY COMMIT - RUN THIS CHECKLIST:**
1.  **Check commit type**: Is it `feat:`? → MINOR (0.X.0)!
2.  **Check commit type**: Is it `fix:` or `style:`? → PATCH (0.X.Y)!
3.  **Double-check**: Does the change ADD functionality? → MINOR (0.X.0)!
4.  **Verify version**: Does the version number match the change type?

**IF YOU USE PATCH (0.X.Y) FOR A `feat:` COMMIT = YOU VIOLATED A CRITICAL RULE!**

This ensures correct semantic versioning in every chat, no matter how long!



## Git Workflow: Solo Dev-First (Go Optimized)

```
• All development on dev branch for rapid Go iteration
• Merge to main for production deployments
• Perfect for APIs, CLI tools, microservices, system tools
• Compatible with Go modules workflow
```

### Go Solo Development Commands
```bash
# Daily Go development
git checkout dev
git pull origin dev

# Develop new feature (multiple logical changes)
git add cmd/server/main.go internal/api/handler.go internal/models/user.go
# User tests everything, then says "top"
# AI commits each logical change separately:
# git commit -m "feat: add server initialization with graceful shutdown (v0.8.0+45)"
# git commit -m "feat: add user API handler with validation (v0.8.0+46)"
# git commit -m "feat: add user model with JSON tags (v0.8.0+47)"
git push origin dev

# When ready for production deployment
git checkout main
git merge --no-ff dev
git tag v0.8.0
git push origin main --tags
git checkout dev
```



## Forbidden Operations

• **NEVER** `git reset --hard` on dev/main
• **NEVER** force-push without `--force-with-lease`
• **NEVER** commit directly to main
• **NEVER** commit with failing tests
• **NEVER** commit without linting (go vet, golangci-lint) passing
• **NEVER** commit without go fmt
• **CRITICAL VERSION RULE:** NEVER "invent" versions - ALWAYS check `git log` first!
• **VERSION VALIDATION:** Before each commit validate current version and correctly calculate next version!
• **VERSION SEQUENCE RULE:** No duplicate patch versions and no skipped build numbers!
• **MANDATORY:** After every file change IMMEDIATELY check read_lints and fix!
• **NEVER** mix multiple logical changes in one commit!
• **NEVER** unsafe error handling - always handle errors explicitly!
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



## SOLO "TOP" CONFIRMATION WORKFLOW:
**BASIC PRINCIPLE: User says "top" → AI commits all logical changes separately**

### **SOLO WORKFLOW:**
1. **User gives tasks** → "Add user handler, create validation, implement middleware"
2. **AI makes ALL changes** → 3 logical changes ready
3. **User tests functionality** → Runs tests, checks API responses
4. **User says "top"** → AI commits each logical change as separate commit
5. **Continue working** → "top - now let's add database integration"

### **"TOP" EFFICIENCY:**
- **Combine requests**: "top - and also add caching layer with Redis"
- **Save tokens**: Don't send "top" alone
- **Keep momentum**: "top - now let's optimize the database queries"



##  CRITICAL: MINOR RELEASE MERGE TO MAIN

**RULE:** Every commit with version 0.X.0 (where X changes) = IMMEDIATE merge to main!

**WORKFLOW FOR MINOR RELEASES (0.X.0):**
1.  Commit on dev: `git commit -m "feat: add caching layer (v0.9.0)"`
2.  **STOP! This is a MINOR release (0.9.0)!**
3.  **IMMEDIATELY merge to main:**
   ```bash
   git checkout main
   git merge --no-ff dev
   git tag v0.9.0
   git push origin main --tags
   git checkout dev
   ```
4.  Continue work on dev

**WHEN TO MERGE TO MAIN:**
-  **YES:** v0.6.0, v0.7.0, v0.8.0, v1.0.0 (X changes in 0.X.0)
-  **NO:** v0.6.1, v0.6.2, v0.6.33 (only Y changes in 0.X.Y)

**EXAMPLES OF MINOR FEATURES:**
- New API endpoints ( = 0.X.0)
- Authentication system ( = 0.X.0)
- README/Documentation updates ( = 0.X.0)
- Database schema changes ( = 0.X.0)
- Bug fixes, refactoring ( = 0.X.Y - PATCH only)



## Universal Coding Principles (Go-Optimized)
- **Go-specific:** Accept interfaces, return structs
- **Go-specific:** Explicit error handling - never ignore errors
- **Go-specific:** Use context.Context for cancellation
- **Go-specific:** Keep interfaces small (1-3 methods)
- Structure files logically: package → imports → constants → types → functions
- **Dynamic configuration:** Version numbers MUST be loaded from version file/ldflags, never hardcoded
- **Follow Go documentation** and Effective Go at all times
- **Document exported functions** with godoc comments



## Commit Standards

### Commit Message Format
```
type: description (v0.X.Y+Z)
```

**Go-specific types:**
- `feat`: New handlers, services, packages
- `fix`: Bug fixes in logic or API
- `refactor`: Code restructuring without behavior change
- `perf`: Performance improvements
- `test`: Test additions
- `deps`: Dependency updates (go.mod)
- `build`: Build system changes (Makefile, Dockerfiles)

**Examples:**
- `feat: add user authentication with JWT middleware (v0.8.0+45)`
- `fix: resolve goroutine leak in worker pool (v0.7.15+46)`
- `perf: optimize database connection pooling (v0.7.16+47)`



## Semantic Versioning: Go

### Version File: `go.mod` or version constant

**MINOR (0.X.0) - Go specific:**
- New API endpoints
- New packages/modules
- New CLI commands
- Database schema changes
- New external integrations
- Breaking API changes (pre-v1.0.0)

**PATCH (0.X.Y) - Go specific:**
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



## Go Quality Standards

### Pre-commit Requirements
```bash
# Always run before commit
go fmt ./...              # Format code
go vet ./...             # Static analysis
golangci-lint run        # Comprehensive linting
go test ./... -race      # Run tests with race detector
go build ./...           # Ensure build works
```

### Go Linter Configuration
```yaml
# .golangci.yml
linters:
  enable:
    - gofmt
    - govet
    - errcheck
    - staticcheck
    - gosimple
    - ineffassign
    - unused
    - deadcode
    - structcheck
    - varcheck

linters-settings:
  errcheck:
    check-blank: true
```



## Go Architecture

### Project Structure (Standard Go Layout)
```
.
 cmd/               # Main applications
    myapp/
        main.go
 internal/          # Private application code
    api/          # API handlers
    models/       # Data models
    services/     # Business logic
    repository/   # Data access
 pkg/              # Public libraries
 configs/          # Configuration files
 scripts/          # Build and setup scripts
 tests/            # Additional test files
 go.mod
 go.sum
 Makefile
 README.md
```

### Code Standards
- All exported functions/types have godoc comments
- Error messages start with lowercase (unless proper noun)
- Use errors.New() or fmt.Errorf() for errors
- Interfaces named with -er suffix (Reader, Writer, Handler)
- Keep functions small and focused

### Error Handling Standards
```go
// Good: Explicit error handling
result, err := doSomething()
if err != nil {
    return fmt.Errorf("failed to do something: %w", err)
}

// Good: Context-aware errors
if err := validate(user); err != nil {
    return fmt.Errorf("user validation failed: %w", err)
}

// Bad: Ignoring errors
result, _ := doSomething()  // NEVER DO THIS
```



## Go Concurrency Best Practices

### Goroutine Management
- Always know when goroutines terminate
- Use context.Context for cancellation
- Avoid goroutine leaks
- Use WaitGroups or channels for synchronization
- Be careful with shared state

### Example Pattern
```go
// Good: Proper goroutine management
func worker(ctx context.Context, jobs <-chan Job) error {
    for {
        select {
        case <-ctx.Done():
            return ctx.Err()
        case job := <-jobs:
            if err := process(job); err != nil {
                return fmt.Errorf("process failed: %w", err)
            }
        }
    }
}
```



## Healthy Go Project

### Technical Health
• Zero go vet warnings
• Zero golangci-lint issues
• 80%+ test coverage
• No race conditions (test with -race)
• Proper error handling throughout
• Clean go.mod with minimal dependencies

### Development Health
• Fast compilation times
• Reliable test suite
• Clear package structure
• Good documentation coverage
• Consistent code style (gofmt)



## Go Testing

### Test Structure
```go
// Table-driven tests
func TestValidateUser(t *testing.T) {
    tests := []struct {
        name    string
        user    User
        wantErr bool
    }{
        {
            name:    "valid user",
            user:    User{Name: "John", Email: "john@example.com"},
            wantErr: false,
        },
        {
            name:    "empty name",
            user:    User{Name: "", Email: "john@example.com"},
            wantErr: true,
        },
    }

    for _, tt := range tests {
        t.Run(tt.name, func(t *testing.T) {
            err := ValidateUser(tt.user)
            if (err != nil) != tt.wantErr {
                t.Errorf("ValidateUser() error = %v, wantErr %v", err, tt.wantErr)
            }
        })
    }
}
```



**Go Solo Rule:**
If you think "Should I ignore this error?" → No, handle it explicitly.
Explicit error handling is the foundation of reliable Go code.

**Solo Start Rule:**
1. "GO SOLO RULES ACTIVE: Following solo Go development standards!"
2. `git status` - check current state
3. `go fmt ./... && go vet ./... && go test ./... -race` - verify code quality
4. Always work on dev branch, wait for "top" confirmation before committing!




##  CRITICAL REMINDERS (READ TWICE!)

These rules are repeated because they are CRITICAL:

### **PROJECT TYPE DETECTION (CRITICAL!)**
** NEVER DELETE GIT HISTORY FROM EXISTING PROJECTS! **

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

** CRITICAL: First push needs --force!**
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

Correct: v0.8.0+45 → v0.8.0+46 → v0.8.1+47 
Wrong: v0.8.0+45 → v0.8.0+47  (skipped +46)



**These rules are non-negotiable. Follow them EXACTLY. Every time.**
