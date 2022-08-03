/*
DELETE : Removes records from a database 
	SYNTAX: 
    DELETE FROM table_name
	WHERE conditions ; 
*/

use employees ; 

commit ; 

SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999903; 
    
SELECT 
    *
FROM
    titles
WHERE
    emp_no = 999903; 

DELETE FROM employees 
WHERE
    emp_no = 999903; #deletes emp info in titles table as well due to on delete cascade
    
rollback ;  #to go back to last commit if you've performed a delete by mistake 

select * from departments_dup ; 
delete from departments_dup ; #not specify a where condition will delete the entire table
#this is an unsafe delete as there is no where clause 

rollback ; 

#NOTE : don't forget to attach a condition to the WHERE clause 

-- exercise : delete row 10 from departments 
select * from departments 
where dept_no = 'd010' ; 

DELETE FROM departments 
WHERE
    dept_no = 'd010'; 
    

/* DROP vs DELETE vs TRUNCATE 
DROP : You won't be able to roll back to its initial state, or to the last commit statement (unlike delete).
	- It drops everything! the records, table structure and the constraints
	- use drop table if you're not gonna use the table in question anymore

TRUNCATE : DELETE without the WHERE clause. Removes all the records in the table but table structure will remain intact.
	- it resets the auto-increment values

DELETE : Removes records row-by-row. Resembles truncate if there is no where clause provided

Truncates faster (implements output) as delete removes records row-by-row
	- auto-increment values are not reset with DELETE
*/