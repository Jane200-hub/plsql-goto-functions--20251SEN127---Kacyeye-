CREATE OR REPLACE FUNCTION calculate_annual_salary (
    p_monthly_salary NUMBER
)
RETURN NUMBER
IS
BEGIN
    RETURN p_monthly_salary * 12;
END;
/
SHOW ERRORS;
