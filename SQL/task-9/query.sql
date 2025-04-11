-- Task 9: Stored Procedures and User-Defined Functions
-- Author : Sachin Sabariram
-- Date: 11th Apr, 2025

-- ------------------------------ CREATING DATABASE ----------------------------

CREATE DATABASE IF NOT EXISTS task9_db;
USE task9_db;

-- -------------------------- Creating the Sales table ------------------------

CREATE TABLE IF NOT EXISTS Sales (
    Region VARCHAR(50),
    Country VARCHAR(50),
    ItemType VARCHAR(30),
    SalesChannel VARCHAR(20),
    OrderPriority VARCHAR(10),
    OrderDate DATE,
    OrderID INT PRIMARY KEY,
    ShipDate DATE,
    UnitsSold INT,
    UnitPrice FLOAT,
    UnitCost FLOAT,
    TotalRevenue FLOAT,
    TotalCost FLOAT,
    TotalProfit FLOAT
);
-- ------------------------ Queries -------------------------------------


-- Testing the data population
SELECT * FROM Sales Limit 5;


-- Accept a date range and return total sales (or profits) grouped by region 

DELIMITER //

CREATE PROCEDURE GetSalesSummaryByRegion(
    IN start_date DATE,
    IN end_date DATE
)
BEGIN
    SELECT 
        Region,
        SUM(TotalRevenue) AS TotalSales,
        SUM(TotalProfit) AS TotalProfit
    FROM Sales
    WHERE OrderDate BETWEEN start_date AND end_date
    GROUP BY Region;
END //

DELIMITER ;


-- Scalar Function – Calculate Discount Based on Units Sold

DELIMITER //

CREATE FUNCTION CalculateDiscount(units INT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE discount FLOAT;
    IF units < 1000 THEN
        SET discount = 0.05;
    ELSEIF units <= 5000 THEN
        SET discount = 0.10;
    ELSE
        SET discount = 0.15;
    END IF;
    RETURN discount;
END //

DELIMITER ;


-- Testing the CalculateDiscount Function

SELECT 
    OrderID, 
    UnitsSold,
    CalculateDiscount(UnitsSold) AS DiscountRate
FROM Sales
LIMIT 5;

-- Testing the GetSalesSummaryByRegion Procedure

CALL GetSalesSummaryByRegion('2015-01-01', '2016-01-01');

