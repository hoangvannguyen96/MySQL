USE QuanLySinhVien;
select * from student
where studentname like 'h%';
select * from class
where month(startdate)=12;
select * from subject
where credit between 3 and 5;
-- update student set classid=2 where studentid=1;
select s.StudentName, sub.SubName, m.Mark
from mark m
join student s on m.studentid=s.studentid
join subject sub on m.subid=sub.subid
order by m.mark desc,
s.studentname asc
