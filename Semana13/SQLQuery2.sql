/*
Procedimiento para sumar 2 numeros.
*/

-- Version 1

alter procedure usp_sumar
(@num1 int, @num2 int)
as
begin -- Inicio
	-- Variables
	declare @suma int;
	-- Proceso
	set @suma = @num1 + @num2;
	-- Reporte
	print concat('Numero 1: ',@num1);
	print concat('Numero 2: ',@num2);
	print concat('Suma: ',@suma);
end; -- Fin
go

-- Prueba
exec usp_sumar 34, 76;
go


-- Version 2

create procedure usp_sumar_v2
(@num1 int, @num2 int, @suma int out)
as
begin -- Inicio
	-- Proceso
	set @suma = @num1 + @num2;
end; -- Fin
go

-- Prueba
declare @num1 int = 47;
declare @num2 int = 85;
declare @suma int;
exec usp_sumar_v2 @num1, @num2, @suma out;
print concat('Numero 1: ',@num1);
print concat('Numero 2: ',@num2);
print concat('Suma: ',@suma);
go




