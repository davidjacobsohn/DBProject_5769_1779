SELECT t.Training_id_, t.Training_name_, t.Start_date_, t.End_date_
FROM Trainings_ t
LEFT JOIN Participant p ON t.Training_id_ = p.Training_id_
WHERE p.Training_id_ IS NULL;


DELETE FROM Trainings_
WHERE Training_id_ IN (
    SELECT t.Training_id_
    FROM Trainings_ t
    LEFT JOIN Participant p ON t.Training_id_ = p.Training_id_
    WHERE p.Training_id_ IS NULL
);


SELECT t.Training_id_, t.Training_name_, t.Start_date_, t.End_date_
FROM Trainings_ t
LEFT JOIN Participant p ON t.Training_id_ = p.Training_id_
WHERE p.Training_id_ IS NULL;
