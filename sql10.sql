select name,population,case
when population=0 then'no population'
when population>100000 then'large population'
when population>=8000 then 'small population'
else 'very small'
end as population_cat
from world.country group by name,population,population_cat;