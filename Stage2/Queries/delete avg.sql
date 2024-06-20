SELECT s.Soldier_id_, s.First_name_, s.Unit_id_, sal.Amount_
FROM Soldiers s
JOIN Salaries sal ON s.Soldier_id_ = sal.Soldier_id_
WHERE sal.Amount_ < (
    SELECT AVG(sal2.Amount_)
    FROM Salaries sal2
    JOIN Soldiers s2 ON sal2.Soldier_id_ = s2.Soldier_id_
    WHERE s2.Unit_id_ = s.Unit_id_
);


DELETE FROM Soldiers
WHERE Soldier_id_ IN (
    SELECT s.Soldier_id_
    FROM Soldiers s
    JOIN Salaries sal ON s.Soldier_id_ = sal.Soldier_id_
    WHERE sal.Amount_ < (
        SELECT AVG(sal2.Amount_)
        FROM Salaries Sal2
        JOIN Soldiers s2 ON sal2.Soldier_id_ = s2.Soldier_id_
        WHERE s2.Unit_id_ = s.Unit_id_
    )
);


SELECT s.Soldier_id_, s.First_name_, s.Unit_id_, sal.Amount_
FROM Soldiers s
JOIN Salaries sal ON s.Soldier_id_ = sal.Soldier_id_
WHERE sal.Amount_ < (
    SELECT AVG(sal2.Amount_)
    FROM Salaries sal2
    JOIN Soldiers s2 ON sal2.Soldier_id_ = s2.Soldier_id_
    WHERE s2.Unit_id_ = s.Unit_id_
);



