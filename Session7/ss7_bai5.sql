CREATE DATABASE ss7;

USE ss7;



SELECT name , (
    SELECT SUM(total_amount)
    FROM orders
    WHERE customer_id = customers.id
    ) AS total
FROM customers
HAVING total = (SELECT MAX(total_spent)
        FROM (
            SELECT SUM(total_amount) AS total_spent
            FROM Orders
            GROUP BY customer_id
        ) AS summary);



