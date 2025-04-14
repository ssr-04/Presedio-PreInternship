-- #########################################################
-- DATABASE SETUP
-- #########################################################
DROP DATABASE IF EXISTS eCommerceDB;
CREATE DATABASE eCommerceDB;
USE eCommerceDB;

SET sql_mode = 'STRICT_ALL_TABLES';

-- #########################################################
-- SCHEMA DESIGN
-- #########################################################
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) CHECK (price >= 0),
    stock INT CHECK (stock >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled'),
    total_amount DECIMAL(10,2) CHECK (total_amount >= 0),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE OrderDetails (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT CHECK (quantity > 0),
    price_at_purchase DECIMAL(10,2) CHECK (price_at_purchase >= 0),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    UNIQUE (order_id, product_id)
);

CREATE TABLE AuditLog (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    table_name VARCHAR(50) NOT NULL,
    record_id INT NOT NULL,
    action VARCHAR(10) NOT NULL,
    old_data JSON,
    new_data JSON,
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- #########################################################
-- SAMPLE DATA INSERTION
-- #########################################################
INSERT INTO Products (name, description, price, stock)
VALUES
('Laptop', 'High-performance laptop', 999.99, 10),
('Phone', 'Latest smartphone', 699.99, 15);

INSERT INTO Customers (first_name, last_name, email, address)
VALUES
('John', 'Doe', 'john@example.com', '123 Main St'),
('Jane', 'Smith', 'jane@example.com', '456 Oak Ave');

-- #########################################################
-- INDEXING
-- #########################################################
CREATE INDEX idx_products_name ON Products(name);
CREATE INDEX idx_customers_email ON Customers(email);
CREATE INDEX idx_orders_date ON Orders(order_date);

-- #########################################################
-- TRIGGERS
-- #########################################################
DELIMITER $$

CREATE TRIGGER before_order_detail_insert
BEFORE INSERT ON OrderDetails
FOR EACH ROW
BEGIN
    DECLARE current_stock INT;
    DECLARE current_price DECIMAL(10,2);
    
    SELECT stock, price INTO current_stock, current_price 
    FROM Products WHERE product_id = NEW.product_id;
    
    IF current_stock < NEW.quantity THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient stock for product';
    END IF;
    
    SET NEW.price_at_purchase = current_price;
END$$

CREATE TRIGGER after_order_detail_insert
AFTER INSERT ON OrderDetails
FOR EACH ROW
BEGIN
    UPDATE Orders
    SET total_amount = (
        SELECT SUM(quantity * price_at_purchase)
        FROM OrderDetails
        WHERE order_id = NEW.order_id
    )
    WHERE order_id = NEW.order_id;
    
    UPDATE Products
    SET stock = stock - NEW.quantity
    WHERE product_id = NEW.product_id;
END$$

CREATE TRIGGER after_product_update
AFTER UPDATE ON Products
FOR EACH ROW
BEGIN
    INSERT INTO AuditLog (table_name, record_id, action, old_data, new_data)
    VALUES ('Products', OLD.product_id, 'UPDATE',
            JSON_OBJECT('name', OLD.name, 'price', OLD.price, 'stock', OLD.stock),
            JSON_OBJECT('name', NEW.name, 'price', NEW.price, 'stock', NEW.stock));
END$$

DELIMITER ;

-- #########################################################
-- TRANSACTION PROCEDURE
-- #########################################################
DELIMITER $$

CREATE PROCEDURE ProcessOrder(
    IN p_customer_id INT,
    IN p_product_id INT,
    IN p_quantity INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Transaction failed - rolled back' AS result;
    END;
    
    START TRANSACTION;
    
    -- Create order
    INSERT INTO Orders (customer_id, status, total_amount) 
    VALUES (p_customer_id, 'Processing', 0);
    
    SET @order_id = LAST_INSERT_ID();
    
    -- Add order details
    INSERT INTO OrderDetails (order_id, product_id, quantity)
    VALUES (@order_id, p_product_id, p_quantity);
    
    COMMIT;
    SELECT 'Transaction completed successfully' AS result;
END$$

DELIMITER ;

-- #########################################################
-- VIEWS
-- #########################################################
CREATE VIEW CustomerOrderSummary AS
SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(o.order_id) AS total_orders,
    COALESCE(SUM(o.total_amount), 0) AS total_spent
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id;

-- #########################################################
-- TESTING SEQUENCE
-- #########################################################

-- Test 1: Initial State Verification
SELECT '=== Initial Product Stock ===' AS test;
SELECT product_id, name, stock FROM Products;

SELECT '=== Initial Customers ===' AS test;
SELECT customer_id, email FROM Customers;

-- Test 2: Valid Transaction
SELECT '\n=== Processing Valid Order ===' AS test;
CALL ProcessOrder(1, 1, 2);  -- Customer 1 buys 2 laptops

SELECT '=== Post-Transaction Stock ===' AS test;
SELECT product_id, name, stock FROM Products;

SELECT '=== Order Details ===' AS test;
SELECT o.order_id, o.total_amount, od.product_id, od.quantity, od.price_at_purchase
FROM Orders o
JOIN OrderDetails od ON o.order_id = od.order_id;

-- Test 3: Insufficient Stock Test
SELECT '\n=== Testing Insufficient Stock ===' AS test;
CALL ProcessOrder(1, 1, 20);  -- Should fail

-- Test 4: Audit Log Test
SELECT '\n=== Testing Audit Log ===' AS test;
UPDATE Products SET price = 1099.99 WHERE product_id = 1;
SELECT * FROM AuditLog;

-- Test 5: Foreign Key Constraint Test
SELECT '\n=== Testing Foreign Key Constraints ===' AS test;
-- Invalid customer
INSERT INTO Orders (customer_id, status) VALUES (999, 'Processing');  -- Should fail
-- Invalid product
INSERT INTO OrderDetails (order_id, product_id, quantity) VALUES (1, 999, 1);  -- Should fail

-- Test 6: Unique Email Constraint
SELECT '\n=== Testing Unique Email ===' AS test;
INSERT INTO Customers (first_name, last_name, email) 
VALUES ('Duplicate', 'User', 'john@example.com');  -- Should fail

-- Test 7: View Verification
SELECT '\n=== Customer Order Summary View ===' AS test;
SELECT * FROM CustomerOrderSummary;

-- Test 8: Rollback Scenario
SELECT '\n=== Testing Transaction Rollback ===' AS test;
START TRANSACTION;
INSERT INTO Orders (customer_id, status) VALUES (2, 'Processing');
SET @order_id = LAST_INSERT_ID();
INSERT INTO OrderDetails (order_id, product_id, quantity) VALUES (@order_id, 2, 5);

SELECT '=== Pre-Rollback Verification ===' AS test;
SELECT * FROM Orders;
ROLLBACK;

SELECT '=== Post-Rollback Verification ===' AS test;
SELECT * FROM Orders;

-- Overall verification
SELECT '=== Final Tables ===' AS test;
SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
SELECT * FROM AuditLog;