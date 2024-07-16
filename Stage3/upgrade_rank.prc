CREATE OR REPLACE PROCEDURE upgrade_rank AS
    updated_count NUMBER := 0;
BEGIN
    FOR soldier_rec IN (
        SELECT s.Soldier_id_, COUNT(h.Project_id) AS project_count
        FROM Soldiers s
        JOIN Have h ON s.Soldier_id_ = h.Soldier_id_
        GROUP BY s.Soldier_id_
    ) LOOP
        IF soldier_rec.project_count > 3 THEN
            UPDATE Soldiers s
            SET Rank_ = (
                SELECT r2.Rank_Name
                FROM Ranks r1
                JOIN Ranks r2 ON r1.Next_Rank_ID = r2.Rank_ID
                WHERE s.Rank_ = r1.Rank_Name
            )
            WHERE Soldier_id_ = soldier_rec.Soldier_id_
            AND EXISTS (
                SELECT 1
                FROM Ranks r1
                WHERE s.Rank_ = r1.Rank_Name
                AND r1.Next_Rank_ID IS NOT NULL
            );

            updated_count := updated_count + 1;
        END IF;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Number of soldiers whose rank was upgraded: ' || updated_count);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found.');
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END upgrade_rank;
/
