/*
Question: What are the top-paying data analyst jobs in France outside Paris?
    - Identify the top 10 highest-paying data analyst roles in France outside of the capital.
    - Exclude job postings without specified salaries.  (Remove nulls)
    - Additionally, provide the names of the companies offering these top-paying roles.
    - Purpose: To spotlight top paying opportunities for data analysts, 
      shedding light on potential employment avenues in France. 
*/


SELECT	
	job_id,
	job_title_short,
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
    job_location NOT LIKE 'Paris%' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;

/*

[
  {
    "job_id": 21632,
    "job_title_short": "Data Analyst",
    "job_location": "Issy-les-Moulineaux, France",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "200000.0",
    "job_posted_date": "2023-02-01 09:52:36",
    "company_name": "Withings"
  },
  {
    "job_id": 465918,
    "job_title_short": "Data Analyst",
    "job_location": "Lyon, France",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163782.0",
    "job_posted_date": "2023-07-27 07:46:04",
    "company_name": "ARCHIMED"
  },
  {
    "job_id": 452745,
    "job_title_short": "Data Analyst",
    "job_location": "Montrouge, France",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111202.0",
    "job_posted_date": "2023-01-02 15:32:49",
    "company_name": "Binance"
  },
  {
    "job_id": 210254,
    "job_title_short": "Data Analyst",
    "job_location": "Bezons, France",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-04-17 12:21:59",
    "company_name": "Nielsen"
  },
  {
    "job_id": 155170,
    "job_title_short": "Data Analyst",
    "job_location": "France",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-02-09 07:32:08",
    "company_name": "Contentsquare"
  },
  {
    "job_id": 1034952,
    "job_title_short": "Data Analyst",
    "job_location": "Nantes, France",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-03-11 00:39:40",
    "company_name": "iAdvize"
  },
  {
    "job_id": 673969,
    "job_title_short": "Data Analyst",
    "job_location": "Montrouge, France",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-02-20 14:49:53",
    "company_name": "Binance"
  },
  {
    "job_id": 1502899,
    "job_title_short": "Data Analyst",
    "job_location": "Cesson-Sévigné, France",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-02-14 13:29:49",
    "company_name": "Vantiva"
  },
  {
    "job_id": 915736,
    "job_title_short": "Data Analyst",
    "job_location": "Cluses, France",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "105650.0",
    "job_posted_date": "2023-01-20 10:38:13",
    "company_name": "SOMFY Group"
  },
  {
    "job_id": 993485,
    "job_title_short": "Data Analyst",
    "job_location": "Drancy, France",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "105650.0",
    "job_posted_date": "2023-04-18 08:43:42",
    "company_name": "Bosch Group"
  }
]
*/

