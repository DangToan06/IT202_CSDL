USE social_network_pro;

EXPLAIN ANALYZE SELECT * FROM users WHERE hometown = 'Hà Nội';

CREATE INDEX  idx_hometown ON Users(hometown);

DROP INDEX idx_hometown ON users;

# trước khi tạo chỉ mục câu chi phí cpu để chạy sẽ tốn hơn sau khi tạo chỉ mục khoảng gần 1 nửa