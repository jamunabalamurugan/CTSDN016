USE [master]
GO
/****** Object:  Database [banking]    Script Date: 2/19/2020 11:13:32 AM ******/
CREATE DATABASE [banking]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'banking', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\banking.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'banking_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\banking_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [banking] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [banking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [banking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [banking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [banking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [banking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [banking] SET ARITHABORT OFF 
GO
ALTER DATABASE [banking] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [banking] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [banking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [banking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [banking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [banking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [banking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [banking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [banking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [banking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [banking] SET  ENABLE_BROKER 
GO
ALTER DATABASE [banking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [banking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [banking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [banking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [banking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [banking] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [banking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [banking] SET RECOVERY FULL 
GO
ALTER DATABASE [banking] SET  MULTI_USER 
GO
ALTER DATABASE [banking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [banking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [banking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [banking] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'banking', N'ON'
GO
USE [banking]
GO
/****** Object:  StoredProcedure [dbo].[Account_Details]    Script Date: 2/19/2020 11:13:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Account_Details](@id int)
As
select fname+' '+lname as Name, phone,email,dob,Aadhar_no,res_add,cur_add from Customer_info
where cus_id=@id;
GO
/****** Object:  StoredProcedure [dbo].[Account_Statement]    Script Date: 2/19/2020 11:13:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Account_Statement] @ac_no int,@from_date datetime,@to_date datetime 
as 
select tran_id as TransactionId, t_date as DateOfTransaction,
tran_type as TransactionType ,case when from_acc=@ac_no then 'Debit/Sent'
when to_acc=@ac_no then 'Credit/Get' end as Action, amt as Amount,  case when from_acc=@ac_no then concat('to',to_acc)
when to_acc=@ac_no then concat('from',from_acc) end as AccountNumber
 from transactions where t_date BETWEEN @from_date and @to_date and 
(from_acc=@ac_no or to_acc=@ac_no)
GO
/****** Object:  StoredProcedure [dbo].[AccountDetails]    Script Date: 2/19/2020 11:13:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[AccountDetails]
AS
BEGIN
     /*selecting all records from the table whose name is "Employee"*/
    Select * From Customer_info
END
GO
/****** Object:  Table [dbo].[Account_Info]    Script Date: 2/19/2020 11:13:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account_Info](
	[AccountNo] [int] IDENTITY(33333331,1) NOT NULL,
	[AccountType] [varchar](10) NULL,
	[Balance] [money] NOT NULL,
	[open_date] [date] NOT NULL,
	[Ifsc] [varchar](10) NULL,
	[cus_id] [int] NULL,
	[statusType] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[accounts]    Script Date: 2/19/2020 11:13:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[accounts](
	[accountId] [varchar](10) NOT NULL,
	[AccountType] [varchar](20) NOT NULL,
	[Min_balance] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[accountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2/19/2020 11:13:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[admin_id] [int] IDENTITY(222222,1) NOT NULL,
	[f_name] [varchar](50) NOT NULL,
	[l_name] [varchar](50) NULL,
	[phone_no] [varchar](20) NULL,
	[email] [varchar](50) NULL,
	[Ifsc] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[admin_login]    Script Date: 2/19/2020 11:13:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[admin_login](
	[user_name] [varchar](50) NOT NULL,
	[password] [varchar](50) NULL,
	[admin_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Benificiary]    Script Date: 2/19/2020 11:13:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Benificiary](
	[slno] [int] IDENTITY(100,1) NOT NULL,
	[cus_id] [int] NULL,
	[Benificiary_acc] [int] NULL,
	[Benificiary_ifsc] [varchar](10) NULL,
	[nick_name] [varchar](50) NOT NULL,
	[name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[slno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Branch_details]    Script Date: 2/19/2020 11:13:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Branch_details](
	[IFSC] [varchar](10) NOT NULL,
	[Branch_name] [varchar](20) NOT NULL,
	[City] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IFSC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer_info]    Script Date: 2/19/2020 11:13:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer_info](
	[Cus_id] [int] IDENTITY(10000,1) NOT NULL,
	[title] [varchar](10) NULL,
	[Fname] [varchar](20) NOT NULL,
	[lname] [varchar](20) NULL,
	[phone] [varchar](20) NULL,
	[email] [varchar](20) NULL,
	[dob] [date] NULL,
	[res_add] [varchar](max) NULL,
	[cur_add] [varchar](max) NULL,
	[gender] [varchar](20) NULL,
	[occupation] [varchar](50) NULL,
	[income] [money] NULL,
	[Aadhar_no] [varchar](16) NULL,
PRIMARY KEY CLUSTERED 
(
	[Cus_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Login]    Script Date: 2/19/2020 11:13:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Login](
	[User_name] [varchar](50) NOT NULL,
	[User_Pass] [varchar](50) NULL,
	[Question] [varchar](max) NULL,
	[ans] [varchar](max) NULL,
	[cus_id] [int] NULL,
	[trans_pass] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[User_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Status_Info]    Script Date: 2/19/2020 11:13:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Status_Info](
	[Status_Type] [varchar](20) NOT NULL,
	[Status] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Status_Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Trans_Types]    Script Date: 2/19/2020 11:13:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Trans_Types](
	[Transaction_type] [varchar](20) NOT NULL,
	[min_amt] [money] NULL,
	[max_amt] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[Transaction_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 2/19/2020 11:13:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Transactions](
	[tran_id] [int] IDENTITY(11111,1) NOT NULL,
	[tran_type] [varchar](20) NULL,
	[t_date] [datetime] NOT NULL,
	[from_acc] [int] NOT NULL,
	[to_acc] [int] NOT NULL,
	[Amt] [money] NOT NULL,
	[remarks] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[tran_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Account_Info] ADD  DEFAULT (getdate()) FOR [open_date]
GO
ALTER TABLE [dbo].[Transactions] ADD  DEFAULT (getdate()) FOR [t_date]
GO
ALTER TABLE [dbo].[Account_Info]  WITH CHECK ADD FOREIGN KEY([AccountType])
REFERENCES [dbo].[accounts] ([accountId])
GO
ALTER TABLE [dbo].[Account_Info]  WITH CHECK ADD FOREIGN KEY([cus_id])
REFERENCES [dbo].[Customer_info] ([Cus_id])
GO
ALTER TABLE [dbo].[Account_Info]  WITH CHECK ADD FOREIGN KEY([statusType])
REFERENCES [dbo].[Status_Info] ([Status_Type])
GO
ALTER TABLE [dbo].[Account_Info]  WITH CHECK ADD FOREIGN KEY([Ifsc])
REFERENCES [dbo].[Branch_details] ([IFSC])
GO
ALTER TABLE [dbo].[Account_Info]  WITH CHECK ADD  CONSTRAINT [fk_T2id] FOREIGN KEY([Ifsc])
REFERENCES [dbo].[Branch_details] ([IFSC])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Account_Info] CHECK CONSTRAINT [fk_T2id]
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD FOREIGN KEY([Ifsc])
REFERENCES [dbo].[Branch_details] ([IFSC])
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [fk_T2ide] FOREIGN KEY([Ifsc])
REFERENCES [dbo].[Branch_details] ([IFSC])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [fk_T2ide]
GO
ALTER TABLE [dbo].[admin_login]  WITH CHECK ADD FOREIGN KEY([admin_id])
REFERENCES [dbo].[Admin] ([admin_id])
GO
ALTER TABLE [dbo].[Benificiary]  WITH CHECK ADD FOREIGN KEY([Benificiary_acc])
REFERENCES [dbo].[Account_Info] ([AccountNo])
GO
ALTER TABLE [dbo].[Benificiary]  WITH CHECK ADD FOREIGN KEY([Benificiary_ifsc])
REFERENCES [dbo].[Branch_details] ([IFSC])
GO
ALTER TABLE [dbo].[Benificiary]  WITH CHECK ADD FOREIGN KEY([cus_id])
REFERENCES [dbo].[Customer_info] ([Cus_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Login]  WITH CHECK ADD FOREIGN KEY([cus_id])
REFERENCES [dbo].[Customer_info] ([Cus_id])
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([from_acc])
REFERENCES [dbo].[Account_Info] ([AccountNo])
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([to_acc])
REFERENCES [dbo].[Account_Info] ([AccountNo])
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([tran_type])
REFERENCES [dbo].[Trans_Types] ([Transaction_type])
GO
USE [master]
GO
ALTER DATABASE [banking] SET  READ_WRITE 
GO
