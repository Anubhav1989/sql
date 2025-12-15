use world;

select *from country;

select count(*) from country;

select count(indepyear) from country;

select distinct continent,region from country;

select count(population),sum(population),avg(population)
 from country;

select count(distinct governmentform) from country;

select count(governmentform),count(distinct governmentform) 
from country where continent = "Asia";

select sum(population) from country;

select  count(name),sum(population),count(distinct indepyear) 
from country where continent = 'Africa';

select avg(surfacearea),sum(population) from country 
where indepyear > 1947 and indepyear <1998;

select count(name),avg(surfacearea),sum(population) from country
where indepyear between 1948 and 1997;

select count(name),count(distinct continent),avg(population)
,count(capital) from country where name like 'a%' or 'd%';

select count(name),continent from country where continent = 'Asia';

select continent,count(*) from country group by continent;

select indepyear,count(*) from country group by indepyear 
order by indepyear;

select governmentform,count(*) from country group by governmentform;

select continent,count(name),sum(population),avg(population)
,max(population),min(population),max(indepyear),min(indepyear)
from country group by continent;

select * from city;

select count(name),count(district),count(distinct district)
,sum(population) from city;