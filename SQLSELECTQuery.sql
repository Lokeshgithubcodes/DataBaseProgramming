use MyDB
create schema sales

create table sales.customers(customer_id int,first_name varchar(40),last_name varchar(40),phone varchar(20),email varchar(50),street varchar(50),city varchar(50),state varchar(30),zip_code varchar(20));

select * from sales.customers;

insert into sales.customers (customer_id, first_name, last_name, phone, email, street, city, state, zip_code) VALUES
(1,'Debra','Burks',NULL,'debra.burks@yahoo.com','9273 Thome Ave','Orchard Park','NY','14127'),
(2,'Kasha','Todd',NULL,'kasha.todd@yahoo.com','910 Vine Street','Campbell','CA','95008'),
(3,'Daryl','Spence',NULL,'daryl.spence.com','769C Honey.Creek St','Redondo Beach','CA','90278'),
(4,'Tameka','Fisher',NULL,'tameka.fisher@aol.com','9688 Pearl Lane','Uniondale','NY','11553'),
(5,'Charolette','Rice','(916) 381-6003','charolette.rice@msn.com','988 15 Brown St','Sacramento','CA','95820'),
(6,'Lyndsey','Bean',NULL,'lyndsey.bean@hotmail.com','107 River Dr.','Fairport','NY','14450'),
(7,'Latasha','Hays','(716) 986-3359','latasha.hays@hotmail.com','769 West Road','Buffalo','NY','14215'),
(8,'Jacquline','Duncan',NULL,'jacquline.duncan@yahoo.com','7014 Manor Station Road','Jackson Heights','NY','11372'),
(9,'Genvoveva','Baldwin',NULL,'genoveva.baldwin@msn.com','8550 Spruce Drive','Port Washington','NY','11050'),
(10,'Pamelia','NewMan',NULL,'pamelia.newman@gmail.com','476 Chestnut Ave','Monroe','NY','10950');
-- WAQD firstname
select first_name 
from sales.customers;
-- WAQD lastname
select last_name
from sales.customers;
-- WAQD firstname lastname and email
select first_name, last_name, email
from sales.customers;
--WAQD details of customers present in state CA
select *
from sales.customers
where state ='CA';
--WAQD details of customers present in state CA and their firstname
select *
from sales.customers
where state ='CA'
order by first_name;
--WAQD details of customers present in state CA and their firstname and with group by city

select city, count(*)
from sales.customers
where state = 'CA'
group by city
order by city;
--WAQD details of customers present in state CA and their firstname and with group by city atleast one customer
SELECT
    city,
    COUNT (*)
FROM
    sales.customers
WHERE
    state = 'CA'
GROUP BY
    city
HAVING
    COUNT (*) >= 1
ORDER BY
    city;

