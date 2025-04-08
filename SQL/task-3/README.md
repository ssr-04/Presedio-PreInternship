
# Task 3: Simple Aggregation and Grouping

## 🧠 Objective

The goal of this task is to gain hands-on experience with SQL aggregate functions, grouping, and filtering aggregated data using `GROUP BY` and `HAVING` clauses.

---

## 🛠️ Description

In this task, we created a database named `task3_db` and a table `Employees` to store sample data representing a real-world hospital/enterprise-like organizational structure. Each employee record includes:

- `EmployeeID` – Unique ID (auto-incremented)
- `FirstName`, `LastName` – Personal details
- `Department` – Represents the functional team or division
- `Salary` – Monetary compensation

### 🔢 Aggregate Queries Implemented:

1. **Count of Employees per Department**  
   Uses `COUNT()` with `GROUP BY` to determine how many employees exist in each department.

2. **Average Salary per Department**  
   Uses `AVG()` to analyze how compensation varies across departments.

3. **Total Salary per Department**  
   Uses `SUM()` to calculate the budget per department based on employee salaries.

4. **Departments with More Than 2 Employees**  
   Demonstrates usage of `HAVING` to filter grouped data post-aggregation.

5. **Departments with Average Salary Above 60,000**  
   Combines `AVG()` with `HAVING` for business insights.

6. **Departments Ordered by Average Salary (Descending)**  
   Shows ranking of departments by pay scale.

7. **Comprehensive Department-wise Stats**  
   Uses `COUNT()`, `AVG()`, `SUM()`, `MIN()`, and `MAX()` in a single query to give a full statistical overview of each department.

---

## 💻 How to Run

1. Open your MySQL CLI or any client like MySQL Workbench.
2. Run the following command to execute the script:
   ```sql
   source path/to/query.sql;
   ```

3. The `output.txt` contains the sample output after running the script.

---

## 📂 Files

- `query.sql` – SQL script for schema creation, sample data insertion, and queries.
- `output.txt` – CLI output demonstrating the result of the SQL queries.

---

## 📈 Key Concepts Practiced

- Aggregate Functions: `COUNT()`, `SUM()`, `AVG()`, `MIN()`, `MAX()`
- `GROUP BY` for data summarization
- `HAVING` clause for filtering grouped results
- Query ordering using `ORDER BY`

---

## ✅ Outcome

Successfully demonstrated how aggregate functions can be used to derive insights from grouped data in a structured and real-world inspired dataset.

---