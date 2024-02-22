use MyDB

select *
	from sales.customers

	-- The following query returns the number of customers in every city:
	select city,count(customer_id) customer_count
	from sales.customers
	group by city
	order by city;

	-- the following query returns the number of customers by state and city.
	select city,state,count(customer_id) customer_count
	from sales.customers
	group by state,city
	order by city,state;

	-- Having

	--  it filters out the category which has the maximum list price greater than5000 or the minimum list price less than 500:
	select *
	from production.products;

	select category_id,
		min(list_price) min_list_price,
		max(list_price) max_list_price
	from production.products
	group by category_id
	having min(list_price)<500 or max(list_price)>5000;

	-- The following statement finds product categories whose average list prices are between 10000 and 50000:
	select 
		category_id,
		avg(list_price) avg_list_price
	from production.products
	group by category_id
	having avg(list_price) between 10000 and 50000;

