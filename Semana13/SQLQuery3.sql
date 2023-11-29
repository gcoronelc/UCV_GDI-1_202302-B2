create procedure usp_matricula
(
	@curso int,
	@alumno int,
	@empleado int,
	@tipo varchar(20),
	@cuotas int,
	@estado int out,
	@mensaje varchar(500) out
)
as
begin
	declare @precio money;
	select @precio = cur_precio from curso where cur_id = @curso;
	update curso set cur_matriculados = cur_matriculados + 1 where cur_id = @curso;
	insert into matricula(cur_id,alu_id,emp_id,mat_tipo,mat_fecha,mat_precio,mat_cuotas)
	values(@curso,@alumno,@empleado,@tipo,getdate(),@precio,@cuotas);
	set @estado = 1;
	set @mensaje = 'Proceso ok';
end;
go

select * from curso where cur_id=4;
select * from matricula where cur_id=4;
go


declare @estado int;
declare @mensaje varchar(500);
exec usp_matricula 4, 7, 3, 'NORMAL',2, @estado out, @mensaje out;
print concat('Estado: ',@estado)
print concat('Mensaje: ',@mensaje);
go