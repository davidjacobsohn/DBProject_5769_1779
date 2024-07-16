CREATE OR REPLACE FUNCTION get_projects (
    soldierId IN NUMBER,
    project_year IN NUMBER
) RETURN SYS_REFCURSOR IS
    project_cursor SYS_REFCURSOR;
BEGIN
    OPEN project_cursor FOR
        SELECT p.Project_id, p.Project_name, p.Start_date, p.End_date
        FROM Projects p
        JOIN Have h ON p.Project_id = h.Project_id
        WHERE h.Soldier_id_ = soldierId
        AND EXTRACT(YEAR FROM p.Start_date) = project_year;

    IF NOT project_cursor%FOUND THEN
        OPEN project_cursor FOR SELECT 'No projects found' AS No_Projects FROM dual;
    END IF;

    RETURN project_cursor;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        OPEN project_cursor FOR SELECT 'No projects found' AS No_Projects FROM dual;
        RETURN project_cursor;
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END get_projects;
/
