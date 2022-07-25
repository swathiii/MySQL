CREATE DATABASE IF NOT EXISTS SALES;
use sales;
create table sales
(
	purchase_number int not null primary key auto_increment,
    date_of_purchase date not null, 
    customer_id int,
    item_code varchar(10) not null
);

create table customers
(
	customer_id int, 
    first_name varchar(255),
    last_name varchar(255),
    email_address varchar(255),
    number_of_complaints int
);

select * from sales; #set a default database : ex : sales ; select * from customers
select * from sales.sales; #call a table from a certain database : database_object.sql_object