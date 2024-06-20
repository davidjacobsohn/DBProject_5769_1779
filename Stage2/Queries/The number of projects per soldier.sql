SELECT 
    Soldiers.Soldier_id_, 
    Soldiers.First_name_, 
    Soldiers.Last_name_, 
    COUNT(Have.Project_id) AS NUM_PROJECTS
FROM 
    Soldiers
JOIN 
    Have ON Soldiers.Soldier_id_ = Have.Soldier_id_
GROUP BY 
    Soldiers.Soldier_id_, Soldiers.First_name_, Soldiers.Last_name_
ORDER BY 
    NUM_PROJECTS DESC;
