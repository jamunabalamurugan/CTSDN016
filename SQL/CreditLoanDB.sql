--Consider the following relational schema for a CreditLoan database application:
--Customer_purchase_details (Custid, Custname, Address, phno)
--Product (pid,cusid,pname,price)
--Loan (Loanid, Cusid, Emi, no _of paid _instalment, Installment_period, total_amount)
--Credit_Account (Credit_id, credit_limit, Credit_bal, Custid)
--Create the tables with following constraint
--Set Custid,pid as primary key in Customer_purchase_details , Product and cusid as
--foreign key in Loan, Credit_Account
-- Set phoneno as unique.
-- Set credit_limit to not null
--1. Find the number of customer purchased the product which costs more than 75000. 
--2. Find the customer who have taken loan for any of these products
--(‘TV’,’Refrigerator’,’Washing Machine’) .
--3. Find all the customers who have yet to pay more than 3 installments .
--4. Find the Customer who have obtained maximum number of Loans.
--5. Find all the customers whose credit limit is greater than atmost one of the customer
--from ‘chennai’
--6. Display the customer who have purchased more than once using credit_loan.
--7. Find all the customers who purchased most expensive product..
--8. Find the customers who have not taken any loans
--9. Find the customers who are not eligible to obtain the loan
--10. Display the pending amount paid all the customers whose installment period is 18 months

CPD(id,cname,cadd,cphno)
Product(pid,cusid,pname,price)
Loan(lid,cusid,emi,paidIns,timeIns,totalAmt)
Credit(crid,crLimit,crBal,cid)

create table CPD(cid int primary key,
	     cname varchar(20),
	     cadd varchar(20),
	     cphno varchar(12) UNIQUE);

		 
insert cpd values(1,'Kavin','Chennai','1111111111')
insert cpd values(2,'Kanav','Chennai','1211111111')
insert cpd values(3,'Sumedha','Chennai','1311111111')
insert cpd values(4,'Saadhana','Chennai','1411111111')
insert cpd values(5,'Saahithya','Chennai','1511111111')
insert cpd values(6,'Joshitha','Chennai','1611111111')
insert cpd values(7,'Harshitha','Chennai','1711111111')

create table Product(pid int primary key,
	    cusid int ,
	    pname varchar(20),
            price int);
insert Product values(1,1,'TV',10000)
insert Product values(2,2,'Laptop',70000)
insert Product values(3,3,'Washing Machine',30000)
insert Product values(4,4,'Regrigerator',20000)
insert Product values(5,5,'AC',10000)
insert Product values(5,5,'AC',10000)
insert Product values(6,6,'Refrigerator',80000)

drop table Loan
create table Loan(lid int primary key,
		 cusid int foreign key References CPD(cid),
		 emi money,
		 paidIns int,
		  timeIns datetime,
		  totalAmt money);
update Loan set paidins=8 where lid=1
insert Loan values(1,1,3000,8,getdate(),30000)
insert Loan values(2,2,4000,0,getdate(),40000)
insert Loan values(3,3,5000,0,getdate(),50000)
insert Loan values(4,4,6000,0,getdate(),60000)
insert Loan values(5,5,7000,0,getdate(),70000)
insert Loan values(6,5,8000,0,getdate(),80000)

create table Credit( crid int,
		crLimit int NOT NULL,
		 crBal int,
		cid int foreign key References CPD(cid)); 

insert credit values(101,50000,50000,1)
insert credit values(102,60000,60000,2)
insert credit values(103,70000,70000,3)
insert credit values(104,80000,80000,4)
insert credit values(105,90000,90000,5)

--QUERIES:

--1.
select cpd.cname as "Customer Name"
	from CPD cpd
	where  cpd.cid in
					(
					 select cusid
					 from Product P
					 where P.price>75000
					);

--2.	
select cname from CPD C,Product P,Loan L 
	where C.cid=P.cusid AND L.cusid=P.cusid
			  AND P.pname in ('TV','Refrigerator','Washing machine');
	--(or)
	
	select cname from CPD C 
	join Product P 
	on C.cid=P.cusid 
	join Loan L 	
	on L.cusid=P.cusid
	where P.pname in ('TV','Refrigerator','Washing Machine');

--3.	
select * from CPD c,Loan L where c.cid=L.cusid 
	AND cusid in
		   (select cusid 
		   from Loan where ((totalAmt/emi) - paidIns)>3
		   );

--4.  Find the Customer who have obtained maximum number of Loans. 

--Ans=5	Saahithya	Chennai	1511111111

        select * from CPD where cid=
			     (
				 select cusid  from Loan 
				group by cusid 	
				having count(cusid) = (
				select top 1 count(cusid) from loan group by cusid order by 1 desc)
 			     )
		
--5. Find all the customers whose credit limit is greater than atmost one of the customer
--from ‘chennai’
5. 	select cname from CPD C join Credit Cr on C.cid=Cr.cid AND  


	#cred limit>cred limit(cust from chennai)
	select crid from Credit where 1>(select crlimit from Credit where custid =(select custid from CPD where cadd="chennai")