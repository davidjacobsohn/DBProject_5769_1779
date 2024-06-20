SELECT s.Soldier_id_,
       s.First_name_,
       s.Last_name_,
       p.Project_id,
       p.Project_name, 
       EXTRACT(MONTH FROM p.Start_date) AS START_MONTH
FROM Soldiers s
JOIN Have h ON s.Soldier_id_ = h.Soldier_id_
JOIN Projects p ON h.Project_id = p.Project_id
WHERE EXTRACT(MONTH FROM p.Start_date) = 6
ORDER BY s.Last_name_, s.First_name_, p.Start_date;
