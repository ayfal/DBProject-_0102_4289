DELIMITER //

CREATE PROCEDURE main_for_courses()
BEGIN
    DECLARE student_id INT DEFAULT 1;
    DECLARE course_id INT DEFAULT 1;
    DECLARE teacher_id INT DEFAULT 1;
    DECLARE courses VARCHAR(1000);

    -- Call procedure to assign teacher to course
    CALL assign_teacher_to_course(course_id, teacher_id);
    
    -- Call function to get student's courses
    SET courses = get_student_courses(student_id);

    -- Output the list of courses
    SELECT courses;

    -- the DECLARE and the SET are just to put in more programmatic stuff
END;
//

DELIMITER ;
