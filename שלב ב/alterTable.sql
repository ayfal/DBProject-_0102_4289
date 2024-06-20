
ALTER TABLE course DROP FOREIGN KEY coordinator_id;
ALTER TABLE course
ADD CONSTRAINT coordinator_id
FOREIGN KEY (coordinator_id)
REFERENCES teacher(id)
ON DELETE CASCADE;

course_ibfk_1

ALTER TABLE test DROP FOREIGN KEY course_id;
ALTER TABLE test
ADD CONSTRAINT course_id
FOREIGN KEY (course_id)
REFERENCES course(course_id)
ON DELETE CASCADE;


ALTER TABLE grade DROP FOREIGN KEY student_id;
ALTER TABLE grade DROP FOREIGN KEY test_id;
ALTER TABLE grade
ADD CONSTRAINT student_id
FOREIGN KEY (student_id)
REFERENCES students(id)
ON DELETE CASCADE;

ALTER TABLE grade
ADD CONSTRAINT test_id
FOREIGN KEY (test_id)
REFERENCES test(test_id)
ON DELETE CASCADE;




ALTER TABLE course_teacher DROP FOREIGN KEY course_id;
ALTER TABLE course_teacher DROP FOREIGN KEY teacher_id;
ALTER TABLE course_teacher
ADD CONSTRAINT course_id
FOREIGN KEY (course_id)
REFERENCES  course(course_id)
ON DELETE CASCADE;

ALTER TABLE course_teacher
ADD CONSTRAINT teacher_id
FOREIGN KEY (teacher_id)
REFERENCES teacher(id)
ON DELETE CASCADE;



ALTER TABLE student_test_participation DROP FOREIGN KEY student_id;
ALTER TABLE student_test_participation DROP FOREIGN KEY test_id;
ALTER TABLE student_test_participation
ADD CONSTRAINT student_id
FOREIGN KEY (student_id)
REFERENCES  tudents(id)
ON DELETE CASCADE;

ALTER TABLE student_test_participation
ADD CONSTRAINT test_id
FOREIGN KEY (test_id)
REFERENCES test(test_id)
ON DELETE CASCADE;



ALTER TABLE course_semester DROP FOREIGN KEY course_id;
ALTER TABLE course_semester DROP FOREIGN KEY semester_id;
ALTER TABLE course_semester
ADD CONSTRAINT course_id
FOREIGN KEY (course_id)
REFERENCES  course(course_id)
ON DELETE CASCADE;

ALTER TABLE course_semester
ADD CONSTRAINT semester_id
FOREIGN KEY (semester_id)
REFERENCES semester(semester_id)
ON DELETE CASCADE;
