create database CTSHR
go

use CTSHR
go

Create table tblEmployee(
EmployeeId int not null ,
Name nvarchar(20) not null,
Location nvarchar(30)
)
go
--Orders
--OrderNo,ProductId,Qty,ProductCost,Tax,OrderCost


create table Orders(
OrderNo int ,
ProductId int,
Qty int,
ProductCost money,
Tax float,
OrderCost money,
primary key(orderno,productid)--Composite primary key
)
insert orders (orderno,productid,qty,productcost)
values(1001,3,10,35)
insert orders (orderno,productid,qty,productcost)
values(1001,4,10,35)
insert orders (orderno,productid,qty,productcost)
values(1002,4,10,35)
insert orders (orderno,productid,qty,productcost)
values(1002,3,10,35)
insert orders (orderno,productid,qty,productcost,employeeid)
values(1003,3,10,35,1001)
insert orders (orderno,productid,qty,productcost,employeeid)
values(1003,49,10,35,1002)

insert orders(orderno,qty,productid)
values(1004,4,10)

alter table orders
add employeeid int foreign key
references tblemployeeinfo(id)

select * from orders
select * from tblemployeeinfo

create table departments(department_id integer primary key,
		   depname varchar(40) not null,
		   mgrid char(10),
		   location_id integer)

		   insert departments(department_id,depname)
		   values(1,'ADMIN')

		   sp_help departments
		   sp_help employees

		   alter table departments drop constraint PK__departme__C22324225BBC7EC0

		   alter table departments 
		   add constraint department_pk primary key(department_id)

CREATE TABLE employees
    ( employee_id    integer constraint myemployees_pk PRIMARY KEY
    , first_name     VARCHAR(20)
    , last_name      VARCHAR(25) NOT NULL
    , email          VARCHAR(25) NOT NULL UNIQUE
    , phone_number   VARCHAR(20)
    , hire_date      DATETIME NOT NULL check(hire_date<getdate())
    , job_id         VARCHAR(10) NOT NULL
    , salary         integer CHECK (salary>0)
    , commission_pct integer
    , manager_id     integer constraint mgrid_fk REFERENCES	 employees (employee_id)
    , department_id  integer constraint departmentid_fk REFERENCES  departments (department_id));


SELECT  5 + 10.5 
SELECT -12 + 8 
SELECT unitsinstock * unitprice as total_COST FROM Products;
SELECT bill_amt / 10 FROM orders;
SELECT getdate() + 7 
