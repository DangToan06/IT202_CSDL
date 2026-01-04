CREATE DATABASE ss5;

use ss5;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    total_amount DECIMAL(10,2),
    order_date DATE,
    status ENUM('pending', 'completed', 'cancelled'),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders (order_id, customer_id, total_amount, order_date, status) VALUES
(101, 1, 1500000.00, '2023-12-01', 'completed'),
(102, 2, 550000.50, '2023-12-05', 'pending'),
(103, 1, 200000.00, '2023-12-07', 'cancelled'),
(104, 4, 3200000.00, '2023-12-10', 'completed'),
(105, 5, 120000.00, '2023-12-12', 'pending'),
(106, 6, 450000.00, '2023-12-15', 'completed'),
(107, 2, 5100000, '2023-12-12', 'completed');

SELECT *
FROM orders
WHERE status = 'completed';

SELECT *
FROM orders
WHERE total_amount > 5000000;

SELECT *
FROM orders
ORDER BY order_date DESC
LIMIT 5 OFFSET 0;

SELECT *
FROM orders
WHERE status = 'completed'
ORDER BY total_amount DESC ;