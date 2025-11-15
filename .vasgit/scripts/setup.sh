#!/bin/bash

# Vasgit Setup Script
# Intelligent setup with automatic cleanup

set -e

# Colors
print_success() { echo -e "\033[32m✓ $1\033[0m"; }
print_warning() { echo -e "\033[33m⚠ $1\033[0m"; }
print_error() { echo -e "\033[31m✗ $1\033[0m"; }
print_info() { echo -e "\033[34mℹ $1\033[0m"; }
print_header() { echo -e "\033[1;36m$1\033[0m"; }

# ASCII Art
clear
echo -e "\033[1;36m"
cat << "EOF"
__     ___    ____   ____ ___ _____ 
\ \   / / \  / ___| / ___|_ _|_   _|
 \ \ / / _ \ \___ \| |  _ | |  | |  
  \ V / ___ \ ___) | |_| || |  | |  
   \_/_/   \_\____/ \____|___| |_|
EOF
echo -e "\033[0m"
echo
print_info "Professional Git workflows for AI-assisted development"
echo

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

# Project type
print_header "Project Type"
echo "1) New project (created from vasgit template)"
echo "2) Existing project (add vasgit rules to current project)"
echo
read -p "Choose option (1-2): " project_type

case $project_type in
    1)
        TARGET_DIR="$(pwd)"
        PROJECT_TYPE="new"
        print_success "New project setup in: $TARGET_DIR"
        ;;
    2)
        read -p "Enter project path (or . for current): " custom_path
        if [ "$custom_path" = "." ]; then
            TARGET_DIR="$(pwd)"
        else
            TARGET_DIR="${custom_path/#\~/$HOME}"
        fi
        PROJECT_TYPE="existing"
        
        if [ ! -d "$TARGET_DIR" ]; then
            print_error "Directory does not exist: $TARGET_DIR"
            exit 1
        fi
        print_success "Target: $TARGET_DIR"
        ;;
    *)
        print_error "Invalid choice"
        exit 1
        ;;
esac

echo

# Git Workflow selection
print_header "Git Workflow"
echo "1) Dev-First with no-ff merges (Recommended)"
echo "   • Development on dev branch"
echo "   • Merge to main with --no-ff for releases"
echo "   • Clear release points in history"
echo
echo "2) Linear workflow"
echo "   • All work directly on main"
echo "   • Simplest possible history"
echo "   • Good for small projects"
echo
read -p "Choose workflow (1-2): " workflow_choice

case $workflow_choice in
    1)
        WORKFLOW_TYPE="dev-first"
        WORKFLOW_NAME="Dev-First (no-ff)"
        print_success "Selected: Dev-First workflow with no-ff merges"
        ;;
    2)
        WORKFLOW_TYPE="linear"
        WORKFLOW_NAME="Linear"
        print_success "Selected: Linear workflow"
        ;;
    *)
        print_error "Invalid choice"
        exit 1
        ;;
esac

echo

# IDE selection
print_header "IDE Selection"
echo "1) Cursor"
echo "2) Windsurf (Codeium)"
echo "3) VS Code / Visual Studio (GitHub Copilot)"
echo "4) JetBrains IDEs (IntelliJ, PyCharm, etc.)"
echo "5) Universal (any AI IDE)"
echo
read -p "Choose IDE (1-5): " ide_choice

case $ide_choice in
    1)
        RULES_DIR=".cursor"
        RULES_FILE="rules"
        IDE_NAME="Cursor"
        ;;
    2)
        RULES_DIR=".wind"
        RULES_FILE="rules"
        IDE_NAME="Windsurf"
        ;;
    3)
        RULES_DIR=".github"
        RULES_FILE="copilot-instructions.md"
        IDE_NAME="GitHub Copilot"
        ;;
    4)
        RULES_DIR=".github"
        RULES_FILE="copilot-instructions.md"
        IDE_NAME="JetBrains with Copilot"
        print_info "Note: JetBrains uses GitHub Copilot instructions"
        ;;
    5)
        RULES_DIR=".ai-ide"
        RULES_FILE="rules"
        IDE_NAME="Universal"
        ;;
    *)
        print_error "Invalid choice"
        exit 1
        ;;
esac

print_success "Selected: $IDE_NAME"
echo

# Technology selection
print_header "Technology Stack"
echo "1) React"
echo "2) JavaScript/Node.js"
echo "3) TypeScript"
echo "4) Python"
echo "5) Flutter/Dart"
echo "6) Go"
echo "7) Generic (other tech stacks)"
echo
read -p "Choose technology (1-7): " tech_choice

