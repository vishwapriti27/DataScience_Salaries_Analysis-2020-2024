/* Data Science Salaries Analysis */

/* Importing the data */

/* The dataset is available in a .csv file. */

/* To load the data, I have used the SQL dataset as it is easier to query the data and visualize the data efficiently. */

/* Used database for Analysis */

use project;

show tables;

/* Describe Database */

desc datascience_salaries_2024;

select * from datascience_salaries_2024;

/* Data Cleaning */

/* Ensure there are no missing or null values in the dataset */
    
select * from datascience_salaries_2024
where work_year IS NULL or
experience_level IS NULL or
employment_type IS NULL or
job_title IS NULL or
salary IS NULL or salary_currency IS NUll or salary_in_usd IS NULL or
employee_residence IS NULL or remote_ratio IS NULL or company_location IS NULL or company_size IS NUll;

/* Summary statistics of numerical columns */

SELECT 
    MIN(salary_in_usd) AS min_salary,
    MAX(salary_in_usd) AS max_salary,
    AVG(salary_in_usd) AS avg_salary
FROM datascience_salaries_2024;

/* Distribution of job titles */ 

SELECT 
    job_title, 
    COUNT(*) AS count
FROM datascience_salaries_2024
GROUP BY job_title
ORDER BY count DESC;

/* Distribution of experience level */

SELECT 
    experience_level, 
    COUNT(*) AS count
FROM datascience_salaries_2024
GROUP BY experience_level
ORDER BY count DESC;

/* Salary Distribution By job title */

SELECT 
    job_title, 
    AVG(salary_in_usd) AS avg_salary,
    MIN(salary_in_usd) AS min_salary,
    MAX(salary_in_usd) AS max_salary
FROM datascience_salaries_2024
GROUP BY job_title
ORDER BY avg_salary DESC;

/* Top 5 Job title */

select max(salary_in_usd) as max_salary , job_title from datascience_salaries_2024
group by job_title
order by max_salary desc limit 5;

/* Salary Trends Over the Years */

SELECT 
    work_year, job_title,
    AVG(salary_in_usd) AS avg_salary
FROM datascience_salaries_2024
GROUP BY work_year, job_title
ORDER BY work_year;

/* Remote Work Ratio Analysis */

SELECT 
    remote_ratio,  
    AVG(salary_in_usd) AS avg_salary
FROM datascience_salaries_2024
GROUP BY remote_ratio
ORDER BY remote_ratio;

/* Average Salary by Job Title and Experience Level */

SELECT 
    job_title, 
    experience_level, 
    AVG(salary_in_usd) AS avg_salary
FROM datascience_salaries_2024
GROUP BY job_title, experience_level;

/* Salary Differences by Company Location */

SELECT 
    company_location, 
    AVG(salary_in_usd) AS avg_salary,
    MIN(salary_in_usd) AS min_salary,
    MAX(salary_in_usd) AS max_salary
FROM datascience_salaries_2024
GROUP BY company_location
ORDER BY avg_salary DESC;

/* Remote Work Impact on Salary */

SELECT 
    job_title,
    remote_ratio,
    AVG(salary_in_usd) AS avg_salary
FROM datascience_salaries_2024
GROUP BY job_title, remote_ratio
ORDER BY job_title, remote_ratio;

/* Salary by Company size */

SELECT company_size, AVG(salary_in_usd) AS avg_salary
FROM datascience_salaries_2024
GROUP BY company_size
ORDER BY avg_salary DESC;

/* Thank You :) */





