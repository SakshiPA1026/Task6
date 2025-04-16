SELECT 
    EXTRACT(YEAR FROM STR_TO_DATE(order_date, '%Y-%m-%d')) AS year,
    EXTRACT(MONTH FROM STR_TO_DATE(order_date, '%Y-%m-%d')) AS month,
    SUM(quantity * price) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM 
    sales.online_sales
GROUP BY 
    year, month
ORDER BY 
    year, month
    
    
DROP TABLE IF EXISTS sales.orders;

CREATE TABLE sales.orders AS
SELECT 
    order_id,
    order_date,
    (quantity * price) AS amount,
    product_id
FROM 
    sales.online_sales;
DROP TABLE IF EXISTS sales.orders;
CREATE TABLE sales.orders AS
SELECT 
    order_id,
    order_date,
    (quantity * price) AS amount,
    product_id
FROM 
    sales.online_sales;
ALTER TABLE sales.orders
ADD PRIMARY KEY (order_id);


SELECT * FROM sales.orders;



-- This query retrieves the first 10 rows from the 'orders' table in the 'sales' schema
SELECT * FROM sales.orders
LIMIT 10;    





