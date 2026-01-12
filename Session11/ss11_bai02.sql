use social_network_pro;

DELIMITER //
CREATE PROCEDURE CalculatePostLikes(in p_post_id int, out total_likes int)
BEGIN
    SET  total_likes =
    (SELECT COUNT(post_id)
    FROM posts
    WHERE user_id = p_post_id);
END //
DELIMITER ;

CALL CalculatePostLikes(1, @total_like);

select @total_like as 'Tổng số Like';

DROP PROCEDURE CalculatePostLikes;