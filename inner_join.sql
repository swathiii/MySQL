SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no; 

#dropping dept_manager column 
alter table departments_dup
drop column dept_manager ; 

#allowing dept_no to contain NULL values 
alter table departments_dup
change column dept_no dept_no char(4) null ; 

insert into departments_dup (dept_name) values ('Public Relations') ; 

#Delete the record(s) related to department number two.
delete from departments_dup 
where dept_no = 'd002' ; 

#creating dept_manager_dup table 

DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (
  emp_no int(11) NOT NULL,
  dept_no char(4) NULL,
  from_date date NOT NULL,
  to_date date NULL
  );

INSERT INTO dept_manager_dup
select * from dept_manager;

INSERT INTO dept_manager_dup (emp_no, from_date)
VALUES  (999904, '2017-01-01'),
        (999905, '2017-01-01'),
        (999906, '2017-01-01'),
        (999907, '2017-01-01');
 
DELETE FROM dept_manager_dup
WHERE
    dept_no = 'd001';

#INNER JOIN 
/* 
SELECT table1.column_name(s), table2.column_name(s) 
FROM table_1 t1
INNER JOIN table2  t2 ON table1.column_name = table2.column_name ; 

t1 and t2 are table aliases name, AS is not used 
*/
 
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no; 

/* exercise : to extract a list containing information about all managers employee number, first and last name 
department number, and hire date */ #tables : dept_manager_dup and employees

select * from dept_manager_dup ; 
select * from employees 
order by hire_date ; 

#emp_no, first and last name, dept number and hire date
select m.emp_no, e.first_name, e.last_name, m.dept_no, e.hire_date 
from employees e
inner join dept_manager_dup m on m.emp_no = e.emp_no
order by e.emp_no ; 


#DUPLICATE RECORDS 
insert into dept_manager_dup 
values ('110228', 'd003', '1992-03-21', '9999-01-01') ; 

insert into departments_dup
values( 'd009', 'Customer Service') ; 

#having dulpicates in the table will produce duplicated data in the join table 
#to work around this you use GROUP BY on the field that differs most among records 

select * from dept_manager_dup 
order by dept_no ;  

select * from departments_dup
order by dept_no ; 

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no; 

#USING GROUP BY 

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
GROUP BY m.emp_no						#returns table with no duplicate values
ORDER BY m.dept_no; 