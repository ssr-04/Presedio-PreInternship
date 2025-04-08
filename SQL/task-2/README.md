
# Task 2: Basic Filtering and Sorting

## 🎯 Objective

- Write SQL queries that filter records using conditions and sort the result set based on specific fields.

## ✅ Requirements

- Use the `WHERE` clause to filter records based on a condition (e.g., `WHERE Department = 'Sales'`).
- Apply the `ORDER BY` clause to sort the results (e.g., by `LastName` or `Salary`).
- Experiment with multiple conditions using `AND`/`OR`.

## 📁 Files

- `query.sql` – SQL script to create the `Employees` table, insert data, and perform filtering & sorting queries.
- `output.txt` – Captured output from executing the script in a MySQL terminal.

## 🛠️ Setup and Execution

1. Open your MySQL terminal or preferred database client.
2. Run the script using:
   ```sql
   SOURCE path_to_your_file/query.sql;
   ```
3. The script will:
   - Create a new database `task2_db`
   - Create an `Employees` table
   - Insert multiple sample records
   - Execute several `SELECT` queries with `WHERE`, `AND`, `OR`, and `ORDER BY`

## 🧪 Sample Output

```
+------------+-----------+----------+--------------+----------+
| EmployeeID | FirstName | LastName | Department   | Salary   |
+------------+-----------+----------+--------------+----------+
|          1 | Shaun     | Murphy   | NeuroSurgery | 65000.00 |
|          4 | Clarie    | Brown    | NeuroSurgery | 62000.00 |
+------------+-----------+----------+--------------+----------+

+------------+-----------+----------+--------------+----------+
| EmployeeID | FirstName | LastName | Department   | Salary   |
+------------+-----------+----------+--------------+----------+
|          3 | Aaron     | Glassman | Management   | 88000.00 |
|          1 | Shaun     | Murphy   | NeuroSurgery | 65000.00 |
|          4 | Clarie    | Brown    | NeuroSurgery | 62000.00 |
|          6 | Morgan    | Reznick  | Surgery      | 62000.00 |
+------------+-----------+----------+--------------+----------+
```

> The full output of all filtering and sorting conditions is available in `output.txt`.

---