
--Joining tables which are not related
select customerid,employeeid,c.city,e.city,c.region,e.region 
from customers c join employees e
on e.country=c.country

--Find the details Employee of the Highest experience
select Lastname from employees
where hiredate=
--'04/01/1992'
(
select min(hiredate) from employees
)

--Find the customers who has maximum orders

select count(customerid),customerid
from orders
group by customerid order by 1 desc

--Find the customers who has maximum orders
select * from customers 
where customerid in(
--'SAVEA','ERNSH','QUICK')
select top 3 customerid from orders 
group by customerid 
order by count(orderid) desc)

select CustomerId from Orders
group by CustomerID
having (count(orderid) =
(select max(countId) from 
(select count(o2.customerid) as [countId] 
from Orders o2 group by o2.CustomerID) t))


select CustomerId from Orders
group by CustomerID
having (count(orderid) =
(select max(countId) from 
(select count(customerid) as [countId] 
from Orders group by CustomerID) mycust))

select * from employees
select * from customers
insert customers
select substring(firstname,1,3)+substring(lastname,1,3) USERNAME,
lastname,firstname,title,address,city,region,postalcode,country,
homephone from employees

select * from products
--Increase the unitprice of all products which is supplied by USA
update products
set unitprice=unitprice+2
where supplierid not in(select supplierid from suppliers
where country='USA' )

--SUB QUERY can be defined as a group of nested select statements 
--inside a select,insert,update or delete statements

select productname from products
where exists(select * from suppliers where country='USA')

--Nested Subqueries

select productname from products where categoryid in(
select categoryid from categories where categoryname='Beverages')

select productname from products where supplierid in (
select supplierid from suppliers where city='London')

select productname from products where productid in (
select productid from orders where customerid  in(
select customerid from customers where city='Bangalore'))

select * from customers
select * from suppliers

insert customers values('KAVIN','Schneider','Kavin Kumar','VP','Indhra Nagar','Bangalore',null,null,null,null,null)
alter table products add totalsales int default 0

alter table products add constraint dfTotalsales 
default 0 for totalsales

select * from products

update products
set totalsales=0
where totalsales is null

--Correlated Subqueries
--This example updates total sales for all orders of each product
update products
set totalsales=(
select sum(quantity) from [order details] od
where products.productid=od.ProductID)

--Total sales of each product
select productname, totalsales=(select sum(quantity) from [order details] od
where products.productid=od.ProductID)
from products

--Exists example
select * from products
where exists(select * from suppliers
where country='USA')

--Delete example using Joins
delete from [order details]
from orders o join [order details] od
on o.orderid=od.OrderID
where o.orderdate='4/15/1998'

--Delete with Subquery Example
delete from [order details]
where orderid in(
select orderid from orders
where orderdate='4/14/1998')
