USE railway_db;

SELECT th.id, t.name, th.seqno AS sequence, th.stcode, s.name
FROM
    trainhalts th
    LEFT JOIN train t ON th.id = t.id
    LEFT JOIN station s ON th.stcode = s.stcode
WHERE
    t.name = "CST-AMR_LOCAL"
ORDER BY th.seqno ASC;