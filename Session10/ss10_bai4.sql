USE social_network_pro;

EXPLAIN ANALYZE
SELECT post_id, content, created_at
FROM posts
WHERE user_id = 1;

CREATE INDEX idx_created_at_user_id ON posts(created_at , user_id);

# trước khi tạo chỉ mục thời gian để chạy sẽ tốn hơn sau khi tạo chỉ mục
EXPLAIN ANALYZE
SELECT user_id, username, email
FROM users
WHERE email = 'an@gmail.com';

CREATE UNIQUE INDEX  idx_email ON users(email);

# trước khi tạo chỉ mục time=300e-6..400e-6 sau khi tạo chỉ mục time=0..100e-6

drop index idx_created_at_user_id
on posts;

drop index idx_email
on users;