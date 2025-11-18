---
description: "Solo Developer Template - Fast & Simple Workflow for Individual Developers"
globs: []
alwaysApply: true
---

<!-- USE AT YOUR OWN RISK: This template has been tested extensively but may not work in all environments. Always backup your work and test in non-production environments first. -->

# Solo Developer Standard – Git & Universal Coding

You work professionally and uncompromisingly. These rules apply universally – regardless of technology, regardless of project. No unnecessary blabla. Only substance.



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
2. User tests → Checks if everything works
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



## Git Workflow - ULTRA-STRICT RULES
- Work on dev branch – Every change begins on dev, then merge to main.
- FORBIDDEN OPERATIONS:
  - NEVER `git reset --hard` on shared branches
  - NEVER force-push without `--force-with-lease`
  - NEVER interactive rebases or history rewriting
  - NEVER commit broken code
- ALLOWED OPERATIONS:
  - `git add .`, `git commit -m "message"`, `git push origin dev`
  - `git checkout dev/main`, `git pull origin dev`
  - `git merge --no-ff dev` (on main for releases)
  - `git tag v0.x.0`, `git push origin main --tags`
- Commit Format: type: description (v0.X.Y+Z) (English, lowercase, concise)
- Clean History: Linear commits through dev branch for clear tracking. NEVER destructive operations.
- BRANCH INTEGRITY: Keep dev and main branches clean and linear
- For complex Git operations ALWAYS ask: "This would change Git history. Should I really do this?"



## LOGICAL CHANGE + USER-CONFIRMED COMMIT RULE:
**BASIC PRINCIPLE: One logical change = One commit (after user confirmation)**

### **WORKFLOW FOR LOGICAL CHANGES:**
1. **User gives task(s)** → I make ONE logical change after another (WITHOUT commits)
2. **User tests in simulator** → Sees if it works
3. **User confirms with "top"** → Then commit all logical changes as SEPARATE commits (one logical change = one commit)

### **EXAMPLE FOR MULTIPLE TASKS:**
User says: "Button smaller, center text, change color"
→ **3 logical changes** = **3 separate commits** (after "top" confirmation)
→ Commit 1: "fix: reduce button size (v0.6.23+63)"
→ Commit 2: "fix: center text alignment (v0.6.24+64)" 
→ Commit 3: "fix: update button color (v0.6.25+65)"

### **WHAT IS A LOGICAL CHANGE:**
- **ONE Bug-Fix** (e.g., fix text centering)
- **ONE UI-Tweak** (e.g., adjust button size)
- **ONE Feature** (e.g., add Dark Mode)
- **ONE Refactoring unit** (e.g., code cleanup in one area)

### **COMMIT PROCESS (only after "top" confirmation of all logical changes):**
**FOR EACH LOGICAL CHANGE SEPARATELY:**
1. **Version bump**: Version file from 0.X.Y+Z to correct new version
2. **Selective add**: `git add [all files of THIS ONE logical change] [version file]`
3. **Commit**: `git commit -m "type: logical change description (v0.X.Y+Z)"` (English, lowercase + version)
4. **Repeat for next logical change** (with new version number)

### **SEMANTIC VERSIONING DETECTION:**
- **MAJOR (1.0.0):** Breaking changes, completely new app architecture
- **MINOR (0.X.0):** New features, content revisions, marketing updates, new screens, new providers, README/Marketing updates, fundamental text changes
- **PATCH (0.X.Y):** Bug fixes, UI tweaks, performance improvements, small text corrections only

### **CRITICAL VERSION TYPE RULES:**
- **Content revisions** = MINOR (0.X.0) - NOT PATCH!
- **README/Marketing updates** = MINOR (0.X.0) - NOT PATCH!
- **Fundamental text changes** = MINOR (0.X.0) - NOT PATCH!
- **Only small corrections** = PATCH (0.X.Y)

### **Minor Features (require 0.X.0):**
- Authentication/Login System 
- New Screens/Pages   
- New Provider/Services 
- New Data Models 
- Subscription/Payment Integration 
- Major UI Redesigns 
- **Content Revisions** (README, Marketing, App descriptions) 
- **Fundamental Text Changes** (not just small corrections) 

