USE social_network_pro;

CREATE VIEW view_user_post
AS
SELECT u.user_id, count(p.post_id) AS total_user_post
FROM users u
LEFT JOIN posts p ON u.user_id = p.user_id
GROUP BY user_id;

SELECT * FROM view_user_post;

SELECT u.full_name , vup.total_user_post
FROM view_user_post vup
JOIN users u ON u.user_id = vup.user_id;