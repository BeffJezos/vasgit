---
description: "Flutter Solo Rules - Solo Development for Cross-Platform Mobile Apps"
globs: []
alwaysApply: true
---

<!-- USE AT YOUR OWN RISK: This template has been tested but may not work in all environments. Always backup your work and test in non-production environments first. -->

# Flutter Solo Rules - Solo Development Template

Professional solo workflow optimized for Flutter development with Dart and modern mobile app best practices.



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
2. User tests in emulator → Checks if everything works
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



## Git Workflow: Solo Dev-First (Flutter Optimized)

```
• All development on dev branch for rapid Flutter iteration
• Merge to main for production releases
• Perfect for mobile apps, cross-platform development
• Compatible with Flutter/Dart workflows
```

### Flutter Solo Development Commands
```bash
# Daily Flutter development
git checkout dev
git pull origin dev

# Develop new feature (multiple logical changes)
git add lib/screens/profile_screen.dart lib/providers/auth_provider.dart lib/widgets/custom_button.dart
# User tests everything in emulator, then says "top"
# AI commits each logical change separately:
# git commit -m "feat: add profile screen with responsive layout (v0.8.0+45)"
# git commit -m "feat: add authentication provider with state management (v0.8.0+46)"
# git commit -m "feat: add custom button widget with animations (v0.8.0+47)"
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
• **NEVER** commit without linting (dart analyze) passing
• **NEVER** commit with widget rebuild issues
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



## SOLO "TOP" CONFIRMATION WORKFLOW:
**BASIC PRINCIPLE: User says "top" → AI commits all logical changes separately**

### **SOLO WORKFLOW:**
1. **User gives tasks** → "Add profile screen, create auth provider, build custom button"
2. **AI makes ALL changes** → 3 logical changes ready
3. **User tests in emulator** → Checks UI, interactions, state management
4. **User says "top"** → AI commits each logical change as separate commit
5. **Continue working** → "top - now let's add the shopping cart feature"

### **"TOP" EFFICIENCY:**
- **Combine requests**: "top - and also add offline mode with local storage"
- **Save tokens**: Don't send "top" alone
- **Keep momentum**: "top - now let's optimize the animations for 60fps"



##  CRITICAL: MINOR RELEASE MERGE TO MAIN

**RULE:** Every commit with version 0.X.0 (where X changes) = IMMEDIATE merge to main!

**WORKFLOW FOR MINOR RELEASES (0.X.0):**
1.  Commit on dev: `git commit -m "feat: add offline mode (v0.9.0)"`
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
- New screens/widgets ( = 0.X.0)
- Authentication system ( = 0.X.0)
- README/Documentation updates ( = 0.X.0)
- State management changes ( = 0.X.0)
- Bug fixes, UI tweaks ( = 0.X.Y - PATCH only)



## Universal Coding Principles (Flutter-Optimized)
- Use const constructors wherever possible for performance
- **Flutter-specific:** StatelessWidget over StatefulWidget when possible
- **Flutter-specific:** Use Provider/Riverpod for state management
- **Dart-specific:** Final and const for immutability
- Trailing commas in widget trees – more readable, better diffs
- Structure files logically: imports → constants → widgets → state → export
- **Dynamic configuration:** Version numbers MUST be loaded from pubspec.yaml, never hardcoded
- **Follow Flutter documentation** and best practices at all times
- **Document complex widgets** with clear comments



## Commit Standards

### Commit Message Format
```
type: description (v0.X.Y+Z)
```

**Flutter-specific types:**
- `feat`: New screens, widgets, features
- `fix`: Bug fixes in UI or logic
- `style`: UI/UX styling changes
- `refactor`: Code restructuring without behavior change
- `perf`: Performance improvements (animations, rebuilds)
- `test`: Widget/integration test additions
- `deps`: Dependency updates (pubspec.yaml)

**Examples:**
- `feat: add user profile screen with animations (v0.8.0+45)`
- `fix: resolve setState called after dispose error (v0.7.15+46)`
- `perf: optimize list view with const widgets (v0.7.16+47)`



## Semantic Versioning: Flutter

### Version File: `pubspec.yaml`

**MINOR (0.X.0) - Flutter specific:**
- New screens/pages
- New major features
- Navigation structure changes
- New state management providers
- Major UI redesigns
- New platform integrations (camera, location, etc.)

**PATCH (0.X.Y) - Flutter specific:**
- Bug fixes
- UI/UX improvements
- Performance optimizations
- Dependency updates
- Minor widget tweaks

### **CRITICAL VERSION TYPE RULES:**
- **Content revisions** = MINOR (0.X.0) - NOT PATCH!
- **README/Documentation updates** = MINOR (0.X.0) - NOT PATCH!
- **Fundamental text changes** = MINOR (0.X.0) - NOT PATCH!
- **Only small corrections** = PATCH (0.X.Y)



## Flutter Quality Standards

### Pre-commit Requirements
```bash
# Always run before commit
flutter analyze          # Dart analyzer
flutter test            # Run all tests
flutter build apk --debug  # Ensure build works (or ios)
```

### Dart Analyzer Configuration
```yaml
# analysis_options.yaml
analyzer:
  strong-mode:
    implicit-casts: false
    implicit-dynamic: false
  errors:
    missing_required_param: error
    missing_return: error

