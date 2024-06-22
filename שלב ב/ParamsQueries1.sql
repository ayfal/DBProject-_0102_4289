-- ParamsQueries query 1
-- Prepare the statement with placeholders
PREPARE stmt FROM 'SELECT AVG(g.grade) AS average_grade
                   FROM grade g
                   JOIN test t ON g.test_id = t.test_id
                   WHERE t.test_date BETWEEN ? AND ?';

-- Set the parameters
SET @start_date = '2023-01-01';
SET @end_date = '2023-06-30';

-- Execute the prepared statement with the parameters
EXECUTE stmt USING @start_date, @end_date;

-- Deallocate the prepared statement (optional)
DEALLOCATE PREPARE stmt;


-- ParamsQueries query 2
-- Prepare the statement with placeholders
PREPARE stmt FROM 'SELECT *
                   FROM students s, grade g
                   WHERE g.grade = ?';

-- Set the parameters
SET @random_grade = '67';

-- Execute the prepared statement with the parameters
EXECUTE stmt USING @random_grade;

-- Deallocate the prepared statement (optional)
DEALLOCATE PREPARE stmt;



-- ParamsQueries query 3
PREPARE stmt FROM 'SELECT
        students.id,
        students.first_name,
        students.last_name,
        AVG(grade.grade) AS average_grade
		FROM students, grade WHERE grade.student_id = ? AND students.id = ?';
        
-- Set the parameters
SET @num_id = '26';

-- Execute the prepared statement with the parameters
EXECUTE stmt USING @num_id, @num_id ;

-- Deallocate the prepared statement (optional)
DEALLOCATE PREPARE stmt;



-- ParamsQueries query 4

