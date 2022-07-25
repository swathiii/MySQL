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

