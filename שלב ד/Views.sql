CREATE VIEW grade_view as SELECT students.id, students.first_name, students.last_name , grade.grade, grade.test_id FROM students, grade WHERE students.id = grade.student_id;

-- גליון ציונים של סטודנט מסויים
SELECT * FROM grade_view WHERE id =4;

-- ציוני כל הסטודנטים במבחן מסויים
SELECT * FROM grade_view WHERE test_id = 3;




CREATE VIEW tuition as SELECT students.id, students.first_name, students.last_name, student_transfers.student_id, bank_transfer.amount, bank_transfer.transfer_date, bank_transfer.description, bank_transfer.outgoing FROM students, student_transfers, bank_transfer WHERE students.id = student_transfers.student_id AND student_transfers.transfer_id = bank_transfer.transfer_id;

-- דוח תשלומי שכר לימוד של סטודנט
SELECT * FROM tuition WHERE id = 60000 AND outgoing = 0;

-- דוח תקבולים של שנה מסויימת
SELECT * FROM tuition WHERE transfer_date BETWEEN '2020-01-01' AND '2020-12-31';
