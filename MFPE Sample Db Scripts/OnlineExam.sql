USE [master]
GO
/****** Object:  Database [OnlineExamination]    Script Date: 2/24/2020 9:31:46 AM ******/
CREATE DATABASE [OnlineExamination]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineExamination', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\OnlineExamination.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'OnlineExamination_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\OnlineExamination_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [OnlineExamination] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineExamination].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineExamination] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineExamination] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineExamination] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineExamination] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineExamination] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineExamination] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineExamination] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineExamination] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineExamination] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineExamination] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineExamination] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineExamination] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineExamination] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineExamination] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineExamination] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineExamination] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OnlineExamination] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineExamination] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineExamination] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineExamination] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineExamination] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineExamination] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineExamination] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineExamination] SET RECOVERY FULL 
GO
ALTER DATABASE [OnlineExamination] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineExamination] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineExamination] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineExamination] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineExamination] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'OnlineExamination', N'ON'
GO
USE [OnlineExamination]
GO
/****** Object:  Table [dbo].[LoginDetails]    Script Date: 2/24/2020 9:31:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoginDetails](
	[UserID] [int] IDENTITY(10000,1) NOT NULL,
	[UserName] [varchar](30) NOT NULL,
	[Email] [varchar](30) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[City] [varchar](20) NOT NULL,
	[DOB] [date] NOT NULL,
	[State] [varchar](15) NOT NULL,
	[Mobile] [varchar](15) NOT NULL,
	[Qualification] [varchar](20) NOT NULL,
	[Year_of_completion] [int] NOT NULL,
	[Type] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 2/24/2020 9:31:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Questions](
	[QuestionNumber] [int] IDENTITY(1,1) NOT NULL,
	[Question] [varchar](max) NOT NULL,
	[option1] [varchar](max) NULL,
	[option2] [varchar](max) NULL,
	[option3] [varchar](max) NULL,
	[option4] [varchar](max) NULL,
	[level] [int] NOT NULL,
	[TechnologyID] [int] NULL,
	[correct_answer] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[QuestionNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reports]    Script Date: 2/24/2020 9:31:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reports](
	[ExamID] [int] IDENTITY(100,1) NOT NULL,
	[UserID] [int] NULL,
	[marksL1] [int] NOT NULL,
	[marksL2] [int] NULL,
	[marksL3] [int] NULL,
	[TechnologyID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ExamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Technology]    Script Date: 2/24/2020 9:31:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Technology](
	[TechnologyID] [int] IDENTITY(1,1) NOT NULL,
	[TechnologyName] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TechnologyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD FOREIGN KEY([TechnologyID])
REFERENCES [dbo].[Technology] ([TechnologyID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD FOREIGN KEY([TechnologyID])
REFERENCES [dbo].[Technology] ([TechnologyID])
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[LoginDetails] ([UserID])
GO
USE [master]
GO
ALTER DATABASE [OnlineExamination] SET  READ_WRITE 
GO
