--DATE DATATYPES
SELECT
    '2023-02-19'::DATE,
    '123'::INTEGER,
    'true'::BOOLEAN,
    '3.14'::REAL;

-- DATE (ONLY date from timestamp)
SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date::DATE AS date
FROM  
    job_postings_fact;



-- AT TIME ZONE
SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time
FROM  
    job_postings_fact
LIMIT 5;

-- EXTRACT
SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time,
    EXTRACT(month FROM job_posted_date) AS date_month,
    EXTRACT(year FROM job_posted_date) AS date_year
FROM  
    job_postings_fact
LIMIT 5;


-- Job posting month to month
SELECT
    COUNT(job_id) AS total_job_count,
    EXTRACT(month FROM job_posted_date) AS posting_month
FROM  
    job_postings_fact
WHERE
    job_title_short='Data Analyst'
GROUP BY
    posting_month
ORDER BY
    total_job_count DESC;

