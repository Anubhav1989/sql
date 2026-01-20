USE window_fn_practice;

select * from employees;
select *,rank() over() from employees;
select *,row_number() over() from employees;

select *,rank() over(order by salary) from employees;

select *,dense_rank() over(order by salary) from employees;

select *,rank() over(partition by department order by salary)
from employees;

select *,row_number() over(order by salary desc) from employees;

select *,rank() over(order by salary desc) from employees;

select *,dense_rank() over(order by salary desc) from employees;

select *,row_number() over(partition by department order by salary desc)
from employees;

select *,rank() over(partition by department order by salary desc)
from employees;

select *,lead(salary) over() from employees;

select *,lag(salary) over() from employees;

select *,lag(salary) over(partition by department) from employees;

select *,lag(salary) over(partition by department order by hire_date),
salary-lag(salary) over(partition by department order by hire_date)
from employees;

select *,lead(salary) over(partition by department order by hire_date),
salary-lead(salary) over(partition by department order by hire_date)
from employees;

select *,lag(salary) over(order by salary desc),
lead(salary) over(order by salary desc ) from employees;

select * from sales;
select *,sum(amount) over(order by sale_date) from sales;

select *,sum(amount) over(partition by emp_id order by sale_date)
from sales;

select *,sum(amount) over() from sales;

select *,avg(salary) over(partition by department) from employees;

-- subquery saved to a variable named as 'tempdata'
-- first the subquery is solved save to the variable
-- and then we access the column and we filter out the data
select * from
(select *,row_number() over(partition by department order by salary)
as row_value from employees) tempdata where row_value<=2;

select *,avg(salary) over(partition by department),
salary-avg(salary) over(partition by department) from employees;

select *,sum(salary) over(),
rank() over(order by salary),
percent_rank() over(order by salary) from employees;