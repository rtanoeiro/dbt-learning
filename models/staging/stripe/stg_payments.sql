with payments as (

    select
        payment.id,
        payment.orderid,
        payment.paymentmethod,
        payment.status,
        payment.amount,
        payment.created,
        payment._batched_at
    from dev.stripe.payment
)

select * from payments
