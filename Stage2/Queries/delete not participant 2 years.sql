SELECT s.Soldier_id_, s.First_name_, s.Last_name_
FROM Soldiers s
LEFT JOIN Participant p ON s.Soldier_id_ = p.Soldier_id_
LEFT JOIN Have h ON s.Soldier_id_ = h.Soldier_id_
WHERE (p.Training_id_ IS NULL OR p.Training_id_ NOT IN (
        SELECT p2.Training_id_
        FROM Participant p2
        JOIN Trainings_ t ON p2.Training_id_ = t.Training_id_
        WHERE t.End_date_ >= ADD_MONTHS(SYSDATE, -24)
    )) AND (h.Project_id IS NULL OR h.Project_id NOT IN (
        SELECT h2.Project_id
        FROM Have h2
        JOIN Projects pr ON h2.Project_id = pr.Project_id
        WHERE pr.End_date >= ADD_MONTHS(SYSDATE, -24)
    ));


DELETE FROM Soldiers
WHERE Soldier_id_ IN (
    SELECT s.Soldier_id_
    FROM Soldiers s
    LEFT JOIN Participant p ON s.Soldier_id_ = p.Soldier_id_
    LEFT JOIN Have h ON s.Soldier_id_ = h.Soldier_id_
    WHERE (p.Training_id_ IS NULL OR p.Training_id_ NOT IN (
            SELECT p2.Training_id_
            FROM Participant p2
            JOIN Trainings_ t ON p2.Training_id_ = t.Training_id_
            WHERE t.End_date_ >= ADD_MONTHS(SYSDATE, -24)
        )) AND (h.Project_id IS NULL OR h.Project_id NOT IN (
            SELECT h2.Project_id
            FROM Have h2
            JOIN Projects pr ON h2.Project_id = pr.Project_id
            WHERE pr.End_date >= ADD_MONTHS(SYSDATE, -24)
        ))
);


SELECT s.Soldier_id_, s.First_name_, s.Last_name_
FROM Soldiers s
LEFT JOIN Participant p ON s.Soldier_id_ = p.Soldier_id_
LEFT JOIN Have h ON s.Soldier_id_ = h.Soldier_id_
WHERE (p.Training_id_ IS NULL OR p.Training_id_ NOT IN (
        SELECT p2.Training_id_
        FROM Participant p2
        JOIN Trainings_ t ON p2.Training_id_ = t.Training_id_
        WHERE t.End_date_ >= ADD_MONTHS(SYSDATE, -24)
    )) AND (h.Project_id IS NULL OR h.Project_id NOT IN (
        SELECT h2.Project_id
        FROM Have h2
        JOIN Projects pr ON h2.Project_id = pr.Project_id
        WHERE pr.End_date >= ADD_MONTHS(SYSDATE, -24)
    ));

