<<<<<<< HEAD
select * from dev.stripe.payment
=======
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
>>>>>>> a29353a77577114644b2eb19fac0a3d37d3fb381
