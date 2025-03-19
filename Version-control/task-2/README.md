# Task 2: Using .gitignore and Tracking Files  

## **Objective**  
This task focuses on **managing tracked and untracked files** using `.gitignore` in Git. The goal is to:  
- Set up a `.gitignore` file to exclude unnecessary files from version control.  
- Verify that ignored files are **not tracked** by Git.  
- Understand how `git status` and `git check-ignore` help confirm tracking behavior.  

## **Steps Performed**  

1. **Initialized a new Git repository** using `git init`.  
2. **Created a `.gitignore` file** with common node.js ignore patterns (e.g., `node_modules/`, `.env`, `build/`).  
3. **Added files that match and do not match the ignore patterns**:  
   - **Ignored files**: `node_modules/test.js`, `build/output.js`, `.env`, `npm-debug.log`.  
   - **Tracked files**: `.gitignore`, `app.js`.  
4. **Used `git status`** to confirm which files were untracked before and after staging.  
5. **Verified ignored files** using `git check-ignore -v *`.  

---

## **File Structure**  

task-2/     
│── solution.sh  
│── output.txt   
│── task.txt     
│── .gitignore   
│── README.md    

---

## **Key Git Commands Used**  
| Command | Description |  
|---------|------------|  
| `git init` | Initializes a new repository |  
| `echo "pattern" > .gitignore` | Creates a `.gitignore` file with exclusion patterns |  
| `git status` | Shows tracked and untracked files |  
| `git add .` | Stages all non-ignored files |  
| `git check-ignore -v *` | Lists ignored files and the rule that ignored them |  
| `git commit -m "message"` | Commits the changes with a message |  

---

## **Execution Instructions**  
Run the script to set up the repository and verify `.gitignore`:  

```sh
chmod +x solution.sh  # Grant execution permission  
./solution.sh         # Run the script  
```
## **References**
1. https://git-scm.com/docs/gitignore
2. https://github.com/github/gitignore
