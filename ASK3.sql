CREATE OR REPLACE PROCEDURE ten_years (
    v_stu_id IN NUMBER,
    v_class_id IN NUMBER
    
)
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
/
