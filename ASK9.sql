CREATE OR REPLACE PROCEDURE c_assigment (
    v_assessment_id IN NUMBER, 
    v_description IN VARCHAR2
)
AS
BEGIN
   
    INSERT INTO assessments (assessment_id, description, grading_criteria)
    VALUES (v_assessment_id, v_description, 'numeric');

    
    DBMS_OUTPUT.PUT_LINE('Assignment created successfully. ASSESSMENT_ID: ' || v_assessment_id);
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK;
END c_assigment;
/
