/*
La cantidad de productos vendidos 
a Venezuela
*/

select sum(d.Quantity) Cantidad
from Northwind..[Order Details] d
join Northwind..Orders o 
on d.OrderID = o.OrderID
where o.ShipCountry = 'Venezuela';
go


/*
Se necesita saber el producto con el mayor precio.
*/

select MAX (UnitPrice) mayorPrecio from Northwind..Products;
go

select * from Northwind..Products 
where UnitPrice = 
(select MAX (UnitPrice) mayorPrecio from Northwind..Products);
go


/*
Se necesita saber el importe
de las ventas del mes de julio
del año 1997.
*/

select sum (d.UnitPrice*d.Quantity) importe
from Northwind.. Orders o 
join Northwind..[Order Details] d 
on o.OrderID = d.OrderID
where year (o.OrderDate)  = 1997 and month (o.OrderDate) = 7;
go


/*
Se necesita saber los productos que
su precio unitario esta por encima
del precio promedio.
*/

SELECT AVG(UNITPRICE) AS 'PRECIO PROMEDIO' FROM Northwind..Products
GO

SELECT P.*,
(SELECT AVG(UNITPRICE) FROM Northwind..Products) AS 'PRECIO PROMEDIO' 
FROM Northwind..Products P
WHERE UnitPrice > 
(SELECT AVG(UNITPRICE) AS 'PRECIO PROMEDIO' FROM Northwind..Products);
GO

WITH
V1 AS(
SELECT AVG(UNITPRICE) AS PRE_PRO 
FROM Northwind..Products
) 
SELECT p.*,V1.PRE_PRO
FROM Northwind..Products p
join V1 ON p.UnitPrice>V1.PRE_PRO;
go


/*

*/









