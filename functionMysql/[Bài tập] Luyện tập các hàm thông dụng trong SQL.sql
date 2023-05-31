use quanlysinhvien;

select subname, max(credit)
from subject
group by subname
having max(credit)= all (select max(credit) from subject);

select * from quanlysinhvien.subject
where credit = (select max(credit) from subject);
  
select s.*,avg(mark) as avgmark 
from student s
join mark m on m.studentid=s.studentid
group by s.studentid,s.studentname,s.address,s.phone,s.status,s.classid
order by classid
