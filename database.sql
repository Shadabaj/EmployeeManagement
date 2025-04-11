USE [NeoSoft_Shadab]
GO
/****** Object:  Schema [Angular]    Script Date: 3/25/2025 5:19:48 PM ******/
CREATE SCHEMA [Angular]
GO
/****** Object:  UserDefinedFunction [dbo].[FNSUM]    Script Date: 3/25/2025 5:19:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[FNSUM](@NUM INT)
RETURNS INT
AS
BEGIN
RETURN @NUM * @NUM
END
GO
/****** Object:  Table [dbo].[EmployeeMaster]    Script Date: 3/25/2025 5:19:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeMaster](
	[Row_Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeCode] [varchar](8) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[CountryId] [int] NULL,
	[StateId] [int] NULL,
	[CityId] [int] NULL,
	[EmailAddress] [varchar](100) NOT NULL,
	[MobileNumber] [varchar](15) NOT NULL,
	[PanNumber] [varchar](12) NOT NULL,
	[PassportNumber] [varchar](20) NOT NULL,
	[ProfileImage] [nvarchar](100) NULL,
	[Gender] [tinyint] NULL,
	[IsActive] [bit] NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[DateOfJoinee] [date] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedDate] [datetime] NULL,
 CONSTRAINT [PK__Employee__7C36D07EDF03DA00] PRIMARY KEY CLUSTERED 
(
	[Row_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetEmployee]    Script Date: 3/25/2025 5:19:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGetEmployee](@CountryId INT)
RETURNS TABLE
AS
RETURN
(
    SELECT * 
    FROM EmployeeMaster
    WHERE CountryId = @CountryId
)
GO
/****** Object:  Table [Angular].[City]    Script Date: 3/25/2025 5:19:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Angular].[City](
	[Row_Id] [int] NOT NULL,
	[StateId] [int] NULL,
	[CityName] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Row_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Angular].[Country]    Script Date: 3/25/2025 5:19:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Angular].[Country](
	[Row_Id] [int] NOT NULL,
	[CountryName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Row_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Angular].[EmployeeMaster]    Script Date: 3/25/2025 5:19:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Angular].[EmployeeMaster](
	[Row_Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeCode] [varchar](8) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[CountryId] [int] NULL,
	[StateId] [int] NULL,
	[CityId] [int] NULL,
	[EmailAddress] [varchar](100) NOT NULL,
	[MobileNumber] [varchar](15) NOT NULL,
	[PanNumber] [varchar](12) NOT NULL,
	[PassportNumber] [varchar](20) NOT NULL,
	[ProfileImage] [nvarchar](100) NULL,
	[Gender] [tinyint] NULL,
	[IsActive] [bit] NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[DateOfJoinee] [date] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedDate] [datetime] NULL,
 CONSTRAINT [PK__Employee__7C36D07EDF03DA00] PRIMARY KEY CLUSTERED 
(
	[Row_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Angular].[State]    Script Date: 3/25/2025 5:19:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Angular].[State](
	[Row_Id] [int] NOT NULL,
	[CountryId] [int] NULL,
	[StateName] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Row_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 3/25/2025 5:19:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Row_Id] [int] NOT NULL,
	[StateId] [int] NULL,
	[CityName] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Row_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 3/25/2025 5:19:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Row_Id] [int] NOT NULL,
	[CountryName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Row_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 3/25/2025 5:19:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[Row_Id] [int] NOT NULL,
	[CountryId] [int] NULL,
	[StateName] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Row_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [Angular].[City] ([Row_Id], [StateId], [CityName]) VALUES (1, 1, N'Los Angeles')
GO
INSERT [Angular].[City] ([Row_Id], [StateId], [CityName]) VALUES (2, 1, N'San Francisco')
GO
INSERT [Angular].[City] ([Row_Id], [StateId], [CityName]) VALUES (3, 2, N'New York City')
GO
INSERT [Angular].[City] ([Row_Id], [StateId], [CityName]) VALUES (4, 2, N'Buffalo')
GO
INSERT [Angular].[City] ([Row_Id], [StateId], [CityName]) VALUES (5, 3, N'Toronto')
GO
INSERT [Angular].[City] ([Row_Id], [StateId], [CityName]) VALUES (6, 3, N'Ottawa')
GO
INSERT [Angular].[City] ([Row_Id], [StateId], [CityName]) VALUES (7, 4, N'Montreal')
GO
INSERT [Angular].[City] ([Row_Id], [StateId], [CityName]) VALUES (8, 5, N'Mumbai')
GO
INSERT [Angular].[City] ([Row_Id], [StateId], [CityName]) VALUES (9, 5, N'Pune')
GO
INSERT [Angular].[City] ([Row_Id], [StateId], [CityName]) VALUES (10, 6, N'Bangalore')
GO
INSERT [Angular].[City] ([Row_Id], [StateId], [CityName]) VALUES (11, 7, N'Sydney')
GO
INSERT [Angular].[City] ([Row_Id], [StateId], [CityName]) VALUES (12, 7, N'Newcastle')
GO
INSERT [Angular].[City] ([Row_Id], [StateId], [CityName]) VALUES (13, 8, N'Brisbane')
GO
INSERT [Angular].[City] ([Row_Id], [StateId], [CityName]) VALUES (14, 9, N'London')
GO
INSERT [Angular].[City] ([Row_Id], [StateId], [CityName]) VALUES (15, 9, N'Manchester')
GO
INSERT [Angular].[City] ([Row_Id], [StateId], [CityName]) VALUES (16, 10, N'Edinburgh')
GO
INSERT [Angular].[Country] ([Row_Id], [CountryName]) VALUES (1, N'United States')
GO
INSERT [Angular].[Country] ([Row_Id], [CountryName]) VALUES (2, N'Canada')
GO
INSERT [Angular].[Country] ([Row_Id], [CountryName]) VALUES (3, N'India')
GO
INSERT [Angular].[Country] ([Row_Id], [CountryName]) VALUES (4, N'Australia')
GO
INSERT [Angular].[Country] ([Row_Id], [CountryName]) VALUES (5, N'United Kingdom')
GO
SET IDENTITY_INSERT [Angular].[EmployeeMaster] ON 
GO
INSERT [Angular].[EmployeeMaster] ([Row_Id], [EmployeeCode], [FirstName], [LastName], [CountryId], [StateId], [CityId], [EmailAddress], [MobileNumber], [PanNumber], [PassportNumber], [ProfileImage], [Gender], [IsActive], [DateOfBirth], [DateOfJoinee], [CreatedDate], [UpdatedDate], [IsDeleted], [DeletedDate]) VALUES (4, N'786786', N'Ashish', N'Telgu', 2, 3, 5, N'ashish@ymail.com', N'9876543210', N'CVCPA7555H', N'AQ123456', N'/images/20250318T104232771.JPG', 1, 1, CAST(N'2025-03-18' AS Date), CAST(N'2025-03-18' AS Date), CAST(N'2025-03-18T07:51:39.607' AS DateTime), CAST(N'2025-03-20T13:52:59.070' AS DateTime), 0, NULL)
GO
INSERT [Angular].[EmployeeMaster] ([Row_Id], [EmployeeCode], [FirstName], [LastName], [CountryId], [StateId], [CityId], [EmailAddress], [MobileNumber], [PanNumber], [PassportNumber], [ProfileImage], [Gender], [IsActive], [DateOfBirth], [DateOfJoinee], [CreatedDate], [UpdatedDate], [IsDeleted], [DeletedDate]) VALUES (8, N'1211212', N'Test', N'Singh', 3, 5, 8, N'Testing@gmail.com', N'888937336', N'CVCPA7999H', N'HQ123456', N'/images/20250320T055436370.JPG', 1, 1, CAST(N'2025-03-20' AS Date), CAST(N'2025-03-20' AS Date), CAST(N'2025-03-20T05:54:36.383' AS DateTime), NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [Angular].[EmployeeMaster] OFF
GO
INSERT [Angular].[State] ([Row_Id], [CountryId], [StateName]) VALUES (1, 1, N'California')
GO
INSERT [Angular].[State] ([Row_Id], [CountryId], [StateName]) VALUES (2, 1, N'New York')
GO
INSERT [Angular].[State] ([Row_Id], [CountryId], [StateName]) VALUES (3, 2, N'Ontario')
GO
INSERT [Angular].[State] ([Row_Id], [CountryId], [StateName]) VALUES (4, 2, N'Quebec')
GO
INSERT [Angular].[State] ([Row_Id], [CountryId], [StateName]) VALUES (5, 3, N'Maharashtra')
GO
INSERT [Angular].[State] ([Row_Id], [CountryId], [StateName]) VALUES (6, 3, N'Karnataka')
GO
INSERT [Angular].[State] ([Row_Id], [CountryId], [StateName]) VALUES (7, 4, N'New South Wales')
GO
INSERT [Angular].[State] ([Row_Id], [CountryId], [StateName]) VALUES (8, 4, N'Queensland')
GO
INSERT [Angular].[State] ([Row_Id], [CountryId], [StateName]) VALUES (9, 5, N'England')
GO
INSERT [Angular].[State] ([Row_Id], [CountryId], [StateName]) VALUES (10, 5, N'Scotland')
GO
INSERT [dbo].[City] ([Row_Id], [StateId], [CityName]) VALUES (1, 1, N'Los Angeles')
GO
INSERT [dbo].[City] ([Row_Id], [StateId], [CityName]) VALUES (2, 1, N'San Francisco')
GO
INSERT [dbo].[City] ([Row_Id], [StateId], [CityName]) VALUES (3, 2, N'New York City')
GO
INSERT [dbo].[City] ([Row_Id], [StateId], [CityName]) VALUES (4, 2, N'Buffalo')
GO
INSERT [dbo].[City] ([Row_Id], [StateId], [CityName]) VALUES (5, 3, N'Toronto')
GO
INSERT [dbo].[City] ([Row_Id], [StateId], [CityName]) VALUES (6, 3, N'Ottawa')
GO
INSERT [dbo].[City] ([Row_Id], [StateId], [CityName]) VALUES (7, 4, N'Montreal')
GO
INSERT [dbo].[City] ([Row_Id], [StateId], [CityName]) VALUES (8, 5, N'Mumbai')
GO
INSERT [dbo].[City] ([Row_Id], [StateId], [CityName]) VALUES (9, 5, N'Pune')
GO
INSERT [dbo].[City] ([Row_Id], [StateId], [CityName]) VALUES (10, 6, N'Bangalore')
GO
INSERT [dbo].[City] ([Row_Id], [StateId], [CityName]) VALUES (11, 7, N'Sydney')
GO
INSERT [dbo].[City] ([Row_Id], [StateId], [CityName]) VALUES (12, 7, N'Newcastle')
GO
INSERT [dbo].[City] ([Row_Id], [StateId], [CityName]) VALUES (13, 8, N'Brisbane')
GO
INSERT [dbo].[City] ([Row_Id], [StateId], [CityName]) VALUES (14, 9, N'London')
GO
INSERT [dbo].[City] ([Row_Id], [StateId], [CityName]) VALUES (15, 9, N'Manchester')
GO
INSERT [dbo].[City] ([Row_Id], [StateId], [CityName]) VALUES (16, 10, N'Edinburgh')
GO
INSERT [dbo].[Country] ([Row_Id], [CountryName]) VALUES (1, N'United States')
GO
INSERT [dbo].[Country] ([Row_Id], [CountryName]) VALUES (2, N'Canada')
GO
INSERT [dbo].[Country] ([Row_Id], [CountryName]) VALUES (3, N'India')
GO
INSERT [dbo].[Country] ([Row_Id], [CountryName]) VALUES (4, N'Australia')
GO
INSERT [dbo].[Country] ([Row_Id], [CountryName]) VALUES (5, N'United Kingdom')
GO
SET IDENTITY_INSERT [dbo].[EmployeeMaster] ON 
GO
INSERT [dbo].[EmployeeMaster] ([Row_Id], [EmployeeCode], [FirstName], [LastName], [CountryId], [StateId], [CityId], [EmailAddress], [MobileNumber], [PanNumber], [PassportNumber], [ProfileImage], [Gender], [IsActive], [DateOfBirth], [DateOfJoinee], [CreatedDate], [UpdatedDate], [IsDeleted], [DeletedDate]) VALUES (18, N'135672', N'Soumya ', N'Das', 3, 6, 10, N'SoumyaDas@ymail.com', N'8973535622', N'SQMPA7555H', N'V72345678', N'/Uploads/20250307T114903776.jpg', 1, 1, CAST(N'1994-02-08' AS Date), CAST(N'2025-03-01' AS Date), CAST(N'2025-03-07T16:04:53.280' AS DateTime), CAST(N'2025-03-07T11:49:02.957' AS DateTime), 0, NULL)
GO
INSERT [dbo].[EmployeeMaster] ([Row_Id], [EmployeeCode], [FirstName], [LastName], [CountryId], [StateId], [CityId], [EmailAddress], [MobileNumber], [PanNumber], [PassportNumber], [ProfileImage], [Gender], [IsActive], [DateOfBirth], [DateOfJoinee], [CreatedDate], [UpdatedDate], [IsDeleted], [DeletedDate]) VALUES (19, N'452333', N'Ashish', N'Chanchlani', 1, 1, 1, N'ashish@ymail.com', N'8934675848', N'WRTFH8777Q', N'K12745678', N'/Uploads/20250307T134235737.JPG', 1, 1, CAST(N'1997-01-07' AS Date), CAST(N'2025-03-07' AS Date), CAST(N'2025-03-07T19:11:52.253' AS DateTime), CAST(N'2025-03-10T05:58:38.200' AS DateTime), 0, NULL)
GO
INSERT [dbo].[EmployeeMaster] ([Row_Id], [EmployeeCode], [FirstName], [LastName], [CountryId], [StateId], [CityId], [EmailAddress], [MobileNumber], [PanNumber], [PassportNumber], [ProfileImage], [Gender], [IsActive], [DateOfBirth], [DateOfJoinee], [CreatedDate], [UpdatedDate], [IsDeleted], [DeletedDate]) VALUES (20, N'567363', N'Saurav ', N'Joshi', 1, 1, 1, N'saurav@ymail.com', N'7836351332', N'WETFH8777Q', N'K12749678', N'/Uploads/20250310T064713101.JPG', 1, 1, CAST(N'1987-04-06' AS Date), CAST(N'2025-03-07' AS Date), CAST(N'2025-03-07T19:21:29.410' AS DateTime), CAST(N'2025-03-10T06:47:11.433' AS DateTime), 0, NULL)
GO
INSERT [dbo].[EmployeeMaster] ([Row_Id], [EmployeeCode], [FirstName], [LastName], [CountryId], [StateId], [CityId], [EmailAddress], [MobileNumber], [PanNumber], [PassportNumber], [ProfileImage], [Gender], [IsActive], [DateOfBirth], [DateOfJoinee], [CreatedDate], [UpdatedDate], [IsDeleted], [DeletedDate]) VALUES (21, N'983833', N'Hatim', N'National', 3, 6, 10, N'Hatim@gmail.com', N'7738381313', N'CVLHS8955H', N'H1234569', N'/Uploads/20250310T065822032.jpg', 1, 1, CAST(N'2025-03-10' AS Date), CAST(N'2025-03-10' AS Date), CAST(N'2025-03-10T12:21:56.857' AS DateTime), CAST(N'2025-03-10T06:58:20.503' AS DateTime), 0, NULL)
GO
INSERT [dbo].[EmployeeMaster] ([Row_Id], [EmployeeCode], [FirstName], [LastName], [CountryId], [StateId], [CityId], [EmailAddress], [MobileNumber], [PanNumber], [PassportNumber], [ProfileImage], [Gender], [IsActive], [DateOfBirth], [DateOfJoinee], [CreatedDate], [UpdatedDate], [IsDeleted], [DeletedDate]) VALUES (22, N'424242', N'Hatim', N'Shaikh', 1, 1, 1, N'Hatimshaikh@gmail.com', N'7738385613', N'CVLHS8999H', N'L1123456', N'/Uploads/20250310T070847372.jpg', 0, 1, CAST(N'1996-03-01' AS Date), CAST(N'2025-03-10' AS Date), CAST(N'2025-03-10T12:39:02.580' AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[EmployeeMaster] ([Row_Id], [EmployeeCode], [FirstName], [LastName], [CountryId], [StateId], [CityId], [EmailAddress], [MobileNumber], [PanNumber], [PassportNumber], [ProfileImage], [Gender], [IsActive], [DateOfBirth], [DateOfJoinee], [CreatedDate], [UpdatedDate], [IsDeleted], [DeletedDate]) VALUES (23, N'567376', N'Saurav ', N'Jamil', 3, 6, 10, N'sauravjamil@gmail.com', N'7362525222', N'CVCPA7999H', N'V1234867', N'/Uploads/20250310T072017756.JPG', 0, 1, CAST(N'1994-03-10' AS Date), CAST(N'2025-03-09' AS Date), CAST(N'2025-03-10T12:50:18.503' AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[EmployeeMaster] ([Row_Id], [EmployeeCode], [FirstName], [LastName], [CountryId], [StateId], [CityId], [EmailAddress], [MobileNumber], [PanNumber], [PassportNumber], [ProfileImage], [Gender], [IsActive], [DateOfBirth], [DateOfJoinee], [CreatedDate], [UpdatedDate], [IsDeleted], [DeletedDate]) VALUES (27, N'224444', N'Shadab', N'jalaluddin', 1, 1, 1, N'shadabjalal@gmail.com', N'9855551112', N'CVCPA7555H', N'B1234560', N'/Uploads/20250310T122845498.JPG', 1, 1, CAST(N'2021-01-04' AS Date), CAST(N'2025-03-10' AS Date), CAST(N'2025-03-10T17:58:45.540' AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[EmployeeMaster] ([Row_Id], [EmployeeCode], [FirstName], [LastName], [CountryId], [StateId], [CityId], [EmailAddress], [MobileNumber], [PanNumber], [PassportNumber], [ProfileImage], [Gender], [IsActive], [DateOfBirth], [DateOfJoinee], [CreatedDate], [UpdatedDate], [IsDeleted], [DeletedDate]) VALUES (29, N'424299', N'Virat', N'Kohli', 1, 1, 1, N'ViratKohli@gmail.com', N'7738389412', N'VKLHS8910H', N'V1123996', N'/Uploads/20250310T070847372.jpg', 1, 1, CAST(N'2000-01-01' AS Date), CAST(N'0001-01-01' AS Date), CAST(N'2025-03-11T08:54:36.697' AS DateTime), CAST(N'2025-03-12T11:14:12.197' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[EmployeeMaster] ([Row_Id], [EmployeeCode], [FirstName], [LastName], [CountryId], [StateId], [CityId], [EmailAddress], [MobileNumber], [PanNumber], [PassportNumber], [ProfileImage], [Gender], [IsActive], [DateOfBirth], [DateOfJoinee], [CreatedDate], [UpdatedDate], [IsDeleted], [DeletedDate]) VALUES (30, N'133232', N'HHAHAHAAAKAA', N'TTSSHSHSHSHS', 3, 5, 8, N'adadad@gmail.com', N'7887878878', N'LKGHJ7555H', N'M12234567', N'/Uploads/20250311T085853934.JPG', 1, 1, CAST(N'1990-02-08' AS Date), CAST(N'2025-03-11' AS Date), CAST(N'2025-03-11T14:28:54.043' AS DateTime), CAST(N'2025-03-18T08:35:27.857' AS DateTime), 0, NULL)
GO
INSERT [dbo].[EmployeeMaster] ([Row_Id], [EmployeeCode], [FirstName], [LastName], [CountryId], [StateId], [CityId], [EmailAddress], [MobileNumber], [PanNumber], [PassportNumber], [ProfileImage], [Gender], [IsActive], [DateOfBirth], [DateOfJoinee], [CreatedDate], [UpdatedDate], [IsDeleted], [DeletedDate]) VALUES (32, N'A11111', N'Saurav ', N'Joshi', 2, 3, 5, N'adadad1@gmail.com', N'7777777771', N'ABCDA1234E', N'A12345678', N'/Uploads/20250311T101425733.JPG', 1, 1, CAST(N'1011-01-01' AS Date), CAST(N'2025-03-11' AS Date), CAST(N'2025-03-11T15:44:25.813' AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[EmployeeMaster] ([Row_Id], [EmployeeCode], [FirstName], [LastName], [CountryId], [StateId], [CityId], [EmailAddress], [MobileNumber], [PanNumber], [PassportNumber], [ProfileImage], [Gender], [IsActive], [DateOfBirth], [DateOfJoinee], [CreatedDate], [UpdatedDate], [IsDeleted], [DeletedDate]) VALUES (42, N'5677664s', N'Saurav ', N'Joshi', 1, 2, 3, N'ashishaaaaadd@ymail.com', N'98765652322', N'adadadadada', N'B1234560ddd', N'/Uploads/20250311T101425733.JPG', 1, 1, CAST(N'2025-03-12' AS Date), CAST(N'2025-03-12' AS Date), CAST(N'2025-03-12T06:33:17.807' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeMaster] ([Row_Id], [EmployeeCode], [FirstName], [LastName], [CountryId], [StateId], [CityId], [EmailAddress], [MobileNumber], [PanNumber], [PassportNumber], [ProfileImage], [Gender], [IsActive], [DateOfBirth], [DateOfJoinee], [CreatedDate], [UpdatedDate], [IsDeleted], [DeletedDate]) VALUES (44, N'113133', N'Saurav ', N'hdjahdjahdja', 3, 6, 10, N'adadadad@gmail.com', N'9999999999', N'CVCPA7335H', N'B1235560', N'/Uploads/20250312T105610005.JPG', 1, 1, CAST(N'2000-03-12' AS Date), CAST(N'2025-03-04' AS Date), CAST(N'2025-03-12T16:26:10.047' AS DateTime), CAST(N'2025-03-20T13:50:53.597' AS DateTime), 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[EmployeeMaster] OFF
GO
INSERT [dbo].[State] ([Row_Id], [CountryId], [StateName]) VALUES (1, 1, N'California')
GO
INSERT [dbo].[State] ([Row_Id], [CountryId], [StateName]) VALUES (2, 1, N'New York')
GO
INSERT [dbo].[State] ([Row_Id], [CountryId], [StateName]) VALUES (3, 2, N'Ontario')
GO
INSERT [dbo].[State] ([Row_Id], [CountryId], [StateName]) VALUES (4, 2, N'Quebec')
GO
INSERT [dbo].[State] ([Row_Id], [CountryId], [StateName]) VALUES (5, 3, N'Maharashtra')
GO
INSERT [dbo].[State] ([Row_Id], [CountryId], [StateName]) VALUES (6, 3, N'Karnataka')
GO
INSERT [dbo].[State] ([Row_Id], [CountryId], [StateName]) VALUES (7, 4, N'New South Wales')
GO
INSERT [dbo].[State] ([Row_Id], [CountryId], [StateName]) VALUES (8, 4, N'Queensland')
GO
INSERT [dbo].[State] ([Row_Id], [CountryId], [StateName]) VALUES (9, 5, N'England')
GO
INSERT [dbo].[State] ([Row_Id], [CountryId], [StateName]) VALUES (10, 5, N'Scotland')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Employee__250375B11DEAD627]    Script Date: 3/25/2025 5:19:48 PM ******/
ALTER TABLE [Angular].[EmployeeMaster] ADD  CONSTRAINT [UQ__Employee__250375B11DEAD627] UNIQUE NONCLUSTERED 
(
	[MobileNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Employee__45809E71EAD4A1EE]    Script Date: 3/25/2025 5:19:48 PM ******/
ALTER TABLE [Angular].[EmployeeMaster] ADD  CONSTRAINT [UQ__Employee__45809E71EAD4A1EE] UNIQUE NONCLUSTERED 
(
	[PassportNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Employee__49A14740709FFB13]    Script Date: 3/25/2025 5:19:48 PM ******/
ALTER TABLE [Angular].[EmployeeMaster] ADD  CONSTRAINT [UQ__Employee__49A14740709FFB13] UNIQUE NONCLUSTERED 
(
	[EmailAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Employee__7C38BFC82DAEE17A]    Script Date: 3/25/2025 5:19:48 PM ******/
ALTER TABLE [Angular].[EmployeeMaster] ADD  CONSTRAINT [UQ__Employee__7C38BFC82DAEE17A] UNIQUE NONCLUSTERED 
(
	[PanNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Employee__250375B11DEAD627]    Script Date: 3/25/2025 5:19:48 PM ******/
ALTER TABLE [dbo].[EmployeeMaster] ADD  CONSTRAINT [UQ__Employee__250375B11DEAD627] UNIQUE NONCLUSTERED 
(
	[MobileNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Employee__45809E71EAD4A1EE]    Script Date: 3/25/2025 5:19:48 PM ******/
ALTER TABLE [dbo].[EmployeeMaster] ADD  CONSTRAINT [UQ__Employee__45809E71EAD4A1EE] UNIQUE NONCLUSTERED 
(
	[PassportNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Employee__49A14740709FFB13]    Script Date: 3/25/2025 5:19:48 PM ******/
ALTER TABLE [dbo].[EmployeeMaster] ADD  CONSTRAINT [UQ__Employee__49A14740709FFB13] UNIQUE NONCLUSTERED 
(
	[EmailAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Employee__7C38BFC82DAEE17A]    Script Date: 3/25/2025 5:19:48 PM ******/
ALTER TABLE [dbo].[EmployeeMaster] ADD  CONSTRAINT [UQ__Employee__7C38BFC82DAEE17A] UNIQUE NONCLUSTERED 
(
	[PanNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [Angular].[City]  WITH CHECK ADD  CONSTRAINT [FK_StateCity] FOREIGN KEY([StateId])
REFERENCES [Angular].[State] ([Row_Id])
GO
ALTER TABLE [Angular].[City] CHECK CONSTRAINT [FK_StateCity]
GO
ALTER TABLE [Angular].[EmployeeMaster]  WITH CHECK ADD  CONSTRAINT [FK_City] FOREIGN KEY([CityId])
REFERENCES [Angular].[City] ([Row_Id])
GO
ALTER TABLE [Angular].[EmployeeMaster] CHECK CONSTRAINT [FK_City]
GO
ALTER TABLE [Angular].[EmployeeMaster]  WITH CHECK ADD  CONSTRAINT [FK_Country] FOREIGN KEY([CountryId])
REFERENCES [Angular].[Country] ([Row_Id])
GO
ALTER TABLE [Angular].[EmployeeMaster] CHECK CONSTRAINT [FK_Country]
GO
ALTER TABLE [Angular].[EmployeeMaster]  WITH CHECK ADD  CONSTRAINT [FK_State] FOREIGN KEY([StateId])
REFERENCES [Angular].[State] ([Row_Id])
GO
ALTER TABLE [Angular].[EmployeeMaster] CHECK CONSTRAINT [FK_State]
GO
ALTER TABLE [Angular].[State]  WITH CHECK ADD  CONSTRAINT [FK_CountryState] FOREIGN KEY([CountryId])
REFERENCES [Angular].[Country] ([Row_Id])
GO
ALTER TABLE [Angular].[State] CHECK CONSTRAINT [FK_CountryState]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_StateCity] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([Row_Id])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_StateCity]
GO
ALTER TABLE [dbo].[EmployeeMaster]  WITH CHECK ADD  CONSTRAINT [FK_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Row_Id])
GO
ALTER TABLE [dbo].[EmployeeMaster] CHECK CONSTRAINT [FK_City]
GO
ALTER TABLE [dbo].[EmployeeMaster]  WITH CHECK ADD  CONSTRAINT [FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Row_Id])
GO
ALTER TABLE [dbo].[EmployeeMaster] CHECK CONSTRAINT [FK_Country]
GO
ALTER TABLE [dbo].[EmployeeMaster]  WITH CHECK ADD  CONSTRAINT [FK_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([Row_Id])
GO
ALTER TABLE [dbo].[EmployeeMaster] CHECK CONSTRAINT [FK_State]
GO
ALTER TABLE [dbo].[State]  WITH CHECK ADD  CONSTRAINT [FK_CountryState] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Row_Id])
GO
ALTER TABLE [dbo].[State] CHECK CONSTRAINT [FK_CountryState]
GO
/****** Object:  StoredProcedure [dbo].[stp_Emp_Creations]    Script Date: 3/25/2025 5:19:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[stp_Emp_Creations]
    @EmployeeCode VARCHAR(8),
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @CountryId INT,
    @StateId INT,
    @CityId INT,
    @EmailAddress VARCHAR(100),
    @MobileNumber VARCHAR(15),
    @PanNumber VARCHAR(12),
    @PassportNumber VARCHAR(20),
    @ProfileImage NVARCHAR(100),
    @Gender TINYINT,
    @IsActive BIT,
    @DateOfBirth DATE,
    @DateOfJoinee DATE,
    @SuccessFlag INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Start a transaction if you have multiple operations
        BEGIN TRANSACTION;

        -- Insert Employee record
        INSERT INTO EmployeeMaster (
            EmployeeCode,
            FirstName,
            LastName,
            CountryId,
            StateId,
            CityId,
            EmailAddress,
            MobileNumber,
            PanNumber,
            PassportNumber,
            ProfileImage,
            Gender,
            IsActive,
            DateOfBirth,
            DateOfJoinee,
            CreatedDate,
            IsDeleted
        )
        VALUES (
            @EmployeeCode,
            @FirstName,
            @LastName,
            @CountryId,
            @StateId,
            @CityId,
            @EmailAddress,
            @MobileNumber,
            @PanNumber,
            @PassportNumber,
            @ProfileImage,
            @Gender,
            @IsActive,
            @DateOfBirth,
            @DateOfJoinee,
            GETDATE(),
            0 -- IsDeleted as 0 for active records
        );

        -- Capture the last inserted identity (the EmployeeId)
        SET @SuccessFlag = SCOPE_IDENTITY();  -- Returning the EmployeeId to the caller

        -- Commit the transaction
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- If there's an error, rollback the transaction
        ROLLBACK TRANSACTION;

        -- Optionally, return the error number and message (could be useful for debugging)
        SET @SuccessFlag = 0;

        -- You can also add additional logging here for error tracking purposes
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[stp_Emp_Get]    Script Date: 3/25/2025 5:19:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[stp_Emp_Get]
AS
BEGIN
    SELECT
        Row_Id,
        EmployeeCode,
        FirstName,
        LastName,
        CountryId,
        StateId,
        CityId,
        EmailAddress,
        MobileNumber,
        PanNumber,
        PassportNumber,
        ProfileImage,
        Gender,
        IsActive,
        DateOfBirth,
        DateOfJoinee,
        CreatedDate,
        UpdatedDate,
        IsDeleted,
        DeletedDate
    FROM EmployeeMaster
    
END;
GO
