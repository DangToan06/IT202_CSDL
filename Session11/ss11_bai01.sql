use social_network_pro;

DELIMITER //
create procedure p_user_id(id int)
BEGIN
    SELECT post_id, content, created_at
    FROM posts
    WHERE user_id = id;
end //

DELIMITER ;

CALL p_user_id(1);

CALL p_user_id(2);

DROP PROCEDURE IF EXISTS p_user_id;