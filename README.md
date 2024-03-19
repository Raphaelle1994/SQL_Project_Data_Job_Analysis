# Introduction

📊 This project focuses on on data analyst roles and aims to identify top-paying jobs, in-demand skills, and high paying skills within the french job market!

🔍 [Link to SQL queries](/project_sql/)

# Queries

This project is made of 5 queries aiming to address the following questions:

1.  Which data analyst positions offer the highest salaries?
2.  What skills are necessary for these top-paying positions?
3.  Which skills are in highest demand among data analysts?
4.  Which skills correlate with higher salary offerings?
5.  What are the most optimal skills to develop?

# Tools I Used

For this project, I used several key tools:

- **SQL:** Serving as the foundation of my analysis, SQL allowed me to query the database and extract critical insights.
- **PostgreSQL:** Used as database management system
- **Visual Studio Code:** Utilized as my primary tool for both database management and executing SQL queries.
- **Git & GitHub:** For collaborative sharing and project tracking.
- **Tableau:** Used as a data visualisation tool to share insights gathered during my analysis 

#  Analysis
Each query for this project answers one specific question regarding the data analyst job market in France. 

### 1. Top Paying Data Analyst Jobs

To identify the highest-paying data analysts roles, I filtered data analyst positions by average yearly salary and location, focusing on jobs located in France but outside of Paris. This query highlights the high paying opportunities in the field.

```sql
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
```

Here's the breakdown of the top data analyst jobs in 2023:

- **Salary Range:** Top 10 paying data analyst roles in France (excluding Paris) span from $100,000 to $200,000, indicating significant salary potential in the field.
- **Diverse Employers:** Companies like Withings, ARCHIMED, and Binance are among those offering high salaries, showing a broad interest across different industries.

 --- TO DO Insert visualisation
