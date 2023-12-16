with payments as (

    select * from {{ ref("stg_payments") }}
),

orders as (

    select * from {{ ref("stg_orders") }}
),

customers as (

    select * from {{ ref("stg_customers") }}
)

select
    orders.order_id,
    customers.customer_id,
    payments.amount
from payments
inner join orders
    on payments.orderid = orders.order_id
inner join customers
    on orders.customer_id = customers.customer_id
