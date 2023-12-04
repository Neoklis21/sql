CREATE TABLE grade_change_history 
(time_stamp DATE,
stu_id NUMBER(7,0), 
class_id NUMBER(6,0),
enroll_date DATE,
old_final_grade CHAR(1), 
new_final_grade CHAR(1));

DROP TABLE grade_change_history;
