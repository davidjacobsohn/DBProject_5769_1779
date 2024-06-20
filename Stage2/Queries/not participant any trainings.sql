SELECT 
    s.Soldier_id_, 
    s.First_name_,
    s.Last_name_,  
    u.Unit_name_
FROM 
    Soldiers s
JOIN 
    Units u ON s.Unit_id_ = u.Unit_id_
WHERE 
    s.Soldier_id_ NOT IN (SELECT p.Soldier_id_ FROM Participant p);
