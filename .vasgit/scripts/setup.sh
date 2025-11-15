#!/bin/bash

# Vasgit Setup Script
# Intelligent setup for any project type

set -e

# Colors
print_success() { echo -e "\033[32m✓ $1\033[0m"; }
print_warning() { echo -e "\033[33m⚠ $1\033[0m"; }
print_error() { echo -e "\033[31m✗ $1\033[0m"; }
print_info() { echo -e "\033[34mℹ $1\033[0m"; }
print_header() { echo -e "\033[1;36m$1\033[0m"; }

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

print_header "Vasgit Setup"
print_info "Professional Git workflows for AI-assisted development"
echo

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

# IDE selection
print_header "IDE Selection"
echo "1) Cursor"
echo "2) GitHub Copilot"
echo "3) Universal (any AI IDE)"
echo
read -p "Choose IDE (1-3): " ide_choice

case $ide_choice in
    1)
        RULES_DIR=".cursor"
        RULES_FILE="rules"
        IDE_NAME="Cursor"
        ;;
    2)
        RULES_DIR=".github"
        RULES_FILE="copilot-rules.md"
        IDE_NAME="GitHub Copilot"
        ;;
    3)
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

# Setup complete
print_header "Setup Complete!"
echo
print_info "Next steps:"
echo "1. Open your project in $IDE_NAME"
echo "2. Tell your AI: 'Read and follow the rules in $RULES_DIR/$RULES_FILE'"
echo "3. Mention the 'top' confirmation workflow"
echo "4. Start coding with clean Git history!"
echo

# New project cleanup offer
if [ "$PROJECT_TYPE" = "new" ]; then
    echo
    print_header "Clean Up (Optional)"
    print_info "You can now remove the .vasgit/ directory:"
    echo
    echo "  # Keep golden rules for reference:"
    echo "  rm -rf .vasgit/examples .vasgit/templates .vasgit/scripts .vasgit/docs"
    echo
    echo "  # Or remove everything:"
    echo "  rm -rf .vasgit/"
    echo
fi

print_info "Read the golden rules: .vasgit/golden-rules.md"
echo
print_success "Done!"
