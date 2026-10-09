USE university_db;
-- we can also use 2 select statements and intersect of them

SELECT DISTINCT
    s1.course_id,
    c.title,
    s1.year AS Fall_Year,
    s2.year AS Spring_Year
FROM
    section s1
    JOIN section s2 ON s1.course_id = s2.course_id
    INNER JOIN course c ON s1.course_id = c.course_id
WHERE
    s1.semester = "Fall"
    AND s2.semester = "Spring";