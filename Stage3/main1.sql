select u.unit_id_, u.unit_name_, u.rank_rating from units u

DECLARE
    v_soldier_id NUMBER := 33084;
    v_avg_salary NUMBER;
BEGIN
    
        -- זימון הפונקציה calculate_average_salary
        v_avg_salary := calculate_average_salary(v_soldier_id);
        DBMS_OUTPUT.PUT_LINE('Average salary for soldier ID ' || v_soldier_id || ' is: ' || v_avg_salary);
    

    
        -- זימון הפרוצדורה update_unit_rank_rating
        update_unit_rank_rating;
        DBMS_OUTPUT.PUT_LINE('Unit rank rating update process completed.');

    EXCEPTION
     WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
commit;   
END;

select u.unit_id_, u.unit_name_, u.rank_rating from units u

