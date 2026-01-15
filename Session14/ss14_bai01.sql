CREATE DATABASE social_network;
USE social_network;

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    posts_count INT DEFAULT 0
);

CREATE TABLE posts (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    content TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO users (username) VALUES ('nguyen_van_a');

DELIMITER //

CREATE PROCEDURE AddPostTransaction(IN p_user_id INT, IN p_content TEXT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Thất bại: Đã thực hiện ROLLBACK do lỗi hệ thống hoặc ràng buộc dữ liệu.' AS KetQua;
    END;

    START TRANSACTION;

    INSERT INTO posts (user_id, content) VALUES (p_user_id, p_content);

    UPDATE users SET posts_count = posts_count + 1 WHERE user_id = p_user_id;

    COMMIT;
    SELECT 'Thành công: Đã thêm bài viết và cập nhật posts_count.' AS KetQua;
END //

DELIMITER ;

# Trường hợp thành công
CALL AddPostTransaction(1, 'Hôm nay trời đẹp quá!');

SELECT * FROM users WHERE user_id = 1;

-- Trường hợp gây lỗi cố ý
CALL AddPostTransaction(999, 'Bài viết này sẽ gây lỗi');

SELECT * FROM posts;