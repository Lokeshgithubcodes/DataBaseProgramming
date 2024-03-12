use BikeStores

select *
from production.products;

select product_name, list_price
from production.products

--create procedures for products name and price

create proc spGetProductNameandPrice
as
begin
select product_name, list_price
from production.products
end

exec spGetProductNameandPrice

--add a parameter to the stored procedure to find the products whose list prices are greater than an input price:

alter proc spGetProductNameandPrice
(@min_list_price decimal)
as
begin 
select product_name, list_price
from production.products
where list_price>= @min_list_price
order by list_price
end;

exec spGetProductNameandPrice 100

-- multiple parameters

alter proc spGetProductNameandPrice(
@min_list_price decimal,
@max_list_price decimal
)
as
begin
select product_name, list_price
from production.products
where list_price>=@min_list_price and 
      list_price<=@max_list_price
	  order by list_price
	  end;

exec spGetProductNameandPrice 100,900;

--or

exec spGetProductNameandPrice 
@min_list_price = 100,
@max_list_price = 900;

--Creating text parameters

alter proc spGetProductNameandPrice(
@min_list_price decimal,
@max_list_price decimal,
@name varchar(max)
)
as
begin
select product_name, list_price
from production.products
where list_price>=@min_list_price and 
      list_price<=@max_list_price and
	  product_name like '%'+ @name + '%'
	  order by list_price
	  end;

exec spGetProductNameandPrice 100, 500, 'Trek';

--Creating optional parameters

alter proc spGetProductNameandPrice(
@min_list_price decimal= 200,
@max_list_price decimal= 300,
@name varchar(max)
)
as
begin
select product_name, list_price
from production.products
where list_price>=@min_list_price and 
      list_price<=@max_list_price and
	  product_name like '%'+ @name + '%'
	  order by list_price
	  end;

exec spGetProductNameandPrice
@name ='Trek';

