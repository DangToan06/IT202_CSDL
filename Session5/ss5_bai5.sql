CREATE DATABASE ss5;

use ss5;

INSERT INTO orders (order_id, customer_id, total_amount, order_date, status) VALUES
(108, 3, 250000.00, '2023-12-18', 'cancelled'),
(109, 1, 8900000.00, '2023-12-20', 'completed'),
(110, 6, 1500000.00, '2023-12-22', 'pending'),
(111, 2, 340000.00, '2023-12-24', 'completed'),
(112, 4, 12500000.00, '2023-12-25', 'completed'),
(113, 1, 670000.00, '2023-12-28', 'pending'),
(114, 5, 150000.00, '2023-12-29', 'cancelled'),
(115, 6, 4200000.00, '2024-01-02', 'completed'),
(116, 2, 880000.00, '2024-01-05', 'completed'),
(117, 3, 450000.00, '2024-01-08', 'completed'),
(118, 4, 2100000.00, '2024-01-10', 'pending'),
(119, 1, 5600000.00, '2024-01-12', 'completed'),
(120, 5, 990000.00, '2024-01-15', 'completed');

SELECT *
FROM orders
WHERE status <> 'cancelled'
LIMIT 5 OFFSET 0;

SELECT *
FROM orders
WHERE status <> 'cancelled'
LIMIT 5 OFFSET 5;

SELECT *
FROM orders
WHERE status <> 'cancelled'
LIMIT 5 OFFSET 10;
