/*
UPDATE : updates  the values of existing records in a table
	SYNTAX:
	UPDATE table_name
	SET column_1 = value_1,  column_2 = value_2, ...
	WHERE conditions ;
    
if you don't provide a where condition all rows will be updated

TRANSACTION CONTROL LANGUAGE :
COMMIT : saves the transaction in the data base, changes cannot be undone
ROLLBACK :  Allows you to step back , reverts back to the  last non-committed state
*/

SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999901;

UPDATE employees 
SET 
    first_name = 'Stella',
    last_name = 'Parkinson',
    birth_date = '1990-12-31',
    gender = 'F'
WHERE
    emp_no = 999901;
    
SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no; 

commit ; 

UPDATE departments_dup 
SET 
    dept_no = 'd011',
    dept_name = 'Quality Control'; 

rollback ; #IMPORTANT TO EXECUTE COMMIT SO ALL PREVIOUS DATA ISN'T LOST 

COMMIT ; 

-- exercise 
select * from departments
where dept_no = 'd010' ; 
 
UPDATE departments 
SET 
    dept_name = 'Data Analysis'
WHERE
    dept_no = 'd010'; 