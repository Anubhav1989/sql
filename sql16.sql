select b.title,count(br.bookid) as borrowcount from books as b join borrowrecords as br
on b.bookid=br.bookid group by b.title;

select b.title,count(br.bokid) as borrowcount from books as b join borrowrecords 
as br on b.bookid=br.bookid group by b.title having boorowcount>2;

select br.borrowername from borrowrecords as br join books as b on br.bookid=b.bookid
where b.price > (select avg(b.price) from books as b);

select br.borrowername,sum(b.price) as totalvalue from borrowrecords as br join books
as bs on br.bookid=b.bookid group by br.borrowername; 

select b.title,b.price from books as b join borrowrecords as br on 
b.bookid=br.bookid order by b.price limit 1;

select b.title,min(br.borrowdate) from books as b join borrowrecord as br on 
b.bookid=br.bookid group by b.title;

select br.borrowername,b.author,count(br.bookid) as borrowcount from borrowrecords as br
join books as b on br.bookid=b.bookid group by br.borrowername,b.author having 
borrowcount > 1;

-- Difference between primary key, unique key and foreign key are primary key only contain
unique and not null values while unique key allows unique values but also null 
values whereas foreign key references the primary key of another table creating 
the relationship between two tables.

-- Normalization is the pocess to remove data redundancy and improve data integrity 
    by making structured tables there are multiple normal forms such as 1NF,2NF,3NF