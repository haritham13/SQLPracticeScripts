/******************************************************************
Author: Haritha Madala
Content inside: Stored Proceduderes
*********************************************************************/
Use dbschool
Go
create table printnum(id int)
go
delete  printnum
go

alter proc usp_printnum
as 
	begin
		declare @x int
		set @x=1
		while(@x<=40)
			begin
				insert into printnum values(@x)
				set @x= @x+1
select * from printnum
			end
	select * from printnum
	end
		
exec usp_printnum
go

alter proc usp_printnnum
(
@n int
)
as
	begin
		declare @x int=1
		while(@x<= @n)
			begin
				print @x
				set @x=@x+1
			end
	end

exec usp_printnnum 100
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
create table oddnum(OddNum int)
go
drop table oddnum
delete oddnum
go

alter proc usp_OddNums
( 
@n int
)
as
begin
	declare @x int 
	set @x=1
	while(@x <= @n)
		begin
			if(@x%2=1)
				insert into oddnum values(@x)
			set @x=@x+1
		end
select * from oddnum
end

exec usp_OddNums 500
--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------

create table evennum(Evennum int)
go
delete evennum
drop table evennum
Go

create proc usp_EvenNums
( 

	@n int

)
as
begin
	declare @x int 
	set @x=1
	while(@x <= @n)
		begin
			if(@x%2=0)
				insert into evennum values(@x)
			set @x=@x+1
		end
	select * from evennum
end

exec usp_EvenNums 1000
Go
--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------

sp_helptext 'usp_printnnum'
Go
use DBSCHOOL
go

create proc usp_DynamicInputs
( 
	@x int,
	@n int

)
as
begin
		while(@x <= @n)
		begin
			if(@x%2=0)
				print @x
			set @x=@x+1
		end
	end

exec usp_DynamicInputs 10,100
Go
