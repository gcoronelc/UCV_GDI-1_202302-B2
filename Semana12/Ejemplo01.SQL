/*
Cuantos trabajadores hay por cargo
y su respectiva planilla.

La plantilla de la salida:
------------------------------------------------
COD.   NOMBRE  CANT.  IMPORTE  IMPORTE  IMPORTE
CARGO  CARGO   EMPL.  PLANILLA COMISION TOTAL
------------------------------------------------
.....
.....
------------------------------------------------
*/

SELECT 
	C.idcargo, C.nombre,
    COUNT(1) CANT_EMP,
    SUM(E.sueldo) IMP_PLANILLA,
    SUM(ISNULL(E.comision,0)) IMP_COMISION,
    SUM(E.sueldo + ISNULL(E.comision,0)) IMP_TOTAL
FROM empleado E
JOIN cargo C ON E.idcargo = C.idcargo
GROUP BY C.idcargo, C.nombre;
GO



CREATE PROCEDURE USP_PLANILLA_X_CARGO
AS
BEGIN -- Inicio
	SELECT 
		C.idcargo, C.nombre,
		COUNT(1) CANT_EMP,
		SUM(E.sueldo) IMP_PLANILLA,
		SUM(ISNULL(E.comision,0)) IMP_COMISION,
		SUM(E.sueldo + ISNULL(E.comision,0)) IMP_TOTAL
	FROM empleado E
	JOIN cargo C ON E.idcargo = C.idcargo
	GROUP BY C.idcargo, C.nombre;
END; -- Final
GO

EXEC USP_PLANILLA_X_CARGO;
GO

/*
Agregar un parametro al procedimiento
para que el reporte sea por departamento.
*/


ALTER PROCEDURE USP_PLANILLA_X_CARGO
( @COD_DPTO INT )
AS
BEGIN -- Inicio
	SELECT 
		C.idcargo, C.nombre,
		COUNT(1) CANT_EMP,
		SUM(E.sueldo) IMP_PLANILLA,
		SUM(ISNULL(E.comision,0)) IMP_COMISION,
		SUM(E.sueldo + ISNULL(E.comision,0)) IMP_TOTAL
	FROM empleado E
	JOIN cargo C ON E.idcargo = C.idcargo
	WHERE E.iddepartamento = @COD_DPTO
	GROUP BY C.idcargo, C.nombre;
END; -- Final
GO

EXEC USP_PLANILLA_X_CARGO;
GO











