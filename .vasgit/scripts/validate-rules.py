#!/usr/bin/env python3
"""
AI IDE Rules Validator

Validates .ai-ide/rules files and template files for completeness and correctness.
Supports multiple AI IDE formats and directory structures.
"""

import os
import re
import sys
import argparse
from pathlib import Path
from typing import List, Tuple, Optional
from dataclasses import dataclass


@dataclass
class ValidationResult:
    """Result of a validation check."""
    success: bool
    message: str
    severity: str  # "info", "warning", "error"


class Colors:
    """ANSI color codes for terminal output."""
    GREEN = "\033[32m"
    YELLOW = "\033[33m"
    RED = "\033[31m"
    BLUE = "\033[34m"
    BOLD = "\033[1m"
    RESET = "\033[0m"


class RulesValidator:
    """Validates .ai-ide/rules files and template files."""
    
    def __init__(self):
        self.results: List[ValidationResult] = []
        
        # Required sections for rules files - simplified patterns
        self.required_sections = [
            (r'##\s+Git\s+[Ww]orkflow', 'Git Workflow'),
            (r'##\s+[Cc]ommit\s+[Ss]tandards?', 'Commit Standards'),
            (r'##\s+[Ss]emantic\s+[Vv]ersioning', 'Semantic Versioning'),
            (r'##\s+[Ff]orbidden\s+[Oo]perations?', 'Forbidden Operations'),
            (r'##\s+[Hh]ealthy\s+[Pp]roject', 'Healthy Project')
        ]
        
        # Optional but recommended sections
        self.recommended_sections = [
            (r'##\s+[Vv]ersion\s+[Mm]anagement', 'Version Management'),
            (r'##\s+[Pp]erformance', 'Performance'),
            (r'##\s+[Ss]tartup\s+[Aa]rchitecture', 'Startup Architecture'),
            (r'##\s+[Cc]ritical\s+[Vv]iolations', 'Critical Violations')
        ]
    
    def validate_file(self, file_path: Path) -> bool:
        """Validate a single rules file."""
        print(f"\n{Colors.BOLD}Validating: {file_path}{Colors.RESET}")
        
        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                content = f.read()
        except Exception as e:
            self.results.append(ValidationResult(
                success=False,
                message=f"Could not read file: {e}",
                severity="error"
            ))
            return False
        
        # Reset results for this file
        self.results = []
        
        # Run all validations
        self._validate_required_sections(content)
        self._validate_recommended_sections(content)
        self._validate_commit_format(content)
        self._validate_version_format(content)
        self._validate_file_structure(content)
        self._validate_workflow_consistency(content)
        
        # Print results
        self._print_results()
        
        # Return success if no errors
        return not any(r.severity == "error" for r in self.results)
    
    def _validate_required_sections(self, content: str) -> None:
        """Validate that required sections are present."""
        for section_pattern, section_name in self.required_sections:
            if not re.search(section_pattern, content, re.IGNORECASE):
                self.results.append(ValidationResult(
                    success=False,
                    message=f"Missing required section: {section_name}",
                    severity="error"
                ))
            else:
                self.results.append(ValidationResult(
                    success=True,
                    message=f"Found required section: {section_name}",
                    severity="info"
                ))
    
    def _validate_recommended_sections(self, content: str) -> None:
        """Validate that recommended sections are present."""
        for section_pattern, section_name in self.recommended_sections:
            if re.search(section_pattern, content, re.IGNORECASE):
                self.results.append(ValidationResult(
                    success=True,
                    message=f"Found recommended section: {section_name}",
                    severity="info"
                ))
            else:
                self.results.append(ValidationResult(
                    success=False,
                    message=f"Missing recommended section: {section_name}",
                    severity="warning"
                ))
    
    def _validate_commit_format(self, content: str) -> None:
        """Validate commit message format examples."""
        # Look for commit message examples
        commit_examples = re.findall(r'`([^`]+)`', content)
        valid_commits = []
        
        for example in commit_examples:
            if re.match(r'^(feat|fix|docs|style|refactor|test|chore):\s+.+', example):
                valid_commits.append(example)
        
        if valid_commits:
            self.results.append(ValidationResult(
                success=True,
                message=f"Found {len(valid_commits)} valid commit message examples",
                severity="info"
            ))
        else:
            self.results.append(ValidationResult(
                success=False,
                message="No valid commit message examples found",
                severity="warning"
            ))
    
    def _validate_version_format(self, content: str) -> None:
        """Validate version format examples."""
        # Look for version examples - more flexible pattern
        version_examples = re.findall(r'v?\d+\.\d+\.\d+\+\d+', content)
        
        if version_examples:
            self.results.append(ValidationResult(
                success=True,
                message=f"Found {len(version_examples)} version format examples",
                severity="info"
            ))
        else:
            self.results.append(ValidationResult(
                success=False,
                message="No version format examples found",
                severity="warning"
            ))
    
    def _validate_file_structure(self, content: str) -> None:
        """Validate overall file structure."""
        lines = content.split('\n')
        
        # Check file length
        if len(lines) < 50:
            self.results.append(ValidationResult(
                success=False,
                message="File seems too short (less than 50 lines)",
                severity="warning"
            ))
        else:
            self.results.append(ValidationResult(
                success=True,
                message=f"File has good length ({len(lines)} lines)",
                severity="info"
            ))
        
        # Check for markdown headers
        headers = [line for line in lines if line.startswith('#')]
        if len(headers) < 5:
            self.results.append(ValidationResult(
                success=False,
                message="File seems to have too few sections",
                severity="warning"
            ))
        else:
            self.results.append(ValidationResult(
                success=True,
                message=f"File has good structure ({len(headers)} sections)",
                severity="info"
            ))
    
    def _validate_workflow_consistency(self, content: str) -> None:
        """Validate that only one workflow is configured."""
        # Look for workflow sections
        workflow_patterns = [
            r'Linear\s+[Ww]orkflow',
            r'Feature\s+[Bb]ranch\s+[Ww]orkflow',
            r'Git\s+[Ff]low',
            r'Dev-[Ff]irst\s+[Ww]orkflow'
        ]
        
        found_workflows = []
        for pattern in workflow_patterns:
            if re.search(pattern, content, re.IGNORECASE):
                found_workflows.append(pattern)
        
        if len(found_workflows) == 1:
            self.results.append(ValidationResult(
                success=True,
                message=f"Single workflow configured: {found_workflows[0]}",
                severity="info"
            ))
        elif len(found_workflows) > 1:
            self.results.append(ValidationResult(
                success=False,
                message=f"Multiple workflows found: {', '.join(found_workflows)}",
                severity="warning"
            ))
        else:
            self.results.append(ValidationResult(
                success=False,
                message="No clear workflow configuration found",
                severity="warning"
            ))
    
    def _print_results(self) -> None:
        """Print validation results with colors."""
        for result in self.results:
            if result.success:
                if result.severity == "info":
                    print(f"{Colors.GREEN}✓{Colors.RESET} {result.message}")
                else:
                    print(f"{Colors.BLUE}ℹ{Colors.RESET} {result.message}")
            else:
                if result.severity == "error":
                    print(f"{Colors.RED}✗{Colors.RESET} {result.message}")
                else:
                    print(f"{Colors.YELLOW}{result.message}{Colors.RESET}")
    
    def validate_directory(self, directory: Path, recursive: bool = False) -> bool:
        """Validate all rules files and template files in a directory."""
        print(f"\n{Colors.BOLD}Validating directory: {directory}{Colors.RESET}")
        
        # Look for rules files in various IDE directories
        rules_files = []
        
        if recursive:
            # Look for rules files in subdirectories
            rules_files = list(directory.rglob('**/.ai-ide/rules'))
            rules_files.extend(list(directory.rglob('**/.cursor/rules')))
            rules_files.extend(list(directory.rglob('**/.github/rules')))
            rules_files.extend(list(directory.rglob('**/.code-whisperer/rules')))
            rules_files.extend(list(directory.rglob('**/.tabnine/rules')))
        else:
            # Look for rules files in current directory
            rules_files = list(directory.glob('.ai-ide/rules'))
            rules_files.extend(list(directory.glob('.cursor/rules')))
            rules_files.extend(list(directory.glob('.github/rules')))
            rules_files.extend(list(directory.glob('.code-whisperer/rules')))
            rules_files.extend(list(directory.glob('.tabnine/rules')))
        
        # If no rules files found, look for template files
        if not rules_files:
            if recursive:
                template_files = list(directory.rglob('**/*.md'))
            else:
                template_files = list(directory.glob('*.md'))
            
            # Filter for template files (exclude README, docs, etc.)
            template_files = [f for f in template_files if 'template' in f.name.lower() or 'workflow' in f.name.lower() or 'solo' in f.name.lower() or 'rules' in f.name.lower()]
            
            if template_files:
                print(f"Found {len(template_files)} template files to validate")
                all_success = True
                for template_file in template_files:
                    if not self.validate_file(template_file):
                        all_success = False
                return all_success
            else:
                self.results.append(ValidationResult(
                    success=False,
                    message="No rules files or template files found",
                    severity="error"
                ))
                return False
        
        # Validate each file
        all_success = True
        for rules_file in rules_files:
            if not self.validate_file(rules_file):
                all_success = False
        
        return all_success


