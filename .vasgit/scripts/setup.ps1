# Vasgit Setup Script (PowerShell)
# Intelligent setup with automatic cleanup

$ErrorActionPreference = "Stop"

# Colors
function Write-Success { param($msg) Write-Host "✓ $msg" -ForegroundColor Green }
function Write-Warning { param($msg) Write-Host "⚠ $msg" -ForegroundColor Yellow }
function Write-Error { param($msg) Write-Host "✗ $msg" -ForegroundColor Red }
function Write-Info { param($msg) Write-Host "ℹ $msg" -ForegroundColor Cyan }
function Write-Header { param($msg) Write-Host $msg -ForegroundColor Cyan }

# ASCII Art
Clear-Host
Write-Host @"
__     ___    ____   ____ ___ _____ 
\ \   / / \  / ___| / ___|_ _|_   _|
 \ \ / / _ \ \___ \| |  _ | |  | |  
  \ V / ___ \ ___) | |_| || |  | |  
   \_/_/   \_\____/ \____|___| |_|
"@ -ForegroundColor Cyan

Write-Host ""
Write-Info "Professional Git workflows for AI-assisted development"
Write-Host ""

# Get script directory
$SCRIPT_DIR = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
if (-not $SCRIPT_DIR) {
    $SCRIPT_DIR = Join-Path $PSScriptRoot ".."
    $SCRIPT_DIR = (Resolve-Path $SCRIPT_DIR).Path
}

# Project type
Write-Header "Project Type"
Write-Host "1) New project (created from vasgit template)"
Write-Host "2) Existing project (add vasgit rules to current project)"
Write-Host ""
$project_type = Read-Host "Choose option (1-2)"

switch ($project_type) {
    "1" {
        $TARGET_DIR = Get-Location
        $PROJECT_TYPE = "new"
        Write-Success "New project setup in: $TARGET_DIR"
    }
    "2" {
        $custom_path = Read-Host "Enter project path (or . for current)"
        if ($custom_path -eq ".") {
            $TARGET_DIR = Get-Location
        } else {
            $TARGET_DIR = $custom_path -replace "^~", $env:USERPROFILE
        }
        $PROJECT_TYPE = "existing"
        
        if (-not (Test-Path $TARGET_DIR)) {
            Write-Error "Directory does not exist: $TARGET_DIR"
            exit 1
        }
        Write-Success "Target: $TARGET_DIR"
    }
    default {
        Write-Error "Invalid choice"
        exit 1
    }
}

Write-Host ""

# Git Workflow selection
Write-Header "Git Workflow"
Write-Host "1) Dev-First with no-ff merges (Recommended)"
Write-Host "   • Development on dev branch"
Write-Host "   • Merge to main with --no-ff for releases"
Write-Host "   • Clear release points in history"
Write-Host ""
Write-Host "2) Linear workflow"
Write-Host "   • All work directly on main"
Write-Host "   • Simplest possible history"
Write-Host "   • Good for small projects"
Write-Host ""
$workflow_choice = Read-Host "Choose workflow (1-2)"

switch ($workflow_choice) {
    "1" {
        $WORKFLOW_TYPE = "dev-first"
        $WORKFLOW_NAME = "Dev-First (no-ff)"
        Write-Success "Selected: Dev-First workflow with no-ff merges"
    }
    "2" {
        $WORKFLOW_TYPE = "linear"
        $WORKFLOW_NAME = "Linear"
        Write-Success "Selected: Linear workflow"
    }
    default {
        Write-Error "Invalid choice"
        exit 1
    }
}

Write-Host ""

# IDE selection
Write-Header "IDE Selection"
Write-Host "1) Cursor"
Write-Host "2) Windsurf (Codeium)"
Write-Host "3) VS Code / Visual Studio (GitHub Copilot)"
Write-Host "4) JetBrains IDEs (IntelliJ, PyCharm, etc.)"
Write-Host "5) Universal (any AI IDE)"
Write-Host ""
$ide_choice = Read-Host "Choose IDE (1-5)"

