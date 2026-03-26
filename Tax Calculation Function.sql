-- 1. Function Definition with Progressive Logic
CREATE OR REPLACE FUNCTION calculate_tax (p_salary IN NUMBER) 
RETURN NUMBER 
IS 
    v_tax_rate NUMBER;
BEGIN
    -- Ensure the salary is a valid positive number
    IF p_salary IS NULL OR p_salary < 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Salary cannot be null or negative');
    END IF;
        
    -- Applying Progressive Tax Brackets
    IF p_salary <= 5000 THEN
        v_tax_rate := 0.05;   -- 5% Rate
    ELSIF p_salary <= 10000 THEN
        v_tax_rate := 0.10;   -- 10% Rate
    ELSE
        v_tax_rate := 0.15;   -- 15% Rate
    END IF;
        
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
