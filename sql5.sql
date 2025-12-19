use sakila;
select * from payment where amount>0.99;

select amount from payment where payment_id=25;
select * from payment where amount>4.99;

select * from payment where month(payment_date)=(
select month(min(payment_date)) from payment);

select * from payment where amount>(select amount from payment where 
payment_id=20);