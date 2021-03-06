USE [master]
GO
/****** Object:  Database [bankdatabase]    Script Date: 1/17/2020 5:19:41 PM ******/
CREATE DATABASE [bankdatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bankdatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\bankdatabase.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'bankdatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\bankdatabase_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [bankdatabase] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bankdatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bankdatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bankdatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bankdatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bankdatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bankdatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [bankdatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bankdatabase] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [bankdatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bankdatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bankdatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bankdatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bankdatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bankdatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bankdatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bankdatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bankdatabase] SET  ENABLE_BROKER 
GO
ALTER DATABASE [bankdatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bankdatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bankdatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bankdatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bankdatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bankdatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bankdatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bankdatabase] SET RECOVERY FULL 
GO
ALTER DATABASE [bankdatabase] SET  MULTI_USER 
GO
ALTER DATABASE [bankdatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bankdatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bankdatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bankdatabase] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'bankdatabase', N'ON'
GO
USE [bankdatabase]
GO
/****** Object:  StoredProcedure [dbo].[AccountDetails]    Script Date: 1/17/2020 5:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AccountDetails](@cusid int)
as 
begin
select account_number,account_type,balance,
account_status,customer_id,ifsc
from account_details
where customer_id = @cusid
end

GO
/****** Object:  StoredProcedure [dbo].[AccountID]    Script Date: 1/17/2020 5:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AccountID](@cusid int)
as 
begin
select account_number
from account_details
where customer_id=@cusid
end
GO
/****** Object:  StoredProcedure [dbo].[ActivateAccount]    Script Date: 1/17/2020 5:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ActivateAccount](@customer_id int,@account_status varchar(20))
as
begin
update account_details set account_status=@account_status where 
customer_id in (select customer_id from customer_info where customer_id=@customer_id)
 end
GO
/****** Object:  StoredProcedure [dbo].[AdminLoginValidation]    Script Date: 1/17/2020 5:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AdminLoginValidation](@adid int , @adpass int)
as
begin
select admin_id,admin_password 
from admin_info
where admin_id= @adid and admin_password = @adpass
end
GO
/****** Object:  StoredProcedure [dbo].[AvailableBank]    Script Date: 1/17/2020 5:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[AvailableBank]
as
begin
select *
from branch_info 
end
GO
/****** Object:  StoredProcedure [dbo].[ChangePassword]    Script Date: 1/17/2020 5:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ChangePassword](@customer_id int , @newpass varchar(15))
as
begin
update customer_info 
set customer_password = @newpass
where customer_id =@customer_id
end
GO
/****** Object:  StoredProcedure [dbo].[CustomerDetails]    Script Date: 1/17/2020 5:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CustomerDetails](@cus_id int)
as
begin
Select customer_id,Customer_name,gender,dateofbirth,
customer_address,pan_number,phone_number,ifsc 
from customer_info
where customer_id=@cus_id
end
GO
/****** Object:  StoredProcedure [dbo].[DeactivateAccount]    Script Date: 1/17/2020 5:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DeactivateAccount](@customer_id int,@account_status varchar(20))
as
begin
update account_details set account_status=@account_status where 
customer_id in (select customer_id from customer_info where customer_id=@customer_id)
 end
GO
/****** Object:  StoredProcedure [dbo].[Display_account_info]    Script Date: 1/17/2020 5:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Display_account_info]
as
begin
select c.customer_name,a.account_number,a.account_type,a.balance,a.account_status
from customer_info as c join account_details as a on c.customer_id=a.customer_id
end
GO
/****** Object:  StoredProcedure [dbo].[Display_customer_details]    Script Date: 1/17/2020 5:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure  [dbo].[Display_customer_details] 
as
begin
select customer_id,customer_name,gender,dateofbirth,customer_address,phone_number,ifsc
from customer_info
end
GO
/****** Object:  StoredProcedure [dbo].[Display_transanctions]    Script Date: 1/17/2020 5:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[Display_transanctions]
as
begin
select transaction_id,account_number,transaction_type,amount,transaction_date from 
transactions
end
GO
/****** Object:  StoredProcedure [dbo].[GetAccountDetails]    Script Date: 1/17/2020 5:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetAccountDetails](@cusid int)
as
begin
select account_status 
from account_details
where customer_id =@cusid
end
GO
/****** Object:  StoredProcedure [dbo].[GetBalance]    Script Date: 1/17/2020 5:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetBalance](@cusid int)
as 
begin
select balance
from account_details
where customer_id =@cusid
end

GO
/****** Object:  StoredProcedure [dbo].[GetPassword]    Script Date: 1/17/2020 5:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetPassword](@cusid int)
as 
begin
select customer_password 
from customer_info
where customer_id = @cusid
end
GO
/****** Object:  StoredProcedure [dbo].[Insert_account_details]    Script Date: 1/17/2020 5:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Insert_account_details](@accountType varchar(7),
@balance decimal(10,2),@account_status varchar(8),@customer_id int,@ifsc varchar(8))
as 
begin
insert account_details(account_type,balance,account_status,customer_id,ifsc)
values(@accountType,@balance,@account_status,@customer_id,@ifsc)
end
GO
/****** Object:  StoredProcedure [dbo].[LoginValidation]    Script Date: 1/17/2020 5:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[LoginValidation](@cusid int, @pass varchar(15))
as
begin
select count(*) as yes
from customer_info
where customer_id=@cusid and customer_password=@pass
end 
GO
/****** Object:  StoredProcedure [dbo].[Modify_customeraddress]    Script Date: 1/17/2020 5:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Modify_customeraddress](@customer_id int,@customer_address varchar(50))
as
begin
update customer_info set customer_address=@customer_address where 
customer_id=@customer_id
end

GO
/****** Object:  StoredProcedure [dbo].[Modify_dateofbirth]    Script Date: 1/17/2020 5:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Modify_dateofbirth](@customer_id int,@dateofbirth date)
as
begin
update customer_info set dateofbirth=@dateofbirth where 
customer_id=@customer_id
end
GO
/****** Object:  StoredProcedure [dbo].[Modify_name]    Script Date: 1/17/2020 5:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Modify_name](@customer_id int,@customername varchar(50))
as
begin
update customer_info set customer_name=@customername where 
customer_id=@customer_id
end
GO
/****** Object:  StoredProcedure [dbo].[Modify_phone_number]    Script Date: 1/17/2020 5:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Modify_phone_number](@customer_id int,@phone_number varchar(10))
as
begin
update customer_info set phone_number=@phone_number where 
customer_id=@customer_id
end
GO
/****** Object:  StoredProcedure [dbo].[NewAccount]    Script Date: 1/17/2020 5:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[NewAccount](@acctype varchar(7),@cusid int,@ifsc varchar(8))
as 
begin
insert into account_details(account_type,customer_id,ifsc)
values(@acctype,@cusid,@ifsc)
end
GO
/****** Object:  StoredProcedure [dbo].[NewCustomer]    Script Date: 1/17/2020 5:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[NewCustomer](@cusname varchar(25),@cuspin varchar(15),@gen varchar(6),@dob date,
@cusadd varchar(20),@pan varchar(10),@phno varchar(10),@ifsc varchar(8))
as
begin
insert into customer_info(customer_name,customer_password,
gender,dateofbirth,customer_address,pan_number,phone_number,ifsc) 
values(@cusname,@cuspin,@gen,@dob,
@cusadd,@pan,@phno,@ifsc)
end
GO
/****** Object:  StoredProcedure [dbo].[NewCustomerID]    Script Date: 1/17/2020 5:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[NewCustomerID]
as
begin
SELECT top 1 customer_id ,ifsc  
FROM customer_info 
ORDER BY customer_id DESC 
end
GO
/****** Object:  StoredProcedure [dbo].[NON_active]    Script Date: 1/17/2020 5:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[NON_active]
as 
begin
select account_number,customer_id from account_details  
where account_number not in (select account_number from transactions)
end
GO
/****** Object:  StoredProcedure [dbo].[OldPass]    Script Date: 1/17/2020 5:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[OldPass](@cusid int)
as
begin
select customer_password
from customer_info
where customer_id = @cusid
end
GO
/****** Object:  StoredProcedure [dbo].[Remove_account]    Script Date: 1/17/2020 5:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Remove_account](@accountId int)
as
begin
delete from account_details 
where account_number=@accountId
end
GO
/****** Object:  StoredProcedure [dbo].[RetAccNo]    Script Date: 1/17/2020 5:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[RetAccNo](@cusid int)
as
begin
select account_number
from account_details
where customer_id = @cusid
end

GO
/****** Object:  StoredProcedure [dbo].[Single_customer_info]    Script Date: 1/17/2020 5:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Single_customer_info](@customerId int)
as
begin
select customer_id,customer_name,gender,dateofbirth,customer_address,phone_number,ifsc from 
customer_info where customer_id=@customerId
end
GO
/****** Object:  StoredProcedure [dbo].[TransactionDetails]    Script Date: 1/17/2020 5:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[TransactionDetails](@cusid int)
as
begin
select t.transaction_id,ad.account_number,t.transaction_type,t.amount,t.recipient_acc,t.transaction_date
from transactions t, account_details ad
where ad.customer_id = @cusid and
ad.account_number = t.account_number
end
GO
/****** Object:  StoredProcedure [dbo].[TransactionUpdate]    Script Date: 1/17/2020 5:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TransactionUpdate](@acc_no int)
as 
begin
select account_number,balance,account_status
from account_details 
where account_number = @acc_no
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateAccount]    Script Date: 1/17/2020 5:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[UpdateAccount](@acc_no int,@debitbal decimal,@to_acc_no int)
as
begin
select account_number,account_status
from account_details 
where account_number = @to_acc_no

update account_details
set balance = balance - @debitbal
where account_number = @acc_no

update account_details 
set balance = balance + @debitbal
where account_number = @to_acc_no
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateTransactionDetails]    Script Date: 1/17/2020 5:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateTransactionDetails](@acc_no int,@to_acc_no int,@debitbal decimal,@trans_date datetime)
as 
begin
Declare @acc_num int = @acc_no 

select account_number,ifsc
from account_details
--where account_number = @acc_no

if(@acc_num = @acc_no)
insert into transactions(account_number,transaction_type,amount,recipient_acc,transaction_date) 
values(@acc_no,'debit',@debitbal,@to_acc_no,@trans_date)
 
insert into transactions(account_number,transaction_type,amount,recipient_acc,transaction_date)
values(@to_acc_no,'credit',@debitbal,@to_acc_no,@trans_date)
end
GO
/****** Object:  StoredProcedure [dbo].[ValidationLogin]    Script Date: 1/17/2020 5:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[ValidationLogin](@cusid int,@cus_pass varchar(15))
as
begin
select customer_id,customer_password,customer_name
from customer_info
where (customer_id=@cusid and customer_password=@cus_pass)
end
GO
/****** Object:  Table [dbo].[account_details]    Script Date: 1/17/2020 5:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[account_details](
	[account_number] [int] IDENTITY(66666666,1) NOT NULL,
	[account_type] [varchar](7) NOT NULL,
	[balance] [decimal](10, 2) NOT NULL,
	[account_status] [varchar](8) NOT NULL,
	[customer_id] [int] NOT NULL,
	[ifsc] [varchar](8) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[account_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[admin_info]    Script Date: 1/17/2020 5:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[admin_info](
	[admin_id] [int] NOT NULL,
	[admin_name] [varchar](20) NOT NULL,
	[admin_password] [int] NOT NULL,
	[ifsc] [varchar](8) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[branch_info]    Script Date: 1/17/2020 5:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[branch_info](
	[ifsc] [varchar](8) NOT NULL,
	[branch_name] [varchar](25) NOT NULL,
	[branch_address] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ifsc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customer_info]    Script Date: 1/17/2020 5:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customer_info](
	[customer_id] [int] IDENTITY(11111,1) NOT NULL,
	[customer_name] [varchar](25) NOT NULL,
	[customer_password] [varchar](15) NOT NULL,
	[gender] [varchar](6) NOT NULL,
	[dateofbirth] [date] NOT NULL,
	[customer_address] [varchar](20) NOT NULL,
	[pan_number] [varchar](10) NOT NULL,
	[phone_number] [varchar](10) NOT NULL,
	[ifsc] [varchar](8) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[transactions]    Script Date: 1/17/2020 5:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[transactions](
	[transaction_id] [int] IDENTITY(1,1) NOT NULL,
	[account_number] [int] NOT NULL,
	[transaction_type] [varchar](10) NOT NULL,
	[amount] [decimal](18, 0) NOT NULL,
	[recipient_acc] [int] NULL,
	[transaction_date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[transaction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[account_details] ADD  DEFAULT ((0)) FOR [balance]
GO
ALTER TABLE [dbo].[account_details] ADD  DEFAULT ('active') FOR [account_status]
GO
ALTER TABLE [dbo].[account_details]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer_info] ([customer_id])
GO
ALTER TABLE [dbo].[account_details]  WITH CHECK ADD FOREIGN KEY([ifsc])
REFERENCES [dbo].[branch_info] ([ifsc])
GO
ALTER TABLE [dbo].[admin_info]  WITH CHECK ADD FOREIGN KEY([ifsc])
REFERENCES [dbo].[branch_info] ([ifsc])
GO
ALTER TABLE [dbo].[customer_info]  WITH CHECK ADD FOREIGN KEY([ifsc])
REFERENCES [dbo].[branch_info] ([ifsc])
GO
ALTER TABLE [dbo].[transactions]  WITH CHECK ADD FOREIGN KEY([account_number])
REFERENCES [dbo].[account_details] ([account_number])
GO
USE [master]
GO
ALTER DATABASE [bankdatabase] SET  READ_WRITE 
GO
