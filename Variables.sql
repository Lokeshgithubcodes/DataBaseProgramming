use BikeStores

--Assigning a value to a variable

declare @model_year int
set @model_year = 2018

select product_name, list_price
from production.products
where model_year=@model_year
order by product_name;

--Storing query result in a variable

declare @product_count int

set @product_count =(
select count(*)
from production.products
)

print @product_count;

--Selecting a record into variables

declare @product_name varchar(max),
        @list_price decimal(10,2)

select @product_name = product_name, @list_price= list_price
from production.products
where product_id=100;

select @product_name, @list_price;

---Accumulating values into a variable

create proc spGetProduct(
@model_year int
)
as
begin
declare @product_list varchar(max)
set @product_list=' ';

select @product_list = @product_list + product_name + char(10)
from production.products
where model_year = @model_year
order by product_name;

print @product_list;

end;

exec spGetProduct 2017

--Creating output parameters

create proc spGetProductbyModel(
@model_year int,
@product_count int output
)
as
begin 
select product_name, list_price
from production.products
where model_year=@model_year
end;

declare @outputCount int

EXEC spGetProductbyModel 2018, @outputCount OUT;
print @outputCount

