USE [EmployeeBackgroundDB]
GO
/****** Object:  Table [dbo].[tblEmployees]    Script Date: 03/10/2018 10:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblEmployees](
	[EmpId] [int] IDENTITY(1,1) NOT NULL,
	[EmpName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Address] [varchar](max) NULL,
	[MobileNo] [varchar](50) NULL,
	[EmailId] [varchar](50) NULL,
	[Photo] [varchar](50) NULL,
	[DOB] [varchar](50) NULL,
	[Qualification] [varchar](50) NULL,
	[AadharCardNo] [varchar](50) NULL,
	[Date] [varchar](50) NULL,
 CONSTRAINT [PK_tblEmployees] PRIMARY KEY CLUSTERED 
(
	[EmpId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblAdmin]    Script Date: 03/10/2018 10:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblAdmin](
	[AdminId] [varchar](50) NOT NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_tblAdmin] PRIMARY KEY CLUSTERED 
(
	[AdminId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCities]    Script Date: 03/10/2018 10:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCities](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](50) NULL,
 CONSTRAINT [PK_tblCities] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSelfEmpolyeeDetails]    Script Date: 03/10/2018 10:44:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSelfEmpolyeeDetails](
	[EmpId] [int] NOT NULL,
	[CompanyId] [varchar](50) NULL,
	[DeptId] [int] NULL,
	[DesId] [int] NULL,
	[EmployeeName] [varchar](80) NULL,
	[MobileNo] [varchar](10) NULL,
	[EmailId] [varchar](100) NULL,
	[Address] [varchar](max) NULL,
	[Expr] [int] NULL,
	[CTC] [int] NULL,
 CONSTRAINT [PK__tblSelfEmpolyeeD__023D5A04] PRIMARY KEY CLUSTERED 
(
	[EmpId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblEmployeeDetails]    Script Date: 03/10/2018 10:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblEmployeeDetails](
	[DetailId] [int] IDENTITY(1,1) NOT NULL,
	[EmpId] [int] NULL,
	[DeptId] [int] NULL,
	[DesId] [int] NULL,
	[DOJ] [datetime] NULL,
	[Status] [varchar](50) NULL,
	[QuitDate] [varchar](50) NULL,
	[QuitReason] [varchar](max) NULL,
	[Rating] [int] NULL,
	[CompanyId] [varchar](50) NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_tblEmployeeDetails] PRIMARY KEY CLUSTERED 
(
	[DetailId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSalaries]    Script Date: 03/10/2018 10:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSalaries](
	[SalaryId] [int] IDENTITY(1,1) NOT NULL,
	[EmpId] [int] NULL,
	[CTC] [int] NULL,
	[HikeDate] [varchar](50) NULL,
	[Rating] [int] NULL,
	[CompanyId] [varchar](50) NULL,
	[Date] [datetime] NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_tblSalaries] PRIMARY KEY CLUSTERED 
(
	[SalaryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblVisitors]    Script Date: 03/10/2018 10:44:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblVisitors](
	[VisitorId] [int] IDENTITY(1,1) NOT NULL,
	[ViewerCompanyId] [varchar](50) NULL,
	[ViewedCompanyId] [varchar](50) NULL,
	[EmpId] [int] NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_tblVisitors] PRIMARY KEY CLUSTERED 
(
	[VisitorId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblDesignations]    Script Date: 03/10/2018 10:44:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblDesignations](
	[DesId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [varchar](50) NULL,
	[Designation] [varchar](50) NULL,
 CONSTRAINT [PK_tblDesignations] PRIMARY KEY CLUSTERED 
(
	[DesId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblDepartments]    Script Date: 03/10/2018 10:44:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblDepartments](
	[DeptId] [int] IDENTITY(1,1) NOT NULL,
	[DeptName] [varchar](50) NULL,
	[CompanyId] [varchar](50) NULL,
 CONSTRAINT [PK_tblDepartments] PRIMARY KEY CLUSTERED 
(
	[DeptId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblQueries]    Script Date: 03/10/2018 10:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblQueries](
	[QueryId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [varchar](50) NULL,
	[Query] [varchar](max) NULL,
	[PostedDate] [datetime] NULL,
	[Reply] [varchar](max) NULL,
	[ReplyDate] [datetime] NULL,
 CONSTRAINT [PK_tblQueries] PRIMARY KEY CLUSTERED 
(
	[QueryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblRequest]    Script Date: 03/10/2018 10:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRequest](
	[RequestId] [int] IDENTITY(1,1) NOT NULL,
	[RequestFrom] [varchar](50) NULL,
	[RequestTo] [varchar](50) NULL,
	[EmpId] [int] NULL,
	[Reply] [varchar](max) NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_tblRequest] PRIMARY KEY CLUSTERED 
(
	[RequestId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCompanies]    Script Date: 03/10/2018 10:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCompanies](
	[CompanyId] [varchar](50) NOT NULL,
	[Password] [varchar](50) NULL,
	[CompanyName] [varchar](max) NULL,
	[Address] [varchar](max) NULL,
	[MobileNo] [varchar](50) NULL,
	[CityId] [int] NULL,
	[EmailId] [varchar](50) NULL,
	[WebsiteAddress] [varchar](max) NULL,
	[RegisteredDate] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[Certificate] [varchar](50) NULL,
	[Date] [varchar](50) NULL,
 CONSTRAINT [PK_tblCompanies] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_tblCompanies_tblCities]    Script Date: 03/10/2018 10:43:59 ******/
