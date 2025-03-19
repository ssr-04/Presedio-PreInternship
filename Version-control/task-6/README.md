
# **Task 6: Stashing Changes for Context Switching**

## **📌 Objective**
This task demonstrates how to use **Git stash** to temporarily save uncommitted work, allowing smooth context switching between branches.  

We will explore:
- How `git stash` helps save changes without committing.  
- How to **stash, switch branches, and reapply changes** using `git stash pop`.  
- How to **view and manage multiple stashes** (`git stash list`, `git stash drop`).  

---

## **📌 Understanding Git Stash**
### **🔹 What is `git stash`?**
`git stash` allows you to **temporarily save changes** that are not yet committed. This helps when you need to:  
✅ **Switch branches** without committing work in progress.  
✅ **Fix urgent issues** on another branch.  
✅ **Keep a clean working directory** without losing progress.  

### **🔹 Key Stash Commands**
| **Command** | **Purpose** |
|------------|------------|
| `git stash` | Stashes all **tracked** changes |
| `git stash -u` | Stashes **untracked** files too |
| `git stash -a` | Stashes **ignored** files as well |
| `git stash list` | Shows all stored stashes |
| `git stash show -p stash@{n}` | Displays the changes inside a stash |
| `git stash pop` | Applies and removes the latest stash |
| `git stash apply` | Applies a stash but keeps it |
| `git stash drop stash@{n}` | Deletes a specific stash |
| `git stash clear` | Removes all stashes permanently |
| `git stash push -m "message"` | Saves stash with a **custom label** |
| `git stash push -- file.txt` | Stashes **specific files** |

🔹 **Stashes are global**, meaning they can be applied to any branch.  
🔹 **Staged changes remain staged after popping a stash**, while unstaged changes need `git add` again.  

---

## **📌 Implementation - Solution Overview**
The task is implemented using a **Bash script** [`solution.sh`](./solution.sh) that automates the entire process.

### **🔹 Steps in the Implementation**
### **1️⃣ Creating the Repository and Initial Commits**
- A new Git repository (`stash-repo`) is initialized.  
- Two commits are made on `main`:  
  - `readme.txt` is created and committed.  
  - `somefile.txt` is added and committed.  

### **2️⃣ Switching to `feature_branch` and Making Changes**
- A new branch `feature_branch` is created.  
- Changes are made and **staged** (`feature1.txt`, `readme.txt`).  
- Another untracked file (`feature2.txt`) is added.  

### **3️⃣ Stashing Changes**
- `git stash -u -m "changes in feature_branch"` is used to save both tracked and untracked changes.  
- `git stash list` confirms that the stash has been saved.  

### **4️⃣ Switching to `main` and Making Fixes**
- The branch is switched back to `main`.  
- A fix is made to `somefile.txt`, committed as `"some fixes"`.  
- The commit history is displayed.  

### **5️⃣ Applying the Stashed Changes**
- The branch is switched back to `feature_branch`.  
- `git stash list` confirms that the stash still exists.  
- `git stash show -p` displays the stashed changes before applying them.  
- `git stash pop` is used to apply and remove the stash.  

### **6️⃣ Finalizing the Changes**
- The status is checked, and all changes are committed as `"added some features"`.  
- The final Git log is displayed.  

---

## **📌 Script Automation - [`solution.sh`](./solution.sh)**
The script automates the entire process with **clear outputs** at every step.

📜 **Script Reference:** [`solution.sh`](./solution.sh)  
📜 **Execution Output:** [`output.txt`](./output.txt)  

---

## **📌 Execution Output and Analysis**
Below are the key outputs generated when running `./solution.sh`.

### **🔹 Stashing and Switching Branches**
```
>>> Git status before stashing:
On branch feature_branch
Changes to be committed:
  new file:   feature1.txt
  modified:   readme.txt
Untracked files:
  feature2.txt
```
✅ Confirms that `feature1.txt` and `readme.txt` are **staged**, while `feature2.txt` is **untracked**.  

```
Stashing the changes
Saved working directory and index state On feature_branch: changes in feature_branch
```
✅ The stash has been created.  

```
>>> Stashed changes:
stash@{0}: On feature_branch: changes in feature_branch
```
✅ The stash is successfully saved and listed.  

---

### **🔹 Switching to `main` and Committing a Fix**
```
Switching to main and fixing something:
Switched to branch 'main'
[main d3c6312] some fixes
 1 file changed, 1 insertion(+)
```
✅ A fix is committed in `main`.  

---

### **🔹 Checking and Applying the Stash**
```
>>> Stash list before applying stash:
stash@{0}: On feature_branch: changes in feature_branch
```
✅ The stash still exists before applying.  

```
>>> Stash contents:
diff --git a/feature1.txt b/feature1.txt
new file mode 100644
index 0000000..71cfb53
--- /dev/null
+++ b/feature1.txt
@@ -0,0 +1 @@
+working on a feature1
```
✅ This confirms the exact changes that were stashed.  

```
Applying stashes:
On branch feature_branch
Changes to be committed:
  new file:   feature1.txt
Changes not staged for commit:
  modified:   readme.txt
Untracked files:
  feature2.txt
```
✅ The stashed changes have been **restored correctly**, with `feature1.txt` still staged, and `feature2.txt` still untracked.  

---

### **🔹 Final Commit and Log**
```
>>> Final Git log:
* 708115c (HEAD -> feature_branch) added some features
| * d3c6312 (main) some fixes
|/  
* c6f3141 added some file
* e60022d initial commit
```
✅ The `feature_branch` now contains the applied stash and new commit `"added some features"`.  

---

## **📌 Advanced Stash Concepts**
### **🔹 Stashing Specific Files**
Instead of stashing everything, you can stash only selected files:
```bash
git stash push -m "Stashing only readme.txt" -- readme.txt
```

### **🔹 Creating a Branch from a Stash**
If a stash contains work that should be a new feature branch:
```bash
git stash branch new-feature stash@{0}
```
This restores the stash into `new-feature` and removes it.  

### **🔹 Git Worktree - An Alternative to Stash**
Instead of stashing and switching branches, **Git worktree** allows working on multiple branches simultaneously:
```bash
git worktree add ../new-branch-dir feature_branch
```
This creates a separate directory for `feature_branch`, avoiding the need to stash at all.  

---

## **🎯 Conclusion**
This task **demonstrates how to use Git stash** for smooth context switching.  
By **saving, applying, and managing stashes effectively**, developers can:  
✅ **Switch branches without committing unfinished work.**  
✅ **Keep a clean history while handling urgent fixes.**  
✅ **Organize and restore stashed changes efficiently.**  
