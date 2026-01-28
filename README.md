📊 Meesho Social Commerce Analytics (India)
Why this project?

Meesho operates in a very different environment compared to traditional e-commerce platforms —
high COD usage, strong Tier-2/Tier-3 presence, frequent returns, and reseller-driven demand.

I built this project to understand those dynamics using data, not just charts.

The aim was to simulate a realistic Indian social commerce dataset and then answer
actual business questions using SQL and analytics thinking, the way an analyst would do in a real company.

📁 Dataset Overview

The dataset is synthetic, but designed to closely match real Meesho-like behavior.

It includes:

12,000 customers

25,000 orders

43,000 order items

2,500 products

150 suppliers

Some realism checks:

Repeat customer rate ≈ 60%

Return rate ≈ 11–12%

COD usage ≈ 65%

Average Order Value ≈ ₹900–₹1100

Tier-1 / Tier-2 / Tier-3 city mix

The goal was believability, not perfection.

🧠 What I Analyzed (Business Perspective)

Instead of starting with dashboards, I started with questions:

How much revenue does the platform actually generate?

Are customers coming back after their first order?

Which categories and products matter the most?

Is revenue concentrated among a small group of customers?

Which customers are at risk of churn?

Are some suppliers responsible for higher returns?

All answers are backed by SQL queries, not assumptions.

📌 Key Metrics & Concepts Used

GMV (Total Revenue)

Average Order Value (AOV)

Return & Cancellation Rates

COD dependency

Repeat customer rate

Month-over-month growth

Revenue by category & product

Customer Lifetime Value (CLV)

RFM Segmentation

Cohort retention analysis

Churn risk identification

You can find the full SQL logic in
➡️ sql/analytics.sql

🛠️ Tech Stack

Python – dataset generation & validation

MS SQL Server – relational database

SQL – analytics & business logic

Tableau – dashboards (currently in progress)

Git & GitHub – version control

🚧 Current Status & Next Steps

✅ Dataset generation & validation

✅ SQL schema & 20+ business queries

🔄 Tableau dashboards (Executive KPIs, Customer Analytics, Product Insights)

Upcoming work:

Interactive Tableau dashboards with filters

Cohort & RFM visualization

Executive-level summary insights
