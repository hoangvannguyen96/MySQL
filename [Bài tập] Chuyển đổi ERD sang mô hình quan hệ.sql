-- create database quanlyxuatnhapkho;
use quanlyxuatnhapkho;
create table phieuxuat(
sopx int not null auto_increment primary key,
ngayxuat date 
);
create table vattu(
mavattu int not null auto_increment primary key,
tenvattu varchar(255) not null
);
create table phieuxuatvattu(
sopx int,
mavattu int,
dongiaxuat float,
soluongxuat int,
primary key(sopx,mavattu),
foreign key(sopx) references phieuxuat(sopx),
foreign key(mavattu) references vattu(mavattu)
);
create table phieunhap(
sopn int not null auto_increment primary key,
ngaynhap date 
);
create table phieunhapvattu(
sopn int,
mavattu int,
dongianhap float,
soluongnhap int,
primary key(sopn,mavattu),
foreign key(sopn) references phieunhap(sopn),
foreign key(mavattu) references vattu(mavattu)
);
create table dondathang(
sohoadon int not null auto_increment primary key,
ngaydathang date
);
create table dondathangvattu(
sohoadon int,
mavattu int,
primary key(sohoadon,mavattu),
foreign key(sohoadon) references dondathang(sohoadon),
foreign key(mavattu) references vattu(mavattu)
);
create table nhacungcap(
manhacungcap int not null auto_increment primary key,
tennhacungcap varchar(255),
diachi varchar(255),
sodienthoai varchar(20)
);
alter table dondathang
add column manhacungcap int not null,
add foreign key (manhacungcap) references nhacungcap(manhacungcap)


