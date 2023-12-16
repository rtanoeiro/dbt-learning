<<<<<<< HEAD
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
=======
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
>>>>>>> a29353a77577114644b2eb19fac0a3d37d3fb381
