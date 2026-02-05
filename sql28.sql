use sakila;

select * from customer;

select first_name,active,
	case
		when active=1 then 'Active Customer'
        when active=0 then 'Inactive Customer'
	end as user
    from customer;
    
select * from film;

select film_id,title,length,
	case
		when length<60 then 'Short Film'
        when length>60 and length<120 then 'Medium Film'
        else 'Long Film'
	end as movie_length
    from film;
    
select rating,count(*) as total,
case
	when count(*)<200 then 'Low Count'
    when count(*) between 200 and 400 then 'Medium Count'
    else 'High Count'
    end
    from film group by rating;
    
select * from payment;
select * from customer;

select c.customer_id,concat(c.first_name,' ',c.last_name),sum(p.amount),
case 
	when sum(p.amount)<50 then 'Low Spender'
    when sum(p.amount) between 50 and 100 then 'Medium spender'
    else 'High Spender'
    end
    from customer as c join payment as p on c.customer_id=p.customer_id
    group by c.customer_id,concat(c.first_name,c.last_name);
    
select * from rental;
create table newrental as select * from rental;
update rental set rental_date=NULL where rental_id=10;

select * from film;
select * from inventory;
select * from rental;

select f.title,count(r.rental_id) from film as f join inventory as i
on f.film_id=i.film_id join rental as r on i.inventory_id=r.inventory_id
group by f.title;

select * from customer;

select concat(c.first_name,' ',c.last_name)as customer_1,
concat(c1.first_name,' ',c1.last_name)as customer_2,c.store_id from 
customer as c join customer as c1 on c.store_id=c1.store_id and
c.customer_id<>c1.customer_id;

select c.customer_id,concat(first_name,' ',last_name),sum(amount)
from customer as c join payment as p on c.customer_id=p.customer_id
group by c.customer_id having sum(amount)>(select avg(amount) from
payment);

select avg(amount) from payment;

select * from film;
select * from inventory;
select * from rental;

select f.film_id,f.title,count(r.rental_id) from film as f join 
inventory as i on f.film_id=i.film_id join rental as r on
i.inventory_id=r.inventory_id group by f.film_id having
count(r.rental_id)>(select avg(rental_duration)from film);