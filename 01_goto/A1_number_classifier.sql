SET SERVEROUTPUT ON;

DECLARE
    v_number NUMBER := 25;
BEGIN
    IF v_number > 0 THEN
        GOTO positive_number;
    ELSIF v_number < 0 THEN
        GOTO negative_number;
    ELSE
        GOTO zero_number;
    END IF;

    <<positive_number>>
    DBMS_OUTPUT.PUT_LINE('The number is POSITIVE');
    GOTO finish;

    <<negative_number>>
    DBMS_OUTPUT.PUT_LINE('The number is NEGATIVE');
    GOTO finish;

    <<zero_number>>
    DBMS_OUTPUT.PUT_LINE('The number is ZERO');

    <<finish>>
    DBMS_OUTPUT.PUT_LINE('Number classification completed.');
END;
/
