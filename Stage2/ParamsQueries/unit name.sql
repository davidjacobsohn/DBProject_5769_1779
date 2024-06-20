SELECT
s.Soldier_id_,
s.First_name_,
s.Last_name_,
s.Birth_date_,
s.Rank_,
u.unit_name_
FROM
Soldiers s,
Units u
WHERE
u.Unit_id_ = &< name = "unitName"
                type = "string" 
                list = "select Unit_id_, Unit_name_ from units" 
                description = "yes">
ORDER BY s.last_name_, s.first_name_;                
