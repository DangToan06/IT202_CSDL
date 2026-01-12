use social_network_pro;

DELIMITER //

CREATE PROCEDURE CalculateBonusPoints(IN p_user_id INT, INOUT p_bonus_points INT)
BEGIN
    DECLARE temp INT DEFAULT 0;

    SELECT COUNT(post_id) INTO temp
    FROM posts
    WHERE user_id = p_user_id;
    IF temp >= 20 THEN
        SET p_bonus_points = p_bonus_points + 100;
    ELSEIF temp >= 10 THEN
        SET p_bonus_points = p_bonus_points + 50;
    END IF;
END //

DELIMITER ;

SET @points_1 = 0;
CALL CalculateBonusPoints(1, @points_1);
SELECT @points_1;

SET @points_18 = 0;
CALL CalculateBonusPoints(18, @points_18);
SELECT @points_18;

DROP PROCEDURE CalculateBonusPoints;