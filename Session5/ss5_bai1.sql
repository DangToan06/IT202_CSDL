CREATE DATABASE ss5;

use ss5;

CREATE TABLE products (
    product_id int auto_increment primary key ,
    product_name varchar(255) NOT NULL ,
    price DECIMAL(10,2) DEFAULT (1000),
    stock INT DEFAULT (0),
    status ENUM( 'active', 'inactive' ),
    sold_quantity int ,
    constraint CK_product_price CHECK ( price >= 0 ),
    constraint CK_product_stock CHECK ( stock >= 0 )
);

INSERT INTO products(product_name, price, stock, status)
VALUES
    ('Bàn chải', 30000, 2, 'active'),
    ('Tivi', 1000000, 5, 'active'),
    ('tủ lạnh', 1500000, 3, 'inactive'),
    ('quạt', 500000, 6, 'inactive'),
    ('điều hòa', 800000, 8, 'active');

SELECT * FROM products;

SELECT * FROM products WHERE status = 'active';

SELECT product_name, price, status FROM products WHERE price > 1000000;

SELECT product_name, price
FROM products
WHERE status = 'active'
ORDER BY price ASC ;