linter:
  rules:
    - prefer_const_constructors
    - prefer_const_declarations
    - use_key_in_widget_constructors
    - avoid_print
```



## Flutter Architecture

### Project Structure
```
lib/
 main.dart           # App entry point
 screens/           # Screen widgets
 widgets/           # Reusable widgets
 providers/         # State management (Provider/Riverpod)
 models/            # Data models
 services/          # API calls and external services
 utils/             # Helper functions
 constants/         # Constants and themes
 tests/             # Test files
```

### Widget Standards
- Use const constructors for immutable widgets
- Extract complex widgets into separate files
- Keep widget trees readable (max 3-4 levels deep before extracting)
- Use meaningful widget names
- Proper key usage for list items
- Avoid unnecessary setState calls

### State Management Best Practices
- Use Provider/Riverpod for app-wide state
- Keep state as local as possible
- Avoid rebuilding entire trees
- Use Consumer widgets strategically
- Proper disposal of controllers and listeners



## Flutter Performance Guidelines

### Widget Optimization
- Use const constructors everywhere possible
- Avoid rebuilding unchanged widgets
- Use ListView.builder for long lists
- Implement proper image caching
- Use RepaintBoundary for complex animations

### Performance Checklist
- [ ] No unnecessary widget rebuilds
- [ ] Animations run at 60fps
- [ ] Images properly sized and cached
- [ ] Lists use builder constructors
- [ ] No expensive operations in build methods



## Healthy Flutter Project

### Technical Health
• Zero dart analyze warnings
• 80%+ test coverage (widget + integration tests)
• Smooth animations (60fps)
• Fast app startup time
• Proper error handling throughout
• Clean pubspec.yaml

### Development Health
• Fast hot reload
• Reliable test suite
• Clear widget hierarchy
• Good separation of concerns
• Consistent code style
• Responsive layouts (all screen sizes)



## Flutter Testing

### Test Categories
```dart
// Widget tests
testWidgets('Button displays correct text', (tester) async {
  await tester.pumpWidget(MyButton());
  expect(find.text('Click Me'), findsOneWidget);
});

// Integration tests
testWidgets('Login flow works correctly', (tester) async {
  await tester.pumpWidget(MyApp());
  await tester.enterText(find.byKey(Key('email')), 'test@test.com');
  await tester.tap(find.byKey(Key('loginButton')));
  await tester.pumpAndSettle();
  expect(find.text('Welcome'), findsOneWidget);
});
```



**Flutter Solo Rule:**
If you think "Should I make this widget more complex?" → No, extract it into a smaller widget.
Small, focused widgets are the foundation of maintainable Flutter apps.

**Solo Start Rule:**
1. "FLUTTER SOLO RULES ACTIVE: Following solo Flutter development standards!"
2. `git status` - check current state
3. `flutter analyze && flutter test` - verify code quality
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
