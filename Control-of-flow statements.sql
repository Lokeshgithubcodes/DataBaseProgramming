use BikeStores

select *
from production.products

--if else conditions

BEGIN
    DECLARE @sales INT;

    SELECT 
        @sales = SUM(list_price * quantity)
    FROM
        sales.order_items i
        INNER JOIN sales.orders o ON o.order_id = i.order_id
    WHERE
        YEAR(order_date) = 2018;

    SELECT @sales;

    IF @sales > 1000000
    BEGIN
        PRINT 'Great! The sales amount in 2018 is greater than 1,000,000';
    END
END

--

BEGIN
    DECLARE @sales INT;

    SELECT 
        @sales = SUM(list_price * quantity)
    FROM
        sales.order_items i
        INNER JOIN sales.orders o ON o.order_id = i.order_id
    WHERE
        YEAR(order_date) = 2017;

    SELECT @sales;

    IF @sales > 10000000
    BEGIN
        PRINT 'Great! The sales amount in 2018 is greater than 10,000,000';
    END
    ELSE
    BEGIN
        PRINT 'Sales amount in 2017 did not reach 10,000,000';
    END
END

-------While

DECLARE @counter INT = 1;

WHILE @counter <= 5
BEGIN
    PRINT @counter;
    SET @counter = @counter + 1;
END

----Break

DECLARE @counterr INT = 0;

WHILE @counterr <= 5
BEGIN
    SET @counterr = @counterr + 1;
    IF @counterr = 4
        BREAK;
    PRINT @counterr;
END

------Countinue

DECLARE @counterl INT = 0;

WHILE @counterl < 5
BEGIN
    SET @counterl = @counterl + 1;
    IF @counterl = 3
        CONTINUE;	
    PRINT @counterl;
END


