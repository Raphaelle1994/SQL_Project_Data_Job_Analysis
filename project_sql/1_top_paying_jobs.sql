/*
Question: What are the top-paying data analyst jobs in France?
    - Identify the top 10 highest-paying data analyst roles in France.
    - Exclude job postings without specified salaries.  (Remove nulls)
    - Additionally, provide the names of the companies offering these top-paying roles.
    - Purpose: To spotlight top paying opportunities for data analysts, 
      shedding light on potential employment avenues in France. 
*/


SELECT	
	job_id,
	job_title,
	job_location,
	job_schedule_type,
	salary_year_avg,
	job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND 
    job_location LIKE '%France' AND 
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;