WITH remote_job_skills AS (
SELECT    
    sjd.skill_id,
    COUNT(*) AS skill_count    
FROM skills_job_dim AS sjd
INNER JOIN job_postings_fact AS jpf ON jpf.job_id = sjd.job_id
WHERE jpf.job_work_from_home=true AND
    jpf.job_title_short='Data Analyst'
GROUP BY  
    sjd.skill_id)
SELECT
    sd.skill_id,
    skills AS skill_name,
    skill_count
FROM remote_job_skills
INNER JOIN skills_dim AS sd ON sd.skill_id = remote_job_skills.skill_id
ORDER BY skill_count DESC
LIMIT 5;  
