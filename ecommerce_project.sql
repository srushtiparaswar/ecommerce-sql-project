CREATE DATABASE ecommerce_db;
USE ecommerce_db;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price INT 
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE 
);
CREATE TABLE order_items (
     order_item_id INT PRIMARY KEY,
     order_id INT,
     product_id INT,
     quantity INT 
);
INSERT INTO customers VALUES
(1, 'Srushti', 'Solapur'),
(2, 'Sneha', 'Pune'),
(3, 'Siddhi', 'Pune'),
(4, 'Shreya', 'Kolhapur'),
(5, 'Tanvi', 'Solapur'),
(6, 'Shrushti', 'Nashik');

INSERT INTO products VALUES
(1, 'Laptop', 50000),
(2, 'Phone', 20000),
(3, 'Headphones', 2000),
(4, 'Laptop', 50000),
(5, 'Phone', 20000),
(6, 'Headphones', 2000);

INSERT INTO orders VALUES
(1, 1, '2024-01-10'),
(2, 2, '2024-01-12'),
(3, 1, '2024-01-15'),
(4, 1, '2024-01-10'),
(5, 2, '2024-01-12'),
(6, 1, '2024-01-15');

INSERT INTO order_items VALUES
(1, 1, 1, 1),
(2, 1, 3, 2),
(3, 2, 2, 1),
(4, 1, 1, 1),
(5, 3, 1, 1),
(6, 1, 3, 2);

SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;

SELECT SUM(p.price * oi.quantity) AS total_sales
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id;

SELECT p.product_name, SUM(oi.quantity) AS total_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 1;

SELECT c.city, COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.city;