/*
Consultar los cursos de educa2.
*/

select * from EDUCA2..CURSO;
go

select alu_nombre, alu_direccion,alu_id
from educa2 .. ALUMNO;
go

select 
	cur_id,cur_nombre,cur_vacantes,cur_matriculados,
	cast(cur_matriculados*100.0/cur_vacantes as numeric(5,0)) avance
from EDUCA2..CURSO;
go

select *  from EDUCA2..MATRICULA
WHERE cur_id = 1 and cur_id = 5;
go


select * from educa2..MATRICULA
where DATEADD(dd, 0, DATEDIFF(dd, 0, mat_fecha)) 
    = DATEADD(dd, 0, DATEDIFF(dd, 0, getdate()));
go


select getdate();
go

SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, getdate())) AS 'Fecha sin Hora'

