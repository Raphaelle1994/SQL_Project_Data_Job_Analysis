/*
Answer: What are the most optimal skills to learn, that are both in high demand and high paying in France
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data analysis
*/

-- Identifies skills in high demand for Data Analyst roles
-- Uses Query #3

WITH skills_demand AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' 
        AND salary_year_avg IS NOT NULL
        AND job_location LIKE '%France'
    GROUP BY
        skills_dim.skill_id
), 

-- Skills with high average salaries for Data Analyst roles
-- Use Query #4

average_salary AS (
    SELECT 
        skills_job_dim.skill_id,
        ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_location LIKE '%France' 
    GROUP BY
        skills_job_dim.skill_id
)
-- Return high demand and high salaries for 5 skills 

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM
    skills_demand
INNER JOIN  average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE  
    demand_count > 5
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 5;


-- rewriting this same query more concisely
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_location LIKE '%France' 
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 5
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 5;

/*
Here's a breakdown of the most optimal skills for Data Analysts in 2023: 
Python is the most optimal skill and stands out as 
a high demand programming language with an average salary of $94724, while other valuablle
skills include azure, excel, sql and power BI.

[
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "20",
    "avg_salary": "94724"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "demand_count": "10",
    "avg_salary": "86095"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "demand_count": "8",
    "avg_salary": "85604"
  },
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": "28",
    "avg_salary": "83666"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "demand_count": "8",
    "avg_salary": "83571"
  }
]
*/