CREATE DATABASE ss6;

USE ss6;

CREATE TABLE Customers
(
    customer_id int auto_increment primary key,
    full_name   VARCHAR(255) not null,
    city        VARCHAR(255) not null
);

CREATE TABLE Orders
(
    order_id    int auto_increment primary key,
    customer_id int,
    order_date  date                                       DEFAULT (CURRENT_DATE),
    status      ENUM ('pending', 'completed', 'cancelled') DEFAULT ('pending'),
    CONSTRAINT FK_Order_Customer_id
        FOREIGN KEY (customer_id) REFERENCES Customers (customer_id)
);

INSERT INTO Customers (full_name, city)
VALUES ('Nguyễn Văn Hùng', 'Hà Nội'),
       ('Trần Thị Mai', 'Hồ Chí Minh'),
       ('Lê Văn Long', 'Đà Nẵng'),
       ('Phạm Thu Trang', 'Cần Thơ'),
       ('Hoàng Đức Minh', 'Hải Phòng');

INSERT INTO Orders (customer_id, order_date, status)
VALUES (1, '2024-02-01', 'completed'),
       (2, '2024-02-05', 'pending'),
       (3, '2024-02-10', 'cancelled'),
       (1, '2024-02-12', 'pending'),
       (5, '2024-02-15', 'completed');

SELECT o.order_id, c.full_name, o.order_date, o.status
FROM Orders o
         JOIN Customers c ON o.customer_id = c.customer_id;

SELECT c.customer_id , c.full_name,
       COUNT(o.order_id) AS total_orders
FROM Customers c
LEFT JOIN Orders o ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.full_name ;

SELECT c.customer_id,
       c.full_name,
       COUNT(o.order_id) AS total_orders
FROM Customers c
         LEFT JOIN Orders o ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.full_name
HAVING COUNT(o.order_id) >= 1;