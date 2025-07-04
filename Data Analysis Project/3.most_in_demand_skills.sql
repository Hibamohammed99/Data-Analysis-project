 SELECT
    skills_dim.skills as skills,
    COUNT(skills_job_dim.job_id) as skill_count
FROM    
    job_postings_fact 

INNER JOIN 
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN 
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_postings_fact.job_work_from_home = TRUE
and job_title_short ='Data Analyst' 


GROUP BY  skills 
ORDER BY 
    skill_count DESC
