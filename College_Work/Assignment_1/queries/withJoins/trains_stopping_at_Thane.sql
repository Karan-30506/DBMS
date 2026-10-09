USE railway_db;

SELECT DISTINCT
    th.id,
    s.name AS station_name
FROM trainhalts th
    LEFT JOIN station s ON th.stcode = s.stcode
WHERE
    s.name = "THANE";