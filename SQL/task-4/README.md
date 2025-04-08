
# Task 4 – Multi-Table JOINS

## 📌 Objective

To practice combining data from multiple related tables using `JOIN` operations in SQL. This includes using `INNER JOIN`, `LEFT JOIN`, and experimenting with data aggregation across joined tables.

---

## 🧱 Schema Overview

Two interconnected tables were created:

### 🧙 Wizards

| Column     | Type         | Description                      |
|------------|--------------|----------------------------------|
| WizardID   | INT (PK)     | Unique identifier for a wizard   |
| FirstName  | VARCHAR(30)  | First name of the wizard         |
| LastName   | VARCHAR(30)  | Last name of the wizard          |
| House      | VARCHAR(20)  | Hogwarts house                   |
| WandCore   | VARCHAR(30)  | Core material of their wand      |
| BloodStatus| VARCHAR(20)  | Blood status (e.g., Pure-blood)  |

### 📦 Orders

| Column     | Type         | Description                             |
|------------|--------------|-----------------------------------------|
| OrderID    | INT (PK)     | Unique order identifier                 |
| WizardID   | INT (FK)     | Linked wizard placing the order         |
| Item       | VARCHAR(50)  | Item ordered                            |
| Quantity   | INT          | Number of items                         |
| OrderDate  | DATE         | Date when the order was placed          |

> `FOREIGN KEY (WizardID)` includes `ON DELETE CASCADE` to ensure orders are deleted when the wizard is removed.

---

## 📂 File Structure

```
task-4/
├── task.txt      -- Task description and requirements
├── query.sql     -- SQL script to create schema, insert data, and run joins
├── output.txt    -- Captured output of executed queries
└── README.md     -- Task documentation (this file)
```

---

## 📥 Populated Data

- **9 Wizards** from different houses, wand cores, and blood statuses.
- **11 Orders** with a variety of magical items.

---

## 🔍 Queries Implemented

1. **INNER JOIN**  
   Retrieves all orders along with their respective wizard details.

2. **LEFT JOIN**  
   Lists all wizards and their orders (if any), ensuring even those without orders are shown.

3. **LEFT JOIN + NULL filter**  
   Identifies wizards who haven't placed any orders.

4. **JOIN + Aggregation**  
   Calculates the total number of orders and items ordered by each wizard.

5. **JOIN + Filter by House**  
   Retrieves total items ordered only by Gryffindor wizards.

6. **JOIN + GROUP BY House**  
   Shows total number of orders and items grouped by house.

7. **JOIN + GROUP BY BloodStatus**  
   Summarizes total items ordered grouped by blood status.

---

## 🧪 Sample Output

> A detailed log of query outputs is provided in `output.txt`. Here’s a sneak peek:

- **Wizards without orders:**  
  `Cedric Diggory` (Hufflepuff)

- **Wizard with most items ordered:**  
  `Ron Weasley` – 15 items across 2 orders

- **Top ordering House:**  
  `Gryffindor` – 7 orders and 28 items

- **By BloodStatus:**  
  `Pure-bloods` lead with 21 items ordered

---

## 🚀 How to Run

1. Open your MySQL client or terminal.
2. Run the script:
   ```sql
   SOURCE /path/to/query.sql;
   ```
3. Verify output via:
   ```sql
   SELECT * FROM Wizards;
   SELECT * FROM Orders;
   ```

---