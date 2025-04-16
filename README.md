**Revenue and Order Volume by Year and Month**
1. EXTRACT(YEAR FROM STR_TO_DATE(order_date, '%Y-%m-%d')) AS year
EXTRACT: This function is used to extract a specific part (in this case, the year) from a date or timestamp.
STR_TO_DATE(order_date, '%Y-%m-%d'): The STR_TO_DATE function converts the order_date string into a date format. The format '%Y-%m-%d' specifies that the date is in the format "YYYY-MM-DD".
AS year: This renames the result of the extraction to year, which will be used as a column in the output.

2. EXTRACT(MONTH FROM STR_TO_DATE(order_date, '%Y-%m-%d')) AS month
EXTRACT: Similar to the previous command, this function extracts the month from the date.
STR_TO_DATE(order_date, '%Y-%m-%d'): Again, converts the order_date string into a proper date format.
AS month: This renames the result of the extraction to month, which will appear in the output.

3. SUM(quantity * price) AS total_revenue
SUM(quantity * price): This calculates the total revenue for each year-month combination by multiplying the quantity of items sold by the price of the item for each order and then summing up the results.
AS total_revenue: This renames the summed value to total_revenue for easier identification in the final output.

4. COUNT(DISTINCT order_id) AS order_volume
COUNT(DISTINCT order_id): This counts the number of distinct order_id values for each year and month. Using DISTINCT ensures that each order is counted only once, even if it contains multiple products.
AS order_volume: This renames the result to order_volume, which represents the total number of unique orders in that period.
5. FROM sales.online_sales
This specifies the source table (sales.online_sales) from which the data is being selected.
6. GROUP BY year, month
GROUP BY year, month: This groups the data by year and month (which were extracted earlier). It ensures that the revenue and order volume calculations are done for each unique combination of year and month.
7. ORDER BY year, month
ORDER BY year, month: This orders the result set first by year and then by month in ascending order, ensuring that the data is sorted chronologically.

-------
*CREATE TABLE sales.orders AS SELECT ... FROM sales.online_sales;
This command creates a new table called orders in the sales schema, using data selected from the online_sales table. It includes columns like order_id, order_date, a calculated column amount (which multiplies quantity and price), and product_id.
*ALTER TABLE sales.orders ADD PRIMARY KEY (order_id);
This command alters the orders table by adding a primary key constraint to the order_id column. This ensures that each order has a unique identifier and no duplicate order_id values are allowed.
*SELECT * FROM sales.orders;
This command retrieves all rows and columns from the orders table to display its contents.
*SELECT * FROM sales.orders LIMIT 10;
This command retrieves the first 10 rows from the orders table. The LIMIT clause restricts the number of rows returned.
