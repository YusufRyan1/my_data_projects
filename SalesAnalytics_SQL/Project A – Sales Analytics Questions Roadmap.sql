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


/*Q8: Revenue by product category*/
select category,sum(total_amount) as total_revenue from orders as o join Products as p on o.product_id=p.product_id group by category order by total_revenue desc

/*Q9: Classify each order as High / Normal / Low value*/
select order_id,customer_id,product_id,total_amount,
case
when total_amount >800 then 'High'
when total_amount between 200 and 800 then 'Normal'
else 'Low'
end as order_value
from orders 

/*Q10: Average order value per customer*/
SELECT 
    c.customer_name,
    CAST(AVG(o.total_amount) AS DECIMAL(10,2)) AS average_order_value
FROM Orders o
JOIN Customers c
    ON o.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY average_order_value DESC;

/*Q11: Repeat vs One-Time Customers*/
select * from orders

select customer_type,count(*) as number_of_customers
from (
select customer_id,count(customer_id) as orders_count ,
case 
when count(customer_id)>1 then 'Repeat'
else 'One-Time'
end as customer_type
from Orders
group by customer_id
)t
group by customer_type

/*Q12: Top 10% Highest-Value Orders*/
select *  from
(
select order_id,customer_id,total_amount,
NTILE(10) over(order by total_amount desc) as value_decile
from Orders)t
where value_decile=1
ORDER BY total_amount DESC
