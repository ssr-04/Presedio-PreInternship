
# Task 8: Common Table Expressions (CTEs) and Recursive Queries

## 📌 Objective

This task demonstrates the usage of **Common Table Expressions (CTEs)** including **recursive CTEs** in SQL to solve real-world data queries on an `Employees` dataset. The focus is on:

- Improving query readability with CTEs
- Analyzing department-level salary data
- Ranking employees within groups
- Traversing hierarchical manager-employee relationships

---

## 🗃️ Dataset

A realistic `Employees` dataset (similar to Oracle's HR schema) is used. The data includes fields like:

- `EmployeeID`, `FirstName`, `LastName`
- `PhoneNumber`, `HireDate`, `JobID`, `Salary`, `CommissionPct`
- `ManagerID`, `DepartmentID`

📁 Data loaded from: `./employee_data.csv`  
📜 Loading performed using a Python script (`script.py`)

---

## 🧱 Database Setup

```sql
CREATE DATABASE IF NOT EXISTS task8_db;
USE task8_db;

CREATE TABLE IF NOT EXISTS Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    PhoneNumber VARCHAR(20),
    HireDate DATE,
    JobID VARCHAR(20),
    Salary DECIMAL(10,2),
    CommissionPct DECIMAL(5,2),
    ManagerID INT,
    DepartmentID INT
);
```

---

## 🧠 Key Queries & Logic

### 1. ✅ Data Check

```sql
SELECT * FROM Employees LIMIT 5;
```

Verifies whether data was loaded successfully.

---

### 2. 💰 Employees with Salary Above Department Average

Uses a non-recursive CTE to compare individual salaries against department averages.

---

### 3. 🆕 Recent Hires and Their Managers

Filters employees hired after 2008 and retrieves their managers’ names.

---

### 4. 🥇 Top 3 Earners per Department

Ranks employees by salary within departments using `RANK()` and `PARTITION BY`.

---

### 5. 💼 Departments with High Average Salaries

Lists employees in departments where average salary exceeds ₹6000.

---

### 6. 🧭 Organizational Hierarchy

A recursive CTE builds the manager-reporting tree, adding a `Lvl` column for depth.

```sql
WITH RECURSIVE EmployeeHierarchy AS (
    SELECT EmployeeID, FirstName, LastName, ManagerID, 1 as Lvl
    FROM Employees
    WHERE ManagerID IS NULL

    UNION ALL

    SELECT e.EmployeeID, e.FirstName, e.LastName, e.ManagerID, eh.Lvl + 1
    FROM Employees e
    INNER JOIN EmployeeHierarchy eh ON e.ManagerID = eh.EmployeeID
)
SELECT * FROM EmployeeHierarchy
ORDER BY Lvl, ManagerID;
```

---

## 🛠️ How to Run

1. **Import Dataset**  
   Run the provided Python script:
   ```bash
   python script.py
   ```
   This loads `employees.csv` into the MySQL database.

2. **Execute SQL Script**  
   Use the MySQL CLI:
   ```sql
   source path/to/query.sql;
   ```

---

## ✅ Output

Sample results from queries include:

- Employees like **Steven King** and **Lex De Haan** appearing in top earners.
- Recursive org chart with hierarchy levels.
- Salary comparisons by department.

---

## 📚 Concepts Used

- `WITH`, `WITH RECURSIVE`
- `JOIN`, `LEFT JOIN`
- `RANK() OVER (PARTITION BY ...)`
- `GROUP BY`, `AVG()`, `HAVING`
- Recursive tree traversal in SQL

---

## 📂 Files

```
task-8/
│
├── task.txt                # Task description
├── employees.csv           # Employee dataset
├── script.py               # Data loader using Python + MySQL connector
├── query.sql               # SQL queries using CTEs
├── output.txt              # Output of the query
└── README.md               # Task documentation
```

---