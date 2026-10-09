USE university_db;

SELECT DISTINCT course_id
FROM section
WHERE semester = 'Fall'
  AND course_id IN (
      SELECT course_id
      FROM section
      WHERE semester = 'Spring'
  );