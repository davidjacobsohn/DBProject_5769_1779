CREATE OR REPLACE PROCEDURE update_unit_rank_rating IS
    TYPE unit_record IS RECORD (
        unit_id Units.Unit_id_%TYPE,
        average_salary NUMBER
    );

    unit_rec unit_record;
    CURSOR unit_cursor IS
        SELECT u.Unit_id_, AVG(sal.amount_) / 100 AS average_salary
        FROM Units u
        JOIN Soldiers s ON u.Unit_id_ = s.Unit_id_
        JOIN Salaries sal ON s.Soldier_id_ = sal.Soldier_id_
        GROUP BY u.Unit_id_;

    updated_count NUMBER := 0;
BEGIN
    OPEN unit_cursor;
    FETCH unit_cursor INTO unit_rec;

    WHILE unit_cursor%FOUND LOOP
        UPDATE Units
        SET rank_rating = unit_rec.average_salary
        WHERE Unit_id_ = unit_rec.unit_id;

        updated_count := updated_count + 1;

        FETCH unit_cursor INTO unit_rec;
    END LOOP;

    CLOSE unit_cursor;

    DBMS_OUTPUT.PUT_LINE('Total units updated: ' || updated_count);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No units found to update.');
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END update_unit_rank_rating;
/
