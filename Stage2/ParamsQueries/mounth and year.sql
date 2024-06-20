SELECT 
    s.Soldier_id_, 
    s.First_name_,
    s.Last_name_,
    sal.amount_,
    sal.salary_id_, 
    EXTRACT(MONTH FROM sal.payment_date_) AS PAY_MONTH,
    EXTRACT(YEAR FROM sal.payment_date_) AS PAY_YEAR
FROM 
    Soldiers s
JOIN 
    salaries sal ON s.Soldier_id_ = sal.Soldier_id_
WHERE 
    EXTRACT(MONTH FROM sal.payment_date_) = &<name=payMonth type="integer" list="1,2,3,4,5,6,7,8,9,10,11,12" restricted="true">
AND 
    EXTRACT(YEAR FROM sal.payment_date_) = &<name=payYear type="integer" list="1950,1951,1952,1953,1954,1955,1956,1957,1958,1959,1960,1961,1962,1963,1964,1965,1966,1967,1968,1969,1970,1971,1972,1973,1974,1975,1976,1977,1978,1979,1980,1981,1982,1983,1984,1985,1986,1987,1988,1989,1990,1991,1992,1993,1994,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024" restricted="true">

ORDER BY 
    s.Last_name_, s.First_name_;
