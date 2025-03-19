#!/bin/bash

# Set script to exit on error
set -e

# Variables
REPO_DIR="git-repo"

# Create and navigate to the project directory
echo "Creating the repo.."
mkdir -p "$REPO_DIR"
cd "$REPO_DIR"

# Initialize git repo
echo "Initializing git.."
git init

# Create .gitignore file with common Node.js exclusions
echo "Creating .gitignore file.."
echo "# typical gitignore for a 'Node' project
# Node.js dependencies
node_modules/

# Logs
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Environment variables
.env

# Build files
dist/
build/

# Temporary files
*.tmp
*.swp
*.swo

# Editor & OS-specific files
.vscode/
.idea/
.DS_Store
Thumbs.db
" > .gitignore

# Create sample project structure
echo "Setting up project structure"
mkdir -p node_modules build
touch node_modules/test.js
touch build/output.js
touch .env
touch npm-debug.log
touch app.js

# Display Git status before staging files
echo "Checking Git status before adding files"
git status

# Stage necessary files
echo "Staging allowed files"
git add .

# Display Git status after staging files
echo "Checking Git status after adding files"
git status

# Verify ignored files
echo "Verifying ignored files"
git check-ignore -v *

# Success message
echo "Repository setup complete! Yet to commit"