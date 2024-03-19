
-- for insert 
create proc productsetup_sp
@ProductID int,
@ItemName nvarchar(50),
@Specification nvarchar(150),
@Unit nvarchar(30),
@Status nvarchar(30),
@CreationDate datetime
as
begin
insert into ProductSetup_tab values 
(@ProductID, @ItemName, @Specification, @Unit, @Status, @CreationDate);
end


exec productsetup_sp 
1, 'Laptop', 'HP core i5', 'PCS', 'Running', '8/8/2022' 

--for read

create proc productlist_sp
as
begin
select *
from ProductSetup_tab
end

exec productlist_sp

--for update

create proc productUpdate_sp
@ProductID int,
@ItemName nvarchar(50),
@Specification nvarchar(150),
@Unit nvarchar(30),
@Status nvarchar(30),
@CreationDate datetime
as
begin
update ProductSetup_tab set ItemName=@ItemName, Specification=@Specification, Unit=@Unit, Status=@Status, CreationDate=@CreationDate
where ProductID=@ProductID
end

--for Delete

create proc productDelete_sp
@ProductID int
as
begin
delete  ProductSetup_tab
where ProductID=@ProductID
end

-- for search

create proc productSearch_sp
@ProductID int
as
begin
select * from  ProductSetup_tab
where ProductID=@ProductID
end

