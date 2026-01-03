/*Q1: What is the total revenue per month?*/
SELECT 
    DATENAME(month, order_date) AS month_name,
    DATEPART(yyyy, order_date) AS year,
    SUM(total_amount) AS total_revenue
FROM Orders
GROUP BY 
    DATENAME(month, order_date),
    DATEPART(yyyy, order_date),
    DATEPART(mm, order_date)
ORDER BY year, DATEPART(mm, order_date);

/*Who are the top 5 customers by total spending?*/
select top(5)
c.customer_name , sum(o.total_amount) as total_spending from orders as o join Customers as c on o.customer_id=c.customer_id group by customer_name
order by sum(o.total_amount) desc

/*How many customers are repeat customers vs one-time customers?*/
select customer_type,
COUNT(*) AS number_of_customers
from
(
select customer_id,
case 
when count(customer_id) >1 then 'repeat' 
else 'one-time' 
end as customer_type
from orders group by customer_id
)t
group by customer_type

/*Q4: How many customers fall into each spending segment?*/
select * from Orders 
select spending_segment,count(*)as count_of_customers,
SUM(total_amount) AS total_revenue
from(
select customer_id ,
SUM(total_amount) AS total_amount,
case 
when sum(total_amount) >1000 then 'High'
when sum(total_amount) between 500 and 1000 then 'Medium'
else 'Low'
end as spending_segment
from orders group by customer_id
)t
group by spending_segment
/*Q5:Month with the highest total revenue (bonus: use TOP 1)*/
SELECT TOP 1 
DATEPART(YEAR, order_date) as year,
    DATEPART(MONTH, order_date) AS month_number,
    DATENAME(MONTH, order_date) AS month_name,
    SUM(total_amount) AS total_revenue
FROM Orders
GROUP BY 
    DATENAME(MONTH, order_date),
    DATEPART(MONTH, order_date),DATEPART(YEAR, order_date)
ORDER BY total_revenue DESC;

/*Q6:Revenue by country*/

SELECT 
    c.country,
    SUM(o.total_amount) AS total_revenue
FROM Orders o
JOIN Customers c
    ON o.customer_id = c.customer_id
GROUP BY c.country
ORDER BY total_revenue DESC;

/*Q7: Top 5 products by revenue*/
SELECT TOP 5
    p.product_name,
    SUM(o.total_amount) AS total_revenue
FROM Orders o
JOIN Products p
    ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;


