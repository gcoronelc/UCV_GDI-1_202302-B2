alter procedure usp_crea_cuenta
(
	@cliente char(5),
	@moneda char(2),
	@importe money,
	@clave char(6),
	@empleado char(4),
	@estado int out,
	@mensaje varchar(1000) out
)
as
begin
declare @sucursal char(3);
declare @cont int;
declare @cuenta char(8);
BEGIN TRY
	-- Inicio de TX
	BEGIN TRANSACTION;
	-- Obtener sucursal
	select @sucursal=chr_sucucodigo  from asignado 
	where chr_emplcodigo=@empleado and dtt_asigfechabaja is null;
	-- Contador de cuentas y generar cuenta
	update sucursal 
	set int_sucucontcuenta = int_sucucontcuenta + 1
	where chr_sucucodigo = @sucursal;
	select @cont = int_sucucontcuenta  from sucursal where chr_sucucodigo = @sucursal;
	set @cuenta = RIGHT('000000' + CAST(@cont AS VARCHAR(6)), 5);
	set @cuenta = @sucursal + @cuenta; -- Cuenta completa
	-- Insertar la cuenta
	insert into cuenta(chr_cuencodigo,chr_monecodigo,chr_sucucodigo,chr_emplcreacuenta,
	chr_cliecodigo,dec_cuensaldo,dtt_cuenfechacreacion,vch_cuenestado, int_cuencontmov,
	chr_cuenclave)
	values(@cuenta,@moneda,@sucursal,@empleado,@cliente,@importe,getdate(),'ACTIVO',1,@clave);
	-- Registrar movimiento
	insert into movimiento(chr_cuencodigo,int_movinumero,dtt_movifecha,chr_emplcodigo,
	chr_tipocodigo,dec_moviimporte)
	values(@cuenta,1,getdate(),@empleado,'001',@importe);
	-- Confirmar TX
	COMMIT TRANSACTION;
	set @estado = 1;
	set @mensaje = 'Proceso completado.';
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION;
	set @estado = -1;
	set @mensaje = 'Error en el proceso.';
END CATCH;
end;
go

select * from cuenta order by 7 desc;
select * from movimiento order by 3 desc;
go

declare @estado int, @mensaje varchar(1000);
exec usp_crea_cuenta '00006', '01', 5000.0, '123456','0002', @estado out, @mensaje out;
select @estado, @mensaje;
go

