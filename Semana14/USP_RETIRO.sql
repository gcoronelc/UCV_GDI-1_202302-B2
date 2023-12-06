alter PROCEDURE USP_RETIRO
(
	@cuenta char(8),
	@importe money,
	@clave char(6),
	@empleado char(4),
	@estado int out,
	@mensaje varchar(1000) out
)
AS
BEGIN
DECLARE @CONT INT, @saldo money;
declare @ContMov int;
BEGIN TRY
	-- Inicio de TX
	BEGIN TRANSACTION;
	-- Paso 1: Verificar si existe la cuenta
	SELECT @CONT = COUNT(1) FROM CUENTA WHERE chr_cuencodigo=@cuenta;
	IF(@CONT<>1) 
	BEGIN
		THROW 51000, 'No existe la cuenta.', 1;
	END;
	-- Paso 2: Verificar saldo
	select @saldo = dec_cuensaldo, @ContMov = int_cuencontmov
	from cuenta where chr_cuencodigo = @cuenta;
	if(@importe > @saldo)
	begin
		THROW 51000, 'Saldo insuficiente.', 1;
	end;
	-- Paso 3: Actualizar saldo
	set @ContMov = @ContMov + 1;
	set @saldo = @saldo - @importe;
	update cuenta 
	set dec_cuensaldo = @saldo, int_cuencontmov = @ContMov
	where chr_cuencodigo = @cuenta;
	-- Paso 4: Registrar movimiento
	insert into movimiento(chr_cuencodigo,int_movinumero,dtt_movifecha,
	chr_emplcodigo,chr_tipocodigo,dec_moviimporte)
	values(@cuenta,@ContMov,getdate(),@empleado,'004',@importe);
	-- Confirmar TX
	COMMIT TRANSACTION;
	set @estado = 1;
	set @mensaje = 'Transaccion exitosa';
END TRY
BEGIN CATCH
	-- Datos de salida
	set @estado = -1;
	set @mensaje = ERROR_MESSAGE();
	-- Cancelar TX
	ROLLBACK TRANSACTION;
END CATCH;
END;
GO

SELECT * FROM CUENTA WHERE chr_cuencodigo='00100001';
SELECT * FROM MOVIMIENTO WHERE chr_cuencodigo='00100001';
GO


DECLARE @ESTADO INT, @MENSAJE VARCHAR(1000);
EXEC USP_RETIRO '00100001',50000,'123456','0003',@ESTADO OUT, @MENSAJE OUT;
SELECT @ESTADO,@MENSAJE
GO


SELECT * FROM CUENTA;