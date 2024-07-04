DELIMITER //

CREATE FUNCTION calculate_average_grade(p_student_id INT) RETURNS FLOAT
BEGIN
    DECLARE avg_grade FLOAT;
    DECLARE total_grades INT;
    DECLARE grade_count INT;

    -- Handle exceptions
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Return -1 in case of error
        SET avg_grade = -1;
    END;

    -- Calculate total grades and count
    SELECT SUM(grade), COUNT(*) INTO total_grades, grade_count
    FROM grade
    WHERE student_id = p_student_id;

    -- Calculate average
    IF grade_count > 0 THEN
        SET avg_grade = total_grades / grade_count;
    ELSE
        SET avg_grade = 0;
    END IF;

    RETURN avg_grade;
END;
//

DELIMITER ;
