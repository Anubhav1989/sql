use regex;

drop table actor_cp;

create table actor_cp as
select first_name as fname,last_name from sakila.actor
where actor_id between 10 and 14;

select * from actor_cp;
update actor_cp set last_name='BALE' where fname='CHRISTIAN';

delete from actor_cp where fname='UMA';
truncate table actor_cp;

use world;

select code,name,continent,population,(select sum(population) from 
country as c2 where c2.continent=c1.continent)from country as c1;

select code,name,continent,population,sum(population) over(),
avg(population) over() from country;

select code,name,continent,population,sum(population) 
over(partition by continent) from country;

select code,name,continent,population,sum(population) 
over(partition by continent order by population) from country;