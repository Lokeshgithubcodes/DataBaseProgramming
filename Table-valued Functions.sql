use BikeStores


--Creating a table-valued function

CREATE FUNCTION udfProductInYear (
    @model_year INT
)
RETURNS TABLE
AS
RETURN
    SELECT 
        product_name,
        model_year,
        list_price
    FROM
        production.products
    WHERE
        model_year = @model_year;

--Executing a table-valued function

SELECT 
    * 
FROM 
    udfProductInYear(2017);

--columns to be returned from the table-valued function as follows:

SELECT 
    product_name,
    list_price
FROM 
    udfProductInYear(2018);

--Modifying a table-valued function

ALTER FUNCTION udfProductInYear (
    @start_year INT,
    @end_year INT
)
RETURNS TABLE
AS
RETURN
    SELECT 
        product_name,
        model_year,
        list_price
    FROM
        production.products
    WHERE
        model_year BETWEEN @start_year AND @end_year

--The following statement calls the udfProductInYear function to get the products whose model years are between 2017 and 2018:


SELECT 
    product_name,
    model_year,
    list_price
FROM 
    udfProductInYear(2017,2018)
ORDER BY
    product_name;

--Multi-statement table-valued functions (MSTVF)

CREATE FUNCTION udfContacts()
    RETURNS @contacts TABLE (
        first_name VARCHAR(50),
        last_name VARCHAR(50),
        email VARCHAR(255),
        phone VARCHAR(25),
        contact_type VARCHAR(20)
    )
AS
BEGIN
    INSERT INTO @contacts
    SELECT 
        first_name, 
        last_name, 
        email, 
        phone,
        'Staff'
    FROM
        sales.staffs;

    INSERT INTO @contacts
    SELECT 
        first_name, 
        last_name, 
        email, 
        phone,
        'Customer'
    FROM
        sales.customers;
    RETURN;
END;

--The following statement illustrates how to execute a multi-statement table-valued function udfContacts:

SELECT 
    * 
FROM
    udfContacts();