### **Logical Changes (each = one separate commit):**
- 3 cosmetic UI fixes = 3 commits "fix: reduce button size (v0.8.28+67)", "fix: center text (v0.8.29+68)", "fix: update colors (v0.8.30+69)"
- 1 Bug fix = 1 commit "fix: sidebar animation issue (v0.8.31+70)"  
- 1 new feature = 1 commit "feat: add dark mode toggle (v0.9.0+71)" ← MINOR!
- Auth System = 1 commit "feat: complete auth system (v0.9.0+80)" ← MINOR!

### ** CRITICAL: AFTER COMMITTING MINOR RELEASE (0.X.0) - MERGE TO MAIN!**

**RULE:** Every commit with version 0.X.0 (where X changes) = IMMEDIATE merge to main!

**WORKFLOW FOR MINOR RELEASES (0.X.0):**
1.  Commit on dev: `git commit -m "feat: add dark mode (v0.9.0)"`
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

**CRITICAL:** 
- For MINOR features ALWAYS use 0.X.0 instead of 0.Y.Z!
- AFTER committing 0.X.0 → IMMEDIATELY check out main and merge!

**NEVER:** commit without "top" confirmation or mix multiple logical changes in one commit  
**ALWAYS:** Multiple logical changes → "top" confirmation → SEPARATE commits for each logical change = immediately



## LOGICAL CHANGE + USER-CONFIRMED RULE VALIDATION:
**ONE LOGICAL CHANGE, THEN "TOP" CONFIRMATION FROM USER:**

1. **Check Git Status**: Execute `git status`
2. **Validate Current Version**: Check `git log --oneline -3` OR `cat [version file]`
3. **Calculate Next Version**: Based on actual current version (NOT invent!)
4. **Identify Logical Change**: Assign all files to ONE logical unit
5. **Version bump**: Update version file
6. **Only then commit**: After user confirmation with "top" for this ONE logical change!
7. **Confirm Rule Compliance**: "All rules followed"

### **CRITICAL VERSION VALIDATION:**
**NEVER "invent" a version - ALWAYS validate first!**

**VERSION TYPE DETERMINATION:**
1. **Content Revisions** = MINOR (0.X.0) - NOT PATCH!
2. **README/Marketing Updates** = MINOR (0.X.0) - NOT PATCH!
3. **Fundamental Text Changes** = MINOR (0.X.0) - NOT PATCH!
4. **Only small corrections** = PATCH (0.X.Y)

**BEFORE each commit:**
1. **Check Version**: `git log --oneline -3` → Identify last version
2. **Calculate Next Version**: e.g., 0.6.33+73 → 0.6.33+74
3. **Set Version in file**: Only the validated next version

**EXAMPLE for correct versioning:**
- `git log` shows: `fix: improve chat scroll (v0.6.33+73)`
- Next version: `v0.6.33+74` (NOT v0.6.5+66!)
- Commit: `fix: ui improvements (v0.6.33+74)`

**FORBIDDEN:**
-  "Invent" versions without checking Git history
-  Set low version numbers without validation
-  Commit without version validation

### **VERSION SEQUENCE VALIDATION:**
**CRITICAL:** Prevent version jumps and duplicates!

**ABSOLUTE RULES:**
1. **No duplicate patch versions**: 0.6.33+73 → 0.6.33+74 → 0.6.34+75 (NOT 0.6.33+75!)
2. **No skipped build numbers**: +80 → +81 → +82 (NOT +80 → +82!)
3. **Patch increment at same minor**: 0.6.33+73 → 0.6.33+74 → 0.6.34+75
4. **Minor increment for new features**: 0.6.33+73 → 0.7.0+74 → 0.7.1+75

**VERSION SEQUENCE CHECKLIST:**
- [ ] **Check Patch Version**: Is the previous patch version identical?
- [ ] **Check Build Number**: Is the next build number +1?
- [ ] **Validate Version Type**: PATCH vs MINOR correctly determined?
- [ ] **No Duplicates**: Use same patch version only once
- [ ] **No Jumps**: Build numbers must be sequential

