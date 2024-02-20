use MyDB

select *
from sales.customers;

--WAQD sort with city and Zipcode

select city, zip_code
from sales.customers
order by city, zip_code;

--skip 1st 5 records 

select city, zip_code
from sales.customers
order by city, zip_code
offset 5 rows;

--skip 1st 3 records and select next 4 records

select city, zip_code
from sales.customers
order by city, zip_code
offset 3 rows 
fetch next 4 rows only;

--select 1st 3 large Zip_code

select city, zip_code
from sales.customers
order by zip_code desc, city
offset 0 rows
fetch first 3 rows only;

--Queries on SELECT TOP Concepts
--select top 5 zipCodes

select top 5
  city, zip_code
  from sales.customers
  order by zip_code desc;

--select 50 percent

select top 50 percent
city, zip_code
from sales.customers
order by zip_code;

-- top with ties

select top 2 with ties
city,zip_code
from sales.customers
order by zip_code desc;



