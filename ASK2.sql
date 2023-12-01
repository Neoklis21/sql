CREATE  OR REPLACE PROCEDURE drop_student (
    v_stu_id IN NUMBER,
    v_class_id IN NUMBER
)
AS
BEGIN
    DELETE ENROLLMENTS WHERE class_id = v_class_id and stu_id = v_stu_id ;
    
    
       IF SQL%NOTFOUND THEN
            DBMS_output.put_line('Student ' || v_stu_id || ' is not in Class ' || v_class_id);
       END IF;
     
END drop_student ;
/
