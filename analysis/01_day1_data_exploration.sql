-- create a table
CREATE TABLE raw.products (
    product_id TEXT,
    product_category_name TEXT,
    product_name_lenght INTEGER,
    product_description_lenght INTEGER,
    product_photos_qty INTEGER,
    product_weight_g INTEGER,
    product_length_cm INTEGER,
    product_height_cm INTEGER,
    product_width_cm INTEGER
);

-- Find unique order statuses
SELECT DISTINCT order_status
FROM raw.orders
ORDER BY order_status;

-- Find orders without a delivery date
SELECT
    order_id,
    customer_id,
    order_status,
    order_purchase_timestamp,
    order_delivered_customer_date
FROM raw.orders
WHERE order_delivered_customer_date IS NULL;

-- Investigate high-value items with high freight
SELECT
    order_id,
    product_id,
    seller_id,
    price,
    freight_value,
    (price + freight_value) AS total_item_cost
FROM raw.order_items
WHERE price > 2000
  AND freight_value > 220
ORDER BY total_item_cost DESC
LIMIT 50;

--Show all products weighing more than 10,000 grams, sorted heaviest to lightest
select 
	product_id,
	product_category_name,
	product_weight_g,
	product_length_cm,
	product_height_cm,
	product_width_cm
from raw.products
where product_weight_g > 10000
order by product_weight_g desc;

select order_id, customer_id, order_status, order_purchase_timestamp
from raw.orders
where order_status IN ('canceled', 'unavailable' )
order by order_purchase_timestamp desc;