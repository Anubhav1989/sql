USE world;
show tables;

select Name, Continent, Region 
from country
where Continent<>'Europe';

select Name, Continent, Region 
from country
where Region like '%a_';

select Name, Continent, Region
from country
where Continent like '%i__';

select Name, Continent, Region
from country
where Continent like '_____%';

select Name, Continent, Region
from country
where Region like '_c%i_';

select Name, Continent, Region
from country
where Region like '%a_a%';