def main():
    """Main entry point."""
    parser = argparse.ArgumentParser(
        description="Validate AI IDE rules files and template files for completeness and correctness"
    )
    parser.add_argument(
        "target",
        help="File or directory to validate"
    )
    parser.add_argument(
        "--recursive", "-r",
        action="store_true",
        help="Recursively search for rules files and template files in subdirectories"
    )
    parser.add_argument(
        "--verbose", "-v",
        action="store_true",
        help="Show verbose output (always enabled)"
    )
    
    args = parser.parse_args()
    
    # Always show verbose output for better user experience
    args.verbose = True
    
    target_path = Path(args.target)
    
    if not target_path.exists():
        print(f"{Colors.RED}Error: Target '{args.target}' does not exist{Colors.RESET}")
        sys.exit(1)
    
    validator = RulesValidator()
    
    if target_path.is_file():
        # Validate single file
        success = validator.validate_file(target_path)
    else:
        # Validate directory
        success = validator.validate_directory(target_path, args.recursive)
    
    # Print summary
    print(f"\n{Colors.BOLD}Validation Summary{Colors.RESET}")
    if success:
        print(f"{Colors.GREEN}✓ Validation passed with no issues{Colors.RESET}")
        sys.exit(0)
    else:
        print(f"{Colors.RED}✗ Validation failed with issues{Colors.RESET}")
        sys.exit(1)


if __name__ == "__main__":
    main()
