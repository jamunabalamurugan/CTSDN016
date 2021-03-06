USE [master]
GO
/****** Object:  Database [dbMovieShop]    Script Date: 6/2/2021 6:00:29 PM ******/
CREATE DATABASE [dbMovieShop]
GO

ALTER DATABASE [dbMovieShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbMovieShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbMovieShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbMovieShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbMovieShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbMovieShop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [dbMovieShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbMovieShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbMovieShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbMovieShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbMovieShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbMovieShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbMovieShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbMovieShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbMovieShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbMovieShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbMovieShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbMovieShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbMovieShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbMovieShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbMovieShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbMovieShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbMovieShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbMovieShop] SET  MULTI_USER 
GO
ALTER DATABASE [dbMovieShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbMovieShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbMovieShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbMovieShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbMovieShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbMovieShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [dbMovieShop] SET QUERY_STORE = OFF
GO
USE [dbMovieShop]
GO



/****** Object:  Table [dbo].[tblDisc]    Script Date: 6/2/2021 6:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDisc](
	[id] [int] IDENTITY(101,1) NOT NULL,
	[movie_id] [int] NULL,
	[rent_cost] [float] NULL,
	[is_Available] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMovie]    Script Date: 6/2/2021 6:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMovie](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NULL,
	[duration] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserData]    Script Date: 6/2/2021 6:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserData](
	[username] [varchar](20) NOT NULL,
	[password] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Person] ([DID], [name], [address]) VALUES (1, N'Kavin', N'Bangalore')
INSERT [dbo].[Person] ([DID], [name], [address]) VALUES (2, N'Kanav', N'Bangalore')
INSERT [dbo].[Person] ([DID], [name], [address]) VALUES (3, N'Kumar', N'Chennai')
INSERT [dbo].[Person] ([DID], [name], [address]) VALUES (4, N'Arun', N'Chennai')
INSERT [dbo].[Person] ([DID], [name], [address]) VALUES (5, N'Bala', N'Chennai')
GO
SET IDENTITY_INSERT [dbo].[tblDisc] ON 

INSERT [dbo].[tblDisc] ([id], [movie_id], [rent_cost], [is_Available]) VALUES (101, 1, 50, 1)
INSERT [dbo].[tblDisc] ([id], [movie_id], [rent_cost], [is_Available]) VALUES (102, 2, 40, 1)
INSERT [dbo].[tblDisc] ([id], [movie_id], [rent_cost], [is_Available]) VALUES (103, 1, 30, 1)
SET IDENTITY_INSERT [dbo].[tblDisc] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMovie] ON 

INSERT [dbo].[tblMovie] ([id], [name], [duration]) VALUES (1, N'A-Team', 1.5)
INSERT [dbo].[tblMovie] ([id], [name], [duration]) VALUES (2, N'Master', 3)
INSERT [dbo].[tblMovie] ([id], [name], [duration]) VALUES (4, N'MI', 110)
INSERT [dbo].[tblMovie] ([id], [name], [duration]) VALUES (6, N'Expendables', 45)
INSERT [dbo].[tblMovie] ([id], [name], [duration]) VALUES (8, N'Finding Nemo', 2)
INSERT [dbo].[tblMovie] ([id], [name], [duration]) VALUES (9, N'Dhrishyam-2', 2)
INSERT [dbo].[tblMovie] ([id], [name], [duration]) VALUES (10, N'Bigil', 3)
SET IDENTITY_INSERT [dbo].[tblMovie] OFF
GO
INSERT [dbo].[UserData] ([username], [password]) VALUES (N'Aravindhan', N'1111')
INSERT [dbo].[UserData] ([username], [password]) VALUES (N'Arun', N'6666')
INSERT [dbo].[UserData] ([username], [password]) VALUES (N'Bala', N'8888')
INSERT [dbo].[UserData] ([username], [password]) VALUES (N'DN016', N'2405')
INSERT [dbo].[UserData] ([username], [password]) VALUES (N'Harshi', N'1010')
INSERT [dbo].[UserData] ([username], [password]) VALUES (N'jamunabalamurugan', N'1111')
INSERT [dbo].[UserData] ([username], [password]) VALUES (N'Joshi', N'1111')
INSERT [dbo].[UserData] ([username], [password]) VALUES (N'Kanav', N'1234')
INSERT [dbo].[UserData] ([username], [password]) VALUES (N'Kavin', N'1234')
INSERT [dbo].[UserData] ([username], [password]) VALUES (N'ram', N'1234')
INSERT [dbo].[UserData] ([username], [password]) VALUES (N'Saadhana', N'1111')
INSERT [dbo].[UserData] ([username], [password]) VALUES (N'Saahithya', N'chocolate')
INSERT [dbo].[UserData] ([username], [password]) VALUES (N'Sumedha', N'1234')
GO
ALTER TABLE [dbo].[tblDisc] ADD  DEFAULT ((1)) FOR [is_Available]
GO
ALTER TABLE [dbo].[Ownscar]  WITH CHECK ADD FOREIGN KEY([DID])
REFERENCES [dbo].[Person] ([DID])
GO
ALTER TABLE [dbo].[tblDisc]  WITH CHECK ADD  CONSTRAINT [fk_mid] FOREIGN KEY([movie_id])
REFERENCES [dbo].[tblMovie] ([id])
GO
ALTER TABLE [dbo].[tblDisc] CHECK CONSTRAINT [fk_mid]
GO
USE [master]
GO
ALTER DATABASE [dbMovieShop] SET  READ_WRITE 
GO
