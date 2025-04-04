
# Task 4 - Student Management Console Application (LINQ)

## 📌 Objective
Create a console-based student management system using C# that demonstrates object-oriented programming and LINQ for filtering and sorting collections.

---

## ✅ Task Requirements

- Define a `Student` class with the following properties:
  - `Name` (string)
  - `Grade` (double)
  - `Age` (int)
- Populate a `List<Student>` with sample data.
- Use **LINQ** to:
  - Filter students who have a grade above a specified threshold.
  - Sort the filtered students by grade (descending) and then by name.
- Display the results in a formatted way in the console.

---

## 🧠 Key Concepts Demonstrated

- Object-Oriented Programming in C#
- Class constructors and property initialization
- LINQ for data querying (`Where`, `OrderByDescending`, `ThenBy`)
- List manipulation and iteration
- String interpolation and tabular output formatting

---

## 📂 File Structure

```
task-4/
├── task.txt          # Task description
├── code/             # Contains the C# program files
│   └── Program.cs
├── output.txt        # Contains sample execution output
└── README.md         # This file
```

---

## ▶️ Sample Output

```
📚 Students with Grade > 70 (sorted by Grade):

Name: Anita      Grade: 92.3     Age: 21
Name: Dev        Grade: 88.5     Age: 20
Name: Ram        Grade: 88.5     Age: 20
Name: Karan      Grade: 76       Age: 19
Name: Sneha      Grade: 73.5     Age: 21
```

---

## ✨ Usage

1. Navigate to the `code` directory.
2. Run the program:
   ```bash
   dotnet run
   ```

---