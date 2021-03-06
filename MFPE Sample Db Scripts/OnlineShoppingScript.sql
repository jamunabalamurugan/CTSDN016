USE [master]
GO
/****** Object:  Database [OrderOnline]    Script Date: 2/26/2020 2:42:02 PM ******/
CREATE DATABASE [OrderOnline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OrderOnline', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\OrderOnline.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'OrderOnline_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\OrderOnline_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [OrderOnline] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OrderOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OrderOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OrderOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OrderOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OrderOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OrderOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [OrderOnline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OrderOnline] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [OrderOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OrderOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OrderOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OrderOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OrderOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OrderOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OrderOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OrderOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OrderOnline] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OrderOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OrderOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OrderOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OrderOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OrderOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OrderOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OrderOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OrderOnline] SET RECOVERY FULL 
GO
ALTER DATABASE [OrderOnline] SET  MULTI_USER 
GO
ALTER DATABASE [OrderOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OrderOnline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OrderOnline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OrderOnline] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'OrderOnline', N'ON'
GO
USE [OrderOnline]
GO
/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 2/26/2020 2:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc  [dbo].[CreateUser] ( @Username varchar(max),@UserType varchar(10),@company varchar(max),@Userpassword nvarchar(max),@emailid nvarchar(max),@phonenumber nvarchar(max),@contactaddress nvarchar(max),@postalcode char(6) )
as
begin
INSERT INTO User_Details(Name,User_type,Company,Password,Email_Id,Contact_Number,User_Address,Postal_code)
VALUES (@Username,@UserType,@company,@Userpassword,@emailid,@phonenumber,@contactaddress,@postalcode);
end

