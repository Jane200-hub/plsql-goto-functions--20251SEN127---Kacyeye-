SET SERVEROUTPUT ON;

SELECT calculate_annual_salary(500000) AS annual_salary FROM dual;
SELECT calculate_years_service(DATE '2023-01-15') AS years_of_service FROM dual;
SELECT calculate_tax(500000) AS tax FROM dual;
SELECT get_department_name(30) AS department FROM dual;

SELECT object_name, object_type, status
FROM user_objects
WHERE object_type = 'FUNCTION'
ORDER BY object_name;
