use BikeStores

-- Tables are customers, orders, products, order_items, suppliers, and product_suppliers


CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    price DECIMAL(10, 2)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(255)
);

CREATE TABLE product_suppliers (
    product_id INT,
    supplier_id INT,
    PRIMARY KEY (product_id, supplier_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

-- Insert values

INSERT INTO customers VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');

INSERT INTO orders VALUES
(101, 1, '2024-02-21'),
(102, 2, '2024-02-22'),
(103, 3, '2024-02-23');

INSERT INTO products VALUES
(501, 'Laptop', 1200.00),
(502, 'Smartphone', 600.00),
(503, 'Headphones', 80.00);

INSERT INTO order_items VALUES
(1001, 101, 501, 2),
(1002, 101, 502, 1),
(1003, 102, 503, 3),
(1004, 103, 501, 1),
(1005, 103, 502, 2);

INSERT INTO suppliers VALUES
(201, 'ElectroTech'),
(202, 'GadgetWorld'),
(203, 'AudioTech');

INSERT INTO product_suppliers VALUES
(501, 201),
(502, 202),
(503, 203);

select *
from customers;

select *
from orders;

select *
from products;

select *
from order_items;

select *
from suppliers;

select *
from product_suppliers;

--Inner join

--waqd details of both products and categories by categories id

SELECT
    product_name,
    category_name,
    list_price
FROM
    production.products p
INNER JOIN production.categories c 
    ON c.category_id = p.category_id
ORDER BY
    product_name DESC;

SELECT
    product_name,
    category_name,
    brand_name,
    list_price
FROM
    production.products p
INNER JOIN production.categories c ON c.category_id = p.category_id
INNER JOIN production.brands b ON b.brand_id = p.brand_id
ORDER BY
    product_name DESC;

--Left Join

SELECT
    product_name,
    order_id
FROM
    production.products p
LEFT JOIN sales.order_items o ON o.product_id = p.product_id
ORDER BY
    order_id;
-----------
SELECT
    product_name,
    order_id
FROM
    production.products p
LEFT JOIN sales.order_items o ON o.product_id = p.product_id
WHERE order_id IS NULL;

--------

SELECT
    p.product_name,
    o.order_id,
    i.item_id,
    o.order_date
FROM
    production.products p
	LEFT JOIN sales.order_items i
		ON i.product_id = p.product_id
	LEFT JOIN sales.orders o
		ON o.order_id = i.order_id
ORDER BY
    order_id;

-----query finds the products that belong to order id 100:

SELECT
    product_name,
    order_id
FROM
    production.products p
LEFT JOIN sales.order_items o 
   ON o.product_id = p.product_id
WHERE order_id = 100
ORDER BY
    order_id;

--Let’s move the condition order_id = 100 to the ON clause:

SELECT
    p.product_id,
    product_name,
    order_id
FROM
    production.products p
    LEFT JOIN sales.order_items o 
         ON o.product_id = p.product_id AND 
            o.order_id = 100
ORDER BY
    order_id DESC;

--Right Join

SELECT
    product_name,
    order_id
FROM
    sales.order_items o
    RIGHT JOIN production.products p 
        ON o.product_id = p.product_id
ORDER BY
    order_id;

------------

SELECT
    product_name,
    order_id
FROM
    sales.order_items o
    RIGHT JOIN production.products p 
        ON o.product_id = p.product_id
WHERE 
    order_id IS NULL
ORDER BY
    product_name;

--Cross join

SELECT
    product_id,
    product_name,
    store_id,
    0 AS quantity
FROM
    production.products
CROSS JOIN sales.stores
ORDER BY
    product_name,
    store_id;

--self Join

SELECT
    c1.city,
    c1.first_name + ' ' + c1.last_name customer_1,
    c2.first_name + ' ' + c2.last_name customer_2
FROM
    sales.customers c1
INNER JOIN sales.customers c2 ON c1.customer_id > c2.customer_id
AND c1.city = c2.city
WHERE c1.city = 'Albany'
ORDER BY
    c1.city,
    customer_1,
    customer_2;



