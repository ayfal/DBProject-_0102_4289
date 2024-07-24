CREATE VIEW grade_view as SELECT students.id, students.first_name,students.students, grade.grade, grade.test_id

-- גליון ציונים של סטודנט מסויים
SELECT * FROM grade_view WHERE id =4




CREATE VIEW tuition as SELECT students.id,students.first_name,students.last_name, student_transfers.student_id,bank_transfer.amount,bank_transfer.transfer_date,bank_transfer.description,bank_transfer.outgoing

-- דוח תשלומי שכר לימוד של סטודנט
SELECT * FROM `tuition` WHERE id = 4 AND outgoing = 1;
