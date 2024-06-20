SELECT s.Soldier_id_, s.First_name_, s.Last_name_, sal.amount_
FROM Soldiers s
JOIN salaries sal ON s.Soldier_id_ = sal.soldier_id_
WHERE sal.amount_ < (
    SELECT AVG(sal2.amount_)
    FROM salaries sal2
    JOIN Soldiers s2 ON sal2.Soldier_id_ = s2.Soldier_id_
    WHERE s2.Unit_id_ = s.Unit_id_
)
AND s.Soldier_id_ IN (
    SELECT h.Soldier_id_
    FROM Have h
    GROUP BY h.Soldier_id_
    HAVING COUNT(h.Project_id) > 1 
);


UPDATE salaries sal
SET sal.amount_ = sal.amount_ * 1.10
WHERE sal.Soldier_id_ IN (
    SELECT s.Soldier_id_
    FROM Soldiers s
    JOIN salaries sal ON s.Soldier_id_ = sal.Soldier_id_
    WHERE sal.amount_ < (
        SELECT AVG(sal2.amount_)
        FROM salaries sal2
        JOIN Soldiers s2 ON sal2.Soldier_id_ = s2.Soldier_id_
        WHERE s2.Unit_id_ = s.Unit_id_
    )
    AND s.Soldier_id_ IN (
        SELECT h.Soldier_id_
        FROM Have h
        GROUP BY h.Soldier_id_
        HAVING COUNT(h.Project_id) > 1
    )
);


SELECT s.Soldier_id_, s.First_name_, s.Last_name_, sal.amount_
FROM Soldiers s
JOIN salaries sal ON s.Soldier_id_ = sal.soldier_id_
WHERE sal.amount_ < (
    SELECT AVG(sal2.amount_)
    FROM salaries sal2
    JOIN Soldiers s2 ON sal2.Soldier_id_ = s2.Soldier_id_
    WHERE s2.Unit_id_ = s.Unit_id_
)
AND s.Soldier_id_ IN (
    SELECT h.Soldier_id_
    FROM Have h
    GROUP BY h.Soldier_id_
    HAVING COUNT(h.Project_id) > 1 
);


