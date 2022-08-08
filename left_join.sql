select * from dept_manager_dup 
order by dept_no ;  

select * from departments_dup
order by dept_no ; 

#removing duplicates from the two tables 
delete from departments_dup where dept_name = 'Public Relations' ;
delete from departments_dup where dept_no = 'd009' ; 
delete from dept_manager_dup where emp_no = '110228' ; 

#add back the initial records 
insert into departments_dup(dept_name) values ('Public Relations') ;
insert into dept_manager_dup values ('110228', 'd003', '1992-03-21', '9999-01-01') ;
insert into departments_dup values ('d009', 'Customer Service') ; 

#LEFT JOIN : all matching values of 2 tables + all values from left table that match no values from the right table
#the syntax is the same except we explicitly mention LEFT JOIN
#the order in which you join matters, unlike inner join

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m 					#left table
        LEFT JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

#changing the order of the two tables 

SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
    departments_dup d
        LEFT JOIN
    dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY d.dept_no;

-- exercise : employees and dept_manager : left table : employee whose lastname is markovich
#cols : emp_no, first_name, last_name, dept_no, from_date
select * from employees ; 
select * from dept_manager ; 

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    dm.dept_no,
    dm.from_date
FROM
    employees e
        LEFT JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
WHERE
    e.last_name = 'Markovitch' 				# correction : e.last_name
ORDER BY dm.dept_no DESC, e.emp_no ;  		#first order by dept_no DESC and them emp_no