-- This is a parameterized query where is the parameter.
WITH TestAverages AS (
SELECT
t.test_id,
t.course_id,
AVG(g.grade) AS average_grade,
YEAR(t.test_date) AS year
FROM
    Test t
JOIN Grade g ON t.test_id = g.test_id
WHERE
    EXTRACT(YEAR FROM t.test_date) = '2023'  -- Use EXTRACT(YEAR FROM ...) to get the year from test_date
GROUP BY
    t.test_id,
    t.course_id
),
CourseAverages AS (
SELECT
course_id, year,
AVG(average_grade) AS average_grade
FROM
TestAverages
GROUP BY
course_id
),
MaxCourseAverage AS (
SELECT
MAX(average_grade) AS max_average_grade
FROM
CourseAverages
)
SELECT
ca.course_id,
c.course_name,
ca.average_grade,
year
#s.semester_name

FROM
CourseAverages ca
JOIN
MaxCourseAverage mca ON ca.average_grade = mca.max_average_grade
JOIN
Course c ON ca.course_id = c.course_id
ORDER BY
ca.course_id;