case $tech_choice in
    1)
        TEMPLATE="$SCRIPT_DIR/examples/react-solo-rules.md"
        TECH_NAME="React"
        ;;
    2)
        TEMPLATE="$SCRIPT_DIR/examples/javascript-solo-rules.md"
        TECH_NAME="JavaScript/Node.js"
        ;;
    3)
        TEMPLATE="$SCRIPT_DIR/examples/typescript-solo-rules.md"
        TECH_NAME="TypeScript"
        ;;
    4)
        TEMPLATE="$SCRIPT_DIR/examples/python-solo-rules.md"
        TECH_NAME="Python"
        ;;
    5)
        TEMPLATE="$SCRIPT_DIR/examples/flutter-solo-rules.md"
        TECH_NAME="Flutter/Dart"
        ;;
    6)
        TEMPLATE="$SCRIPT_DIR/examples/go-solo-rules.md"
        TECH_NAME="Go"
        ;;
    7)
        TEMPLATE="$SCRIPT_DIR/templates/solo-workflow.md"
        TECH_NAME="Generic"
        ;;
    *)
        print_error "Invalid choice"
        exit 1
        ;;
esac

print_success "Selected: $TECH_NAME"
echo

# Validate template exists
if [ ! -f "$TEMPLATE" ]; then
    print_error "Template file not found: $TEMPLATE"
    exit 1
fi

# Create rules directory
FULL_RULES_DIR="$TARGET_DIR/$RULES_DIR"
FULL_RULES_PATH="$FULL_RULES_DIR/$RULES_FILE"

if [ ! -d "$FULL_RULES_DIR" ]; then
    mkdir -p "$FULL_RULES_DIR"
    print_success "Created directory: $RULES_DIR/"
else
    print_info "Directory already exists: $RULES_DIR/"
fi

# Check if rules file exists
if [ -f "$FULL_RULES_PATH" ]; then
    print_warning "Rules file already exists: $RULES_DIR/$RULES_FILE"
    read -p "Backup and replace? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        BACKUP_FILE="$FULL_RULES_PATH.backup.$(date +%s)"
        mv "$FULL_RULES_PATH" "$BACKUP_FILE"
        print_success "Backed up to: $(basename "$BACKUP_FILE")"
    else
        print_info "Keeping existing rules file"
        exit 0
    fi
fi

# Copy template
cp "$TEMPLATE" "$FULL_RULES_PATH"
print_success "Copied $TECH_NAME rules to $RULES_DIR/$RULES_FILE"
echo

# Cleanup for new projects
if [ "$PROJECT_TYPE" = "new" ] && [ -d "$TARGET_DIR/.vasgit" ]; then
    print_header "Cleaning Up"
    print_info "Removing unnecessary files..."
    
    # Keep only docs/, CONTRIBUTING.md, LICENSE
    cd "$TARGET_DIR/.vasgit"
    rm -rf examples templates scripts VASGIT.png
    
    # Remove setup files from root
    cd "$TARGET_DIR"
    rm -f setup.bat
    
    print_success "Cleaned up .vasgit/ directory"
    print_info "Kept: docs/, CONTRIBUTING.md, LICENSE"
    print_success "Removed setup files (no longer needed)"
    echo
fi

# Setup complete
print_header "Setup Complete!"
echo
print_success "Configuration:"
echo "  • Workflow: $WORKFLOW_NAME"
echo "  • IDE: $IDE_NAME"
echo "  • Tech Stack: $TECH_NAME"
echo "  • Rules File: $RULES_DIR/$RULES_FILE"
echo

print_header "🚀 Get Started (3 Steps):"
echo
echo "1. Read the golden rules (5 min):"
echo "   \$ less .vasgit/docs/golden-rules.md"
echo
echo "2. Paste this message into your coding assistant ($IDE_NAME):"
echo "   'Read and follow the rules in $RULES_DIR/$RULES_FILE."
echo "   Pay special attention to the top confirmation workflow.'"
echo
echo "3. Try the 'top' workflow (if new project):"
echo "   Just say: 'top'"
echo
print_info "Your coding assistant will automatically initialize git and commit!"
if [ "$WORKFLOW_TYPE" = "dev-first" ]; then
    echo "   git init"
    echo "   git add ."
    echo "   git commit -m 'initial commit (v0.1.0)'"
    echo "   git branch dev"
    echo "   git checkout dev"
else
    echo "   git init"
    echo "   git add ."
    echo "   git commit -m 'initial commit (v0.1.0)'"
fi
echo
print_info "Note: Normally combine 'top' with next task: 'top - add dark mode'"
print_info "      This time it's just for showcase!"
echo

# Check if new project that will need force push
COMMIT_COUNT=$(git log --oneline 2>/dev/null | wc -l | tr -d ' ')
if [ "$COMMIT_COUNT" = "0" ] || [ "$COMMIT_COUNT" = "1" ]; then
    print_warning "⚠️  AFTER 'top': First push needs --force!"
    echo "   Your coding assistant creates new git history → diverges from remote"
    echo "   First push: git push origin main --force"
    echo "   Later: git push origin main (normal)"
    echo
