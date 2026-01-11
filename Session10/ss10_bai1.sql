USE social_network_pro;

CREATE VIEW view_users_firstname
AS
SELECT user_id, username, full_name, email, created_at
FROM users
WHERE full_name LIKE 'Nguyễn%'
WITH CHECK OPTION ;


SELECT * FROM view_users_firstname;

INSERT INTO users (username, full_name, email, password, birthdate, hometown)
VALUES
    ('Toàn', 'Nguyễn Văn Toàn', 'toannv@gmail.com', '19920903', '1992-09-03', 'HaNoi');

DELETE FROM users
WHERE user_id = 26;