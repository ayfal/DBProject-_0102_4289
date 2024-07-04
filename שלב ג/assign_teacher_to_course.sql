DELIMITER //
CREATE PROCEDURE assign_teacher_to_course(IN p_course_id INT, IN p_teacher_id INT)
BEGIN
    DECLARE course_exists INT;
    DECLARE teacher_exists INT;
    DECLARE error_message VARCHAR(255) DEFAULT '';

    -- Check if the course exists
    SELECT COUNT(*) INTO course_exists FROM course WHERE course_id = p_course_id;
    IF course_exists = 0 THEN
        SET error_message = 'Course does not exist';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_message;
    END IF;

    -- Check if the teacher exists
    SELECT COUNT(*) INTO teacher_exists FROM teacher WHERE id = p_teacher_id;
    IF teacher_exists = 0 THEN
        SET error_message = 'Teacher does not exist';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_message;
    END IF;

    -- Check if the teacher is already assigned to the course
    SELECT COUNT(*) INTO teacher_exists FROM course_teacher WHERE course_id = p_course_id AND teacher_id = p_teacher_id;
    IF teacher_exists > 0 THEN
        SET error_message = 'Teacher is already assigned to the course';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_message;
    END IF;

    -- Attempt to assign teacher to course
    BEGIN
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        BEGIN
            GET DIAGNOSTICS CONDITION 1
            error_message = MESSAGE_TEXT;
            SELECT CONCAT('Error assigning teacher to course: ', error_message) AS detailed_error;
        END;
        INSERT INTO course_teacher (course_id, teacher_id) VALUES (p_course_id, p_teacher_id);
    END;
END;
//
DELIMITER ;