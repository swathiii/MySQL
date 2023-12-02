CREATE DATABASE IF NOT EXISTS Sales ; #SQL is not case-sensitive 

USE Sales ; 

CREATE TABLE sales
(
	purchase_number INT NOT NULL PRIMARY KEY AUTO_INCREMENT, #saves time in the future from manually inserting values also maintains a unique value for every column
    date_of_purchase DATE NOT NULL,
    customer_id INT, 
    item_code VARCHAR(10) NOT NULL
); 

CREATE TABLE customers 
(
	customer_id INT, 
    first_name VARCHAR(255), 
    last_name VARCHAR(255), 
    email_address VARCHAR(255), 
    number_of_complaints INT
); 

 /*
 to call a table from a particular database
 database_object.sql_object : example SELECT * FROM sales.customers ; 
 here the dot operator signals the existence of a connection between the two object types
 */
 
 SELECT * FROM sales ; #we have already used USE sales in line 3
 #OR 
 SELECT * FROM sales.sales ; 
 
 DROP TABLE sales ; 
 
 CREATE TABLE sales
(
	purchase_number INT AUTO_INCREMENT, #saves time in the future from manually inserting values also maintains a unique value for every column
    date_of_purchase DATE,
    customer_id INT, 
    item_code VARCHAR(10),
    PRIMARY KEY (purchase_number) 
); 

#to add a foregin key : note that this is done after all the tables below have been created 
ALTER TABLE sales
ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE; 

#to remove the existing foregin key 
ALTER TABLE sales 
DROP FOREIGN KEY sales_ibfk_1 ; 

DROP TABLE customers; 

CREATE TABLE customers
(
customer_id INT, 
first_name VARCHAR(255), 
last_name VARCHAR(255), 
email_address VARCHAR(255),
number_of_complaints INT, 
primary key(customer_id) 
); 

CREATE TABLE items
(
item_code VARCHAR(255), 
item VARCHAR(255), 
unit_price NUMERIC(10, 2), 
company_id VARCHAR(255),
primary key(item_code)
);

 CREATE TABLE companies 
 (
 company_id VARCHAR(255),
 company_name VARCHAR(255),
 headquarters_phone_number INT(12),
 primary key(company_id)
 ); 
 
 DROP TABLE sales ; 
 DROP TABLE customers ; 
 DROP TABLE items ; 
 DROP TABLE companies ; 

create table customers 
(
	customer_id INT AUTO_INCREMENT, 
    first_name VARCHAR(255),
    last_name VARCHAR(255), 
    email_address VARCHAR(255), 
    number_of_complaints INT, 
    PRIMARY KEY (customer_id)
);

#adding a gender column to the customers table
alter table customers 
add column gender ENUM('M', 'F') 
after last_name ; 

INSERT INTO customers (first_name, last_name, gender, email_address, number_of_complaints)
VALUES('John', 'Mackinley', 'M', 'john.mckinley@365careers.com', 0) ; 

ALTER TABLE customers 
CHANGE COLUMN number_of_complaints number_of_complaints INT DEFAULT 0 ; 

INSERT INTO customers(first_name, last_name, gender)
VALUES ('Peter', 'Figaro', 'M') ; 

SELECT * from sales.customers ; 

#removing the default 
alter table customers
alter column number_of_complaints drop default ; 

#recreating the companies table
create table companies 
(
company_id varchar(255), 
company_name varchar(255) DEFAULT 'X', 
headquarters_phone_number varchar(255), 
primary key (company_id), 
unique key (headquarters_phone_number) 
); 

select * from companies ; 

drop table companies ; 

create table companies 
(
company_id int auto_increment, 
headquarters_phone_number varchar(255), 
company_name varchar(255) not null, 
primary key (company_id)
); 

#to change company_name to contain null values 
alter table companies 
modify company_name varchar(255) null ; #must use modify as you can't drop a not null constraint

#adding the not null constraint again 
alter table companies 
change column company_name company_name varchar(255) not null ; 

insert into companies (headquarters_phone_number, company_name)
values ('+1 (202) 555-0196', 'Company A') ; 

select * from companies ; 

alter table companies 
modify headquarters_phone_number varchar(255) null ; 

alter table companies
change column headquarters_phone_number headquarters_phone_number varchar(255) not null ; 







/*
#DATA TYPES 
- a variable of the string data type is aka an alphanumeric data type 
-----string
CHAR : fixed storage, ex- CHAR(5), maximun size: 255 bytes
VARCHAR : variable storage, ex - VARCHAR(5), maximum size: 65, 535 bytes
ENUM : enumerate : can only add values specified, for example - sex would have ENUM( 'M', 'F')

----- integers 
 INTEGERS : whole numbers with no decimal points, signed by default 
 signed : -128 to 128  or 0 to 255 for tinyint, there;s smallint, mediumint, bigint
 
 PRECISION : refers to the number of digits in a number , 10.523 : 5 precision, scale of 3
 SCALE: number of digits to the right of a decimal point in a number 
 DECIMAL ( 5, 3) : precision is 5 and scale is 3 
 - when only 1 digit is mentioned in DECIMAL, it is considered to be its precision 
 NUMERIC ( p, s) ; precision and scale 
 
 FIXED POINT : represent exact values : decimal(5, 3) : 10.1 would be 10.100, automatically filled by 0's
	#DECIMAL and NUMERIC 
    
FLOATING POINT: used for approximate values, aims to balance range and precision 
	#for example FLOAT(5, 3) : 10.5237566 would result in 10.524 which is an approzimate value 
    #FLOAT AND DOUBLE 
    
DATE TYPE : DATETIME ; shows date and time, 
TIMESTAMP : used for well-defind, exact point in time, shows the time lapsed since
1st January 1970 UTC - 19th Jan 2038, 3:14:07 UTC
	
BLOB : Binary Large Object : refers to a file of binary data - data with 1s and 0s
*/


