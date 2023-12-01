CREATE OR REPLACE FUNCTION grade (n_numeric IN NUMBER)
RETURN VARCHAR2 IS
BEGIN
    IF n_numeric >= 90 THEN
        RETURN 'A';
    ELSIF n_numeric >= 80 AND n_numeric < 90 THEN
        RETURN 'B';
    ELSIF n_numeric >= 70 AND n_numeric < 80 THEN
        RETURN 'C';
    ELSIF n_numeric >= 60 AND n_numeric < 70 THEN
        RETURN 'D';
    ELSE
        RETURN 'F';
    END IF;
END grade;
/
