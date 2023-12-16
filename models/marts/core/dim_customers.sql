with customers as (

    select * from {{ ref("stg_customers") }}
),

orders as (

    select * from {{ ref("stg_orders") }}
),


payments as (

    select * from {{ ref("stg_payments") }}
),

customer_orders as (

    select
        orders.customer_id,
        sum(payments.amount) as lifetime_value,
        min(orders.order_date) as first_order_date,
        max(orders.order_date) as most_recent_order_date,
        count(orders.order_id) as number_of_orders

    from orders
    left join payments
        on orders.order_id = payments.orderid
    where payments.status = 'success'

    group by 1

),


final as (

    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders,
        coalesce(customer_orders.lifetime_value, 0) as lifetime_value

    from customers

    left join
        customer_orders
        on customers.customer_id = customer_orders.customer_id

)

select * from final
