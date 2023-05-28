-- create database store;
use store;
create table Customer(
idcutomer int not null primary key,
name varchar(255),
age int 
);
create table Oder(
idoder int not null primary key,
idcutomer int not null,
date date,
totalprice float,
foreign key (idcutomer) references Customer(idcutomer)
);
create table product(
idproduct int not null primary key,
name varchar(255),
price float
);
create table oderitems(
idoder int,
idproduct int,
quantity int,
foreign key (idoder) references oder(idoder),
foreign key (idproduct) references product(idproduct)
);
alter table oderitems
add primary key(idoder,idproduct)