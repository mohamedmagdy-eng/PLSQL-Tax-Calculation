-- 1. Function Definition
CREATE OR REPLACE FUNCTION calculate_tax (p_salary IN NUMBER) 
RETURN NUMBER 
IS 
    v_tax_rate CONSTANT NUMBER := 0.10;
BEGIN
    -- Validate the input salary to ensure data integrity
    IF p_salary IS NULL OR p_salary < 0 THEN
        -- Raise a custom application error for external programs to catch
        RAISE_APPLICATION_ERROR(-20001, 'Salary cannot be null or negative');
    END IF;

    -- Return the calculated tax amount
    RETURN p_salary * v_tax_rate;
END;
/

-- 2. Execution Block
DECLARE
    v_result NUMBER;
BEGIN
    -- Call the function and store the returned value in a variable
    v_result := calculate_tax(5000);
    DBMS_OUTPUT.PUT_LINE('Tax Amount: ' || v_result);

EXCEPTION 
    -- Catch and handle exceptions gracefully
    WHEN OTHERS THEN 
        -- Check if the error is our custom validation error
        IF SQLCODE = -20001 THEN
            DBMS_OUTPUT.PUT_LINE('!! Check the value of the salary again !!');
        ELSE
            -- Handle any other unexpected system errors
            DBMS_OUTPUT.PUT_LINE('!! Unexpected error: ' || SQLERRM);
        END IF;
END;
/