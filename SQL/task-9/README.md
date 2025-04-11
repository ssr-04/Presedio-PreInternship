
# Task 9: Stored Procedures and User-Defined Functions

## 📌 Objective

To encapsulate business logic using **stored procedures** and **user-defined functions** in MySQL. This task demonstrates how to:

- Accept input parameters and return dynamic result sets using stored procedures.
- Perform scalar computations using user-defined functions.
- Apply and test these constructs on a real-world dataset.

---

## 🗂️ Dataset Used

A real-world sales dataset with the following key columns:

- `Region`, `Country`, `ItemType`, `SalesChannel`, `OrderPriority`
- `OrderDate`, `OrderID`, `ShipDate`
- `UnitsSold`, `UnitPrice`, `UnitCost`
- `TotalRevenue`, `TotalCost`, `TotalProfit`

The data was loaded into a table called `Sales`.

---

## 🛠️ Setup Instructions

1. **Create and use the database:**

```sql
CREATE DATABASE IF NOT EXISTS task9_db;
USE task9_db;
```

2. **Create the `Sales` table:**

```sql
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
```

3. **Load data** from the provided CSV using the python script.

---

## 🧩 Stored Procedure: `GetSalesSummaryByRegion`

### Purpose:
Returns total sales and profits grouped by region for a given date range.

### Syntax:
```sql
CALL GetSalesSummaryByRegion('start_date', 'end_date');
```

### Definition:
```sql
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
```

### Sample Call:
```sql
CALL GetSalesSummaryByRegion('2015-01-01', '2016-01-01');
```

---

## 🧮 Scalar Function: `CalculateDiscount`

### Purpose:
Calculates discount percentage based on number of units sold.

### Logic:
- `< 1000 units` → 5% discount  
- `1000 - 5000 units` → 10% discount  
- `> 5000 units` → 15% discount  

### Definition:
```sql
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
```

### Sample Usage:
```sql
SELECT 
    OrderID, 
    UnitsSold,
    CalculateDiscount(UnitsSold) AS DiscountRate
FROM Sales
LIMIT 5;
```

---

## ✅ Testing & Output

Both the stored procedure and function were successfully tested using the sample data and returned expected results. The function was embedded in a `SELECT` query, and the procedure was called with a custom date range.

---