switch ($ide_choice) {
    "1" {
        $RULES_DIR = ".cursor"
        $RULES_FILE = "rules"
        $IDE_NAME = "Cursor"
    }
    "2" {
        $RULES_DIR = ".wind"
        $RULES_FILE = "rules"
        $IDE_NAME = "Windsurf"
    }
    "3" {
        $RULES_DIR = ".github"
        $RULES_FILE = "copilot-instructions.md"
        $IDE_NAME = "GitHub Copilot"
    }
    "4" {
        $RULES_DIR = ".github"
        $RULES_FILE = "copilot-instructions.md"
        $IDE_NAME = "JetBrains with Copilot"
        Write-Info "Note: JetBrains uses GitHub Copilot instructions"
    }
    "5" {
        $RULES_DIR = ".ai-ide"
        $RULES_FILE = "rules"
        $IDE_NAME = "Universal"
    }
    default {
        Write-Error "Invalid choice"
        exit 1
    }
}

Write-Success "Selected: $IDE_NAME"
Write-Host ""

# Technology selection
Write-Header "Technology Stack"
Write-Host "1) React"
Write-Host "2) JavaScript/Node.js"
Write-Host "3) TypeScript"
Write-Host "4) Python"
Write-Host "5) Flutter/Dart"
Write-Host "6) Go"
Write-Host "7) Generic (other tech stacks)"
Write-Host ""
$tech_choice = Read-Host "Choose technology (1-7)"

switch ($tech_choice) {
    "1" {
        $TEMPLATE = Join-Path $SCRIPT_DIR "examples\react-solo-rules.md"
        $TECH_NAME = "React"
    }
    "2" {
        $TEMPLATE = Join-Path $SCRIPT_DIR "examples\javascript-solo-rules.md"
        $TECH_NAME = "JavaScript/Node.js"
    }
    "3" {
        $TEMPLATE = Join-Path $SCRIPT_DIR "examples\typescript-solo-rules.md"
        $TECH_NAME = "TypeScript"
    }
    "4" {
        $TEMPLATE = Join-Path $SCRIPT_DIR "examples\python-solo-rules.md"
        $TECH_NAME = "Python"
    }
    "5" {
        $TEMPLATE = Join-Path $SCRIPT_DIR "examples\flutter-solo-rules.md"
        $TECH_NAME = "Flutter/Dart"
    }
    "6" {
        $TEMPLATE = Join-Path $SCRIPT_DIR "examples\go-solo-rules.md"
        $TECH_NAME = "Go"
    }
    "7" {
        $TEMPLATE = Join-Path $SCRIPT_DIR "templates\solo-workflow.md"
        $TECH_NAME = "Generic"
    }
    default {
        Write-Error "Invalid choice"
        exit 1
    }
}

Write-Success "Selected: $TECH_NAME"
Write-Host ""

# Validate template exists
if (-not (Test-Path $TEMPLATE)) {
    Write-Error "Template file not found: $TEMPLATE"
    exit 1
}

# Create rules directory
$FULL_RULES_DIR = Join-Path $TARGET_DIR $RULES_DIR
$FULL_RULES_PATH = Join-Path $FULL_RULES_DIR $RULES_FILE

if (-not (Test-Path $FULL_RULES_DIR)) {
    New-Item -ItemType Directory -Path $FULL_RULES_DIR -Force | Out-Null
    Write-Success "Created directory: $RULES_DIR/"
} else {
    Write-Info "Directory already exists: $RULES_DIR/"
}

# Check if rules file exists
if (Test-Path $FULL_RULES_PATH) {
    Write-Warning "Rules file already exists: $RULES_DIR\$RULES_FILE"
    $reply = Read-Host "Backup and replace? (y/N)"
    if ($reply -match "^[Yy]$") {
        $timestamp = [int][double]::Parse((Get-Date -UFormat %s))
        $BACKUP_FILE = "$FULL_RULES_PATH.backup.$timestamp"
        Move-Item $FULL_RULES_PATH $BACKUP_FILE
        Write-Success "Backed up to: $(Split-Path -Leaf $BACKUP_FILE)"
    } else {
        Write-Info "Keeping existing rules file"
        exit 0
    }
}

# Copy template
Copy-Item $TEMPLATE $FULL_RULES_PATH
Write-Success "Copied $TECH_NAME rules to $RULES_DIR\$RULES_FILE"
Write-Host ""

