create procedure usp_pago
(
	@curso int,
	@alumno int,
	@nrocuota int,
	@empleado int,
	@importe money,
	@estado int out,
	@mensaje varchar (500)out
) 
as
begin
	-- validacion DE RANGO DE CUOTA 
	if (@nrocuota <1 or @nrocuota >3)
	begin 
		set @estado = -1;
		set @mensaje = 'numero de cuota fuera de rango';
		return;
	end;
	-- VALIDACIÓN DE NUMERO DE CUOTAS

	-- proceso
	insert into PAGO (cur_id, alu_id, pag_cuota, emp_id,pag_fecha, pag_importe)
	values (@curso,@alumno,@nrocuota,@empleado,getdate(),@importe);
	set @estado = 1;
	set @mensaje = 'proceso ok';
end;
go

select*from MATRICULA WHERE cur_id = 4 AND alu_id = 5;
select* from PAGO WHERE CUR_ID = 4 AND alu_id = 5;
go


declare @estado int;
declare @mensaje varchar(500);
exec usp_pago 4 , 5,2,3,10000,@estado OUT,@mensaje OUT;
PRINT CONCAT ('ESTADO : ',@ESTADO);
PRINT CONCAT ('MENSAJE : ',@MENSAJE);
GO

