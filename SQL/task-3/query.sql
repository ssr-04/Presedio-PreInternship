-- Task 3: Simple Aggregation and Grouping
-- Author : Sachin Sabariram
-- Date: 8th Apr, 2025

-- ------------------------------------------------------------------

-- Drop the database if it already exists
DROP DATABASE IF EXISTS task3_db;

-- Create a new database for Task 3
CREATE DATABASE task3_db;

-- Switch to the newly created database
USE task3_db;

-- ------------------------------------------------------------------

-- Create the Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    Department VARCHAR(30) NOT NULL,
    Salary DECIMAL(10, 2)
);

-- Insert sample employee data with more real-world relevance
INSERT INTO Employees (FirstName, LastName, Department, Salary) 
VALUES
    ('Shaun', 'Murphy', 'NeuroSurgery', 75000.00),
    ('Clarie', 'Brown', 'NeuroSurgery', 72000.00),
    ('Olivia', 'Jackson', 'NeuroSurgery', 77000.00),
    
    ('Lea', 'Dillalo', 'IT', 58000.00),
    ('Ethan', 'Cole', 'IT', 62000.00),
    ('Rachel', 'Green', 'IT', 60000.00),

    ('Aaron', 'Glassman', 'Management', 95000.00),
    ('Marcus', 'Andrews', 'Management', 91000.00),

    ('Morgan', 'Reznick', 'Surgery', 68000.00),
    ('Alex', 'Park', 'Surgery', 69000.00),

    ('Jordan', 'Allen', 'Emergency', 59000.00),
    ('Asher', 'Wolke', 'Psychiatry', 54000.00),

    ('Tracy', 'Evans', 'Finance', 62000.00),
    ('Derek', 'Shepherd', 'HR', 65000.00);

-- ------------------------------------------------------------------

-- Count of employees per department
SELECT Department, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY Department;

-- Average salary per department
SELECT Department, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Department;

-- Total salary per department
SELECT Department, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY Department;

-- ------------------------------------------------------------------

-- Departments having more than 2 employees
SELECT Department, COUNT(*) as EmployeeCount
FROM Employees
GROUP BY Department
HAVING COUNT(*)>2;

-- Departments with average salary above 60000
SELECT Department, AVG(Salary) as AvgSalary
FROM Employees
GROUP BY Department
HAVING AVG(Salary) > 60000;

-- Departements Average Salary in Decending Order
SELECT Department, AVG(Salary) as AvgSalary
FROM Employees
GROUP BY Department
ORDER BY AvgSalary DESC;

-- Multiple aggregates per department
SELECT
    Department,
    COUNT(*) AS EmployeeCount,
    AVG(Salary) AS AvgSalary,
    SUM(Salary) AS TotalSalary,
    MIN(Salary) AS MinSalary,
    MAX(Salary) AS MaxSalary
FROM Employees
GROUP BY Department
ORDER BY EmployeeCount DESC, AvgSalary DESC;

-- ------------------------------------------------------------------