use portfolio;
SELECT * FROM portfolio.`data model - pizza sales`;

#select data that i'm going to use
select pizza_name, quantity, total_price, unit_price, pizza_size, pizza_category, order_date
FROM portfolio.`data model - pizza sales`;

#revenue generated from pizza sales
select pizza_name, quantity, unit_price, total_price, pizza_size, pizza_category, order_date, (unit_price * quantity) as revenue
FROM portfolio.`data model - pizza sales`;

#total revenue generated from pizza sales
select sum(unit_price * quantity) as revenue
from portfolio.`data model - pizza sales`;

#average order value
SELECT SUM(unit_price * quantity)/COUNT(distinct(order_id)) AS average_order_value
from portfolio.`data model - pizza sales`;

#total pizza sold
select sum(quantity) as total_pizza_sold
from portfolio.`data model - pizza sales`;

#total orders
select count(distinct(order_id)) as total_orders
from portfolio.`data model - pizza sales`;

#average pizza per order
select sum(quantity)/count(distinct(order_id)) as avg_pizza_order
from portfolio.`data model - pizza sales`;

#percentage of sales by pizza category
--calculate the total sales
select sum(total_price) as total_sales
from portfolio.`data model - pizza sales`

--calculate the sales for each category 
SELECT pizza_category, SUM(total_price) AS category_sales
FROM portfolio.`data model - pizza sales`
GROUP BY pizza_category;

--Calculate the Percentage
SELECT pizza_category, SUM(total_price) AS category_sales, (SUM(total_price) * 100 / (SELECT SUM(total_price) FROM portfolio.`data model - pizza sales`)) AS percentage_of_total
from portfolio.`data model - pizza sales`
GROUP BY pizza_category;

#percentage of sales by pizza size
--calculate the total sales
select sum(total_price) as total_sales
from portfolio.`data model - pizza sales`

--calculate the sales for each size 
SELECT pizza_size, SUM(total_price) AS size_sales
FROM portfolio.`data model - pizza sales`
GROUP BY pizza_size;

--Calculate the Percentage
SELECT pizza_size, SUM(total_price) AS size_sales, (SUM(total_price) * 100 / (SELECT SUM(total_price) FROM portfolio.`data model - pizza sales`)) AS percentage_of_total
from portfolio.`data model - pizza sales`
GROUP BY pizza_size;




