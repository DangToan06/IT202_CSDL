CREATE DATABASE ss9;

USE ss9;

CREATE TABLE Creator(
    creator_id varchar(5) PRIMARY KEY ,
    creator_name varchar(100) not null ,
    creator_email varchar(100) not null unique ,
    creator_phone varchar(15) not null unique ,
    creator_platform varchar(50) not null
);

CREATE TABLE Studio(
    studio_id varchar(5) primary key ,
    studio_name varchar(100) not null ,
    studio_location varchar(100) not null ,
    hourly_price DECIMAL(10,2) not null ,
    studio_status varchar(20) not null
);

CREATE TABLE LiveSession(
    session_id int auto_increment primary key ,
    creator_id varchar(5) not null ,
    studio_id varchar(5) not null ,
    session_date date not null ,
    duration_hours int not null ,
    FOREIGN KEY (creator_id) REFERENCES Creator(creator_id),
    FOREIGN KEY (studio_id) REFERENCES Studio(studio_id)
);

CREATE TABLE Payment(
    payment_id int auto_increment primary key ,
    session_id int not null ,
    payment_method varchar(50) not null ,
    payment_amount DECIMAL(10,2) not null,
    payment_date date not null ,
    FOREIGN KEY (session_id) REFERENCES LiveSession(session_id)
);

INSERT INTO Creator (creator_id, creator_name, creator_email, creator_phone, creator_platform)
VALUES
    ('CR01', 'Nguyen Van A', 'a@live.com', '0901111111', 'Tiktok'),
    ('CR02', 'Tran Thi B', 'b@live.com', '0902222222', 'Youtube'),
    ('CR03', 'Le Minh C', 'c@live.com', '0903333333', 'Facebook'),
    ('CR04', 'Pham Thi D', 'd@live.com', '0904444444', 'Tiktok'),
    ('CR05', 'Vu Hoang E', 'e@live.com', '0905555555', 'Shopee live');

INSERT INTO Studio (studio_id, studio_name, studio_location, hourly_price, studio_status)
VALUES
    ('ST01', 'Studio A', 'Ha Noi', '20.00', 'Available'),
    ('ST02', 'Studio B', 'HCM', '25.00', 'Available'),
    ('ST03', 'Studio C', 'Danang', '30.00', 'Booked'),
    ('ST04', 'Studio D', 'Ha Noi', '22.00', 'Available'),
    ('ST05', 'Studio E', 'Can Tho', '18.00', 'Maintenance');

INSERT INTO LiveSession (creator_id, studio_id, session_date, duration_hours)
VALUES
    ('CR01', 'ST01', '2025-05-01', 3),
    ('CR02', 'ST02', '2025-05-02', 4),
    ('CR03', 'ST03', '2025-05-03', 2),
    ('CR01', 'ST04', '2025-05-04', 5),
    ('CR05', 'ST02', '2025-05-05', 1);

INSERT INTO Payment (session_id, payment_method, payment_amount, payment_date)
VALUES
    (1, 'Cash', 60.00, '2025-05-01'),
    (2, 'Credit Card', 100.00, '2025-05-02'),
    (3, 'Bank Transfer', 60.00, '2025-05-03'),
    (4, 'Credit Card', 110.00, '2025-05-04'),
    (5, 'Cash', 25.00, '2025-05-05');

# Cập nhật & Xóa dữ liệu


# Cập nhật creator_platform của creator CR03 thành "YouTube"
UPDATE Creator
SET creator_platform = 'YouTube'
WHERE creator_id = 'CR03';

# Do studio ST05 hoạt động trở lại, cập nhật studio_status = 'Available' và giảm hourly_price 10%
UPDATE Studio
SET hourly_price = Studio.hourly_price - Studio.hourly_price*0.1 ,
    studio_status = 'Available'
WHERE studio_id = 'ST05';

# Xóa các payment có payment_method = 'Cash' và payment_date trước ngày 2025-05-03
DELETE FROM Payment
WHERE payment_method = 'Cash' and payment_date <= '2025-05-03';



# TRUY VẤN DỮ LIỆU CƠ BẢN

# Liệt kê studio có studio_status = 'Available' và hourly_price > 20
SELECT * FROM Studio
WHERE studio_status = 'Available' AND  hourly_price > 20;

# Lấy thông tin creator (creator_name, creator_phone) có nền tảng là TikTok
SELECT creator_name,  creator_phone
FROM Creator
WHERE creator_platform = 'TikTok';

# Hiển thị danh sách studio gồm studio_id, studio_name, hourly_price sắp xếp theo giá thuê giảm dần
SELECT studio_id , studio_name, hourly_price
FROM Studio
ORDER BY hourly_price DESC ;

# Lấy 3 payment đầu tiên có payment_method = 'Credit Card'
SELECT * FROM Payment
WHERE payment_method = 'Credit Card'
LIMIT 3 OFFSET 0;

# Hiển thị danh sách creator gồm creator_id, creator_name bỏ qua 2 bản ghi đầu và lấy 2 bản ghi tiếp theo
SELECT creator_id, creator_name
FROM Creator
LIMIT 2 OFFSET 2;


# TRUY VẤN DỮ LIỆU NÂNG CAO

# Hiển thị danh sách livestream gồm: session_id, creator_name, studio_name, duration_hours, payment_amount
SELECT LS.session_id, C.creator_name, s.studio_name, LS.duration_hours, P.payment_date
FROM LiveSession LS
JOIN Creator C on LS.creator_id = C.creator_id
JOIN Studio S on LS.studio_id = S.studio_id
JOIN Payment P on LS.session_id = P.session_id;

# Liệt kê tất cả studio và số lần được sử dụng (kể cả studio chưa từng được thuê)
SELECT s.studio_name, COUNT(LS.studio_id) AS Count
FROM Studio s
LEFT JOIN LiveSession LS ON s.studio_id = LS.studio_id
GROUP BY s.studio_id;

# Tính tổng doanh thu theo từng payment_method
SELECT payment_method , SUM(payment_amount) AS total_amount
FROM Payment
GROUP BY payment_method;

# Thống kê số session của mỗi creator chỉ hiển thị creator có từ 2 session trở lên
SELECT C.creator_name , COUNT(LS.creator_id) AS totalLive
FROM Creator C
LEFT JOIN LiveSession LS ON C.creator_id = LS.creator_id
GROUP BY C.creator_id
HAVING totalLive >= 2;

# Lấy studio có hourly_price cao hơn mức trung bình của tất cả studio
SELECT studio_name , hourly_price
FROM Studio
WHERE hourly_price > (
    SELECT AVG(hourly_price) AS hourlyAVG
    FROM Studio);

# Hiển thị creator_name, creator_email của những creator đã từng livestream tại Studio B
SELECT C.creator_name, C.creator_email
FROM LiveSession LS
JOIN Creator c ON LS.creator_id = c.creator_id
WHERE studio_id = 'ST02';

# Hiển thị báo cáo tổng hợp gồm: session_id, creator_name, studio_name, payment_method, payment_amount
SELECT LS.session_id, C.creator_name, S.studio_name, P.payment_method, P.payment_amount
FROM LiveSession LS
JOIN Creator C on LS.creator_id = C.creator_id
JOIN Payment P on LS.session_id = P.session_id
JOIN Studio S on LS.studio_id = S.studio_id;
