with top_paying_roles AS
    (SELECT
        job_id,
        company_dim.name AS Company_name,
        job_location AS Location,
        job_title_short AS job_title,
        salary_year_avg AS salary
    FROM    
        job_postings_fact 
    LEFT JOIN 
        company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE 
        salary_year_avg IS NOT NULL
        AND job_title_short ='Data Analyst' 
        AND job_location='Anywhere'
    ORDER BY 
        salary_year_avg DESC
    LIMIT 10
)
SELECT top_paying_roles.* ,
skills
FROM top_paying_roles 
INNER JOIN skills_job_dim ON top_paying_roles.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY top_paying_roles.salary DESC