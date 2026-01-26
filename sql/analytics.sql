/* Most important and relevant business Questions answered */ 


/*Question 1 What is the total revenue (GMV) of the platform?
Business Meaning:
   How much money did the platform generate from delivered orders? */
SELECT 
	cast(round(SUM(total_amount),2) as decimal (10,2)) as total_gmv
from orders
where order_status = 'Delivered';


/*Q2. What is the Average Order Value (AOV)?
   Business Meaning:
   How much does a typical customer spend per order? */
   SELECT 
	cast(round(avg(total_amount),2) as decimal (10,2)) as aov
from orders
where order_status = 'Delivered'; 


/*Q3. What percentage of orders are returned?
   Business Meaning:
   How serious is the returns problem operationally? */
SELECT 
	cast(Round(100.0 * sum(case
	when order_status = 'Returned' then 1 else 0 end) / count(*) ,2) as decimal(10,2)) as return_percent
	from orders;


 /*Q4. What percentage of orders are cancelled?
   Business Meaning:
   How much revenue is lost before delivery? */

SELECT
	cast(Round(100.0 * sum(case
	when order_status = 'Cancelled' then 1 else 0 end) / count(*) ,2) as decimal(10,2)) as cancel_percent
	from orders;


 /*Q5. What percentage of customers pay using COD?
   Business Meaning:
   How dependent is the business on Cash on Delivery?
   */

SELECT
	cast(Round(100.0 * sum(case
	when payment_method = 'COD' then 1 else 0 end) / count(*) ,2) as decimal(10,2)) as COD_percent
	from orders;


 /* Q6. What percentage of customers are repeat buyers?
   Business Meaning:
   How strong is customer loyalty? */

with customer_orders as (
	Select 
		customer_id,
		count(*) as order_count
		from orders
		where order_status = 'Delivered' 
		group by customer_id)
SELECT
	cast(Round(100.0 * sum(case
	when order_count>1  then 1 else 0 end) / count(*) ,2) as decimal(10,2)) as repeat_customer_percent
	from customer_orders;


/* Q7. How does revenue trend month by month?
   Business Meaning:
   Is the business growing or stagnating? */
   
SELECT 
	Format(order_date , 'yyyy-MM') as month,
	Sum(total_amount) as monthly_revenue
from orders 
where order_status = 'Delivered' 
group by Format(order_date , 'yyyy-MM')
order by month;


/* Q8. What is the month-over-month (MoM) revenue growth?
   Business Meaning:
   Are we accelerating or slowing down? */

with monthly as(
	SELECT 
	Format(order_date , 'yyyy-MM') as month,
	Sum(total_amount) as revenue
from orders 
where order_status = 'Delivered' 
group by Format(order_date , 'yyyy-MM')
)
SElECT
	month,
	revenue,
	Lag(revenue) over (order by month) as prev_month_revenue,
	cast(round(100.0*(revenue-lag(revenue) over (order by month))/
	Lag(revenue) over (order by month) ,2 ) as decimal(10,2)) as mom_growth_percent
from monthly;



   /*Q9. Which product categories generate the most revenue?
   Business Meaning:
   Where should we focus inventory and marketing?*/

Select 
	p.category,
	cast(sum(oi.quantity * oi.price_sold) as decimal(10,2)) as category_revenue
from order_items oi
join orders o 
on oi.order_id = o.order_id
join products p
on oi.product_id = p.product_id
where o.order_status = 'Delivered' 
group by p.category
order by category_revenue desc;



/* Q10. What are the top 10 highest-revenue products?
   Business Meaning:
   Which SKUs drive the most money? */

Select 
	top 10 
	p.product_name,
	cast(sum(oi.quantity * oi.price_sold) as decimal(10,2)) as revenue
from order_items oi
join orders o
on oi.order_id = o.order_id
join products p 
on oi.product_id = p.product_id
where o.order_status = 'Delivered' 
group by p.product_name
order by revenue desc;
