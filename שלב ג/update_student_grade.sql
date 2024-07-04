DELIMITER //

CREATE PROCEDURE update_student_grade(IN p_student_id INT, IN p_test_id INT, IN p_new_grade INT)
BEGIN
    DECLARE old_grade INT;

    -- Handle exceptions
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Output error message
        SELECT 'Error updating grade';
    END;

    -- Update grade
    SELECT grade INTO old_grade FROM grade WHERE student_id = p_student_id AND test_id = p_test_id;

    IF old_grade IS NOT NULL THEN
        UPDATE grade SET grade = p_new_grade WHERE student_id = p_student_id AND test_id = p_test_id;
    ELSE
        INSERT INTO grade (student_id, test_id, grade) VALUES (p_student_id, p_test_id, p_new_grade);
    END IF;
END;
//

DELIMITER ;