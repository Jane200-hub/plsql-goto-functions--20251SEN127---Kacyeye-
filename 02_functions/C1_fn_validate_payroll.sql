CREATE OR REPLACE FUNCTION validate_payroll (
    p_employee_id NUMBER,
    p_gross_salary NUMBER
)
RETURN VARCHAR2
IS
    v_monthly_salary employees.monthly_salary%TYPE;
BEGIN
    SELECT monthly_salary
    INTO v_monthly_salary
    FROM employees
    WHERE employee_id = p_employee_id;

    IF p_gross_salary = v_monthly_salary THEN
        RETURN 'VALID PAYROLL';
    ELSE
        RETURN 'INVALID PAYROLL';
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'EMPLOYEE NOT FOUND';
END;
/
SHOW ERRORS;
