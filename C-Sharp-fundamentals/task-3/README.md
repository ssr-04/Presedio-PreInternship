
# List Manager - C# Console Application

## 📌 Task Overview
This project implements a **simple list manager** using C# and `List<string>`.  
Users can **add**, **remove**, and **display** items dynamically while ensuring proper input handling.  

---

## 📁 Project Structure
```
task-3/
│── task.txt          # Task description
│── code/             # Contains C# source code and .NET project files
│   ├── Program.cs    # Main program file
│   ├── code.csproj   # Project configuration file
│   └── ... (other .NET files)
│── output.txt        # Sample program output
│── README.md         # Project documentation (this file)
```

---

## 🚀 Getting Started

### **📥 Setup & Execution**
1. Open a terminal and navigate to the project folder:
   ```sh
   cd task-3/code
   ```
2. Run the following command to execute the program:
   ```sh
   dotnet run
   ```

---

## 📜 How It Works
1. **List Management**
   - Uses `List<string>` to store items.
   - Items are automatically **trimmed** (`Trim()`) and **capitalized** (`ToUpper()`).

2. **User Operations**
   - **Add an item**  
   - **Remove an item** (By name)
   - **Display all items**
   - **Exit the program**

---

## 🖥️ Example Output
```
Options
1. Add Item
2. Remove Item
3. Display Items
4. Exit
Choose an option: 3
The list is empty.

Choose an option: 1
Enter Item to add: sugar
Added: SUGAR

Choose an option: 1
Enter Item to add: tea
Added: TEA

Choose an option: 3
1. SUGAR
2. TEA

Choose an option: 2
Enter item name to remove: tea
Removed: TEA

Choose an option: 3
1. SUGAR

Choose an option: 4
Exiting program...
```
_(Full output available in [output.txt](output.txt))_

---

## 🔍 Code Explanation

### **Key Features:**
✔ **List Manipulation** - Uses `List<string>` to store and modify items.  
✔ **String Processing** - `Trim()` removes spaces, `ToUpper()` formats output.  
✔ **Looping & Control Flow** - `while`, `switch-case` for menu handling.  

---