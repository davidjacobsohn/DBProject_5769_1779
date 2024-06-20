SELECT s.Soldier_id_, s.First_name_, s.Last_name_, s.Rank_
FROM Soldiers s
WHERE s.Rank_ IN ('Sergeant', 'Staff Sergeant')
AND s.Soldier_id_ IN (
    SELECT p.Soldier_id_
    FROM Participant p
    JOIN Trainings_ t ON p.Training_id_ = t.Training_id_
    JOIN Have h ON p.Soldier_id_ = h.Soldier_id_
    GROUP BY p.Soldier_id_
    HAVING COUNT(DISTINCT t.Training_id_) > 0
    AND COUNT(DISTINCT h.Project_id) > 0
);


UPDATE Soldiers
SET Rank_ = CASE 
    WHEN Rank_ = 'Sergeant' THEN 'Staff Sergeant'
    WHEN Rank_ = 'Staff Sergeant' THEN 'Sergeant Major'
    ELSE Rank_
END
WHERE Rank_ IN ('Sergeant', 'Staff Sergeant')
AND Soldier_id_ IN (
    SELECT p.Soldier_id_
    FROM Participant p
    JOIN Trainings_ t ON p.Training_id_ = t.Training_id_
    JOIN Have h ON p.Soldier_id_ = h.Soldier_id_
    GROUP BY p.Soldier_id_
    HAVING COUNT(DISTINCT t.Training_id_) > 0
    AND COUNT(DISTINCT h.Project_id) > 0
);


SELECT s.Soldier_id_, s.First_name_, s.Last_name_, s.Rank_
FROM Soldiers s
WHERE s.Rank_ IN ('Staff Sergeant', 'Sergeant Major')
AND s.Soldier_id_ IN (
    SELECT p.Soldier_id_
    FROM Participant p
    JOIN Trainings_ t ON p.Training_id_ = t.Training_id_
    JOIN Have h ON p.Soldier_id_ = h.Soldier_id_
    GROUP BY p.Soldier_id_
    HAVING COUNT(DISTINCT t.Training_id_) > 0
    AND COUNT(DISTINCT h.Project_id) > 0
);


