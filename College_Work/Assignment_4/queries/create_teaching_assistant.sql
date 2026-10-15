USE university_db;
SET SQL_SAFE_UPDATES = 0;

CREATE TABLE teaching_assistant (
    s_ID VARCHAR(5),
    course_id VARCHAR(8),
    sec_id VARCHAR(8),
    semester VARCHAR(6),
    year NUMERIC(4, 0),
    PRIMARY KEY (s_ID, course_id, sec_id, semester, year),
    FOREIGN KEY (s_ID) REFERENCES student (ID) ON DELETE CASCADE,
    FOREIGN KEY (course_id, sec_id, semester, year) 
        REFERENCES section (course_id, sec_id, semester, year) ON DELETE CASCADE
);

-- Inserting Sample TA Data
INSERT INTO teaching_assistant VALUES ('12345', 'CS-101', '1', 'Fall', 2009);
INSERT INTO teaching_assistant VALUES ('00128', 'CS-101', '1', 'Fall', 2009);
INSERT INTO teaching_assistant VALUES ('76543', 'CS-315', '1', 'Spring', 2010);
INSERT INTO teaching_assistant VALUES ('12345', 'CS-347', '1', 'Fall', 2009);

SELECT * FROM teaching_assistant;

SET SQL_SAFE_UPDATES = 1;