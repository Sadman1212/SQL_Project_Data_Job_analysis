--CREATE TABLE
CREATE TABLE job_applied (
    job_id INT,
    application_sent_date DATE,
    customer_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    contact VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50)
);


SELECT * FROM job_applied;

--INSERT INTO
INSERT INTO job_applied
            (job_id,
            application_sent_date,
            customer_resume,
            resume_file_name,
            cover_letter_sent,
            cover_letter_file_name,
            status)
VALUES      (
            1,
            '2024-06-01',
            TRUE,
            'resume_john_doe.pdf',
            TRUE,
            'cover_letter_john_doe.pdf',
            'Pending'
           ),
           (
            2,
            '2024-06-02',
            TRUE,
            'resume_jane_smith.pdf',
            FALSE,
            NULL,
            'Submitted'
           ),
           (
            3,
            '2024-06-03',
            TRUE,
            'resume_mike_brown.pdf',
            TRUE,
            'cover_letter_mike_brown.pdf',
            'Interview Scheduled'
           ),
           (
            4,
            '2024-06-03',
            TRUE,
            'resume_mike_brown.pdf',
            TRUE,
            'cover_letter_mike_brown.pdf',
            'Interview Scheduled'
           ),
           (
            5,
            '2024-06-03',
            TRUE,
            'resume_mike_brown.pdf',
            TRUE,
            'cover_letter_mike_brown.pdf',
            'Interview Scheduled'
           );

--ALTER TABLE ADD new column
ALTER TABLE job_applied
ADD contact VARCHAR(50);


select * from job_applied;

--UPDATE
UPDATE job_applied
SET contact='sadman'    
WHERE job_id=1;

--RENAME COLUMN
ALTER TABLE job_applied
RENAME COLUMN contact TO contact_name;


select * from job_applied;

--CHANGE column DATATYPE
ALTER TABLE job_applied
ALTER COLUMN contact_name TYPE TEXT;


select * from job_applied;

--DELETE COLUMN (DROP)
ALTER TABLE job_applied
DROP COLUMN contact_name;

--DROP TABLE
DROP TABLE job_applied;
