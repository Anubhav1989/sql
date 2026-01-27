use regex;
CREATE TABLE drivers( 
driver_id INT PRIMARY KEY,
driver_name VARCHAR(50) NOT NULL,
base_area VARCHAR(50) NOT NULL
);

CREATE TABLE trips(
trip_id INT PRIMARY KEY,
driver_id INT NOT NULL,
trip_date DATE NOT NULL,
distance_km DECIMAL(5,1) NOT NULL,
fare INT NOT NULL,
rating DECIMAL(3,1) NOT NULL,
CONSTRAINT fk_trips_driver FOREIGN KEY (driver_id) 
REFERENCES drivers(driver_id));

INSERT INTO drivers(driver_id, driver_name, base_area) 
VALUES (1, 'Asha', 'Indiranagar'), (2, 'Ravi', 'Koramangala'),
(3, 'Meera', 'Whitefield'), (4, 'Kabir', 'HSR Layout');

INSERT INTO trips(trip_id, driver_id, trip_date, 
distance_km, fare, rating) 
VALUES (101, 1, '2025-11-01', 12.0, 350, 4.8),
(102, 1, '2025-11-02', 5.5, 180, 4.6),
(103, 2, '2025-11-01', 8.0, 260, 4.9),
(104, 2, '2025-11-03', 15.0, 500, 4.7),
(105, 3, '2025-11-02', 3.0, 120, 4.2),
(106, 3, '2025-11-04', 22.0, 780, 4.9),
(107, 4, '2025-11-01', 6.0, 210, 4.5),
(108, 4, '2025-11-03', 9.0, 300, 4.4),
(109, 4, '2025-11-04', 4.0, 150, 4.8),
(110, 1, '2025-11-04', 18.0, 620, 4.9);

select * from drivers;
select * from trips;

select trip_date,count(trip_id),sum(fare),avg(rating)
from trips group by trip_date;

select d.base_area,count(t.trip_id),sum(t.fare),avg(t.distance_km)
from drivers as d join trips as t on d.driver_id=t.driver_id
group by base_area;

select case when rating >=4.8 then 'high'
else 'others' end as rating_bucket,count(*) from trips
group by rating_bucket;

select trip_date,sum(fare) from trips group by trip_date
having sum(fare)>=800;

select base_area,avg(rating) from drivers as d join
trips as t on d.driver_id=t.driver_id group by base_area
having avg(rating)>=4.7;

select trip_id,driver_id,fare from trips where fare>
(select avg(fare) from trips);

select d.driver_id,driver_name from drivers as d join trips as t
on d.driver_id=t.driver_id where rating in 
(select rating where rating>=4.9);

select t.driver_id,d.driver_name,sum(fare) from trips as t
join drivers as d on t.driver_id=d.driver_id
group by t.driver_id,d.driver_name having sum(fare) >
(select avg(fare) from trips);

select t.driver_id,t.trip_id,t.trip_date,fare from trips as t
where t.trip_date = (select max(t1.trip_date) from trips as t1
where t.driver_id=t1.driver_id) order by driver_id;

select driver_id,trip_id,trip_date,row_number() over(partition by 
driver_id order by trip_date,trip_id) from trips;

select driver_id,trip_id,trip_date,fare,sum(fare) over(partition by
driver_id order by trip_date,trip_id) from trips;

select driver_id,trip_id,fare,rank() over(partition by driver_id
order by fare desc) from trips;

select driver_id,trip_id,fare,fare-avg(fare) 
over(partition by driver_id) from trips;

select driver_id,trip_id,trip_date,fare,lag(fare) over(partition by
driver_id) from trips;