--1)Total revenue
select 
sum(total_price) as Total_Revenu
from pizza_sales;

--2)Average order value
select sum(total_price)/count(distinct order_id)
as Avg_ord_val
from Pizza_sales;

--3)Total pizzas sold

select sum(quantity) as Total_pizzas_sold
from Pizza_sales;

--4)Total orders
select count(distinct order_id)
as Total_orders
from Pizza_sales;

--5)Average pizza sold

select cast(sum(quantity) as decimal(10,2))
/count(distinct order_id) as Avg_pizza_per_order
from Pizza_sales;

--6)Daily trend for Total orders
select to_char(order_date,'Day') as order_day,
count(distinct order_id) as total_orders
from Pizza_sales group by to_char(order_date,'Day');

--7)Monthly trend for Total orders

select to_char(order_date,'Month') as Month_name,
count(distinct order_id) as total_orders
from Pizza_sales group by to_char(order_date,'Month')
order by 2 desc;

--8)Percenatge of pizza sales by category

select pizza_category,
sum(total_price)*100/(select sum(total_price) from pizza_sales)as pct_total_sales
from pizza_sales group by pizza_category;

--9)Percenatge of pizza sales by size

select pizza_size,
(sum(total_price)*100/(select sum(total_price) from pizza_sales))::decimal(10,2) as pct_total_sales
from pizza_sales group by pizza_size order by 2 desc;

--10)Top 5 pizza by revenue

select 
pizza_name,
sum(total_price) as Total_revenue
from pizza_sales group by pizza_name order by 2 desc
limit  5;

--11)Bottom 5 pizza by revenue

select 
pizza_name,
sum(total_price) as Total_revenue
from pizza_sales group by pizza_name order by 2
limit  5;

--13)Top 5 pizza by quantity

select 
pizza_name,
sum(quantity) as Total_quantity
from pizza_sales group by pizza_name order by 2 desc
limit  5;

--14)Bottom 5 pizza by quantity

select 
pizza_name,
sum(quantity) as Total_quantity
from pizza_sales group by pizza_name order by 2
limit  5;

--15)Top 5 pizza by order

select 
pizza_name,
count(distinct order_id) as total_orders
from pizza_sales group by pizza_name order by 2 desc
limit  5;

--16)Bottom 5 pizza by orders

select 
pizza_name,
count(distinct order_id) as total_orders
from pizza_sales group by pizza_name order by 2
limit  5;