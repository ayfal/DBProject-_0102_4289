DELIMITER //

CREATE PROCEDURE main_for_grades()
BEGIN
    DECLARE student_id INT DEFAULT 1;
    DECLARE test_id INT DEFAULT 1;
    DECLARE new_grade INT DEFAULT 95;
    DECLARE avg_grade FLOAT;

    -- Call procedure to update grade
    CALL update_student_grade(student_id, test_id, new_grade);
    
    -- Call function to calculate average grade
    SET avg_grade = calculate_average_grade(student_id);

    -- Output the average grade
    SELECT avg_grade;
END;
//

DELIMITER ;
