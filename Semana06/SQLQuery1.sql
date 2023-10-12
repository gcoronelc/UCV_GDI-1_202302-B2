create database ventas;
go

use ventas;
go

create table producto(
idproducto int identity,
nombre varchar(100) not null,
precio numeric(10,2) not null,
stock int not null
);
go

alter table producto
add constraint pk_producto primary key(idproducto);
go

insert into producto(nombre,precio,stock)
values('Televisor',4578.98,300);
go

select * from producto;
go

insert into producto(nombre,precio,stock)
values('Laptop',6578.34,500);
go

select * from producto;
go

