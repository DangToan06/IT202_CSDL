CREATE DATABASE ss5;

use ss5;

ALTER TABLE products
ADD sold_quantity int;

SELECT * FROM products;

update products
SET sold_quantity = 7
WHERE product_id = 1 OR product_id = 5;

update products
SET sold_quantity = 3
WHERE product_id = 2 OR product_id = 3;

update products
SET sold_quantity = 15
WHERE product_id = 4;

INSERT INTO products (product_name, price, stock, status, sold_quantity)
VALUES
    ('Laptop Dell XPS 13', 25990000.00, 15, 'active', 45),
    ('iPhone 15 Pro Max', 34500000.00, 20, 'active', 120),
    ('Chuột không dây Logitech', 450000.00, 100, 'active', 500),
    ('Bàn phím cơ Keychron', 1850000.00, 35, 'active', 60),
    ('Tai nghe Sony WH-1000XM5', 6490000.00, 10, 'active', 25),
    ('Màn hình LG UltraGear 24"', 3200000.00, 0, 'inactive', 80),
    ('Sạc dự phòng Anker 20000mAh', 890000.00, 50, 'active', 210),
    ('Loa Bluetooth JBL Flip 6', 2400000.00, 25, 'active', 75),
    ('Ổ cứng SSD Samsung 1TB', 2100000.00, 40, 'active', 90),
    ('RAM Desktop Corsair 16GB', 1250000.00, 60, 'active', 150),
    ('Case máy tính NZXT', 1900000.00, 0, 'inactive', 30),
    ('Ghế công thái học', 4500000.00, 5, 'active', 15),
    ('Webcam Logitech C920', 1600000.00, 12, 'active', 200),
    ('Máy tính bảng iPad Air 5', 15500000.00, 18, 'active', 40),
    ('Đồng hồ thông minh Garmin', 5800000.00, 8, 'active', 55);

SELECT product_name, price, sold_quantity
FROM products
ORDER BY sold_quantity DESC
LIMIT 10 OFFSET 0;

SELECT product_name, price, sold_quantity
FROM products
ORDER BY sold_quantity DESC
LIMIT 5 OFFSET 10;

SELECT product_name, price, sold_quantity
FROM products
WHERE price < 2000000
ORDER BY sold_quantity DESC;