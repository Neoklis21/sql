CREATE OR REPLACE PACKAGE enrollments_package AS 
   PROCEDURE enroll_student(v_stu_id IN NUMBER, v_class_id IN NUMBER);
   PROCEDURE drop_student(v_stu_id IN NUMBER, v_class_id IN NUMBER);
   PROCEDURE ten_years(v_stu_id IN NUMBER, v_class_id IN NUMBER);
END enrollments_package;
/

CREATE OR REPLACE PACKAGE BODY enrollments_package AS 
     PROCEDURE enroll_student(v_stu_id IN NUMBER, v_class_id IN NUMBER)
     AS
     BEGIN
        INSERT INTO enrollments (enrollment_date, class_id, stu_id, final_numeric_grade, final_letter_grade, status)
        VALUES (TO_DATE('2023/11/28', 'yyyy/mm/dd'), v_class_id, v_stu_id, NULL, NULL, 'enrolled');
        EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            DBMS_output.put_line('Student ' || v_stu_id || ' is already enrolled in Class ' || v_class_id);
           
        COMMIT; 
    END enroll_student;
    PROCEDURE drop_student(v_stu_id IN NUMBER, v_class_id IN NUMBER)
    AS
    BEGIN
    DELETE ENROLLMENTS WHERE class_id = v_class_id and stu_id = v_stu_id ;
    
    
       IF SQL%NOTFOUND THEN
            DBMS_output.put_line('Student ' || v_stu_id || ' is not in Class ' || v_class_id);
       END IF;
     
    END drop_student ;
    PROCEDURE ten_years(v_stu_id IN NUMBER, v_class_id IN NUMBER)
    AS
    today  DATE;
    ten_years_ago DATE;
    BEGIN
     today := SYSDATE;
     ten_years_ago := ADD_MONTHS(today, -12*10);
    
    FOR I IN (SELECT CLASS_ID, ENROLLMENT_DATE, STATUS 
              FROM ENROLLMENTS 
              WHERE STU_ID = v_stu_id AND ten_years_ago < ENROLLMENT_DATE) 
    LOOP
        DBMS_OUTPUT.PUT_LINE('Class ID: ' || I.CLASS_ID);
        DBMS_OUTPUT.PUT_LINE('Enrollment Date: ' || TO_CHAR(I.ENROLLMENT_DATE, 'YYYY-MM-DD'));
        DBMS_OUTPUT.PUT_LINE('Status: ' || I.STATUS);
    END LOOP;
    END ten_years;
END enrollments_package;
/
