### **🔹 Understanding `git reset` and Its Options**
`git reset` is used to **undo commits** and modify the staging area or working directory. The three types of `git reset` behave differently:

1. **`git reset --soft`** → **Undo commit, keep changes staged**
2. **`git reset` (or `git reset --mixed`, default)** → **Undo commit, unstage changes**
3. **`git reset --hard`** → **Undo commit, delete changes permanently**

---

## **📌 Example Scenario**
Let's assume we have a Git repository with this commit history:

```
A -- B -- C (HEAD)  # C is the latest commit
```

- `A`, `B`, and `C` are commits.
- `C` is the latest commit (HEAD points to `C`).
- We want to reset `C`.

---

## **1️⃣ `git reset --soft HEAD~1` (Undo Commit, Keep Changes Staged)**
```sh
git reset --soft HEAD~1
```
### **What Happens?**
- Moves HEAD back to `B` (removes commit `C`).
- The **changes from `C` remain staged**.

### **State After Reset:**
```
A -- B (HEAD)  # Commit C is undone, but changes are staged
```
✅ You can now **edit** the changes and recommit.

### **When to Use?**
- When you want to **redo the last commit** without retyping `git add .`
- If you **accidentally committed too early** but want to keep changes staged.

---

## **2️⃣ `git reset HEAD~1` (Undo Commit, Unstage Changes)**
```sh
git reset HEAD~1
```
(Equivalent to `git reset --mixed HEAD~1`)

### **What Happens?**
- Moves HEAD back to `B` (removes commit `C`).
- The **changes from `C` remain in the working directory but are unstaged**.

### **State After Reset:**
```
A -- B (HEAD)  # Commit C is undone, changes are unstaged
```
✅ You can **manually add files again (`git add .`) before recommitting.**

### **When to Use?**
- When you want to **undo a commit but keep your changes in the working directory**.
- Useful if you **committed but forgot to include some files**.

---

## **3️⃣ `git reset --hard HEAD~1` (Undo Commit, Delete Changes Permanently)**
```sh
git reset --hard HEAD~1
```
### **What Happens?**
- Moves HEAD back to `B` (removes commit `C`).
- **Deletes all changes in `C` permanently** from the working directory.

### **State After Reset:**
```
A -- B (HEAD)  # Commit C and its changes are completely gone
```
🚨 **Warning:** Changes from `C` are **lost forever** unless they were pushed.

### **When to Use?**
- When you **want to completely discard the last commit and its changes**.
- Only use if **you don’t need the undone changes**.

---

## **🔹 Summary: Differences Between `git reset` Options**
| Command | Commit Reset? | Changes Staged? | Changes in Working Directory? | Use Case |
|---------|--------------|-----------------|------------------------------|----------|
| `git reset --soft HEAD~1` | ✅ Yes | ✅ Yes | ✅ Yes | Keep changes staged but remove commit |
| `git reset HEAD~1` (default) | ✅ Yes | ❌ No | ✅ Yes | Unstage changes but keep in the working directory |
| `git reset --hard HEAD~1` | ✅ Yes | ❌ No | ❌ No (deleted) | Completely remove commit & changes |

---

## **💡 Example Workflow**
```sh
echo "First line" > file.txt
git add .
git commit -m "Commit A"

echo "Second line" >> file.txt
git add .
git commit -m "Commit B"

echo "Third line" >> file.txt
git add .
git commit -m "Commit C"
```
Now, we have:
```
A -- B -- C (HEAD)
```
### **Undo Commit C but Keep Changes**
```sh
git reset --soft HEAD~1
```
- HEAD moves back to `B`
- `C`'s changes are **still staged**

### **Undo Commit C and Unstage Changes**
```sh
git reset HEAD~1
```
- HEAD moves back to `B`
- `C`'s changes are **still in the working directory but unstaged**

### **Undo Commit C and Remove Changes**
```sh
git reset --hard HEAD~1
```
- HEAD moves back to `B`
- `C`'s changes **are deleted forever**

---

### **🔹 When to Use Each `git reset`?**
| Scenario | Best Reset Command |
|----------|-------------------|
| Want to redo commit? | `git reset --soft HEAD~1` |
| Committed too early but need more changes? | `git reset HEAD~1` |
| Want to completely delete commit & changes? | `git reset --hard HEAD~1` |

---

### **🚀 Best Practice: If You Already Pushed the Commit**
If the commit was already pushed to a remote repo, **use `git revert` instead**:
```sh
git revert HEAD
```
✅ This creates a **new commit** that undoes the previous commit **without rewriting history**.

