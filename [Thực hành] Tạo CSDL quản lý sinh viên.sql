-- create database QuanLySinhVien;
use QuanLySinhVien;
create table Class(
classid int not null auto_increment primary key,
classname varchar(60) not null,
startdate datetime not null,
status bit 
);
create table student(
studentid int not null auto_increment primary key,
studentname varchar(30) not null,
address varchar(50),
phone varchar(20),
status bit
);
alter table student
add column classid int not null;
create table Subject(
subid int not null auto_increment primary key,
subname varchar(30) not null,
credit tinyint not null default 1 check (credit >=1),
status bit default 1 
);
create table mark(
markid int not null auto_increment primary key,
subid int not null unique,
studentid int not null unique,
mark float default 0.0 check (mark>0 and mark<100),
examtimes tinyint default 1
);

