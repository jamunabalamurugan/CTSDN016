USE [master]
GO
/****** Object:  Database [BusManagement1]    Script Date: 2/19/2020 10:43:18 AM ******/
CREATE DATABASE [BusManagement1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BusManagement1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BusManagement1.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BusManagement1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BusManagement1_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BusManagement1] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BusManagement1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BusManagement1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BusManagement1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BusManagement1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BusManagement1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BusManagement1] SET ARITHABORT OFF 
GO
ALTER DATABASE [BusManagement1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BusManagement1] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BusManagement1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BusManagement1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BusManagement1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BusManagement1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BusManagement1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BusManagement1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BusManagement1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BusManagement1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BusManagement1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BusManagement1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BusManagement1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BusManagement1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BusManagement1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BusManagement1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BusManagement1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BusManagement1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BusManagement1] SET RECOVERY FULL 
GO
ALTER DATABASE [BusManagement1] SET  MULTI_USER 
GO
ALTER DATABASE [BusManagement1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BusManagement1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BusManagement1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BusManagement1] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BusManagement1', N'ON'
GO
USE [BusManagement1]
GO
/****** Object:  StoredProcedure [dbo].[CALCULATE_FARE]    Script Date: 2/19/2020 10:43:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[CALCULATE_FARE]( @ori varchar(30),@dest varchar(30),@d date,@no_of_adult integer,@no_of_child integer)  
AS
BEGIN
select f.bus_number,s.schedule_id,r.origin,r.destination,f.child_fare*@no_of_child+f.adult_fare*@no_of_adult as totalfare
from route as r join "HAVING" as h on ( h.route_id = r.route_id) join has_fare_for as f on
(h.bus_number = f.bus_number AND h.route_id = f.route_id) join bus_schedule as s on
(s.schedule_id = h.schedule_id) where s.departure_date=@d AND r.origin=@ori AND r.destination=@dest
--AND h.seats_available>=@no_of_child+@no_of_adult
End
GO
/****** Object:  Table [dbo].[Booking_Details]    Script Date: 2/19/2020 10:43:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Booking_Details](
	[Booking_ID] [int] NOT NULL,
	[Transaction_Type] [varchar](20) NULL,
	[Booking_Mode] [varchar](1) NULL,
	[Bus_Number] [int] NULL,
	[Schedule_ID] [int] NULL,
	[Route_ID] [int] NULL,
	[Child] [int] NULL,
	[Adult] [int] NULL,
	[booking_status] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Booking_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bus]    Script Date: 2/19/2020 10:43:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bus](
	[Bus_Type] [varchar](20) NOT NULL,
	[Bus_Number] [int] NOT NULL,
	[Capacity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Bus_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bus_Schedule]    Script Date: 2/19/2020 10:43:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bus_Schedule](
	[Schedule_ID] [int] NOT NULL,
	[Departure_Date] [date] NOT NULL,
	[Arrival_Date] [date] NOT NULL,
	[Departure_Time] [time](7) NOT NULL,
	[Arrival_Time] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Schedule_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DriverDetails]    Script Date: 2/19/2020 10:43:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DriverDetails](
	[DriverID] [int] IDENTITY(1,1) NOT NULL,
	[DriverName] [varchar](30) NOT NULL,
	[Phone] [numeric](10, 0) NOT NULL,
	[DriverLicence] [varchar](20) NOT NULL,
	[DriverAddress] [varchar](30) NULL,
	[Driverstatus] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DriverID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Has_Fare_For]    Script Date: 2/19/2020 10:43:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Has_Fare_For](
	[Adult_Fare] [money] NOT NULL,
	[Child_Fare] [money] NOT NULL,
	[Route_ID] [int] NULL,
	[Bus_Number] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Having]    Script Date: 2/19/2020 10:43:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Having](
	[Schedule_ID] [int] NULL,
	[Route_ID] [int] NULL,
	[Bus_Number] [int] NULL,
	[Seats_Available] [int] NULL,
	[DriverId] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Passenger]    Script Date: 2/19/2020 10:43:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Passenger](
	[Gender] [char](1) NULL,
	[Mobile_Number] [varchar](10) NULL,
	[Age] [int] NULL,
	[Pname] [varchar](20) NULL,
	[Booking_ID] [int] NULL,
	[Seat_Number] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rec]    Script Date: 2/19/2020 10:43:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rec](
	[schedule_id] [int] NOT NULL,
	[bus_number] [int] NOT NULL,
	[origin] [varchar](20) NOT NULL,
	[destination] [varchar](20) NOT NULL,
	[total_fare] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Route]    Script Date: 2/19/2020 10:43:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Route](
	[Route_ID] [int] NOT NULL,
	[Origin] [varchar](20) NOT NULL,
	[Destination] [varchar](20) NOT NULL,
	[Distance] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Route_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/19/2020 10:43:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](30) NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[Phone] [varchar](max) NOT NULL,
	[Address] [varchar](50) NULL,
	[gender] [varchar](15) NOT NULL,
	[Role] [varchar](8) NOT NULL,
	[Age] [int] NULL,
	[Accountstatus] [varchar](10) NOT NULL,
	[Booking_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Booking_Details]  WITH CHECK ADD FOREIGN KEY([Bus_Number])
REFERENCES [dbo].[Bus] ([Bus_Number])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[Booking_Details]  WITH CHECK ADD FOREIGN KEY([Route_ID])
REFERENCES [dbo].[Route] ([Route_ID])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[Booking_Details]  WITH CHECK ADD FOREIGN KEY([Schedule_ID])
REFERENCES [dbo].[Bus_Schedule] ([Schedule_ID])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[Has_Fare_For]  WITH CHECK ADD FOREIGN KEY([Bus_Number])
REFERENCES [dbo].[Bus] ([Bus_Number])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[Has_Fare_For]  WITH CHECK ADD FOREIGN KEY([Route_ID])
REFERENCES [dbo].[Route] ([Route_ID])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[Having]  WITH CHECK ADD FOREIGN KEY([Bus_Number])
REFERENCES [dbo].[Bus] ([Bus_Number])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[Having]  WITH CHECK ADD FOREIGN KEY([DriverId])
REFERENCES [dbo].[DriverDetails] ([DriverID])
GO
ALTER TABLE [dbo].[Having]  WITH CHECK ADD FOREIGN KEY([Route_ID])
REFERENCES [dbo].[Route] ([Route_ID])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[Having]  WITH CHECK ADD FOREIGN KEY([Schedule_ID])
REFERENCES [dbo].[Bus_Schedule] ([Schedule_ID])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[Passenger]  WITH CHECK ADD FOREIGN KEY([Booking_ID])
REFERENCES [dbo].[Booking_Details] ([Booking_ID])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([Booking_id])
REFERENCES [dbo].[Booking_Details] ([Booking_ID])
GO
USE [master]
GO
ALTER DATABASE [BusManagement1] SET  READ_WRITE 
GO
