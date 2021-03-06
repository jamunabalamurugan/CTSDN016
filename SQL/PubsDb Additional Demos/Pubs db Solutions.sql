use pubs

--All Rowa--
select * from authors

--Particular column--
select au_fname Author_First_Name,au_lname Author_Lastname from authors
select au_fname as 'Author First Name',au_lname as 'Author Lastname' from authors

--Where Clause--
select * from authors where state = 'CA' and au_lname ='white'

select au_fname First_Name, au_lname LastName from authors where state not in('CA','UT','MI')

select au_fname First_Name, au_lname LastName from authors where state !='CA'

select * from titles

select * from titles where price >10 and price <20
order by price

select * from titles where price between 10 and 20
order by price

select distinct pub_id from titles 

select count(*) from titles

select avg(ytd_sales) from titles

select max(pubdate) from titles

select count(title) from titles where advance >6000

select sum(price) from titles where pub_id = 1389

select count(title) from titles where pub_id = 1389
 
select pub_id, count(title) no_of_titles from titles group by pub_id

select * from authors

select state, count(au_fname) from authors group by state

select pub_id,max(price) Max_Price from titles group by pub_id

select pub_id, count(title) no_of_titles from titles where advance>6000 group by pub_id

select type,title, count(title) as Book from titles where royalty>15 group by type, title

select count(title) from titles where royalty IS null  

select state,count(au_id) from authors group by state having count(au_id) >1 

select pub_id,avg(price) from titles group by pub_id having avg(price)>10

select pub_id,min(price) from titles where price > 5 group by pub_id having avg(price)>10

select pub_id,type,count(type) No_of_copies from titles where price > 5 group by pub_id,type having count(title)>2 order by pub_id

select * from authors order by au_fname desc

select * from sales
select title from titles where title_id = (select title_id from titleauthor where au_id= (select au_id from authors where au_lname = 'Carson'))

select ord_num from sales where title_id = (select title_id from titleauthor where au_id= (select au_id from authors where au_lname = 'Carson'))

select * from publishers

select au_fname, au_lname from authors where au_id = (select au_id from titleauthor where title_id = (select title_id from titles where title='You can Combat Computer Stress!' ))

select title, price, advance from titles where pub_id=(select pub_id from publishers where pub_name = 'Binnet & Hardley')

select CONCAT (au_fname,' ', au_lname) Author_Name from authors where au_id IN (select au_id from titleauthor where title_id IN (select title_id from titles where pub_id=(select pub_id from publishers where pub_name = 'Binnet & Hardley')))

select CONCAT (au_fname,' ', au_lname) Author_Name from authors

select * from authors where au_fname like 'An%'

select pub_name, title from publishers join titles on publishers.pub_id=titles.pub_id

select stor_name, ord_num, sales.stor_id from stores join sales on stores.stor_id = sales.stor_id

select pub_name,fname,lname,employee.pub_id from employee join publishers on employee.pub_id=publishers.pub_id

select title, au_fname,au_lname from authors join titleauthor on authors.au_id=titleauthor.au_id join titles on titleauthor.title_id=titles.title_id 

select fname,lname, pub_name,title, au_fname,au_lname from authors join titleauthor on authors.au_id=titleauthor.au_id join titles on titleauthor.title_id=titles.title_id join publishers on publishers.pub_id=titles.pub_id join employee on employee.pub_id=publishers.pub_id

---------------------------------------------------------------

--1) Print the Order number, title id and quantity for every order--
select ord_num,title_id,qty from sales  

--2) Print the number of orders on Payment terms "Net 30"--
select count(ord_num) from sales 
where payterms = 'Net 30'

--3) Print the total quantity of order for the title PS2091--
select sum(qty) from sales 
where title_id = 'PS2091'

--4) Print the average quantity for every store--
select stor_id,avg(qty) Average_Qty from sales 
group by stor_id

--5) Print the title id and the total quantity of every title which has more than 2 orders--
select title_id,sum(qty) from sales
 group by title_id having count(ord_Num) >2

--6) Print the title of the highest ordered title--
select title from titles 
where title_id =  
(select title_id from sales where qty =
 (select max(qty) from sales))

--7) Print the order numebr and date of all orders sorted by stor_is in desc order--
select ord_num, ord_date from sales 
order by stor_id desc

--8) Print the numebr of titles for every order with the sum of quantity in ascending order of ord_num--
select ord_num, count(title_id) Num_of_title, sum(qty) Total_qty from sales group by ord_num order by ord_num

--9) Select the author name who have published
-- for the publication 'Binnet & Hardley'--
select pub_name, au_fname,au_lname from titles 
join publishers on titles.pub_id=publishers.pub_id
 join titleauthor on titleauthor.title_id=titles.title_id 
 join authors on authors.au_id = titleauthor.au_id 
 where pub_name = 'Binnet & Hardley'

--10) print the full name  of employees--
select CONCAT(fname,' ',lname) E_NAME from employee

--11) print the 5 highest priced book title--
select top 5 price from titles order by price desc 

--12) print the titles of books which are price min of 5 to max of 20--
select title,price from titles where price >=5 
and price<=20

--13) print the publishers details if the publisher name contains 's'--
select * from publishers join pub_info 
on publishers.pub_id=pub_info.pub_id
 where pub_name like '%s%'

--14) select the authors name and sort them in the asending order of last name--
select au_fname,au_lname from authors
 order by au_lname 

--15) select employee first name ,last name hire date,
 joi_id and job description--
select fname,lname,hire_date,jobs.job_id,job_desc
 from employee join jobs
  on employee.job_id=jobs.job_id

--16) Select the title,royalty and author's phone number--
select title,royalty,phone from titles
 join titleauthor 
 on titles.title_id=titleauthor.title_id 
 join authors 
 on authors.au_id=titleauthor.au_id

--17) select the stor_name,ord_num,ord_Date,qty,
--title,author fullname,publisher's name--
select stor_name,ord_num,ord_date,qty,title,
CONCAT(au_fname,' ',au_lname) Author_name,pub_name 
from stores 
join sales on stores.stor_id=sales.stor_id 
join titles on sales.title_id=titles.title_id 
join titleauthor on titleauthor.title_id=titles.title_id 
join authors on titleauthor.au_id=authors.au_id
 join publishers on publishers.pub_id=titles.pub_id
