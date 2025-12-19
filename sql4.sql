use sakila;

select * from payment;
select 	customer_id , count(*) from payment group by customer_id;

select  customer_id , count(*) from payment where amount > 3
group by customer_id;

select amount,count(payment_id) from payment 
where payment_date between '2005-05-01' and '2005-05-31' 
group by amount; 

select staff_id,max(amount),avg(amount),sum(amount) from payment
group by staff_id;

select staff_id,max(amount),avg(amount),sum(amount) from payment
where customer_id in(1,3,7,11) group by staff_id;

select month(payment_date),sum(amount),count(customer_id) from payment
where amount > 1 group by month(payment_date) 
having count(customer_id) > 300;

select year(payment_date),month(payment_date),count(customer_id) 
from payment group by year(payment_date),month(payment_date);

