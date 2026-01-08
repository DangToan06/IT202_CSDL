CREATE DATABASE HN_KS24_CNTT1_DangQuocToan;

use HN_KS24_CNTT1_DangQuocToan;

CREATE TABLE guests (
    guest_id INT PRIMARY KEY AUTO_INCREMENT,
    guest_name VARCHAR(100),
    phone VARCHAR(20) UNIQUE
);

CREATE TABLE rooms (
    room_id INT PRIMARY KEY AUTO_INCREMENT,
    room_type VARCHAR(50),
    price_per_day DECIMAL(10,0)
);

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    guest_id INT,
    room_id INT,
    check_in DATE,
    check_out DATE,
    FOREIGN KEY (guest_id) REFERENCES guests(guest_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id),
    CONSTRAINT ck_booking_checkout CHECK ( check_out >= check_in )
);

INSERT INTO guests (guest_name, phone) VALUES
('Nguyễn Văn An', '0901111111'),
('Trần Thị Bình', '0902222222'),
('Lê Văn Cường', '0903333333'),
('Phạm Thị Dung', '0904444444'),
('Hoàng Văn Em', '0905555555');

INSERT INTO rooms (room_type, price_per_day) VALUES
('Standard', 500000),
('Standard', 500000),
('Deluxe', 800000),
('Deluxe', 800000),
('VIP', 1500000),
('VIP', 2000000);

INSERT INTO bookings (guest_id, room_id, check_in, check_out) VALUES
(1, 1, '2024-01-10', '2024-01-12'),
(1, 3, '2024-03-05', '2024-03-10'),
(2, 2, '2024-02-01', '2024-02-03'),
(2, 5, '2024-04-15', '2024-04-18'),
(3, 4, '2023-12-20', '2023-12-25'),
(3, 6, '2024-05-01', '2024-05-06'),
(4, 1, '2024-06-10', '2024-06-11');

# PHẦN I – TRUY VẤN DỮ LIỆU CƠ BẢN

# Liệt kê tên khách và số điện thoại của tất cả khách hàng

SELECT guest_name, phone
FROM guests;

# Liệt kê các loại phòng khác nhau trong khách sạn

SELECT DISTINCT room_type FROM rooms;

# Hiển thị các phòng có giá thuê lớn hơn 1.000.000

SELECT room_type, price_per_day
FROM rooms
WHERE price_per_day > 1000000;

# Liệt kê các lần đặt phòng diễn ra trong năm 2024

SELECT * FROM bookings WHERE check_in between '2024-01-01' AND '2024-12-31';

# Cho biết số lượng phòng của từng loại phòng

SELECT room_type , COUNT(room_type) AS count
FROM rooms
GROUP BY room_type;

# PHẦN II – TRUY VẤN NÂNG CAO

# Hãy liệt kê danh sách các lần đặt phòng, Với mỗi lần đặt phòng, hãy hiển thị:
# Tên khách hàng
# Loại phòng đã đặt
# Ngày nhận phòng (check_in)

SELECT g.guest_name, r.room_type, check_in
FROM bookings b
LEFT JOIN guests g ON b.guest_id = g.guest_id
LEFT JOIN rooms r on r.room_id = b.room_id;

# Cho biết mỗi khách đã đặt phòng bao nhiêu lần

SELECT g.guest_name , COUNT(b.room_id) AS total_booking
FROM guests g
LEFT JOIN bookings b ON g.guest_id = b.guest_id
GROUP BY guest_name;

# Tính doanh thu của mỗi phòng, với công thức: “Doanh thu = số ngày ở × giá thuê theo ngày”

SELECT r.room_type, SUM(DATEDIFF(b.check_out, b.check_in) * r.price_per_day) AS total_revenue
FROM rooms r
LEFT JOIN bookings b on r.room_id = b.room_id
GROUP BY r.room_id;

# Hiển thị tổng doanh thu của từng loại phòng

SELECT
    r.room_type,
    SUM(IFNULL(DATEDIFF(b.check_out, b.check_in), 0) * r.price_per_day) AS total_revenue
FROM rooms r
LEFT JOIN bookings b ON r.room_id = b.room_id
GROUP BY r.room_type;

# Tìm những khách đã đặt phòng từ 2 lần trở lên

SELECT g.guest_name , COUNT(b.room_id) AS total_booking
FROM guests g
LEFT JOIN bookings b ON g.guest_id = b.guest_id
GROUP BY guest_name
HAVING total_booking >= 2;

# Tìm loại phòng có số lượt đặt phòng nhiều nhất

select r.room_type,
       count(b.booking_id) as booking_count
from bookings b
         join rooms r on r.room_id = b.room_id
group by r.room_type
order by booking_count desc
limit 1;
