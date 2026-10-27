-- ============================================================================
-- Day 3: Fifty SQL MCQs & Exercises
-- Schema: departments, employees, projects, customers, transactions, employee_history
-- ============================================================================

CREATE DATABASE IF NOT EXISTS fifty_mcqs;
USE fifty_mcqs;

-- ----------------------------------------------------------------------------
-- 1. Table Definitions & Data Ingestion
-- ----------------------------------------------------------------------------

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments (department_id, department_name) VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Sales'),
(6, 'Data Science'),
(7, 'Operations'),
(8, 'Research'),
(9, 'Support'),
(10, 'Engineering');

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department_id INT,
    salary DECIMAL(10, 2),
    joining_date DATE,
    city VARCHAR(50),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO employees (employee_id, employee_name, department_id, salary, joining_date, city) VALUES
(101, 'Aarav', 1, 95000.00, '2023-01-15', 'Bengaluru'),
(102, 'Priya', 1, 85000.00, '2024-03-10', 'Mysuru'),
(103, 'Rahul', 1, 75000.00, '2025-06-20', 'Belagavi'),
(104, 'Sneha', 2, 45000.00, '2022-07-12', 'Bengaluru'),
(105, 'Vikram', 2, 55000.00, '2023-09-05', 'Hubballi'),
(106, 'Ananya', 3, 80000.00, '2024-01-18', 'Mysuru'),
(107, 'Kiran', 3, 65000.00, '2025-02-14', 'Belagavi'),
(108, 'Zoya', 4, 60000.00, '2026-01-20', 'Bengaluru'),
(109, 'Arjun', 5, 50000.00, '2026-04-15', 'Hubballi'),
(110, 'Meera', 6, 110000.00, '2023-11-11', 'Bengaluru'),
(111, 'Imran', 6, 100000.00, '2024-08-19', 'Mysuru'),
(112, 'Neha', 6, 90000.00, '2025-12-01', 'Belagavi'),
(113, 'Rohan', 7, 42000.00, '2022-05-16', 'Hubballi'),
(114, 'Aisha', 8, 70000.00, '2026-07-01', 'Bengaluru'),
(115, 'Kabir', NULL, 88000.00, '2025-03-22', 'Mysuru');

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    employee_id INT,
    project_cost DECIMAL(12, 2),
    start_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO projects (project_id, project_name, employee_id, project_cost, start_date) VALUES
(201, 'Website Development', 101, 350000.00, '2024-01-10'),
(202, 'Cloud Migration', 101, 450000.00, '2024-06-15'),
(203, 'Data Pipeline', 101, 300000.00, '2025-02-01'),
(204, 'Mobile Application', 102, 250000.00, '2024-04-20'),
(205, 'Security Audit', 102, 180000.00, '2025-01-15'),
(206, 'Payroll System', 104, 120000.00, '2023-03-10'),
(207, 'Financial Dashboard', 106, 400000.00, '2024-02-12'),
(208, 'Sales Analytics', 106, 350000.00, '2025-05-18'),
(209, 'Customer Portal', 107, 275000.00, '2025-07-01'),
(210, 'AI Recommendation', 110, 600000.00, '2024-08-10'),
(211, 'Fraud Detection', 110, 500000.00, '2025-01-05'),
(212, 'Predictive Analytics', 110, 450000.00, '2025-09-15'),
(213, 'Machine Learning API', 111, 550000.00, '2025-03-01'),
(214, 'Marketing Automation', 108, 150000.00, '2026-02-10'),
(215, 'Inventory System', 115, 320000.00, '2025-04-12');

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);

