# HCL Training — Week 1: SQL & Relational Database Management

A comprehensive collection of SQL scripts, relational database schemas, practice problems, and analytical queries completed during **Week 1 of the HCL Training Program**.

---

## 📌 Repository Overview

This repository documents hands-on learning and practical implementations covered during the first week of the HCL training. The curriculum progressed from fundamental database operations and CRUD concepts to advanced multi-table relational schema design, CTEs, and window/analytical functions.

---

## 🗓️ Weekly Learning Breakdown

### 🔹 Day 1: SQL Fundamentals & Basic Querying
* **DDL & Schema Definition:** Table creation (`CREATE TABLE`) with primary keys and data types (`INT`, `VARCHAR`).
* **DML Operations:** Record insertion (`INSERT INTO`).
* **Data Retrieval & Projection:** Basic `SELECT` queries and column filtering.
* **Conditional Filtering:** Using `WHERE` with comparison operators (`>`, `<`, `=`).
* **Logical & Range Operators:** `BETWEEN ... AND ...`, `IN (...)`, `AND`, `OR`.
* **Sorting & Pagination:** `ORDER BY` (Ascending/Descending) and `LIMIT` clauses.
* **Basic Aggregation:** Introduction to `COUNT(*)`, `GROUP BY`, and group filtering with `HAVING`.

📁 *File:* [`Day-1.sql`](Day-1.sql)

---

### 🔹 Day 2: Relational Schema Design, Constraints & Joins
* **Database Modeling:** Designed an end-to-end **E-Commerce Database** with interconnected tables:
  * `customer`
  * `product`
  * `orders`
  * `order_items`
  * `payments`
* **Integrity Constraints:** Enforcing Primary Keys (`PRIMARY KEY`) and Foreign Keys (`FOREIGN KEY ... REFERENCES`).
* **Schema Evolution:** Using `ALTER TABLE` to add constraints and modify column definitions (`ENUM` data types).
* **Data Manipulation & Maintenance:** Updating existing records with `UPDATE ... SET ... WHERE`.
* **Pattern Matching:** Advanced search using `LIKE` and wildcards (`%`).
* **Date & Time Functions:** Filtering by quarters, specific months (`MONTH()`), and date ranges.
* **Financial Aggregations:** Revenue calculations using `SUM()`, `MAX()`, `MIN()`.
* **Subqueries:** Scalar subqueries (e.g., finding the maximum priced item).
* **Multi-Table Joins:**
  * `INNER JOIN` across related entities.
  * Complex 4-table joins (`customer` ➔ `orders` ➔ `order_items` ➔ `product`).

📁 *File:* [`day-2.sql`](day-2.sql)

---

### 🔹 Day 3: Advanced SQL, Analytical Queries & 50 Practice Exercises
* **Enterprise Schema Architecture:** Modeled an enterprise business scenario spanning:
  * `departments`
  * `employees`
  * `projects`
  * `customers`
  * `transactions`
  * `employee_history` (composite primary key)
* **Comprehensive Joins:** Practical application of `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, handling orphaned records, and `NULL` value checking (`IS NULL`, `COALESCE`).
* **Database Views:** Creating and querying reusable database views (`CREATE OR REPLACE VIEW`).
* **Common Table Expressions (CTEs):** Modular and readable query structuring using `WITH ... AS (...)`.
* **Correlated & Nested Subqueries:** Filtering non-participating records with `NOT IN` subqueries and conditional subqueries.
* **Window & Analytical Functions:**
  * **Ranking Functions:** `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`, and `PERCENT_RANK()`.
  * **Partitioning & Framing:** `OVER (PARTITION BY ... ORDER BY ...)`.
  * **Running Aggregates:** Cumulative totals and running sums across time sequences.
  * **Partition Benchmarking:** Comparing individual metrics (e.g., salary) against department-wide averages.
  * **Offset Functions:** `LAG()` and `LEAD()` to inspect previous and subsequent transaction records.

📁 *File:* [`day-3.sql`](day-3.sql)  
📄 *Reference Material:* [`Junior Data Engineer.pdf`](Junior%20Data%20Engineer.pdf) (Practice question bank)

---

## 🗂️ Repository Structure

```text
HCL_JU/
├── Day-1.sql                  # Day 1: DDL, DML, filtering, basic aggregation & sorting
├── day-2.sql                  # Day 2: E-Commerce relational schema, foreign keys, multi-table joins
├── day-3.sql                  # Day 3: 50 real-world SQL exercises, CTEs, and window functions
├── Junior Data Engineer.pdf   # Practice questions & curriculum problem sheet
├── sample_data.csv            # Sample tabular dataset for importing & practice
├── sample_data.xlsx           # Sample Excel dataset
└── README.md                  # Week 1 learning summary and documentation
```

---

## 🛠️ Concepts & Technologies Mastered

| Category | Topics Covered |
| :--- | :--- |
| **SQL Dialect & Tools** | MySQL / Relational DBMS |
| **DDL** | `CREATE TABLE`, `ALTER TABLE`, `PRIMARY KEY`, `FOREIGN KEY`, `ENUM` |
| **DML** | `INSERT`, `UPDATE`, `DELETE` |
| **DQL & Filtering** | `SELECT`, `WHERE`, `LIKE`, `IN`, `BETWEEN`, `ORDER BY`, `LIMIT` |
| **Joins** | `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, Multi-table chains |
| **Grouping & Aggregation** | `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`, `GROUP BY`, `HAVING` |
| **Advanced Querying** | Subqueries, CTEs (`WITH`), Views (`CREATE VIEW`), `COALESCE` |
| **Analytical Functions** | `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`, `LAG()`, `LEAD()`, Cumulative Sums |

---

## 🚀 How to Run the Scripts

1. **Prerequisites:** Ensure you have [MySQL Server](https://dev.mysql.com/downloads/mysql/) or a compatible SQL client (MySQL Workbench, DBeaver, VS Code SQL extensions, etc.) installed.
2. **Execute Queries:** Open any script (`Day-1.sql`, `day-2.sql`, or `day-3.sql`) and run the statements sequentially to create the schema, populate test data, and execute the analytical queries.

---

## 👤 Author
- **Zaid Attar** ([@zaid-as-w](https://github.com/zaid-as-w))

