CREATE DATABASE ss7;

USE ss7;

CREATE TABLE Products(
    id int auto_increment PRIMARY KEY ,
    name varchar(255) not null unique ,
    price DECIMAL(10,2) not null
);

CREATE TABLE Order_items(
    order_id int ,
    product_id int ,
    quantity int not null check ( quantity >= 0 ),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES Products(id)
);

INSERT INTO Products (name, price) VALUES
('iPhone 15 Pro', 999.00),
('Samsung Galaxy S24', 850.00),
('MacBook Air M3', 1200.00),
('Chuột không dây Logitech', 25.50),
('Bàn phím cơ Akko', 75.00),
('Tai nghe Sony WH-1000XM5', 350.00),
('Màn hình Dell UltraSharp', 450.00);

INSERT INTO Order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),
(2, 3, 1),
(3, 5, 1),
(4, 2, 1),
(5, 6, 1),
(6, 7, 2);

SELECT *
FROM Products
WHERE id IN (
    SELECT product_id
    FROM Order_items
    );