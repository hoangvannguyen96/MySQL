-- create database demo;
use demo;
create table products(
Id int not null primary key,
productCode int,
productName varchar(255),
productPrice float,
productAmount int,
productDescription varchar(255),
productStatus bit
);
insert into products()
values(1,1,'sữa tươi',12000,5,'thơm ngon',1),
(2,2,'one one',8000,5,'giòn tan',0),
(3,3,'oshi',16000,9,'ngon ngon',1);
create unique index indexproductCode on products(productCode);
-- create unique index compositeindex on products(productName,productPrice);
alter table products drop index indexproductCode ;
explain select * from products where productcode=2;
create view product_view2 as
select Id,productCode,productName,productPrice,productAmount,productDescription,productStatus from products where productname='oshi';
SELECT * FROM product_view2;
update product_view2
set productAmount=15
where Id=3;
delete from product_view2
where id=3;
drop view product_view2;
use demo;
delimiter //
drop procedure if exists displayallproduct;
create procedure displayallproduct()
begin
select * from products;
end//

delimiter //
drop procedure if exists addproduct;
create procedure addproduct(
in new_id int,
in new_productCode int,
in new_productName varchar(255),
in new_productPrice float,
in new_productAmount int,
in new_productDescription varchar(255),
out message varchar(255)
)
begin
set @check=1;
if @check = (select count(id) from products p where p.id=new_id) then
set message = 'mã này đã tồn tại trong products';
select message as message;
else 
insert into products(id,productCode,productName,productPrice,productAmount,productDescription,productStatus)
values(new_id,new_productCode,new_productName,new_productPrice,new_productAmount,new_productDescription,1);
end if;
end//

delimiter //
drop procedure if exists fixProduct;
create procedure fixProduct(
in new_id int,
in new_productCode int,
in new_productName varchar(255),
in new_productPrice float,
in new_productAmount int,
in new_productDescription varchar(255),
out message varchar(255)
)
begin
set @check=1;
if (new_id is null or new_productCode is null or new_productName ='' or new_productPrice is null or new_productAmount is null or new_productDescription='') then
set message = 'bạn không được để trống';
else
	if @check = (select count(id) from products p where p.id=new_id) or @check = (select count(productCode) from products p where p.productCode=new_productCode) or
		@check <> (select count(id) from products p where p.id=new_id) or @check <> (select count(productCode) from products p where p.productCode=new_productCode) then
		set message = 'mã này đã tồn tại hoặc không có trong products';
	else 
		if new_productPrice <=0 or new_productAmount<=0 then
		set message = 'giá hoặc số lượng phải lớn hơn 0';
		else 
			update products set productCode=new_productCode, productName=new_productName, productPrice=new_productPrice, 
							productAmount=new_productAmount,
							productDescription=new_productDescription
                            where id=new_id;
		end if;
	end if;
end if;	
end//

delimiter //
drop procedure if exists deleteProductById;
CREATE PROCEDURE `deleteProductById`(
in id_delete int
)
begin
declare message varchar(255) default '';
if exists (select id from products where id=id_delete) then
	delete from products where id=id_delete;
else 
	set message = concat(message,'id bạn nhập không có trong bảng');
end if;
select message;
end
//
