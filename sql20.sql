use regex;

CREATE TABLE events (
    event_id   INT PRIMARY KEY,
    event_name VARCHAR(100) NOT NULL,
    city       VARCHAR(50)  NOT NULL
);

CREATE TABLE ticket_sales (
    sale_id          INT PRIMARY KEY,
    event_id         INT NOT NULL,
    sale_date        DATE NOT NULL,
    ticket_type      VARCHAR(20) NOT NULL,
    qty              INT NOT NULL,
    price_per_ticket INT NOT NULL,
    CONSTRAINT fk_ticket_sales_event
        FOREIGN KEY (event_id) REFERENCES events(event_id)
);

INSERT INTO events (event_id, event_name, city) VALUES
    (1, 'Music Fest',     'Mumbai'),
    (2, 'Tech Summit',    'Bengaluru'),
    (3, 'Food Carnival',  'Delhi'),
    (4, 'Startup Meetup', 'Mumbai');

INSERT INTO ticket_sales (sale_id, event_id, sale_date, ticket_type, qty, price_per_ticket) VALUES
    (101, 1, '2025-01-05', 'Regular', 2, 1500),
    (102, 1, '2025-01-10', 'VIP',     1, 5000),
    (103, 2, '2025-02-03', 'Regular', 3, 2000),
    (104, 2, '2025-02-10', 'VIP',     1, 6000),
    (105, 3, '2025-03-01', 'Regular', 5,  800),
    (106, 3, '2025-03-15', 'VIP',     2, 2500),
    (107, 4, '2025-01-20', 'Regular', 4, 1200),
    (108, 4, '2025-02-05', 'Regular', 1, 1200);

SELECT * FROM events ORDER BY event_id;
SELECT * FROM ticket_sales ORDER BY sale_id;

select event_id,sum(qty) from ticket_sales group by event_id;

select event_id,sum(qty*price_per_ticket) from ticket_sales
group by event_id;

select month(sale_date),sum(qty*price_per_ticket) from ticket_sales
group by month(sale_date);

select event_id,max(price_per_ticket) from ticket_sales 
group by event_id;

select month(sale_date),sum(qty*price_per_ticket),ticket_type from
ticket_sales group by month(sale_date),ticket_type;

select t.sale_id,e.event_name,t.sale_date from ticket_sales as t
join events as e on t.event_id=e.event_id;

select e.event_name,t.ticket_type,t.qty from events as e
join ticket_sales as t on e.event_id=t.event_id;

select t.sale_id,e.event_name,e.city,t.sale_date from ticket_sales as t
join events as e on t.event_id=e.event_id where e.city='Mumbai';

select e.event_name,t.sale_id,t.sale_date from events as e 
join ticket_sales as t on e.event_id=t.event_id;

select e.event_name from events as e join ticket_sales as t
on e.event_id=t.event_id group by e.event_name having(count(*))>1;

select t.sale_id,e.event_name,sum(t.qty*t.price_per_ticket) as revenue
from ticket_sales as t join events as e on t.event_id=e.event_id
group by t.sale_id,e.event_name;

select e.event_name,sum(t.qty) from events as e join ticket_sales as t
on e.event_id=t.event_id group by e.event_name;

select e.event_name,sum(t.qty*t.price_per_ticket) from events as e
join ticket_sales as t on e.event_id=t.event_id where 
t.ticket_type='VIP' group by e.event_name order by e.event_name;

select e.city,month(t.sale_date),sum(t.qty*t.price_per_ticket) from
events as e join ticket_sales as t on e.event_id=t.event_id 
group by e.city,month(sale_date) order by e.city;

select e.city,t.ticket_type,sum(t.qty) from events as e join 
ticket_sales as t on e.event_id=t.event_id group by city,ticket_type
order by city;


