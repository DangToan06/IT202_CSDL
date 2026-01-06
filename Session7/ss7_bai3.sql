CREATE DATABASE ss7;

USE ss7;


SELECT *
FROM orders
WHERE total_amount > (
    SELECT AVG(total_amount)
    FROM orders
    );