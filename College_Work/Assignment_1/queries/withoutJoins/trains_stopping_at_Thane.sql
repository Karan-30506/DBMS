USE railway_db;

SELECT DISTINCT id
FROM trainhalts
WHERE stcode IN (
    SELECT stcode
    FROM station
    WHERE name = 'THANE'
);