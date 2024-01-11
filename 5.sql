CREATE OR REPLACE TYPE REecord AS OBJECT (
    COUNTRY_id  VARCHAR2(100),
    LANGUAGE_id VARCHAR2(100),
    OFFICIAL VARCHAR2(10)
);


CREATE OR REPLACE TYPE language_table_type AS TABLE OF REecord;


CREATE OR REPLACE PROCEDURE country_languages (
    p_country_id IN VARCHAR2,
    p_languages_id OUT language_table_type
)
AS
BEGIN
   
    p_languages_id := language_table_type();
    
    FOR reca IN (
        SELECT COUNTRY_id, LANGUAGE_id, OFFICIAL
        FROM SPOKEN_LANGUAGES
        WHERE COUNTRY_id = p_country_id
    ) LOOP
        p_languages_id.extend;
        p_languages_id(p_languages_id.count) := rEecord(reca.COUNTRY_id, reca.LANGUAGE_id, reca.OFFICIAL);
    END LOOP;
    
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20001, 'An error occurred: ' || SQLERRM);
END country_languages;
/

-- Step 5: Test the country_languages procedure
DECLARE
    -- Declare a variable of type language_table_type
    v_languages language_table_type;
BEGIN
    -- Call the country_languages procedure with a specific country name
    country_languages('USA', v_languages);
    
    -- Loop through the returned nested table and print the results
    FOR i IN 1..v_languages.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Country Name: ' || v_languages(i).COUNTRY_NAME);
        DBMS_OUTPUT.PUT_LINE('Language Name: ' || v_languages(i).LANGUAGE_NAME);
        DBMS_OUTPUT.PUT_LINE('Official: ' || v_languages(i).OFFICIAL);
        DBMS_OUTPUT.PUT_LINE('------------------------------------------');
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/


SET SERVEROUTPUT ON; 


DECLARE
    -- Declare a variable of type language_table_type
    v_languages language_table_type;
BEGIN
    -- Call the country_languages procedure with a specific country name
    country_languages('USA', v_languages);
    
    -- Loop through the returned nested table and print the results
    FOR i IN 1..v_languages.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Country ID: ' || v_languages(i).COUNTRY_id);
        DBMS_OUTPUT.PUT_LINE('Language ID: ' || v_languages(i).LANGUAGE_id);
        DBMS_OUTPUT.PUT_LINE('Official: ' || v_languages(i).OFFICIAL);
        DBMS_OUTPUT.PUT_LINE('------------------------------------------');
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
