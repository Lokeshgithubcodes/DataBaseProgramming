use BikeStores

--creates a function that calculates the net sales based on the quantity, list price, and discount:

CREATE FUNCTION sales.udfNetSale(
    @quantity INT,
    @list_price DEC(10,2),
    @discount DEC(4,2)
)
RETURNS DEC(10,2)
AS 
BEGIN
    RETURN @quantity * @list_price * (1 - @discount);
END;


--Calling a scalar function

SELECT 
    sales.udfNetSale(10,100,0.1) net_sale;

-- illustrates how to use the sales.udfNetSale function to get the net sales of the sales orders in the order_items table:

SELECT 
    order_id, 
    SUM(sales.udfNetSale(quantity, list_price, discount)) net_amount
FROM 
    sales.order_items
GROUP BY 
    order_id
ORDER BY
    net_amount DESC;

--to remove the sales.udfNetSale function, you use the following statement:

DROP FUNCTION sales.udfNetSale;


