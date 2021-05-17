----------Referential Integrity Constraint------
create table tbl_Book(Bid nvarchar(20) primary key,Bookname nvarchar(30))
create table tbl_customer(cid int primary key,cname nvarchar(20))


create table tbl_Reader(Bid nvarchar(20) references tbl_Book(Bid)
                        on delete cascade
					    on update cascade ,
						Cid int  references tbl_customer(cid))

insert into tbl_Book values ('B001','Java'),('B002','.Net'),('B003','C++')

insert into tbl_customer values(100,'Hari'),(101,'Nithya'),(102,'Suresh')

insert into tbl_Reader values('B001',100),('B001',102),('B002',101)
select * from tbl_customer
select * from tbl_Book

select * from tbl_Reader

delete from tbl_Book where Bid='B002'
delete from tbl_customer where cid=100

update tbl_Book set Bid='J001' where Bookname='Java'

update tbl_customer set cid=1000 where cid=100


update tbl_Book set Bookname='Network' where Bookname='Java'

--TCL ,Commit,ROllback,Save --check point

begin transaction
save tran S1
insert into tbl_Book values('B002','AI')
select * from tbl_Book
save tran S2
delete from tbl_Book where Bookname='C++'

rollback tran S1
end transaction


select * from tbl_Book

begin transaction
save tran S1
insert into tbl_Book values('B004','OOPS')
save tran S2
delete from tbl_Book where Bookname='C++'
select * from tbl_Book
rollback tran S2

select * from tbl_Book

begin transaction t1
insert into tbl_Book values('B006','DS')
select * from tbl_Book
commit tran t1
rollback tran


Transactions

BEGIN TRANSACTION TR
BEGIN TRY
UPDATE Person.Contact 
SET EmailAddress='jamunbalamurugan@yahoo.com' 
WHERE ContactID = 1070
UPDATE EmployeeAddress SET MobileNo= 
9444032689
WHERE EmployeeID = 1
COMMIT TRANSACTION TR
SELECT 'Transaction Executed'
END TRY
BEGIN CATCH
ROLLBACK TRANSACTION TR

SELECT 'Transaction Rollbacked'
END CATCH

set implicit_transactions on
select @@TRANCOUNT


-------Trigger---------
-- when an DML action is performed which in turn can lead
to calling a procedure automatically
--special sp that is executed whenever a data modification takes place

--differ from stored procedure...a sp can be explicitly by a users
--triggers cannot be manually executed by the user
--there is no chance for trigger to receive parameters
/*CREATE TRIGGER trigger_name   
ON { Table name or view name }   
[ WITH <Options> ]  
{ FOR | AFTER | INSTEAD OF }   
{ [INSERT], [UPDATE] , [DELETE] }
*/
--no one should insert record in tbl_Department
create trigger t_InsertDept
on tblDepartment
for Insert
as
begin

print 'Insert operation is not allowed!! '
End

-----------Ex1
alter TRIGGER tr_Insertdept 
ON tbldepartment
FOR INSERT
AS
BEGIN
  PRINT 'YOU CANNOT PERFORM INSERT OPERATION'
  Rollback transaction
  
END

--insert 
select * from tblDepartment
insert into tblDepartment values('CSE')

--drop trigger trigger_Name

---Insert Ex2
create table P_desc(Eid int,Description nvarchar(40)

select * from tblPerformance
select * from P_desc

create trigger t_insertinP_desc
on tbl_performance
for insert
as
begin
declare @t_id int,@t_rating float(2)
set @t_id=(select Eid from inserted)
set @t_rating=(select rating from inserted)
insert into P_desc values(@t_id,case
 when @t_rating=5 then 'Excellent'
 when  @t_rating<=4.9 and @t_rating>=4 then 'Good'
 else 'Poor'
 End)
 End
 select * from tblEmployeeInfo

 insert into tblPerformance values(1010,5)

  insert into tblPerformance values(1011,3)
 drop trigger trInsertPerformance

 ------Delete
 create trigger t_deleteperformance
 on tblPerformance
 for delete
 as
 begin
 declare @t_id int
 set @t_id=(select Eid from deleted)
 if(@t_id=Null)
 begin
 raiserror('Input cant be null',1,8)
 end
 else
 begin
 delete from P_desc where Eid=@t_id
 print 'Record Deleted'
 End
 End

 select * from tblPerformance
 select * from P_desc

 delete from tblPerformance where eid=1011
 -----
  alter trigger t_deleteperformance
 on tblPerformance
 for delete
 as
 begin
 declare @t_id int
 set @t_id=(select Eid from deleted)
 
 begin try
  delete from P_desc where Eid=@t_id
 print 'Record Deleted'
 end try
 begin catch
 raiserror('Please check the given Input',1,7)
 end catch
 End

 ----Update trigger
 create table tbl_LeaveStatus(Eid int references tblEmployeeInfo(Emp_id),Status nvarchar(30),
 ApprovedDate datetime)

 create trigger t_Leave
 on tbl_LeaveStatus
 for update
 as
 begin
 update tbl_LeaveStatus set ApprovedDate=GETDATE()
  where Status='Approved'
 end

 insert into tbl_LeaveStatus(Eid,Status) values(1002,'Pending')
 insert into tbl_LeaveStatus(Eid,Status) values(1004,'Pending')

 select *  from tbl_LeaveStatus
 update tbl_LeaveStatus set Status='Approved' where Eid=1002 


 --Disabling constraint
 --Enabling or disabling constraints work only to check and foreign key constraints
 sp_help tblEmployeeInfo
 --disabling one constraint
 alter table tblEmployeeInfo nocheck constraint CK__tbl_Employe__Age__398D8EEE
 select * from tblEmployeeInfo
 insert into tblEmployeeInfo values(1015,'Hari',16,'jammu','Male','8901234567',22200,'2019-11-11',15,1006)
 --Disabling both check and foreign key
 alter table tblEmployeeInfo nocheck constraint  all
 --To enable all constraint

 alter table tblEmployeeInfo check  constraint all
 insert into tblEmployeeInfo values(1016,'Sam',16,'jammu','Male','8901234567',22200,'2019-11-11',15,1006

 -----------


