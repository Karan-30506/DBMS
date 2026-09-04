USE university_db;

SELECT s.ID, s.name, COALESCE(SUM(c.credits), 0) AS total_credits
FROM
    student s
    LEFT JOIN takes t ON s.ID = t.ID
    AND t.grade IS NOT NULL
    AND t.grade != 'F'
    LEFT JOIN course c ON t.course_id = c.course_id
GROUP BY
    s.ID,
    s.name