use world;
describe city;

select count(id),count(distinct id),count(population),
count(distinct population) from city;

select * from country;
select * from city;

select ct.name,ct.countrycode,cty.code,cty.name
from city as ct join country as cty 
where ct.countrycode=cty.code;

select ct.name,ct.population,cty.governmentform 
from city as ct join country as cty 
where ct.countrycode =cty.code
order by ct.population desc;

select * from countrylanguage;

select cty.name,cty.population,cl.language from country as cty
join countrylanguage as cl
where cty.code=cl.countrycode;

select cty.code,cty.name from country as cty;

use sakila;
select * from actor;
select * from film_actor;
select * from film;

select a.actor_id,a.first_name,fa.film_id from actor as a
join film_actor as fa where a.actor_id=fa.actor_id;

select a.first_name,a.last_name,f.title
from actor as a join film_actor as fa join film as f 
where a.actor_id=fa.actor_id and fa.film_id=f.film_id;

SELECT a.first_name, a.last_name, f.title
FROM actor AS a
JOIN film_actor AS fa ON a.actor_id = fa.actor_id
JOIN film AS f ON fa.film_id = f.film_id;

