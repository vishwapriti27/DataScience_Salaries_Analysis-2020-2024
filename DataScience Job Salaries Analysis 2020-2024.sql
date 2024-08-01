use project;
show tables;
desc datascience_salaries_2024;

select * from datascience_salaries_2024;

select * from datascience_salaries_2024
where work_year IS NULL or
experience_level IS NULL or
employment_type IS NULL or
job_title IS NULL or
salary IS NULL or salary_currency IS NUll or salary_in_usd IS NULL or
employee_residence IS NULL or remote_ratio IS NULL or company_location IS NULL or company_size IS NUll;

SELECT 
    MIN(salary_in_usd) AS min_salary,
    MAX(salary_in_usd) AS max_salary,
    AVG(salary_in_usd) AS avg_salary
FROM datascience_salaries_2024;

SELECT 
    job_title, 
    COUNT(*) AS count
FROM datascience_salaries_2024
GROUP BY job_title
ORDER BY count DESC;

SELECT 
    experience_level, 
    COUNT(*) AS count
FROM datascience_salaries_2024
GROUP BY experience_level
ORDER BY count DESC;

SELECT 
    job_title, 
    AVG(salary_in_usd) AS avg_salary,
    MIN(salary_in_usd) AS min_salary,
    MAX(salary_in_usd) AS max_salary
FROM datascience_salaries_2024
GROUP BY job_title
ORDER BY avg_salary DESC;

SELECT 
    work_year, job_title,
    AVG(salary_in_usd) AS avg_salary
FROM datascience_salaries_2024
GROUP BY work_year, job_title
ORDER BY work_year;


SELECT 
    remote_ratio,  
    AVG(salary_in_usd) AS avg_salary
FROM datascience_salaries_2024
GROUP BY remote_ratio
ORDER BY remote_ratio;

SELECT 
    job_title, 
    experience_level, 
    AVG(salary_in_usd) AS avg_salary
FROM datascience_salaries_2024
GROUP BY job_title, experience_level;


SELECT 
    job_title,
    CASE 
        WHEN salary_in_usd < 50000 THEN '<50k'
        WHEN salary_in_usd BETWEEN 50000 AND 100000 THEN '50k-100k'
        WHEN salary_in_usd BETWEEN 100000 AND 150000 THEN '100k-150k'
        WHEN salary_in_usd BETWEEN 150000 AND 200000 THEN '150k-200k'
        ELSE '>200k'
    END AS salary_range,
    COUNT(*) AS count
FROM datascience_salaries_2024
GROUP BY job_title, salary_range
ORDER BY job_title, salary_range;

SELECT 
    company_location, 
    AVG(salary_in_usd) AS avg_salary,
    MIN(salary_in_usd) AS min_salary,
    MAX(salary_in_usd) AS max_salary
FROM datascience_salaries_2024
GROUP BY company_location
ORDER BY avg_salary DESC;


SELECT 
    job_title,
    remote_ratio,
    AVG(salary_in_usd) AS avg_salary
FROM datascience_salaries_2024
GROUP BY job_title, remote_ratio
ORDER BY job_title, remote_ratio;


SELECT company_size, AVG(salary_in_usd) AS avg_salary
FROM datascience_salaries_2024
GROUP BY company_size
ORDER BY avg_salary DESC;

CREATE TABLE salary_growth AS
SELECT job_title, work_year, salary_in_usd,
       LAG(salary_in_usd, 1) OVER (PARTITION BY job_title ORDER BY work_year) AS previous_year_salary,
       (salary_in_usd - LAG(salary_in_usd, 1) OVER (PARTITION BY job_title ORDER BY work_year)) / LAG(salary_in_usd, 1) OVER (PARTITION BY job_title ORDER BY work_year) * 100 AS salary_growth
FROM datascience_salaries_2024;

SELECT 
    job_title, 
    COUNT(*) AS count
FROM datascience_salaries_2024
GROUP BY job_title
ORDER BY count DESC;

SELECT 
    experience_level, 
    COUNT(*) AS count
FROM datascience_salaries_2024
GROUP BY experience_level
ORDER BY count DESc;

select avg(salary_in_usd) as max_salary , job_title from datascience_salaries_2024
group by job_title
order by max_salary desc limit 5;