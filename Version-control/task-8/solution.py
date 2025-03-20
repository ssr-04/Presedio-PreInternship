#!/usr/bin/env python3

import subprocess
import sys

print("Running pre-commit checks...")

# Define required tools
LINTER = "flake8"
TEST_RUNNER = "pytest"

# Check if the required tools are installed
def check_tool_installed(tool):
    try:
        subprocess.run([tool, "--version"], stdout=subprocess.PIPE, stderr=subprocess.PIPE, check=True)
    except FileNotFoundError:
        print(f"Error: {tool} is not installed. Install it using 'pip install {tool}'.")
        sys.exit(1)

check_tool_installed(LINTER)
check_tool_installed(TEST_RUNNER)

# Get list of staged files
staged_files = subprocess.run(
    ["git", "diff","--cached","--name-only"],
    stdout=subprocess.PIPE, text=True
).stdout.splitlines()

# Filter Python files
staged_python_files = [file for file in staged_files if file.endswith(".py")]

if not staged_python_files:
    print("No Python files staged. Skipping linting and tests.")
    sys.exit(1)

print(f"Checking Python files: {', '.join(staged_python_files)}")

# Run flake8 linting on staged files
print(f"Running {LINTER}...")
lint_result = subprocess.run([LINTER] + staged_python_files)
if lint_result.returncode != 0:
    print("Linting failed! Fix the issues and try again.")
    sys.exit(1)
print("No linting issues detected!")

# Run pytest
print("Running pytest...")
test_result = subprocess.run([TEST_RUNNER, "--disable-warnings"])
if test_result.returncode != 0:
    print("Tests failed! Fix the issues and try again.")
    sys.exit(1)
print("All tests passed!")

print("Pre-commit checks passed! Proceeding with commit.")
sys.exit(0)