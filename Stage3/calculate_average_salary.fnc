CREATE OR REPLACE FUNCTION calculate_average_salary(soldierId IN NUMBER) RETURN NUMBER IS
    total_salary NUMBER := 0; 
    salary_count NUMBER := 0;
    avg_salary NUMBER;
    TYPE salary_ref_cursor IS REF CURSOR; 
    salary_cursor salary_ref_cursor;
    salary_amount Salaries.Amount_%TYPE; 
BEGIN
    OPEN salary_cursor FOR
        SELECT amount_ FROM Salaries WHERE soldier_id_ = soldierId;
        
    LOOP
        FETCH salary_cursor INTO salary_amount;
        EXIT WHEN salary_cursor%NOTFOUND; 
        total_salary := total_salary + salary_amount; 
        salary_count := salary_count + 1;
    END LOOP;
    
    CLOSE salary_cursor; 
    
    IF salary_count > 0 THEN
        avg_salary := total_salary / salary_count;
    ELSE
        avg_salary := 0;
    END IF;
    
    RETURN avg_salary; 
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
    WHEN OTHERS THEN
        ROLLBACK; 
        RAISE;
END calculate_average_salary;
/
