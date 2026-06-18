-- Practical Use of DISTINCT in SQL

-- Objective: To understand and apply the DISTINCT keyword in SQL queries. This focuses on eliminating
-- duplicates and ensuring unique data.

-- Scenario: You are working for an e-commerce platform. Your task is to help clean up the database for a
-- product analytics report. The database contains an "orders" table, which records every order placed on the
-- platform. Some customers have placed multiple orders for the same product, so you need to ensure that only
-- unique products are listed in your analysis.

CREATE DATABASE ecommerce_db;
USE ecommerce_db;

CREATE TABLE Orders (
    Order_ID INT,
    Customer_ID INT,
    Product_Name VARCHAR(50),
    Order_Date DATE
);

INSERT INTO Orders
VALUES
(101, 104, 200, 'Laptop', '2025-01-15'),
(102, 105, 201, 'Phone', '2025-01-16'),
(103, 106, 202, 'Laptop', '2025-01-17'),
(104, 200, 200, 'Tablet', '2025-01-18'),
(105, 201, 203, 'Phone', '2025-01-19'),
(106, 202, 204, 'Laptop', '2025-01-20');

Alter table Orders
drop column Product_ID;

select * from Orders;

-- Unique Products: Write a SQL query that will return a list of unique products ordered by customers (i.e.,
-- without duplicates)

SELECT DISTINCT Product_Name
FROM Orders;

-- Unique Customers: Write a SQL query to find out how many unique products were ordered by each
-- customer. The result should show the customer’s ID and the number of distinct products they’ve ordered

SELECT
    Customer_ID,
    COUNT(DISTINCT Product_Name) AS Unique_Products
FROM Orders
GROUP BY Customer_ID;

-- Distinct Product Count: Write a query to count the number of distinct products ordered on the platform. This
-- should return a single number

SELECT COUNT(DISTINCT Product_Name) AS Total_Distinct_Products
FROM Orders;

-- Sorting by Most Recent Orders: Write a SQL query that returns the most recent distinct products ordered,
-- sorted by the order date in descending order. Limit the result to the top 3 most recent products.

SELECT DISTINCT Product_Name, Order_Date
FROM Orders
ORDER BY Order_Date DESC
LIMIT 3;

-- Combining DISTINCT, LIMIT, and ORDER BY in SQL

-- Objective: To practice using DISTINCT, LIMIT, and ORDER BY together for filtering and sorting data.
-- Scenario: You are working with the same e-commerce platform, but now you are tasked with analyzing which
-- products are the most popular in terms of orders. You are required to focus on the top products ordered within
-- the last month.

INSERT INTO Orders
VALUES
(107, 205, 'Phone', '2025-02-01'),
(108, 206, 'Tablet', '2025-02-02');

select * from Orders;

-- Top Products in the Last Month: Write a SQL query to return the top 2 most ordered distinct products from
-- the last month. Sort the results by order date in descending order and limit the output to the top 2

SELECT
    product_name,
    COUNT(*) AS total_orders
FROM orders
WHERE YEAR(order_date) = 2025
  AND MONTH(order_date) = 2
GROUP BY product_name
ORDER BY total_orders DESC
LIMIT 2;

-- Unique Products for Specific Customer: Write a SQL query to return the distinct products ordered by
-- customer 200, sorted by the order date in descending order. Limit the result to 3 products

SELECT
    product_name
FROM orders
WHERE customer_id = 200
GROUP BY product_name
ORDER BY MAX(order_date) DESC
LIMIT 3;

-- Top N Products: Write a SQL query to retrieve the top 5 most ordered products based on the number of
-- distinct orders, sorted by product name in ascending order. Limit the result to the top 5

SELECT
    product_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM orders
GROUP BY product_name
ORDER BY total_orders DESC
LIMIT 5;

-- Unique Orders for Each Product: Write a SQL query to count the distinct number of orders placed for each
-- product. Sort the results by the number of distinct orders in descending order.

SELECT
    product_name,
    COUNT(DISTINCT order_id) AS distinct_orders
FROM orders
GROUP BY product_name
ORDER BY distinct_orders DESC;


