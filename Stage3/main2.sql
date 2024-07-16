SELECT s.Soldier_id_, s.First_name_, s.Last_name_, s.Rank_, COUNT(h.Project_id) AS project_count
FROM Soldiers s
JOIN Have h ON s.Soldier_id_ = h.Soldier_id_
GROUP BY s.Soldier_id_, s.First_name_, s.Last_name_, s.Rank_
HAVING COUNT(h.Project_id) > 3;


DECLARE
    v_soldier_id NUMBER := &soldeirId;
    v_project_year NUMBER := &year_;
    v_project_cursor SYS_REFCURSOR;
    v_project_record Projects%ROWTYPE;
    v_soldier_exists NUMBER;
BEGIN
    -- בדיקת קיום החייל
    SELECT COUNT(*)
    INTO v_soldier_exists
    FROM Soldiers
    WHERE Soldier_id_ = v_soldier_id;

    IF v_soldier_exists = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Error: Soldier with ID ' || v_soldier_id || ' does not exist.');
        END IF;

    -- זימון הפונקציה get_projects
    v_project_cursor := get_projects(v_soldier_id, v_project_year);
    
    LOOP
        FETCH v_project_cursor INTO v_project_record;
        EXIT WHEN v_project_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Project ID: ' || v_project_record.Project_id || ', Project Name: ' || v_project_record.Project_name || 
                             ', Start Date: ' || v_project_record.Start_date || ', End Date: ' || v_project_record.End_date);
    END LOOP;
    CLOSE v_project_cursor;

    -- זימון הפרוצדורה upgrade_rank
    upgrade_rank;
    DBMS_OUTPUT.PUT_LINE('Rank upgrade process completed.');

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
END;


SELECT s.Soldier_id_, s.First_name_, s.Last_name_, s.Rank_, COUNT(h.Project_id) AS project_count
FROM Soldiers s
JOIN Have h ON s.Soldier_id_ = h.Soldier_id_
GROUP BY s.Soldier_id_, s.First_name_, s.Last_name_, s.Rank_
HAVING COUNT(h.Project_id) > 3;
