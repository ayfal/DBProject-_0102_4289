SELECT
    t.start_learning AS seniority,
    AVG(g.grade) AS average_grade
FROM
    grade g
JOIN
    test te ON g.test_id = te.test_id
JOIN
    course c ON te.course_id = c.course_id
JOIN
    course_teacher ct ON c.course_id = ct.course_id
JOIN
    teacher t ON ct.teacher_id = t.id
GROUP BY
    t.start_learning
ORDER BY average_grade DESC;