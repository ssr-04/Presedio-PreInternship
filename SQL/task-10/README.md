
# Task-10: Comprehensive Database Design, Optimization, and Advanced Features

## 🎯 Objective
Design a normalized, efficient, and feature-rich relational database schema for an **eCommerce platform**. Implement advanced SQL functionalities to enforce **data integrity**, enhance **performance**, and support **automation** through triggers, transactions, and views.

---

## 📁 Folder Structure
```
task-10/
├── task.txt            # Task description and requirements
├── Requirements.txt    # Detailed task requirements
├── query.sql           # Complete SQL implementation
└── output.txt          # Console output from MySQL showing execution and testing
└── schema.pdf          # Database schema diagram
└── Readme.md           # Documentation for the projects
```

---

## 🧱 Database Features

### 1. 🧩 Schema Design (Normalization and Integrity)
- **Tables**: `Products`, `Customers`, `Orders`, `OrderDetails`, `AuditLog`
- **Normalization**: Ensures data is stored efficiently and redundantly minimized.
- **Constraints**:
  - `PRIMARY KEY`, `FOREIGN KEY`
  - `UNIQUE` (e.g., unique emails)
  - `CHECK` (e.g., non-negative stock and price)
- **Automatic Timestamps**: Managed with `DEFAULT CURRENT_TIMESTAMP`.

---

### 2. ⚡ Indexing for Performance
- Added indexes on:
  - `Products.name`
  - `Customers.email`
  - `Orders.order_date`
- Speeds up search queries and filters.

---

### 3. ⚙️ Triggers for Business Rules
- **`before_order_detail_insert`**: 
  - Checks stock before order insertion.
  - Fetches price and sets it automatically.
- **`after_order_detail_insert`**: 
  - Updates `Orders.total_amount` and reduces `Products.stock`.
- **`after_product_update`**:
  - Logs changes to `Products` in the `AuditLog` table using JSON format.

---

### 4. 🔄 Transactions
- **Stored Procedure `ProcessOrder`**:
  - Handles customer order placement.
  - Uses `START TRANSACTION`, `COMMIT`, `ROLLBACK`.
  - Ensures atomicity of multi-step operations.

---

### 5. 🪞 Views
- **`CustomerOrderSummary`**:
  - Displays total orders and total spending per customer.
  - Simplifies analytical queries.

---

## 🧪 Testing & Validation

### ✅ Test Cases Implemented:
| Test # | Description |
|--------|-------------|
| 1 | Verifies initial data in `Products` and `Customers`. |
| 2 | Runs a successful transaction: Order by Customer 1 for 2 Laptops. |
| 3 | Fails a transaction due to insufficient stock. |
| 4 | Verifies `AuditLog` trigger on product update. |
| 5 | Tests foreign key violations (invalid customer/product). |
| 6 | Verifies unique email constraint. |
| 7 | Fetches data from the customer summary view. |
| 8 | Simulates a rollback scenario and confirms no changes persisted. |

Check `output.txt` for exact MySQL execution results.

---

## 🧾 Setup Instructions

### Prerequisites:
- MySQL Server (tested on MySQL 8+)
- Any MySQL client (e.g., MySQL CLI, MySQL Workbench)

### To Run:
1. Start MySQL and log in:
   ```bash
   mysql -u your_username -p
   ```
2. Source the SQL script:
   ```sql
   SOURCE path/to/query.sql;
   ```

---

## 🧠 Learnings & Concepts Demonstrated
- Relational design and normalization
- Index tuning for performance
- Business logic with Triggers
- Safe data manipulation with Transactions
- Analytical abstraction using Views
- Error handling with `SIGNAL` and rollback control

---

## 📌 Notes
- The `AuditLog` table uses `JSON` columns to track before/after updates.
- View `CustomerOrderSummary` is non-materialized, meant for real-time analytics.
- Triggers ensure that operations maintain referential and transactional integrity.

---