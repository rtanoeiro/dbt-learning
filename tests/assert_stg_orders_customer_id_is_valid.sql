with customer as (
    select * from {{ ref('stg_customers') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
)

select distinct customer.customer_id
from customer
where customer.customer_id not in (select orders.customer_id from orders)
