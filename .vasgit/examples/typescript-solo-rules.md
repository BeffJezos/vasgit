---
description: "TypeScript Solo Rules - Type-Safe Solo Development"
globs: []
alwaysApply: true
---

<!-- USE AT YOUR OWN RISK: This template has been tested but may not work in all environments. Always backup your work and test in non-production environments first. -->

# TypeScript Solo Rules - Type-Safe Solo Template

Professional solo workflow optimized for TypeScript development with strict type checking and modern tooling.

⸻

## Git Workflow: Solo Dev-First (TypeScript Optimized)

```
• All development on dev branch for type-safe solo iteration
• Merge to main for production builds
• Perfect for React, Vue, Angular, or vanilla TypeScript apps
• Integrates with bundlers (Vite, Webpack, Parcel)
```

### TypeScript Solo Development Commands
```bash
# Daily TypeScript development
git checkout dev
git pull origin dev

# Develop new TypeScript feature (multiple logical changes)
git add src/types/user.ts src/services/userService.ts src/components/UserProfile.tsx
# User tests everything in browser/tests, then says "top"
# AI commits each logical change separately:
# git commit -m "feat: add user type definitions with validation (v0.8.0+45)"
# git commit -m "feat: add type-safe user service with error handling (v0.8.0+46)"
# git commit -m "feat: add UserProfile component with type safety (v0.8.0+47)"
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
• **NEVER** commit with TypeScript errors
• **NEVER** commit without linting (ESLint + TypeScript) passing
• **NEVER** use `any` type without explicit justification
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
1. **User gives tasks** → "Add user types, create service, build component"
2. **AI makes ALL changes** → 3 logical changes ready
3. **User tests types/functionality** → Checks TypeScript compilation, functionality
4. **User says "top"** → AI commits each logical change as separate commit
5. **Continue working** → "top - now let's add authentication with proper types"

### **"TOP" EFFICIENCY:**
- **Combine requests**: "top - and also add type-safe API client"
- **Save tokens**: Don't send "top" alone
- **Keep momentum**: "top - now let's optimize with React.memo and proper generics"

⸻

## Universal Coding Principles (TypeScript-Optimized)
- Use const/readonly wherever possible for immutability
- **TypeScript-specific:** Explicit type annotations for all function parameters and returns
- **TypeScript-specific:** Use interfaces over types for object shapes
- **TypeScript-specific:** Prefer union types over enums for better type safety
- Trailing commas in type definitions – more readable, better diffs
- Structure files logically: imports → types → interfaces → main logic → exports
- **Dynamic configuration:** Version numbers MUST be loaded from package.json, never hardcoded
- **Follow TypeScript handbook** and best practices at all times
- **Document complex types** with JSDoc comments

⸻

## Commit Standards

### Commit Message Format
```
type: description (v0.X.Y+Z)
```

**TypeScript-specific types:**
- `feat`: New features with proper typing
- `fix`: Bug fixes with type safety maintained
- `types`: Type definition updates or improvements
- `refactor`: Code restructuring with improved types
- `perf`: Performance improvements with type safety
- `test`: Type-safe test additions
- `build`: Build configuration (tsconfig, bundler)

**Examples:**
- `feat: add type-safe user authentication with JWT (v0.8.0+45)`
- `types: improve API response type definitions with generics (v0.7.15+46)`
- `fix: resolve type error in data processing pipeline (v0.7.16+47)`

⸻

## Semantic Versioning: TypeScript

### Version File: `package.json`

**MINOR (0.X.0) - TypeScript specific:**
- New components/modules with type definitions
- New type definitions and interfaces
- API interface changes
- Major refactoring with type improvements
- New external library integrations
- Build system changes affecting types

**PATCH (0.X.Y) - TypeScript specific:**
- Bug fixes with type safety maintained
- Type annotation improvements
- Performance optimizations
- Dependency updates
- Minor type corrections and refinements

### **CRITICAL VERSION TYPE RULES:**
- **Content revisions** = MINOR (0.X.0) - NOT PATCH!
- **README/Documentation updates** = MINOR (0.X.0) - NOT PATCH!
- **Fundamental text changes** = MINOR (0.X.0) - NOT PATCH!
- **Only small corrections** = PATCH (0.X.Y)

⸻

## TypeScript Quality Standards

### Pre-commit Requirements
```bash
# Always run before commit
npm run type-check     # TypeScript compiler check
npm run lint          # ESLint + TypeScript rules
npm test             # Type-safe tests
npm run build        # Production build test
```

### TypeScript Configuration
```json
{
  "compilerOptions": {
    "strict": true,
    "noImplicitAny": true,
    "noImplicitReturns": true,
    "noUnusedLocals": true,
    "noUnusedParameters": true,
    "exactOptionalPropertyTypes": true
  }
}
```

### ESLint + TypeScript Rules
```json
{
  "extends": [
    "@typescript-eslint/recommended",
    "@typescript-eslint/recommended-requiring-type-checking"
  ],
  "rules": {
    "@typescript-eslint/no-explicit-any": "error",
    "@typescript-eslint/prefer-readonly": "error",
    "@typescript-eslint/prefer-nullish-coalescing": "error"
  }
}
```

⸻

## TypeScript Architecture

### Project Structure
```
src/
├── types/            # Type definitions (.d.ts files)
├── interfaces/       # Interface definitions
├── components/       # UI components (if applicable)
├── services/         # Business logic services
├── utils/           # Type-safe utilities
├── hooks/           # Custom hooks (React)
├── stores/          # State management
├── api/             # API layer with types
└── __tests__/       # Type-safe tests
```

### Type Safety Standards
- All function parameters and returns typed
- No `any` types without explicit justification
- Proper error type handling with Result<T, E> patterns
- Generic types for reusable components
- Union types for constrained values
- Utility types for transformations

⸻

## Type-Safe Error Handling
```typescript
// Good: Type-safe error handling
type ApiResult<T> = {
  success: true;
  data: T;
} | {
  success: false;
  error: string;
};

// Good: Proper error types
class ValidationError extends Error {
  constructor(public field: string, message: string) {
    super(message);
    this.name = 'ValidationError';
  }
}

// Good: Type-safe async operations
async function fetchUser(id: string): Promise<ApiResult<User>> {
  try {
    const user = await api.getUser(id);
    return { success: true, data: user };
  } catch (error) {
    return { success: false, error: error.message };
  }
}
```

⸻

## Healthy TypeScript Project

### Technical Health
• Zero TypeScript errors
• Zero ESLint warnings
• 85%+ test coverage with type checking
• Proper type definitions for all APIs
• Clean bundler output
• Fast compilation times

### Type Safety Health
• No `any` types in production code
• All external APIs properly typed
• Comprehensive error handling with proper types
• Type-safe state management
• Proper generic usage
• Consistent naming conventions

⸻

**TypeScript Solo Rule:**
If you think "Should I use `any` here?" → No, define the proper type.
Type safety is not optional - it's the foundation of reliable TypeScript.

**Solo Start Rule:**
1. "TYPESCRIPT SOLO RULES ACTIVE: Following type-safe solo development standards!"
2. `git status` - check current state
3. `npm run type-check && npm run lint && npm test` - verify type safety
4. Always work on dev branch, wait for "top" confirmation before committing!
