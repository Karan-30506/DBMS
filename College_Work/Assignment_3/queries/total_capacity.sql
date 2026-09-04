USE university_db;

SELECT building, SUM(capacity) as total_capacity
FROM classroom
GROUP BY
    building;