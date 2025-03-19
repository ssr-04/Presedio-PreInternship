#!/bin/bash

# Set script to exit on error
set -e

# Variables
REPO_NAME="git_reset_demo"

# Creating and navigating to project directory
echo "Creating the project repo for reset demo..."
mkdir -p "$REPO_NAME"
cd "$REPO_NAME"

# Initializing git
echo -e "\nInitializing Git:"
git init

# Creating and committing files
echo -e "\n Creating files..."
echo "Hello from file 1" > file1.txt
echo "Hello from file 2" > file2.txt

echo -e "\n Staging and commiting files:"
git add .
git commit -m "Initial commit"

# Making changes and committing multiple times
echo -e "\n Making more commits..."
echo "New change" >> file1.txt
git add .
git commit -m "Commit 1 - Added new change"

echo "More edits" >> file2.txt
git add .
git commit -m "Commit 2 - More edits"

# Show commit history
echo -e "\n Git commit history (before reset):"
git log --oneline --graph --decorate 

# Asking user for reset type
echo -e "\n Demonstrating different types of reset"
echo -e "\n 1) Soft Reset (keeps changes staged)"
echo -e "\n 2) Default Reset (keeps changes unstaged)"
echo -e "\n 3) Hard Reset (removes changes completely)"
read -p "Choose reset type (1-3): " choice

if [[ "$choice" == "1" ]]; then
    echo -e "\n Performing Soft Reset..."
    git reset --soft HEAD~1
    git status
elif [[ "$choice" == "2" ]]; then
    echo -e "\n Performing Mixed(default) Reset..."
    git reset HEAD~1
    git status
elif [[ "$choice" == "3" ]]; then
    echo -e "\n Performing Hard Reset"
    git reset --hard HEAD~1
    git status
else
    echo "Invalid choice. Exiting."
fi

echo -e "\n Final Git commit history:"
git log --oneline --graph --decorate -n 3

echo -e "\n Script execution completed!"
