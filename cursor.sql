-- DECLARE
--     var NUMBER := 0;
-- BEGIN
--     WHILE var<=3 LOOP
--         DBMS_OUTPUT.PUT_LINE('COUNTER IS:' || var);
--         var:=var+1;
--     END LOOP;
-- END;
-- DECLARE
--     v_rec hr.employees%rowtype;
-- BEGIN

-- select *  into v_rec from hr.employees where employee_id=199;
-- DBMS_OUTPUT.PUT_LINE(v_rec.first_name|| ' '||v_rec.hire_date);

-- END;

-- armstrong no
-- DECLARE 
-- n int:=&num;
-- len int;
-- l int;
-- total int:=0;
-- p int;
-- temp int;
-- BEGIN
--     temp:=n;
--     len:=length(to_char(n));
--     while temp>0 loop
--         l:=mod(temp,10);
--         temp:=trunc(temp/10);
--         p:=1;
--         for i in 1..len loop 
--             p:=p*l;
--         end loop;
--         total:=total+p;
--     end loop;
--     if total=n then
--         dbms_output.put_line(n||' is an armstrong number');
--     else
--         dbms_output.put_line(n||' not an armstrong number');
--     end if;
-- END;

--prime number

-- declare 
-- n int:=&num;
-- c int:=0;
-- begin
--     for i in 1..n loop
--     if mod(n,i)=0 then
--         c:=c+1;
--     end if;
-- end loop;
-- if c=2 then
--     dbms_output.put_line(n||' is prime');
-- else
--     dbms_output.put_line(n||' is not prime');
-- end if;
-- end;

-- lcm
-- DECLARE
-- n int;
-- m int;
-- i int:=2;
-- lcm int:=1;
-- BEGIN
--     n:=&n;
--     m:=&m;

--     while n>1 or m>1 loop
--         if mod(n,i)=0 and mod(m,i)=0 THEN
--             lcm:=lcm*i;
--             n:=n/i;
--             m:=m/i;
--         elsif mod(n,i)=0 THEN
--             lcm:=lcm*i;
--             n:=n/i;
--         elsif mod(m,i)=0 THEN
--             lcm:=lcm*i;
--             m:=m/i;
--         else
--             i:=i+1;
--         end if;
--     end loop;
--     dbms_output.put_line(lcm);
-- end;

create table emp_cp
as select employee_id,first_name from hr.employees where employee_id between 
100 and 104;

select * from emp_cp;

BEGIN
    dbms_output.put_line('we are inside the begin');
    --update emp_cp set first_name='regex';
    delete from emp_cp where employee_id<103;
    dbms_output.put_line(sql%rowcount); 
end;

declare 
    cursor emp_cur is select * from emp_cp;--cursor created explicit
    emp_record emp_cp%rowtype;--record variable as same as of the table
begin 
    open emp_cur;--open cusrsor
    fetch emp_cur into emp_record;--here we fetch data from cursor
    if emp_cur%isopen THEN--if cursor open -> True otherwise false
        dbms_output.put_line('cursor open');
    end if;
    
    if emp_cur%found then --true(based on the fetch condition)
        dbms_output.put_line('cursor got the data');
    else
        dbms_output.put_line('cursor didnt found the data');
    end if;
    
    close emp_cur;--close the cursor
end;

declare 
    cursor emp_cur is select * from emp_cp;
    emp_record emp_cur%rowtype;

begin 
    open emp_cur;
    fetch emp_cur into emp_record;

    while emp_cur%found loop
        dbms_output.put_line(emp_record.employee_id);
        fetch emp_cur into emp_record;

    end loop;
    close emp_cur;
end;

declare 
    cursor emp_cur is select * from emp_cp;
    emp_record emp_cur%rowtype;

begin 
    for line in emp_cur loop 
        dbms_output.put_line(line.employee_id);
    end loop;
end;