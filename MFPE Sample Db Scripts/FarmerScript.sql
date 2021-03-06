USE [master]
GO
/****** Object:  Database [farmerSchemeDbFinal]    Script Date: 2/26/2020 5:07:11 PM ******/
CREATE DATABASE [farmerSchemeDbFinal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'farmerSchemeDbFinal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\farmerSchemeDbFinal.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'farmerSchemeDbFinal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\farmerSchemeDbFinal_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [farmerSchemeDbFinal] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [farmerSchemeDbFinal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [farmerSchemeDbFinal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [farmerSchemeDbFinal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [farmerSchemeDbFinal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [farmerSchemeDbFinal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [farmerSchemeDbFinal] SET ARITHABORT OFF 
GO
ALTER DATABASE [farmerSchemeDbFinal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [farmerSchemeDbFinal] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [farmerSchemeDbFinal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [farmerSchemeDbFinal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [farmerSchemeDbFinal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [farmerSchemeDbFinal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [farmerSchemeDbFinal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [farmerSchemeDbFinal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [farmerSchemeDbFinal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [farmerSchemeDbFinal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [farmerSchemeDbFinal] SET  ENABLE_BROKER 
GO
ALTER DATABASE [farmerSchemeDbFinal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [farmerSchemeDbFinal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [farmerSchemeDbFinal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [farmerSchemeDbFinal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [farmerSchemeDbFinal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [farmerSchemeDbFinal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [farmerSchemeDbFinal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [farmerSchemeDbFinal] SET RECOVERY FULL 
GO
ALTER DATABASE [farmerSchemeDbFinal] SET  MULTI_USER 
GO
ALTER DATABASE [farmerSchemeDbFinal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [farmerSchemeDbFinal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [farmerSchemeDbFinal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [farmerSchemeDbFinal] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'farmerSchemeDbFinal', N'ON'
GO
USE [farmerSchemeDbFinal]
GO
/****** Object:  StoredProcedure [dbo].[Bankdetails]    Script Date: 2/26/2020 5:07:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Bankdetails] @userid int,@Accnum varchar(50),@ifsc nvarchar(max)
as
INSERT INTO Bank_Details (user_Id,Account_Number,ifsc_code)
VALUES(@userid,@Accnum,@ifsc)
GO
/****** Object:  StoredProcedure [dbo].[bidderdoc]    Script Date: 2/26/2020 5:07:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[bidderdoc] @biduserid int,@aadhar text,@pancard text,@traderlic text
as
INSERT INTO bidder_Document_Details (bidder_user_Id,aadhar,pancard,trader_license)
VALUES (@biduserid,@aadhar,@pancard,@traderlic)
GO
/****** Object:  StoredProcedure [dbo].[BidderReg]    Script Date: 2/26/2020 5:07:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BidderReg] @usertype nvarchar(max),@username nvarchar(max),@email varchar(255),@phone varchar(20),
@passwd nvarchar(max), @address nvarchar(max),@city nvarchar(max),@state nvarchar(max),@pincode int
as
INSERT INTO User_Details (user_Type,user_Name,Email,phone,password,address,city,state,pincode)
VALUES(@usertype,@username,@email,@phone,@passwd,@address,@city,@state,@pincode)
SELECT user_id from User_Details Where password=@passwd And user_Name=@username
GO
/****** Object:  StoredProcedure [dbo].[FarmerBidder]    Script Date: 2/26/2020 5:07:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[FarmerBidder] @date datetime
as
select user_details.user_Name as Biddername,Email,Amount,Request_Id,quantity,crop_name
from biddingAmounts as dummy join User_Details
 on dummy.user_id=User_Details.user_Id where dummy.status='sold' and dummy.BiddingEndDate=@date
GO
/****** Object:  StoredProcedure [dbo].[FarmerDocument]    Script Date: 2/26/2020 5:07:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[FarmerDocument] @Farmer_id int,@aadhar text,@pancard text,@certificate text
as
begin
insert farmer_Document_Details(farmer_user_Id,aadhar,pancard,certificate)values (@Farmer_id,@aadhar,@pancard,@certificate)
end
GO
/****** Object:  StoredProcedure [dbo].[FarmerLand]    Script Date: 2/26/2020 5:07:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[FarmerLand] @Farmer_id int,@area nvarchar(max),@address nvarchar(max),@pincode int
as
begin
insert Land_Details(farmer_id,area,address,pincode)values (@Farmer_id,@area,@address,@pincode)
end
GO
/****** Object:  StoredProcedure [dbo].[FarmerReg]    Script Date: 2/26/2020 5:07:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[FarmerReg] @usertype nvarchar(max),@username nvarchar(max),@email varchar(255),@phone varchar(20),
@passwd nvarchar(max), @address nvarchar(max),@city nvarchar(max),@state nvarchar(max),@pincode int
as
INSERT INTO User_Details (user_Type,user_Name,Email,phone,password,address,city,state,pincode)
VALUES(@usertype,@username,@email,@phone,@passwd,@address,@city,@state,@pincode)
SELECT user_id from User_Details Where password=@passwd And user_Name=@username
GO
/****** Object:  StoredProcedure [dbo].[ForgetPassWord]    Script Date: 2/26/2020 5:07:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ForgetPassWord] @Email varchar(255), @phone varchar(20),@password nvarchar(max)
as 
begin
update User_Details set password=@password where user_details.Email=@Email and user_details.phone=@phone

end
GO
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 2/26/2020 5:07:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Login] @loginid varchar(255), @passwd nvarchar(max)
as SELECT user_Id from User_Details where @loginid=Email And @passwd=password;
GO
/****** Object:  StoredProcedure [dbo].[OnBidding]    Script Date: 2/26/2020 5:07:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[OnBidding]  @RequestID int,@Bidderid int,@Biddingamount decimal(18,0)
as 
begin
update biddingAmounts set user_id=@Bidderid,amount=@Biddingamount where request_id=@RequestID

end
GO
/****** Object:  StoredProcedure [dbo].[OnSale]    Script Date: 2/26/2020 5:07:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[OnSale] @RequestId int,@baseprice decimal(18,0),@BiddingEndDate datetime
as
declare @FarmerId int=(select user_id from Request_Details where Request_id=@RequestId )
declare @quantity int=(select quantity from Request_Details where Request_id=@RequestId )
declare @crop_name varchar(200)=(select crop_name from Request_Details where Request_id=@RequestId )
declare @amount decimal(18,0)=@baseprice
INSERT INTO biddingAmounts(request_id,farmerid,amount,Baseprice,Biddingenddate,quantity,crop_name)
VALUES(@RequestId,@FarmerId,@amount,@baseprice,@BiddingEndDate,@quantity,@crop_name)
update Request_Details set status='Approved' where Request_id=@RequestId
GO
/****** Object:  StoredProcedure [dbo].[SellRequest]    Script Date: 2/26/2020 5:07:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SellRequest] @Farmer_id int,@CropType nvarchar(max),@CropName nvarchar(max),@fertilizer_type nvarchar(max),@Quantity int,@ph_value tinyint
as
begin
declare @date_of_req datetime=getdate();
insert Request_Details(user_id,crop_Type,crop_name,fertilizer_type,quantity,ph_value,date_of_req)values (@Farmer_id,@croptype,@Cropname,@fertilizer_type,@Quantity,@ph_value,@date_of_req)
end
GO
/****** Object:  StoredProcedure [dbo].[SoldApproved]    Script Date: 2/26/2020 5:07:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SoldApproved] @RequestId int
as
begin
insert into History_Details(Request_id,msp,sold_price,Total_price,user_id,Sold_date)
select request_id,baseprice,amount,amount,farmerid,biddingenddate 
from biddingAmounts where biddingamounts.request_id=@RequestId
update biddingAmounts set status='sold'
where Request_Id=@RequestId 
end
GO
/****** Object:  StoredProcedure [dbo].[Soldhistory]    Script Date: 2/26/2020 5:07:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Soldhistory] @userid int
as
Select sold_date,crop_name,Quantity,msp,sold_price,Total_price from History_Details join Request_Details
ON History_Details.Request_id=Request_Details.Request_id Where History_Details.user_id=@userid
GO
/****** Object:  Table [dbo].[Bank_Details]    Script Date: 2/26/2020 5:07:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bank_Details](
	[user_Id] [int] NULL,
	[Account_Number] [varchar](50) NOT NULL,
	[ifsc_code] [nvarchar](max) NOT NULL,
 CONSTRAINT [pk_accno] PRIMARY KEY CLUSTERED 
(
	[Account_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BidApprove]    Script Date: 2/26/2020 5:07:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BidApprove](
	[RequestId] [int] NOT NULL,
	[status] [varchar](20) NULL,
	[UserId] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bidder_Document_Details]    Script Date: 2/26/2020 5:07:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bidder_Document_Details](
	[bidder_user_Id] [int] NULL,
	[aadhar] [text] NOT NULL,
	[pancard] [text] NOT NULL,
	[trader_license] [text] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[biddingAmounts]    Script Date: 2/26/2020 5:07:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[biddingAmounts](
	[Request_Id] [int] NULL,
	[user_id] [int] NULL,
	[amount] [decimal](18, 0) NOT NULL,
	[farmerid] [int] NOT NULL,
	[BiddingEndDate] [datetime] NOT NULL,
	[Baseprice] [decimal](18, 0) NOT NULL,
	[status] [varchar](200) NOT NULL,
	[quantity] [int] NOT NULL,
	[crop_name] [varchar](255) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[farmer_Document_Details]    Script Date: 2/26/2020 5:07:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[farmer_Document_Details](
	[farmer_user_Id] [int] NULL,
	[aadhar] [text] NOT NULL,
	[pancard] [text] NOT NULL,
	[certificate] [text] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[History_Details]    Script Date: 2/26/2020 5:07:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History_Details](
	[Request_id] [int] NULL,
	[msp] [float] NOT NULL,
	[sold_price] [decimal](18, 0) NOT NULL,
	[Total_price] [decimal](18, 0) NOT NULL,
	[user_id] [int] NULL,
	[Sold_date] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Land_Details]    Script Date: 2/26/2020 5:07:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Land_Details](
	[farmer_id] [int] NOT NULL,
	[area] [nvarchar](max) NOT NULL,
	[address] [nvarchar](max) NOT NULL,
	[pincode] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Request_Details]    Script Date: 2/26/2020 5:07:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Request_Details](
	[Request_id] [int] IDENTITY(200,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[crop_Type] [nvarchar](max) NOT NULL,
	[crop_name] [nvarchar](max) NOT NULL,
	[fertilizer_type] [nvarchar](max) NOT NULL,
	[quantity] [int] NOT NULL,
	[ph_value] [tinyint] NOT NULL,
	[date_of_req] [datetime] NULL,
	[status] [varchar](200) NOT NULL,
 CONSTRAINT [pk_reqid] PRIMARY KEY CLUSTERED 
(
	[Request_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sell_Request]    Script Date: 2/26/2020 5:07:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sell_Request](
	[sell_request] [int] NULL,
	[bidding_end_date] [datetime] NOT NULL,
	[amount] [decimal](18, 0) NOT NULL,
UNIQUE NONCLUSTERED 
(
	[sell_request] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User_Details]    Script Date: 2/26/2020 5:07:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User_Details](
	[user_Id] [int] IDENTITY(10000,2) NOT NULL,
	[user_Type] [nvarchar](max) NOT NULL,
	[user_Name] [nvarchar](max) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[phone] [varchar](20) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[address] [nvarchar](max) NOT NULL,
	[city] [nvarchar](max) NOT NULL,
	[state] [nvarchar](max) NOT NULL,
	[pincode] [int] NOT NULL,
 CONSTRAINT [pk_uid] PRIMARY KEY CLUSTERED 
(
	[user_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[biddingAmounts] ADD  DEFAULT ('10220') FOR [user_id]
GO
ALTER TABLE [dbo].[biddingAmounts] ADD  DEFAULT ('OnSale') FOR [status]
GO
ALTER TABLE [dbo].[biddingAmounts] ADD  DEFAULT ((10)) FOR [quantity]
GO
ALTER TABLE [dbo].[biddingAmounts] ADD  DEFAULT ('rice') FOR [crop_name]
GO
ALTER TABLE [dbo].[Request_Details] ADD  DEFAULT ('Pending') FOR [status]
GO
ALTER TABLE [dbo].[Bank_Details]  WITH CHECK ADD  CONSTRAINT [fk_uid] FOREIGN KEY([user_Id])
REFERENCES [dbo].[User_Details] ([user_Id])
GO
ALTER TABLE [dbo].[Bank_Details] CHECK CONSTRAINT [fk_uid]
GO
ALTER TABLE [dbo].[BidApprove]  WITH CHECK ADD FOREIGN KEY([RequestId])
REFERENCES [dbo].[Request_Details] ([Request_id])
GO
ALTER TABLE [dbo].[BidApprove]  WITH CHECK ADD FOREIGN KEY([RequestId])
REFERENCES [dbo].[Request_Details] ([Request_id])
GO
ALTER TABLE [dbo].[bidder_Document_Details]  WITH CHECK ADD  CONSTRAINT [fk_uid_doc_bidder] FOREIGN KEY([bidder_user_Id])
REFERENCES [dbo].[User_Details] ([user_Id])
GO
ALTER TABLE [dbo].[bidder_Document_Details] CHECK CONSTRAINT [fk_uid_doc_bidder]
GO
ALTER TABLE [dbo].[biddingAmounts]  WITH CHECK ADD  CONSTRAINT [fk_reqid_bamount] FOREIGN KEY([Request_Id])
REFERENCES [dbo].[Request_Details] ([Request_id])
GO
ALTER TABLE [dbo].[biddingAmounts] CHECK CONSTRAINT [fk_reqid_bamount]
GO
ALTER TABLE [dbo].[biddingAmounts]  WITH CHECK ADD  CONSTRAINT [fk_uid_participant_amts] FOREIGN KEY([user_id])
REFERENCES [dbo].[User_Details] ([user_Id])
GO
ALTER TABLE [dbo].[biddingAmounts] CHECK CONSTRAINT [fk_uid_participant_amts]
GO
ALTER TABLE [dbo].[farmer_Document_Details]  WITH CHECK ADD  CONSTRAINT [fk_uid_doc_farmer] FOREIGN KEY([farmer_user_Id])
REFERENCES [dbo].[User_Details] ([user_Id])
GO
ALTER TABLE [dbo].[farmer_Document_Details] CHECK CONSTRAINT [fk_uid_doc_farmer]
GO
ALTER TABLE [dbo].[History_Details]  WITH CHECK ADD  CONSTRAINT [fk_reqid] FOREIGN KEY([Request_id])
REFERENCES [dbo].[Request_Details] ([Request_id])
GO
ALTER TABLE [dbo].[History_Details] CHECK CONSTRAINT [fk_reqid]
GO
ALTER TABLE [dbo].[Land_Details]  WITH CHECK ADD  CONSTRAINT [fk_farmer_id] FOREIGN KEY([farmer_id])
REFERENCES [dbo].[User_Details] ([user_Id])
GO
ALTER TABLE [dbo].[Land_Details] CHECK CONSTRAINT [fk_farmer_id]
GO
ALTER TABLE [dbo].[Request_Details]  WITH CHECK ADD  CONSTRAINT [fk_uid_req] FOREIGN KEY([user_id])
REFERENCES [dbo].[User_Details] ([user_Id])
GO
ALTER TABLE [dbo].[Request_Details] CHECK CONSTRAINT [fk_uid_req]
GO
ALTER TABLE [dbo].[Sell_Request]  WITH CHECK ADD FOREIGN KEY([sell_request])
REFERENCES [dbo].[Request_Details] ([Request_id])
GO
USE [master]
GO
ALTER DATABASE [farmerSchemeDbFinal] SET  READ_WRITE 
GO
