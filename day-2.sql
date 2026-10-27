-- ============================================================================
-- Day 2: E-Commerce Database Schema, DDL, DML, Joins, and Aggregations
-- ============================================================================

CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

-- ----------------------------------------------------------------------------
-- 1. Table: customer
-- ----------------------------------------------------------------------------
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(50),
    city VARCHAR(20),
    state VARCHAR(20),
    phone_number VARCHAR(10)
);

INSERT INTO customer (customer_id, customer_name, email, city, state, phone_number)
VALUES
    (1, 'Rahul Sharma', 'rahul@gmail.com', 'Bengaluru', 'Karnataka', '9876543210'),
    (2, 'Priya Patil', 'priya@gmail.com', 'Belagavi', 'Karnataka', '9876543211'),
    (3, 'Amit Kumar', 'amit@gmail.com', 'Mumbai', 'Maharashtra', '9876543212'),
    (4, 'Sneha Reddy', 'sneha@gmail.com', 'Hyderabad', 'Telangana', '9876543213'),
    (5, 'Arjun Singh', 'arjun@gmail.com', 'Delhi', 'Delhi', '9876543214'),
    (6, 'Neha Joshi', 'neha@gmail.com', 'Pune', 'Maharashtra', '9876543215'),
    (7, 'Vikas Gupta', 'vikas@gmail.com', 'Chennai', 'Tamil Nadu', '9876543216'),
    (8, 'Ananya Rao', 'ananya@gmail.com', 'Mysuru', 'Karnataka', '9876543217'),
    (9, 'Rohan Das', 'rohan@gmail.com', 'Kolkata', 'West Bengal', '9876543218'),
    (10, 'Pooja Shah', 'pooja@gmail.com', 'Ahmedabad', 'Gujarat', '9876543219'),
    (11, 'Kiran Naik', 'kiran@gmail.com', 'Goa', 'Goa', '9876543220'),
    (12, 'Meera Nair', 'meera@gmail.com', 'Kochi', 'Kerala', '9876543221'),
    (13, 'Sahil Khan', 'sahil@gmail.com', 'Jaipur', 'Rajasthan', '9876543222'),
    (14, 'Divya Verma', 'divya@gmail.com', 'Bhopal', 'Madhya Pradesh', '9876543223'),
    (15, 'Aditya Roy', 'aditya@gmail.com', 'Lucknow', 'Uttar Pradesh', '9876543224');

-- Customer Queries
SELECT * FROM customer;

SELECT customer_name FROM customer;

SELECT * FROM customer WHERE city = 'Bengaluru';

SELECT * FROM customer WHERE state = 'Karnataka' OR state = 'Goa';

SELECT * FROM customer WHERE city IN ('Bengaluru', 'Mysuru', 'Belagavi');

SELECT * FROM customer WHERE customer_id BETWEEN 3 AND 6;

-- Match customer names starting with 'S' and ending with 'n'
SELECT * FROM customer WHERE customer_name LIKE 'S%n';

-- Distinct states of customers
SELECT DISTINCT state FROM customer;

-- Count of customers per state
SELECT state, COUNT(*) AS customer_count
FROM customer
GROUP BY state;

-- ----------------------------------------------------------------------------
-- 2. Table: product
-- ----------------------------------------------------------------------------
CREATE TABLE product (
    product_id INT,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock INT
);

INSERT INTO product (product_id, product_name, category, price, stock)
VALUES
    (1, 'Laptop', 'Electronics', 55000.00, 10),
    (2, 'Mouse', 'Electronics', 500.00, 50),
    (3, 'Keyboard', 'Electronics', 1200.00, 35),
    (4, 'Headphones', 'Electronics', 2500.00, 20),
    (5, 'Notebook', 'Stationery', 80.00, 100),
    (6, 'Pen', 'Stationery', 20.00, 200),
    (7, 'Backpack', 'Bags', 1500.00, 25),
    (8, 'Water Bottle', 'Kitchen', 600.00, 40),
    (9, 'T-Shirt', 'Clothing', 900.00, 30),
    (10, 'Shoes', 'Footwear', 2200.00, 15);

-- Update stock of product 4 to 0
UPDATE product
SET stock = 0
WHERE product_id = 4;

SELECT * FROM product;

SELECT * FROM product WHERE category = 'Electronics';

SELECT * FROM product WHERE price BETWEEN 1000 AND 10000;

-- Add Primary Key constraint to product
ALTER TABLE product
ADD PRIMARY KEY (product_id);

-- Filter products containing 'te' in name
SELECT * FROM product WHERE product_name LIKE '%te%';

-- Sort products by price ascending
SELECT *
FROM product
ORDER BY price ASC;

-- Sort products by price descending
SELECT *
FROM product
ORDER BY price DESC;

-- Top 5 most expensive products
SELECT *
FROM product
ORDER BY price DESC
LIMIT 5;

-- Product with maximum price (subquery)
SELECT *
FROM product
WHERE price = (SELECT MAX(price) FROM product);

-- Single most expensive product
SELECT *
FROM product
ORDER BY price DESC
LIMIT 1;

-- Top 5 lowest priced products
SELECT *
FROM product
ORDER BY price ASC
LIMIT 5;

-- ----------------------------------------------------------------------------
-- 3. Table: orders
-- ----------------------------------------------------------------------------
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

