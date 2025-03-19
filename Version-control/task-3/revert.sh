#!/bin/bash

# Set script to exit on error
set -e

# Variables
REPO_NAME="git_revert_demo"

# Creating and navigating to project directory
echo "Creating the project repo for revert demo..."
mkdir -p "$REPO_NAME"
cd "$REPO_NAME"

# Initializing git
echo -e "\nInitializing Git:"
git init

# Creating and committing files
echo -e "\nCreating files..."
echo "Hello from file 1" > file1.txt
echo "Hello from file 2" > file2.txt

echo -e "\nStaging and committing files:"
git add .
git commit -m "Initial commit"

# Making changes and committing multiple times
echo -e "\nMaking more commits..."
echo "New change" >> file1.txt
git add .
git commit -m "Commit 1 - Added new change"

echo "More edits" >> file2.txt
git add .
git commit -m "Commit 2 - More edits"

# Show commit history
echo -e "\nGit commit history (before revert):"
git log --oneline --graph --decorate 

# Reverting last commit (fixed)
echo -e "\nReverting last commit..."
git revert HEAD --no-edit

echo -e "\nFinal Git commit history:"
git log --oneline --graph --decorate -n 3

echo -e "\n Script execution completed!"
