
# 📊 E-Commerce Sales Performance Dashboard (End-to-End Analytics Project)

## 📌 Project Overview

This project is my **first complete end-to-end data analytics project**, covering the full workflow from raw data exploration to business-ready dashboards.

The project starts from **Python-based data exploration and cleaning**, moves through **SQL analytics in PostgreSQL**, and ends with an **executive-level Power BI dashboard** designed to answer real business questions.

A key focus throughout the project was **data correctness, KPI clarity, and avoiding misleading insights**, rather than only building visuals.

---

## 🧠 Business Context

An online retailer wants to understand:

- Overall revenue performance  
- The impact of promotions on revenue  
- Differences between B2B and B2C sales  
- Performance by product category and state  
- Fulfillment efficiency (Amazon vs Merchant)  
- Revenue trends over time  

These insights are intended to support **marketing, pricing, and operational decisions**.

---

## 🧩 Dataset Description

- Source: Amazon Sale Report dataset (CSV)  
- Link:https://www.kaggle.com/datasets/thedevastator/unlock-profits-with-e-commerce-sales-data
- Size: ~100k+ transaction records  
- Time period: 2022 (Q2 focus in dashboard)  
- Granularity: **Order line level (one SKU per order)**  

### Key Columns
- Order ID  
- Order Date  
- Product Category  
- Quantity  
- Amount (Revenue)  
- Promotion Flag  
- B2B Flag  
- Fulfillment Type  
- Shipping State  

---

## 🐍 Phase 1: Data Exploration & Cleaning (Python)

The project began in **Python** to understand the data structure and resolve quality issues before analytics.

### Key Challenges Identified
- Generic data types from CSV export  
- Missing `Amount` values  
- Inconsistent categorical values  
- Redundant or low-value columns  
- Need for derived time-based features  

### 🧮 Handling Missing Amount Values (Key Design Decision)

Instead of using **mean or mode imputation**, which would distort revenue metrics, missing `Amount` values were handled using **SKU-based logic**:

- Unit price inferred per SKU where pricing was consistent  
- Missing values estimated only when:
  - The SKU had sufficient historical data  
  - Quantity was valid (`Qty > 0`)  
- Rows that could not be reliably estimated were excluded  

This ensured:
- Trustworthy revenue KPIs  
- No artificial revenue inflation  
- Business-aligned pricing logic  

### Additional Python Transformations
- Removed cancelled orders and zero-quantity rows  
- Standardized B2B and promotion flags  
- Created derived features:
  - `order_month`
  - `order_month_num`
  - `order_year`

**Outcome:** Clean analytical dataset exported for SQL ingestion.

---

## 🗄️ Phase 2: Data Modeling & Validation (PostgreSQL)

For this project, I **learned PostgreSQL specifically to implement analytics and validation logic**.  
This was my **first hands-on PostgreSQL project**, added intentionally to expand my SQL skill set.

### SQL Validation Steps
- Row count verification after ingestion  
- Ensured no cancelled orders  
- Ensured `qty > 0`  
- Ensured no null or negative revenue  
- Validated month and year coverage  

This ensured dashboards were built on **validated and reliable data**.

---

## 📐 Phase 3: KPI Definition & SQL Analytics

KPIs were defined **before visualization**, following a business-first approach.

### Core KPIs
- Total Revenue  
- Total Order Lines  
- Average Order Value (AOV)  
- B2B Revenue & Revenue %  
- B2C Revenue & Revenue %  
- Promo Revenue & Revenue %  
- Monthly Revenue Trend  

All KPIs were validated using SQL aggregations before dashboarding.

---

## 📊 Phase 4: Power BI Dashboard

An executive-focused Power BI dashboard was developed using validated KPIs.

### Dashboard Features
- KPI cards for top-level metrics  
- Interactive slicers (B2B, Promo, Fulfillment)  
- Bar charts:
  - Top 5 Categories by Revenue  
  - Revenue by Promotion Status  
  - Revenue by Fulfillment Type  
- Line chart for Monthly Revenue Trend  

Percentage KPIs were calculated using **unfiltered total revenue** to avoid misleading insights.

---

## 🎯 Key Insights

- Promotions contribute a large share of revenue  
- Revenue declines across Q2  
- Amazon fulfillment outperforms Merchant  
- B2B customers contribute disproportionately  
- Revenue is concentrated in a few categories  

---

## 🛠️ Tools & Technologies

- Python – Data cleaning & EDA  
- PostgreSQL – Data modeling & validation  
- SQL – KPI calculations  
- Power BI – Dashboard & visualization  
- CSV / Excel – Data exchange  

---

## 🚀 Skills Demonstrated

- End-to-end analytics workflow  
- Business-driven KPI design  
- Data quality validation  
- SQL & PostgreSQL fundamentals  
- Dashboard storytelling  

---

