
---
# Introduction
This project explores the data job market 💻—specifically Data Analyst roles—and provides a deeper understanding of the most in-demand skills  in the field of Data Science 🔥. The analysis performed using SQL queries on a relational postgres database.

 [👉🏻 Check out All SQL queries here ](https://vscode.dev/github/Hibamohammed99/SQL-folder/blob/main/Data%20Analysis%20Project)


<br>

---
# Background
The project is guided by the following research questions:

        1. What are the top-paying roles?
        2. What are the skills required for top-paying roles?
        3. What are the most in-demand skills for Data analyst roles?
        4. What are the top skills based on salary?
        5. What are the most optimal skills to learn?
        • Optimal: High Demand AND High Paying
<br>

---
# Tools I Used 
### SQL
I used **VS Code** to write and organize SQL queries.

### Workbench/IDE
I used **pgAdmin** to manage the *PostgreSQL* database and store the data.

## Data Source:
[Online Dataset](https://drive.google.com/drive/folders/1egWenKd_r3LRpdCf4SsqTeFZ1ZdY3DNx)

<br>

---
# The Analysis 📊
### Query Insights

Each query explored a specific aspect of the data job market. Here are some of the uncovered insights :

- **Top Paying roles**

<br>

![Top Paying Roles](top_paying_roles.PNG)

<br>

- **Top In-Demand Skills**
 

    | Skill     | Count  |
    |-----------|--------|
    | SQL       | 7,291  |
    | Excel     | 4,611  |
    | Python    | 4,330  |
    | Tableau   | 3,745  |
    | Power BI  | 2,609  |

<br>

- **Optimal Skills to Learn**: Choose your learning path based on your **priority** — whether you prefer skills in **high demand** or those that lead to **higher salaries**.

    You can use the following SQL query to decide which skills to focus on, based on your preference 👇🏼

<br>

``` 
SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id),
    avg(salary_year_avg)

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
avg_salary DESC,
demand_count DESC

```

<br>

   ---
# What I Learned
Through this project, I enhanced my understanding of:


- How to creating database using **postgreSQL** and connect it with the code editor **VS Code**
- How to Apply more advanced SQL techniques by using Common Table Expressions **(CTEs)** to structure complex queries
- Gained insights into the job market for data analysts through real-world data

<br>

---

# Conclusions ✅
This project enhanced my SQL and coding skills, and it serves as a practical guide for fellow data enthusiasts looking to explore the data job market. I hope it inspires other data nerds to follow their curiosity and dig deeper into real-world data 🤍
