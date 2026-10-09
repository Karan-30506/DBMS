USE railway_db;

SELECT name
FROM train
WHERE id IN (
    SELECT id
    FROM trainhalts
    WHERE seqno = 0 
      AND stcode IN (
          SELECT stcode
          FROM station
          WHERE name = 'MUMBAI'
      )
);