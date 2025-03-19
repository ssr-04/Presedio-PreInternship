# **Task 3: Undoing Changes and Reverting Commits**

## **📌 Objective**
This task explores different ways to **undo changes** in Git, including modifications in the working directory and committed changes.

---

## **🔹 Experimenting with Undoing Changes**
### **1️⃣ Undoing Uncommitted Changes (`git restore`)**
- If a file has been modified but **not committed**, you can undo the changes using:
  - `git restore <file>` (modern approach)
  - `git checkout -- <file>` (older approach)
- This discards modifications and **restores the last committed version**.

🔹 **Script Reference:** [`restore.sh`](./restore.sh)  
🔹 **Expected Output:** [`restore_output.txt`](./restore_output.txt)  

---

### **2️⃣ Undoing Commits (`git reset`)**
- If a commit was made but needs to be undone, `git reset` can be used:
  - **`--soft`** → Removes commit but **keeps changes staged**.
  - **`--mixed` (default)** → Removes commit and **unstages changes**.
  - **`--hard`** → Removes commit and **deletes changes permanently**.
  
🔹 **Script Reference:** [`reset.sh`](./reset.sh)  
🔹 **Expected Output:** [`reset_output.txt`](./reset_output.txt)  

---

### **3️⃣ Reverting Commits Without Rewriting History (`git revert`)**
- If a commit has already been pushed and must be undone **without modifying history**, use:
  - `git revert HEAD` → Creates a **new commit that undoes the last commit**.
  - `git revert <commit-hash>` → Reverts a specific commit.

🔹 **Script Reference:** [`revert.sh`](./revert.sh)  
🔹 **Expected Output:** [`revert_output.txt`](./revert_output.txt)  

---

## **🔹 Difference Between `git restore`, `git reset`, and `git revert`**
| Command | Effect | History Modified? | Use Case |
|---------|--------|------------------|----------|
| `git restore <file>` | Undoes uncommitted changes | ❌ No | Undo local changes in the working directory |
| `git reset --soft` | Moves HEAD, keeps changes staged | ✅ Yes | Undo commit but keep changes |
| `git reset --hard` | Moves HEAD, deletes changes | ✅ Yes | Completely remove commit & changes |
| `git revert HEAD` | Creates a commit that undoes the last commit | ❌ No | Safely undo a commit after pushing |

---

## **🎯 Conclusion**
This task demonstrated different ways to **undo changes** in Git.  
- Use **`git restore`** for **working directory changes**.  
- Use **`git reset`** for **rewriting local commit history**.  
- Use **`git revert`** for **safe commit reversal without history changes**.  