# Cleanup for new projects
if ($PROJECT_TYPE -eq "new" -and (Test-Path (Join-Path $TARGET_DIR ".vasgit"))) {
    Write-Header "Cleaning Up"
    Write-Info "Removing unnecessary files..."
    
    # Keep only docs/, CONTRIBUTING.md, LICENSE
    $vasgit_dir = Join-Path $TARGET_DIR ".vasgit"
    Remove-Item (Join-Path $vasgit_dir "examples") -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item (Join-Path $vasgit_dir "templates") -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item (Join-Path $vasgit_dir "scripts") -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item (Join-Path $vasgit_dir "VASGIT.png") -Force -ErrorAction SilentlyContinue
    
    Write-Success "Cleaned up .vasgit\ directory"
    Write-Info "Kept: docs\, CONTRIBUTING.md, LICENSE"
    Write-Host ""
}

# Setup complete
Write-Header "Setup Complete!"
Write-Host ""
Write-Success "Configuration:"
Write-Host "  • Workflow: $WORKFLOW_NAME"
Write-Host "  • IDE: $IDE_NAME"
Write-Host "  • Tech Stack: $TECH_NAME"
Write-Host "  • Rules File: $RULES_DIR\$RULES_FILE"
Write-Host ""

Write-Header "🚀 Get Started (3 Steps):"
Write-Host ""
Write-Host "1. Read the golden rules (5 min):"
Write-Host "   Get-Content .vasgit\docs\golden-rules.md | more"
Write-Host ""
Write-Host "2. Paste this message into your coding assistant ($IDE_NAME):"
Write-Host "   'Read and follow the rules in $RULES_DIR\$RULES_FILE."
Write-Host "   Pay special attention to the top confirmation workflow.'"
Write-Host ""
Write-Host "3. Try the 'top' workflow (if new project):"
Write-Host "   Just say: 'top'"
Write-Host ""
Write-Info "Your coding assistant will automatically initialize git and commit!"
if ($WORKFLOW_TYPE -eq "dev-first") {
    Write-Host "   git init"
    Write-Host "   git add ."
    Write-Host "   git commit -m 'initial commit (v0.1.0)'"
    Write-Host "   git branch dev"
    Write-Host "   git checkout dev"
} else {
    Write-Host "   git init"
    Write-Host "   git add ."
    Write-Host "   git commit -m 'initial commit (v0.1.0)'"
}
Write-Host ""
Write-Info "Note: Normally combine 'top' with next task: 'top - add dark mode'"
Write-Info "      This time it's just for showcase!"
Write-Host ""

# Check if new project that will need force push
Push-Location $TARGET_DIR
$COMMIT_COUNT = 0
try {
    $COMMIT_COUNT = (git log --oneline 2>$null | Measure-Object).Count
} catch {
    $COMMIT_COUNT = 0
}
Pop-Location

if ($COMMIT_COUNT -eq 0 -or $COMMIT_COUNT -eq 1) {
    Write-Warning "⚠️  AFTER 'top': First push needs --force!"
    Write-Host "   Your coding assistant creates new git history → diverges from remote"
    Write-Host "   First push: git push origin main --force"
    Write-Host "   Later: git push origin main (normal)"
    Write-Host ""
}

Write-Success "That's it! Start coding with clean Git history."
Write-Host ""
Write-Info "Read workflow details: .vasgit\docs\git-workflows.md"
Write-Host ""

# GitHub Token Setup (Optional)
Write-Header "GitHub Token Setup (Optional)"
Write-Host ""
Write-Info "Enable your coding assistant to automatically push commits after 'top' confirmation."
Write-Info "Best experience: No manual push commands needed."
Write-Warning "Use at your own risk: Token gives push access to your repository."
Write-Host ""
$reply = Read-Host "Setup GitHub token for automatic push? (y/N)"
Write-Host ""

