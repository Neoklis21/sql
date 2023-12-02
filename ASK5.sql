CREATE OR REPLACE PROCEDURE learn (
    v_instr_id IN NUMBER,
    v_course_id IN NUMBER
)
AS
    v_class_id classes.class_id%TYPE;
    v_stu_id enrollments.stu_id%TYPE;
    v_first_name students.first_name%TYPE;
    v_last_name students.last_name%TYPE;
    v_status enrollments.status%TYPE;
BEGIN
    FOR i IN (SELECT c.class_id
              FROM classes c
              WHERE c.instr_id = v_instr_id AND c.course_id = v_course_id)
    LOOP
        v_class_id := i.class_id;

        FOR j IN (SELECT e.stu_id, e.status
                  FROM enrollments e
                  WHERE e.class_id = v_class_id)
        LOOP
            v_stu_id := j.stu_id;
            v_status := j.status;

            FOR x IN (SELECT s.first_name, s.last_name
                      FROM students s
                      WHERE s.stu_id = v_stu_id)
            LOOP
                v_first_name := x.first_name;
                v_last_name := x.last_name;

                DBMS_OUTPUT.PUT_LINE('First Name: ' || v_first_name);
                DBMS_OUTPUT.PUT_LINE('Last Name: ' || v_last_name);
                DBMS_OUTPUT.PUT_LINE('Status: ' || v_status);
                DBMS_OUTPUT.PUT_LINE('Class Id: ' || v_class_id);
                DBMS_OUTPUT.PUT_LINE(CHR(10));
            END LOOP;
        END LOOP;
    END LOOP;
END learn;
/
