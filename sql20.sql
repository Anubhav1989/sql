use regex;

select * from events;
select * from ticket_sales;

select * from ticket_sales where sale_date = (select max(sale_date) from
ticket_sales);

select sale_id,event_id,sum(qty*price_per_ticket) as revenue
from ticket_sales group by sale_id,event_id having revenue > (select
avg(qty*price_per_ticket) from ticket_sales);

select e.event_id,e.event_name from events as e join ticket_sales as t on
e.event_id=t.event_id where ticket_type='VIP';

select e.event_id,e.event_name,e.city from events as e join ticket_sales
as t on e.event_id=t.event_id where t.ticket_type='VIP';

select distinct e.event_id,e.event_name,e.city from events as e join ticket_sales
as t on e.event_id=t.event_id where month(t.sale_date)=2;

select sale_id,event_id,sale_date,ticket_type,qty,price_per_ticket
from ticket_sales as t where price_per_ticket=(select max(price_per_ticket)
from ticket_sales as t1 where t.event_id=t1.event_id);

select month(sale_date),sum(qty),sum(qty*price_per_ticket) from
ticket_sales group by month(sale_date)
having(sum(qty*price_per_ticket)) >= 10000;

select month(sale_date),count(*) from ticket_sales group by
month(sale_date) having count(*)>=3;

select month(sale_date),avg(qty*price_per_ticket) from
ticket_sales group by month(sale_date)
having avg(qty*price_per_ticket)>4000;

select month(sale_date),ticket_type,sum(qty*price_per_ticket) from
ticket_sales group by month(sale_date),ticket_type having
sum(qty*price_per_ticket)>=5000;