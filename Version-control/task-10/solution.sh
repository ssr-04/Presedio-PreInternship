#!/bin/bash

# Set script to exit on error
set -e

# Initialize Repository
echo "Cloning remote repository..."
git clone https://github.com/ssr-04/Test-repo.git
cd Test-repo || exit

# Create Initial Commit on Main
echo -e "\nCreating initial commit on main branch..."
echo "Initial code in app.py" > app.py
git add .
git commit -m "Initial commit on main"

# Creating Feature, Bug-Fixes, and Release Branches
echo -e "\nCreating feature, bug-fixes, and release branches..."
git branch feature
git branch bug-fixes
git branch release

# Checking Branches
echo -e "\nChecking branches:"
git branch -a

# Switch to Feature Branch and Make Commits
echo -e "\nSwitching to 'feature' branch and adding features..."
git switch feature
echo "Feature part 1" >> app.py
git commit -am "Feature commit 1: Added part 1"
echo "Feature part 2" >> app.py
git commit -am "Feature commit 2: Added part 2"

# Switch to Bug-Fixes Branch and Apply Fixes
echo -e "\nSwitching to 'bug-fixes' branch and adding bug fixes..."
git switch bug-fixes
echo "Major bug fix 1" >> app.py
git commit -am "Major bug fixed"
echo "Minor bug fix 1" >> app.py
git commit -am "Minor bug fixed"

# Push Feature Branch to Remote
echo -e "\nPushing 'feature' branch to remote..."
git switch feature
git push origin feature

# Display Commit History Before Cherry-Pick
echo -e "\n>>> Commit history before cherry-picking:"
git log --oneline --graph --decorate --all

# Cherry-Pick Bug Fix into Feature Branch
echo -e "\nCherry-picking a bug fix from 'bug-fixes' into 'feature'..."
git cherry-pick b0d6e9a || {
  echo "Merge conflict detected. Resolving manually..."
  git add app.py
  git cherry-pick --continue
}

# Display Commit History After Cherry-Pick
echo -e "\n>>> Commit history after cherry-picking:"
git log --oneline --graph --decorate --all

# Perform Interactive Rebase to Squash Commits
echo -e "\nPerforming interactive rebase to squash feature commits..."
git rebase -i HEAD~3

# Attempt to Push Changes (Expected Rejection)
echo -e "\nAttempting to push rebased feature branch..."
if ! git push origin feature; then
  echo "Push rejected due to non-fast-forward updates."
  echo "Using --force-with-lease to safely update remote..."
  git push --force-with-lease origin feature
fi

# Simulating Accidental Reset in Bug-Fixes Branch
echo -e "\nSimulating an accidental reset in 'bug-fixes' branch..."
git switch bug-fixes
git reset --hard HEAD~1

# Using Git Reflog to Recover Lost Commit
echo -e "\nRecovering lost commit using 'git reflog'..."
git switch feature
git reflog bug-fixes
git branch recovery-bug-branch 947664c

# Merging Recovered Bug Fix Back into Feature Branch
echo -e "\nMerging recovered bug-fix branch into 'feature'..."
git merge recovery-bug-branch || {
  echo "Merge conflict detected. Resolving manually..."
  git add app.py
  git merge --continue
}

# Renaming Recovered Branch Back to Bug-Fixes
echo -e "\nRenaming 'recovery-bug-branch' back to 'bug-fixes'..."
git branch -d bug-fixes
git branch -m recovery-bug-branch bug-fixes

# Merging Feature Branch into Release
echo -e "\nMerging 'feature' into 'release'..."
git switch release
git merge feature

# Merging Release Branch into Main
echo -e "\nMerging 'release' into 'main'..."
git switch main
git merge feature

# Pushing Final Changes to Remote
echo -e "\nPushing final merged changes to remote..."
git push

# Display Final Commit History
echo -e "\n>>> Final Git log:"
git log --oneline --graph --decorate --all
