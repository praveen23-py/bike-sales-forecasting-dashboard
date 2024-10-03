select * from bike_sales;
-- Write a query to find the total revenue and number of sales grouped by Customer Age Group (e.g., 18-25, 26-35, etc.) and Gender.
SELECT 
    Customer_Gender, 
    CASE 
        WHEN Customer_Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Customer_Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Customer_Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Customer_Age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+' 
    END AS Age_Group,
    SUM(Price * Quantity) AS Total_Revenue
FROM 
    bike_sales
GROUP BY 
    Customer_Gender, Age_Group
ORDER BY 
    Total_Revenue DESC;
-- write qurey to find Top Salesperson Performance ?
select Salesperson_id,
 sum(price*quantity) as 'total_revenue'
 from bike_sales 
 group by Salesperson_ID 
 order by total_revenue desc ;
 -- find Sales Trends Over Time ?
SELECT 
    DATE_FORMAT(Date, '%Y-%m') AS Month, 
    SUM(Price * Quantity) AS Total_Revenue
FROM 
    bike_sales
GROUP BY 
    DATE_FORMAT(Date, '%Y-%m')
ORDER BY 
    Month;
-- Calculate total revenue for each payment method.
select
	payment_method , 
	sum(price*quantity) as 'total_revenue' 
from 
	bike_sales
group by 
	Payment_Method
order by
	total_revenue desc ;
-- Identify high-value customers, those generating the most revenue.
select
	Customer_id ,
   sum(price*quantity) as 'total_revenue' 
from 
	 bike_sales
group by
	 Customer_ID
order by 	
	 total_revenue desc ;
--  Find the most popular bike models by store location.
SELECT 
    Store_Location, 
    Bike_Model, 
    SUM(Quantity) AS Total_Units_Sold
FROM 
    bike_sales
GROUP BY 
    Store_Location, Bike_Model
ORDER BY 
     Total_Units_Sold DESC;
--  Calculate the revenue contribution from the top 10% of transactions.
SELECT 
    SUM(Price * Quantity) AS Top_10_Revenue
FROM 
    (SELECT 
        Price, Quantity
    FROM 
        bike_sales
    ORDER BY 
        Price * Quantity DESC
    LIMIT 10
    ) AS Top_10_Percent;
-- Calculate the total sales grouped by store location and salesperson.
SELECT 
    Store_Location, 
    Salesperson_ID, 
    SUM(Price * Quantity) AS Total_Sales
FROM 
    bike_sales
GROUP BY 
    Store_Location, Salesperson_ID
ORDER BY 
    Total_Sales DESC;
-- Calculate the customer retention rate (repeat customers over total customers).
SELECT 
    COUNT(DISTINCT CASE WHEN Order_Count > 1 THEN Customer_ID END) / COUNT(DISTINCT Customer_ID) AS Retention_Rate
FROM 
    (SELECT 
        Customer_ID, 
        COUNT(Sale_ID) AS Order_Count
    FROM 
        bike_sales
    GROUP BY 
        Customer_ID) AS Customer_Orders;
-- Identify the day that generated the highest revenue.
SELECT 
    Date, 
    SUM(Price * Quantity) AS Total_Revenue
FROM 
    bike_sales
GROUP BY 
    Date
ORDER BY 
    Total_Revenue DESC
LIMIT 1;
-- Calculate the average customer age for each payment method.
SELECT 
    Payment_Method, 
    AVG(Customer_Age) AS Average_Age
FROM 
    bike_sales
GROUP BY 
    Payment_Method;



