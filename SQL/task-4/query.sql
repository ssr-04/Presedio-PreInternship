-- Task 4: Multi-Table JOINS
-- Author : Sachin Sabariram
-- Date: 8th Apr, 2025

-- ---------------------- CREATING DATABASE -----------------------

-- Drop the database if it already exists
DROP DATABASE IF EXISTS task4_db;

-- Create a new database for Task 3
CREATE DATABASE task4_db;

-- Switch to the newly created database
USE task4_db;

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
-- INNER JOIN: Get all orders with wizard details
SELECT
    o.OrderID,
    w.FirstName,
    w.LastName,
    w.House,
    o.Item,
    o.Quantity,
    o.OrderDate
FROM Orders o
INNER JOIN Wizards w ON o.WizardID = w.WizardID;

-- LEFT JOIN: List all wizards and their orders (if any)
SELECT
    w.WizardID,
    w.FirstName,
    w.LastName,
    o.Item,
    o.Quantity,
    o.OrderDate
From Wizards w
LEFT JOIN ORDERS o on w.WizardID = o.WizardID
ORDER BY WizardID;

-- LEFT JOIN: Identify wizards who haven't placed any orders
SELECT 
    w.WizardID,
    w.FirstName,
    w.LastName,
    w.House
FROM Wizards w
LEFT JOIN Orders o ON w.WizardID = o.WizardID
WHERE o.OrderID IS NULL;

-- INNER JOIN with aggregation: Total items ordered by each wizard
SELECT
    w.FirstName,
    w.LastName,
    COUNT(o.OrderID) as OrdersPlaced,
    SUM(o.Quantity) as TotalItemsOrdered
FROM Wizards w
INNER JOIN Orders o on w.WizardID = o.WizardID
GROUP BY w.WizardID
ORDER BY TotalItemsOrdered DESC, w.FirstName ASC;

-- JOIN + filter: Orders from Gryffindor students only
SELECT
    w.FirstName,
    w.LastName,
    SUM(o.Quantity) as TotalItemsOrdered
FROM Wizards w
INNER JOIN Orders o ON w.WizardID = o.WizardID
WHERE w.House = 'Gryffindor'
GROUP BY w.WizardID
ORDER BY w.FirstName;

-- Orders from each house
SELECT
    w.House,
    COUNT(o.OrderID) as NoOfOrders,
    SUM(o.Quantity) as TotalItemsOrdered
FROM Wizards w
INNER JOIN Orders o on w.WizardID = o.WizardID
GROUP BY w.House
ORDER BY TotalItemsOrdered DESC, w.House ASC;

-- Orders by Blood Type?
SELECT
    w.BloodStatus,
    SUM(o.Quantity) as TotalItemsOrdered
FROM Wizards w
INNER JOIN Orders o ON w.WizardID = o.WizardID
GROUP BY  w.BloodStatus
ORDER By TotalItemsOrdered DESC;
