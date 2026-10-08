CREATE OR REPLACE FUNCTION get_department_name (
    p_dept_id NUMBER
)
RETURN VARCHAR2
IS
    v_dept_name VARCHAR2(50);
BEGIN
    SELECT dept_name
    INTO v_dept_name
    FROM departments
    WHERE dept_id = p_dept_id;

    RETURN v_dept_name;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Department Not Found';
END;
/
SHOW ERRORS;
