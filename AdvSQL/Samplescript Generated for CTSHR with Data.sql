USE [CTSHR]
GO
/****** Object:  UserDefinedFunction [dbo].[fun_callinganotherfunction1]    Script Date: 5/14/2021 11:26:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fun_callinganotherfunction1](@did int)
 returns nvarchar(200)
 as
 begin
 return(select name  from dbo.fun_empdept14(@did) )
 
 end
GO
/****** Object:  UserDefinedFunction [dbo].[funEmplNameCity]    Script Date: 5/14/2021 11:26:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create function [dbo].[funEmplNameCity](@Name nvarchar(30),@city nvarchar(30))
 returns nvarchar(100)
 as
 begin
 return (select @Name+' '+@City)
 end
GO
/****** Object:  UserDefinedFunction [dbo].[funTaxCalculation]    Script Date: 5/14/2021 11:26:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create function [dbo].[funTaxCalculation](@id int)
 returns money
 as
 begin
 declare @Annualsalary money
declare @Taxamount money
set @Annualsalary = (select salary*12 from tblEmployeeInfo where id=@id)
if(@Annualsalary>400000)
   begin
   set @Taxamount=@Annualsalary*0.1
  -- return @Taxamount
   end
else
   begin
 set @Taxamount= 0
   end
   return @Taxamount
  End
GO
/****** Object:  Table [dbo].[tblEmployeeInfo]    Script Date: 5/14/2021 11:26:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployeeInfo](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Location] [nvarchar](30) NULL,
	[DepId] [int] NULL,
	[Managerid] [int] NULL,
	[salary] [money] NULL,
	[hiredate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fun_empdept14]    Script Date: 5/14/2021 11:26:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create function [dbo].[fun_empdept14](@did int)
  returns table
  as
  return(select * from tblEmployeeInfo where depid=@did )
GO
/****** Object:  Table [dbo].[departments]    Script Date: 5/14/2021 11:26:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departments](
	[department_id] [int] NOT NULL,
	[depname] [varchar](40) NOT NULL,
	[mgrid] [char](10) NULL,
	[location_id] [int] NULL,
 CONSTRAINT [department_pk] PRIMARY KEY CLUSTERED 
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employees]    Script Date: 5/14/2021 11:26:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[employee_id] [int] NOT NULL,
	[first_name] [varchar](20) NULL,
	[last_name] [varchar](25) NOT NULL,
	[email] [varchar](25) NOT NULL,
	[phone_number] [varchar](20) NULL,
	[hire_date] [datetime] NOT NULL,
	[job_id] [varchar](10) NOT NULL,
	[salary] [int] NULL,
	[commission_pct] [int] NULL,
	[manager_id] [int] NULL,
	[department_id] [int] NULL,
 CONSTRAINT [myemployees_pk] PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/14/2021 11:26:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderNo] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Qty] [int] NULL,
	[ProductCost] [money] NULL,
	[Tax] [float] NULL,
	[OrderCost] [money] NULL,
	[employeeid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderNo] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sampleEmployee]    Script Date: 5/14/2021 11:26:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sampleEmployee](
	[id] [int] NULL,
	[name] [varchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDepartment]    Script Date: 5/14/2021 11:26:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDepartment](
	[DepId] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DepId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[departments] ([department_id], [depname], [mgrid], [location_id]) VALUES (1, N'ADMIN', NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderNo], [ProductId], [Qty], [ProductCost], [Tax], [OrderCost], [employeeid]) VALUES (1001, 3, 10, 35.0000, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderNo], [ProductId], [Qty], [ProductCost], [Tax], [OrderCost], [employeeid]) VALUES (1001, 4, 10, 35.0000, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderNo], [ProductId], [Qty], [ProductCost], [Tax], [OrderCost], [employeeid]) VALUES (1002, 3, 10, 35.0000, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderNo], [ProductId], [Qty], [ProductCost], [Tax], [OrderCost], [employeeid]) VALUES (1002, 4, 10, 35.0000, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderNo], [ProductId], [Qty], [ProductCost], [Tax], [OrderCost], [employeeid]) VALUES (1003, 3, 10, 35.0000, NULL, NULL, 1001)
INSERT [dbo].[Orders] ([OrderNo], [ProductId], [Qty], [ProductCost], [Tax], [OrderCost], [employeeid]) VALUES (1004, 10, 4, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblDepartment] ([DepId], [Name]) VALUES (2, N'Finance')
INSERT [dbo].[tblDepartment] ([DepId], [Name]) VALUES (3, N'IT')
INSERT [dbo].[tblDepartment] ([DepId], [Name]) VALUES (5, N'HR')
GO
INSERT [dbo].[tblEmployeeInfo] ([Id], [Name], [Location], [DepId], [Managerid], [salary], [hiredate]) VALUES (1001, N'Kavin', N'Bangalore', 2, NULL, 300000.0000, CAST(N'2021-05-14T10:28:45.193' AS DateTime))
INSERT [dbo].[tblEmployeeInfo] ([Id], [Name], [Location], [DepId], [Managerid], [salary], [hiredate]) VALUES (1002, N'Kanav', N'Bangalore', 2, 1001, 250000.0000, NULL)
INSERT [dbo].[tblEmployeeInfo] ([Id], [Name], [Location], [DepId], [Managerid], [salary], [hiredate]) VALUES (1003, N'Saadhana', N'Bangalore', 3, 1002, 250000.0000, NULL)
INSERT [dbo].[tblEmployeeInfo] ([Id], [Name], [Location], [DepId], [Managerid], [salary], [hiredate]) VALUES (1004, N'Joshitha', N'Bangalore', 3, 1002, 250100.0000, NULL)
INSERT [dbo].[tblEmployeeInfo] ([Id], [Name], [Location], [DepId], [Managerid], [salary], [hiredate]) VALUES (1014, N'Divya', N'Goa', NULL, 1002, 30000.0000, NULL)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__employee__AB6E6164CF62B129]    Script Date: 5/14/2021 11:26:12 AM ******/
ALTER TABLE [dbo].[employees] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD FOREIGN KEY([department_id])
REFERENCES [dbo].[departments] ([department_id])
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD FOREIGN KEY([manager_id])
REFERENCES [dbo].[employees] ([employee_id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([employeeid])
REFERENCES [dbo].[tblEmployeeInfo] ([Id])
GO
ALTER TABLE [dbo].[tblEmployeeInfo]  WITH CHECK ADD FOREIGN KEY([DepId])
REFERENCES [dbo].[tblDepartment] ([DepId])
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD CHECK  (([hire_date]<getdate()))
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD CHECK  (([salary]>(0)))
GO
/****** Object:  StoredProcedure [dbo].[prcdeptcount]    Script Date: 5/14/2021 11:26:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[prcdeptcount]
as
begin
return(select count(depid) from tblDepartment)
end
GO
/****** Object:  StoredProcedure [dbo].[prcErrorHandling]    Script Date: 5/14/2021 11:26:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prcErrorHandling](@id int)
as
begin
begin try
if not exists(select name from tblEmployeeInfo
where id=@id)
begin
	raiserror(50010,10,1)
	return
end
else
begin
	update tblEmployeeInfo set Salary=Salary+100 where id=@id
end
End try
begin catch
 --SELECT ERROR_STATE() AS Error_Stat,ERROR_SEVERITY() AS ErrorSeverity,
-- ERROR_LINE() as ErrorLine, ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMsg;  
--select ERROR_SEVERITY()
	Raiserror(15600,6,1,'Invalid operation')
End Catch
End
GO
/****** Object:  StoredProcedure [dbo].[prcoutparameter]    Script Date: 5/14/2021 11:26:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[prcoutparameter](@did int,@result nvarchar(50) output)
as
begin
set @result=(select Name from tblDepartment
where depid=@did )

end
GO
/****** Object:  StoredProcedure [dbo].[prcoutparameter2]    Script Date: 5/14/2021 11:26:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prcoutparameter2](@did int ,@result int output,@result1 int output)
as
begin
set @result=(select count(depid) from tblEmployeeInfo
where depid=@did
group by depid)

set @result1=(select max(id) from tblEmployeeInfo
where depid=@did
group by depid)
end
GO
/****** Object:  StoredProcedure [dbo].[prcTaxCalculator]    Script Date: 5/14/2021 11:26:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prcTaxCalculator](@id int)
as
begin
declare @Annualsalary int
declare @Taxamount int

set @Annualsalary = (select salary*12 from tblEmployeeInfo where id=@id)
if(@Annualsalary>200000)
   begin
   set @Taxamount=@Annualsalary*0.1
   print @Taxamount
   end
else
   begin
   print cast(@id as nvarchar(20))+' ' +'Not eligible to pay tax'
   end

end
GO
