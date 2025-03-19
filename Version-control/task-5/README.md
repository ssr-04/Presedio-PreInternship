
# **Task 5: Interactive Rebasing for a Clean Commit History**

## **📌 Objective**
This task demonstrates how to **tidy up commit history using interactive rebase** in Git.  
We will explore:  
- How to **reorder, squash, and reword commits** using `git rebase -i`.  
- How to **rebase a feature branch** onto an updated `main` branch.  
- How these techniques **help maintain a clean, meaningful commit history** before merging.  

---

## **📌 Steps to Perform Interactive Rebase**
### **1️⃣ Initial Setup - Creating the Repository**
- **Initialize a new Git repository** and create the first commit:
  ```bash
  git init rebase-demo
  cd rebase-demo
  echo "Project started" > README.md
  git add .
  git commit -m "initial commit"
  ```
- **Add base application code** and commit:
  ```bash
  echo "Base app code" > app.py
  git add .
  git commit -m "base code"
  ```

### **2️⃣ Creating `feature_branch` from `base_code`**
- Create and switch to `feature_branch`:
  ```bash
  git switch -c feature_branch
  ```
- Implement the feature and commit:
  ```bash
  echo "Feature v1 implementation" > feature.py
  git add .
  git commit -m "created feature"
  ```
- Fix typos and commit:
  ```bash
  echo "fixed typos in feature" >> feature.py
  git add .
  git commit -m "fixed typos"
  ```

At this point, **commit history is:**
```bash
git log --oneline --graph --decorate --all
```
```
* ac6ce19 (HEAD -> feature_branch) fixed typos
* cd10438 created feature
* 94a4079 (main) base code
* 4db5a3d initial commit
```

---

### **3️⃣ Updating `main` with Fixes**
- Switch back to `main` and improve the base code:
  ```bash
  git switch main
  echo "Fixed some issues in base code" >> app.py
  git add .
  git commit -m "fixed base"
  ```

Now, **commit history is:**
```
* 2a2c474 (HEAD -> main) fixed base
| * ac6ce19 (feature_branch) fixed typos
| * cd10438 created feature
|/  
* 94a4079 base code
* 4db5a3d initial commit
```

---

### **4️⃣ Rewording `fixed_base` to `improved_base`**
- Before rebasing the feature branch, we rename the commit message in `main`:
  ```bash
  git rebase -i HEAD~1
  ```
  - Change `"fixed_base"` to **"improved base"**.

New **commit history:**
```
* 48fadaa (HEAD -> main) improved base
| * ac6ce19 (feature_branch) fixed typos
| * cd10438 created feature
|/  
* 94a4079 base code
* 4db5a3d initial commit
```

---

### **5️⃣ Rebasing `feature_branch` onto `main`**
- Now, we update `feature_branch` so that it **branches from the improved base**:
  ```bash
  git switch feature_branch
  git rebase main
  ```
- **Rebasing is successful** with no conflicts.

Updated **commit history:**
```
* f285b85 (HEAD -> feature_branch) fixed typos
* 45d0f51 created feature
* 48fadaa (main) improved base
* 94a4079 base code
* 4db5a3d initial commit
```

---

### **6️⃣ Squashing `created_feature` and `fixed_typos`**
- Instead of two separate commits for the feature, we **squash them together**:
  ```bash
  git rebase -i HEAD~2
  ```
  Modify the interactive rebase editor:
  ```
  pick 45d0f51 created feature
  squash f285b85 fixed typos
  ```
  - This **combines both commits** into one.
  - The commit message is rewritten as:
    ```
    Implemented feature with typo fixes
    ```

New **commit history:**
```
* 255a460 (HEAD -> feature_branch) Implemented feature with typo fixes
* 48fadaa (main) improved base
* 94a4079 base code
* 4db5a3d initial commit
```

---

### **7️⃣ Final Merge into `main`**
- Now that the `feature_branch` is clean, we **merge it into `main`**:
  ```bash
  git switch main
  git merge feature_branch
  ```

Final **commit history:**
```
* 255a460 (HEAD -> main, feature_branch) Implemented feature with typo fixes
* 48fadaa improved base
* 94a4079 base code
* 4db5a3d initial commit
```

---

## **📌 Execution Output**
Since interactive rebasing involves manual intervention, a script (`solution.sh`) **cannot** automate the process.  
Instead, the **terminal output** has been captured in [`output.txt`](./output.txt).  

📜 **Execution Output:** [`output.txt`](./output.txt)  

---

## **📌 Understanding Interactive Rebase**
| **Concept** | **Explanation** |
|-------------|---------------|
| **What is `git rebase -i`?** | It allows us to modify commit history interactively. |
| **Why rebase instead of merge?** | It keeps a **linear, clean history** without unnecessary merge commits. |
| **What does `squash` do?** | Combines multiple commits into a single meaningful commit. |
| **What does `reword` do?** | Edits the commit message for clarity. |
| **Why rebase `feature_branch` onto `main`?** | Ensures it **starts from the latest `main` changes**, preventing conflicts later. |

---

## **🎯 Conclusion**
This task **demonstrates how to use interactive rebase** to improve commit history.  
By **squashing unnecessary commits**, **rewording commit messages**, and **rebasing onto an updated base**, we ensure:  
✅ A **clean and structured commit history**.  
✅ **Easier collaboration and debugging**.  
✅ **More meaningful commits before merging into `main`**.  

---