SET SERVEROUTPUT ON;

SELECT
    payroll_id,
    employee_id,
    gross_salary,
    validate_payroll(employee_id, gross_salary) AS validation
FROM payroll
ORDER BY payroll_id;

SELECT validate_payroll(101, 400000) AS validation FROM dual;
SELECT validate_payroll(999, 400000) AS validation FROM dual;
