SELECT 
    t.Training_name_ , 
    COUNT(p.Soldier_id_) AS NUM_PARTICIPANTS
FROM 
    Trainings_ t
JOIN 
    Participant p ON t.Training_id_ = p.Training_id_
GROUP BY 
    t.Training_name_ 
ORDER BY 
    NUM_PARTICIPANTS DESC;
