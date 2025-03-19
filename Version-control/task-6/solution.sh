#!/bin/bash

# Set script to exit on error
set -e

# Initialize and navigate to Git repository
echo "Initializing new Git repo - 'stash-repo':"
git init stash-repo
cd stash-repo || exit

# Create initial commit on main
echo -e "\nMaking the initial commit with readme.txt:"
echo "started working on project" > readme.txt
git add .
git commit -m "initial commit"

# Add another file and commit
echo -e "\n Adding one more file and making commit on main:"
echo "need to fix something" > somefile.txt
git add .
git commit -m "added some file"

# Create and switch to feature_branch
echo -e "\nCreating and switching to feature_branch"
git switch -c feature_branch

# Make changes in feature_branch
echo -e "\nMaking few changes and staging changes..."
echo "added from feature branch" >> readme.txt
echo "working on a feature1" > feature1.txt
git add feature1.txt readme.txt

# Make more untracked changes
echo -e "\nMaking some unstaged changes..."
echo "some feature 2" > feature2.txt

# Show status before stashing
echo -e "\n>>> Git status before stashing:"
git status

# Stash changes (including untracked files)
echo -e "\nStashing the changes"
git stash -u -m "changes in feature_branch"

# Show stash list
echo -e "\n>>> Stashed changes:"
git stash list

# Switch to main branch and make a fix
echo -e "\nSwitching to main and fixing something:"
git switch main
echo "fixed something" >> somefile.txt
git add .
git commit -m "some fixes"

# Show logs after fix
echo -e "\n>>> Git log after fixing something in main:"
git log --oneline --graph --decorate --all

# Switch back to feature_branch
echo -e "\nSwitching to feature_branch"
git switch feature_branch

# Show stash list before popping
echo -e "\n>>> Stash list before applying stash:"
git stash list

# Show what’s inside the stash
echo -e "\n>>> Stash contents:"
git stash show -p stash@{0}

# Apply stashed changes
echo -e "\nApplying stashes:"
git stash pop

# Show status after popping stash
echo -e "\n>>> Git status after popping stash:"
git status

# Commit stashed changes
echo -e "\nCommiting feature_branch"
git add .
git commit -m "added some features"

# Show final git log
echo -e "\n>>> Final Git log:"
git log --oneline --graph --decorate --all
