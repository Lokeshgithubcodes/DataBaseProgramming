use MyDB

select *
from sales.customers;

--DISTINCT
--select distinct city
select distinct city
from sales.customers;

--returns all cities and states of all customers:

select distinct city, state
from sales.customers;

--finds the distinct phone numbers of the customers:

select distinct phone
from sales.customers;

--distinct city, state, zipcode

select distinct city, state, zip_code
from sales.customers;

--WHERE

create schema production;

create table production.products(product_id int, product_name text, category_id int, model_year int, list_price money);

insert into production.products values 
(280, 'bike', 1, 2012, 11120.54),
(265, 'cycle', 1, 2010, 2000.54),
(290, 'car', 1, 2016, 56120.54),
(277, 'boat', 2, 2011, 45120.54),
(269, 'ship', 2, 2016, 56120.54),
(211, 'flight', 3, 2018, 99120.54),
(214, 'helicopter', 1, 2018, 120.54);

select *
from production.products;

-- WAQD retrieves all products with the category id 1:

select *
from production.products
where category_id=1;

/*WAQD eturns products that meet two conditions: category id is 1, and 
the model is 2018. It uses the logical operator AND to combine the two conditions.*/

select *
from production.products
where category_id=1 and model_year=2018;

--WAQD finds the products whose list price is greater than 300, and the model is 2018.

select *
from production.products
where list_price>100 and model_year=2018;

--WAQD finds the products whose list price is greater than 1000, or the model is 2018.

select *
from production.products
where list_price>1000 or model_year=2018;

--WAQD finds the products whose list prices are between 100 and 10000:

select *
from production.products
where list_price between 100 and 10000
order by list_price desc;

--WAQD uses the IN operator to find products whose list price is 130 or 1000 or 10000.

select *
from production.products
where list_price in (120.54, 11120.54, 2000.54)
order by list_price desc;

select *
from production.products;

--WAQD uses the LIKE operator to find products whose name starts with b:

select *
from production.products
where product_name like 'b%';

--NUll operator:

--WAQD finds the customers who do not have phone numbers recorded in the  customers table:

select *
from sales.customers
where phone is null
order by first_name, last_name;

--WAQD finds the customers have phone numbers recorded in the  customers table:

select *
from sales.customers
where phone is not null
order by first_name, last_name;

--AND operator

/*WAQD finds the products where the category 
identification number is one and the list price is greater than 100:*/

select *
from production.products
where category_id = 1 and list_price > 100
order by list_price desc;

--OR operator

--WAQD finds the products whose list price is less than 200 or greater than 10000:

select *
from production.products
where list_price < 200 or 
      list_price > 10000
	  order by list_price desc;

--IN operator

--WAQD finds the products whose list price is one of the following values: 120.54, 11120.54, and 45120.54:

select *
from production.products
where list_price in (120.54, 11120.54, 45120.54)
order by list_price desc;

--WAQD finds the products whose list price is not of the following values: 120.54, 11120.54, and 45120.54:

select *
from production.products
where list_price not in (120.54, 11120.54, 45120.54)
order by list_price;

--Between operator

--WAQD finds the products whose list prices are between 100 and 10000:

select *
from production.products
where list_price between 100 and 1000
order by list_price;

--WAQD finds the products whose list prices not between 100 and 10000:

select *
from production.products
where list_price not between 100 and 1000
order by list_price;

--LIKE operator

--WAQD finds the customers whose first name starts with the letter L:

select *
from sales.customers;

SELECT
    customer_id,
    first_name,
    last_name
FROM
    sales.customers
WHERE
    first_name LIKE 'L%'
ORDER BY
    first_name;

--WAQD returns the customers whose last name ends with the string er:

SELECT
    customer_id,
    first_name,
    last_name
FROM
    sales.customers
WHERE
    last_name LIKE '%er'
	order by first_name;

--WAQD retrieves the customers whose last name starts with the letter t and ends with the letter s:

SELECT
    customer_id,
    first_name,
    last_name
FROM
    sales.customers
WHERE
    last_name LIKE 'R%y'
ORDER BY
    first_name;


--WAQD returns the customers where the second character is the letter a:

SELECT
    customer_id,
    first_name,
    last_name
FROM
    sales.customers
WHERE
    last_name LIKE '_a%'
ORDER BY
    first_name;

--WAQD returns the customers where the first character in the last name is R or S:

SELECT
    customer_id,
    first_name,
    last_name
FROM
    sales.customers
WHERE
    last_name LIKE '[RS]%'
ORDER BY
    last_name;

--WAQD  finds the customers where the first character in the last name is the letter in the range A through R:

SELECT
    customer_id,
    first_name,
    last_name
FROM
    sales.customers
WHERE
    last_name LIKE '[A-R]%'
ORDER BY
    first_name;

/*WAQD returns the customers where the first character in the 
last name is not the letter in the range A through F:*/

SELECT
    customer_id,
    first_name,
    last_name
FROM
    sales.customers
WHERE
    last_name LIKE '[^A-F]%'
ORDER BY
    last_name;

--WAQD find customers where the first character in the first name is not the letter A:

SELECT
    customer_id,
    first_name,
    last_name
FROM
    sales.customers
WHERE
    first_name NOT LIKE 'A%'
ORDER BY
    first_name;

--Alias operator

--WAQD last name as surname

select last_name, last_name as surname
from sales.customers;

