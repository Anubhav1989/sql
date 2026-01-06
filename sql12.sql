use sakila;
 
select * from payment where amount not in (select amount from payment 
 where payment_id=2 or payment_id=3);
 
select * from payment where amount <any (select amount from payment 
 where payment_id=2 or payment_id=3);
 
 select * from payment where amount >any (select amount from payment 
 where payment_id=2 or payment_id=3);
 
 select * from payment where amount >all (select amount from payment 
 where payment_id=2 or payment_id=3);
 
select * from payment where amount <=all (select amount from payment 
where payment_id=2 or payment_id=3);
 
select name from world where population > (select population 
from world where name='Russia');
 
select name from world where continent ='Europe' and 
gdp/population>(select gdp/population from world where 
name='United Kingdom');

select name,continent from world where continent in 
(select continent from world where name = 'Argentina' or 
name='Australia') order by name;

select name,population from world where population >
(select population from world where name='United Kingdom')
and population <(select population from world where name='Germany');

select name,concat(round(population/(select population from world 
where name='Germany')*100),'%') as percentage from world
where continent ='Europe'; 

select name from world where gdp >all(select ifnull(gdp,0) 
from world where continent='Europe');