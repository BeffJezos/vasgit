---
description: "Go Solo Rules - Solo Development for Backend/CLI/Microservices"
globs: []
alwaysApply: true
---

<!-- USE AT YOUR OWN RISK: This template has been tested but may not work in all environments. Always backup your work and test in non-production environments first. -->

# Go Solo Rules - Solo Development Template

Professional solo workflow optimized for Go development in backend services, CLI tools, and microservices.

⸻

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

⸻

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

⸻

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

⸻

## Universal Coding Principles (Go-Optimized)
- **Go-specific:** Accept interfaces, return structs
- **Go-specific:** Explicit error handling - never ignore errors
- **Go-specific:** Use context.Context for cancellation
- **Go-specific:** Keep interfaces small (1-3 methods)
- Structure files logically: package → imports → constants → types → functions
- **Dynamic configuration:** Version numbers MUST be loaded from version file/ldflags, never hardcoded
- **Follow Go documentation** and Effective Go at all times
- **Document exported functions** with godoc comments

⸻

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

⸻

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

⸻

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

⸻

## Go Architecture

### Project Structure (Standard Go Layout)
```
.
├── cmd/               # Main applications
│   └── myapp/
│       └── main.go
├── internal/          # Private application code
│   ├── api/          # API handlers
│   ├── models/       # Data models
│   ├── services/     # Business logic
│   └── repository/   # Data access
├── pkg/              # Public libraries
├── configs/          # Configuration files
├── scripts/          # Build and setup scripts
├── tests/            # Additional test files
├── go.mod
├── go.sum
├── Makefile
└── README.md
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

⸻

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

⸻

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

⸻

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

⸻

**Go Solo Rule:**
If you think "Should I ignore this error?" → No, handle it explicitly.
Explicit error handling is the foundation of reliable Go code.

**Solo Start Rule:**
1. "GO SOLO RULES ACTIVE: Following solo Go development standards!"
2. `git status` - check current state
3. `go fmt ./... && go vet ./... && go test ./... -race` - verify code quality
4. Always work on dev branch, wait for "top" confirmation before committing!

