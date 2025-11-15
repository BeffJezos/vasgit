# Updating Vasgit Rules

This guide shows you how to update your vasgit rules to the latest version.

## Why Update?

New versions of vasgit may include:
- Bug fixes in rules logic
- New tech stack templates
- Improved AI behavior patterns
- Better version management rules
- Additional IDE support

## Update Methods

### Method 1: Re-run Setup Script (Recommended)

The easiest way to update is to re-run the setup script:

```bash
# Clone latest vasgit
cd /tmp
git clone https://github.com/BeffJezos/vasgit

# Navigate to your project
cd ~/my-project

# Run setup script
bash /tmp/vasgit/.vasgit/scripts/setup.sh

# Choose "existing project" when prompted
# Your rules file will be backed up automatically

# Cleanup
rm -rf /tmp/vasgit
```

The script will:
- ✅ Backup your current rules file
- ✅ Copy the latest template
- ✅ Preserve your project structure

### Method 2: Manual Download

For quick updates without running the full setup:

```bash
# Navigate to your project
cd ~/my-project

# Backup current rules
cp .cursor/rules .cursor/rules.backup

# Download latest rules (adjust URL for your tech stack)
curl -o .cursor/rules https://raw.githubusercontent.com/BeffJezos/vasgit/main/.vasgit/examples/react-solo-rules.md

# For other tech stacks:
# JavaScript: .../javascript-solo-rules.md
# TypeScript: .../typescript-solo-rules.md
# Python: .../python-solo-rules.md
# Flutter: .../flutter-solo-rules.md
# Go: .../go-solo-rules.md
# Generic: .../templates/solo-workflow.md
```

### Method 3: Check for Major Changes

Before updating, check what's new:

```bash
# View latest changes
curl -s https://api.github.com/repos/BeffJezos/vasgit/releases/latest | grep "body"

# Or visit GitHub releases page
# https://github.com/BeffJezos/vasgit/releases
```

## When to Update?

### Update Immediately If:
- 🔴 **Security fixes** in token handling
- 🔴 **Critical bugs** affecting commits
- 🔴 **Breaking changes** requiring action

### Update When Convenient:
- 🟡 New features you want to use
- 🟡 Improved AI behavior patterns
- 🟡 Support for new IDE

### Don't Update If:
- 🟢 Current rules work perfectly
- 🟢 Mid-project with no issues
- 🟢 No new features you need

## Checking Your Version

Your rules file doesn't include version numbers, but you can check when you last updated:

```bash
# Check file modification date
ls -la .cursor/rules

# If you have git history
git log --follow .cursor/rules
```

## Breaking Changes

Major versions may include breaking changes. Always:

1. **Read the changelog** before updating
2. **Backup your current rules** (setup script does this automatically)
3. **Test in a non-production environment** first
4. **Review changes** in the new rules file

## Rollback

If the new rules don't work for you:

```bash
# Setup script creates automatic backups
ls .cursor/rules.backup.*

# Restore the latest backup
cp .cursor/rules.backup.1234567890 .cursor/rules
```

## Stay Informed

Ways to know when updates are available:

1. **Watch the repo** on GitHub (Releases only)
2. **Check periodically** (once per month is enough)
3. **Follow discussions** on GitHub Issues

## Contributing Updates

Found an improvement? Contribute back:

1. Read [CONTRIBUTING.md](../.vasgit/CONTRIBUTING.md)
2. Submit a pull request
3. Help others with better rules

## Update Frequency

**Recommended:**
- Check for updates: **Monthly**
- Apply updates: **When needed**
- Emergency updates: **Immediately**

## Questions?

- **Will updates break my workflow?** No, rules are backward compatible unless noted
- **Do I need to update?** Only if you want new features or fixes
- **Can I customize after update?** Yes, rules files are yours to modify
- **What about my custom changes?** Backup before updating, then merge manually

---

**Remember:** Your rules file is in your project. You control when and how to update.

