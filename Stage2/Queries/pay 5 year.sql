SELECT 
    s.Soldier_id_, 
    s.First_name_,
    s.Last_name_,  
    sal.Amount_,
    EXTRACT(YEAR FROM sal.Payment_date_) AS PAY_YEAR
FROM 
    Soldiers s
JOIN 
    Salaries sal ON s.Soldier_id_ = Sal.Soldier_id_
WHERE 
    EXTRACT(YEAR FROM sal.Payment_date_) IN (SELECT DISTINCT EXTRACT(YEAR FROM sal2.Payment_date_) 
                                      FROM Salaries sal2
                                      WHERE EXTRACT(YEAR FROM sal2.Payment_date_) >= EXTRACT(YEAR FROM SYSDATE) - 5)
    AND sal.Amount_ = (SELECT MAX(sal3.Amount_) 
                    FROM Salaries sal3 
                    WHERE EXTRACT(YEAR FROM sal3.Payment_date_) = EXTRACT(YEAR FROM sal.Payment_date_))
ORDER BY 
    PAY_YEAR DESC, sal.Amount_ DESC;
