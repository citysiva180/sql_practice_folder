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
	
	