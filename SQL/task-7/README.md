
# Task 7: SQL Window Functions and Ranking


## 📌 Objective

To explore and demonstrate the use of **SQL Window Functions** such as `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`, `LAG()`, and `LEAD()` on a realistic employee dataset. The task aims to uncover insights related to employee rankings, tenure, performance, and seniority within departments and business units.

---

## 🛠️ Setup Instructions

1. **Database Creation:**
   - A MySQL database named `task7_db` is created.
   - A table `Employees` is defined with appropriate fields.

2. **Data Ingestion:**
   - Employee data is loaded into the `Employees` table from a CSV file (`employee_data.csv`) using a Python script (`script.py`).
   - This approach bypasses native `LOAD DATA` restrictions and ensures cross-platform compatibility.

3. **Run SQL Script:**
   - SQL queries are stored in `query.sql`.
   - Run using:
     ```bash
     mysql> source /path/to/query.sql
     ```

---

## 🗃️ Table Structure - `Employees`

Includes fields like:
- Personal Details: `EmployeeID`, `FirstName`, `LastName`, `DOB`, `Gender`, `RaceEthnicity`, `MaritalStatus`
- Work Details: `StartDate`, `ExitDate`, `Title`, `BusinessUnit`, `DepartmentType`, `DivisionDescription`
- Performance & Classification: `PerformanceScore`, `CurrentEmployeeRating`, `EmployeeStatus`, `EmployeeType`, etc.

---

## 🔍 SQL Queries & Insights

1. **Top-Rated Employees Per Business Unit**
   - Uses `RANK()` to identify employees with the highest rating within each business unit.

2. **Department-Wise Seniority**
   - `ROW_NUMBER()` helps assign rank based on `StartDate` within each `DepartmentType`.

3. **Previous Employee in a Department**
   - `LAG()` retrieves the immediate predecessor (by start date) within the same department.

4. **Performance Comparison**
   - `LEAD()` compares the current employee's `PerformanceScore` with the next one within the same `Title`.

5. **Oldest Employees Per Department**
   - `DENSE_RANK()` based on `DOB` identifies the top 2 oldest employees in each department.

6. **Top Tenured Employees**
   - Computes tenure using `DATEDIFF()` and ranks using `DENSE_RANK()` to get the longest-serving employees.

7. **First Hired Employee in Each Department**
   - Uses `ROW_NUMBER()` to fetch the first employee to join each department based on `StartDate`.

---

## 📂 Project Structure

```
task-7/
│
├── employee_data.csv      # CSV data file (not included in repo)
├── Task.txt               # Task description
├── script.py              # Python script to load CSV into MySQL
├── query.sql              # SQL queries using window functions
├── output.txt             # Result of executing SQL queries
└── README.md              # Documentation
```

---

## 🧠 Key Concepts Learned

- Difference between `RANK()`, `DENSE_RANK()` and `ROW_NUMBER()`.
- How to compare rows within partitions using `LAG()` and `LEAD()`.
- Applying date functions like `DATEDIFF()`, `TIMESTAMPDIFF()`.

---