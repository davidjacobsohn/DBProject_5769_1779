ALTER TABLE Personnel ADD  Birth_date DATE;
ALTER TABLE Personnel ADD  Unit_id NUMBER;


ALTER TABLE Personnel ADD CONSTRAINT fk_unit FOREIGN KEY (Unit_id) REFERENCES Units(unit_id_);


ALTER TABLE Personnel DROP CONSTRAINT chk_rank;


INSERT INTO Personnel (p_id, r_id, p_name, rank_, birth_date, unit_id)
SELECT 
    soldier_id_, 
    FLOOR(DBMS_RANDOM.VALUE(1, 501)),
    first_name_ || ' ' || last_name_, 
    rank_, 
    birth_date_, 
    unit_id_
FROM 
    Soldiers;



UPDATE Personnel
SET 
    Birth_date = CASE 
                    WHEN Birth_date IS NULL THEN TO_DATE('01-01-1950', 'DD-MM-YYYY') + ROUND(DBMS_RANDOM.VALUE(0, TO_DATE('31-12-2005', 'DD-MM-YYYY') - TO_DATE('01-01-1950', 'DD-MM-YYYY')))
                    ELSE Birth_date 
                 END,
    Unit_id = CASE 
                 WHEN Unit_id IS NULL THEN (SELECT unit_id_ FROM (SELECT unit_id_ FROM Units ORDER BY DBMS_RANDOM.VALUE) WHERE ROWNUM = 1)
                 ELSE Unit_id 
              END
WHERE Birth_date IS NULL OR Unit_id IS NULL;



ALTER TABLE Personnel RENAME TO Soldiers1;
ALTER TABLE Soldiers1 RENAME COLUMN P_id TO Soldier_id;
ALTER TABLE Soldiers1 RENAME COLUMN P_name TO Soldier_name;



CREATE TABLE temp_roles AS
SELECT role_id_ + 500 AS new_role_id, role_name, role_description_
FROM roles_;

INSERT INTO role_ (r_id, r_name,description_)
SELECT new_role_id, role_name,role_description_
FROM temp_roles;

drop table temp_roles;


CREATE TABLE Units_Equipment (
    unit_id_ NUMBER,
    e_id INTEGER,
    PRIMARY KEY (unit_id_, e_id),
    FOREIGN KEY (unit_id_) REFERENCES Units(unit_id_),
    FOREIGN KEY (e_id) REFERENCES Equipment(e_id)
);




CREATE TABLE Units_Assignments (
    unit_id_ NUMBER,
    a_id INTEGER,
    PRIMARY KEY (unit_id_, a_id),
    FOREIGN KEY (unit_id_) REFERENCES Units(unit_id_),
    FOREIGN KEY (a_id) REFERENCES Assignments(a_id)
);







