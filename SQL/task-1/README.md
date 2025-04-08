
# Task-1: Creating and Populating Tables

## 🧠 Objective

Set up a simple table, insert data, and retrieve that data using basic SQL queries.

## 📌 Requirements

- Use `CREATE TABLE` to define a table (`Employees`) with appropriate data types and constraints.
- Populate the table using `INSERT INTO` with multiple rows of sample data.
- Execute a basic `SELECT * FROM Employees;` query to verify the data insertion.

## 🗃️ Description

This task involves the creation of a MySQL database named `task1_db`, which contains a single table called `Employees`. The table includes fields for employee ID, first name, last name, department, and salary. The data is populated with five sample employee records.

## 🛠️ Setup Instructions

1. Ensure MySQL is installed and running on your system.
2. Open a terminal and run the SQL script:
   ```bash
   mysql -u root -p < query.sql > output.txt
   ```
   - This command will execute the script and save the output to `output.txt`.

3. Alternatively, run interactively:
   ```bash
   mysql -u root -p
   mysql> source path/to/query.sql;
   ```

## 📂 Files

- `query.sql`: Contains SQL commands to create the database, table, insert data, and run a query.
- `output.txt`: Captures the MySQL output after executing the script.
- `task.txt`: Contains the task description and requirements.

## ✅ Sample Output

```
+------------+-----------+----------+--------------+----------+
| EmployeeID | FirstName | LastName | Department   | Salary   |
+------------+-----------+----------+--------------+----------+
|          1 | Shaun     | Murphy   | NeuroSurgery | 65000.00 |
|          2 | Lea       | Dillalo  | IT           | 52000.50 |
|          3 | Aaron     | Glassman | Management   | 88000.00 |
|          4 | Clarie    | Brown    | NeuroSurgery | 62000.00 |
|          5 | Alex      | Park     | Pathology    | 59000.00 |
+------------+-----------+----------+--------------+----------+
```

## 📎 Notes

- The script includes a `DROP DATABASE IF EXISTS` statement for safe re-runs.
- The `EmployeeID` field is auto-incremented and serves as the primary key.
- The `Salary` field uses the `DECIMAL` data type for precision in financial data.

---
