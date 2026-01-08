use regex;

create table test1(sno int);
desc test1;

insert into test1 values(10);
insert into test1(sno) values(20);
insert into test1(sno) values(null),(30);
select count(sno),count(*) from test1;
select count(sno) from test1;
select * from test1;

create table test2(sno int not null,salary int);
insert into test2(sno,salary) values(20,1000);
insert into test2(sno,salary) values(21,null);
insert into test2(sno,salary) values(null,100); -- error
insert into test2(salary) values(6000);-- error
select * from test2;

create table test3(sno int not null default 80,salary int);
insert into test3(salary) values(1000);
insert into test3(sno) values(50);
select * from test3;

create table test4(sno int not null,salary int unique default 100);
insert into test4(sno,salary) values(10,2000);
insert into test4(sno,salary) values(11,2000);-- error duplicate value
insert into test4(sno) values(13);
insert into test4(sno,salary) values(12);-- error default 100 already
insert into test4(sno,salary) values(14,null);
select * from test4;

create table test7(sno int check(sno between 1 and 100),salary int,
check(salary in (1000,2000)));
insert into test7(sno,salary) values(4,1000);
insert into test7(sno,salary) values(150,1000);-- error
insert into test7(sno,salary) values(50,1500);-- error
insert into test7(sno,salary) values(150,1100);-- error

create table test8(sno int,salary int,
constraint regex_test8_sno_check check(sno between 1 and 100),
constraint regex_test8_salary_check check(salary in (1000,2000)));

insert into test7(sno,salary) values(4,1000);
insert into test7(sno,salary) values(150,1000);-- error
insert into test7(sno,salary) values(90,1100);-- error
 
create table test9(sno int primary key,salary int);
insert into test9(sno,salary) values(4,1000);
insert into test9(sno,salary) values(null,1223);-- error
select * from test9;

-- foreign key
create table customer1(cid int primary key,cname varchar(20));
insert into customer1 values(10,'aman'),(11,'abhi');
select * from customer1;

create table order1(order_no int primary key,city varchar(20),
cid int,foreign key(cid) references customer1(cid));

insert into order1 values(1007,'Pb',10),(1008,'Hp',11),(1009,'Ch',10);
insert into order1 values(1001,'Jk',25);-- error 25 cid is not in customer1
select * from order1;