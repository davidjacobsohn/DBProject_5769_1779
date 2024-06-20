SELECT 
    s.Soldier_id_, 
    s.First_name_,
    s.Last_name_,
    s.birth_date_,
    s.rank_,
    s.unit_id_,
    s.role_id_,
    p.Project_name
FROM 
    Soldiers s
JOIN 
    Have h ON s.Soldier_id_ = h.Soldier_id_
JOIN 
    Projects p ON h.Project_id = p.Project_id
WHERE 
    p.Project_name IN (&<name="projectNames" type="string" list="select Project_name from Projects" multiselect="yes">)
ORDER BY 
    p.Project_name;


