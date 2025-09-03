SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE first_name = "Tom";



SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE age > 40;


SELECT first_name, last_name, salary
FROM parks_and_recreation.employee_salary
WHERE salary <= 70000 AND salary >= 40000;


SELECT first_name, last_name, salary
FROM parks_and_recreation.employee_salary
WHERE salary <= 70000 AND salary >= 40000
LIMIT 3;


SELECT *
FROM parks_and_recreation.employee_demographics AS dem
JOIN employee_salary as sal
ON dem.employee_id = sal.employee_id
WHERE salary > 40000;



SELECT gender, AVG(salary) as avgsal
FROM parks_and_recreation.employee_demographics AS dem
JOIN employee_salary as sal
ON dem.employee_id = sal.employee_id
GROUP BY gender;

SELECT gender, sum(salary) as SumSal
FROM parks_and_recreation.employee_demographics AS dem
JOIN employee_salary as sal
ON dem.employee_id = sal.employee_id
GROUP BY gender;

SELECT gender, sum(salary) as SumSal
FROM parks_and_recreation.employee_demographics AS dem
JOIN employee_salary as sal
ON dem.employee_id = sal.employee_id
GROUP BY gender
HAVING SumSal > 300000;


SELECT first_name, last_name
FROM employee_demographics
WHERE first_name LIKE 'b%';

UPDATE employee_salary
SET salary = 45000
WHERE salary = 40000;





SELECT gender, AVG(salary) as AverageSalary , min(salary), max(salary), COUNT(salary)
FROM parks_and_recreation.employee_demographics AS dem
JOIN employee_salary as sal
ON dem.employee_id = sal.employee_id
GROUP BY gender;


SELECT distinct *
FROM parks_and_recreation.employee_demographics AS dem
JOIN employee_salary as sal
ON dem.employee_id = sal.employee_id
JOIN parks_departments
ON sal.dept_id = parks_departments.department_id;



SELECT first_name, last_name, 
    AVG(salary) OVER (PARTITION BY gender) AS avg_salary_by_gender
FROM parks_and_recreation.employee_demographics AS dem
JOIN employee_salary AS sal
    ON dem.employee_id = sal.employee_id;


SELECT employee_id, age, birth_date
FROM parks_and_recreation.employee_demographics
ORDER BY age DESC;


SELECT employee_id, age, birth_date
FROM parks_and_recreation.employee_demographics
ORDER BY age DESC;


WITH CTE_ex AS
(
SELECT gender, AVG(salary) as AverageSalary , min(salary), max(salary), COUNT(salary)
FROM parks_and_recreation.employee_demographics AS dem
JOIN employee_salary as sal
ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT FLOOR(AVG(AverageSalary)) AS AvgSalaryNoDecimals
FROM CTE_ex
;

SELECT first_name, last_name, age
FROM employee_demographics
HAVING age > 35;

SELECT dem.last_name, dem.gender, birth_date, occupation
FROM employee_demographics as dem
JOIN employee_salary as sal
ON dem.employee_id = sal.employee_id
WHERE year(dem.birth_date) between '1979' and '2025'
;




