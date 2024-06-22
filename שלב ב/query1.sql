# get the top 10% of students with the highest average grades, of a given year
WITH StudentAverages AS (
    SELECT
        students.id,
        students.first_name,
        students.last_name,
        AVG(grade.grade) AS average_grade,
    	YEAR(test.test_date) AS year
    FROM
        students
    JOIN grade ON students.id = grade.student_id
    JOIN test ON grade.test_id = test.test_id
    WHERE
        YEAR(test.test_date) = '2023'
    GROUP BY
        students.id
),
RankedStudents AS (
    SELECT
        *,
        ROW_NUMBER() OVER (ORDER BY average_grade DESC) AS rank
    FROM
        StudentAverages
),
TotalStudents AS (
    SELECT COUNT(*) AS total
    FROM students
)
SELECT
    id,
    first_name,
    last_name,
    average_grade,
    year
FROM
    RankedStudents,
    TotalStudents
WHERE
    rank <= total * 0.10
ORDER BY
    average_grade DESC;