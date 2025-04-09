
# Task 5: Subqueries and Nested Queries


## 🧠 Objective

The goal of this task is to demonstrate the use of **subqueries** in SQL to:
- Filter or compute values within a main query.
- Utilize subqueries in different SQL clauses.
- Understand the distinction between **correlated** and **non-correlated** subqueries.

---

## 📌 Requirements Covered

1. ✅ **Subquery in the `WHERE` clause**  
   - Example: Fetch wizards who placed more orders than the average number of orders per wizard.

2. ✅ **Subquery in the `SELECT` list**  
   - Example: Display each wizard with the total quantity of items they've ordered (or 0 if none).

3. ✅ **Use of correlated subqueries**  
   - Example: Find wizards who placed a single order with quantity greater than 5 using `EXISTS`.

4. ✅ **Use of non-correlated subqueries**  
   - Example: Identify the house with the highest total quantity of items ordered.

---

## 🗃️ Tables Used

### `Wizards`
Stores information about individual wizards:
- `WizardID`, `FirstName`, `LastName`, `House`, `WandCore`, `BloodStatus`

### `Orders`
Stores orders placed by wizards:
- `OrderID`, `WizardID`, `Item`, `Quantity`, `OrderDate`  
- Linked to `Wizards` via a foreign key with `ON DELETE CASCADE`

---

## 📊 Key Queries & Purpose

| Query Description | Subquery Type |
|-------------------|----------------|
| Wizards with more orders than the average | Non-correlated subquery in `WHERE` |
| Total quantity of items ordered per wizard | Subquery in `SELECT` list |
| Wizards who placed an order with more than 5 items | Correlated subquery using `EXISTS` |
| Wizards who ordered specific items ("Invisibility Cloak", "Dark Mark Amulet") | Subquery with `IN` |
| House with highest total order quantity | Non-correlated subquery in `HAVING` |

---

## 🧪 Sample Execution

To execute all queries:

```sql
SOURCE path/to/query.sql;
```

All queries are built upon the `task5_db` database and return meaningful results based on pre-inserted sample data.

---
