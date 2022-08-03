SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC 
LIMIT 10; 

insert into employees
(
	emp_no, 
    birth_date,
    first_name,
    last_name,
    gender,
    hire_date 
) values
(
	999901,
    '1986-04-21',
    'JOHN',
    'Smith',
    'M',
    '2011-01-01'
);

insert into employees
(
	birth_date,
    emp_no, 
    first_name,
    last_name,
    gender,
    hire_date 
) values
(
	'1973-03-26',
    999902,
    'Patricia',
    'Lawrence',
    'F',
    '2005-01-01'
) ; 

select * from titles 
order by emp_no desc 
limit 10; 
 
 insert into titles 
 (
	emp_no,
    title,
    from_date
) values 
( 
	999902, 
    'Senior Engineer', 
    '1997-10-01' 
) ;

select * from dept_emp
order by emp_no desc
limit 10 ; 

insert into dept_emp values ( 999903, 'd005', '1997-01-01', '9999-01-01' ) ;

SELECT 
    *
FROM
    departments; 

CREATE TABLE departments_dup (
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);


/*
INSERT DATA INTO A NEW TABLE : 
	INSERT INTO table_2  ( col1, col2, ...coln) 
	SELECT col1, col2, ....coln 
	FROM table_1 
	WHERE condition ; 
 */
 -- example
select * from departments_dup ; #created a new table to duplicate departments table

INSERT INTO departments_dup 
(
	dept_no,
    dept_name
) 
SELECT * 			# * as we are copy all columns from departments 
FROM departments ; 

-- exercise 
select * from departments ; 

insert into departments (
	dept_no,
    dept_name
) values 
(
	'd010',
    'Business Analysis'
) 

