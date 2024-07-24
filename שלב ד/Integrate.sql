-- these commands are to be run on our database
CREATE TABLE bank_transfer (
    transfer_id INT PRIMARY KEY,
    amount DECIMAL(10, 2),
    transfer_date DATE,
    description VARCHAR(255),
    outgoing BOOLEAN,
);

CREATE TABLE student_transfers (
    student_id INT,
    transfer_id INT,
    PRIMARY KEY (student_id, transfer_id),
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    FOREIGN KEY (transfer_id) REFERENCES bank_transfer(transfer_id) ON DELETE CASCADE
);

CREATE TABLE teacher_transfers (
    teacher_id INT,
    transfer_id INT,
    PRIMARY KEY (teacher_id, transfer_id),
    FOREIGN KEY (teacher_id) REFERENCES teacher(id) ON DELETE CASCADE,
    FOREIGN KEY (transfer_id) REFERENCES bank_transfer(transfer_id) ON DELETE CASCADE
);

AlTER TABLE course ADD course_cost DECIMAL(10, 2);
ALTER TABLE course ADD professor_pay DECIMAL(10, 2);
ALTER TABLE teacher ADD bank_account VARCHAR(20);
ALTER TABLE teacher ADD date_of_birth DATE;
ALTER TABLE teacher ADD national_id VARCHAR(20);
ALTER TABLE teacher ADD hire_date DATE;
ALTER TABLE teacher ADD department VARCHAR(100);
ALTER TABLE students ADD bank_account VARCHAR(20);
ALTER TABLE students ADD enrollment_date DATE;
UPDATE students SET enrollment_date = CONCAT(CONVERT(start_of_study, CHARACTER), '-09-01');
ALTER TABLE students DROP start_of_study;
ALTER TABLE students ADD major VARCHAR(30);
ALTER TABLE students ADD national_id VARCHAR(20);
ALTER TABLE course_teacher ADD weekly_hours INT;
ALTER TABLE student_course_registration ADD signup_date DATE; 
ALTER TABLE teacher CHANGE fname first_name VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL; 
ALTER TABLE teacher CHANGE lname last_name VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL; 

-- these commands are to be run on the other database
UPDATE person SET person_id = person_id * 10000;
UPDATE course SET course_id = course_id * 10000;

CREATE TABLE person_studnet AS SELECT person.person_id, first_name, last_name, date_of_birth, bank_account, national_id, enrollment_date, major FROM person INNER JOIN student ON person.person_id = student.person_id;
CREATE TABLE person_professor AS SELECT person.person_id, first_name, last_name, date_of_birth, bank_account, national_id, hire_date, department FROM person INNER JOIN professor ON person.person_id = professor.person_id;

ALTER TABLE person_studnet CHANGE person_id id INT(11) NOT NULL; 
ALTER TABLE professor_course CHANGE professor_id teacher_id INT(11) NOT NULL; 
ALTER TABLE student_course ADD semester_id INT NOT NULL DEFAULT '1' AFTER signup_date; 
ALTER TABLE person_professor CHANGE person_id id INT(11) NOT NULL; 
INSERT INTO levdb.teacher (id, first_name, last_name, date_of_birth, bank_account, national_id, hire_date, department) SELECT * FROM person_professor;
INSERT INTO levdb.students (id, first_name, last_name, date_of_birth, bank_account, national_id, enrollment_date, major) SELECT * FROM person_studnet;
INSERT INTO levdb.bank_transfer (transfer_id, amount, transfer_date, description, outgoing) SELECT transfer_id, amount, transfer_date, description, outgoing FROM bank_transfer;
INSERT INTO levdb.student_transfers (student_id, transfer_id) SELECT person_id, transfer_id FROM bank_transfer WHERE person_id IN (SELECT person_id FROM student);
INSERT INTO levdb.teacher_transfers (teacher_id, transfer_id) SELECT person_id, transfer_id FROM bank_transfer WHERE person_id IN (SELECT person_id FROM professor);
INSERT INTO levdb.course (course_id, course_name, course_cost, professor_pay) SELECT * FROM course; 
INSERT INTO levdb.course_teacher (course_id, teacher_id, weekly_hours) SELECT course_id, teacher_id, weekly_hours FROM professor_course;