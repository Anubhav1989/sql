use sakila;

select * from payment;

select * from payment where amount =(select amount from payment 
where payment_id=5);

select * from payment where staff_id = (select staff_id from payment
where payment_id=8);

select payment_id,amount,payment_date from payment where 
month(payment_date)=(select month(payment_date) from payment 
where payment_id=20);

select amount,count(payment_id) from payment 
where amount<(select amount from payment where rental_id=1725)
group by amount;

select  month(payment_date),sum(amount) from payment 
where month(payment_date)>(select month(payment_date) from payment
where customer_id=1 and payment_id=3) group by month(payment_date);

select * from payment where amount in (select amount from payment 
where payment_id=2 or payment_id=3);