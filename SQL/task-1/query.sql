-- Task 1: Creating and Populating a Simple Table in MYSQL
-- Author: Sachin Sabariram
-- Date: 8th Apr, 2025

-- Drop database if it exists (to prevent issues on re-run)
DROP DATABASE IF EXISTS task1_db;

-- Create a new database for Task 1
CREATE DATABASE task1_db;

-- Switch to newly created database
USE task1_db;

-- Create the Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    Department VARCHAR(30) NOT NULL,
    Salary DECIMAL(10, 2)
);

-- Insert Multiple Employee Records (Good Doctor easter egg)
INSERT INTO Employees (FirstName, LastName, Department, Salary) 
VALUES
    ('Shaun', 'Murphy', 'NeuroSurgery', 65000.00),
    ('Lea', 'Dillalo', 'IT', 52000.50),
    ('Aaron', 'Glassman', 'Management', 88000.00),
    ('Clarie', 'Brown', 'NeuroSurgery', 62000.00),
    ('Alex', 'Park', 'Pathology', 59000.00);

-- Retrieve all Data from Employees Table
SELECT * FROM Employees;