INSERT INTO customers (customer_id, customer_name, city) VALUES
(301, 'Amit Sharma', 'Bengaluru'),
(302, 'Fatima Khan', 'Mysuru'),
(303, 'Ravi Kumar', 'Belagavi'),
(304, 'Neha Patil', 'Hubballi'),
(305, 'Sameer Ali', 'Bengaluru'),
(306, 'Pooja Rao', 'Mysuru'),
(307, 'Arman Shaikh', 'Belagavi'),
(308, 'Divya Singh', 'Bengaluru'),
(309, 'Sahil Joshi', 'Hubballi'),
(310, 'Isha Verma', 'Mysuru'),
(311, 'Nikhil Desai', 'Belagavi'),
(312, 'Sara Ahmed', 'Bengaluru');

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    customer_id INT,
    transaction_date DATE,
    transaction_type VARCHAR(20),
    amount DECIMAL(12, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO transactions (transaction_id, customer_id, transaction_date, transaction_type, amount) VALUES
(401, 301, '2025-01-10', 'CREDIT', 80000.00),
(402, 301, '2025-01-20', 'CREDIT', 70000.00),
(403, 301, '2025-02-15', 'DEBIT', 25000.00),
(404, 301, '2025-03-05', 'CREDIT', 90000.00),
(405, 301, '2025-03-20', 'DEBIT', 15000.00),
(406, 301, '2025-04-10', 'CREDIT', 60000.00),
(407, 302, '2025-01-12', 'CREDIT', 50000.00),
(408, 302, '2025-02-18', 'DEBIT', 12000.00),
(409, 302, '2025-03-22', 'CREDIT', 85000.00),
(410, 303, '2025-01-15', 'CREDIT', 120000.00),
(411, 303, '2025-02-25', 'CREDIT', 95000.00),
(412, 304, '2025-03-10', 'DEBIT', 30000.00),
(413, 305, '2025-04-15', 'CREDIT', 200000.00),
(414, 306, '2026-01-05', 'CREDIT', 75000.00),
(415, 307, '2026-02-12', 'DEBIT', 18000.00);

CREATE TABLE employee_history (
    employee_id INT,
    salary DECIMAL(10, 2),
    effective_date DATE,
    PRIMARY KEY (employee_id, effective_date),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO employee_history (employee_id, salary, effective_date) VALUES
(101, 70000.00, '2023-01-15'),
(101, 85000.00, '2024-01-01'),
(101, 95000.00, '2025-01-01'),
(102, 65000.00, '2023-03-10'),
(102, 75000.00, '2024-03-10'),
(102, 85000.00, '2025-03-10'),
(103, 60000.00, '2024-06-20'),
(103, 75000.00, '2025-06-20'),
(104, 40000.00, '2022-07-12'),
(104, 45000.00, '2024-07-12'),
(106, 60000.00, '2023-01-18'),
(106, 70000.00, '2024-01-18'),
(106, 80000.00, '2025-01-18'),
(110, 90000.00, '2023-11-11'),
(110, 110000.00, '2025-11-11');

-- ----------------------------------------------------------------------------
-- 2. Basic Table Previews (Q1 - Q6)
-- ----------------------------------------------------------------------------

-- Q1: Display all departments
SELECT * FROM departments;

-- Q2: Display all employees
SELECT * FROM employees;

-- Q3: Display all projects
SELECT * FROM projects;

-- Q4: Display all customers
SELECT * FROM customers;

-- Q5: Display all transactions
SELECT * FROM transactions;

-- Q6: Display all employee history records
SELECT * FROM employee_history;

-- ----------------------------------------------------------------------------
-- 3. Joins, Aggregations, and Grouping (Q7 - Q20)
-- ----------------------------------------------------------------------------

-- Q7: Employee count and average salary per department (including empty departments)
SELECT d.department_id,
       d.department_name,
       COUNT(e.employee_id) AS employee_count,
       AVG(e.salary) AS average_salary
FROM employees e
RIGHT JOIN departments d
    ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name;

-- Q8: Employee name, department name, and salary (all departments included)
SELECT e.employee_name,
       d.department_name,
       e.salary
FROM employees e
RIGHT JOIN departments d
    ON e.department_id = d.department_id;

-- Q9: Find employees who are not assigned to any department
SELECT e.employee_name
FROM employees e
LEFT JOIN departments d
    ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

-- Q10: Find duplicate employee names
SELECT employee_name
FROM employees
GROUP BY employee_name
HAVING COUNT(*) > 1;

-- Q11: Find unique employee names (names that appear only once)
SELECT DISTINCT employee_name
FROM employees
WHERE employee_name NOT IN (
    SELECT employee_name
    FROM employees
    GROUP BY employee_name
    HAVING COUNT(*) > 1
);

-- Q12: Total project cost handled by each employee
SELECT e.employee_id,
       e.employee_name,
       COALESCE(SUM(p.project_cost), 0) AS total_cost
FROM employees e
LEFT JOIN projects p
    ON e.employee_id = p.employee_id
GROUP BY e.employee_id, e.employee_name;

-- Q13: Customers whose total transaction value exceeds 200,000
SELECT t.customer_id,
       c.customer_name,
       SUM(t.amount) AS total_amount
FROM transactions t
INNER JOIN customers c
    ON t.customer_id = c.customer_id
GROUP BY t.customer_id, c.customer_name
HAVING SUM(t.amount) > 200000;

-- Q14: Total transaction amount grouped by year and month
SELECT YEAR(transaction_date) AS yr,
       MONTH(transaction_date) AS mon,
       SUM(amount) AS total_amount
FROM transactions
GROUP BY YEAR(transaction_date),
         MONTH(transaction_date);

-- Q15: Create view for Belagavi customers and query from it
CREATE OR REPLACE VIEW bgm_cust AS
SELECT *
FROM customers
WHERE city = 'Belagavi';

SELECT * FROM bgm_cust;

-- Q16: Total credit amount per customer
SELECT customer_id,
       SUM(amount) AS total_credit
FROM transactions
WHERE transaction_type = 'CREDIT'
GROUP BY customer_id;

-- Q17: Customers with more than 5 transactions
SELECT customer_id,
       COUNT(*) AS transaction_count
FROM transactions
GROUP BY customer_id
HAVING COUNT(*) > 5;

-- Q18: Total transaction amount per customer name
SELECT c.customer_id,
       c.customer_name,
       SUM(t.amount) AS total_amount
FROM customers c
JOIN transactions t
    ON c.customer_id = t.customer_id
GROUP BY c.customer_id, c.customer_name;

-- Q19: Customers who have made zero transactions
SELECT c.customer_id,
       c.customer_name
FROM customers c
LEFT JOIN transactions t
    ON c.customer_id = t.customer_id
WHERE t.customer_id IS NULL;

-- Q20: Department with the highest average salary
SELECT d.department_id,
       d.department_name,
       AVG(e.salary) AS avg_salary
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name
ORDER BY avg_salary DESC
LIMIT 1;

-- ----------------------------------------------------------------------------
-- 4. Filtering, Range, and Subqueries (Q21 - Q30)
-- ----------------------------------------------------------------------------

-- Q21: Departments where the minimum salary is above 40,000
SELECT COALESCE(department_id, 0) AS department_id,
       MIN(salary) AS min_salary
FROM employees
GROUP BY department_id
HAVING MIN(salary) > 40000;

-- Q22: Employees who joined in the year 2026 (using YEAR)
SELECT *
FROM employees
WHERE YEAR(joining_date) = 2026;

-- Q23: Employees who joined in 2026 (using Date Range)
SELECT *
FROM employees
WHERE joining_date >= '2026-01-01'
  AND joining_date < '2027-01-01';

-- Q24: Top 3 most recently joined employees
SELECT *
FROM employees
ORDER BY joining_date DESC
LIMIT 3;

-- Q25: Employees working on 3 or more distinct projects
SELECT employee_id,
       COUNT(DISTINCT project_id) AS project_count
FROM projects
GROUP BY employee_id
HAVING COUNT(DISTINCT project_id) >= 3;

-- Q26: Employees who have no projects assigned (Method 1: LEFT JOIN)
SELECT e.employee_id,
       e.employee_name
FROM employees e
LEFT JOIN projects p
    ON e.employee_id = p.employee_id
WHERE p.project_id IS NULL;

-- Q27: Employees who have no projects assigned (Method 2: NOT IN Subquery)
SELECT employee_id,
       employee_name
FROM employees
WHERE employee_id NOT IN (
    SELECT DISTINCT employee_id
    FROM projects
    WHERE employee_id IS NOT NULL
);

-- Q28: Single project with the highest project cost
SELECT *
FROM projects
ORDER BY project_cost DESC
LIMIT 1;

-- Q29: Total number of employees in each department
SELECT d.department_id,
       d.department_name,
       COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

-- Q30: Salary range (MAX - MIN) for departments where range > 0
SELECT department_id,
       MAX(salary) - MIN(salary) AS salary_range
FROM employees
GROUP BY department_id
HAVING MAX(salary) - MIN(salary) > 0;

-- ----------------------------------------------------------------------------
-- 5. Advanced Aggregations and Window Functions (Q31 - Q40)
-- ----------------------------------------------------------------------------

-- Q31: Departments with at least 3 employees and average salary > 20000
SELECT department_id,
       COUNT(*) AS emp_cnt,
       AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id
HAVING COUNT(*) >= 3
   AND AVG(salary) > 20000;

-- Q32: Rank employees by salary within each department
SELECT *,
       RANK() OVER (
           PARTITION BY department_id
           ORDER BY salary DESC
       ) AS salary_rank
FROM employees;

-- Q33: Find the highest paid employee per department using DENSE_RANK
SELECT *
FROM (
    SELECT e.*,
           DENSE_RANK() OVER (
               PARTITION BY COALESCE(department_id, 0)
               ORDER BY salary DESC
           ) AS salary_rank
    FROM employees e
) x
WHERE salary_rank <= 1;

-- Q34: Running total of salaries ordered by employee_id
SELECT employee_id,
       salary,
       SUM(salary) OVER (
           ORDER BY employee_id
       ) AS running_total
FROM employees;

-- Q35: Department average salary shown alongside each employee
SELECT employee_id,
       employee_name,
       salary,
       department_id,
       AVG(salary) OVER (
           PARTITION BY department_id
       ) AS department_avg
FROM employees;

-- Q36: Employees earning more than their department's average salary
SELECT *
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = e.department_id
);

-- Q37: Most recent salary record for each employee from history
SELECT *
FROM (
    SELECT h.*,
           ROW_NUMBER() OVER (
               PARTITION BY employee_id
               ORDER BY effective_date DESC
           ) AS rn
    FROM employee_history h
) x
WHERE rn = 1;

-- Q38: High earning employees (> 80000) using Common Table Expression (CTE)
WITH high_salary AS (
    SELECT *
    FROM employees
    WHERE salary > 80000
)
SELECT *
FROM high_salary;

-- Q39: Department with the highest average salary (using LIMIT)
SELECT department_id,
       AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id
ORDER BY avg_salary DESC
LIMIT 1;

-- Q40: Employees with duplicate joining dates
SELECT employee_id,
       joining_date,
       COUNT(*) AS duplicate_count
FROM employees
GROUP BY employee_id, joining_date
HAVING COUNT(*) > 1;

-- ----------------------------------------------------------------------------
-- 6. Analytics, Window Offsets, and Ranking Functions (Q41 - Q50)
-- ----------------------------------------------------------------------------

-- Q41: Highest transaction amount recorded for each customer
SELECT customer_id,
       MAX(amount) AS highest_transaction
FROM transactions
GROUP BY customer_id;

-- Q42: Top (largest) transaction per customer using ROW_NUMBER
SELECT *
FROM (
    SELECT t.*,
           ROW_NUMBER() OVER (
               PARTITION BY customer_id
               ORDER BY amount DESC
           ) AS rn
    FROM transactions t
) x
WHERE rn = 1;

-- Q43: Total transaction amount aggregated by year and month
SELECT YEAR(transaction_date) AS yr,
       MONTH(transaction_date) AS mon,
       SUM(amount) AS total_amount
FROM transactions
GROUP BY YEAR(transaction_date),
         MONTH(transaction_date);

-- Q44: Cumulative transaction sum for each customer over time
SELECT customer_id,
       transaction_date,
       amount,
       SUM(amount) OVER (
           PARTITION BY customer_id
           ORDER BY transaction_date
       ) AS running_total
FROM transactions;

-- Q45: Cumulative project cost over start dates
SELECT project_id,
       project_name,
       start_date,
       project_cost,
       SUM(project_cost) OVER (
           ORDER BY start_date
       ) AS cumulative_cost
FROM projects;

-- Q46: Previous transaction amount for each customer (LAG function)
SELECT customer_id,
       transaction_date,
       amount,
       LAG(amount) OVER (
           PARTITION BY customer_id
           ORDER BY transaction_date
       ) AS previous_amount
FROM transactions;

-- Q47: Next transaction amount for each customer (LEAD function)
SELECT customer_id,
       transaction_date,
       amount,
       LEAD(amount) OVER (
           PARTITION BY customer_id
           ORDER BY transaction_date
       ) AS next_amount
FROM transactions;

-- Q48: Top 2 highest earners per department using DENSE_RANK
SELECT *
FROM (
    SELECT e.*,
           DENSE_RANK() OVER (
               PARTITION BY department_id
               ORDER BY salary DESC
           ) AS rnk
    FROM employees e
) x
WHERE rnk <= 2;

-- Q49: Relative salary ranking percentage using PERCENT_RANK
SELECT employee_name,
       salary,
       PERCENT_RANK() OVER (ORDER BY salary) AS percent_ranks
FROM employees;

-- Q50: Retrieve all employees who joined in calendar year 2026
SELECT *
FROM employees
WHERE joining_date BETWEEN '2026-01-01' AND '2026-12-31';