ALTER TABLE [dbo].[tblCompanies]  WITH CHECK ADD  CONSTRAINT [FK_tblCompanies_tblCities] FOREIGN KEY([CityId])
REFERENCES [dbo].[tblCities] ([CityId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblCompanies] CHECK CONSTRAINT [FK_tblCompanies_tblCities]
GO
/****** Object:  ForeignKey [FK_tblDepartments_tblCompanies]    Script Date: 03/10/2018 10:44:00 ******/
ALTER TABLE [dbo].[tblDepartments]  WITH CHECK ADD  CONSTRAINT [FK_tblDepartments_tblCompanies] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[tblCompanies] ([CompanyId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblDepartments] CHECK CONSTRAINT [FK_tblDepartments_tblCompanies]
GO
/****** Object:  ForeignKey [FK_tblDesignations_tblCompanies]    Script Date: 03/10/2018 10:44:01 ******/
ALTER TABLE [dbo].[tblDesignations]  WITH CHECK ADD  CONSTRAINT [FK_tblDesignations_tblCompanies] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[tblCompanies] ([CompanyId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblDesignations] CHECK CONSTRAINT [FK_tblDesignations_tblCompanies]
GO
/****** Object:  ForeignKey [FK_tblEmployeeDetails_tblDepartments]    Script Date: 03/10/2018 10:44:04 ******/
ALTER TABLE [dbo].[tblEmployeeDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployeeDetails_tblDepartments] FOREIGN KEY([DeptId])
REFERENCES [dbo].[tblDepartments] ([DeptId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblEmployeeDetails] CHECK CONSTRAINT [FK_tblEmployeeDetails_tblDepartments]
GO
/****** Object:  ForeignKey [FK_tblEmployeeDetails_tblDesignations]    Script Date: 03/10/2018 10:44:04 ******/
ALTER TABLE [dbo].[tblEmployeeDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployeeDetails_tblDesignations] FOREIGN KEY([DesId])
REFERENCES [dbo].[tblDesignations] ([DesId])
GO
ALTER TABLE [dbo].[tblEmployeeDetails] CHECK CONSTRAINT [FK_tblEmployeeDetails_tblDesignations]
GO
/****** Object:  ForeignKey [FK_tblEmployeeDetails_tblEmployees]    Script Date: 03/10/2018 10:44:04 ******/
ALTER TABLE [dbo].[tblEmployeeDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployeeDetails_tblEmployees] FOREIGN KEY([EmpId])
REFERENCES [dbo].[tblEmployees] ([EmpId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblEmployeeDetails] CHECK CONSTRAINT [FK_tblEmployeeDetails_tblEmployees]
GO
/****** Object:  ForeignKey [FK_tblQueries_tblCompanies]    Script Date: 03/10/2018 10:44:08 ******/
ALTER TABLE [dbo].[tblQueries]  WITH CHECK ADD  CONSTRAINT [FK_tblQueries_tblCompanies] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[tblCompanies] ([CompanyId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblQueries] CHECK CONSTRAINT [FK_tblQueries_tblCompanies]
GO
/****** Object:  ForeignKey [FK_tblRequest_tblCompanies]    Script Date: 03/10/2018 10:44:09 ******/
ALTER TABLE [dbo].[tblRequest]  WITH CHECK ADD  CONSTRAINT [FK_tblRequest_tblCompanies] FOREIGN KEY([RequestFrom])
REFERENCES [dbo].[tblCompanies] ([CompanyId])
GO
ALTER TABLE [dbo].[tblRequest] CHECK CONSTRAINT [FK_tblRequest_tblCompanies]
GO
/****** Object:  ForeignKey [FK_tblRequest_tblCompanies1]    Script Date: 03/10/2018 10:44:09 ******/
ALTER TABLE [dbo].[tblRequest]  WITH CHECK ADD  CONSTRAINT [FK_tblRequest_tblCompanies1] FOREIGN KEY([RequestTo])
REFERENCES [dbo].[tblCompanies] ([CompanyId])
GO
ALTER TABLE [dbo].[tblRequest] CHECK CONSTRAINT [FK_tblRequest_tblCompanies1]
GO
/****** Object:  ForeignKey [FK_tblRequest_tblEmployees]    Script Date: 03/10/2018 10:44:10 ******/
ALTER TABLE [dbo].[tblRequest]  WITH CHECK ADD  CONSTRAINT [FK_tblRequest_tblEmployees] FOREIGN KEY([EmpId])
REFERENCES [dbo].[tblEmployees] ([EmpId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblRequest] CHECK CONSTRAINT [FK_tblRequest_tblEmployees]
GO
/****** Object:  ForeignKey [FK_tblSalaries_tblCompanies]    Script Date: 03/10/2018 10:44:11 ******/
ALTER TABLE [dbo].[tblSalaries]  WITH CHECK ADD  CONSTRAINT [FK_tblSalaries_tblCompanies] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[tblCompanies] ([CompanyId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblSalaries] CHECK CONSTRAINT [FK_tblSalaries_tblCompanies]
GO
/****** Object:  ForeignKey [FK_tblSalaries_tblEmployees]    Script Date: 03/10/2018 10:44:12 ******/
ALTER TABLE [dbo].[tblSalaries]  WITH CHECK ADD  CONSTRAINT [FK_tblSalaries_tblEmployees] FOREIGN KEY([EmpId])
REFERENCES [dbo].[tblEmployees] ([EmpId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblSalaries] CHECK CONSTRAINT [FK_tblSalaries_tblEmployees]
GO
/****** Object:  ForeignKey [FK__tblSelfEm__Compa__1DE57479]    Script Date: 03/10/2018 10:44:14 ******/
ALTER TABLE [dbo].[tblSelfEmpolyeeDetails]  WITH CHECK ADD  CONSTRAINT [FK__tblSelfEm__Compa__1DE57479] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[tblCompanies] ([CompanyId])
GO
ALTER TABLE [dbo].[tblSelfEmpolyeeDetails] CHECK CONSTRAINT [FK__tblSelfEm__Compa__1DE57479]
GO
/****** Object:  ForeignKey [FK__tblSelfEm__DeptI__1ED998B2]    Script Date: 03/10/2018 10:44:14 ******/
ALTER TABLE [dbo].[tblSelfEmpolyeeDetails]  WITH CHECK ADD  CONSTRAINT [FK__tblSelfEm__DeptI__1ED998B2] FOREIGN KEY([DeptId])
REFERENCES [dbo].[tblDepartments] ([DeptId])
GO
ALTER TABLE [dbo].[tblSelfEmpolyeeDetails] CHECK CONSTRAINT [FK__tblSelfEm__DeptI__1ED998B2]
GO
/****** Object:  ForeignKey [FK__tblSelfEm__DesId__1FCDBCEB]    Script Date: 03/10/2018 10:44:14 ******/
ALTER TABLE [dbo].[tblSelfEmpolyeeDetails]  WITH CHECK ADD  CONSTRAINT [FK__tblSelfEm__DesId__1FCDBCEB] FOREIGN KEY([DesId])
REFERENCES [dbo].[tblDesignations] ([DesId])
GO
ALTER TABLE [dbo].[tblSelfEmpolyeeDetails] CHECK CONSTRAINT [FK__tblSelfEm__DesId__1FCDBCEB]
GO
/****** Object:  ForeignKey [FK_tblVisitors_tblCompanies]    Script Date: 03/10/2018 10:44:15 ******/
ALTER TABLE [dbo].[tblVisitors]  WITH CHECK ADD  CONSTRAINT [FK_tblVisitors_tblCompanies] FOREIGN KEY([ViewerCompanyId])
REFERENCES [dbo].[tblCompanies] ([CompanyId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblVisitors] CHECK CONSTRAINT [FK_tblVisitors_tblCompanies]
GO
/****** Object:  ForeignKey [FK_tblVisitors_tblEmployees]    Script Date: 03/10/2018 10:44:16 ******/
ALTER TABLE [dbo].[tblVisitors]  WITH CHECK ADD  CONSTRAINT [FK_tblVisitors_tblEmployees] FOREIGN KEY([EmpId])
REFERENCES [dbo].[tblEmployees] ([EmpId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblVisitors] CHECK CONSTRAINT [FK_tblVisitors_tblEmployees]
GO
