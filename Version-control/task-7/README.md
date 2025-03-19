
# **Task 7: Cherry-Picking Commits Between Branches**

## **📌 Objective**
This task demonstrates how to use **Git cherry-pick** to selectively apply a commit from one branch to another **without merging the entire branch**.  

We will explore:
- How `git cherry-pick` helps **move individual commits**.  
- How to **handle conflicts during cherry-picking**.  
- How to **verify commit history after cherry-picking**.  

---

## **📌 Understanding `git cherry-pick`**
### **🔹 What is Cherry-Picking?**
`git cherry-pick` allows you to **apply a specific commit** from one branch to another **without merging all changes**. This is useful when:

✅ A **bug fix** is needed in `main` but the `feature_branch` isn’t ready for merging.  
✅ A **critical hotfix** must be applied to production without bringing unfinished work.  
✅ You want to **reuse a commit** from another branch without merging everything.  

### **🔹 Key `git cherry-pick` Commands**
| **Command** | **Purpose** |
|------------|------------|
| `git cherry-pick <commit-hash>` | Apply a specific commit to the current branch |
| `git cherry-pick A B` | Apply multiple commits (`A` and `B`) |
| `git cherry-pick A^..B` | Apply a range of commits from `A` to `B` |
| `git cherry-pick --no-commit <commit-hash>` | Apply the changes but don’t commit them |
| `git cherry-pick --continue` | Continue cherry-picking after resolving conflicts |
| `git cherry-pick --abort` | Cancel the cherry-picking process |

---

## **📌 Implementation - Solution Overview**
The task is implemented using a **Bash script** [`solution.sh`](./solution.sh) that automates the cherry-picking process.

### **🔹 Scenario: Applying a Bug Fix from `feature_branch` to `main`**
1️⃣ **`main` branch:** Contains the initial project setup (`app.py`).  
2️⃣ **`feature_branch`:** Introduces a **new feature** and later a **bug fix**.  
3️⃣ **Problem:** The bug fix is needed in `main`, but the new feature is **not ready for merging**.  
4️⃣ **Solution:** Cherry-pick **only the bug fix commit** to `main`.  

---

### **🔹 Steps in the Implementation**
### **1️⃣ Creating the Repository and Initial Commits**
- A new Git repository (`cherry-pick-repo`) is initialized.  
- The `main` branch is created with an **initial commit** containing `app.py`.  

### **2️⃣ Creating `feature_branch` and Adding Commits**
- A new branch `feature_branch` is created.  
- A **new feature** is added and committed.  
- A **bug fix** is committed **after** the feature.  

### **3️⃣ Cherry-Picking the Bug Fix**
- The **commit hash** of the bug fix is retrieved using `git log`.  
- The script switches back to `main` and applies **only the bug fix commit**.  

### **4️⃣ Handling Merge Conflicts**
- A **merge conflict occurs** because both `main` and `feature_branch` modified `app.py`.  
- The conflict is **resolved manually**, and `git cherry-pick --continue` is used.  

### **5️⃣ Verifying the Commit History**
- The commit log (`git log --oneline --graph --decorate --all`) is displayed.  
- The content of `app.py` is printed to confirm the bug fix was applied.  

---

## **📌 Script Automation - [`solution.sh`](./solution.sh)**
The script automates the entire process with **clear outputs** at every step.

📜 **Script Reference:** [`solution.sh`](./solution.sh)  
📜 **Execution Output:** [`output.txt`](./output.txt)  

---

## **📌 Execution Output and Analysis**
Below are the key outputs generated when running `./solution.sh`.

### **🔹 Commit History Before Cherry-Picking**
```
>>> Commit history before cherry-picking:
* b8d1cf1 (HEAD -> feature_branch) Fixed database connection issue
* d77af83 Added new feature logic
* a81f20a (main) Initial commit with basic app structure
```
✅ Confirms that the **bug fix is in `feature_branch`**, but `main` doesn’t have it yet.  

---

### **🔹 Conflict Occurs While Cherry-Picking**
```
Cherry-picking the bug fix commit into main...
Auto-merging app.py
CONFLICT (content): Merge conflict in app.py
error: could not apply b8d1cf1... Fixed database connection issue
```
✅ A **merge conflict** occurred because both `main` and `feature_branch` modified `app.py`.  

---

### **🔹 Resolving the Conflict**
After opening `app.py`, we see:
```python
print('Hello World!')

<<<<<<< HEAD
print('Existing code in main branch')
=======
print('Fixed database connection issue')
>>>>>>> b8d1cf1 (Fixed database connection issue)
```
We **manually edit** the file to keep necessary changes:
```python
print('Hello World!')
print('Fixed database connection issue')
```
✅ The conflict is resolved, and we **continue cherry-picking**:
```
(base) sachinsabariram@Sachins-MacBook-Air cherry-pick-repo % git add .
(base) sachinsabariram@Sachins-MacBook-Air cherry-pick-repo % git cherry-pick --continue
[main acbb2de] Merged with Fixed database connection
```

---

### **🔹 Commit History After Cherry-Picking**
```
>>> Commit history after cherry-picking:
* acbb2de (HEAD -> main) Merged with Fixed database connection
| * b8d1cf1 (feature_branch) Fixed database connection issue
| * d77af83 Added new feature logic
|/  
* a81f20a Initial commit with basic app structure
```
✅ **Only the bug fix was applied to `main`**, and the feature work remains in `feature_branch`.  

---

## **📌 Additional Insights on Cherry-Picking**
### **🔹 Cherry-Picking Multiple Commits**
```bash
git cherry-pick A B C
```
Applies **commits A, B, and C** to the current branch.  

### **🔹 Cherry-Picking Without Committing**
```bash
git cherry-pick --no-commit <commit-hash>
```
Applies the changes **without committing**, allowing for manual modifications.  

### **🔹 Cherry-Picking a Range of Commits**
```bash
git cherry-pick A^..B
```
Applies **all commits** from `A` to `B`.  

### **🔹 Cherry-Picking and Squashing**
To **combine multiple commits into one**, use:
```bash
git cherry-pick --no-commit A B
git commit -m "Merged feature changes"
```

---

## **📌 Git Worktree: An Alternative to Cherry-Picking**
Instead of cherry-picking, consider **Git Worktree**, which allows working on multiple branches simultaneously:
```bash
git worktree add ../new-feature-dir feature_branch
```
This creates a **separate directory** for `feature_branch`, avoiding the need for cherry-picking in some cases.  

---

## **🎯 Conclusion**
This task **demonstrates how to use Git cherry-pick** to **selectively apply a commit** while keeping a clean history.  
By following this process, developers can:  
✅ **Apply bug fixes or hotfixes without merging entire branches.**  
✅ **Resolve conflicts efficiently.**  
✅ **Keep feature development separate from production.**  

---