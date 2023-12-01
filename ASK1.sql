CREATE OR REPLACE PROCEDURE enroll_student (
    v_stu_id IN NUMBER,
    v_class_id IN NUMBER
)
AS
BEGIN
        INSERT INTO enrollments (enrollment_date, class_id, stu_id, final_numeric_grade, final_letter_grade, status)
    VALUES (TO_DATE('2023/11/28', 'yyyy/mm/dd'), v_class_id, v_stu_id, NULL, NULL, 'enrolled');
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            DBMS_output.put_line('Student ' || v_stu_id || ' is already enrolled in Class ' || v_class_id);
           
    COMMIT; 
END enroll_student;
/
