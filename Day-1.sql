-- ============================================================================
-- Day 1: Basic Table Creation, Data Insertion, Filtering, and Aggregation
-- ============================================================================

-- Create customer/products table
CREATE TABLE customer (
    product_id INT PRIMARY KEY,
    prod_name VARCHAR(50),
    color VARCHAR(20),
    price INT,
    quantity INT
);

-- Insert sample records
INSERT INTO customer (product_id, prod_name, color, price, quantity)
VALUES
    (1, 'onitsuka tiger shoes', 'white', 1200, 1),
    (2, 'onitsuka tiger shoes', 'black', 1400, 1),
    (3, 'campus shoes', 'white', 1000, 2),
    (4, 'puma shoes', 'grey', 5000, 1),
    (5, 'adidas shoes', 'white', 4500, 1);

-- 1. Display all records
SELECT * FROM customer;

-- 2. Find product names where price is greater than 4000
SELECT prod_name
FROM customer
WHERE price > 4000;

-- 3. Find all products with color 'white'
SELECT *
FROM customer
WHERE color = 'white';

-- 4. Find products with price between 1200 and 5000
SELECT *
FROM customer
WHERE price BETWEEN 1200 AND 5000;

-- 5. Find products where color is either 'white' or 'black'
SELECT *
FROM customer
WHERE color IN ('white', 'black');

-- 6. Sort products by price in ascending order
SELECT *
FROM customer
ORDER BY price ASC;

-- 7. Count products grouped by quantity
SELECT quantity, COUNT(*) AS total_products
FROM customer
GROUP BY quantity;

-- 8. Group by quantity and filter groups having count > 0
SELECT quantity, COUNT(*) AS total_products
FROM customer
GROUP BY quantity
HAVING COUNT(*) > 0;

-- 9. Retrieve the first 3 products
SELECT *
FROM customer
LIMIT 3;

-- 10. Retrieve the top 2 most expensive products
SELECT *
FROM customer
ORDER BY price DESC
LIMIT 2;