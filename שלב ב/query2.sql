# Check which lecturer has the best average
  WITH TestAverages AS (
    SELECT
        t.test_id,
        AVG(g.grade) AS average_grade
    FROM
        Test t
    JOIN Grade g ON t.test_id = g.test_id
    GROUP BY
        t.test_id
),
CourseAverages AS (
    SELECT
        c.course_id,
        c.coordinator_ID AS lecturer_id,
        AVG(ta.average_grade) AS average_grade
    FROM
        Course c
    JOIN Test t ON c.course_id = t.course_id
    JOIN TestAverages ta ON t.test_id = ta.test_id
    GROUP BY
        c.course_id,
        c.coordinator_ID
),
LecturerAverages AS (
    SELECT
        l.id AS lecturer_id,
        l.fname,
        l.lname,
        AVG(ca.average_grade) AS average_grade
    FROM
        teacher l
    JOIN CourseAverages ca ON l.id = ca.lecturer_id
    GROUP BY
        l.id,
        l.fname,
        l.lname
),
MaxAverage AS (
    SELECT
        MAX(average_grade) AS max_average_grade
    FROM
        LecturerAverages
)
SELECT
    la.lecturer_id,
    la.fname,
    la.lname,
    la.average_grade
FROM
    LecturerAverages la
        JOIN
    MaxAverage ma ON la.average_grade = ma.max_average_grade
ORDER BY
    la.lecturer_id;