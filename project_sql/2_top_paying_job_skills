

/*
Question: What skills are required for the top-paying data analyst jobs in France?
- I used the top 10 highest-paying Data Analyst jobs from first query
- I added the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
    SELECT	
        job_id,
        job_title_short,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND 
        job_location LIKE '%France' AND 
        job_location NOT LIKE 'Paris%' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;

/*
Here's the breakdown of the most demanded skills for data analysts in France in 2023, based on job postings:
SQL is leading with a bold count of 8.
Python follows closely with a bold count of 7.
Tableau is also highly sought after, with a bold count of 5.
Other skills like R, Azure, Power BI and Excel show varying degrees of demand.

[
  {
    "job_id": 21632,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "200000.0",
    "company_name": "Withings",
    "skills": "python"
  },
  {
    "job_id": 21632,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "200000.0",
    "company_name": "Withings",
    "skills": "c"
  },
  {
    "job_id": 465918,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "163782.0",
    "company_name": "ARCHIMED",
    "skills": "sql"
  },
  {
    "job_id": 465918,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "163782.0",
    "company_name": "ARCHIMED",
    "skills": "python"
  },
  {
    "job_id": 465918,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "163782.0",
    "company_name": "ARCHIMED",
    "skills": "azure"
  },
  {
    "job_id": 465918,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "163782.0",
    "company_name": "ARCHIMED",
    "skills": "aws"
  },
  {
    "job_id": 465918,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "163782.0",
    "company_name": "ARCHIMED",
    "skills": "spark"
  },
  {
    "job_id": 465918,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "163782.0",
    "company_name": "ARCHIMED",
    "skills": "airflow"
  },
  {
    "job_id": 465918,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "163782.0",
    "company_name": "ARCHIMED",
    "skills": "kafka"
  },
  {
    "job_id": 465918,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "163782.0",
    "company_name": "ARCHIMED",
    "skills": "jenkins"
  },
  {
    "job_id": 465918,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "163782.0",
    "company_name": "ARCHIMED",
    "skills": "terraform"
  },
  {
    "job_id": 465918,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "163782.0",
    "company_name": "ARCHIMED",
    "skills": "docker"
  },
  {
    "job_id": 465918,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "163782.0",
    "company_name": "ARCHIMED",
    "skills": "github"
  },
  {
    "job_id": 465918,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "163782.0",
    "company_name": "ARCHIMED",
    "skills": "gitlab"
  },
  {
    "job_id": 452745,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "111202.0",
    "company_name": "Binance",
    "skills": "sql"
  },
  {
    "job_id": 452745,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "111202.0",
    "company_name": "Binance",
    "skills": "python"
  },
  {
    "job_id": 452745,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "111202.0",
    "company_name": "Binance",
    "skills": "r"
  },
  {
    "job_id": 452745,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "111202.0",
    "company_name": "Binance",
    "skills": "tableau"
  },
  {
    "job_id": 155170,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Contentsquare",
    "skills": "sql"
  },
  {
    "job_id": 155170,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Contentsquare",
    "skills": "python"
  },
  {
    "job_id": 155170,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Contentsquare",
    "skills": "snowflake"
  },
  {
    "job_id": 155170,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Contentsquare",
    "skills": "tableau"
  },
  {
    "job_id": 210254,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Nielsen",
    "skills": "python"
  },
  {
    "job_id": 210254,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Nielsen",
    "skills": "vba"
  },
  {
    "job_id": 210254,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Nielsen",
    "skills": "excel"
  },
  {
    "job_id": 210254,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Nielsen",
    "skills": "power bi"
  },
  {
    "job_id": 1502899,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Vantiva",
    "skills": "excel"
  },
  {
    "job_id": 1502899,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Vantiva",
    "skills": "power bi"
  },
  {
    "job_id": 1502899,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Vantiva",
    "skills": "sharepoint"
  },
  {
    "job_id": 1034952,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "iAdvize",
    "skills": "sql"
  },
  {
    "job_id": 1034952,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "iAdvize",
    "skills": "python"
  },
  {
    "job_id": 1034952,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "iAdvize",
    "skills": "bigquery"
  },
  {
    "job_id": 1034952,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "iAdvize",
    "skills": "airflow"
  },
  {
    "job_id": 1034952,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "iAdvize",
    "skills": "kafka"
  },
  {
    "job_id": 1034952,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "iAdvize",
    "skills": "tableau"
  },
  {
    "job_id": 673969,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Binance",
    "skills": "sql"
  },
  {
    "job_id": 673969,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Binance",
    "skills": "nosql"
  },
  {
    "job_id": 673969,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Binance",
    "skills": "java"
  },
  {
    "job_id": 673969,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Binance",
    "skills": "r"
  },
  {
    "job_id": 673969,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Binance",
    "skills": "sas"
  },
  {
    "job_id": 673969,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Binance",
    "skills": "c++"
  },
  {
    "job_id": 673969,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Binance",
    "skills": "vba"
  },
  {
    "job_id": 673969,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Binance",
    "skills": "neo4j"
  },
  {
    "job_id": 673969,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Binance",
    "skills": "tableau"
  },
  {
    "job_id": 673969,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Binance",
    "skills": "sas"
  },
  {
    "job_id": 915736,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "105650.0",
    "company_name": "SOMFY Group",
    "skills": "sap"
  },
  {
    "job_id": 993485,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "105650.0",
    "company_name": "Bosch Group",
    "skills": "tableau"
  },
  {
    "job_id": 993485,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "105650.0",
    "company_name": "Bosch Group",
    "skills": "power bi"
  }
]

*/
