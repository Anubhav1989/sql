use world;

select region ,count(name),count(continent) from country
group by region;

select region,avg(population) from country group by region;

select district,count(name) as total_cities from city 
group by district;

select district,count(name) as total_cities from city 
where population > 100000 group by district;

select continent,count(name) from country where indepyear>1950
group by continent;

select continent,sum(population) as total_population from country
group by continent having total_population > 100;

select continent,sum(population) as total_population from country
group by continent having total_population > 30401150;

select continent,sum(population) as total_population from country
where lifeexpectancy >35 group by continent;

select governmentform,count(name) as total_countries from country 
group by governmentform having total_countries > 30;

select governmentform ,count(name) as total_countries from country
where capital>30 group by governmentform 
having sum(population)>300000;

select continent,region,count(name) from country 
group by continent,region;