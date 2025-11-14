#!/bin/bash

# Vasgit Setup Script  
# Universal setup for any AI-powered development environment

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

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    print_error "This script must be run from within a git repository"
    print_info "Please run: git init && git remote add origin <your-repo-url>"
    exit 1
fi

print_header "Vasgit Setup"
print_info "Setting up professional solo development workflows for AI IDE"

# Check if .ai-ide directory exists
if [ ! -d ".ai-ide" ]; then
    print_info "Creating .ai-ide directory for IDE rules"
    mkdir -p .ai-ide
    print_success "Created .ai-ide directory"
fi

# Check if rules file already exists
if [ -f ".ai-ide/rules" ]; then
    print_warning "Rules file already exists at .ai-ide/rules"
    read -p "Do you want to backup and replace it? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        mv ".ai-ide/rules" ".ai-ide/rules.backup.$(date +%s)"
        print_success "Backed up existing rules file"
    else
        print_info "Keeping existing rules file"
        exit 0
    fi
fi

# Function to select workflow
select_workflow() {
    echo
    print_header "Select Your Git Workflow"
    echo "1) Solo Dev-First Workflow (Recommended - Battle-tested)"
    echo
    print_info "Note: This is a solo development tool. All workflows are optimized for individual developers."
    
    read -p "Press Enter to continue with Solo Dev-First Workflow: "
    
    TEMPLATE="templates/solo-workflow.md"
    WORKFLOW_NAME="Solo Dev-First Workflow"
    
    print_success "Selected: $WORKFLOW_NAME"
}

# Function to select technology
select_technology() {
    echo
    print_header "Select Your Technology Stack (Optional)"
    echo "1) Use workflow template as-is"
    echo "2) React (Solo Development)"
    echo "3) JavaScript/Node.js (Solo Development)"
    echo "4) TypeScript (Solo Development)"
    echo "5) Python (Solo Development)"
    echo "6) Flutter/Dart (Solo Development)"
    echo "7) Go (Solo Development)"
    
    read -p "Choose technology (1-7): " tech_choice
    
    case $tech_choice in
        1)
            TECH_TEMPLATE="templates/solo-workflow.md"
            TECH_NAME="Generic Solo Workflow"
            ;;
        2)
            TECH_TEMPLATE="examples/react-solo-rules.md"
            TECH_NAME="React Solo"
            ;;
        3)
            TECH_TEMPLATE="examples/javascript-solo-rules.md"
            TECH_NAME="JavaScript/Node.js Solo"
            ;;
        4)
            TECH_TEMPLATE="examples/typescript-solo-rules.md"
            TECH_NAME="TypeScript Solo"
            ;;
        5)  
            TECH_TEMPLATE="examples/python-solo-rules.md"
            TECH_NAME="Python Solo"
            ;;
        6)
            TECH_TEMPLATE="examples/flutter-solo-rules.md"
            TECH_NAME="Flutter/Dart Solo"
            ;;
        7)
            TECH_TEMPLATE="examples/go-solo-rules.md"
            TECH_NAME="Go Solo"
            ;;
            
        *)
            print_error "Invalid choice. Using generic template."
            TECH_TEMPLATE="templates/solo-workflow.md"
            TECH_NAME="Generic Solo Workflow"
            ;;
    esac
    
    print_success "Selected: $TECH_NAME"
}

# Main setup function
main() {
    # Change to script directory to ensure relative paths work
    cd "$(dirname "$0")/.."
    
    if [ ! -d "templates" ]; then
        print_error "Templates directory not found"
        print_info "Please run this script from the vasgit directory"
        exit 1
    fi
    
    # Select workflow
    select_workflow
    
    # Select technology
    select_technology
    
    # Determine final template
    if [ -n "$TECH_TEMPLATE" ] && [ -f "$TECH_TEMPLATE" ]; then
        FINAL_TEMPLATE="$TECH_TEMPLATE"
        print_info "Using template: $TECH_NAME"
    else
        FINAL_TEMPLATE="$TEMPLATE"
        print_info "Using workflow template: $WORKFLOW_NAME"
    fi
    
    # Copy template to .ai-ide/rules
    if [ -f "$FINAL_TEMPLATE" ]; then
        cp "$FINAL_TEMPLATE" ".ai-ide/rules"
        print_success "Successfully installed: $WORKFLOW_NAME template"
        
        # If solo workflow, also mention golden rules
        if [ "$WORKFLOW_NAME" = "Solo Dev-First Workflow" ]; then
            print_info "For best results, also read: golden rules/golden-rules.md"
        fi
    else
        print_error "Template file not found: $FINAL_TEMPLATE"
        exit 1
    fi
    
    echo
    print_header "Setup Complete!"
    print_success "Your .ai-ide/rules file has been configured"
    print_info "Your AI assistant will now follow professional development standards"
    
    echo
    print_header "Next Steps:"
    echo "1. Start a new chat with your AI assistant"
    echo "2. Tell them to read and follow the rules in .ai-ide/rules"
    if [ "$WORKFLOW_NAME" = "Solo Dev-First Workflow" ]; then
        echo "3. Mention the 'top' confirmation workflow"
        echo "4. Begin developing with clean, professional Git history!"
    else
        echo "3. Begin developing with professional workflows!"
    fi
    
    echo
    print_header "Support:"
    echo "• Documentation: https://github.com/BeffJezos/vasgit"
    echo "• Issues: https://github.com/BeffJezos/vasgit/issues"
    
    print_success "Setup complete."
}

# Run main function
main "$@"