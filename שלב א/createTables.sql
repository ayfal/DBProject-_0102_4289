CREATE TABLE students (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    start_of_study INT
);

CREATE TABLE teacher (
    id INT PRIMARY KEY,
    fname VARCHAR(50),
    lname VARCHAR(50),
    start_learning DATE
);

CREATE TABLE course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    department VARCHAR(100),
    credit_hours INT,
    coordinator_id INT,
    FOREIGN KEY (coordinator_id) REFERENCES teacher(id)
);


CREATE TABLE test (
    test_id INT PRIMARY KEY,
    test_time TIME,
    test_date DATE,
    course_id INT,
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE grade (
    student_id INT,
    test_id INT,
    grade INT,
    PRIMARY KEY (student_id, test_id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (test_id) REFERENCES test(test_id)
);

CREATE TABLE semester (
    semester_id INT PRIMARY KEY,
    semester_name VARCHAR(50),
    start_date DATE,
    end_date DATE
);


CREATE TABLE course_teacher (
    course_id INT,
    teacher_id INT,
    PRIMARY KEY (course_id, teacher_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (teacher_id) REFERENCES teacher(id)
);

CREATE TABLE student_test_participation (
    student_id INT,
    test_id INT,
    PRIMARY KEY (student_id, test_id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (test_id) REFERENCES test(test_id)
);

CREATE TABLE course_semester (
    course_id INT,
    semester_id INT,
    PRIMARY KEY (course_id, semester_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (semester_id) REFERENCES semester(semester_id)
);
