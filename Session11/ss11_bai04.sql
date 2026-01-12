USE social_network_pro;

DELIMITER //

CREATE PROCEDURE CreatePostWithValidation(IN p_user_id INT, IN p_content VARCHAR(255), OUT result_message VARCHAR(255))
begin
    if CHAR_LENGTH(p_content) < 5 THEN
        SET result_message = 'Nội dung baif viết phải trn 5 ký tự';
    else
        INSERT INTO posts (user_id, content)
        VALUE
            (p_user_id, p_content);
        SET result_message = 'Thêm bài viết thành công';
    end if;
end //

DELIMITER ;

SET @message = '';
CALL CreatePostWithValidation(16,'hi', @message);
SELECT @message as Ket_Qua_Test_1;

CALL CreatePostWithValidation(17,'không học đúp giờ', @message);
SELECT @message as Ket_Qua_Test_2;

SELECT * FROM posts;

DROP PROCEDURE CreatePostWithValidation;