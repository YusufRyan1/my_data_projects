# Sales Analytics in SQL

### Project Overview
This project analyzes sales, customers, and products to extract actionable insights using SQL. The dataset consists of three tables: **Customers**, **Products**, and **Orders**. The main goal is to demonstrate practical data analysis skills, including revenue trends, customer segmentation, product performance, and order-level insights.

---

### Dataset

**Customers Table**
| Column | Type | Description |
|--------|------|-------------|
| customer_id | INT | Unique ID for each customer |
| customer_name | VARCHAR | Customer name |
| email | VARCHAR | Customer email |
| country | VARCHAR | Customer country |
| signup_date | DATE | Date customer signed up |

**Products Table**
| Column | Type | Description |
|--------|------|-------------|
| product_id | INT | Unique product ID |
| product_name | VARCHAR | Product name |
| category | VARCHAR | Product category |
| price | DECIMAL | Product price |

**Orders Table**
| Column | Type | Description |
|--------|------|-------------|
| order_id | INT | Unique order ID |
| customer_id | INT | References Customers(customer_id) |
| product_id | INT | References Products(product_id) |
| order_date | DATE | Date of order |
| quantity | INT | Number of items |
| total_amount | DECIMAL | Total order amount |

---

### Questions / Analysis

1. **Total Revenue per Month**  
   - Show monthly revenue trends to identify peak periods.  

2. **Month with Highest Revenue**  
   - Identify the month contributing the most to sales.  

3. **Revenue by Country**  
   - Find top-performing countries.  

4. **Top 5 Customers by Total Spending**  
   - Identify the most valuable customers.  

5. **Number of Orders per Customer**  
   - Track customer activity and repeat purchases.  

6. **Customer Segmentation by Spending**  
   - Classify customers as High, Medium, or Low spenders.  

7. **Top 5 Products by Revenue**  
   - Determine which products generate the most revenue.  

8. **Revenue by Product Category**  
   - Analyze performance across categories.  

9. **Order Classification (High/Normal/Low Value)**  
   - Categorize individual orders to identify high-value transactions.  

10. **Average Order Value per Customer**  
    - Measure typical spending behavior per customer.  

11. **Repeat vs One-Time Customers**  
    - Identify loyal versus occasional buyers.  

12. **Top 10% Highest-Value Orders (Window Functions)**  
    - Highlight the most significant orders contributing to revenue.

---

### Key Insights
- Peak months drive the majority of revenue — focus on promotions during these periods.  
- A small number of high-spending customers contribute disproportionately to revenue.  
- Electronics and high-value products are the main revenue drivers.  
- Most customers are one-time buyers, indicating opportunities for retention strategies.  
- High-value orders (top 10%) represent a substantial portion of total revenue, suggesting prioritization for customer engagement.  

---

### Technologies & Skills Used
- **SQL Server (T-SQL)**: Joins, aggregations, window functions, subqueries, `CASE WHEN`, `GROUP BY`  
- **Analytical Thinking**: Revenue analysis, customer segmentation, product performance  
- **Portfolio-Ready Output**: Clean code, business insights, reproducible queries  

---

### How to Use
1. Run `01_create_tables.sql` to create tables.  
2. Run `02_insert_data.sql` to populate sample data.  
3. Run `03_analytics_queries.sql` to execute all analysis questions.  
4. Review outputs and insights.  

---

