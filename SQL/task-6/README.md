
# Task-6: SQL - Date and Time Functions

## 📝 Task Objective

To explore and utilize **SQL Date and Time Functions** on a real-world `Orders` dataset. The objective is to extract meaningful insights using temporal analysis—such as delivery trends, approval delays, monthly activity, and on-time performance.

---

## 🗃️ Dataset Used

- The dataset is sourced from a real-world **e-commerce orders CSV** file.
- Due to MySQL's file access restrictions, the CSV was imported using a **Python script** (included in this project).
- Relevant fields:
  - `order_id`, `customer_id`, `order_status`
  - `order_purchase_timestamp`
  - `order_approved_at`
  - `order_delivered_timestamp`
  - `order_estimated_delivery_date`

---

## ⚙️ Setup Instructions

1. **Create Database and Table**
   ```sql
   CREATE DATABASE IF NOT EXISTS task6_db;
   USE task6_db;

   CREATE TABLE IF NOT EXISTS Orders (
       order_id VARCHAR(50) PRIMARY KEY,
       customer_id VARCHAR(50),
       order_status VARCHAR(30),
       order_purchase_timestamp DATETIME,
       order_approved_at DATETIME,
       order_delivered_timestamp DATETIME,
       order_estimated_delivery_date DATETIME
   );
   ```

2. **Load Data Using Python**
   ```bash
   python script.py
   ```
   This script will automatically populate the `Orders` table from `orders.csv`.

3. **Run Queries**
   ```sql
   source query.sql
   ```

---

## 📊 Queries and Insights

| Query Description | Key Functions Used |
|-------------------|--------------------|
| View first/last purchase dates and dataset age | `MIN()`, `MAX()`, `TIMESTAMPDIFF()` |
| Status distribution (delivered, canceled, etc.) | `GROUP BY`, `COUNT()` |
| Average approval time (in hours) | `TIMESTAMPDIFF(HOUR, ...)` |
| Delivery time stats: Fastest, Slowest, Average | `MIN()`, `MAX()`, `AVG()` over `TIMESTAMPDIFF(DAY, ...)` |
| Count of late deliveries | Conditional `WHERE` on date comparison |
| On-time delivery percentage | Nested subquery with percentage math |
| Cancellations due to late delivery | Combined `WHERE` conditions |
| Monthly trend of order volumes | `DATE_FORMAT`, `GROUP BY` |
| Top 3 months by order volume | `ORDER BY`, `LIMIT` |
| Monthly seasonality pattern | Group by month name using `DATE_FORMAT(..., '%M')` |
| Top 5 early customers in first 6 months | Use of `MIN()` + `INTERVAL` |
| Weekend order behavior | `DAYOFWEEK()` and percentage calculation |

---

## ✅ Output Highlights

- **Average Approval Time**: ~10.08 hours
- **Average Delivery Time**: ~11.97 days
- **Late Deliveries**: 6,738
- **On-Time Delivery Rate**: 90.34%
- **Top Performing Month**: November 2017
- **Weekend Orders**: 22.56% of total orders

---

## 📂 File Structure

```
task-6/
├── orders.csv           # E-commerce orders dataset
├── task.txt             # Task description
├── script.py            # Python script to load CSV into MySQL
├── query.sql            # SQL file with table creation + analysis queries
├── output.txt           # output of the queries
└── README.md            # Documentation (you're here!)
```

---

## 🧠 Learnings

- Date and time fields can reveal rich operational patterns.
- Using `DATE_FORMAT()` and `TIMESTAMPDIFF()` allows fine control over period-based grouping and delays.
- Nested queries and smart filtering can measure KPIs like late deliveries and on-time performance effectively.

---