--SQL Validation
select count(*) from revenue_data;
SELECT COUNT(*)
FROM revenue_data
WHERE LOWER(status) = 'cancelled';
SELECT COUNT(*)
FROM revenue_data
WHERE qty <= 0;
SELECT 
    COUNT(*) FILTER (WHERE amount IS NULL) AS null_amounts,
    COUNT(*) FILTER (WHERE amount < 0) AS negative_amounts
FROM revenue_data;
SELECT 
    MIN(order_year) AS min_year,
    MAX(order_year) AS max_year,
    COUNT(DISTINCT order_month_num) AS distinct_months
FROM revenue_data;

-- Analytical Questions

--What is the total revenue generated?
select round(sum(amount)) as total_revenue from revenue_data;
--How does revenue change month over month?
select order_month_num,round(sum(amount)) as total_revenue from revenue_data group by order_month_num
--How much revenue comes from B2B vs non-B2B customers?
select round(sum(amount)) as total_revenue,
case 
when is_b2b is true then 'B2B' 
else 'B2C'
end as B2B_non_B2B_customers
from revenue_data 
group by is_b2b
--Do promotions actually drive revenue?
select promo_flag,round(sum(amount)) as total_revenue,count(id) as total_orders,round(avg((amount)),2) as average_order_value from revenue_data group by promo_flag
--Top 5 revenue-generating categories
select category , round(sum(amount)) as total_revenue from revenue_data group by category order by round(sum(amount)) desc limit 5;

select * from revenue_data