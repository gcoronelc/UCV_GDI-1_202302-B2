create database colegio;
go


use colegio;
go


create table curso(
idcurso int identity,
nombre varchar(100) not null,
profesor varchar(100) null,
precio numeric(10,2) not null,
vacantes int not null,
matriculados int not null,
constraint pk_curso primary key(idcurso)
);
go


insert into curso(nombre,profesor,precio,vacantes,matriculados)
values('GDI-1','Profesor Coronel',5000.00,20,5);
go

select * from curso;
go

insert into curso(nombre,profesor,precio,vacantes,matriculados)
values('GDI-2','Profesor Coronel',6000.0,20,5);
go

select * from curso;
go













select * from producto;
go







