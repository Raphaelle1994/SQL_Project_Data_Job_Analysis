/*
Question: What are the most sought after skills for data analysts in France?
- The aim is to dentify the top 5 in-demand skills for a data analyst.
- Focus on all job postings in France.
- Why? Retrieves the top 5 skills with the highest demand in the job market, 
    providing insights into the most valuable skills for job seekers.
*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    AND job_location LIKE '%France' 
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;

/*
Here's the breakdown of the most demanded skills  in France
for data analysts in 2023::

SQL: 5926 demand count
Python: 4304 demand count
Power BI: 3349 demand count
Excel: 2834 demand count
Tableau: 2795 demand count

 reflecting the importance of technical and analytical proficiency in data analysis roles.


[
  {
    "skills": "sql",
    "demand_count": "5926"
  },
  {
    "skills": "python",
    "demand_count": "4304"
  },
  {
    "skills": "power bi",
    "demand_count": "3349"
  },
  {
    "skills": "excel",
    "demand_count": "2834"
  },
  {
    "skills": "tableau",
    "demand_count": "2795"
  }
]

*/

