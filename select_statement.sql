SELECT 
    *
FROM
    employees;
SELECT 
    first_name, last_name, gender
FROM
    employees;  # beautify to auto-indent (Brush) OR ctrl + B
    
-- exercise: select dept_no from departments, select everything from dept
SELECT 
    dept_no
FROM
    departments; 

SELECT 
    *
FROM
    departments; 
    
#WHERE and AND clause 

SELECT 
    *
FROM
    employees
WHERE
    gender = 'M' AND first_name = 'Alain'; 
    
-- exercise : Retrieve a list with all female employees whose first name is Kellie. 
SELECT * FROM employees WHERE first_name = 'Kellie' AND gender = 'F' ; 

#OR CLAUSE 
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie'
        OR first_name = 'Aruna';
        
#OPERATOR PRECEDENCE : AND > OR 
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND (first_name = 'Kellie' OR first_name = 'Aruna'); 
        
#IN / NOT IN Clause
select * from employees where first_name IN ('Denis', 'Elvis') ; 
select * from employees where first_name NOT IN ('John', 'Mark', 'Jacob') ; 

#LIKE / NOT LIKE clause 
/* LIKE / NOT LIKE  : succeeded by parentheses within which the pattern must be
ex : first_name LIKE( 'mar%' ) ;  this returns all first name starting with 'mar'

% : a substitute for a sequence of characters
	'%mar' will return all first names ending with mar
	'%mar%' will return all first name containing 'mar' anywhere within their first name

_ (underscore) : helps you match a single character
	ex : first_name LIKE( 'mar_' ) ; returns a name with mar_, with the underscore containing a single character. 
	OUTPUT : mark, marl, mart, marv, mara, marb and so on */
    
    select * from employees where first_name LIKE ('Mark%') ; 	 #name starts with mark 
    select * from employees where hire_date LIKE ('%2000%') ;    #all employees hired in the year 2000 
    select * from employees where emp_no LIKE ('1000_') ; 		 #emp_no starting with 1000 containint 5 numbers 

#wildcard characters : %, *, _
-- exercise : 
select * from employees where first_name LIKE ('%JACK%') ;     #NOTE: SQL is not case sensitive 
select * from employees where first_name NOT LIKE ('%Jack%') ;

#BETWEEN - AND Clause
 -- contracts from 66,000 to 70,000 dollars per year.
select * from salaries ;  
SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN '66000' AND '70000'; 

 -- all individuals whose employee number is not between ‘10004’ and ‘10012’
SELECT 
    *
FROM
    employees
WHERE
    emp_no NOT BETWEEN '10004' AND '10012'; 
    
 -- names of all departments with numbers between ‘d003’ and ‘d006’
SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no BETWEEN 'd003' AND 'd006'; 
    
#IS NOT NULL - IS NULL 
SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no IS NOT NULL; -- names of all departments whose department number value is not null.
    
#COMPARISON OPERATORS 
select * from employees ; 

-- list with data about all female employees who were hired in the year 2000 or after.
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND (hire_date >= '2000-01-01'); 
	
-- list with all employees’ salaries higher than $150,000 per annum.
SELECT 
    *
FROM
    salaries
WHERE
    salary > '150000'; 

#SELECT DISTINCT :  selects all distinct, different data values 
SELECT DISTINCT
    first_name
FROM
    employees;
    
-- exercise 
SELECT DISTINCT
    hire_date
FROM
    employees; 


#AGGREGATE FUNCTIONS : count() ; sum() ; min() ; max() ; avg() 
#COUNT - DISTINCT 
-- annual contracts with a value higher than or equal to $100,000 have been registered in the salaries table
select * from salaries ; 
SELECT 
    COUNT(DISTINCT salary) #OR COUNT(*) 
FROM
    salaries
WHERE
    salary > '100000'; 

-- How many managers do we have in the “employees” database?
select * from employees ; 
SELECT 
    COUNT(DISTINCT emp_no)
FROM
    dept_manager; 
    
#OR

SELECT 
    COUNT(*)
FROM
    dept_manager; 
    
#ORDER BY 
SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC; 

#GROUP BY 
SELECT 
    first_name, COUNT(first_name)
FROM
    employees
GROUP BY first_name
ORDER BY first_name DESC ; 

#ALIASES (AS) 
SELECT 
    first_name, COUNT(first_name) AS names_count #alias : names_count
FROM
    employees
GROUP BY first_name
ORDER BY names_count ASC ; 

-- exercise 
	/* Write a query that obtains two columns. The first column must contain annual salaries 
	higher than 80,000 dollars. The second column, renamed to “emps_with_same_salary”, 
	must show the number of employees contracted to that salary. Lastly, 
	sort the output by the first column. */
select * from salaries ; #salary : 36617 ; emp_no : 36617 rows - same result 
SELECT 
    salary, COUNT(emp_no) AS emps_with_same_salary     #OR COUNT(salary) : works only because every employee has a salary in this DB, results will vary in case of unpaid interns 
FROM
    salaries
WHERE
    salary > '80000'
GROUP BY salary
ORDER BY salary; 

#HAVING : frequently implemented with GROUP BY 
-- all employees whose average salary is higher than $120,000 per annum.

SELECT 
    *, AVG(salary) AS avg_sal
FROM
    salaries
GROUP BY emp_no
HAVING avg_sal > '120000'
ORDER BY emp_no; 

#OR 

SELECT
    *, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000;

#OR - without using the HAVING clause 

SELECT
    *, AVG(salary)
FROM
    salaries
WHERE
    salary > 120000
GROUP BY emp_no
ORDER BY emp_no;
/* When using WHERE instead of HAVING, the output is larger because in the output we include
 individual contracts higher than $120,000 per year. The output does not contain average 
 salary values. */

#WHERE vs HAVING 
--  employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000
select * from dept_emp ; 

SELECT 
    emp_no
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no;

#LIMIT 
SELECT 
    *
FROM
    dept_emp
LIMIT 100; 

