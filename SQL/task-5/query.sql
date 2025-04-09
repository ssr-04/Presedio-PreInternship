-- Task 5: Subqueries and Nested Queries
-- Author : Sachin Sabariram
-- Date: 9th Apr, 2025

-- ---------------------- CREATING DATABASE -----------------------

-- Drop the database if it already exists
DROP DATABASE IF EXISTS task5_db;

-- Create a new database for Task 3
CREATE DATABASE task5_db;

-- Switch to the newly created database
USE task5_db;

-- ------------------------- CREATING TABLES ------------------------

-- Create Wizards Table – Wizard Details
CREATE TABLE Wizards (
    WizardID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(30) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    House VARCHAR(20),
    WandCore VARCHAR(30),
    BloodStatus VARCHAR(20)
);

-- Create Orders Table – Items Ordered by Wizards
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    WizardID INT NOT NULL,
    Item VARCHAR(50),
    Quantity INT,
    OrderDate DATE,
    FOREIGN KEY (WizardID) REFERENCES Wizards(WizardID) ON DELETE CASCADE
);

-- ------------------------- POPULATING TABLES ----------------------

-- Insert Wizards (Nostalgia thanks to LLM)
INSERT INTO Wizards (FirstName, LastName, House, WandCore, BloodStatus)
VALUES
('Harry', 'Potter', 'Gryffindor', 'Phoenix Feather', 'Half-blood'),
('Hermione', 'Granger', 'Gryffindor', 'Dragon Heartstring', 'Muggle-born'),
('Ron', 'Weasley', 'Gryffindor', 'Unicorn Hair', 'Pure-blood'),
('Draco', 'Malfoy', 'Slytherin', 'Dragon Heartstring', 'Pure-blood'),
('Luna', 'Lovegood', 'Ravenclaw', 'Thestral Tail Hair', 'Pure-blood'),
('Neville', 'Longbottom', 'Gryffindor', 'Unicorn Hair', 'Pure-blood'),
('Severus', 'Snape', 'Slytherin', 'Unknown', 'Half-blood'),
('Cedric', 'Diggory', 'Hufflepuff', 'Unicorn Hair', 'Pure-blood'),
('Tom', 'Riddle', 'Slytherin', 'Phoenix Feather', 'Half-blood');

-- Insert Orders
INSERT INTO Orders (WizardID, Item, Quantity, OrderDate)
VALUES
(1, 'Invisibility Cloak', 1, '2025-03-01'),
(1, 'Marauder\'s Map', 1, '2025-03-02'),
(2, 'Time Turner', 2, '2025-03-04'),
(3, 'Chocolate Frogs', 5, '2025-03-05'),
(4, 'Dark Mark Amulet', 1, '2025-03-06'),
(5, 'Spectrespecs', 3, '2025-03-07'),
(6, 'Herbology Kit', 2, '2025-03-08'),
(7, 'Potions Manual', 1, '2025-03-09'),
(9, 'Diary of Tom Riddle', 1, '2025-03-10'),
(3, 'Extendable Ears', 10, '2025-03-11'),
(2, 'Bertie Bott\'s Every Flavor Beans', 7, '2025-03-12');

-- ---------------------------- Queries -------------------------------

-- Wizards who have placed more orders than the average number of orders per wizard

SELECT w.FirstName, W.LastName
FROM Wizards w
WHERE (
    SELECT COUNT(*)
    FROM Orders o
    WHERE w.WizardID = o.WizardID
) > (
    SELECT AVG(OrderCount)
    FROM (
        SELECT COUNT(*) as OrderCount
        FROM Orders
        GROUP BY WizardID
    ) AS WizardOrderCounts
);

-- Wizards and the total quantity of items they ordered (including 0 if none)
SELECT w.WizardID, w.FirstName, w.LastName,
        (
            SELECT COALESCE(SUM(o.Quantity), 0)
            FROM Orders o
            WHERE o.WizardID = w.WizardID
        ) AS TotalItemsOrdered
FROM Wizards w
ORDER BY TotalItemsOrdered, w.WizardID;

--  Find wizards who ordered more than 5 items in a single order.
SELECT 
    w.WizardID, w.FirstName, w.LastName
FROM Wizards w
WHERE EXISTS (
    SELECT 1
    FROM Orders o
    Where o.WizardID = w.WizardID and o.Quantity > 5
) ORDER BY w.WizardID;

-- Wizards who placed any orders for "Invisibility Cloak" or "Dark Mark Amulet"
SELECT FirstName, LastName, House, BloodStatus
FROM Wizards
Where WizardID in 
( 
    SELECT WizardID
    FROM Orders
    WHERE Item = "Invisibility Cloak" OR Item = "Dark Mark Amulet"
);

-- House with the highest total quantity of items ordered.
SELECT w.House, SUM(o.Quantity) as TotalQuantity
FROM Wizards w
INNER JOIN Orders o on w.WizardID = o.WizardID
GROUP BY w.House
HAVING SUM(o.Quantity) = (
    SELECT MAX(TotalQuantity) 
    FROM (
        SELECT SUM(o.Quantity) as TotalQuantity
        FROM Wizards w
        INNER JOIN Orders o on w.WizardID = o.WizardID
        GROUP BY w.House
    ) as HouseOrders
);