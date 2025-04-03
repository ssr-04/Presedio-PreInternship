
# Factorial Calculator - C# Console Application

## 📌 Task Overview
This project is a **C# console application** that calculates the **factorial of a given number**.  
It takes a **non-negative integer** as input, validates it, computes the factorial using an iterative approach, and displays the result.

---

## 📁 Project Structure
```
task-1/
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

### **📥 Setup & Installation**
1. Open a terminal and navigate to the project folder:
   ```sh
   cd task-1/code
   ```
2. Run the following command to execute the program:
   ```sh
   dotnet run
   ```

---

## 📜 How It Works
1. The program prompts the user to **enter a positive integer**.
2. It **validates the input** (ensures it is a non-negative integer).
3. If valid, it calculates the **factorial** using a **loop-based approach**.
4. The **result is displayed** in the console.
5. If the input is invalid (negative number or non-numeric), an **error message is shown**.

---

## 🖥️ Example Output
```
Enter a positive number: two
Invalid input! Please enter a non-negative integer.

Enter a positive number: -5
Invalid input! Please enter a non-negative integer.

Enter a positive number: 0
Factorial of 0 is 1

Enter a positive number: 5
Factorial of 5 is 120

Enter a positive number: 20
Factorial of 20 is 2432902008176640000
```
_(Complete output is available in [output.txt](output.txt))_

---

## 🔍 Code Explanation

### **Main Method (`Main()`)**
- Reads user input.
- Uses `int.TryParse()` to **validate the input**.
- Calls `CalculateFactorial(int n)` to compute the factorial.

### **Factorial Calculation (`CalculateFactorial(int n)`)**
- Uses a `for` loop to compute `n!` efficiently.
- Returns `1` for `0!` (by definition).
- Uses **long** to handle large factorial values.

---