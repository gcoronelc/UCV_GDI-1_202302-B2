select * from EMPLEADO;
go


select * from educa2..ALUMNO;
go

-- Pedidos que no han sido atendidos por los empleados 1, 2, 3, 4 y 5
SELECT * FROM Northwind..Orders
WHERE EmployeeID != ALL 
	(select EmployeeID from Northwind..Employees where EmployeeID<=5);
GO

/*
Se necesita saber quienes son los clientes que han realizado pedidos en el mes de mayo con destino a Drasil.
Base de datos: NORTHWIND
*/

SELECT CustomerID FROM Northwind..Orders 
WHERE MONTH(OrderDate) = 5 AND ShipCountry='Brazil';
GO

SELECT * FROM Northwind..Customers
WHERE CustomerID = ANY (SELECT CustomerID FROM Northwind..Orders 
WHERE MONTH(OrderDate) = 5 AND ShipCountry='Brazil')
ORDER BY 1;
GO

-- Operador: BETWEEN
/*
Se necesita saber los pedidos que tienen un precio de transporte 
entre 51.30 y 52.92
*/

SELECT * FROM Northwind..Orders
WHERE Freight BETWEEN 51.30 AND 52.92
ORDER BY Freight;
GO