GO
/****** Object:  StoredProcedure [dbo].[DisplayOrderHistory]    Script Date: 2/26/2020 2:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[DisplayOrderHistory] @user_id int
AS
BEGIN
SELECT Order_details.Order_id,Order_details.Price,Order_details.Quantity,Orders.Order_date,
Orders.Order_status,product.Name,Product.Brand,Product.Product_Status,
 User_Details.Name,User_Details.User_Address,User_Details.Postal_code, 
product.price,  User_Log.Action_date FROM Product
join Order_details on product.Product_Id = Order_details.product_id
join orders on Order_details.order_ID = Orders.Order_id
join User_Details on Orders.User_id = User_Details.user_ID
join User_Log on User_Log.User_id = User_Details.user_ID
Where User_Details.User_Id = @user_ID
END
GO
/****** Object:  StoredProcedure [dbo].[log_users]    Script Date: 2/26/2020 2:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[log_users](@userid int)
as
begin
select Product.Name, User_Log.Action_date,User_Log.User_Action from User_Log
join Product on Product.Product_Id=User_Log.Product_id
 where User_Log.User_id=(select USER_ID from User_Details where User_id=@userid)
end

GO
/****** Object:  Table [dbo].[Category]    Script Date: 2/26/2020 2:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[Category_id] [int] IDENTITY(2000,1) NOT NULL,
	[Name] [varchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order_details]    Script Date: 2/26/2020 2:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_details](
	[Order_id] [int] NULL,
	[Product_id] [int] NULL,
	[Price] [money] NOT NULL,
	[Quantity] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2/26/2020 2:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[Order_id] [int] IDENTITY(20200,1) NOT NULL,
	[User_id] [int] NULL,
	[Order_date] [nvarchar](max) NOT NULL,
	[Order_status] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2/26/2020 2:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[Product_Id] [int] IDENTITY(1000,1) NOT NULL,
	[Category_id] [int] NULL,
	[Product_Type] [int] NULL,
	[User_id] [int] NULL,
	[Name] [varchar](max) NOT NULL,
	[Brand] [varchar](max) NOT NULL,
	[Size] [varchar](max) NOT NULL,
	[Color] [varchar](max) NOT NULL,
	[Price] [money] NOT NULL,
	[Rating] [varchar](max) NOT NULL,
	[Stock] [int] NOT NULL,
	[IsApproved] [bit] NULL,
	[Product_Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Product_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product_Image]    Script Date: 2/26/2020 2:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Image](
	[Product_id] [int] NULL,
	[Front_image] [nvarchar](max) NULL,
	[Rear_image] [nvarchar](max) NULL,
	[Side_image] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Type]    Script Date: 2/26/2020 2:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product_Type](
	[Type_id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Retailer]    Script Date: 2/26/2020 2:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Retailer](
	[User_id] [int] NULL,
	[TotalRevenue] [money] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shopping_cart]    Script Date: 2/26/2020 2:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shopping_cart](
	[User_id] [int] NULL,
	[Product_id] [int] NULL,
	[Iscart] [bit] NULL,
	[TotalPrice] [money] NOT NULL,
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User_Details]    Script Date: 2/26/2020 2:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User_Details](
	[User_Id] [int] IDENTITY(1000,1) NOT NULL,
	[User_type] [varchar](10) NOT NULL,
	[Name] [varchar](max) NOT NULL,
	[Company] [varchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Email_Id] [nvarchar](max) NOT NULL,
	[Contact_Number] [nvarchar](10) NOT NULL,
	[User_Address] [nvarchar](max) NOT NULL,
	[Postal_code] [char](6) NOT NULL,
	[IsPrivilege] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User_Log]    Script Date: 2/26/2020 2:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User_Log](
	[Log_id] [int] IDENTITY(1000,1) NOT NULL,
	[User_id] [int] NULL,
	[Product_id] [int] NULL,
	[User_Action] [varchar](max) NULL,
	[Action_date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [IsApproved]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [Product_Status]
GO
ALTER TABLE [dbo].[Shopping_cart] ADD  DEFAULT ((0)) FOR [Iscart]
GO
ALTER TABLE [dbo].[User_Details] ADD  DEFAULT ((0)) FOR [IsPrivilege]
GO
ALTER TABLE [dbo].[User_Log] ADD  DEFAULT ('pending') FOR [User_Action]
GO
ALTER TABLE [dbo].[Order_details]  WITH CHECK ADD FOREIGN KEY([Order_id])
REFERENCES [dbo].[Orders] ([Order_id])
GO
ALTER TABLE [dbo].[Order_details]  WITH CHECK ADD FOREIGN KEY([Product_id])
REFERENCES [dbo].[Product] ([Product_Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([User_id])
REFERENCES [dbo].[User_Details] ([User_Id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([Category_id])
REFERENCES [dbo].[Category] ([Category_id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([Product_Type])
REFERENCES [dbo].[Product_Type] ([Type_id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([User_id])
REFERENCES [dbo].[User_Details] ([User_Id])
GO
ALTER TABLE [dbo].[Product_Image]  WITH CHECK ADD FOREIGN KEY([Product_id])
REFERENCES [dbo].[Product] ([Product_Id])
GO
ALTER TABLE [dbo].[Retailer]  WITH CHECK ADD FOREIGN KEY([User_id])
REFERENCES [dbo].[User_Details] ([User_Id])
GO
ALTER TABLE [dbo].[Shopping_cart]  WITH CHECK ADD FOREIGN KEY([Product_id])
REFERENCES [dbo].[Product] ([Product_Id])
GO
ALTER TABLE [dbo].[Shopping_cart]  WITH CHECK ADD FOREIGN KEY([User_id])
REFERENCES [dbo].[User_Details] ([User_Id])
GO
ALTER TABLE [dbo].[User_Log]  WITH CHECK ADD FOREIGN KEY([Product_id])
REFERENCES [dbo].[Product] ([Product_Id])
GO
ALTER TABLE [dbo].[User_Log]  WITH CHECK ADD FOREIGN KEY([User_id])
REFERENCES [dbo].[User_Details] ([User_Id])
GO
USE [master]
GO
ALTER DATABASE [OrderOnline] SET  READ_WRITE 
GO
