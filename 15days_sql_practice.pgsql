------------------------------------------------

-- Get single or multiple columns

select 
	first_name,
	last_name 
from 
	actor a; 

--------------------------------------------------	

-- Get all Columns in a table 

select 
	*
from
	address a; 

--------------------------------------------------	

-- Challenge Questions : First Name, Last Name and 

	
	
select 
	first_name, 
	last_name, 
	email
from customer c;

--------------------------------------------------	
	
-- Challenge Questions: Order the customer name in 
-- Descending Order 

select 
	first_name, 
	last_name,
	email 
from 
	customer
order by 
	 
	last_name desc,
	first_name desc;

-- Another method 
	
select 
	first_name, 
	last_name,
	email 
from 
	customer
order by 
	 
	2 desc,
	1 desc;

--------------------------------------------------	
	
-- Get Distinct Prices Paid by Customers in Descending
-- Order 
	
select 
	distinct amount
from 
	payment p 
order by amount desc;

--------------------------------------------------
-- Challenge for the day 

-- Create a list of all the distinct districts where
-- customers are from 

select 
	distinct district
from 
	address a; 
	
-- What is the latest rental date? 
	
select
	rental_date
from 
	rental r 
order by 
	rental_date desc
limit 1;

-- How many films does the company have??

select 
	count(film_id)
from 
	film; 
	
-- How many distinct last name of customers 
-- there? 
	
select 
	count(distinct last_name)
from 
	customer c; 
--------------------------------------------------	
-- Challenge Problem 1 	

select
	count(payment_id)
from
	payment 
where 
	customer_id = 100;

-- Challenge Problem 2 
	
select
	first_name, 
	last_name
from 
	customer 
where 
	first_name = 'ERICA';
--------------------------------------------------	
select
	*
from 
	payment
where
	amount > 10
order by 
	amount ;
---------------------------------------------------
-- Grouping in Postgres SQL	
-- Aggregation functions 

select 
	sum(amount) as Sum,
	round(avg(amount),2) as Average
from 
	payment;
	
---------------------------------------------------

-- Challenge in Grouping Columns	
	
select 
	staff_id,
	sum(amount) as total_amount,
	count(*)
from 
	payment
where
	amount != 0
group by 
	staff_id
order by 
	total_amount asc;

---------------------------------------------------

-- Grouping Data by Multiple Columns 

select
	staff_id, 
	date(payment_date),
	sum(amount),
	count(*)
from
	payment
where 
	amount != 0
group by 
	staff_id, 
	date(payment_date)
order by 
	sum(amount) desc;
	
---------------------------------------------------

-- DAY 4 : Intermediate Functions

-- UPPER AND LOWER STRING FUNCTIONS

SELECT 
	UPPER(email) as email_upper,
	LOWER(email) as email_lower
FROM 
	customer;

-- LENGTH FUNCTIONS - Gets the Length of the string

-- The below query gets the length of the email greater than 30 

SELECT 
	UPPER(email) as email_upper,
	LOWER(email) as email_lower
FROM 
	customer
WHERE LENGTH(email) > 30;

-- Write a query to find all the customers where 
-- their first name or last name is greater than 10
-- characters 

SELECT
	lower(first_name) as first_name_lower,
	lower(last_name) as last_name_lower,
	lower(email) as email_lower  
FROM
	customer
WHERE
	length(first_name) > 10
	or length(last_name) > 10;

-- Left function helps in getting a substring from left 
-- When you pass the LEFT(column_name, substring_length) 
-- it will retrieve values to that level only

SELECT
	LEFT(first_name, 2),
	first_name
FROM
	customer;

-- You can also get a single character at a position from you
-- can do as shown below

SELECT
	LEFT(first_name,2),
	RIGHT(LEFT(first_name,2),1),
	first_name
FROM
	customer;

-- Challenge 
-- Get the last five letters of the email address 
-- Get the email address always ends with .org
-- 
SELECT
	RIGHT(email,5) as last_5_letters
FROM
	customer;

SELECT
	RIGHT(email,4) as domain_name
FROM
	customer;

SELECT
	LEFT(RIGHT(email,4),1)
FROM
	customer;


	