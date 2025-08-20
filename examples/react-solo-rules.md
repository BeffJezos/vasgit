---
description: "React Solo Rules - Solo Development for Modern React Apps"
globs: []
alwaysApply: true
---

<!-- USE AT YOUR OWN RISK: This template has been tested but may not work in all environments. Always backup your work and test in non-production environments first. -->

# React Solo Rules - Solo Development Template

Professional solo workflow optimized for React development with modern tooling and best practices.

⸻

## Git Workflow: Solo Dev-First (React Optimized)

```
• All development on dev branch for rapid React iteration
• Merge to main for production deployments
• Perfect for React SPA, Next.js, React Native projects
• Compatible with npm/yarn/pnpm workflows
```

### React Solo Development Commands
```bash
# Daily React development
git checkout dev
git pull origin dev

# Develop new feature (multiple logical changes)
git add src/components/UserProfile.jsx src/hooks/useAuth.js src/styles/profile.css
# User tests everything in browser, then says "top"
# AI commits each logical change separately:
# git commit -m "feat: add UserProfile component with responsive design (v0.8.0+45)"
# git commit -m "feat: add useAuth hook with token management (v0.8.0+46)"
# git commit -m "style: add profile page styling with dark mode (v0.8.0+47)"
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
• **NEVER** commit with console errors in browser
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
1. **User gives tasks** → "Add user profile component, create auth hook, style the page"
2. **AI makes ALL changes** → 3 logical changes ready
3. **User tests in browser** → Checks components, interactions, responsiveness
4. **User says "top"** → AI commits each logical change as separate commit
5. **Continue working** → "top - now let's add the shopping cart functionality"

### **"TOP" EFFICIENCY:**
- **Combine requests**: "top - and also add mobile responsive navigation"
- **Save tokens**: Don't send "top" alone
- **Keep momentum**: "top - now let's optimize the performance with React.memo"

⸻

## Universal Coding Principles (React-Optimized)
- Use functional components with hooks (no class components)
- **React-specific:** Use React.memo for performance optimization
- **React-specific:** Custom hooks for reusable logic
- Trailing commas in JSX props – more readable, better diffs
- Structure files logically: imports → constants → component → styles → export
- **Dynamic configuration:** Version numbers MUST be loaded from package.json, never hardcoded
- **Follow React documentation** and best practices at all times
- **Document complex components** with PropTypes or TypeScript

⸻

## Commit Standards

### Commit Message Format
```
type: description (v0.X.Y+Z)
```

**React-specific types:**
- `feat`: New components, hooks, pages
- `fix`: Bug fixes in components or logic
- `style`: CSS/styling changes
- `refactor`: Component restructuring without behavior change
- `perf`: Performance improvements (memoization, lazy loading)
- `test`: Jest/React Testing Library additions
- `build`: Build system changes (webpack, vite, etc.)

**Examples:**
- `feat: add UserDashboard component with data fetching (v0.8.0+45)`
- `fix: resolve infinite re-render in useEffect hook (v0.7.15+46)`
- `perf: add React.memo to expensive list components (v0.7.16+47)`

⸻

## Semantic Versioning: React

### Version File: `package.json`

**MINOR (0.X.0) - React specific:**
- New pages/routes
- New major components
- New external integrations (APIs, services)
- Major UI redesigns
- New features (authentication, payment, etc.)
- State management changes

**PATCH (0.X.Y) - React specific:**
- Bug fixes
- Performance optimizations
- Styling improvements
- Dependency updates
- Minor component tweaks

### **CRITICAL VERSION TYPE RULES:**
- **Content revisions** = MINOR (0.X.0) - NOT PATCH!
- **README/Documentation updates** = MINOR (0.X.0) - NOT PATCH!
- **Fundamental text changes** = MINOR (0.X.0) - NOT PATCH!
- **Only small corrections** = PATCH (0.X.Y)

⸻

## React Quality Standards

### Pre-commit Requirements
```bash
# Always run before commit
npm run lint          # ESLint + React rules
npm test              # Jest + React Testing Library
npm run build         # Production build test
```

### ESLint Configuration for React
```json
{
  "extends": [
    "react-app",
    "react-app/jest",
    "eslint:recommended"
  ],
  "rules": {
    "react-hooks/exhaustive-deps": "error",
    "react/prop-types": "error",
    "no-unused-vars": "error"
  }
}
```

⸻

## React Architecture

### Project Structure
```
src/
├── components/       # Reusable components
├── pages/           # Page components
├── hooks/           # Custom hooks
├── services/        # API calls and external services
├── utils/           # Helper functions
├── styles/          # CSS/SCSS files
├── contexts/        # React contexts
└── __tests__/       # Test files
```

### Component Standards
- One component per file
- Props validation with PropTypes or TypeScript
- Proper error boundaries
- Meaningful component names
- Consistent file naming (PascalCase for components)

⸻

## Healthy React Project

### Technical Health
• Zero ESLint warnings
• No console errors in browser
• 80%+ test coverage
• Fast hot reload
• Optimized bundle size
• Proper error handling

### Development Health
• Fast development server startup
• Reliable test suite
• Clear component hierarchy
• Good performance (no unnecessary re-renders)
• Consistent styling approach

⸻

**React Solo Rule:**
If you think "Should I add another prop to this component?" → No, split it into smaller components.
Small, focused components are the foundation of maintainable React apps.

**Solo Start Rule:**
1. "REACT SOLO RULES ACTIVE: Following solo React development standards!"
2. `git status` - check current state
3. `npm run lint && npm test && npm run build` - verify code quality
4. Always work on dev branch, wait for "top" confirmation before committing!
