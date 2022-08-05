/* 
aggregate functions can be applied to any group of data values within a certain column
which is why they're frequently used together with a group by clause  
*/

#COUNT 

SELECT 
    *
FROM
    salaries
ORDER BY salary DESC
LIMIT 10; 

select count(salary)
from salaries ; 

select count(distinct salary)
from salaries ; 

-- exercise : How many departments are there in the “employees” database?
select * from dept_emp ; 

SELECT 
    COUNT(DISTINCT dept_no)
FROM
    dept_emp; 
    
#SUM()

SELECT 
    SUM(salary)
FROM
    salaries; 
    
-- exercise : total amount of money spent on salaries for all contracts starting after the 1st of January 1997

SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01'; 
    

#MIN() and MAX() 

select min(salary)
from salaries ; 

-- exercise : lowest and highest employee number in the database 

SELECT 
    MIN(emp_no)
FROM
    employees; 

SELECT 
    MAX(emp_no)
FROM
    employees; 


#AVG() 

SELECT 
    AVG(salary)
FROM
    salaries; 
    
 -- exercise 
 SELECT 
    AVG(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01'; 
 
 
 #ROUND() : usually applied to the single values that agregate functions return 
 #ROUND( #, decimal places ) 
    
SELECT 
    ROUND(AVG(salary))
FROM
    salaries; 
    
SELECT 
    ROUND(AVG(salary), 3)
FROM
    salaries; 

-- exercise 
SELECT 
    ROUND(AVG(salary), 2)
FROM
    salaries
WHERE
    from_date > '1997-01-01'; 
    
    
#IFNULL() AND COALESCE() 
/*
IF NULL() and COALESCE() are among the advanced SQL functions in the
toolkit of SQL professionals. They are used when null values are
dispersed in your data table and you would like to substitute the
null values with another value

IFNULL(expression_1, expression_2) : returns the first value if the data value
in the table is not null, and returns the second value if there is a null value  

IFNULL() cannot contain more than 2 parameters, this is where we use coalesce() 

COALESCE( expression_1, expression_2, ... expression_N )  : allows you to insert
N arguments in the parantheses 

it will always return a single value of the ones we have within paratheses, and 
this value will be the first non-null value of this list, reading the values 
from left to right 

*/

select * from departments_dup 
order by dept_no ; 

#Adjusting the departments_dup table to suit the purposes of these two functions 

alter table departments_dup
change column dept_name dept_name varchar(40) NULL ; 

insert into departments_dup(dept_no) 
values ('d010') , ('d011') ; 

alter table departments_dup
add column dept_manager varchar(255) NULL AFTER dept_name ; 

commit ; 

-- IFNULL() 

SELECT 
    dept_no,
    IFNULL(dept_name,
            'department name not provided') as dept_name
FROM
    departments_dup;
    
#to use more than 2 parameters we use coalesce() 

SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_manager, dept_name, 'N/A') AS dept_manager
FROM
    departments_dup
ORDER BY dept_no; 

-- to help visualize a prototype of the table's final version 
SELECT 
    dept_no,
    dept_name,
    COALESCE('department manager name') AS new_col 
FROM
    departments_dup; 
    
-- exercise 
select * from departments_dup ; 

SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    departments_dup
ORDER BY dept_no; 

SELECT 
    IFNULL(dept_no, 'N/A') as dept_no,
    IFNULL(dept_name,
            'Department name not provided') as dept_name,
	COALESCE(dept_no, dept_name) AS dept_info
FROM
    departments_dup
ORDER BY dept_no; 