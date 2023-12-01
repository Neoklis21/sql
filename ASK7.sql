CREATE OR REPLACE FUNCTION student_class (class_id IN NUMBER)
RETURN NUMBER IS
   v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM enrollments 
    WHERE class_id = class_id;

    DBMS_output.put_line('Student Count: ' || v_count);
    
    RETURN v_count; 
END student_class;
/
