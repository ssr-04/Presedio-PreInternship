
---

# 📁 Task-5: File I/O and Exception Handling

### 🎯 Objective
Develop a console application that reads from and writes to files while demonstrating basic file I/O operations and exception handling.

---

### ✅ Task Requirements
- Read text from a file (e.g., a log file or a simple CSV).
- Process the data:
  - Count the number of lines
  - Count the number of words
  - Count the number of characters
- Write the result to a **new output file**.
- Implement exception handling to manage:
  - `FileNotFoundException`
  - `IOException`
  - Any other general exception

---

### 📂 Project Structure
```
task-5/
├── task.txt               # Task description
├── output.txt             # Console output from the program
├── code/
│   ├── Program.cs         # C# source code
│   ├── shakespeare_sonnet.txt # Input file used for analysis
│   └── output.txt         # File generated with analysis results
└── README.md              # Documentation for this task
```

---

### 📌 Description
The application reads the contents of a text file (`shakespeare_sonnet.txt`), processes it by counting:
- Total lines
- Total words
- Total characters

It also determines the **top 5 most frequently occurring words** (case-insensitive) and writes a neatly formatted report to `code/output.txt`.

Exception handling is used to gracefully handle any file-related errors or unexpected runtime issues.

---

### 🧪 Sample Console Output (`task-5/output.txt`)
```
📄 File Analysis Report
------------------------
Lines     : 14
Words     : 114
Characters: 620
Frequent words: [and -> 5 times] [Thou -> 4 times] [Shall -> 3 times] [to -> 3 times] [of -> 3 times] 

✅ Analysis written to: ./output.txt
```

---
