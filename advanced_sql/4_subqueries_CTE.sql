-- CREATE 3 tables
CREATE TABLE january_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 01;
CREATE TABLE february_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 02;
CREATE TABLE march_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 03;


SELECT job_posted_date
FROM february_jobs;

-- SubQueries
SELECT *
FROM (
    SELECT *
        FROM job_postings_fact
        WHERE EXTRACT(MONTH FROM job_posted_date) = 01
    ) AS january_jobs;

-- CTEs
 WITH january_jobs AS (
    SELECT *
        FROM job_postings_fact
        WHERE EXTRACT(MONTH FROM job_posted_date) = 01
    )
SELECT *
FROM january_jobs;


--Subquaries
SELECT
    company_id,
    name AS company_name
FROM
    company_dim
WHERE company_id IN (
    SELECT company_id
    FROM job_postings_fact
    WHERE job_no_degree_mention = true
);




-- CTEs
WITH company_job_counts AS (
    SELECT
        company_id,
        COUNT(*) AS total_jobs
    FROM
        job_postings_fact
    GROUP BY
        company_id)
SELECT company_dim.name AS company_name,
       company_job_counts.total_jobs
FROM company_dim
LEFT JOIN company_job_counts ON company_dim.company_id = company_job_counts.company_id
ORDER BY company_job_counts.total_jobs DESC;