INSERT INTO orders (order_id, customer_id, order_date, order_status)
VALUES
    (101, 1, '2026-09-01', 'Delivered'),
    (102, 3, '2026-09-03', 'Processing'),
    (103, 5, '2026-09-05', 'Shipping'),
    (104, 2, '2026-09-07', 'Cancelled'),
    (105, 8, '2026-09-10', 'Delivered'),
    (106, 4, '2026-09-12', 'Processing'),
    (107, 10, '2026-09-15', 'Shipping'),
    (108, 6, '2026-09-18', 'Delivered'),
    (109, 12, '2026-09-20', 'Cancelled'),
    (110, 7, '2026-09-22', 'Processing');

-- Modify order_status to ENUM type
ALTER TABLE orders
MODIFY COLUMN order_status ENUM('Delivered', 'Cancelled', 'Shipping', 'Processing');

SELECT * FROM orders;

-- Additional orders
INSERT INTO orders (order_id, customer_id, order_date, order_status)
VALUES
    (111, 1, '2026-01-15', 'Delivered'),
    (112, 1, '2026-02-20', 'Shipping'),
    (113, 3, '2026-03-10', 'Processing'),
    (114, 3, '2026-04-18', 'Delivered'),
    (115, 5, '2026-05-05', 'Cancelled'),
    (116, 5, '2026-06-12', 'Shipping'),
    (117, 2, '2026-07-22', 'Processing'),
    (118, 8, '2026-08-14', 'Delivered'),
    (119, 1, '2026-09-29', 'Processing'),
    (120, 3, '2026-10-05', 'Shipping');

-- Orders in Q1 2026
SELECT *
FROM orders
WHERE order_date BETWEEN '2026-01-01' AND '2026-03-31';

-- Orders placed in August or September
SELECT *
FROM orders
WHERE MONTH(order_date) BETWEEN 8 AND 9;

-- Customers with more than 1 order
SELECT customer_id, COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- ----------------------------------------------------------------------------
-- 4. Table: order_items
-- ----------------------------------------------------------------------------
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

INSERT INTO order_items (order_item_id, order_id, product_id)
VALUES
    (1, 101, 1),
    (2, 101, 3),
    (3, 102, 2),
    (4, 103, 5),
    (5, 104, 1),
    (6, 105, 4),
    (7, 106, 6),
    (8, 107, 2),
    (9, 108, 7),
    (10, 109, 3),
    (11, 110, 8),
    (12, 111, 1),
    (13, 112, 5),
    (14, 113, 9),
    (15, 114, 2),
    (16, 115, 4),
    (17, 116, 6),
    (18, 117, 10),
    (19, 118, 3),
    (20, 119, 7),
    (21, 120, 5);

SELECT * FROM order_items;

-- ----------------------------------------------------------------------------
-- 5. Table: payments
-- ----------------------------------------------------------------------------
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(20),
    payment_status VARCHAR(20),
    amount DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO payments (payment_id, order_id, payment_method, payment_status, amount)
VALUES
    (1, 101, 'Credit Card', 'Success', 2500.00),
    (2, 102, 'UPI', 'Success', 1200.00),
    (3, 103, 'Debit Card', 'Failure', 850.00),
    (4, 104, 'Cash on Delivery', 'Success', 1500.00),
    (5, 105, 'Credit Card', 'Success', 3200.00),
    (6, 106, 'UPI', 'Refund', 950.00),
    (7, 107, 'Debit Card', 'Success', 2100.00),
    (8, 108, 'Cash on Delivery', 'Success', 1750.00),
    (9, 109, 'UPI', 'Failure', 600.00),
    (10, 110, 'Credit Card', 'Success', 4500.00),
    (11, 111, 'Debit Card', 'Success', 1100.00),
    (12, 112, 'UPI', 'Success', 2750.00),
    (13, 113, 'Credit Card', 'Failure', 1800.00),
    (14, 114, 'Cash on Delivery', 'Success', 950.00),
    (15, 115, 'Debit Card', 'Refund', 2200.00),
    (16, 116, 'UPI', 'Success', 1350.00),
    (17, 117, 'Credit Card', 'Success', 3900.00),
    (18, 118, 'Cash on Delivery', 'Failure', 700.00),
    (19, 119, 'UPI', 'Success', 1600.00),
    (20, 120, 'Debit Card', 'Success', 2850.00);

SELECT * FROM payments;

-- Total revenue from successful payments
SELECT SUM(amount) AS total_amount
FROM payments
WHERE payment_status = 'Success';

-- ----------------------------------------------------------------------------
-- 6. Joins
-- ----------------------------------------------------------------------------

-- Inner Join between customer and orders
SELECT *
FROM customer
JOIN orders
    ON customer.customer_id = orders.customer_id;

-- Specific columns from customer and orders join
SELECT c.customer_id,
       o.order_id,
       o.order_date,
       o.order_status
FROM customer c
JOIN orders o
    ON c.customer_id = o.customer_id;

-- Filter customers from Bengaluru
SELECT city
FROM customer c
WHERE c.city = 'Bengaluru';

-- Multi-table Join: customer -> orders -> order_items -> product
SELECT c.customer_id,
       c.customer_name,
       o.order_id,
       o.order_date,
       p.product_name,
       p.price
FROM customer c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN product p
    ON oi.product_id = p.product_id;
