### **📌 Task 8: Using Git Hooks for Automated Checks**  

## **📌 Understanding Git Hooks**  

### **🔹 What Are Git Hooks?**  
Git hooks are **scripts that execute automatically** at specific points in the Git workflow. They help automate checks, enforce standards, and improve collaboration in software projects. Hooks can be used for:  
✅ **Enforcing code style and linting** (e.g., `pre-commit` to run linters).  
✅ **Running tests before committing or pushing** (e.g., `pre-commit` and `pre-push`).  
✅ **Enforcing commit message formats** (e.g., `commit-msg`).  
✅ **Deploying code after a push** (e.g., `post-receive`).  

---

### **🔹 Types of Git Hooks**
Git supports two categories of hooks:  
1️⃣ **Client-side hooks** (run on the developer's machine).  
2️⃣ **Server-side hooks** (run on the remote repository).  

| **Hook Name**  | **Type** | **Trigger Point** | **Common Use Case** |
|---------------|---------|------------------|----------------------|
| `pre-commit`  | Client  | Before `git commit` | Run linters, formatters, and tests |
| `prepare-commit-msg` | Client | Before commit message editor opens | Auto-generate commit messages |
| `commit-msg`  | Client  | After commit message is written | Enforce commit message rules |
| `pre-push`    | Client  | Before `git push` | Run tests to prevent pushing broken code |
| `post-commit` | Client  | After commit is finalized | Send notifications or log commits |
| `post-merge`  | Client  | After merging a branch | Install dependencies or run migrations |
| `pre-receive` | Server  | Before accepting a push | Enforce branch protection policies |
| `post-receive` | Server | After a push is received | Trigger CI/CD pipelines |

✅ **For this task, we focused on the `pre-commit` hook** to ensure that only properly formatted and tested code is committed.  

---

## **📌 How Git Hooks Improve Code Quality in Collaborative Projects**  
### **🔹 Why Use Git Hooks?**  
In a **team environment**, developers may have different coding habits. Git hooks help **enforce coding standards automatically** before code is committed or pushed.  

✅ **Prevents bad code from entering the repository** → No broken tests or style violations.  
✅ **Ensures a consistent code style across the team** → Avoids unnecessary formatting changes.  
✅ **Automates repetitive checks** → No need to remind developers to run `flake8` or `pytest`.  
✅ **Reduces the number of rejected PRs** → Code is already validated before submission.  

---

## **📌 Implementation Overview**  
### **🔹 What We Did in This Task**  
1️⃣ **Created a Python `pre-commit` hook** to run:  
   - `flake8` (for linting).  
   - `pytest` (for unit testing).  
2️⃣ **Blocked commits if there were linting errors or failing tests.**  
3️⃣ **Verified that a commit only succeeds if both checks pass.**  

---

## **📌 Key Demonstrations and Code Walkthrough**  

### **❌ Blocking a Commit Due to Linting Errors**  
When committing the following `test_main.py` (without two blank lines before function):  
```python
from main import add
def test_addition():
    assert add(2, 3) == 5
```
The pre-commit hook **blocked the commit** due to a `flake8` linting error:  
```
Running pre-commit checks...
Checking Python files: main.py, test_main.py
Running flake8...
test_main.py:2:1: E302 expected 2 blank lines, found 0
Linting failed! Fix the issues and try again.
```
✅ **This prevented code that does not follow PEP 8 from being committed.**  

---

### **✅ Fixing the Linting Error and Committing Successfully**  
We fixed the issue by adding **two blank lines** before `def test_addition()`:  
```python
from main import add


def test_addition():
    assert add(2, 3) == 5
```
After staging the changes (`git add test_main.py`) and retrying the commit:  
```
Running pre-commit checks...
Checking Python files: main.py, test_main.py
Running flake8...
No linting issues detected!
Running pytest...
==================================== 1 passed in 0.01s ====================================
All tests passed!
Pre-commit checks passed! Proceeding with commit.
[main a1b9486] Initial commit
```
✅ **Commit was successful!** The code passed both linting and unit tests.  

---

## **📌 Drawback of the Current Implementation**  
### **🔹 Pre-commit Hook Runs Tests on the Working Directory, Not Just Staged Files**  
**Problem:**  
- The script runs `flake8` and `pytest` on **the entire working directory** instead of just the staged content.  
- If you **fix an issue in the working directory** but **forget to stage it**, the hook **still passes** (even though the staged version might still have errors).  

**Solution:**  
A more robust approach would be to check only the **staged version of files**.  
- This can be done using `git show :<file>` to extract the staged content and lint that version.  
- However, this makes the script **more complex**, so for this demo, we assume **users stage changes before committing**.  

---

## **📌 Conclusion**  
This task demonstrated how **Git hooks can enforce coding standards and prevent bad code from being committed**.  

✅ **Pre-commit hooks automate code quality checks (linting + testing).**  
✅ **Commits are blocked if the code does not pass validation.**  
✅ **Teams benefit from enforcing consistent coding practices.**  

While this demo **relies on users staging before committing**, a more advanced version could **lint and test only the staged content** using `git show`.  

---  