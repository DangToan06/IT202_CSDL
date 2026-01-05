CREATE DATABASE ss6;

USE ss6;

ALTER TABLE orders
ADD COLUMN total_amount DECIMAL(10,2) NOT NULL;

SELECT * FROM orders;


UPDATE Orders
SET total_amount = 1500000
WHERE order_id = 1;

UPDATE Orders
SET total_amount = 550000
WHERE order_id = 2;

UPDATE Orders
SET total_amount = 200000
WHERE order_id = 3;

UPDATE Orders
SET total_amount = 890000
WHERE order_id = 4;

UPDATE Orders
SET total_amount = 3200000
WHERE order_id = 5;

SELECT c.full_name , SUM(o.total_amount)
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY full_name;

SELECT c.full_name , MAX(o.total_amount)
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY full_name;

SELECT c.full_name , SUM(o.total_amount) AS total
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY full_name
HAVING total >= 0
ORDER BY total DESC ;