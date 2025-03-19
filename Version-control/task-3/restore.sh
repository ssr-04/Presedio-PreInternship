#!/bin/bash

# Set script to exit on error
set -e

# Variables
REPO_NAME="git-repo"

# Creating and navigating to project directory
echo "Creating the project repo..."
mkdir -p "$REPO_NAME"
cd "$REPO_NAME"

# Initializing git
echo -e "\nInitializing git:"
git init

# Creating a sample file to stage
echo -e "\nCreating file.txt..."
echo "Hello world" > file.txt

# Displaying the file content and staging
echo -e "\nThe file.txt contains:"
cat file.txt
echo -e "\nStaging the file.txt..."
git add file.txt

# Checking the git status
echo -e "\nDisplaying the git status:"
git status

# Modifying file.txt
echo -e "\nAdding extra line to file.txt..."
echo "This is a new line" >> file.txt

# Displaying the modified file.txt
echo -e "\nNow file.txt contains:"
cat file.txt

# Displaying the unstaged changes
echo -e "\nOutput of git status:"
git status

# Restoring using git restore
echo -e "\nUndoing changes using git restore..."
git restore file.txt

# Displaying file.txt
echo -e "\nAfter undo, file.txt contains:"
cat file.txt

# Finally git status
echo -e "\nGit status:"
git status

# End
echo -e "\nNote:git restore can also be used for unstaging a staged file"
echo -e "End of script"