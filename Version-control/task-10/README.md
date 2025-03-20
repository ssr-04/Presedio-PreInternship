# **Task 10: Comprehensive Git Workflow with Forced Push & Recovery**  

## **📌 Objective**  
This task simulates an **advanced Git workflow** involving:  
✅ **Multiple branches** representing features, bug fixes, and releases.  
✅ **Forced pushes (`git push --force-with-lease`)** after rewriting history.  
✅ **Recovering lost commits** using `git reflog`.  
✅ **Best practices** for handling force pushes safely.  

By the end of this guide, you will understand:  
- When and why **forced pushes** are necessary.  
- How to **recover lost commits** using `git reflog`.  
- How to **collaborate safely** when rewriting Git history.  

---

## **📌 Scenario Overview**  

We will **simulate a real-world project workflow**:  
1. **Create a new repository** (`Test-repo`) and initialize branches for `feature`, `bug-fixes`, and `release`.  
2. **Develop features** in the `feature` branch and commit changes.  
3. **Fix bugs** in the `bug-fixes` branch separately.  
4. **Cherry-pick a bug fix** from `bug-fixes` into `feature`.  
5. **Rebase the `feature` branch** interactively and attempt to push (causing a force push).  
6. **Simulate an accidental commit loss** by resetting `bug-fixes`.  
7. **Recover lost commits** using `git reflog` and merge them back into `feature`.  
8. **Finalize the release** by merging `feature → release → main`.  

---

## **📌 Understanding Key Git Concepts**  

### **🔹 What is `git push --force`?**  
A **forced push** (`git push --force`) overwrites the remote branch history, **discarding any changes on the remote** that were not included in the force push.  

**When to use it?**  
✅ After **rewriting history** (e.g., interactive rebase).  
✅ To **fix incorrect commits** in remote branches.  

**Best practice:** Use **`git push --force-with-lease`**, which **prevents overwriting remote changes** if they have been updated since your last pull.  

### **🔹 What is `git reflog`?**  
`git reflog` **tracks all changes** made to branch heads, even after resets or force pushes. It helps in:  
✅ **Recovering lost commits** after an accidental `git reset --hard`.  
✅ **Undoing mistakes** in rebase or force push.  

Usage:  
```bash
git reflog
git branch recovered-branch <commit-hash>
```

---

## **📌 Implementation - Step by Step**  

### **1️⃣ Cloning the Repository & Initializing Branches**  
```bash
git clone https://github.com/ssr-04/Test-repo.git
cd Test-repo
echo "Initial code in app.py" > app.py
git add .
git commit -m "Initial commit on main"
git branch feature
git branch bug-fixes
git branch release
```
📌 **Created branches**: `feature`, `bug-fixes`, `release`.  

---

### **2️⃣ Adding Features in the Feature Branch**  
```bash
git switch feature
echo "Feature part 1" >> app.py
git commit -am "Feature commit 1: Added part 1"
echo "Feature part 2" >> app.py
git commit -am "Feature commit 2: Added part 2"
```
📌 **Developed features** and committed them sequentially.  

---

### **3️⃣ Applying Bug Fixes in a Separate Branch**  
```bash
git switch bug-fixes
echo "Major bug fix 1" >> app.py
git commit -am "Major bug fixed"
echo "Minor bug fix 1" >> app.py
git commit -am "Minor bug fixed"
```
📌 **Bug fixes are made independently** in `bug-fixes`.  

---

### **4️⃣ Cherry-Picking a Bug Fix into Feature Branch**  
```bash
git switch feature
git cherry-pick b0d6e9a  # Applying 'Major bug fix'
```
⛔ **Conflict detected!**  
```
CONFLICT (content): Merge conflict in app.py
```
To resolve:  
```bash
git add app.py
git cherry-pick --continue
```
📌 **Merged a specific bug fix into `feature` branch.**  

---

### **5️⃣ Interactive Rebase & Force Push**  
```bash
git rebase -i HEAD~3  # Squash feature commits
```
🚨 **Attempting push causes rejection!**  
```bash
git push origin feature
```
```
! [rejected] feature -> feature (non-fast-forward)
```
To force update:  
```bash
git push --force-with-lease origin feature
```
📌 **Successfully pushed rewritten history.**  

---

### **6️⃣ Simulating Accidental Commit Loss in Bug-Fixes**  
```bash
git switch bug-fixes
git reset --hard HEAD~1  # Simulating data loss
```
🚨 **Bug fix commit lost!**  

### **7️⃣ Recovering Lost Commits Using `git reflog`**  
```bash
git switch feature
git reflog bug-fixes
git branch recovery-bug-branch 947664c  # Recover lost commit
```
📌 **Recovered lost commit & created a new branch.**  

---

### **8️⃣ Merging Recovered Fixes into Feature Branch**  
```bash
git merge recovery-bug-branch
```
🚨 **Merge conflict detected!**  
```
CONFLICT (content): Merge conflict in app.py
```
To resolve:  
```bash
git add app.py
git merge --continue
```
📌 **Recovered bug fixes merged into `feature`.**  

---

### **9️⃣ Merging Feature → Release → Main**  
```bash
git switch release
git merge feature
git switch main
git merge feature
git push
```
📌 **Final release changes merged into `main` and pushed.**  

---

## **📌 Final Git Log**
```bash
git log --oneline --graph --decorate --all
```
```
*   1e79373 (HEAD -> main, origin/main, origin/HEAD, release, feature) Merge with recovery minor bugfix
|\  
| * 947664c (bug-fixes) Minor bug fixed
| * b0d6e9a Major bug fixed
* | 31f3aa5 (origin/feature) Merge with Major bug fix
* | 9996f3c Combined features
|/  
* 617b2b4 Initial commit on main
```
✅ **All commits successfully merged into main.**  
✅ **Lost commits were recovered using `git reflog`.**  

---

## **📌 Best Practices for Force Pushes & Recovery**  

| **Concept** | **Best Practice** |
|------------|------------------|
| **Use `--force-with-lease` instead of `--force`** | Prevents accidental overwrites of remote updates. |
| **Avoid force pushing shared branches** | Use feature branches instead of rewriting `main`. |
| **Use `git reflog` for recovery** | Reflog is your **lifeline** to recover lost commits. |
| **Always fetch and rebase before force pushing** | Avoids accidental history rewrites. |

---

## **🎯 Conclusion**  
This task demonstrated a **complete Git workflow** including:  
✅ **Feature & bug-fix development** in separate branches.  
✅ **Interactive rebase & forced push** handling.  
✅ **Recovering lost commits using `git reflog`.**  
✅ **Safe collaboration practices with force pushes.**  

By following best practices, you can **rewrite history safely and recover mistakes efficiently.** 🚀  

---

## **📜 References**  
- [Git Official Documentation - Reflog](https://git-scm.com/docs/git-reflog)  
- [Git Official Documentation - Force Push](https://git-scm.com/docs/git-push#Documentation/git-push.txt---force-with-lease)  

---