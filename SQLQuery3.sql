-- Selects all columns from the Pizza Sales table
select * from pizza_sales

-- Gives Total Revenue from the Pizza Sales table
SELECT SUM(total_price) AS Total_Revenue from pizza_sales

-- Gives Average Order Value from the Pizza Sales table
Select SUM(total_price) / COUNT(DISTINCT order_id) AS Average_Order_Value from pizza_sales

-- Gives Total Pizzas Sold from the Pizza Sales table
select SUM(quantity) AS Total_Pizzas_Sold from pizza_sales

-- Gives Total Orders from the Pizza Sales table
select COUNT(DISTINCT order_id) AS Total_Orders from pizza_sales

-- Gives Average Pizzas Per Order from the Pizza Sales table
select CAST
(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) 
AS DECIMAL(10,2))
AS Avg_Pizzas_per_order 
from pizza_sales

-- Queries to answer charts requirement
-- Gives Daily Trend For Total Orders from the Pizza Sales table
SELECT 
    DATENAME(WEEKDAY, order_date) AS order_day, 
    COUNT(DISTINCT order_id) AS Total_Orders 
FROM pizza_sales
GROUP BY DATEPART(WEEKDAY, order_date), DATENAME(WEEKDAY, order_date)
ORDER BY DATEPART(WEEKDAY, order_date);

-- Gives Monthly Trend For Total Orders from the Pizza Sales table
SELECT 
    DATENAME(MONTH, order_date) AS Month_Name, 
    COUNT(DISTINCT order_id) AS Total_Orders 
FROM pizza_sales
GROUP BY DATEPART(MONTH, order_date), DATENAME(MONTH, order_date)
ORDER BY DATEPART(MONTH, order_date);

-- Gives % of Sales by Pizza Category from the Pizza Sales table
SELECT 
    pizza_category, 
	CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Sales,
    CAST(SUM(total_price) * 100.0 / (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) 
	AS Percentage_Sales
FROM pizza_sales
GROUP BY pizza_category;

-- Gives % of Sales by Pizza Size from the Pizza Sales table
SELECT 
    pizza_size, 
	CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Sales,
    CAST(SUM(total_price) * 100.0 / (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) 
	AS Percentage_Sales
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;

-- Gives Total Pizza Sold by Category from the Pizza Sales table
SELECT
	pizza_category,
	SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Pizzas_Sold DESC;

-- Gives Top 5 Pizzas by Revenue from the Pizza Sales table
SELECT TOP 5 
    pizza_name, 
    SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC;

-- Gives Bottom 5 Pizzas by Revenue from the Pizza Sales table
SELECT TOP 5 
    pizza_name, 
    SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC;

-- Gives Top 5 Pizzas by Total Quantity Sold from the Pizza Sales table
SELECT TOP 5 
    pizza_name, 
    SUM(quantity) AS Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity_Sold DESC;

-- Gives Bottom 5 Pizzas by Total Quantity Sold from the Pizza Sales table
SELECT TOP 5 
    pizza_name, 
    SUM(quantity) AS Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity_Sold ASC;

-- Gives Top 5 Pizzas by Total Orders from the Pizza Sales table
SELECT TOP 5 
    pizza_name, 
    COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC;

-- Gives Bottom 5 Pizzas by Total Orders from the Pizza Sales table
SELECT TOP 5 
    pizza_name, 
    COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC;



