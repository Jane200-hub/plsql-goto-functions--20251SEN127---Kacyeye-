SET SERVEROUTPUT ON;

DECLARE
    v_salary employees.monthly_salary%TYPE;
    v_name employees.first_name%TYPE;
BEGIN
    SELECT first_name, monthly_salary
    INTO v_name, v_salary
    FROM employees
    WHERE employee_id = 101;

    IF v_salary >= 500000 THEN
        GOTO high_salary;
    ELSIF v_salary >= 300000 THEN
        GOTO average_salary;
    ELSE
        GOTO low_salary;
    END IF;

    <<high_salary>>
    DBMS_OUTPUT.PUT_LINE(v_name || ' has a HIGH salary.');
    GOTO finish;

    <<average_salary>>
    DBMS_OUTPUT.PUT_LINE(v_name || ' has an AVERAGE salary.');
    GOTO finish;

    <<low_salary>>
    DBMS_OUTPUT.PUT_LINE(v_name || ' has a LOW salary.');

    <<finish>>
    DBMS_OUTPUT.PUT_LINE('Salary review completed.');
END;
/
