with payments as (

    select * from {{ref("stg_payments")}}
),

orders as (

    select * from {{ref("stg_orders")}}
),

customers as (

    select * from {{ref("stg_customers")}}
)

select 
    orders.order_id,
    customers.customer_id,
    payments.amount
from payments
inner join orders
    on orders.order_id = payments.orderid
inner join customers
    on customers.customer_id = orders.customer_id