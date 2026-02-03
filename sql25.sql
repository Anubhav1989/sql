use sakila;
drop table test100;
create table test100 as select actor_id,first_name from actor where
actor_id between 1 and 10;

insert into test100 values(14,'abc'),(13,'ts'),(11,'el'),(12,'ac');

alter table test100 add primary key(actor_id);

select * from test100;
desc test100;-- no primary key

explain select * from test100 where actor_id=5;
 show index from test100;

explain select * from test100 where first_name='aman';
insert into test100 values (12,'abc'),(15,'abc');

show index from test100;

explain select * from test100 where actor_id=14;

-- index on 2 column
create index indx_composite on test100(actor_id,first_name);
show index from test100;

explain select * from test100 where actor_id>7;
insert into test100 values(16,'john'),(17,'johny'),(18,'johanason'),
(19,'johanesberg');

alter table test100 drop primary key;
drop index indx_composite on test100;
show index from test100;

create index index_3_chr on test100(first_name(3));
show index from test100;

explain select * from test100 where first_name='john';
explain select * from test100 where first_name like 'joh%';
select * from test100 where first_name like 'joh%';