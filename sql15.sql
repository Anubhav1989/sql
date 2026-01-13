-- data type in sql
-- numeric => int,float,decimal

use regex;
create table test10(id tinyint);
insert into test10 values(1),(-128),(127);
insert into test10 values(128);
select * from test10;

create table test11(id tinyint unsigned);
insert into test11 values(129),(255);
select * from test11;

create table test12(price float);
insert into test12 values(9182.125),(10.124567);
select * from test12;

create table test13(price float,price2 double);
insert into test13 values(9182.125,9182.125),(10.1234567,10.1234567);
select * from test13;

create table test14(price2 double(5,2));
insert into test14 values(98.1);
insert into test14 values(98.15);
insert into test14 values(4.11567);
insert into test14 values(1000);-- error
select * from test14;

create table test15(name char(10));
insert into test15 values('abc'),('deffghi');
insert into test15 values('asdfghjklpo');-- error
select * from test15;

create table test16(name varchar(20),gender char(10));
insert into test16 values('xp','male'),('ts','female'),('ac','male');
insert into test16 values('raj        ','male        ');
select *,length(name),length(gender) from test16;

-- ddl->data definition language
-- create,drop,alter,truncate
create table raj123(col int);

-- create a table using select(CTAS)
create table actor_cp as
select first_name,last_name from sakila.actor;

select * from actor_cp;

-- drop--
drop table actor_cp;

create table actor_cp as
select first_name as fname,last_name as lname from sakila.actor
where actor_id between 10 and 14;
select * from actor_cp;

-- alter
alter table actor_cp add column (salary int);

alter table actor_cp add constraint new_key primary key(fname);
alter table actor_cp drop column lname;
alter table actor_cp rename column salary to newsalary; 
desc actor_cp;

-- dml-> data manipulation language
-- insert,update set col=values

update actor_cp set newsalary=900;

update actor_cp set newsalary=888 where fname='UMA';
select * from actor_cp;