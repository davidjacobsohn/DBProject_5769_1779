CREATE VIEW SoldierActivity AS
SELECT s.Soldier_id, s.r_id, s.soldier_name, s.Rank_, u.Unit_name_, COUNT(DISTINCT pt.Training_id_) AS TrainingCount, COUNT(DISTINCT h.Project_id) AS ProjectCount
FROM Soldiers1 s
LEFT JOIN Participant pt ON s.Soldier_id = pt.Soldier_id_
LEFT JOIN Trainings_ t ON pt.Training_id_ = t.Training_id_
LEFT JOIN Have h ON s.Soldier_id = h.Soldier_id_
LEFT JOIN Units u ON s.Unit_id = u.Unit_id_
GROUP BY s.Soldier_id, s.soldier_name, s.r_id, s.Rank_, u.Unit_name_;


select * from SoldierActivity;



SELECT soldier_name, Rank_, Unit_name_, TrainingCount, ProjectCount
FROM SoldierActivity
ORDER BY TrainingCount DESC, ProjectCount DESC;


SELECT Unit_name_, COUNT(Soldier_id) AS SoldierCount, SUM(TrainingCount) AS TotalTrainings, SUM(ProjectCount) AS TotalProjects
FROM SoldierActivity
GROUP BY Unit_name_
ORDER BY SoldierCount DESC, TotalTrainings DESC, TotalProjects DESC;




CREATE VIEW Operation_Intelligence_Summary AS
SELECT o.O_id, o.O_name, o.Objective, COUNT(ir.I_id) AS ReportCount, COUNT(ap.P_id) AS AssignedPersonnelCount
FROM Operations_ o
LEFT JOIN Intelligence_reports ir ON o.O_id = ir.O_id
LEFT JOIN Assigned_operation ao ON o.O_id = ao.O_id
LEFT JOIN Assignments a ON ao.A_id = a.A_id
LEFT JOIN Assigned_personnel ap ON a.A_id = ap.A_id
GROUP BY o.O_id, o.O_name, o.Objective;

select * from Operation_Intelligence_Summary;


SELECT O_name, Objective, ReportCount, AssignedPersonnelCount
FROM Operation_Intelligence_Summary
ORDER BY ReportCount DESC, AssignedPersonnelCount DESC;


SELECT O_name, Objective, ReportCount
FROM Operation_Intelligence_Summary
WHERE ReportCount > 0 AND O_name LIKE '%24%'
ORDER BY ReportCount DESC;






