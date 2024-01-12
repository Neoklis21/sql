CREATE OR REPLACE PROCEDURE country_demographics(
  p_country_name IN VARCHAR2
) AS
  
  TYPE country_details_type IS RECORD (
    country_name   VARCHAR2(100),
    location       VARCHAR2(100),
    capitol        VARCHAR2(100),
    population     NUMBER,
    airports       NUMBER,
    climate        VARCHAR2(100)
  );
  
 
  l_country_details country_details_type;
BEGIN
  
  SELECT country_name, location, capitol, population, airports, climate
  INTO l_country_details.country_name, l_country_details.location, l_country_details.capitol,
       l_country_details.population, l_country_details.airports, l_country_details.climate
  FROM COUNTRIES   
  WHERE country_name = p_country_name;
  
  -- Display the country demographics using DBMS_OUTPUT
  DBMS_OUTPUT.PUT_LINE('Country Name: ' || l_country_details.country_name);
  DBMS_OUTPUT.PUT_LINE('Location: ' || l_country_details.location);
  DBMS_OUTPUT.PUT_LINE('Capitol: ' || l_country_details.capitol);
  DBMS_OUTPUT.PUT_LINE('Population: ' || TO_CHAR(l_country_details.population));
  DBMS_OUTPUT.PUT_LINE('Airports: ' || TO_CHAR(l_country_details.airports));
  DBMS_OUTPUT.PUT_LINE('Climate: ' || l_country_details.climate);
  
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20001, 'Country ' || p_country_name || ' does not exist.');
END country_demographics;
/

SET SERVEROUTPUT ON ;

BEGIN
  country_demographics('Federal Democratic Republic of Ethiopia');
END;
/
