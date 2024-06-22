DELETE FROM teacher WHERE teacher.start_learning < year(CURRENT_DATE()) - 35;

DELETE FROM teacher WHERE teacher.id NOT IN (SELECT teacher.id FROM course_teacher);

SELECT grade.grade FROM grade WHERE grade.test_id = 135;

CREATE PROCEDURE UpdateGrades1(IN factor DECIMAL(5, 2), IN test_to_update INT, IN min_grade INT) BEGIN UPDATE grade SET grade = LEAST(grade * (1 + factor/100), 100) WHERE test_id = test_to_update AND grade >= min_grade; END;
CALL UpdateGrades1(10, 135, 50);

SELECT grade.grade FROM grade WHERE grade.test_id = 135;

SELECT grade.student_id, grade.test_id, grade.grade FROM grade WHERE grade.test_id = 3 AND student_id = 706;

CREATE PROCEDURE UpdateGrade10(IN addition_grade INT, IN student INT, IN test INT) BEGIN UPDATE grade SET grade = LEAST(grade + addition_grade, 100) WHERE test_id = test AND student_id = student; END;
CALL UpdateGrade10(-7, 706, 3);
SELECT * FROM grade WHERE grade.test_id = 3 AND student_id = 706;

-- prepare the statement with placeholders PREPARE stmt FROM 'SELECT AVG(g.grade) AS average_grade FROM grade g JOIN test t ON g.test_id = t.test_id WHERE t.test_date BETWEEN ? AND ?'; 
-- set the parameters SET @start_date = '2023-01-01'; SET @end_date = '2023-06-30'; 
-- execute the prepared statement with the parameters EXECUTE stmt USING @start_date, @end_date;

-- ParamsQueries query 2
-- Prepare the statement with placeholders
PREPARE stmt FROM 'SELECT * FROM students s, grade g WHERE g.grade = ?';
-- Set the parameters
SET @random_grade = '67';
-- Execute the prepared statement with the parameters
EXECUTE stmt USING @random_grade;
--Deallocate the prepared statement
DEALLOCATE PREPARE stmt;