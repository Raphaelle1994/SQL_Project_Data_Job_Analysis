/*
Answer: What are the top paying skills in France?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries
- The aim is to reveal how different skills impact salary levels for Data Analyst roles in France and 
    helps identify the most financially rewarding skills to acquire or improve
*/

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

/*

Top-paying skills:
C: $200,000
Terraform, GitLab: $163,782
Kafka: $118,602
Docker, Jenkins: $113,994

These results highlight the importance of DevOps tools within 
the French Data Analyst job market as well as the importance of 
the high level programing language C and Kafka.


 {
    "skills": "c",
    "avg_salary": "200000"
  },
  {
    "skills": "terraform",
    "avg_salary": "163782"
  },
  {
    "skills": "gitlab",
    "avg_salary": "163782"
  },
  {
    "skills": "kafka",
    "avg_salary": "118602"
  },
  {
    "skills": "docker",
    "avg_salary": "113994"
  },
  {
    "skills": "jenkins",
    "avg_salary": "113994"
  },
  {
    "skills": "c#",
    "avg_salary": "111202"
  },
  {
    "skills": "neo4j",
    "avg_salary": "111175"
  },
  {
    "skills": "sharepoint",
    "avg_salary": "111175"
  },
  {
    "skills": "vba",
    "avg_salary": "111175"
  },
  {
    "skills": "nosql",
    "avg_salary": "111175"
  },
  {
    "skills": "php",
    "avg_salary": "111175"
  },
  {
    "skills": "c++",
    "avg_salary": "111175"
  },
  {
    "skills": "windows",
    "avg_salary": "105300"
  },
  {
    "skills": "jira",
    "avg_salary": "105000"
  },
  {
    "skills": "alteryx",
    "avg_salary": "105000"
  },
  {
    "skills": "github",
    "avg_salary": "98249"
  },
  {
    "skills": "sap",
    "avg_salary": "97375"
  },
  {
    "skills": "java",
    "avg_salary": "96458"
  },
  {
    "skills": "aws",
    "avg_salary": "95906"
  },
  {
    "skills": "python",
    "avg_salary": "94724"
  },
  {
    "skills": "spark",
    "avg_salary": "94001"
  },
  {
    "skills": "bigquery",
    "avg_salary": "91121"
  },
  {
    "skills": "ansible",
    "avg_salary": "89100"
  },
  {
    "skills": "git",
    "avg_salary": "89100"
  }
]

