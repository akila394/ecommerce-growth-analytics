-- Count how many orders exist for each order status.
select 
	order_status,
	count(*) as order_count
from raw.orders
group by order_status
order by order_count desc

-- Calculate the average product price and average freight value across all order items.
select 
	avg(price) as average_price,
	avg(freight_value) as average_freight
from raw.order_items

-- Calculate the total product revenue and total freight value across all order items.
select
	sum(price) as total_product_revenue,
	sum(freight_value) as total_freight
from raw.order_items

-- Find the lowest and highest product price in all order items.
select 
	min(price) as minimum_price,
	max(price) as max_price
from raw.order_items

-- Calculate the average freight value for each order item number.
select 
	order_item_id,
	avg(freight_value) as avg_freight
from raw.order_items
group by order_item_id
order by avg_freight desc

-- Find order item numbers whose average freight value is greater than 20.
select
	order_item_id,
	avg(freight_value) as avg_freight
from raw.order_items
group by order_item_id
having avg(freight_value) > 20
order by avg_freight desc

-- Count how many order items exist for each order item number and show only groups with more than 100 items.
select 
	order_item_id,
	count(*) as total_order_items
from raw.order_items
group by order_item_id
having count(*) > 100
order by total_order_items desc

-- Find order statuses with more than 1,000 orders and show their order count.
select 
	order_status,
	count(*) as total_orders
from raw.orders
group by order_status
having count(*) > 1000 
order by count(*) desc
	
