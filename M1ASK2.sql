CREATE OR REPLACE PROCEDURE find_region_and_currency(
  p_country_name  IN  VARCHAR2,
  p_country_details OUT SYS.ODCIVARCHAR2LIST
) AS
  TYPE country_details_type IS RECORD (
    country_name   VARCHAR2(100),
    region         VARCHAR2(100),
    currency       VARCHAR2(50)
  );
  
  l_country_details country_details_type;
BEGIN
  SELECT country_name, region_ID, currency_CODE
  INTO l_country_details.country_name, l_country_details.region, l_country_details.currency
  FROM COUNTRIES   
  WHERE country_name = p_country_name;
  p_country_details := SYS.ODCIVARCHAR2LIST(l_country_details.country_name, l_country_details.region, l_country_details.currency);
  DBMS_OUTPUT.PUT_LINE('Country Name: ' || l_country_details.country_name);
  DBMS_OUTPUT.PUT_LINE('Region: ' || l_country_details.region);
  DBMS_OUTPUT.PUT_LINE('Currency: ' || l_country_details.currency);
  
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20001, 'Country ' || p_country_name || ' does not exist.');
END find_region_and_currency;
/
SET SERVEROUTPUT ON;


DECLARE
  l_country_details SYS.ODCIVARCHAR2LIST;
BEGIN

  find_region_and_currency('Federal Democratic Republic of Ethiopia', l_country_details);
  FOR i IN 1..l_country_details.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE(l_country_details(i));
  END LOOP;
END;
/
