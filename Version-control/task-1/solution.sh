#!/bin/bash

# Exit script if any command fails
set -e

# Create a new directory and navigate into it
mkdir my-git-repo
cd my-git-repo

# Initialize Git
git init

# Creates a new file 'file1.txt' with some content
echo "Hi, from the file 1" > file1.txt

# Stages the file
git add file1.txt

# Commits the changes
git commit -m "added file1"

# Creates a new branch and switches to it (modern and preferred over checkout -b)
git switch -c feature-branch

# Creates a new file 'feature.txt' with some content
echo "This is a new feature" > feature.txt

# Stages the changes
git add feature.txt

# Commits the changes to the feature branch
git commit -m "added a new feature"

# Switches back to the main branch
git switch main

# Merges the feature-branch with main
git merge feature-branch

# Deletes the feature branch (optional)
git branch -d feature-branch

# Displays the logs of changes
git log --oneline --graph --all

# Displays success message
echo "Git repository setup completed successfully!"
