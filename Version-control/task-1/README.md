# Task 1: Initialize, Commit, and Branch Basics  

## **Objective**  
This task focuses on understanding and practicing the **fundamentals of Git version control**, including:  
- Initializing a Git repository  
- Creating and committing files  
- Creating and switching branches  
- Merging changes back to the main branch  

## **Steps Performed**  

1. **Initialized a Git repository** using `git init`.  
2. **Created a new file (`file1.txt`)** and added it to the repository.  
3. **Committed the changes** with `git commit -m "Added file1"`.  
4. **Created a new branch (`feature-branch`)** using `git switch -c feature-branch`.  
5. **Added a new file (`feature.txt`)** and committed the changes in the new branch.  
6. **Switched back to the main branch** (`git switch main`).  
7. **Merged the `feature-branch` into `main`** (`git merge feature-branch`).  
8. **Deleted the `feature-branch`** to keep the repository clean.  
9. **Displayed commit history** (`git log --oneline --graph --all`).  

## **File Structure**  
task-1/     
│── solution.sh      
│── output.txt    
│── task.txt     
│── README.md        

## **Commands Used**  
| Command | Description |  
|---------|------------|  
| `git init` | Initializes a new Git repository |  
| `git add <file>` | Stages changes for commit |  
| `git commit -m "message"` | Saves changes with a descriptive message |  
| `git switch -c <branch>` | Creates and switches to a new branch |  
| `git merge <branch>` | Merges a branch into the current branch |  
| `git branch -d <branch>` | Deletes a branch after merging |  
| `git log --oneline --graph --all` | Displays commit history visually |  

## **Execution Instructions**  
To run the `solution.sh` script and perform the Git operations:  

```sh
chmod +x solution.sh  # Grant execution permission  
./solution.sh         # Run the script  
