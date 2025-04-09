-- Task 7: Window Functions and Ranking
-- Author : Sachin Sabariram
-- Date: 9th Apr, 2025

-- ------------------------------ CREATING DATABASE ----------------------------
create DATABASE IF NOT EXISTS task7_db;
USE task7_db;

-- -------------------------- Creating the Employees table ------------------------

-- Create Employees table
CREATE TABLE IF NOT EXISTS Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    StartDate DATE,
    ExitDate DATE,
    Title VARCHAR(100),
    Supervisor VARCHAR(100),
    Email VARCHAR(100),
    BusinessUnit VARCHAR(100),
    EmployeeStatus VARCHAR(50),
    EmployeeType VARCHAR(50),
    PayZone VARCHAR(50),
    EmployeeClassificationType VARCHAR(50),
    TerminationType VARCHAR(50),
    TerminationDescription TEXT,
    DepartmentType VARCHAR(100),
    DivisionDescription VARCHAR(100),
    DOB DATE,
    State VARCHAR(50),
    JobFunction VARCHAR(100),
    Gender CHAR(10),
    Location VARCHAR(50),
    RaceEthnicity VARCHAR(100),
    MaritalStatus VARCHAR(50),
    PerformanceScore VARCHAR(50),
    CurrentEmployeeRating VARCHAR(50)
);

-- ---------------------------- Poupulating Data -------------------------------------

-- To Work on the real world cases, an actual Employees table 
-- is loaded from the 'csv' using python script as using native MYSQL approach
-- for loading data involves changing file access

-- ------------------------------- Queries ----------------------------

-- Checking whether data is loaded properly
select * from Employees LIMIT 2;

-- Top Rank 1 Employees by Rating Within Each Business Unit
SELECT *
FROM (
    SELECT 
        EmployeeID,
        FirstName,
        LastName,
        BusinessUnit,
        CurrentEmployeeRating,
        RANK() OVER (PARTITION BY BusinessUnit ORDER BY CurrentEmployeeRating DESC) AS RatingRank
    FROM Employees
) AS RankedEmployees
WHERE RatingRank = 1
ORDER BY BusinessUnit, RatingRank, FirstName;

-- Assign Row Numbers Based on Start Date Within Departments
SELECT * 
FROM (
    SELECT 
        EmployeeID,
        FirstName,
        LastName,
        DepartmentType,
        StartDate,
        ROW_NUMBER() OVER (PARTITION BY DepartmentType ORDER BY StartDate ASC) as SeniorityRank
    FROM Employees
) AS SeniorEmployees
WHERE SeniorityRank < 5
ORDER BY DepartmentType, SeniorityRank, FirstName;

-- Find the Previous Employee in Each Department by Start Date
SELECT
    EmployeeID,
    FirstName,
    LastName,
    DepartmentType,
    StartDate,
    LAG(FirstName) OVER (PARTITION BY DepartmentType ORDER BY StartDate ASC) AS PreviousEmployee
FROM Employees
LIMIT 5;

-- Compare Performance Score of Current vs. Next Employee in the Same Title Based on Start Date
SELECT
    EmployeeID,
    FirstName,
    LastName,
    Title,
    PerformanceScore,
    LEAD(PerformanceScore) OVER (PARTITION BY Title ORDER BY StartDate) AS NextPerfScore
FROM Employees
LIMIT 5;

-- Dense Rank Employees Based on DOB in Each Department
SELECT * 
FROM (
    SELECT
        EmployeeID,
        FirstName,
        LastName,
        State,
        DepartmentType,
        DOB,
        TIMESTAMPDIFF(YEAR, DOB, NOW()) as Age,
        DENSE_RANK() OVER (PARTITION BY DepartmentType ORDER BY DOB) as SeniorityByAge
    FROM Employees
) AS SeniorEmployees
WHERE SeniorityByAge <= 2
ORDER BY DepartmentType, SeniorityByAge, FirstName;

-- Track Employee Start vs Exit Date Difference and Rank by Tenure
SELECT *
FROM (
    SELECT 
        EmployeeID,
        FirstName,
        StartDate,
        ExitDate,
        DATEDIFF(IFNULL(ExitDate, CURDATE()), StartDate) AS TenureDays,
        DENSE_RANK() OVER (ORDER BY DATEDIFF(IFNULL(ExitDate, CURDATE()), StartDate) DESC) AS TenureRank
    FROM Employees
) as Tenure
WHERE TenureRank <= 3
ORDER BY TenureRank, FirstName;

-- Get First Hired Employee Per Department
WITH DepartmentHire AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY DepartmentType ORDER BY StartDate ASC) AS RN
    FROM Employees
)
SELECT 
    FirstName,
    LastName,
    DepartmentType,
    StartDate
FROM DepartmentHire 
WHERE RN = 1;

