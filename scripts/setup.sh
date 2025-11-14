#!/bin/bash

# Vasgit Setup Script
# Copies AI IDE rules to your target project

set -e

# Colors for output
print_success() {
    echo -e "\033[32m✓ $1\033[0m"
}

print_warning() {
    echo -e "\033[33m$1\033[0m"
}

print_error() {
    echo -e "\033[31m✗ $1\033[0m"
}

print_info() {
    echo -e "\033[34mℹ $1\033[0m"
}

print_header() {
    echo -e "\033[1;36m$1\033[0m"
}

print_header "Vasgit Setup"
print_info "Copy AI IDE rules to your project"

# Get target project path
echo
print_header "Target Project"
print_info "Where should the rules file be copied?"
echo "1) Current directory ($(pwd))"
echo "2) Specify custom path"
echo
read -p "Choose option (1-2): " path_choice

case $path_choice in
    1)
        TARGET_DIR="$(pwd)"
        ;;
    2)
        read -p "Enter project path: " custom_path
        TARGET_DIR="${custom_path/#\~/$HOME}"
        ;;
    *)
        print_error "Invalid choice"
        exit 1
        ;;
esac

# Validate target directory
if [ ! -d "$TARGET_DIR" ]; then
    print_error "Directory does not exist: $TARGET_DIR"
    exit 1
fi

print_success "Target: $TARGET_DIR"

# Select IDE
echo
print_header "IDE Selection"
echo "1) Cursor (.cursor/rules)"
echo "2) Universal (.ai-ide/rules)"
echo "3) GitHub Copilot (.github/copilot-rules.md)"
echo
read -p "Choose IDE (1-3): " ide_choice

case $ide_choice in
    1)
        RULES_PATH=".cursor/rules"
        ;;
    2)
        RULES_PATH=".ai-ide/rules"
        ;;
    3)
        RULES_PATH=".github/copilot-rules.md"
        ;;
    *)
        print_error "Invalid choice"
        exit 1
        ;;
esac

# Select technology
echo
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

SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

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

# Check if template exists
if [ ! -f "$TEMPLATE" ]; then
    print_error "Template file not found: $TEMPLATE"
    print_info "Please run this script from the vasgit directory"
    exit 1
fi

# Create target directory if needed
TARGET_RULES_DIR="$TARGET_DIR/$(dirname "$RULES_PATH")"
TARGET_RULES_FILE="$TARGET_DIR/$RULES_PATH"

mkdir -p "$TARGET_RULES_DIR"

# Check if rules file already exists
if [ -f "$TARGET_RULES_FILE" ]; then
    print_warning "Rules file already exists: $TARGET_RULES_FILE"
    read -p "Backup and replace it? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        mv "$TARGET_RULES_FILE" "$TARGET_RULES_FILE.backup.$(date +%s)"
        print_success "Backed up existing rules file"
    else
        print_info "Keeping existing rules file"
        exit 0
    fi
fi

# Copy template
cp "$TEMPLATE" "$TARGET_RULES_FILE"
print_success "Copied $TECH_NAME rules to $TARGET_RULES_FILE"

echo
print_header "Setup Complete!"
echo
print_info "Next steps:"
echo "1. Open your project in your AI IDE"
echo "2. Tell your AI: 'Read and follow the rules in $RULES_PATH'"
echo "3. Mention the 'top' confirmation workflow"
echo "4. Start coding with clean Git history!"
echo
print_info "For detailed guidance, read: golden rules/golden-rules.md"
echo
print_success "Setup complete."