## **🔹 `git revert` vs `git reset` – Key Differences & Use Cases**
Both `git revert` and `git reset` are used to **undo commits**, but they behave **differently** and are suited for different use cases.

---

## **🔹 High-Level Comparison**
| Feature | `git reset` | `git revert` |
|---------|------------|-------------|
| **Undo commits?** | ✅ Yes | ✅ Yes |
| **Rewrites history?** | ✅ Yes (except `--soft`) | ❌ No (safe for shared branches) |
| **Removes commits?** | ✅ Yes | ❌ No (creates a new commit that undoes previous changes) |
| **Changes stay in working directory?** | ✅ (unless `--hard`) | ❌ No (undoes changes in a new commit) |
| **Safe for team collaboration?** | ❌ No (rewrites history) | ✅ Yes (creates a new commit instead of deleting history) |
| **Preferred for local changes?** | ✅ Yes | ❌ No |
| **Preferred for shared branches (e.g., `main`)?** | ❌ No | ✅ Yes |

---

## **1️⃣ `git reset` (Modifies History & Deletes Commits)**
### **How It Works:**
- Moves the HEAD pointer **back to a previous commit**.
- **Deletes** commits that came after the reset point.
- Can modify both the **staging area** and **working directory**.

### **Example Scenario**
Let’s assume our commit history looks like this:
```
A -- B -- C -- D (HEAD)
```
We want to remove commit `D`.

### **Example Commands & Effects**
#### **`git reset --soft HEAD~1`** (Undo Last Commit, Keep Changes Staged)
```sh
git reset --soft HEAD~1
```
✅ **Removes commit `D` but keeps changes staged**.  
⏩ History becomes: `A -- B -- C (HEAD)`, but changes from `D` remain.

---

#### **`git reset HEAD~1`** (Undo Last Commit, Unstage Changes)
```sh
git reset HEAD~1
```
✅ **Removes commit `D`, unstages changes, but keeps them in the working directory**.  
⏩ History becomes: `A -- B -- C (HEAD)`, and you need to manually `git add` again.

---

#### **`git reset --hard HEAD~1`** (Undo Commit and Remove Changes Permanently)
```sh
git reset --hard HEAD~1
```
✅ **Removes commit `D` and deletes all its changes permanently**.  
⏩ History becomes: `A -- B -- C (HEAD)`, and `D` is completely gone.

🚨 **⚠ Warning:** Use `--hard` only if you're **100% sure** you don’t need the changes anymore.

---

## **2️⃣ `git revert` (Creates a New Commit That Undoes Changes)**
### **How It Works:**
- **Does NOT delete commits** but **creates a new commit that reverses a previous commit**.
- **Preserves history** (important for team collaboration).
- **Safe for public/shared branches**.

### **Example Scenario**
Let’s say our history is:
```
A -- B -- C -- D (HEAD)
```
We want to **undo `D`**, but keep history **intact**.

### **Example Command**
```sh
git revert HEAD
```
✅ This **creates a new commit** that undoes changes from `D`.  
⏩ New commit history:
```
A -- B -- C -- D -- D' (HEAD)
```
(`D'` is a new commit that negates the effects of `D`.)

---

## **🔹 Key Differences Between `git reset` and `git revert`**
| Feature | `git reset` | `git revert` |
|---------|------------|-------------|
| **What happens to commits?** | Removes commits | Adds a new commit to undo changes |
| **What happens to changes?** | Can keep or delete them (`--soft`, `--mixed`, `--hard`) | Undoes them in a new commit |
| **Does it rewrite history?** | Yes (dangerous for shared branches) | No (safe for teams) |
| **Can it be used after pushing?** | 🚨 No (unless forced) | ✅ Yes (safe for shared branches) |
| **Use case?** | Undo local changes before pushing | Undo a commit in a shared repo |

---

## **🚀 When to Use Which?**
### **Use `git reset` When:**
✅ You **haven’t pushed** your changes yet and want to undo a commit.  
✅ You need to **move back in history** and possibly modify commits before pushing.  
✅ You want to **uncommit but keep changes** (`--soft` or `--mixed`).  
🚨 **⚠ Avoid `git reset --hard` on shared branches** (destroys commits permanently).  

### **Use `git revert` When:**
✅ You **have already pushed** your commit and need to undo changes safely.  
✅ You want to **keep history intact** while removing unwanted changes.  
✅ You're working in a **shared repository** and need to avoid rewriting history.  

---

## **🔹 Final Summary**
| Action | `git reset` | `git revert` |
|--------|------------|-------------|
| **Rewrites commit history?** | ✅ Yes | ❌ No |
| **Removes commits?** | ✅ Yes | ❌ No (adds an undo commit) |
| **Deletes files permanently?** | ✅ Yes (with `--hard`) | ❌ No |
| **Good for local changes?** | ✅ Yes | ❌ No |
| **Safe for public/shared branches?** | ❌ No | ✅ Yes |
| **Can be used after pushing?** | 🚨 No (unless forced) | ✅ Yes |

---

### **🚀 Best Practice**
- Use **`git reset --soft HEAD~1`** if you **only need to redo the last commit**.
- Use **`git reset --hard HEAD~1`** **only if you're sure you want to lose changes**.
- Use **`git revert HEAD`** **if you’ve already pushed and need to undo a commit safely**.
