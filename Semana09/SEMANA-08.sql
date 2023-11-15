
-- Desafio 1

select idempleado, apellido, nombre, telefono 
from RH..empleado
where telefono is null or telefono='';
go

-- Desafio 2
select 
	idempleado, apellido, nombre,
	sueldo, comision,
	sueldo + isnull(comision,0) [ingreso total]
from RH..empleado;
go

-- Desafio 3
select * from RH..empleado
where (email is null)
or (email not like '%@desarrollasoftware.com' and email not like '%@desarrollasoftware.pe');
go

-- Desafio 4

select 
	e.idempleado, e.apellido, e.nombre, e.fecingreso,
	DATEDIFF(mm,e.fecingreso,GETDATE()) TIEMPO_MESES
from rh..empleado e
go

-- Desafio 5

-- Codigo del profesor Chuco: P011
select * from EduTec..Profesor;
go

-- Convertir la fecha al formato: AAAA-MM
select CONVERT(VARCHAR(7),GETDATE(),120);
GO

-- Consulta final
select IdCursoProg, IdCurso, IdCiclo, IdProfesor, Horario, Activo
from EduTec..CursoProgramado
where IdCiclo = CONVERT(VARCHAR(7),GETDATE(),120)
AND IdProfesor = 'P011';
go


-- Desafio 6

select IdProfesor, ApeProfesor, NomProfesor, DirProfesor
from EduTec..Profesor
where DirProfesor in ('Los Olivos','Comas','SMP');
go

-- Desafio 7

-- Convertir la fecha actual al formato: AAAA-MM
select FORMAT(GETDATE(), 'yyyy-MM');
go

-- Consulta final
select IdCursoProg, IdCurso, IdCiclo, Vacantes, Matriculados, Horario
from EduTec..CursoProgramado
where IdCiclo = FORMAT(GETDATE(), 'yyyy-MM')
AND Matriculados < 10;
go


-- Desafio 8

-- Codigos de los curso de java: C005, C006, C007, C008, C014
select IdCurso from EduTec..Curso
where NomCurso like '%JAVA%';
go

-- Consulta final
select IdCursoProg, IdCiclo, IdCurso, Horario, Activo
from EduTec..CursoProgramado
where IdCiclo = FORMAT(GETDATE(), 'yyyy-MM')
AND IdCurso IN ('C005','C006','C007','C008','C014');
go


-- Desafio 9

select OrderID, CustomerID, OrderDate, ShipCountry, ShipCity
from Northwind..Orders
where ShipCountry in ('Mexico','Spain','Brazil');
go


-- Desafio 10

select CustomerID, CompanyName, ContactName, ContactTitle, City, Country
from Northwind..Customers
where City in ('Rio de Janeiro','Sao Paulo','Buenos Aires','Caracas');
go


-- Desafio 11

select distinct City from Northwind..Customers;
go


-- Desafio 12

-- Los tipos de contactos solicitados: Owner, Marketing Manager, Sales Manager
select distinct ContactTitle from Northwind..Customers
where ContactTitle like '%Manager%';
go

-- Consulta final
select CustomerID, CompanyName, ContactName, ContactTitle
from Northwind..Customers
where ContactTitle in ('Owner','Marketing Manager','Sales Manager');
go


