SELECT 
    t.Training_id_, 
    t.Training_name_, 
    t.Start_date_, 
    t.End_date_
FROM 
    Trainings_ t
WHERE 
    t.Start_date_ BETWEEN TO_DATE(&<name= "start_date"
                                    type= "date"
                                    hint= "Enter the date in the format DD-MM-YYYY">, 'DD-MM-YYYY') 
                      AND TO_DATE(&<name= "end_date"
                                    type= "date">, 'DD-MM-YYYY')
ORDER BY 
    t.Start_date_;
    
    
    
    



