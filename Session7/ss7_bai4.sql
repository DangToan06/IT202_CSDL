CREATE DATABASE ss7;

USE ss7;

SELECT * FROM customers;

SELECT * FROM orders;

INSERT INTO Customers (name, email) VALUES
('Phan Thanh Tùng', 'tung.phan@example.com'),
('Lý Thu Hà', 'ha.ly@example.com'),
('Trịnh Quốc Bảo', 'bao.trinh@example.com'),
('Đỗ Kim Liên', 'lien.do@example.com'),
('Ngô Tiến Dũng', 'dung.ngo@example.com');

INSERT INTO Orders (customer_id, total_amount, order_date) VALUES
(8, 320.00, '2026-01-07'),
(9, 1500.00, '2026-01-07'),
(10, 45.50, '2026-01-08'),
(11, 890.00, '2026-01-08'),
(8, 210.00, '2026-01-09');

SELECT name,
       (SELECT COUNT(*)
        FROM orders
        WHERE customer_id = customers.id) AS total_order
FROM customers ;