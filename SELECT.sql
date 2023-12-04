SELECT 
    first_name, last_name
FROM
    employees;
    
#exercise 
SELECT 
    dept_no
FROM
    departments;
    
SELECT 
    *
FROM
    departments; 
    
#WHERE
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis'; 
    
#ex : 
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis'; 
    
#AND 
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' AND gender = 'M'; 

#ex 
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' AND gender = 'F'; 

#OR 
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis'
        OR first_name = 'Elvis'; 
        
#ex: 
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie'
        OR first_name = 'Aruna'; 
   
/*        
OPERATOR PRECEDENCE 
AND is applied first by SQL and then OR
Use parantheses to work with this 
*/
SELECT 
    *
FROM
    employees
WHERE
    last_name = 'Denis'
        AND (gender = 'M' OR gender = 'F'); 

#ex
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND (first_name = 'kellie'
        OR first_name = 'Aruna'); 
        
#IN 
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Cathie' , 'Mark', 'Nathan'); 
    
#NOT IN
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('Cathie' , 'Mark', 'Nathan'); 
    
#ex 
select * from employees where first_name in ('Denis', 'Elvis') ; 
select * from employees where first_name not in ('John', 'Mark', 'Jacob') ; 

#LIKE
select * from employees where first_name LIKE ('Mar%') ; 
select * from employees where first_name LIKE ('%mar%'); 
# % acts as a substitute for a sequence of characters 
# _ help you match a single character 
select * from employees where first_name LIKE ('Mar_') ; 
select * from employees where first_name LIKE ('_ar__') ; 

#ex 
select * from employees where first_name LIKE ('Mark%'); 
select * from employees where hire_date LIKE ('%2000%') ; 
select * from employees where emp_no LIKE ('1000_') ; 

#Wildcard Characters: *, %, _
select * from employees where first_name LIKE ('Jack%') ; 
select * from employees where first_name NOT LIKE ('Jack%') ; 

#BETWEEN... AND...
SELECT 
    *
FROM
    employees
WHERE
    hire_date BETWEEN '1990-01-01' AND '2000-01-01'; 

#ex
select * from salaries where salary between '66000' and '70000' ; 
select * from salaries where emp_no not between '10004' and '10012' ; 
select * from departments where dept_no between 'd003' and 'd006' ; 

select * from employees where first_name != 'Mark' ; 
select * from employees where hire_date <= '1985-02-01' ; 
#ex
select * from employees where gender = 'F' and hire_date >= '2000-01-01' ; 
select * from salaries where salary > 150000 ; 

#SELECT DISTINCT : 
SELECT DISTINCT
    gender
FROM
    employees; 
    
select distinct hire_date from employees ; 

#AGGREGATE FUNCTIONS : applies on multiple rows of a single column of a table and return an output of a single value 
# COUNT(), MIN(), MAX() ; 
SELECT 
    COUNT(emp_no)
FROM
    employees; 
    
SELECT 
    COUNT(DISTINCT first_name)
FROM
    employees; 
    
SELECT 
    COUNT(salary)
FROM
    salaries
WHERE
    salary >= 100000;
    
select count(title) from titles where title = 'Manager'  ; 
select count(emp_no) from dept_manager ; 

#ORDER BY
SELECT 
    *
FROM
    employees
ORDER BY first_name DESC; #alternative is ASC 

SELECT 
    *
FROM
    employees
ORDER BY first_name, last_name ASC ; 

#ex :
SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC; 

#GROUP BY : must be placed immediately after the WHERE condition and just before the ORDER BY
SELECT 
    first_name, COUNT(first_name)
FROM
    employees
GROUP BY first_name
ORDER BY first_name DESC; 

#ALIASES: AS
SELECT 
    first_name, COUNT(first_name) AS names_count 
FROM
    employees
GROUP BY first_name
ORDER BY first_name DESC; 

#ex
select * from salaries ; 

SELECT 
    salary, COUNT(emp_no) AS emps_with_same_salary
FROM
    salaries
WHERE
    salary > 80000
GROUP BY salary
ORDER BY salary; 
 
 /*
 HAVING: needs to be inserted between group by and order by clauses 
 after HAVING, you can have a condition with an aggregate function while WHERE cannot use 
 ggregate functions with its conditions */
 
 select * from employees having hire_date >= '2000-01-01' ; 
 
 SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
HAVING COUNT(first_name) > 250
ORDER BY first_name; 

#ex 
SELECT 
    emp_no, salary, avg(salary) as average_salary
FROM
    salaries
group by emp_no 
having average_salary > 120000 ; 

#extracting a list of all names that are encountered less than 200 times.
#Let the data refer to the people hired after the 01-01-1999

SELECT 
    first_name, COUNT(first_name) AS FN_count, hire_date
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING FN_count < 200
ORDER BY FN_count ASC; 

#ex: select the employee numbers of all individuals who have signed more than 1 contract
#after the 1st of January 2000
select * from dept_emp ; 

select emp_no, count(emp_no) as emp_count, from_date, to_date
from dept_emp 
where from_date > '2000-01-01'
group by emp_no 
having emp_count > 1
order by from_date desc ;  

select emp_no, count(emp_no) as emp_count, from_date, to_date
from dept_emp 
where from_date > '2000-01-01'
group by emp_no 
having count(from_date) > 1
order by from_date desc ; 

# 10 highest salaries 
SELECT 
    *
FROM
    salaries
order by salary desc 
limit 10 ; 

#ex 
SELECT 
    *
FROM
    dept_emp
LIMIT 100; 