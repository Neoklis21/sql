CREATE OR REPLACE FUNCTION grade_average (class_id IN NUMBER)
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
/
