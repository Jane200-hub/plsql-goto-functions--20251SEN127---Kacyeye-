SET SERVEROUTPUT ON;

SELECT
    employee_id,
    first_name,
    monthly_salary,
    calculate_annual_salary(monthly_salary) AS annual_salary,
    calculate_years_service(hire_date) AS years_of_service,
    calculate_tax(monthly_salary) AS tax,
    get_department_name(dept_id) AS department
FROM employees
ORDER BY employee_id;
