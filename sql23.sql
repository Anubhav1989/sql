use regex;

create table newactor as 
select actor_id,first_name from sakila.actor where actor_id between
1 and 3;

select * from newactor;

create view actor_v as
select *,substr(first_name,2) from newactor;

select * from actor_v;

insert into newactor values(4,'joe');

-- view insert(complex view)
insert into actor_v(actor_id,first_name) values(5,'finn');

-- simple view->any dmlchanges will be visible on original table
-- where view is created
create view actor_v2 as
select * from newactor where actor_id in(1,2);

select * from newactor;
insert into newactor values(5,'mills');

select * from actor_v2;
insert into actor_v2 values(2,'finn');

create table newpayment as
select payment_id,amount from sakila.payment where payment_id
between 1 and 7;

select * from newpayment;

create view payment_v as
select count(*) from newpayment;

select * from payment_v;
insert into payment_v values(10);-- error because its a complex view

-- DCL->permission which user can access
-- authentication and authorization

-- user =>create=>permission
-- ddl statement
create user regex identified by 'regex';
select * from mysql.user;

create database xpdb;

create table xpdb.actor1 as select actor_id,first_name from
sakila.actor where actor_id between 1 and 5;

create table xpdb.actor2 as select actor_id,first_name from
sakila.actor where actor_id between 3 and 7;

show grants for regex;

-- grant permission on database to username
grant select on xpdb.* to regex;

grant all privileges on xpdb.actor1 to regex;
show grants for regex;