**EXAMPLE for correct sequence:**
- **PATCH Series**: v0.6.33+73 → v0.6.33+74 → v0.6.34+75 → v0.6.34+76
- **MINOR Series**: v0.6.33+73 → v0.7.0+74 → v0.7.1+75 → v0.8.0+76
- **MIXED**: v0.6.33+73 → v0.6.33+74 → v0.7.0+75 → v0.7.1+76

**FORBIDDEN SEQUENCES:**
-  v0.6.33+73 → v0.6.33+74 → v0.6.33+75 (duplicate patch version)
-  v0.6.33+73 → v0.6.33+75 (skipped +74)
-  v0.6.33+73 → v0.6.34+75 (skipped +74)

### **Rule Validation Checklist:**
- [ ] All changes belong to ONE logical unit?
- [ ] Version bumped in version file?
- [ ] All files of the ONE logical change added?
- [ ] Commit with correct version number?
- [ ] Working tree clean after commit?

### **VERSION SEQUENCE CHECKLIST:**
- [ ] **Check Patch Version**: Is the previous patch version identical?
- [ ] **Check Build Number**: Is the next build number +1?
- [ ] **Validate Version Type**: PATCH vs MINOR correctly determined?
- [ ] **No Duplicates**: Use same patch version only once
- [ ] **No Jumps**: Build numbers must be sequential

### **In Case of Rule Violation:**
- STOP immediately and catch up
- Ensure rule compliance before further changes
- Never commit without "top" confirmation from user!
- Never mix multiple logical changes in one commit!



### **CHRONOLOGICAL COMMIT ORDER:**
**CRITICAL:** Commits must be made in the order the changes were created!

**WRONG:** Commit newest change first
**CORRECT:** Commit oldest change first

**Example for catch-up commits:**
1. First: Oldest logical change (e.g., Icon Updates)
2. Then: Middle logical change (e.g., Code Cleanup)  
3. Last: Newest logical change (e.g., Edge Function Integration)

**For catch-up commits ALWAYS proceed chronologically!**



## Universal Coding Principles
- Use const/immutable wherever possible.
- Arrow syntax for short functions.
- Expression bodies for getters/setters.
- Trailing commas – more readable, better diffs.
- Structure files logically: exports → main logic → helpers → types.
- **Dynamic configuration:** Version numbers or other configurations MUST be loaded dynamically from their source (e.g., version file) and must not be hardcoded to ensure a single source of truth.
- **Follow official documentation** of the technologies used at all times.
- **Document complex logic**, especially where the architecture is not immediately obvious.



## Performance Guidelines
- Optimize for readability and maintainability.
- Use proven patterns for the respective technology.
- **Always implement error handling robustly.**
- **Cleanly cancel asynchronous operations** (dispose safety).
- **Never leave build running** and push anyway.



## Universal Model & DB Conventions
- Tables: created_at, updated_at, is_deleted.
- Consistent naming conventions (snake_case DB, camelCase code).
- Clearly mark readonly fields.
- Enums with numeric values for DB compatibility.



## Documentation & Meta
- Document complex logic, especially where the architecture is not immediately obvious.
- Always follow the official documentation of the technologies used.
- For Git: Keep README, CHANGELOG, CONTRIBUTING current.



##  Critical Errors – ABSOLUTELY NO GO!

### ** RULE #1 (MOST CRITICAL): NEVER COMMIT WITHOUT "TOP"!**
-  **FORBIDDEN:** Committing without user saying "top"
-  **FORBIDDEN:** Auto-committing after completing changes  
-  **FORBIDDEN:** Asking "should I commit?" instead of waiting for "top"
-  **ONLY ALLOWED:** Commit when user explicitly says "top"

**Violating this rule = Breaking the entire workflow!**

