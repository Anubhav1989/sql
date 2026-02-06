use regex;

create table actor_cp2 as
select first_name as fname,last_name from sakila.actor
where actor_id between 10 and 14;


set @@autocommit=1;
select @@autocommit;
insert into actor_cp2 values(8,'test1');
select * from actor_cp2;
commit;
rollback;

start transaction;
insert into actor_cp2 values(12,'kart');
select * from actor_cp2;
create table xyx(id int);

start transaction;
insert into actor_cp2 values(16,'xp');

insert into actor_cp2 values(17,'abc');
delete from actor_cp2 where actor_id in (7,9);
savepoint db_actor_cp2chk1;
delete from actor_cp2 where actor_id in(3);
rollback to db_actor_cp2chk1;
select * from actor_cp2;


