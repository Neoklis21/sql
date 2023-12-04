UPDATE enrollments
SET final_letter_grade = 'N'
WHERE stu_id = 101;

SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER audit_grade_change
BEFORE UPDATE ON enrollments
FOR EACH ROW
DECLARE
    today DATE;
BEGIN
    today := SYSDATE ;
    IF :OLD.final_letter_grade != :NEW.final_letter_grade THEN
        INSERT INTO grade_change_history (
            time_stamp,
            stu_id,
            class_id,
            enroll_date,
            old_final_grade,
            new_final_grade
        ) VALUES (
            today, 
            :OLD.stu_id,
            :OLD.class_id,
            :OLD.enrollment_date,
            :OLD.final_letter_grade,
            :NEW.final_letter_grade
        );
    ELSE
        DBMS_output.put_line('Edwses ton idio bathmo');
    END IF;
END;
/

