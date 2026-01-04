CREATE DATABASE ss5;

use ss5;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(255),
    email VARCHAR(255),
    city VARCHAR(255),
    status ENUM('active', 'inactive')
);

INSERT INTO customers (customer_id, full_name, email, city, status) VALUES
(1, 'Nguyễn Văn An', 'an.nguyen@example.com', 'Hà Nội', 'active'),
(2, 'Trần Thị Bích', 'bich.tran@gmail.com', 'Hồ Chí Minh', 'active'),
(3, 'Lê Hoàng Nam', 'nam.le@company.vn', 'Đà Nẵng', 'inactive'),
(4, 'Phạm Minh Tuấn', 'tuan.pham@web.com', 'Cần Thơ', 'active'),
(5, 'Hoàng Thu Thủy', 'thuy.hoang@test.com', 'Hải Phòng', 'inactive'),
(6, 'Đỗ Đức Thắng', 'thang.do@xyz.com', 'Nha Trang', 'active'),
(7, 'Trần Văn A', 'a.tran@gmail.com', 'Hà Nội', 'inactive');

SELECT full_name, email, city , status
FROM customers;

SELECT full_name, email, city , status
FROM customers
WHERE city = 'Hồ Chí Minh';

SELECT full_name, email, city, status
FROM customers
WHERE city = 'Hà Nội'
  AND status = 'active';

SELECT full_name
FROM customers
ORDER BY full_name ASC ;