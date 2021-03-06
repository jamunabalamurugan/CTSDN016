USE [master]
GO
/****** Object:  Database [HomeLoans]    Script Date: 2/26/2020 1:12:16 PM ******/
CREATE DATABASE [HomeLoans]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HomeLoans', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\HomeLoans.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HomeLoans_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\HomeLoans_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HomeLoans] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HomeLoans].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HomeLoans] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HomeLoans] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HomeLoans] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HomeLoans] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HomeLoans] SET ARITHABORT OFF 
GO
ALTER DATABASE [HomeLoans] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HomeLoans] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [HomeLoans] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HomeLoans] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HomeLoans] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HomeLoans] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HomeLoans] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HomeLoans] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HomeLoans] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HomeLoans] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HomeLoans] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HomeLoans] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HomeLoans] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HomeLoans] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HomeLoans] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HomeLoans] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HomeLoans] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HomeLoans] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HomeLoans] SET RECOVERY FULL 
GO
ALTER DATABASE [HomeLoans] SET  MULTI_USER 
GO
ALTER DATABASE [HomeLoans] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HomeLoans] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HomeLoans] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HomeLoans] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HomeLoans', N'ON'
GO
USE [HomeLoans]
GO
/****** Object:  StoredProcedure [dbo].[Account_Info]    Script Date: 2/26/2020 1:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Account_Info] @id int
as select Firstname+LastName as FullName, MobileNumber, LoanApproved, LoanAmount, LoanDate ,AccountNumber,Balance from UserRegister as u join LoanDetails as l on u.UserID=l.UserID
join AccountDetails as a on l.UserID=a.UserID where u.UserID=@id;
GO
/****** Object:  StoredProcedure [dbo].[AccountDashboard]    Script Date: 2/26/2020 1:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AccountDashboard](@useriid int)
as
begin
select AccountDetails.AccountNumber,UserRegister.FirstName+' '+UserRegister.LastName as FullName,UserRegister.MobileNumber,UserRegister.UserID,LoanDetails.LoanApproved,LoanDetails.LoanDate,AccountDetails.Balance 
as AccountBalance from UserRegister join LoanDetails on
LoanDetails.UserID=@useriid 
join AccountDetails on AccountDetails.UserID=@useriid
end
GO
/****** Object:  StoredProcedure [dbo].[Admin_Info]    Script Date: 2/26/2020 1:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Admin_Info]
as select Firstname+LastName as FullName, MobileNumber, LoanApproved, LoanAmount, LoanDate ,AccountNumber,Balance from UserRegister as u join LoanDetails as l on u.UserID=l.UserID
join AccountDetails as a on l.UserID=a.UserID 
GO
/****** Object:  StoredProcedure [dbo].[adminloan]    Script Date: 2/26/2020 1:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[adminloan](@userid int )
as
begin
select UReg.UserID,LoanID,FirstName+' '+LastName as FullName,MobileNumber,LoanApproved,LoanAmount from UserRegister as UReg 
join LoanDetails as LDetails on 
UReg.UserID=LDetails.UserID where LDetails.UserID=@userid
end

GO
/****** Object:  StoredProcedure [dbo].[approvedloan]    Script Date: 2/26/2020 1:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[approvedloan](@userif int)
as
begin
update LoanDetails set LoanApproved='Approved' where LoanID=@userif
end
GO
/****** Object:  StoredProcedure [dbo].[loanapprove]    Script Date: 2/26/2020 1:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[loanapprove]
as
begin
select UReg.UserID,LoanID,FirstName+' '+LastName as FullName,MobileNumber,LoanApproved,LoanAmount from UserRegister as UReg 
join LoanDetails as LDetails on 
UReg.UserID=LDetails.UserID 
end
GO
/****** Object:  Table [dbo].[AccountDetails]    Script Date: 2/26/2020 1:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AccountDetails](
	[AccountID] [int] IDENTITY(600001,1) NOT NULL,
	[UserID] [int] NULL,
	[LoanID] [int] NULL,
	[AccHolderName] [varchar](max) NOT NULL,
	[AccountNumber] [varchar](16) NOT NULL,
	[Balance] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2/26/2020 1:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminId] [varchar](50) NOT NULL,
	[AdminPass] [varchar](20) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CoApplicant]    Script Date: 2/26/2020 1:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CoApplicant](
	[CoApplicantID] [int] IDENTITY(1,1) NOT NULL,
	[IncomeID] [int] NULL,
	[Relationship] [varchar](15) NOT NULL,
	[CoApplicantName] [varchar](max) NOT NULL,
	[ResidencyStatus] [varchar](6) NULL,
	[CurrentLiving] [nvarchar](20) NOT NULL,
	[DOB] [date] NOT NULL,
	[TypeOfEmployment] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CoApplicantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CoApplicantSalEmp]    Script Date: 2/26/2020 1:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoApplicantSalEmp](
	[CoApplicantSalID] [int] IDENTITY(1,1) NOT NULL,
	[CoApplicantID] [int] NULL,
	[EmployerName] [nvarchar](20) NOT NULL,
	[JoiningDate] [date] NOT NULL,
	[GrossMonthlySalary] [money] NOT NULL,
	[TotalEmiMoney] [money] NULL,
	[RetirementAge] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CoApplicantSalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CoApplicantSelfEmp]    Script Date: 2/26/2020 1:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoApplicantSelfEmp](
	[CoApplicantSEID] [int] IDENTITY(1,1) NOT NULL,
	[CoApplicantID] [int] NULL,
	[BusinessProfile] [nvarchar](10) NOT NULL,
	[BusinessStartDate] [date] NOT NULL,
	[GrossTurnOver] [money] NOT NULL,
	[Grossprofit] [money] NOT NULL,
	[OtherIncome] [money] NULL,
	[Tax] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CoApplicantSEID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Documents]    Script Date: 2/26/2020 1:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documents](
	[DocumentsID] [int] IDENTITY(1,1) NOT NULL,
	[LoanID] [int] NULL,
	[AadharCard] [image] NOT NULL,
	[PanCard] [image] NOT NULL,
	[VoterID] [image] NOT NULL,
	[SalarySlip] [image] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DocumentsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IncomeDetails]    Script Date: 2/26/2020 1:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IncomeDetails](
	[IncomeID] [int] IDENTITY(1,1) NOT NULL,
	[LoanID] [int] NULL,
	[TypeOfEmployment] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IncomeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoanDetails]    Script Date: 2/26/2020 1:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoanDetails](
	[LoanID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[DocVerified] [varchar](10) NOT NULL,
	[LoanApproved] [varchar](10) NOT NULL,
	[InterestRate] [float] NOT NULL,
	[LoanAmount] [money] NOT NULL,
	[LoanDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LoanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PersonalDetails]    Script Date: 2/26/2020 1:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PersonalDetails](
	[PersonalID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[DOB] [date] NOT NULL,
	[Age] [char](2) NOT NULL,
	[Gender] [char](10) NOT NULL,
	[ResidencyStatus] [char](10) NULL,
	[PermanentAddress] [varchar](max) NOT NULL,
	[PermanentPincode] [varchar](10) NOT NULL,
	[CurrentAddress] [varchar](max) NOT NULL,
	[CurrentPincode] [varchar](10) NOT NULL,
	[AadharCardNum] [varchar](12) NULL,
	[PanCardNum] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PropertyDetails]    Script Date: 2/26/2020 1:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PropertyDetails](
	[PropertyID] [int] IDENTITY(1,1) NOT NULL,
	[LoanID] [int] NULL,
	[PropertyLocation] [varchar](25) NOT NULL,
	[PropertyAreaSqft] [float] NOT NULL,
	[PropertyDocument] [image] NOT NULL,
	[TotalEstimatedAmount] [money] NOT NULL,
	[LOA] [image] NOT NULL,
	[NOC] [image] NULL,
	[AgreementToSale] [image] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SalariedApplicant]    Script Date: 2/26/2020 1:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SalariedApplicant](
	[SalaryID] [int] IDENTITY(1,1) NOT NULL,
	[IncomeID] [int] NULL,
	[EmployerName] [varchar](30) NOT NULL,
	[OrganisationType] [varchar](10) NULL,
	[WorkingExperience] [tinyint] NULL,
	[CurrentIncome] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SalaryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SelfEmployed]    Script Date: 2/26/2020 1:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SelfEmployed](
	[SelfID] [int] IDENTITY(1,1) NOT NULL,
	[IncomeID] [int] NULL,
	[BusinessProfile] [nvarchar](10) NOT NULL,
	[BusinessStartDate] [date] NOT NULL,
	[GrossTurnOver] [money] NOT NULL,
	[Grossprofit] [money] NOT NULL,
	[OtherIncome] [money] NULL,
	[Tax] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SelfID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRegister]    Script Date: 2/26/2020 1:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserRegister](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](20) NOT NULL,
	[FirstName] [varchar](max) NOT NULL,
	[LastName] [varchar](max) NOT NULL,
	[Email] [varchar](254) NOT NULL,
	[MobileNumber] [varchar](10) NOT NULL,
	[RegPassword] [nvarchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[AccountDetails] ON 

INSERT [dbo].[AccountDetails] ([AccountID], [UserID], [LoanID], [AccHolderName], [AccountNumber], [Balance]) VALUES (600001, 1, 1, N'Manikanta', N'125425115', 0.0000)
SET IDENTITY_INSERT [dbo].[AccountDetails] OFF
INSERT [dbo].[Admin] ([AdminId], [AdminPass]) VALUES (N'ADS542', N'NeverPassword4@')
INSERT [dbo].[Admin] ([AdminId], [AdminPass]) VALUES (N'GPD096', N'BusinessHome$#')
INSERT [dbo].[Admin] ([AdminId], [AdminPass]) VALUES (N'ADS542', N'NeverPassword4@')
INSERT [dbo].[Admin] ([AdminId], [AdminPass]) VALUES (N'GPD096', N'BusinessHome$#')
SET IDENTITY_INSERT [dbo].[CoApplicant] ON 

INSERT [dbo].[CoApplicant] ([CoApplicantID], [IncomeID], [Relationship], [CoApplicantName], [ResidencyStatus], [CurrentLiving], [DOB], [TypeOfEmployment]) VALUES (1, 1, N'Brother', N'Rana', N'Indian', N'Chennai', CAST(0xE00E0B00 AS Date), N'Self')
INSERT [dbo].[CoApplicant] ([CoApplicantID], [IncomeID], [Relationship], [CoApplicantName], [ResidencyStatus], [CurrentLiving], [DOB], [TypeOfEmployment]) VALUES (2, 1, N'Father', N'SureshBabu', N'Indian', N'Hyderabad', CAST(0xEBE30A00 AS Date), N'Salaried')
INSERT [dbo].[CoApplicant] ([CoApplicantID], [IncomeID], [Relationship], [CoApplicantName], [ResidencyStatus], [CurrentLiving], [DOB], [TypeOfEmployment]) VALUES (3, 1, N'Brother', N'Rana', N'Indian', N'Chennai', CAST(0xE00E0B00 AS Date), N'Self')
INSERT [dbo].[CoApplicant] ([CoApplicantID], [IncomeID], [Relationship], [CoApplicantName], [ResidencyStatus], [CurrentLiving], [DOB], [TypeOfEmployment]) VALUES (4, 1, N'Father', N'SureshBabu', N'Indian', N'Hyderabad', CAST(0xEBE30A00 AS Date), N'Salaried')
INSERT [dbo].[CoApplicant] ([CoApplicantID], [IncomeID], [Relationship], [CoApplicantName], [ResidencyStatus], [CurrentLiving], [DOB], [TypeOfEmployment]) VALUES (7, 5, N'Brother', N'Midhun', N'Indian', N'Delhi', CAST(0xA7380B00 AS Date), N'Salaried')
INSERT [dbo].[CoApplicant] ([CoApplicantID], [IncomeID], [Relationship], [CoApplicantName], [ResidencyStatus], [CurrentLiving], [DOB], [TypeOfEmployment]) VALUES (8, 5, N'Brother', N'Midhun', N'Indian', N'Delhi', CAST(0xA7380B00 AS Date), N'Salaried')
INSERT [dbo].[CoApplicant] ([CoApplicantID], [IncomeID], [Relationship], [CoApplicantName], [ResidencyStatus], [CurrentLiving], [DOB], [TypeOfEmployment]) VALUES (9, 24, N'Brother', N'Akdhil', N'Indian', N'mumbai', CAST(0x6D200B00 AS Date), N'Salaried')
SET IDENTITY_INSERT [dbo].[CoApplicant] OFF
SET IDENTITY_INSERT [dbo].[CoApplicantSalEmp] ON 

INSERT [dbo].[CoApplicantSalEmp] ([CoApplicantSalID], [CoApplicantID], [EmployerName], [JoiningDate], [GrossMonthlySalary], [TotalEmiMoney], [RetirementAge]) VALUES (1, 1, N'ACCENTURE', CAST(0x62330B00 AS Date), 60000.0000, 5500.0000, 60)
INSERT [dbo].[CoApplicantSalEmp] ([CoApplicantSalID], [CoApplicantID], [EmployerName], [JoiningDate], [GrossMonthlySalary], [TotalEmiMoney], [RetirementAge]) VALUES (2, 1, N'ACCENTURE', CAST(0x62330B00 AS Date), 60000.0000, 5500.0000, 60)
INSERT [dbo].[CoApplicantSalEmp] ([CoApplicantSalID], [CoApplicantID], [EmployerName], [JoiningDate], [GrossMonthlySalary], [TotalEmiMoney], [RetirementAge]) VALUES (3, 7, N'Virtusa', CAST(0xD23F0B00 AS Date), 50000.0000, 1000.0000, 55)
INSERT [dbo].[CoApplicantSalEmp] ([CoApplicantSalID], [CoApplicantID], [EmployerName], [JoiningDate], [GrossMonthlySalary], [TotalEmiMoney], [RetirementAge]) VALUES (4, 9, N'Solaris', CAST(0x373A0B00 AS Date), 500000.0000, 1000.0000, 55)
SET IDENTITY_INSERT [dbo].[CoApplicantSalEmp] OFF
SET IDENTITY_INSERT [dbo].[CoApplicantSelfEmp] ON 

INSERT [dbo].[CoApplicantSelfEmp] ([CoApplicantSEID], [CoApplicantID], [BusinessProfile], [BusinessStartDate], [GrossTurnOver], [Grossprofit], [OtherIncome], [Tax]) VALUES (1, 1, N'Trader', CAST(0x5A390B00 AS Date), 2500000.0000, 500000.0000, 0.0000, 330000.0000)
INSERT [dbo].[CoApplicantSelfEmp] ([CoApplicantSEID], [CoApplicantID], [BusinessProfile], [BusinessStartDate], [GrossTurnOver], [Grossprofit], [OtherIncome], [Tax]) VALUES (2, 1, N'Trader', CAST(0x5A390B00 AS Date), 2500000.0000, 500000.0000, 0.0000, 330000.0000)
SET IDENTITY_INSERT [dbo].[CoApplicantSelfEmp] OFF
SET IDENTITY_INSERT [dbo].[IncomeDetails] ON 

INSERT [dbo].[IncomeDetails] ([IncomeID], [LoanID], [TypeOfEmployment]) VALUES (1, 1, N'Salaried')
INSERT [dbo].[IncomeDetails] ([IncomeID], [LoanID], [TypeOfEmployment]) VALUES (2, 2, N'Self')
INSERT [dbo].[IncomeDetails] ([IncomeID], [LoanID], [TypeOfEmployment]) VALUES (3, 1, N'Salaried')
INSERT [dbo].[IncomeDetails] ([IncomeID], [LoanID], [TypeOfEmployment]) VALUES (4, 2, N'Self')
INSERT [dbo].[IncomeDetails] ([IncomeID], [LoanID], [TypeOfEmployment]) VALUES (5, 6, N'Salaried')
INSERT [dbo].[IncomeDetails] ([IncomeID], [LoanID], [TypeOfEmployment]) VALUES (6, 6, N'Salaried')
INSERT [dbo].[IncomeDetails] ([IncomeID], [LoanID], [TypeOfEmployment]) VALUES (7, 6, N'Salaried')
INSERT [dbo].[IncomeDetails] ([IncomeID], [LoanID], [TypeOfEmployment]) VALUES (8, 6, N'Salaried')
INSERT [dbo].[IncomeDetails] ([IncomeID], [LoanID], [TypeOfEmployment]) VALUES (9, 4, N'Self')
INSERT [dbo].[IncomeDetails] ([IncomeID], [LoanID], [TypeOfEmployment]) VALUES (10, 6, N'Salaried')
INSERT [dbo].[IncomeDetails] ([IncomeID], [LoanID], [TypeOfEmployment]) VALUES (11, 6, N'Salaried')
INSERT [dbo].[IncomeDetails] ([IncomeID], [LoanID], [TypeOfEmployment]) VALUES (12, 5, N'Self')
INSERT [dbo].[IncomeDetails] ([IncomeID], [LoanID], [TypeOfEmployment]) VALUES (13, 6, N'Salaried')
INSERT [dbo].[IncomeDetails] ([IncomeID], [LoanID], [TypeOfEmployment]) VALUES (14, 6, N'Salaried')
INSERT [dbo].[IncomeDetails] ([IncomeID], [LoanID], [TypeOfEmployment]) VALUES (15, 4, N'Self')
INSERT [dbo].[IncomeDetails] ([IncomeID], [LoanID], [TypeOfEmployment]) VALUES (16, 2, N'Self')
INSERT [dbo].[IncomeDetails] ([IncomeID], [LoanID], [TypeOfEmployment]) VALUES (17, 2, N'Salaried')
INSERT [dbo].[IncomeDetails] ([IncomeID], [LoanID], [TypeOfEmployment]) VALUES (18, 6, N'Salaried')
INSERT [dbo].[IncomeDetails] ([IncomeID], [LoanID], [TypeOfEmployment]) VALUES (19, 6, N'Salaried')
INSERT [dbo].[IncomeDetails] ([IncomeID], [LoanID], [TypeOfEmployment]) VALUES (20, 6, N'Salaried')
INSERT [dbo].[IncomeDetails] ([IncomeID], [LoanID], [TypeOfEmployment]) VALUES (21, 6, N'Salaried')
INSERT [dbo].[IncomeDetails] ([IncomeID], [LoanID], [TypeOfEmployment]) VALUES (22, 6, N'Self')
INSERT [dbo].[IncomeDetails] ([IncomeID], [LoanID], [TypeOfEmployment]) VALUES (24, 7, N'Salaried')
SET IDENTITY_INSERT [dbo].[IncomeDetails] OFF
SET IDENTITY_INSERT [dbo].[LoanDetails] ON 

INSERT [dbo].[LoanDetails] ([LoanID], [UserID], [DocVerified], [LoanApproved], [InterestRate], [LoanAmount], [LoanDate]) VALUES (1, NULL, N'Verified', N'Approved', 8.5, 750000.0000, CAST(0x00000000 AS Date))
INSERT [dbo].[LoanDetails] ([LoanID], [UserID], [DocVerified], [LoanApproved], [InterestRate], [LoanAmount], [LoanDate]) VALUES (2, 2, N'Pending', N'Approved', 8.5, 600000.0000, CAST(0xCA400B00 AS Date))
INSERT [dbo].[LoanDetails] ([LoanID], [UserID], [DocVerified], [LoanApproved], [InterestRate], [LoanAmount], [LoanDate]) VALUES (3, 3, N'Pending', N'Approved', 8.5, 750000.0000, CAST(0x97400B00 AS Date))
INSERT [dbo].[LoanDetails] ([LoanID], [UserID], [DocVerified], [LoanApproved], [InterestRate], [LoanAmount], [LoanDate]) VALUES (4, 1, N'Pending', N'Approved', 8.5, 500000.0000, CAST(0xC7400B00 AS Date))
INSERT [dbo].[LoanDetails] ([LoanID], [UserID], [DocVerified], [LoanApproved], [InterestRate], [LoanAmount], [LoanDate]) VALUES (5, 2, N'Pending', N'Pending', 8.5, 600000.0000, CAST(0xCA400B00 AS Date))
INSERT [dbo].[LoanDetails] ([LoanID], [UserID], [DocVerified], [LoanApproved], [InterestRate], [LoanAmount], [LoanDate]) VALUES (6, 7, N'Pending', N'Approved', 8.5, 0.0000, CAST(0xCB400B00 AS Date))
INSERT [dbo].[LoanDetails] ([LoanID], [UserID], [DocVerified], [LoanApproved], [InterestRate], [LoanAmount], [LoanDate]) VALUES (7, 12, N'Pending', N'Pending', 8.5, 650000.0000, CAST(0x5D3E0B00 AS Date))
SET IDENTITY_INSERT [dbo].[LoanDetails] OFF
SET IDENTITY_INSERT [dbo].[PersonalDetails] ON 

INSERT [dbo].[PersonalDetails] ([PersonalID], [UserID], [DOB], [Age], [Gender], [ResidencyStatus], [PermanentAddress], [PermanentPincode], [CurrentAddress], [CurrentPincode], [AadharCardNum], [PanCardNum]) VALUES (1, 1, CAST(0x1E210B00 AS Date), N'22', N'Male      ', N'Indian    ', N'H.no:8-39, Vejandla, Guntur', N'522213', N'Flat.No.309,Kvr Appartment, Khammam', N'507002', N'882513993353', N'FTJ8648522')
INSERT [dbo].[PersonalDetails] ([PersonalID], [UserID], [DOB], [Age], [Gender], [ResidencyStatus], [PermanentAddress], [PermanentPincode], [CurrentAddress], [CurrentPincode], [AadharCardNum], [PanCardNum]) VALUES (2, 2, CAST(0xA8200B00 AS Date), N'22', N'Male      ', N'Indian    ', N'H.no:5-1, Warangal', N'506001', N'H.no:5-1, Warangal', N'506001', N'679132000166', N'BAJ6745896')
INSERT [dbo].[PersonalDetails] ([PersonalID], [UserID], [DOB], [Age], [Gender], [ResidencyStatus], [PermanentAddress], [PermanentPincode], [CurrentAddress], [CurrentPincode], [AadharCardNum], [PanCardNum]) VALUES (3, 3, CAST(0x491B0B00 AS Date), N'27', N'Male      ', N'Indian    ', N'Hyderabad', N'500081', N'chennai', N'600089', N'882513993353', N'FTHF105666')
INSERT [dbo].[PersonalDetails] ([PersonalID], [UserID], [DOB], [Age], [Gender], [ResidencyStatus], [PermanentAddress], [PermanentPincode], [CurrentAddress], [CurrentPincode], [AadharCardNum], [PanCardNum]) VALUES (4, 4, CAST(0x881D0B00 AS Date), N'25', N'Male      ', N'Indian    ', N'Dhone,Kurnool', N'501245', N'Bangalore', N'624512', N'629932445698', N'FTHF105666')
INSERT [dbo].[PersonalDetails] ([PersonalID], [UserID], [DOB], [Age], [Gender], [ResidencyStatus], [PermanentAddress], [PermanentPincode], [CurrentAddress], [CurrentPincode], [AadharCardNum], [PanCardNum]) VALUES (7, 8, CAST(0x871D0B00 AS Date), N'25', N'Male      ', N'Indian    ', N'Ongole', N'601542', N'vijayawada', N'421442', N'882565479988', N'FTJU541254')
INSERT [dbo].[PersonalDetails] ([PersonalID], [UserID], [DOB], [Age], [Gender], [ResidencyStatus], [PermanentAddress], [PermanentPincode], [CurrentAddress], [CurrentPincode], [AadharCardNum], [PanCardNum]) VALUES (8, 6, CAST(0xB11A0B00 AS Date), N'27', N'Male      ', N'Indian    ', N'Kurnool', N'564122', N'Vijayawada', N'512456', N'882401669895', N'FTJF024574')
INSERT [dbo].[PersonalDetails] ([PersonalID], [UserID], [DOB], [Age], [Gender], [ResidencyStatus], [PermanentAddress], [PermanentPincode], [CurrentAddress], [CurrentPincode], [AadharCardNum], [PanCardNum]) VALUES (10, 7, CAST(0x09180B00 AS Date), N'29', N'Male      ', N'Indian    ', N'Hyderabad', N'500010', N'chennai', N'600089', N'451296357845', N'AGFJ786524')
INSERT [dbo].[PersonalDetails] ([PersonalID], [UserID], [DOB], [Age], [Gender], [ResidencyStatus], [PermanentAddress], [PermanentPincode], [CurrentAddress], [CurrentPincode], [AadharCardNum], [PanCardNum]) VALUES (12, 11, CAST(0xF61E0B00 AS Date), N'25', N'Male      ', N'Indian    ', N'Bengal', N'541564', N'Chennai', N'600089', N'987456985472', N'RCG458746')
INSERT [dbo].[PersonalDetails] ([PersonalID], [UserID], [DOB], [Age], [Gender], [ResidencyStatus], [PermanentAddress], [PermanentPincode], [CurrentAddress], [CurrentPincode], [AadharCardNum], [PanCardNum]) VALUES (13, 9, CAST(0x84200B00 AS Date), N'23', N'Male      ', N'Indian    ', N'Warangal', N'507050', N'Kerala', N'652140', N'884587459654', N'DGF784596')
INSERT [dbo].[PersonalDetails] ([PersonalID], [UserID], [DOB], [Age], [Gender], [ResidencyStatus], [PermanentAddress], [PermanentPincode], [CurrentAddress], [CurrentPincode], [AadharCardNum], [PanCardNum]) VALUES (14, 12, CAST(0x871A0B00 AS Date), N'26', N'Male      ', N'Indian    ', N'Delhi', N'654120', N'Bengal', N'451236', N'897456985475', N'DTH456123')
SET IDENTITY_INSERT [dbo].[PersonalDetails] OFF
SET IDENTITY_INSERT [dbo].[SalariedApplicant] ON 

INSERT [dbo].[SalariedApplicant] ([SalaryID], [IncomeID], [EmployerName], [OrganisationType], [WorkingExperience], [CurrentIncome]) VALUES (1, 1, N'LTI', N'Service', 1, 450000.0000)
INSERT [dbo].[SalariedApplicant] ([SalaryID], [IncomeID], [EmployerName], [OrganisationType], [WorkingExperience], [CurrentIncome]) VALUES (2, 1, N'LTI', N'Service', 1, 450000.0000)
INSERT [dbo].[SalariedApplicant] ([SalaryID], [IncomeID], [EmployerName], [OrganisationType], [WorkingExperience], [CurrentIncome]) VALUES (6, 6, N'IBM', N'Service', 2, 550000.0000)
INSERT [dbo].[SalariedApplicant] ([SalaryID], [IncomeID], [EmployerName], [OrganisationType], [WorkingExperience], [CurrentIncome]) VALUES (7, NULL, N'Boat', N'Service', 2, 600000.0000)
INSERT [dbo].[SalariedApplicant] ([SalaryID], [IncomeID], [EmployerName], [OrganisationType], [WorkingExperience], [CurrentIncome]) VALUES (8, 6, N'Accenture', N'Service', 2, 450000.0000)
INSERT [dbo].[SalariedApplicant] ([SalaryID], [IncomeID], [EmployerName], [OrganisationType], [WorkingExperience], [CurrentIncome]) VALUES (9, 24, N'Newton', N'Service', 2, 500000.0000)
SET IDENTITY_INSERT [dbo].[SalariedApplicant] OFF
SET IDENTITY_INSERT [dbo].[SelfEmployed] ON 

INSERT [dbo].[SelfEmployed] ([SelfID], [IncomeID], [BusinessProfile], [BusinessStartDate], [GrossTurnOver], [Grossprofit], [OtherIncome], [Tax]) VALUES (1, 2, N'Trader', CAST(0xA53D0B00 AS Date), 2500000.0000, 500000.0000, 0.0000, 330000.0000)
INSERT [dbo].[SelfEmployed] ([SelfID], [IncomeID], [BusinessProfile], [BusinessStartDate], [GrossTurnOver], [Grossprofit], [OtherIncome], [Tax]) VALUES (2, 2, N'Trader', CAST(0xA53D0B00 AS Date), 2500000.0000, 500000.0000, 0.0000, 330000.0000)
INSERT [dbo].[SelfEmployed] ([SelfID], [IncomeID], [BusinessProfile], [BusinessStartDate], [GrossTurnOver], [Grossprofit], [OtherIncome], [Tax]) VALUES (3, 5, N'Trader', CAST(0x35370B00 AS Date), 2500000.0000, 500000.0000, 12000.0000, 21000.0000)
SET IDENTITY_INSERT [dbo].[SelfEmployed] OFF
SET IDENTITY_INSERT [dbo].[UserRegister] ON 

INSERT [dbo].[UserRegister] ([UserID], [UserName], [FirstName], [LastName], [Email], [MobileNumber], [RegPassword]) VALUES (1, N'Mani', N'Manikanta', N'Munnangi', N'manimannu93@gmail.com', N'9751198762', N'Munnangi1@')
INSERT [dbo].[UserRegister] ([UserID], [UserName], [FirstName], [LastName], [Email], [MobileNumber], [RegPassword]) VALUES (2, N'Akhil', N'Akhil Reddy', N'Banda', N'Akhilreddy@gmail.com', N'9887659601', N'Akhil21@')
INSERT [dbo].[UserRegister] ([UserID], [UserName], [FirstName], [LastName], [Email], [MobileNumber], [RegPassword]) VALUES (3, N'Deepu', N'Deepak', N'Kumar', N'Deepak12@gmail.com', N'9854125463', N'Deepak21@')
INSERT [dbo].[UserRegister] ([UserID], [UserName], [FirstName], [LastName], [Email], [MobileNumber], [RegPassword]) VALUES (4, N'Musti', N'Mustafa', N'Shaik', N'Mustafabasha@gmail.com', N'9586475125', N'Mustaffa1@')
INSERT [dbo].[UserRegister] ([UserID], [UserName], [FirstName], [LastName], [Email], [MobileNumber], [RegPassword]) VALUES (5, N'Mani', N'Manikanta', N'Munnangi', N'manimannu93@gmail.com', N'9751198762', N'Munnangi1@')
INSERT [dbo].[UserRegister] ([UserID], [UserName], [FirstName], [LastName], [Email], [MobileNumber], [RegPassword]) VALUES (6, N'Akhil', N'Akhil Reddy', N'Banda', N'Akhilreddy@gmail.com', N'9887659601', N'Akhil21@')
INSERT [dbo].[UserRegister] ([UserID], [UserName], [FirstName], [LastName], [Email], [MobileNumber], [RegPassword]) VALUES (7, N'Guna', N'Guna', N'Sekhar', N'Gnanu123@gmail.com', N'9854125698', N'Guna123#')
INSERT [dbo].[UserRegister] ([UserID], [UserName], [FirstName], [LastName], [Email], [MobileNumber], [RegPassword]) VALUES (8, N'Vamsi', N'Vamsi', N'Krishna', N'VamsiKrishna12@gmail.com', N'9654158745', N'Vamsi1234@')
INSERT [dbo].[UserRegister] ([UserID], [UserName], [FirstName], [LastName], [Email], [MobileNumber], [RegPassword]) VALUES (9, N'sushu', N'Sushanth', N'Shetty', N'sushanthshetty@gmail.com', N'6589745682', N'Sushanth1@')
INSERT [dbo].[UserRegister] ([UserID], [UserName], [FirstName], [LastName], [Email], [MobileNumber], [RegPassword]) VALUES (10, N'venkat', N'venkat', N'yelchuri', N'venkat@gmail.com', N'9632105487', N'Venkat@143')
INSERT [dbo].[UserRegister] ([UserID], [UserName], [FirstName], [LastName], [Email], [MobileNumber], [RegPassword]) VALUES (11, N'Rahul', N'Ragul', N'Tiwari', N'RahulTiwari12@gmail.com', N'9874589654', N'Rahultiwa12@')
INSERT [dbo].[UserRegister] ([UserID], [UserName], [FirstName], [LastName], [Email], [MobileNumber], [RegPassword]) VALUES (12, N'Vivek', N'Vivek ', N'Kumar', N'vivekkumar@gmail.com', N'9874569874', N'Vivekkuma1@')
SET IDENTITY_INSERT [dbo].[UserRegister] OFF
/****** Object:  Index [UQ__Personal__1788CCAD6C5ECF21]    Script Date: 2/26/2020 1:12:16 PM ******/
ALTER TABLE [dbo].[PersonalDetails] ADD UNIQUE NONCLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LoanDetails] ADD  DEFAULT ('Pending') FOR [DocVerified]
GO
ALTER TABLE [dbo].[LoanDetails] ADD  DEFAULT ('Pending') FOR [LoanApproved]
GO
ALTER TABLE [dbo].[AccountDetails]  WITH CHECK ADD FOREIGN KEY([LoanID])
REFERENCES [dbo].[LoanDetails] ([LoanID])
GO
ALTER TABLE [dbo].[AccountDetails]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[UserRegister] ([UserID])
GO
ALTER TABLE [dbo].[CoApplicant]  WITH CHECK ADD FOREIGN KEY([IncomeID])
REFERENCES [dbo].[IncomeDetails] ([IncomeID])
GO
ALTER TABLE [dbo].[CoApplicantSalEmp]  WITH CHECK ADD FOREIGN KEY([CoApplicantID])
REFERENCES [dbo].[CoApplicant] ([CoApplicantID])
GO
ALTER TABLE [dbo].[CoApplicantSelfEmp]  WITH CHECK ADD FOREIGN KEY([CoApplicantID])
REFERENCES [dbo].[CoApplicant] ([CoApplicantID])
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD FOREIGN KEY([LoanID])
REFERENCES [dbo].[LoanDetails] ([LoanID])
GO
ALTER TABLE [dbo].[IncomeDetails]  WITH CHECK ADD FOREIGN KEY([LoanID])
REFERENCES [dbo].[LoanDetails] ([LoanID])
GO
ALTER TABLE [dbo].[LoanDetails]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[UserRegister] ([UserID])
GO
ALTER TABLE [dbo].[PersonalDetails]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[UserRegister] ([UserID])
GO
ALTER TABLE [dbo].[PropertyDetails]  WITH CHECK ADD FOREIGN KEY([LoanID])
REFERENCES [dbo].[LoanDetails] ([LoanID])
GO
ALTER TABLE [dbo].[SalariedApplicant]  WITH CHECK ADD FOREIGN KEY([IncomeID])
REFERENCES [dbo].[IncomeDetails] ([IncomeID])
GO
ALTER TABLE [dbo].[SelfEmployed]  WITH CHECK ADD FOREIGN KEY([IncomeID])
REFERENCES [dbo].[IncomeDetails] ([IncomeID])
GO
ALTER TABLE [dbo].[CoApplicant]  WITH CHECK ADD CHECK  (([Relationship]='Daughter' OR [Relationship]='Son' OR [Relationship]='FatherInLaw' OR [Relationship]='BrotherInLaw' OR [Relationship]='Spouse' OR [Relationship]='Mother' OR [Relationship]='Father' OR [Relationship]='Sister' OR [Relationship]='Brother'))
GO
ALTER TABLE [dbo].[CoApplicant]  WITH CHECK ADD CHECK  (([ResidencyStatus]='Other' OR [ResidencyStatus]='Indian'))
GO
ALTER TABLE [dbo].[CoApplicant]  WITH CHECK ADD CHECK  (([TypeOfEmployment]='Self' OR [TypeOfEmployment]='Salaried'))
GO
ALTER TABLE [dbo].[CoApplicantSelfEmp]  WITH CHECK ADD CHECK  (([Businessprofile]='Manufacturer' OR [Businessprofile]='Service Provider' OR [Businessprofile]='Trader'))
GO
ALTER TABLE [dbo].[IncomeDetails]  WITH CHECK ADD CHECK  (([TypeOfEmployment]='Self' OR [TypeOfEmployment]='Salaried'))
GO
ALTER TABLE [dbo].[LoanDetails]  WITH CHECK ADD CHECK  (([DocVerified]='Pending' OR [DocVerified]='Verified'))
GO
ALTER TABLE [dbo].[LoanDetails]  WITH CHECK ADD CHECK  (([LoanApproved]='Pending' OR [LoanApproved]='Approved'))
GO
ALTER TABLE [dbo].[PersonalDetails]  WITH CHECK ADD CHECK  (([Gender]='Others' OR [Gender]='Female' OR [Gender]='Male'))
GO
ALTER TABLE [dbo].[PersonalDetails]  WITH CHECK ADD CHECK  (([ResidencyStatus]='Other' OR [ResidencyStatus]='Indian'))
GO
ALTER TABLE [dbo].[PropertyDetails]  WITH CHECK ADD CHECK  (([TotalEstimatedAmount]>(500000)))
GO
ALTER TABLE [dbo].[SalariedApplicant]  WITH CHECK ADD CHECK  (([CurrentIncome]>(400000)))
GO
ALTER TABLE [dbo].[SalariedApplicant]  WITH CHECK ADD CHECK  (([WorkingExperience]>=(1)))
GO
ALTER TABLE [dbo].[SelfEmployed]  WITH CHECK ADD CHECK  (([Businessprofile]='Manufacturer' OR [Businessprofile]='Service Provider' OR [Businessprofile]='Trader'))
GO
ALTER TABLE [dbo].[UserRegister]  WITH CHECK ADD CHECK  (([Email] like '%_@__%.__%'))
GO
ALTER TABLE [dbo].[UserRegister]  WITH CHECK ADD CHECK  (([MobileNumber] like replicate('[0-9]',(10))))
GO
ALTER TABLE [dbo].[UserRegister]  WITH CHECK ADD CHECK  (([RegPassword] like '%[0-9]%' AND [RegPassword] like '%[A-Z]%' collate Latin1_General_BIN2 AND [RegPassword] like '%[a-z]%' AND [RegPassword] like '%[~!@#$%^&*(),.;:]%' AND (len([RegPassword])>=(8) AND len([RegPassword])<=(15))))
GO
USE [master]
GO
ALTER DATABASE [HomeLoans] SET  READ_WRITE 
GO