fi

print_success "That's it! Start coding with clean Git history."
echo
print_info "Read workflow details: .vasgit/docs/git-workflows.md"
echo

# GitHub Token Setup (Optional)
print_header "GitHub Token Setup (Optional)"
echo
print_info "Enable your coding assistant to automatically push commits after 'top' confirmation."
print_info "Best experience: No manual push commands needed."
print_warning "Use at your own risk: Token gives push access to your repository."
echo
read -p "Setup GitHub token for automatic push? (y/N): " -n 1 -r
echo
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
    print_header "GitHub Token Setup Guide"
    echo
    print_info "Why Personal Access Token (not SSH)?"
    echo "  • Tokens work better with coding assistants (can be embedded in git URLs)"
    echo "  • SSH keys are more secure but harder to configure for auto-push"
    echo "  • Tokens can be easily revoked if compromised"
    echo
    
    echo "1. Go to GitHub.com → Settings → Developer settings"
    echo "   → Personal access tokens → Tokens (classic)"
    echo
    print_info "Note: NOT 'SSH and GPG keys' - that's for SSH protocol"
    echo
    read -p "Press Enter when ready to continue..."
    echo
    
    echo "2. Click 'Generate new token (classic)'"
    echo "   • Name: 'Vasgit - $(basename "$TARGET_DIR")'"
    echo "   • Expiration: 90 days"
    echo "   • Scope: ✅ repo (full control)"
    echo
    read -p "Press Enter when you've generated the token..."
    echo
    
    print_warning "IMPORTANT: Copy your token NOW (you won't see it again!)"
    echo
    read -p "Paste your GitHub token here: " -s GITHUB_TOKEN
    echo
    echo
    
    if [ -z "$GITHUB_TOKEN" ]; then
        print_warning "No token provided. Skipping setup."
    else
        # Get GitHub username and repo
        read -p "Enter your GitHub username: " GITHUB_USER
        read -p "Enter your repository name: " GITHUB_REPO
        
        # Configure git remote with token
        cd "$TARGET_DIR"
        
        if git remote get-url origin &>/dev/null; then
            print_info "Updating existing remote..."
            git remote set-url origin "https://${GITHUB_TOKEN}@github.com/${GITHUB_USER}/${GITHUB_REPO}.git"
        else
            print_info "Adding new remote..."
            git remote add origin "https://${GITHUB_TOKEN}@github.com/${GITHUB_USER}/${GITHUB_REPO}.git"
        fi
        
        print_success "GitHub token configured!"
        echo
        
        # Check if this is a new project (will need force push after top)
        COMMIT_COUNT=$(git log --oneline 2>/dev/null | wc -l | tr -d ' ')
        if [ "$COMMIT_COUNT" = "0" ] || [ "$COMMIT_COUNT" = "1" ]; then
            print_warning "⚠️  IMPORTANT: After 'top' command, you'll need FORCE PUSH!"
            echo
            echo "   Why? Your coding assistant will reinitialize git history (clean start)."
            echo "   Remote still has old history → histories diverged"
            echo
            print_info "First push after 'top': git push origin main --force"
            print_info "Later pushes: git push origin main (normal)"
        else
            print_info "Test it with: git push origin main"
        fi
        echo
        
        # Update AI rules with push permission
        if [ -f "$FULL_RULES_PATH" ]; then
            echo "" >> "$FULL_RULES_PATH"
            echo "## Git Push Permission" >> "$FULL_RULES_PATH"
            echo "" >> "$FULL_RULES_PATH"
            echo "I have permission to automatically push commits after 'top' confirmation:" >> "$FULL_RULES_PATH"
            echo '```bash' >> "$FULL_RULES_PATH"
            echo "git push origin main" >> "$FULL_RULES_PATH"
            echo "# or: git push origin dev" >> "$FULL_RULES_PATH"
            echo '```' >> "$FULL_RULES_PATH"
            echo "" >> "$FULL_RULES_PATH"
            echo "Network permission is configured. Use required_permissions: ['git_write', 'network'] in tool calls." >> "$FULL_RULES_PATH"
            
            print_success "Updated rules file with push permission"
        fi
        
        echo
        print_header "Token Setup Complete!"
        print_info "Your coding assistant can now push automatically after 'top' confirmation"
        print_info "Read more: .vasgit/docs/github-token-setup.md"
    fi
    echo
fi

print_success "Done! Start coding with clean Git history."

# Update hint
if [ "$PROJECT_TYPE" = "existing" ]; then
    echo
    print_info "💡 Tip: Re-run this script anytime to update your rules to the latest version."
fi
