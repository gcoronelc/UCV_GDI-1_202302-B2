
SELECT * FROM CURSO;
GO

WITH
T1 AS (SELECT SUM(cur_matriculados) TOTAL FROM CURSO)
SELECT 
	C.cur_nombre, C.cur_matriculados,
	CAST(C.cur_matriculados * 100.0 / T1.TOTAL AS NUMERIC(5,2)) AS PORCENTAJE
FROM CURSO C CROSS JOIN T1;
GO


