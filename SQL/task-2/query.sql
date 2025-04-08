-- Task 2: Basic Filtering and Sorting
-- Author : Sachin Sabariram
-- Date: 8th Apr, 2025

-- ------------------------------------------------------------

-- Drop database if it already exists
DROP DATABASE IF EXISTS task2_db;

-- Create new database for Task 2
CREATE DATABASE task2_db;

-- Use the newly created database
USE task2_db;

-- ------------------------------------------------------------

-- Create the Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    Department VARCHAR(30) NOT NULL,
    Salary DECIMAL(10, 2)
);

-- Insert Multiple Employee Records
INSERT INTO Employees (FirstName, LastName, Department, Salary) 
VALUES
    ('Shaun', 'Murphy', 'NeuroSurgery', 65000.00),
    ('Lea', 'Dillalo', 'IT', 52000.50),
    ('Aaron', 'Glassman', 'Management', 88000.00),
    ('Clarie', 'Brown', 'NeuroSurgery', 62000.00),
    ('Alex', 'Park', 'Pathology', 59000.00),
    ('Morgan', 'Reznick', 'Surgery', 62000.00),
    ('Jordan', 'Allen', 'Emergency', 56000.00),
    ('Asher', 'Wolke', 'Psychiatry', 52000.00);

-- ------------------------------------------------------------

-- Basic filering using 'WHERE' --

-- Select all employees in the 'NeuroSurgery' department
SELECT * FROM Employees WHERE Department = 'NeuroSurgery';

-- Select all employees with Salary > 60000
SELECT * FROM Employees WHERE Salary > 60000;

-- ------------------------------------------------------------

-- Extra filtering using 'Conditionals' --

-- Select employees in 'NeuroSurgery' OR 'Surgery' department
SELECT * FROM Employees 
WHERE Department = 'NeuroSurgery' OR Department = 'Surgery';

-- Select employees in 'Emergency' department AND Salary < 60000
SELECT * FROM Employees
WHERE Department = 'Emergency' AND Salary < 60000;

-- ------------------------------------------------------------

-- Sorting using 'ORDER BY' --

-- Display all employees sorted by Salary (descending)
SELECT * FROM Employees ORDER BY Salary DESC;

-- Display all employees sorted by Salary (descending) and if same Salary then sort by FirstName (ascending)
SELECT * FROM Employees ORDER BY Salary DESC, FirstName ASC;

-- ------------------------------------------------------------

-- -- Combined filtering and sorting --

SELECT * FROM Employees WHERE Department = 'NeuroSurgery' OR Department = 'Surgery' ORDER BY Salary DESC, FirstName  ASC;

-- ------------------------------------------------------------


