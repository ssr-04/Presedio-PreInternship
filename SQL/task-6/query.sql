-- Task 5: Date and Time Functions
-- Author : Sachin Sabariram
-- Date: 9th Apr, 2025

-- ------------------------------ CREATING DATABASE ----------------------------

create DATABASE IF NOT EXISTS task6_db;
USE task6_db;

-- -------------------------- Creating the Orders table ------------------------

-- Create Orders table
CREATE TABLE IF NOT EXISTS Orders (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50),
    order_status VARCHAR(30),
    order_purchase_timestamp DATETIME,
    order_approved_at DATETIME,
    order_delivered_timestamp DATETIME,
    order_estimated_delivery_date DATETIME
);

-- ---------------------------- Poupulating Data -------------------------------------

-- To Work on the real world cases, an actual ecommerence orders table 
-- is loaded from the 'csv' using python script as using native MYSQL approach
-- for loading data involves changing file access

-- ------------------------------- Queries ----------------------------

-- To check the table is sucessfully populated by the script
SELECT * FROM Orders Limit 5;


-- Finding the First and Last Purchase dates to understand time period of dataset
SELECT 
    MIN(order_purchase_timestamp) as FirstPurchase, 
    MAX(order_purchase_timestamp) as LastPurchase,
    TIMESTAMPDIFF(YEAR, MAX(order_purchase_timestamp), NOW()) as OldByInYears
FROM Orders;


-- Distribution of Delivered/Cancelled
SELECT order_status, COUNT(*) as Count
FROM Orders
GROUP BY order_status;


-- Average Approval Time (in hours) for all orders
SELECT
    AVG(TIMESTAMPDIFF(HOUR, order_purchase_timestamp, order_approved_at)) AS AverageApprovalTimeInHours
FROM Orders;


-- Average delivery time (in days) for delivered orders
SELECT 
    MIN(TIMESTAMPDIFF(DAY, order_purchase_timestamp, order_delivered_timestamp)) AS FastestDeliveryInDays,
    MAX(TIMESTAMPDIFF(DAY, order_purchase_timestamp, order_delivered_timestamp)) AS SlowestDeliveryInDays,
    AVG(TIMESTAMPDIFF(DAY, order_purchase_timestamp, order_delivered_timestamp)) AS AverageDeliveryInDays
FROM Orders
WHERE order_status = "delivered";


-- Count of late deliveries (delivered after estimated date)
SELECT 
    COUNT(*) AS LateDeliveries
FROM Orders
WHERE order_delivered_timestamp > order_estimated_delivery_date;



-- Percentage of On-time deliveries
SELECT 
    ((SELECT
        COUNT(*) as OnTimeDeliveries
    FROM Orders
    WHERE order_delivered_timestamp <= order_estimated_delivery_date) * 100 / COUNT(*)) as OnTimeDeliveryPercentage
FROM Orders;

-- Amount of Orders Cancelled due to Late
SELECT 
    COUNT(*) AS CancelledDueToLate
FROM Orders
WHERE order_delivered_timestamp > order_estimated_delivery_date AND order_status = "canceled";

-- Monthly order count trend (Grouped by Month-Year)
SELECT
    DATE_FORMAT(order_purchase_timestamp, "%Y-%m") AS Month_Year,
    COUNT(*) as totalOrders
FROM Orders
GROUP BY Month_Year
ORDER BY Month_Year;

-- Finding Top-3 Performing Months
SELECT
    DATE_FORMAT(order_purchase_timestamp, "%Y-%m") AS Month_Year,
    COUNT(*) as totalOrders
FROM Orders
GROUP BY Month_Year
ORDER BY totalOrders DESC
LIMIT 3;

-- Month with Most Orders (if any seasonal trends)
SELECT
    DATE_FORMAT(order_purchase_timestamp, "%M") AS Month,
    COUNT(*) as totalOrders
FROM Orders
GROUP BY Month
ORDER BY totalOrders DESC;

--  Top 5 customers with the most orders in the first 6 months
SELECT
    customer_id,
    COUNT(*) as NoOfOrders
FROM Orders
WHERE order_purchase_timestamp <= (
    SELECT MIN(order_purchase_timestamp)
    FROM orders) 
    + INTERVAL 6 MONTH
GROUP BY customer_id
ORDER BY NoOfOrders DESC
LIMIT 5;

-- Orders made during weekend
SELECT 
    COUNT(*) as WeekendOrders,
    (COUNT(*) * 100 / 
    (SELECT COUNT(*) 
    FROM Orders)) AS Percent
FROM Orders
WHERE DAYOFWEEK(order_purchase_timestamp) IN (1, 7); -- 1: Sunday, 7: Saturday