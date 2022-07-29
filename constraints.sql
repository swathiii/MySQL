DROP DATABASE SALES; 

CREATE DATABASE IF NOT EXISTS SALES;
use sales;
create table sales
(
	purchase_number INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    date_of_purchase date not null, 
    customer_id int,
    item_code varchar(10) not null
    #OR PRIMARY KEY(purchase_number)
);

create table customers
(
	customer_id int, 
    first_name varchar(255),
    last_name varchar(255),
    email_address varchar(255),
    number_of_complaints int
);

DROP TABLE customers;

create table customers
(
	customer_id int, 
    first_name varchar(255),
    last_name varchar(255),
    email_address varchar(255),
    number_of_complaints int,
    PRIMARY KEY(customer_id)
    -- UNIQUE KEY (email_address)
);
CREATE TABLE items
(
	item_code varchar(255),
    item varchar(255),
    unit_price NUMERIC(10,2),
    company_id varchar(255),
    PRIMARY KEY (item_code)
);
CREATE TABLE companies
(
	company_id varchar(255),
    company_name varchar(255),
    headquarters_phone_number INT(12),
    PRIMARY KEY(company_id)
);

ALTER TABLE sales
ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE ;

-- ON DELETE CASCADE : optional : if a specified value from the parent table's primary key has been deleted, 
-- all the records from the child table referring to this value will be removed as well 

ALTER TABLE sales 
DROP FOREIGN KEY sales_ibfk_1 ;  #to drop foreign key : DROP FOREIGN KEY foreign_key_name

-- DROP TABLE sales ;
-- DROP TABLE customers ;
-- DROP TABLE  items ; 
-- DROP TABLE companies ; 


#UNIQUE CONSTRAINT 

ALTER TABLE customers
ADD UNIQUE KEY (email_address) ;
-- UNIQUE  KEYS: used whenever you would like to specify that you don't want to see duplicate data in a given field

ALTER TABLE customers
DROP INDEX email_address ;  #do not use paratheses 


-- exercise 

DROP TABLE customers ;

CREATE TABLE customers (

    customer_id INT AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
PRIMARY KEY (customer_id)
#number_of_complaints INT DEFAULT 0 

);

ALTER TABLE customers
ADD COLUMN gender ENUM('M', 'F') AFTER last_name;

INSERT INTO customers (first_name, last_name, gender, email_address, number_of_complaints)
VALUES ('John', 'Mackinley', 'M', 'john.mckinley@365careers.com', 0) ;


#DEFAULT CONSTRAINT 

ALTER TABLE customers
CHANGE number_of_complaints number_of_complaints INT DEFAULT 0 ;  # column name mentioned 2nd time incase you need to change name of col

INSERT INTO customers (first_name, last_name, gender, email_address )
VALUES ('Jane', 'Doe', 'F', 'jane.doe@365careers.com') ;

ALTER TABLE customers
ALTER COLUMN number_of_complaints DROP DEFAULT ; #note : ALTER 

SELECT * FROM customers ;


-- exercise : from companies table make ph number unique and set 'X' as default company name 
-- drop table companies after executing table 

ALTER TABLE companies
ADD UNIQUE KEY (headquarters_phone_number) ; 

ALTER TABLE companies
CHANGE company_name company_name VARCHAR(255) DEFAULT 'X' ; 

DROP TABLE companies ; 


-- NOT NULL CONSTRAINT 

CREATE TABLE companies
(
	company_id varchar(255),
    company_name varchar(255), #NOT NULL,
    headquarters_phone_number INT(12),
    PRIMARY KEY(company_id)
);

ALTER TABLE companies
MODIFY company_name VARCHAR(255) NULL ; #note : MODIFY 

ALTER TABLE companies 
CHANGE COLUMN company_name company_name VARCHAR(255) NOT NULL ;  #note CHANGE 


-- exercise : add NULL to ph. no. under companies table and then drop the same constraint 

ALTER TABLE companies 
MODIFY headquarters_phone_number INT NULL ; 

ALTER TABLE companies 
CHANGE COLUMN headquarters_phone_number headquarters_phone_number INT NOT NULL ; 