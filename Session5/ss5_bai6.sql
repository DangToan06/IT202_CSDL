CREATE DATABASE ss5;

use ss5;

SELECT product_name, price, status
FROM products
WHERE price between 1000000 and 3000000
  and status = 'active'
ORDER BY price ASC
LIMIT 10 OFFSET 0;

SELECT product_name, price, status
FROM products
WHERE price between 1000000 and 3000000
  and status = 'active'
ORDER BY price ASC
LIMIT 10 OFFSET 10;