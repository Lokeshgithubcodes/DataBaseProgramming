use Hello

create table Employ(
Id int primary key,
Name VArchar(max),
Salary int,
Gender varchar(12),
DepartmentId int
)

insert into Employ values
(1, 'Lokesh', 30000, 'Male', 01),
(2, 'Somesh', 30000, 'Male', 01),
(3, 'Will', 28000, 'Male', 02),
(4, 'Smithi', 20000, 'Female', 01),
(5, 'Lilly', 25000, 'Female', 01),
(6, 'Rock', 28000, 'Male', 02);

select *
from Employ

create Table Employ_Audit_Test(
Id int identity(1,1),
Audit_Action text
)

--Insert trigger

create trigger trInsertEmp
on Employ 
for insert 
as
begin 
declare @Id int
select @Id=Id 
from inserted
insert into Employ_Audit_Test
values('new employ with Id= '+CAST(@Id as varchar(10))+' is added at '+ cast(Getdate() as varchar(22)))
end

insert into Employ values
(7,'peter', 24000, 'Male', 02)

select *
from Employ_Audit_Test

select *
from Employ

--Trigger for delete

create trigger trDeleteEmp
on Employ
for delete
as 
begin
declare @Id int
select @Id=Id 
from deleted
insert into Employ_Audit_Test values
('an exisiting employ with Id= '+cast(@Id as varchar(20))+' is deleted at '+cast(getdate() as varchar(22)))
end


delete from Employ where Id=7

--Update Trigger

create trigger trUpdateEmp
on Employ
for update
as 
begin 
insert into Employ_Audit_Test(
 Audit_Action
 )
 select 
	'Updated' 
	from inserted
end

update Employ
set Name= 'Rocky' where Id=6;

---Instead of insert trigger

alter trigger trInsteadofInsert
on Employ
instead of insert
as
insert into Employ_Audit_Test(Audit_Action)
select 'Instead of insertion is done at Id= '+ cast(inserted.Id as varchar(max))
from inserted;

insert into Employ values
(8, 'Miller', 23000, 'Male', 02);

insert into Employ values
(9, 'Tiller', 22000, 'Male', 03);

--instead of deletion

alter trigger trInsteadofDelete
on Employ
instead of delete
as

insert into Employ_Audit_Test(Audit_Action)
select 'instead of deletion done at Id= '+ cast(deleted.Id as varchar(max))
from deleted;

delete from Employ where id = 3;

delete from Employ where id = 4;

--instead of updated

create trigger trInsteadofUpdate
on Employ
instead of update
as 
begin
insert into Employ_Audit_Test(Audit_Action)
select 'instead of updated at Id= '+cast(inserted.Id as varchar(max))
from inserted
end

update Employ 
set Name= 'LokeshR' where id =1;

select *
from Employ;

select *
from Employ_Audit_Test;

