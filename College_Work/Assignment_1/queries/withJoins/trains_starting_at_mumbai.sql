USE railway_db;

SELECT th.id, t.name, th.seqno, s.name AS start_station
FROM
    trainhalts th
    LEFT JOIN station s ON th.stcode = s.stcode
    LEFT JOIN train t ON th.id = t.id
WHERE
    th.seqno = 0
    AND s.name = "MUMBAI";