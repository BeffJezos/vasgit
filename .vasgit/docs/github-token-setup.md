# GitHub Token Setup for AI Auto-Push

This guide shows you how to set up GitHub tokens so your AI can automatically push commits.

## Why Use This?

- AI can push commits automatically after "top" confirmation
- No manual push commands needed
- Faster workflow
- Still maintains security through Personal Access Tokens

## Setup Instructions

### 1. Create GitHub Personal Access Token

1. Go to GitHub.com → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. Click "Generate new token (classic)"
3. Give it a name: "Cursor AI - MyProject"
4. Set expiration: 90 days (or custom)
5. Select scopes:
   -  `repo` (full control of private repositories)
6. Click "Generate token"
7. **Copy the token immediately** (you won't see it again!)

### 2. Configure Git to Use Token

**Option A: HTTPS with Token (Recommended)**

```bash
# Navigate to your project
cd ~/my-project

# Set remote URL with token
git remote set-url origin https://<YOUR_TOKEN>@github.com/<USERNAME>/<REPO>.git

# Test it
git push origin main
```

**Option B: Store Token in Git Credential Helper**

```bash
# Configure credential helper
git config --global credential.helper store

# Push once (you'll be prompted for username/password)
git push origin main
# Username: your-github-username
# Password: paste-your-token-here

# Future pushes work automatically
```

### 3. Update Your AI Rules

Add this to your `.cursor/rules` or `.ai-ide/rules`:

```markdown
## Git Push Permissions

I have permission to push to GitHub automatically:
- After committing with "top" confirmation
- Using: git push origin main (or dev)
- Network permission is already configured
```

### 4. Enable in Cursor

Tell your AI in the first message of each chat:

```
"I've set up GitHub tokens. You have network permission to push automatically 
after committing. Use: git push origin <branch> --force-with-lease when needed."
```

## Security Best Practices

### Token Security
-  Use tokens with minimal required scopes
-  Set expiration dates (90 days recommended)
-  Never commit tokens to repositories
-  Rotate tokens regularly
-  Don't share tokens publicly

### For Multiple Projects

Create separate tokens for each project:

```bash
# Project 1
git remote set-url origin https://TOKEN_1@github.com/user/project1.git

# Project 2
git remote set-url origin https://TOKEN_2@github.com/user/project2.git
```

### Revoke Token If Compromised

1. Go to GitHub Settings → Developer settings → Personal access tokens
2. Find the token
3. Click "Delete"
4. Generate a new one

## Alternative: SSH Keys

If you prefer SSH over HTTPS:

```bash
# Generate SSH key
ssh-keygen -t ed25519 -C "your_email@example.com"

# Add to SSH agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Copy public key
cat ~/.ssh/id_ed25519.pub

# Add to GitHub: Settings → SSH and GPG keys → New SSH key

# Change remote to SSH
git remote set-url origin git@github.com:<USERNAME>/<REPO>.git
```

With SSH, the AI can push automatically without tokens in the URL.

## Testing the Setup

```bash
# Test commit and push
echo "test" > test.txt
git add test.txt
git commit -m "test: verify auto-push setup (v1.0.1)"
git push origin main

# If successful, you're ready!
# Clean up test
git rm test.txt
git commit -m "chore: remove test file (v1.0.2)"
git push origin main
```

## Troubleshooting

### "Permission denied (publickey)"
- Check SSH key is added to GitHub
- Verify: `ssh -T git@github.com`

### "Authentication failed"
- Token might be expired
- Check token scopes include `repo`
- Verify token is correct in URL

### "Network permission required"
- Tell AI: "You have network permission for git push"
- Or use `required_permissions: ["git_write", "network"]` in tool calls

## Integration with Vasgit Workflow

After setup, your workflow becomes:

```bash
# You say: "top - and also add dark mode"

# AI does:
1. Commits all logical changes separately
2. Automatically pushes: git push origin dev
3. Continues with next task (dark mode)

# No manual push needed!
```

This makes the "top" workflow even smoother.

