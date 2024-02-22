use BikeStores
--SubQuery 

--find the sales orders of the customers located in New York:

select order_id, order_date, customer_id
from sales.orders
where customer_id in (select customer_id
                      from sales.customers
					  where city='New York')
					  order by order_date desc;

--finds the names of all mountain bikes and road bikes products that the Bike Stores sell.

SELECT
    product_id,
    product_name
FROM
    production.products
WHERE
    category_id IN (
        SELECT
            category_id
        FROM
            production.categories
        WHERE
            category_name = 'Mountain Bikes'
        OR category_name = 'Road Bikes'
    );

/*finds the products whose list prices are greater than or 
equal to the average list price of any product brand.*/

SELECT
    product_name,
    list_price
FROM
    production.products
WHERE
    list_price >= ANY (
        SELECT
            AVG (list_price)
        FROM
            production.products
        GROUP BY
            brand_id
    );

/*finds the products whose list price is 
greater than or equal to the average list price returned by the subquery:*/

SELECT
    product_name,
    list_price
FROM
    production.products
WHERE
    list_price >= ALL (
        SELECT
            AVG (list_price)
        FROM
            production.products
        GROUP BY
            brand_id
    );

-- find the customers who did not buy any products in 2017.

SELECT
    customer_id,
    first_name,
    last_name,
    city
FROM
    sales.customers c
WHERE
    NOT EXISTS (
        SELECT
            customer_id
        FROM
            sales.orders o
        WHERE
            o.customer_id = c.customer_id
        AND YEAR (order_date) = 2017
    )
ORDER BY
    first_name,
    last_name;

/*finds the products whose list price is equal to 
the highest list price of the products within the same category:*/

SELECT
    product_name,
    list_price,
    category_id
FROM
    production.products p1
WHERE
    list_price IN (
        SELECT
            MAX (p2.list_price)
        FROM
            production.products p2
        WHERE
            p2.category_id = p1.category_id
        GROUP BY
            p2.category_id
    )
ORDER BY
    category_id,
    product_name;

--finds all customers who have placed more than two orders:

SELECT
    customer_id,
    first_name,
    last_name
FROM
    sales.customers c
WHERE
    EXISTS (
        SELECT
            COUNT (*)
        FROM
            sales.orders o
        WHERE
            customer_id = c.customer_id
        GROUP BY
            customer_id
        HAVING
            COUNT (*) > 2
    )
ORDER BY
    first_name,
    last_name;

--find the orders of the customers from San Jose:

SELECT
    *
FROM
    sales.orders
WHERE
    customer_id IN (
        SELECT
            customer_id
        FROM
            sales.customers
        WHERE
            city = 'San Jose'
    )
ORDER BY
    customer_id,
    order_date;

--finds the products that were sold with more than two units in a sales order:

SELECT
    product_name,
    list_price
FROM
    production.products
WHERE
    product_id = ANY (
        SELECT
            product_id
        FROM
            sales.order_items
        WHERE
            quantity >= 2
    )
ORDER BY
    product_name;

--finds the products whose list prices are bigger than the average list price of products of all brands:

SELECT
    product_name,
    list_price
FROM
    production.products
WHERE
    list_price > ALL (
        SELECT
            AVG (list_price) avg_list_price
        FROM
            production.products
        GROUP BY
            brand_id
    )
ORDER BY
    list_price;

--finds the products whose list price is less than the smallest price in the average price list by brand:

SELECT
    product_name,
    list_price
FROM
    production.products
WHERE
    list_price < ALL (
        SELECT
            AVG (list_price) avg_list_price
        FROM
            production.products
        GROUP BY
            brand_id
    )
ORDER BY
    list_price DESC;

