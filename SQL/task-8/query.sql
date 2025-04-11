-- Task 8: Common Table Expressions (CTEs) and Recursive Queries
-- Author : Sachin Sabariram
-- Date: 10th Apr, 2025

-- ------------------------------ CREATING DATABASE ----------------------------
CREATE DATABASE IF NOT EXISTS task8_db;
USE task8_db;

-- -------------------------- Creating the Employees table ------------------------

CREATE TABLE IF NOT EXISTS Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    PhoneNumber VARCHAR(20),
    HireDate DATE,
    JobID VARCHAR(20),
    Salary DECIMAL(10, 2),
    CommissionPct DECIMAL(5, 2),
    ManagerID INT,
    DepartmentID INT
);

-- ---------------------------- Poupulating Data -------------------------------------

-- To Work on the real world cases, an actual Employees table 
-- is loaded from the 'csv' using python script as using native MYSQL approach
-- for loading data involves changing file access

-- ------------------------------- Queries ----------------------------

-- Checking whether data is loaded properly
select * from Employees LIMIT 5;

-- Find average salary by department and list employees with salary above their department average
WITH DepartmentAvgSalary as (
    SELECT 
        DepartmentID,
        AVG(Salary) AS AvgSalary 
    FROM Employees
    GROUP BY DepartmentID
)

SELECT
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    e.Salary,
    e.DepartmentID,
    d.AvgSalary
FROM Employees e 
JOIN DepartmentAvgSalary d 
ON e.DepartmentID = d.DepartmentID
WHERE e.Salary > d.AvgSalary
ORDER BY DepartmentID, EmployeeID, FirstName;

-- Employees hired recently and their manager names (Max-2008 as per dataset)
WITH RecentHires AS (
    SELECT * FROM 
    Employees
    WHERE HireDate > '2008-01-01'
)

SELECT 
    r.EmployeeID,
    r.FirstName,
    r.LastName,
    CONCAT(m.FirstName, ' ', m.LastName) as ManagerName
FROM RecentHires r 
LEFT JOIN Employees m 
ON r.ManagerID = m.EmployeeID;

-- Top 3 highest earning employees in each department
WITH RankedSalaries AS (
    SELECT *,
        RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS RankInDept
    FROM Employees 
)

SELECT 
    EmployeeID,
    FirstName,
    LastName,
    DepartmentID,
    Salary,
    RankInDept
FROM RankedSalaries
WHERE RankInDept <= 3
ORDER BY Salary DESC;

-- Find departments where the Average salary exceeds 40,000 and list employees in those departments
WITH DepartmentAvgSalary as (
    SELECT 
        DepartmentID,
        AVG(Salary) AS AvgSalary 
    FROM Employees
    GROUP BY DepartmentID
),
 HighPayDepartment AS (
    SELECT 
        DepartmentID,
        AvgSalary
    FROM DepartmentAvgSalary
    WHERE AvgSalary > 6000
)

SELECT 
    e.FirstName,
    e.LastName,
    e.Salary,
    h.AvgSalary as DeptAverage
FROM Employees e
JOIN HighPayDepartment h
ON e.DepartmentID = h.DepartmentID
ORDER BY h.AvgSalary, e.Salary;

-- Build an org chart by traversing the MANAGER_ID chain.
WITH RECURSIVE EmployeeHierarchy AS (
    SELECT 
        EmployeeID,
        FirstName,
        LastName,
        ManagerID,
        1 as Lvl
    FROM Employees
    WHERE ManagerID is NULL

    UNION ALL

    SELECT
        e.EmployeeID,
        e.FirstName,
        e.LastName,
        e.ManagerID,
        eh.Lvl + 1
    FROM Employees e 
    INNER JOIN EmployeeHierarchy eh 
    ON e.ManagerID = eh.EmployeeID
)

SELECT * FROM EmployeeHierarchy
ORDER BY Lvl, ManagerID;


