-- Join orders with customers to show each order together with the customer's city and state.

select 
	order_id,
	c.customer_id,
	customer_city,
	customer_state,
	order_status
from raw.orders as o
join raw.customers as c
on o.customer_id = c.customer_id
limit 50

-- Join orders with order items to show each order together with its product price and freight value.
select 
	o.order_id,
	o.customer_id,
	o.order_status,
	oi.order_item_id,
	oi.price,
	oi.freight_value
from raw.orders as o
join raw.order_items as oi
on o.order_id = oi.order_id
limit 50;


-- Show every delivered order with its customer city and state.
select 
o.order_id,
o.customer_id,
o.order_status,
c.customer_city,
c.customer_state
from raw.orders as o
left join raw.customers as c
on o.customer_id = c.customer_id
where o.order_status = 'delivered'
limit 50

-- Show delivered orders with their customer location and order item details.
select 
o.order_id,
    o.customer_id,
    c.customer_city,
    c.customer_state,
    oi.order_item_id,
    oi.product_id,
    oi.price,
    oi.freight_value
from raw.orders as o
join raw.customers as c
	on o.customer_id = c.customer_id
join raw.order_items as oi
	on o.order_id = oi.order_id
where o.order_status = 'delivered'
limit 50

-- Show delivered orders from customers in SP, RJ or MG, including their order item price and freight value.
select 
o.order_id,
o.order_status,
c.customer_id,
c.customer_state,
c.customer_city,
oi.price,
oi.freight_value,
oi.order_item_id
from raw.orders as o
join raw.customers as c
	on o.customer_id = c.customer_id
join raw.order_items as oi
	on o.order_id = oi.order_id
where o.order_status = 'delivered'
and c.customer_state in ('SP', 'RJ', 'MG')
limit 50