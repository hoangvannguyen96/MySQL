use store;
create table customer(
idcustomer int not null,
namecustomer varchar(25) not null,
age int
);
create table oder(
idoder int not null,
idcustomer int not null,
date datetime,
totalprice float
);
create table product(
idproduct int not null,
nameproduct varchar(25),
price float
);
alter table customer
modify idcustomer int primary key;
alter table oder
modify idoder int primary key;
alter table product
modify idproduct int primary key;
create table oderitems(
idoder int,
idproduct int,
quantity int,
primary key(idoder,idproduct),
foreign key (idoder) references oder(idoder),
foreign key (idproduct) references product(idproduct)
);
SELECT idoder,date,totalprice 
FROM store.oder;
alter table oder
add foreign key (idcustomer) references customer(idcustomer);
SELECT distinct c.namecustomer,p.nameproduct 
FROM customer c
join oder o on o.idcustomer=c.idcustomer
join oderitems oitem on oitem.idoder=o.idoder
join product p on p.idproduct=oitem.idproduct;

select c.namecustomer
from customer c
left join oder o on o.idcustomer=c.idcustomer
where o.idoder is null;

select o.idoder, o.date, sum(oitem.quantity*p.price) as totalprice
from oder o
join oderitems oitem on oitem.idoder=o.idoder
join product p on oitem.idproduct=p.idproduct
group by o.idoder, o.date

