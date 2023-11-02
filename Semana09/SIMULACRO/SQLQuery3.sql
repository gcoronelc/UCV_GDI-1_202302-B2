-- Creacion de tabla CLIENTE
CREATE TABLE CLIENTE (
	IDCLIENTE integer NOT NULL IDENTITY,
	DNI char(8) NOT NULL,
	NOMBRE varchar(100) NOT NULL,
	DIRECCION  varchar(150) NOT NULL,
	CELULAR varchar(15) NOT NULL,
	CORREO varchar(100) NOT NULL
);
GO

INSERT INTO CLIENTE VALUES('12345678','EL VISITANTE','NO SE','874598234','   ');
GO



/*
Elaborar una consulta para saber que clientes no tienen correo.
*/

SELECT * FROM CLIENTE 
WHERE CORREO='';
GO



