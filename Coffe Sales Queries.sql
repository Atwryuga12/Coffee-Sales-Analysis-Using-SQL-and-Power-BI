Create database coffee_sales;

-- 1. Total Revenue

select round(sum(money),2) as total_revenue
from coffee_sales;

-- 2. Total Orders
select count(*) as total_orders
from coffee_sales;

-- 3. Montly Sales
select monthname(date), round(sum(money),2) as total_revenue
from coffee_sales
group by monthname(date)
order by total_revenue desc;

-- 4. Daily Sales
select dayname(date), round(sum(money),2) as total_revenue
from coffee_sales
group by dayname(date)
order by total_revenue desc;

-- 5. Daily Hourly Sales
select hour(datetime), round(sum(money),2) as total_revenue
from coffee_sales
group by hour(datetime)
order by total_revenue desc;

-- 6. Total Sales by coffee name
select coffee_name, round(sum(money), 2) as total_sales 
from coffee_sales
group by coffee_name
order by total_sales desc;

-- 7. Percentage of cash type 
select cash_type, count(*) as total_orders, count(*)*100/(select count(*) from coffee_sales) as Per_cash_type
from coffee_sales
group by cash_type;

-- 8. Average Sales Per Day
select round(sum(money)/count(distinct date), 2) as avg_sales
from coffee_sales;

-- 8. Average Order Per Day
-- Approach 1
select round(count(*)/count(distinct date), 2) as avg_sales
from coffee_sales;

-- Approach 2
select round(avg(daily_count),2) as avg_order
from
(select date, count(*) daily_count
from coffee_sales
group by date) as x;

-- 9. Hourly basis total sales by coffee name

-- Latte
select coffee_name, hour(datetime), round(sum(money), 2) as total_sales 
from coffee_sales
where coffee_name = "Latte"
group by coffee_name, hour(datetime)
order by total_sales desc;

-- Americano with Milk
select coffee_name, hour(datetime), round(sum(money), 2) as total_sales 
from coffee_sales
where coffee_name = "Americano with Milk"
group by coffee_name, hour(datetime)
order by total_sales desc;

-- Cappuccino
select coffee_name, hour(datetime), round(sum(money), 2) as total_sales 
from coffee_sales
where coffee_name = "Cappuccino"
group by coffee_name, hour(datetime)
order by total_sales desc;

-- Americano
select coffee_name, hour(datetime), round(sum(money), 2) as total_sales 
from coffee_sales
where coffee_name = "Americano"
group by coffee_name, hour(datetime)
order by total_sales desc;

-- Hot Chocolate
select coffee_name, hour(datetime), round(sum(money), 2) as total_sales 
from coffee_sales
where coffee_name = "Hot Chocolate"
group by coffee_name, hour(datetime)
order by total_sales desc;

-- Cortado
select coffee_name, hour(datetime), round(sum(money), 2) as total_sales 
from coffee_sales
where coffee_name = "Cortado"
group by coffee_name, hour(datetime)
order by total_sales desc;

-- Cocoa
select coffee_name, hour(datetime), round(sum(money), 2) as total_sales 
from coffee_sales
where coffee_name = "Cocoa"
group by coffee_name, hour(datetime)
order by total_sales desc;

-- Espresso
select coffee_name, hour(datetime), round(sum(money), 2) as total_sales 
from coffee_sales
where coffee_name = "Espresso"
group by coffee_name, hour(datetime)
order by total_sales desc;

-- Top 5 Coffees By Revenue 

select coffee_name, round(sum(money), 2) as total_sales 
from coffee_sales
group by coffee_name
order by total_sales desc
limit 5;

-- Top 5 Coffees By Total Orders
select coffee_name, count(*) as total_sales 
from coffee_sales
group by coffee_name
order by total_sales desc
limit 5;