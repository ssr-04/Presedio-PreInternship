#!/bin/bash

# Set script to exit on error
set -e

# Variables
REPO_NAME="merge-conflict-demo"
FILE_NAME="file.txt"

# Create and navigate to the project directory
echo -e "Creating a new repository: $REPO_NAME"
mkdir -p "$REPO_NAME"
cd "$REPO_NAME"

# Initializing Git
echo -e "\nInitializing Git:"
git init

# Creating and committing a initial file
echo -e "\n Creating $FILE_NAME with initial content..."
echo "This is the original line." > "$FILE_NAME"
git add "$FILE_NAME"
echo -e "\n Making initial commit on main:"
git commit -m "Initial commit with $FILE_NAME"

# Creating the feature branch
echo -e "\n Creating 'feature-branch' and modifying $FILE_NAME..."
git switch -c feature-branch
echo "This is a feature change." > "$FILE_NAME"
git add "$FILE_NAME"
echo -e "\n Commiting feature-branch with changes:"
git commit -m "Modified $FILE_NAME in feature-branch"

# Switching back to main and creating the bugfix branch
echo -e "\n Switching back to 'main' and creating 'bugfix-branch'..."
git switch main
git switch -c bugfix-branch
echo -e "\n Modifying $FILE_NAME on bugfix-branch..."
echo "This is a bug fix change." > "$FILE_NAME"
git add "$FILE_NAME"
echo -e "\n Commiting bugfix-branch with changes:"
git commit -m "Modified $FILE_NAME in bugfix-branch"

# Merging bugfix-branch into feature-branch
echo -e "\n Switching to 'feature-branch' and attempting to merge 'bugfix-branch'..."
git switch feature-branch
if ! git merge bugfix-branch; then
    echo -e "\n Merge conflict detected!"
fi

# Displaying status and diff
echo -e "\n Checking status of merge conflict: "
git status
echo -e "\n Checking differences in file: "
git diff

# Resolving conflict manually
echo -e "\n Resolving merge conflict..."
echo "This line includes both feature and bug fix changes." > "$FILE_NAME"

# Staging and committing the resolution
git add "$FILE_NAME"
echo -e "Commiting with merge resolutions to complete the merge:"
git commit -m "Resolved merge conflict between feature-branch and bugfix-branch"

# Displaying final commit history
echo -e "\n Final Git commit history:"
git log --oneline --graph --decorate

# Displaying final content of the file
echo -e "\n Final content of $FILE_NAME:"
cat "$FILE_NAME"

echo -e "\n Merge conflict resolved successfully!"
