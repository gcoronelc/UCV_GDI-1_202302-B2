
use eurekabank;
go

select * from movimiento;
go

select @@TRANCOUNT;
go

begin tran;
go

select @@TRANCOUNT;
go

delete from movimiento;
go

select * from movimiento;
go

rollback;
go

select * from movimiento;
go



