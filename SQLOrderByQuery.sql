SELECT *
FROM sales.customers;

--WAQD to get firstname of customers in ordered

select first_name, last_name
from sales.customers
order by first_name;

--WAQD the firstname in descending

select first_name
from sales.customers
order by first_name DESC;

/* WAQD the first name, last name, and city of the customers. 
It sorts the customer list by the city first and then by the first name*/

select city, first_name, last_name
from sales.customers
order by city, first_name;

/*WAQD sorts the customers by the city in descending order and 
then sorts the sorted result set by the first name in ascending order.*/

SELECT city, first_name
from sales.customers
order by city desc, first_name asc;


select *
from sales.customers;

insert into sales.customers values
(11, 'Lokesh', 'Ramisetty', null, 'Lokesh@gamil.com', '500304mahadevapura', 'Campbell', 'KA', 56006);

/*WAQD It is possible to sort the result set by a column that does not appear on the select list. 
For example, the following statement sorts the customer by the state even though the 
state column does not appear on the select list.*/

select city, first_name, last_name
from sales.customers
order by state;

--WAQD order the 1st name in desc with lenght of 1st name

select first_name, last_name, len(first_name) as Lenghtof1stName
from sales.customers
order by len(first_name) desc;

/*WAQD sorts the customers by first name and last name. But instead of specifying the 
column names explicitly, it uses the ordinal positions of the columns:*/

select first_name, last_name
from sales.customers
order by 1,2;

select *
from sales.customers;

insert into sales.customers values
(12, 'Jacquline', 'Joe', null, 'Joe@gmail.com', '2452Krpuram','mumbai', 'MH', 34356);

