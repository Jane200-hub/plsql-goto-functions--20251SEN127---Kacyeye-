SET SERVEROUTPUT ON;

-- Part 1: Intentional illegal GOTO demonstration.
-- This block is expected to fail compilation because GOTO attempts
-- to jump into a nested block.
DECLARE
    v_number NUMBER := 10;
BEGIN
    GOTO inside_block;

    DECLARE
        v_inner NUMBER := 10;
    BEGIN
        <<inside_block>>
        DBMS_OUTPUT.PUT_LINE(v_inner);
    END;
END;
/

-- Part 2: Corrected version.
DECLARE
    v_number NUMBER := 10;
BEGIN
    GOTO display_number;

    <<display_number>>
    DBMS_OUTPUT.PUT_LINE('Number: ' || v_number);
END;
/
