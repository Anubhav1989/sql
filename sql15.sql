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