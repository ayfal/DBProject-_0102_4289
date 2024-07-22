CREATE TABLE BANK_TRANSFER (
    transfer_id INT PRIMARY KEY,
    person_id INT,
    amount DECIMAL(10, 2),
    transfer_date DATE,
    description VARCHAR(255),
    outgoing BOOLEAN,
    FOREIGN KEY (person_id) REFERENCES student(id) ON DELETE CASCADE
    FOREIGN KEY (person_id) REFERENCES teacher(id) ON DELETE CASCADE
);

CREATE TABLE student_transfers (
    student_id INT,
    transfer_id INT,
    PRIMARY KEY (student_id, transfer_id),
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    FOREIGN KEY (transfer_id) REFERENCES BANK_TRANSFER(transfer_id) ON DELETE CASCADE
);

CREATE TABLE teacher_transfers (
    teacher_id INT,
    transfer_id INT,
    PRIMARY KEY (teacher_id, transfer_id),
    FOREIGN KEY (teacher_id) REFERENCES teacher(id) ON DELETE CASCADE,
    FOREIGN KEY (transfer_id) REFERENCES BANK_TRANSFER(transfer_id) ON DELETE CASCADE
);

AlTER TABLE course ADD COLUMN course_cost DECIMAL(10, 2);
ALTER TABLE course ADD COLUMN professor_pay DECIMAL(10, 2);