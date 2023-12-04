CREATE OR REPLACE PACKAGE admin_tools_package AS 
    FUNCTION grade_average(class_id IN NUMBER) RETURN NUMBER;
    FUNCTION count_class(course_id IN NUMBER) RETURN NUMBER;
END admin_tools_package;
/



CREATE OR REPLACE PACKAGE BODY admin_tools_package AS
    FUNCTION grade_average (class_id IN NUMBER)
    RETURN NUMBER IS
    v_average NUMBER;
    BEGIN
    SELECT AVG(final_numeric_grade)
    INTO v_average
    FROM enrollments 
    WHERE class_id = grade_average.class_id;

    DBMS_output.put_line('Average Grade: ' || v_average);
    RETURN v_average;
    END grade_average;
    FUNCTION COUNT_CLASS(course_id IN NUMBER)
    RETURN NUMBER IS
    v_count NUMBER := 0;
    BEGIN
   
    FOR j IN (SELECT class_id FROM classes WHERE course_id = COUNT_CLASS.course_id) LOOP
        v_count := v_count + 1;
    END LOOP;
    DBMS_output.put_line('Classes per course ' || course_id || ': ' || v_count);
    RETURN v_count;
    END COUNT_CLASS;
END admin_tools_package;
/
