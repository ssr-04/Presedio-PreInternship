# **Task 4: Simulating and Resolving Merge Conflicts**

## **📌 Objective**
This task demonstrates how to **simulate a merge conflict in Git** and resolve it manually.  
We will explore:
- How merge conflicts occur.
- How to detect and inspect conflicts using `git status` and `git diff`.
- How to resolve merge conflicts manually.

---

## **📌 Steps to Simulate a Merge Conflict**
### **1️⃣ Creating the Repository**
- Initialize a new Git repository.
- Create a file (`file.txt`) and commit it to the `main` branch.

### **2️⃣ Creating Two Branches**
- Create a `feature-branch` (from main) and modify `file.txt`.
- Create a `bugfix-branch` (from main) and modify `file.txt` with a conflicting change.

### **3️⃣ Merging `bugfix-branch` into `feature-branch`**
- Attempt to merge `bugfix-branch` into `feature-branch`, which results in a **merge conflict**.

### **4️⃣ Identifying and Resolving the Conflict**
- Use `git status` and `git diff` to inspect the conflict.
- Manually edit `file.txt` to resolve the conflict.
- Stage and commit the resolved file.

---

## **📌 Script Automation**
The script [`solution.sh`](./solution.sh) automates the entire process:
- It initializes a repository.
- Creates two branches and modifies the same file in both.
- Simulates a merge conflict.
- Displays the conflict using `git status` and `git diff`.
- Resolves the conflict manually and commits the final version.

📜 **Script Reference:** [`solution.sh`](./solution.sh)  
📜 **Execution Output:** [`output.txt`](./output.txt)  

---



## **📌 Understanding Merge Conflicts**
| **Concept** | **Explanation** |
|-------------|---------------|
| **Why do merge conflicts happen?** | Git cannot automatically merge two conflicting changes on the same line. |
| **How to identify conflicts?** | Use `git status` and `git diff`. |
| **How to resolve conflicts?** | Manually edit the file, then use `git add` and `git commit`. |
| **How to avoid conflicts?** | Keep branches updated using `git pull --rebase`. |

---

## **🎯 Conclusion**
This task **demonstrates a practical scenario** where merge conflicts happen and how to resolve them.  
By using **branching and merging strategies**, developers can **minimize conflicts** in real-world projects.