if ($reply -match "^[Yy]$") {
    Write-Header "GitHub Token Setup Guide"
    Write-Host ""
    Write-Info "Why Personal Access Token (not SSH)?"
    Write-Host "  • Tokens work better with coding assistants (can be embedded in git URLs)"
    Write-Host "  • SSH keys are more secure but harder to configure for auto-push"
    Write-Host "  • Tokens can be easily revoked if compromised"
    Write-Host ""
    
    Write-Host "1. Go to GitHub.com → Settings → Developer settings"
    Write-Host "   → Personal access tokens → Tokens (classic)"
    Write-Host ""
    Write-Info "Note: NOT 'SSH and GPG keys' - that's for SSH protocol"
    Write-Host ""
    Read-Host "Press Enter when ready to continue..." | Out-Null
    Write-Host ""
    
    Write-Host "2. Click 'Generate new token (classic)'"
    Write-Host "   • Name: 'Vasgit - $(Split-Path -Leaf $TARGET_DIR)'"
    Write-Host "   • Expiration: 90 days"
    Write-Host "   • Scope: ✅ repo (full control)"
    Write-Host ""
    Read-Host "Press Enter when you've generated the token..." | Out-Null
    Write-Host ""
    
    Write-Warning "IMPORTANT: Copy your token NOW (you won't see it again!)"
    Write-Host ""
    $GITHUB_TOKEN = Read-Host "Paste your GitHub token here" -AsSecureString
    $GITHUB_TOKEN = [Runtime.InteropServices.Marshal]::PtrToStringAuto(
        [Runtime.InteropServices.Marshal]::SecureStringToBSTR($GITHUB_TOKEN))
    Write-Host ""
    
    if ([string]::IsNullOrEmpty($GITHUB_TOKEN)) {
        Write-Warning "No token provided. Skipping setup."
    } else {
        # Get GitHub username and repo
        $GITHUB_USER = Read-Host "Enter your GitHub username"
        $GITHUB_REPO = Read-Host "Enter your repository name"
        
        # Configure git remote with token
        Push-Location $TARGET_DIR
        
        try {
            git remote get-url origin 2>$null | Out-Null
            Write-Info "Updating existing remote..."
            git remote set-url origin "https://${GITHUB_TOKEN}@github.com/${GITHUB_USER}/${GITHUB_REPO}.git"
        } catch {
            Write-Info "Adding new remote..."
            git remote add origin "https://${GITHUB_TOKEN}@github.com/${GITHUB_USER}/${GITHUB_REPO}.git"
        }
        
        Pop-Location
        
        Write-Success "GitHub token configured!"
        Write-Host ""
        
        # Check if this is a new project (will need force push after top)
        Push-Location $TARGET_DIR
        $COMMIT_COUNT = 0
        try {
            $COMMIT_COUNT = (git log --oneline 2>$null | Measure-Object).Count
        } catch {
            $COMMIT_COUNT = 0
        }
        Pop-Location
        
        if ($COMMIT_COUNT -eq 0 -or $COMMIT_COUNT -eq 1) {
            Write-Warning "⚠️  IMPORTANT: After 'top' command, you'll need FORCE PUSH!"
            Write-Host ""
            Write-Host "   Why? Your coding assistant will reinitialize git history (clean start)."
            Write-Host "   Remote still has old history → histories diverged"
            Write-Host ""
            Write-Info "First push after 'top': git push origin main --force"
            Write-Info "Later pushes: git push origin main (normal)"
        } else {
            Write-Info "Test it with: git push origin main"
        }
        Write-Host ""
        
        # Update AI rules with push permission
        if (Test-Path $FULL_RULES_PATH) {
            Add-Content -Path $FULL_RULES_PATH -Value ""
            Add-Content -Path $FULL_RULES_PATH -Value "## Git Push Permission"
            Add-Content -Path $FULL_RULES_PATH -Value ""
            Add-Content -Path $FULL_RULES_PATH -Value "I have permission to automatically push commits after 'top' confirmation:"
            Add-Content -Path $FULL_RULES_PATH -Value '```bash'
            Add-Content -Path $FULL_RULES_PATH -Value "git push origin main"
            Add-Content -Path $FULL_RULES_PATH -Value "# or: git push origin dev"
            Add-Content -Path $FULL_RULES_PATH -Value '```'
            Add-Content -Path $FULL_RULES_PATH -Value ""
            Add-Content -Path $FULL_RULES_PATH -Value "Network permission is configured. Use required_permissions: ['git_write', 'network'] in tool calls."
            
            Write-Success "Updated rules file with push permission"
        }
        
        Write-Host ""
        Write-Header "Token Setup Complete!"
        Write-Info "Your coding assistant can now push automatically after 'top' confirmation"
        Write-Info "Read more: .vasgit\docs\github-token-setup.md"
    }
    Write-Host ""
}

Write-Success "Done! Start coding with clean Git history."

# Update hint
if ($PROJECT_TYPE -eq "existing") {
    Write-Host ""
    Write-Info "💡 Tip: Re-run this script anytime to update your rules to the latest version."
}

