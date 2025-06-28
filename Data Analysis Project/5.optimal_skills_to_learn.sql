 SELECT
    skills_dim.skill_id ,
    skills_dim.skills as skills,
    COUNT(skills_job_dim.job_id) as demand_count ,
    avg(salary_year_avg) as avg_salary
FROM    
    job_postings_fact 
INNER JOIN 
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN 
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    salary_year_avg IS NOT NULL 
and job_title_short ='Data Analyst' 
and job_work_from_home = TRUE
GROUP BY  skills_dim.skill_id
having
 count(skills_job_dim.job_id) > 10
ORDER BY 
avg_salary DESC ,demand_count DESC

LIMIT 20