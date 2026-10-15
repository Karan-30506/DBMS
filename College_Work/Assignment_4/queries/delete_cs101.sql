USE university_db;
SET SQL_SAFE_UPDATES = 0;

SELECT * FROM prereq WHERE prereq_id = 'CS-101';

ALTER TABLE prereq DROP FOREIGN KEY prereq_ibfk_2;

ALTER TABLE prereq 
    ADD CONSTRAINT fk_prereq_cascade 
    FOREIGN KEY (prereq_id) REFERENCES course(course_id) 
    ON DELETE CASCADE;

DELETE FROM course WHERE course_id = 'CS-101';

SELECT * FROM prereq WHERE prereq_id = 'CS-101';

SELECT 
    (SELECT COUNT(*) FROM course WHERE course_id = 'CS-101') AS cs101_in_course,
    (SELECT COUNT(*) FROM section WHERE course_id = 'CS-101') AS cs101_in_section,
    (SELECT COUNT(*) FROM prereq WHERE prereq_id = 'CS-101') AS cs101_in_prereq;

SET SQL_SAFE_UPDATES = 1;