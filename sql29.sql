(1) select course_name,count(student_id) from enrollments group by course_name;

(2) select s.student_name from students as s join enrollments as e 
    on s.student_id=e.student_id where grade = (select e.grade from enrollments as e 
    where e.gade='A') group by student_id having count(e.grade)>=1;

(3) select s.student_name,e.course_name,count(e.course_name) over(partition by 
    s.student_name) from students as s join enrollments as e on s.student_id=e.student_id;

(4) select s.student_name from students as s join enrollments as e on
    s.student_id=e.studnt_id where e.course_fee=(select max(e.course_fee) from enrollments
    as e);

(5) select distinct s.student_name from students as s join enrollments as e on 
    s.student_id=e.student_id where e.course_fee >=(select course_fee from enrollments
    where course_fee=6000); 

(6) select s.student_name,e.course_name from students as s join enrollments as e on 
    s.student_id=e.student_id where e.course_fee=(select min(course_fee) from enrollment);

(7) select s.student_id,s.student_name,e.course_name,e.course_fee,sum(e.course_fee)
    over(partition by student_id order by e.course_fee) from students as s join enrollments
    as e on s.student_id=e.student_id;

(8) CTE: CTE stands for common table expressions which is defined using with keyword
    which is used for improving readability and can reused in the same query where we 
    defined it.
    Subquery: a subquery is a query within a query it is used to filter based on aggregating 
    values , subquerys are of multiple types such as single row subquery which returns one 
    value , a multi-row subquery which returns multiple values and nested subquery which
    looks for the value from the outer query.
    
    
