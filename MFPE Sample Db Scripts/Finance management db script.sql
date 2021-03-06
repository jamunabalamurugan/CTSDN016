USE [master]
GO
/****** Object:  Database [Finance_management]    Script Date: 2/19/2020 12:21:48 PM ******/
CREATE DATABASE [Finance_management]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Finance_management', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Finance_management.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Finance_management_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Finance_management_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Finance_management] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Finance_management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Finance_management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Finance_management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Finance_management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Finance_management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Finance_management] SET ARITHABORT OFF 
GO
ALTER DATABASE [Finance_management] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Finance_management] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Finance_management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Finance_management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Finance_management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Finance_management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Finance_management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Finance_management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Finance_management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Finance_management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Finance_management] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Finance_management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Finance_management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Finance_management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Finance_management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Finance_management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Finance_management] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Finance_management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Finance_management] SET RECOVERY FULL 
GO
ALTER DATABASE [Finance_management] SET  MULTI_USER 
GO
ALTER DATABASE [Finance_management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Finance_management] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Finance_management] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Finance_management] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Finance_management', N'ON'
GO
USE [Finance_management]
GO
/****** Object:  Table [dbo].[Admin_Login]    Script Date: 2/19/2020 12:21:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin_Login](
	[Name] [varchar](max) NOT NULL,
	[Username] [varchar](max) NOT NULL,
	[password] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bank]    Script Date: 2/19/2020 12:21:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bank](
	[Customer_id] [int] NULL,
	[Account_type] [varchar](max) NOT NULL,
	[Account_Number] [varchar](max) NOT NULL,
	[Bank_Name] [varchar](max) NOT NULL,
	[card_type] [varchar](max) NOT NULL,
	[Ifsc] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2/19/2020 12:21:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categories](
	[Category_Id] [int] NOT NULL,
	[Category_Name] [varchar](max) NOT NULL,
	[Category_Description] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Category_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Gold_Emi]    Script Date: 2/19/2020 12:21:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gold_Emi](
	[product_id] [int] NULL,
	[Product_price] [money] NOT NULL,
	[Three_Months_Emi] [money] NOT NULL,
	[Three_Months_Emi_Percentage] [varchar](1) NOT NULL,
	[Six_Months_Emi] [money] NOT NULL,
	[Six_Months_Emi_Percentage] [varchar](1) NOT NULL,
	[Nine_Months_Emi] [money] NOT NULL,
	[Nine_Months_Emi_Percentage] [varchar](1) NOT NULL,
	[Customer_Id] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[order_details]    Script Date: 2/19/2020 12:21:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details](
	[Order_Id] [int] IDENTITY(1000,1) NOT NULL,
	[Customer_id] [int] NULL,
	[Product_id] [int] NULL,
	[order_date] [date] NULL,
	[Unit_price] [money] NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Order_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payment_Details]    Script Date: 2/19/2020 12:21:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Payment_Details](
	[customer_id] [int] NOT NULL,
	[Account_type] [varchar](max) NOT NULL,
	[Product_Id] [int] NOT NULL,
	[Current_balance] [money] NOT NULL,
	[purchased_date] [date] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2/19/2020 12:21:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[Product_Id] [int] NOT NULL,
	[Category_Id] [int] NOT NULL,
	[Product_Name] [varchar](max) NOT NULL,
	[Product_Price] [money] NOT NULL,
	[Units_In_Stock] [int] NOT NULL,
	[warranty] [varchar](max) NOT NULL,
	[Pictures] [image] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Product_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Register]    Script Date: 2/19/2020 12:21:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Register](
	[customer_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NOT NULL,
	[Phone_Number] [varchar](max) NOT NULL,
	[Email_Id] [varchar](max) NOT NULL,
	[username] [varchar](max) NOT NULL,
	[Password] [varchar](max) NOT NULL,
	[Address] [varchar](max) NOT NULL,
	[confirm_password] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Titanium_Emi]    Script Date: 2/19/2020 12:21:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Titanium_Emi](
	[product_id] [int] NULL,
	[Product_price] [money] NOT NULL,
	[Three_Months_Emi] [money] NOT NULL,
	[Three_Months_Emi_Percentage] [varchar](1) NOT NULL,
	[Six_Months_Emi] [money] NOT NULL,
	[Six_Months_Emi_Percentage] [varchar](1) NOT NULL,
	[Nine_Months_Emi] [money] NOT NULL,
	[Nine_Months_Emi_Percentage] [varchar](1) NOT NULL,
	[Customer_Id] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Bank]  WITH CHECK ADD FOREIGN KEY([Customer_id])
REFERENCES [dbo].[Register] ([customer_Id])
GO
ALTER TABLE [dbo].[Gold_Emi]  WITH CHECK ADD FOREIGN KEY([Customer_Id])
REFERENCES [dbo].[Register] ([customer_Id])
GO
ALTER TABLE [dbo].[Gold_Emi]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([Product_Id])
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD FOREIGN KEY([Customer_id])
REFERENCES [dbo].[Register] ([customer_Id])
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD FOREIGN KEY([Product_id])
REFERENCES [dbo].[Products] ([Product_Id])
GO
ALTER TABLE [dbo].[Payment_Details]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[Register] ([customer_Id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Categories] ([Category_Id])
GO
ALTER TABLE [dbo].[Titanium_Emi]  WITH CHECK ADD FOREIGN KEY([Customer_Id])
REFERENCES [dbo].[Register] ([customer_Id])
GO
ALTER TABLE [dbo].[Titanium_Emi]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([Product_Id])
GO
USE [master]
GO
ALTER DATABASE [Finance_management] SET  READ_WRITE 
GO
