alter function GetEmployee(@id int)
returns table
as
 return (select e1.Employeeid,e1.FirstName,e1.lastname,e1.title,count(e2.reportsto) CountOfTeamMembers from employees e1 join employees e2 on e1.employeeid=e2.ReportsTo where e2.reportsto=@id group by e1.employeeid,e1.FirstName,e1.lastname,e1.title)

 select * from GetEmployee(2)

-- select e1.employeeid,firstname,lastname,title,e2.CountOfTeamMembers from employees e1 join dbo.GetEmployee(2) e2
 --on e1.EmployeeID=e2.Employeeid

select e1.Employeeid,count(e2.reportsto) CountOfTeamMembers from employees e1 join employees e2 on e1.employeeid=e2.ReportsTo where e2.reportsto=2 group by e1.employeeid
 

 --1. Davolio 0
 --2. Fuller  5
 --3. Leverling  0
 --5. Buchanan 3
select employeeid,lastname,ReportsTo from employees
 select * from dbo.GetEmployee(5)



 
 --Scalar functions
 alter function GetEmployeeName(@id int)
 returns varchar(50)
 as 
 begin
declare @name varchar(50)
select @name=firstname from employees where Employeeid=@id
return @name
end

select dbo.GetEmployeeName(1)

select * from employees where firstname = dbo.GetEmployeeName(2)

--Display Employee Lastname with Reporting Manager
select concat(a.lastname," works for ",b.lastname) as Hierarchyfrom (select e.lastname,e.empno,e.job,d.mgrno from employee e join department d one.workdept=d.deptno) as ajoin (select e.lastname,e.empno,e.job,d.mgrno from employee e join department d one.workdept=d.deptno) as b on a.mgrno=b.empno where a.mgrno!=a.empnoorder by a.lastnamego--Display pairs of employees who have same job titleselect e1.employeeid,left(e1.lastname,10) as name,left(e1.title ,10) as title,e2.employeeid,left(e2.lastname,10) as name,left(e2.title ,10) as titlefrom employees e1 join employees e2on e1.Title=e2.Titlewhere e1.EmployeeID<e2.EmployeeID--Union operatorselect name=(firstname+ ' '+lastname),city,postalcode from employeesunionselect companyname,city,postalcode from customers--We can use "select into " statement to populate new table with imported data--select productname,unitprice,(unitprice*1.1) as Taxinto #pricetablefrom products--doctor,patient,case table--Doctor has doctorid(PK),fname,lname,speciality,phone--Patient has patid(PK),fname,lname,insurancecompany,phone--Case Tble has admissiondate(composite PK),patid(composite Pk) and FK,doctorid FK ,diagnosis--1.How can you generate a list of  patient names and their hospital admission dates?--2. How can you generate a list of patient names for a particular doctor?--3. How can you produce a alist of pairs of doctors who have the same specialaity--4. How can you produce a single list of names and phone numbers for both doctors and patients--5. How with a single query can you produce a list of all cases that were admitted on the first chronological date in the database--6.total number of hospital admissions listed by patient nameselect * from #pricetable--Display all customers with order datesselect companyname,customers.customerid,orderdate from customersjoin orderson customers.CustomerID=orders.CustomerIDselect companyname,customers.customerid,orderdate from customersleft outer join orderson customers.CustomerID=orders.CustomerID--Display names of products and companies that supply the products--Products without suppliers and supplieres without current products are not included in the resultselect productname,companyname from products inner join  supplierson products.SupplierID=Suppliers.SupplierID--include Products without suppliersselect productname,companyname from products left outer join  supplierson products.SupplierID=Suppliers.SupplierID--include suppliers without current products  in the resultselect productname,companyname from products right outer join  supplierson products.SupplierID=Suppliers.SupplierIDinsert suppliers(companyname) values('CTS')--Multiple Joins--Display a list of products that are ordered each dayselect orderdate ,productname from orders o join [order details] odon o.orderid=od.OrderIDjoin products pon od.ProductID=p.ProductIDwhere orderdate='7/8/1996'--Display all customers who placed orders recentlyselect orderid,customerid from orderswhere orderdate=(select max(orderdate) from orders)select productid,quantity as numbers-sold,(select sum(quantity) from [order details]) as total_sold,((convert(money,quantity)/(select sum(quantity) from [order details]))*100) as percentageofsalesfrom [order details]--Subquery returning a List of Valuesselect customerid,companyname from customerswhere customerid in (select customerid from orders where orderdate>'1/1/1995')--Correlated Subquery--Display a list of customers who ordered more than 20 pieces of product number 23select customerid,orderidfrom orders owhere 20<(select quantity from [order details] odwhere o.orderid=od.orderid and od.ProductID=23)--Display a lsit of products and the largest order ever placed for eacah productselect distinct productid,quantity from [order details] od1where quantity=(select max(quantity) from [Order Details] od2where od1.ProductID=od2.ProductID)--Display a list of employees who took orders on 9/5/97select lastname,employeeid from employees ewhere exists(select * from orders where e.employeeid=orders.EmployeeIDand orderdate='9/5/97')--We can use join instead of sub queryselect distinct lastname,e.employeeidfrom orders inner join employees eon orders.EmployeeID=e.EmployeeIDwhere orderdate='9/5/97'