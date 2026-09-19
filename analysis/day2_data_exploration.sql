-- Business question:
-- Find customers whose city starts with sao.

-- Your query should:

-- Return customer_id
-- Return customer_city
-- Return customer_state
-- Filter cities beginning with sao
-- Sort by customer_city
-- Show only the first 50 rows

select 
	customer_id,
	customer_city,
	customer_state
from raw.customers
where customer_city like 'sao%'
order by customer_city
limit 50


-- Find customers who live in the states SP, RJ, or MG.

-- Return:

-- customer_id
-- customer_city
-- customer_state

-- Sort by:

-- customer_state,
-- customer_city

-- Limit to 50 rows.

select 
	customer_id,
	customer_city,
	customer_State
from raw.customers
where customer_State in ('SP','RJ','MG')
order by customer_state, customer_city
limit 50

-- use raw.orders and find orders purchased during January 2018.

-- Return these columns:

-- order_id,
-- customer_id,
-- order_purchase_timestamp,
-- order_status

select 
	order_id,
	customer_id,
	order_purchase_timestamp,
	order_Status
from raw.orders
where order_purchase_timestamp between '2018-01-01' and '2018-02-01'
order by order_purchase_timestamp
limit 50;

-- Find all delivered orders purchased on or after 2018-01-01.
select 
	order_id,
	customer_id,
	order_purchase_timestamp,
	order_Status 
from raw.orders
where order_status='delivered' 
and order_purchase_timestamp >= '2018-01-01'
order by order_purchase_timestamp
limit 50

-- Find all orders that have either canceled or unavailable status.
select 
	order_id,
	customer_id,
	order_purchase_timestamp,
	order_Status 
from raw.orders
where order_status = 'canceled' or order_status = 'unavailable'
order by order_purchase_timestamp
limit 50

-- Find all orders where the delivered date is missing.
select 
	order_id,
	customer_id,
	order_delivered_customer_date,
	order_Status 
from raw.orders
where order_delivered_customer_date is null
order by order_purchase_timestamp
limit 50;

-- Find all orders where the delivered date is available.
select 
	order_id,
	customer_id,
	order_delivered_customer_date,
	order_Status 
from raw.orders
where order_delivered_customer_date is not null
order by order_delivered_customer_date
limit 50

-- Find delivered orders purchased in 2018 where the delivered date is available and the customer is from SP, RJ, or MG.
select 
	o.order_id,
	c.customer_id,
	c.customer_state,
	o.order_delivered_customer_date,
	o.order_Status,
	o.order_purchase_timestamp
from raw.orders o join raw.customers c
	on o.customer_id = c.customer_id
where o.order_purchase_timestamp >= '2018-01-01' and o.order_purchase_timestamp < '2019-01-01'
and o.order_status = 'delivered'
and o.order_delivered_customer_date is not null
and c.customer_state in ('SP','RJ','MG')
order by o.order_purchase_timestamp
limit 50
