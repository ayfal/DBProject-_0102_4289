DELIMITER //

CREATE FUNCTION get_student_courses(p_student_id INT) RETURNS VARCHAR(1000)
BEGIN
    DECLARE course_list VARCHAR(1000) DEFAULT '';
    DECLARE course_name VARCHAR(100);
    DECLARE done INT DEFAULT 0;
    DECLARE course_cursor CURSOR FOR
        SELECT c.course_name
        FROM course c
        JOIN student_test_participation stp ON c.course_id = stp.test_id
        WHERE stp.student_id = p_student_id;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN course_cursor;

    course_loop: LOOP
        FETCH course_cursor INTO course_name;
        IF done THEN
            LEAVE course_loop;
        END IF;
        SET course_list = CONCAT(course_list, course_name, ', ');
    END LOOP;

    CLOSE course_cursor;

    -- Remove the trailing comma and space
    IF CHAR_LENGTH(course_list) > 2 THEN
        SET course_list = LEFT(course_list, CHAR_LENGTH(course_list) - 2);
    END IF;

    RETURN course_list;
END;
//

DELIMITER ;
