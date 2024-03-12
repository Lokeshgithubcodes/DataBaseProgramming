
use MyDB

select *
from STUDENTS;

CREATE VIEW vwstudent 
AS 
select *
from STUDENTS;

select *
from vwstudent;

alter view vwstudent
as 
select NAME, AGE
from STUDENTS

select *
from vwstudent

select *
from STUDENTS;

select *
from STUDENTS_HOBBY;

--Create common view for two tables

create view vwstudentAndHobby
as 
select s.NAME, st.HOBBY
from STUDENTS s join STUDENTS_HOBBY st
on s.ID=st.ID;

select *
from vwstudentAndHobby;

alter table STUDENTS
ADD GRADE VARCHAR(10);

exec sp_refreshview vwstudent