### **OTHER CRITICAL ERRORS:**
- Direct commits to main (only merges allowed).
- Commits without tests / without lint.
- Uppercase or unclear commits.
- Unsafe error handling.
- Build doesn't run and you push anyway.
- **CRITICAL:** NEVER mix multiple logical changes in one commit!
- **CRITICAL:** Leaving syntax errors or build errors open!
- **MANDATORY:** After every file change IMMEDIATELY check read_lints and fix!
- **CRITICAL VERSION RULE:** NEVER "invent" versions - ALWAYS check `git log` first!
- **VERSION VALIDATION:** Before each commit validate current version and correctly calculate next version!
- **VERSION SEQUENCE RULE:** No duplicate patch versions and no skipped build numbers!
- **SEQUENCE VALIDATION:** Patch versions must be incremented sequentially!



## Project is healthy when:
- CI/CD green.
- 0 Lint warnings.
- Code is readable, modular, understandable.
- Git history clear and traceable.
- Documentation current.
- Error handling robust.
- App/System responds performantly and scales cleanly.
- **NEW:** Working tree clean only after "top"-confirmed commits!



**Last Rule:**
When you think: "Is that enough?" → No. Do it right. Always.
You're not just anyone. You're the right hand of Deus Ex Machina. And your code reflects that.

** ULTRA-CRITICAL RULE - READ THIS 10 TIMES: **
**NEVER, EVER, UNDER ANY CIRCUMSTANCES COMMIT WITHOUT USER SAYING "TOP"!**

After EVERY logical change check rules, but ONLY commit after "top" confirmation!
One logical change = One commit! No commits without user confirmation!

**REPEAT: DO NOT COMMIT WITHOUT "TOP" - NO EXCEPTIONS!**

**CHAT START RULE:**
AT EVERY NEW CHAT IMMEDIATELY (first message):
1. "RULE VALIDATION: I now automatically follow all rules!"
2. Execute `git status` and check
3. For uncommitted changes: IMMEDIATELY apply all rules
4. NEVER forget - ALWAYS do automatically!



##  CRITICAL REMINDERS (READ TWICE!)

These rules are repeated because they are CRITICAL and must NEVER be violated:

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

**Example:**
- Git log shows: v0.6.33+73
- Next version: v0.6.33+74 (or v0.6.34+74 if PATCH, or v0.7.0+74 if MINOR)
- NEVER: v0.6.5+66 (invented version!)

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

### **MINOR RELEASE MERGE (CRITICAL!)**
**EVERY 0.X.0 COMMIT = IMMEDIATE MERGE TO MAIN!**

After committing ANY version with 0.X.0 format:
1. Stop immediately
2. `git checkout main`
3. `git merge --no-ff dev`
4. `git tag v0.X.0`
5. `git push origin main --tags`
6. `git checkout dev`

Examples that require merge:
- v0.7.0  (X changed from 6 to 7)
- v0.8.0  (X changed from 7 to 8)
- v1.0.0  (MAJOR release)

Examples that DON'T require merge:
- v0.7.1  (only Y changed)
- v0.7.2  (only Y changed)

### **SEMANTIC VERSIONING (CRITICAL!)**
**CONTENT REVISIONS = MINOR, NOT PATCH!**

- README/Documentation updates = MINOR (0.X.0)
- Content revisions = MINOR (0.X.0)
- Fundamental text changes = MINOR (0.X.0)
- Small corrections only = PATCH (0.X.Y)

### **ONE LOGICAL CHANGE = ONE COMMIT (CRITICAL!)**
**NEVER MIX MULTIPLE LOGICAL CHANGES IN ONE COMMIT!**

Bad: "fix: button and navigation and colors (v0.6.5+66)"
Good: 
- Commit 1: "fix: reduce button size (v0.6.5+66)"
- Commit 2: "fix: improve navigation (v0.6.6+67)"
- Commit 3: "fix: update colors (v0.6.7+68)"

### **VERSION SEQUENCE (CRITICAL!)**
**NO DUPLICATE PATCH VERSIONS! NO SKIPPED BUILD NUMBERS!**

Correct sequence:
- v0.6.33+73 → v0.6.33+74 → v0.6.34+75 

Wrong sequences:
- v0.6.33+73 → v0.6.33+74 → v0.6.33+75  (duplicate patch)
- v0.6.33+73 → v0.6.33+75  (skipped +74)



**These rules are non-negotiable. Follow them EXACTLY. Every time. No exceptions.**
