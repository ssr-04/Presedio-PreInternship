
# Simple OOP - Person Class (C# Console Application)

## 📌 Task Overview
This project demonstrates **Object-Oriented Programming (OOP) principles** by implementing a `Person` class in C#.  
It showcases **encapsulation, constructors, and method usage**.

---

## 📁 Project Structure
```
task-2/
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
   cd task-2/code
   ```
2. Run the following command to execute the program:
   ```sh
   dotnet run
   ```

---

## 📜 How It Works
1. A `Person` class is defined with:
   - Properties: `Name` (string), `Age` (int).
   - A **primary constructor** (C# 12) for initialization.
   - A method `Introduce()` that prints a personalized message.

2. The `Main()` method:
   - Creates multiple `Person` objects.
   - Calls `Introduce()` on each object.

---

## 🖥️ Example Output
```
Hello, my name is Ram, I am 25 years old.
Hello, my name is Som, I am 30 years old.
Hello, my name is Jack, I am 22 years old.
```
_(Full output available in [output.txt](output.txt))_

---

## 🔍 Code Explanation

### **Person Class (`Person`)**
- Uses a **primary constructor** to initialize `Name` and `Age`.
- Implements `Introduce()` to display a greeting message.

### **Main Method (`Main()`)**
- Creates `Person` objects using `new()`.
- Calls `Introduce()` on each object.

---