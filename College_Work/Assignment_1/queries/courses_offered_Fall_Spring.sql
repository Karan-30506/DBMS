USE university_db;
-- we can also use 2 select statements and intersect of them

SELECT DISTINCT
    s1.course_id,
    c.title,
    s1.year as Fall_Year,
    s2.year as Spring_Year
FROM
    section s1
    JOIN section s2 on s1.course_id = s2.course_id
    INNER JOIN course c on s1.course_id = c.course_id
where
    s1.semester = "Fall"
    and s2.semester = "Spring"