SELECT
    AVG(salary_year_avg) AS average_salary,
    AVG(salary_hour_avg) AS average_hourly_salary,
    job_schedule_type,
    job_posted_date::DATE AS posted_date
FROM
    job_postings_fact
WHERE
    job_posted_date > '2023-06-01'
GROUP BY
    job_schedule_type,
    job_posted_date::DATE
ORDER BY
    posted_date ASC,
    job_schedule_type ASC;
