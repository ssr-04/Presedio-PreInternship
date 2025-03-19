#!/bin/bash

# Set script to exit on error
set -e

echo "Initializing new Git repo - 'cherry-pick-repo':"
git init cherry-pick-repo
cd cherry-pick-repo || exit

# Create initial commit on main
echo -e "\nCreating the initial commit on main:"
echo "print('Hello World!')" > app.py
git add .
git commit -m "Initial commit with basic app structure"

# Create and switch to feature_branch
echo -e "\nCreating and switching to feature_branch..."
git switch -c feature_branch

# Add a new feature (this commit won't be cherry-picked)
echo -e "\nAdding a new feature to feature_branch..."
echo "print('Feature in progress')" >> app.py
git add .
git commit -m "Added new feature logic"

# Simulate a bug fix that is needed in main
echo -e "\nFixing a database connection issue (important bug fix)..."
echo "print('Fixed database connection issue')" >> app.py
git add .
git commit -m "Fixed database connection issue"

# Show commit history before cherry-picking
echo -e "\n>>> Commit history before cherry-picking:"
git log --oneline --graph --decorate --all

# Get commit hash of the bug fix (latest commit on feature_branch)
BUG_FIX_COMMIT=$(git log --oneline --grep="Fixed database connection issue" --format=format:"%H" -n 1)

# Switch to main branch
echo -e "\nSwitching back to main..."
git switch main

# Cherry-pick the bug fix commit from feature_branch
echo -e "\nCherry-picking the bug fix commit into main..."
git cherry-pick "$BUG_FIX_COMMIT"

# Show commit history after cherry-picking
echo -e "\n>>> Commit history after cherry-picking:"
git log --oneline --graph --decorate --all

# Verifying the applied changes
echo -e "\n>>> Content of app.py after cherry-picking:"
cat app.py

echo -e "\nCherry-picking process completed successfully! 🎉"
