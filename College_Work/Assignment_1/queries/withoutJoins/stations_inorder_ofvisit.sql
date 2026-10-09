USE railway_db;

SELECT 
    seqno AS sequence,
    stcode,
    (SELECT name FROM station WHERE station.stcode = trainhalts.stcode) AS station_name
FROM trainhalts
WHERE id IN (
    SELECT id
    FROM train
    WHERE name = 'CST-AMR_LOCAL'
)
ORDER BY seqno ASC;