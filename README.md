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

- **Salary Range:** Top 10 paying data analyst roles in France (excluding Paris) span from $100,000 to $200,000.
- **Diverse Employers:** Companies like Withings, ARCHIMED, and Binance are among those offering high salaries, showing a broad interest across various industries.

![Top paying roles](project_sql\Assets\top_paying_jobs.png)

*Visualisation of the 10 highest salaries for a Data Analyst in France and the companies that offer them - Graph henerated with Tableau *

### 2. Skills for Top Paying Jobs

To understand what skills are required for the top-paying jobs, I used two different datasets: one for job postings and one with skills data and joined them to provide insights into what skills employers value for high-compensation roles.

```sql
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
```

Here's the breakdown of the most demanded skills for data analysts in France in 2023, based on job postings:

1. SQL is leading with a bold count of 8.
2. Python follows closely with a bold count of 7.
3. Tableau is also highly sought after, with a bold count of 5.
4. Other skills like C, R, Azure, Power BI and Excel show varying degrees of demand.

--- TO DO - Insert Bar graph visualizing the count of skills for the top 10 paying jobs for data analysts. 

### 3. In-Demand Skills for Data Analysts

The aim of this query is to identify the 5 skills most frequently requested in job postings for data analysts roles in France.

```sql
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
```
Here's the breakdown of the most demanded skills  in France
for data analysts in 2023:

1. SQL: 5926 demand count
2. Python: 4304 demand count
3. Power BI: 3349 demand count
4. Excel: 2834 demand count
5. Tableau: 2795 demand count

The presence of SQL, Python, Excel and data visualisation tools showcases the importance of mastering a variety of tools. 


| Skills    | Demand Count |
|-----------|--------------|
| SQL       | 5926         |
| Python    | 4304         |
| Power BI  | 3349         |
| Excel     | 2834         |
| Tableau   | 2795         |

*Table of the demand for the top 5 skills in data analyst job postings in France*

### 4. Skills Based on Salary

This query aims to identify the average salaries associated with different skills, and reveal which skills are the highest paying.

```sql
SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_location LIKE '%France'
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;
```

Top 5 paying skills:
1. C: $200,000
2. Terraform, GitLab: $163,782
3. Kafka: $118,602
4. Docker, Jenkins: $113,994

C came as a surprise and showcases the french data analytics job market puts an emphasis on high level programing languages.

| Skills        | Average Salary ($) |
|---------------|-------------------:|
| C             |            200,000 |
| terraform     |            163,782 |
| gitlab        |            163,782 |
| kafka         |            118,602 |
| docker        |            113,994 |
| jenkins       |            113,994 |
| c#            |            111,202 |
| neo4j         |            111,175 |
| sharepoint    |            111,175 |
| vba           |            111,175 |
| nosql         |            111,175 |
| php           |            111,175 |
| C++           |            111,175 |
| windows       |            105,300 |
| jira          |            105,000 |

*Table of the average salary for the top 15 paying skills for data analysts*

### 5. Most Optimal Skills to Learn

This query aimed to uncover the 5 most optimal skills to learn, that are both in high demand and high paying in France. 

```sql
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
```
Python stands out as the most optimal skill and has both a  high demand and a high average salary of $94724. Other valuablle skills include azure, excel, sql and power BI.

INSERT *CHART of the most optimal skills for data analyst*

# What I Learned

In this journey, I've put my SQL arsenal to use with various techniques:

🧩 Complex Queries: intricate SQL operations such as merging tables and using WITH clauses to create temporary tables.

📊 Data Aggregation: I've used GROUP BY as well as aggregate functions like COUNT() and AVG() to succinctly summarize data.

💡 Analytical Expertise: I solved real-world questions with SQL by turning real life questions into SQL queries.

# Conclusion

### Insights Gathered

The analysis uncovered several noteworthy findings:

1. **High-Earning Data Analyst Roles**: Outside of Paris, data analyst roles in France offer lucrative salaries, with some reaching up to $200,000.

2. **Skills for Top-Paying Jobs**: Proficiency in SQL emerges as a prerequisite for securing high-paying data analyst positions.

3. **Top-Requested Skill**: SQL remains the most sought-after skill in the data analyst job landscape, underscoring its indispensability for job seekers.

4. **Skills with Highest Salaries** The French data analytics market values proficiency in high-level programming languages and specialized expertise, correlating with higher average salaries.

5. **Optimal Skills for Job Market Value**: Python stands out as a highly demanded skill, commanding high average salaries, thus making it a strategic choice for data analysts seeking to maximize their market worth.

### Concluding Remarks

This project has not only enhanced my SQL proficiency but also provided invaluable insights into the dynamics of the data analyst job market. The derived insights serve as a roadmap for prioritizing skill development and navigating job search endeavors. 

Aspiring data analysts can gain a competitive edge by focusing on high-demand, high-salary skills. This exploration underscores the significance of continuous learning and adaptation to evolving trends in the realm of data analytics.





