select v.vehicle_id,v.owner_name,sum(p.hours_parked) from vehicles as v 
join parking_logs as p on v.vehicle_id=p.vehicle_id group by v.vehicle_id,v.owner_name;

select v.vehicle_id,v.owner_name from vehicles as v join parking_logs as p
on v.vehicle_id=p.vehicle_id group by v.vehicle_id,v.owner_name having 
sum(p.hours_parked) > (select avg(hours_parked) from parking_logs);

select p.log_id,p.vehicle_id,p.hours_parked from parking_logs as p where p.hours_parked>
(select avg(p1.hours_parked) from parking_logs as p1 where p1.vehicle_id=p.vehicle_id)
group by p.log_id,p.vehicle_id;

select log_id,vehicle_id,hours_parked,rank() over(partition by vehicle_id order by
hours_parked desc) from parking_logs;

select vehicle_id,park_date,hours_parked,sum(hours_parked) over(partition  by vehicle_id
order by park_date) from parking_logs;

select v.vehicle_id,v.owner_name,sum(p.hours_parked) from vehicles as v join parking_logs 
as p on v.vehicle_id=p.vehicle_id group by v.vehicle_id,v.owner_name having 
sum(p.hours_parked)>5;

-- Normalization in DBMS is the process of organizing data into structured tables to reduce
-- redundancy , it is a systematic approach to decompose larger datasets into tables with 
-- enforcing relationship between them
-- Types of normalization:
-- (1) 1NF-the rule to have 1NF is each column should not have repeating groups,each column 
-- must hold indivisible values
-- (2) 2NF- it must be in 1NF and no partial dependency which means that non-key attributes
-- should depend on the whole primary key, not some part of it
-- (3) 3NF- it must be in 2NF and no transitive dependency which means that non-key 
-- attributes depend only on the primary key   