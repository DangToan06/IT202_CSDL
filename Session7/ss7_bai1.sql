CREATE DATABASE ss7;

USE ss7;

CREATE TABLE Customers (
    id int auto_increment PRIMARY KEY ,
    name varchar(255) not null ,
    email varchar(255) not null unique
);

CREATE TABLE Orders (
    id int auto_increment PRIMARY KEY ,
    customer_id int,
    order_date date default (CURRENT_DATE),
    total_amount DECIMAL(10,2) not null,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

INSERT INTO Customers (name, email) VALUES
('Nguyễn Văn An', 'an.nguyen@example.com'),
('Trần Thị Bích', 'bich.tran@example.com'),
('Lê Hoàng Nam', 'nam.le@example.com'),
('Phạm Minh Tuấn', 'tuan.pham@example.com'),
('Đặng Thu Thảo', 'thao.dang@example.com'),
('Vũ Đức Duy', 'duy.vu@example.com'),
('Hoàng Thanh Mai', 'mai.hoang@example.com');

INSERT INTO Orders (customer_id, total_amount, order_date) VALUES
(1, 1500.50, '2025-12-20'),
(2, 2990.99, '2025-12-22'),
(1, 450.00, '2025-12-25'),
(3, 12000.00, '2026-01-02'),
(4, 890.90, '2026-01-04'),
(5, 5600.00, '2026-01-05'),
(2, 1200.00, '2026-01-06');

SELECT name , email
FROM Customers
WHERE id IN (
    SELECT customer_id FROM Orders
    );