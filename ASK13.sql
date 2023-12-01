CREATE OR REPLACE FUNCTION COUNT_CLASS(course_id IN NUMBER)
RETURN NUMBER IS
  v_count NUMBER := 0;
BEGIN
   
    FOR j IN (SELECT class_id FROM classes WHERE course_id = COUNT_CLASS.course_id) LOOP
        v_count := v_count + 1;
    END LOOP;
    DBMS_output.put_line('Classes per course ' || course_id || ': ' || v_count);
    RETURN v_count;
END COUNT_CLASS;
/
