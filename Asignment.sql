USE [master]
GO
/****** Object:  Database [Test_1]    Script Date: 23/08/2022 1:52:16 CH ******/
CREATE DATABASE [Test_1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Test_1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Test_1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Test_1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Test_1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Test_1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Test_1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Test_1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Test_1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Test_1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Test_1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Test_1] SET ARITHABORT OFF 
GO
ALTER DATABASE [Test_1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Test_1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Test_1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Test_1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Test_1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Test_1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Test_1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Test_1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Test_1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Test_1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Test_1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Test_1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Test_1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Test_1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Test_1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Test_1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Test_1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Test_1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Test_1] SET  MULTI_USER 
GO
ALTER DATABASE [Test_1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Test_1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Test_1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Test_1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Test_1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Test_1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Test_1] SET QUERY_STORE = OFF
GO
USE [Test_1]
GO
/****** Object:  Table [dbo].[Salary]    Script Date: 23/08/2022 1:52:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salary](
	[said] [int] NOT NULL,
	[saname] [varchar](150) NOT NULL,
	[salary] [money] NULL,
 CONSTRAINT [PK_Salary] PRIMARY KEY CLUSTERED 
(
	[said] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salary_management]    Script Date: 23/08/2022 1:52:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salary_management](
	[mid] [int] IDENTITY(1,1) NOT NULL,
	[bonus_salary] [int] NULL,
	[deduction_salary] [int] NULL,
	[advance_salary] [int] NULL,
	[said] [int] NOT NULL,
	[sid] [int] NOT NULL,
 CONSTRAINT [PK_Salary_management] PRIMARY KEY CLUSTERED 
(
	[mid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 23/08/2022 1:52:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[sid] [int] NOT NULL,
	[sname] [varchar](150) NOT NULL,
	[nvname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Work_shift]    Script Date: 23/08/2022 1:52:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Work_shift](
	[wid] [int] NOT NULL,
	[wname] [varchar](150) NOT NULL,
	[time_work] [int] NULL,
 CONSTRAINT [PK_Work_shift] PRIMARY KEY CLUSTERED 
(
	[wid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkingTime]    Script Date: 23/08/2022 1:52:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkingTime](
	[tid] [int] IDENTITY(1,1) NOT NULL,
	[sid] [int] NOT NULL,
	[checkin] [datetime] NULL,
	[checkout] [datetime] NULL,
	[wid] [int] NULL,
 CONSTRAINT [PK_WorkingTime] PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Salary] ([said], [saname], [salary]) VALUES (1, N'Quan Ly', 20000.0000)
INSERT [dbo].[Salary] ([said], [saname], [salary]) VALUES (2, N'Nhan Vien', 15000.0000)
GO
SET IDENTITY_INSERT [dbo].[Salary_management] ON 

INSERT [dbo].[Salary_management] ([mid], [bonus_salary], [deduction_salary], [advance_salary], [said], [sid]) VALUES (1, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Salary_management] ([mid], [bonus_salary], [deduction_salary], [advance_salary], [said], [sid]) VALUES (2, NULL, 10000, NULL, 2, 2)
INSERT [dbo].[Salary_management] ([mid], [bonus_salary], [deduction_salary], [advance_salary], [said], [sid]) VALUES (3, 50000, NULL, NULL, 2, 3)
INSERT [dbo].[Salary_management] ([mid], [bonus_salary], [deduction_salary], [advance_salary], [said], [sid]) VALUES (4, NULL, NULL, 1000000, 2, 4)
SET IDENTITY_INSERT [dbo].[Salary_management] OFF
GO
INSERT [dbo].[Staff] ([sid], [sname], [nvname]) VALUES (1, N'Lien', N'NV01')
INSERT [dbo].[Staff] ([sid], [sname], [nvname]) VALUES (2, N'Anh', N'NV02')
INSERT [dbo].[Staff] ([sid], [sname], [nvname]) VALUES (3, N'Dung', N'NV03')
INSERT [dbo].[Staff] ([sid], [sname], [nvname]) VALUES (4, N'Hang', N'NV04')
GO
INSERT [dbo].[Work_shift] ([wid], [wname], [time_work]) VALUES (1, N'S', 6)
INSERT [dbo].[Work_shift] ([wid], [wname], [time_work]) VALUES (2, N'C', 6)
INSERT [dbo].[Work_shift] ([wid], [wname], [time_work]) VALUES (3, N'Full', 12)
GO
SET IDENTITY_INSERT [dbo].[WorkingTime] ON 

INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (1, 1, CAST(N'2022-08-08T06:30:33.300' AS DateTime), CAST(N'2022-08-08T12:30:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (6, 1, CAST(N'2022-08-09T06:30:33.300' AS DateTime), CAST(N'2022-08-09T12:40:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (7, 1, CAST(N'2022-08-10T06:30:33.300' AS DateTime), CAST(N'2022-08-10T12:50:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (9, 1, CAST(N'2022-08-01T06:35:33.300' AS DateTime), CAST(N'2022-08-01T12:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (10, 1, CAST(N'2022-08-02T06:35:33.300' AS DateTime), CAST(N'2022-08-02T13:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (11, 1, CAST(N'2022-08-03T06:30:33.300' AS DateTime), CAST(N'2022-08-03T12:30:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (12, 1, CAST(N'2022-08-04T06:30:33.300' AS DateTime), CAST(N'2022-08-04T13:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (13, 1, CAST(N'2022-08-05T06:35:33.300' AS DateTime), CAST(N'2022-08-05T16:00:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (14, 1, CAST(N'2022-08-06T06:35:33.300' AS DateTime), CAST(N'2022-08-06T13:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (15, 1, CAST(N'2022-08-07T06:35:33.300' AS DateTime), CAST(N'2022-08-07T12:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (16, 1, CAST(N'2022-08-11T06:35:33.300' AS DateTime), CAST(N'2022-08-11T19:35:33.300' AS DateTime), 3)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (17, 1, CAST(N'2022-08-12T06:35:33.300' AS DateTime), CAST(N'2022-08-12T12:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (18, 1, CAST(N'2022-08-13T06:35:33.300' AS DateTime), CAST(N'2022-08-13T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (19, 1, CAST(N'2022-08-14T06:35:33.300' AS DateTime), CAST(N'2022-08-14T12:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (21, 1, CAST(N'2022-08-15T06:35:33.300' AS DateTime), CAST(N'2022-08-15T12:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (22, 1, CAST(N'2022-08-16T06:35:33.300' AS DateTime), CAST(N'2022-08-16T12:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (23, 1, CAST(N'2022-08-17T06:35:33.300' AS DateTime), CAST(N'2022-08-17T12:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (24, 1, CAST(N'2022-08-18T06:35:33.300' AS DateTime), CAST(N'2022-08-18T12:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (25, 1, CAST(N'2022-08-19T06:35:33.300' AS DateTime), CAST(N'2022-08-19T12:45:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (26, 1, CAST(N'2022-08-20T06:35:33.300' AS DateTime), CAST(N'2022-08-20T12:45:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (27, 1, CAST(N'2022-08-21T06:35:33.300' AS DateTime), CAST(N'2022-08-21T13:45:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (28, 1, CAST(N'2022-08-22T06:35:33.300' AS DateTime), CAST(N'2022-08-22T12:45:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (29, 1, CAST(N'2022-08-23T06:35:33.300' AS DateTime), CAST(N'2022-08-23T13:45:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (30, 1, CAST(N'2022-08-24T06:35:33.300' AS DateTime), CAST(N'2022-08-24T12:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (31, 1, CAST(N'2022-08-25T06:35:33.300' AS DateTime), CAST(N'2022-08-25T12:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (32, 1, CAST(N'2022-08-26T06:35:33.300' AS DateTime), CAST(N'2022-08-26T14:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (33, 1, CAST(N'2022-08-27T06:35:33.300' AS DateTime), CAST(N'2022-08-27T19:35:33.300' AS DateTime), 3)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (34, 1, CAST(N'2022-08-28T06:35:33.300' AS DateTime), CAST(N'2022-08-28T12:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (35, 1, CAST(N'2022-08-29T06:35:33.300' AS DateTime), CAST(N'2022-08-29T12:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (36, 1, CAST(N'2022-08-30T06:35:33.300' AS DateTime), CAST(N'2022-08-30T12:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (50, 1, CAST(N'2022-08-31T06:35:33.300' AS DateTime), CAST(N'2022-08-31T12:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (111, 2, CAST(N'2022-08-01T06:35:33.300' AS DateTime), CAST(N'2022-08-01T12:25:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (112, 2, CAST(N'2022-08-02T06:35:33.300' AS DateTime), CAST(N'2022-08-02T11:36:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (113, 2, CAST(N'2022-08-03T06:35:33.300' AS DateTime), CAST(N'2022-08-03T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (114, 2, CAST(N'2022-08-04T06:35:33.300' AS DateTime), CAST(N'2022-08-04T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (115, 2, CAST(N'2022-08-05T06:35:33.300' AS DateTime), CAST(N'2022-08-05T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (116, 2, CAST(N'2022-08-06T06:35:33.300' AS DateTime), CAST(N'2022-08-06T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (117, 2, CAST(N'2022-08-07T06:35:33.300' AS DateTime), CAST(N'2022-08-07T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (118, 2, CAST(N'2022-08-08T06:35:33.300' AS DateTime), CAST(N'2022-08-08T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (119, 2, CAST(N'2022-08-09T06:35:33.300' AS DateTime), CAST(N'2022-08-09T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (120, 2, CAST(N'2022-08-10T06:35:33.300' AS DateTime), CAST(N'2022-08-10T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (121, 2, CAST(N'2022-08-11T06:35:33.300' AS DateTime), CAST(N'2022-08-11T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (122, 2, CAST(N'2022-08-12T06:35:33.300' AS DateTime), CAST(N'2022-08-12T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (123, 2, CAST(N'2022-08-13T06:35:33.300' AS DateTime), CAST(N'2022-08-13T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (124, 2, CAST(N'2022-08-14T06:35:33.300' AS DateTime), CAST(N'2022-08-14T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (125, 2, CAST(N'2022-08-15T06:35:33.300' AS DateTime), CAST(N'2022-08-15T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (126, 2, CAST(N'2022-08-16T06:35:33.300' AS DateTime), CAST(N'2022-08-16T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (127, 2, CAST(N'2022-08-17T06:35:33.300' AS DateTime), CAST(N'2022-08-17T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (128, 2, CAST(N'2022-08-18T06:35:33.300' AS DateTime), CAST(N'2022-08-18T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (129, 2, CAST(N'2022-08-19T06:35:33.300' AS DateTime), CAST(N'2022-08-19T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (130, 2, CAST(N'2022-08-20T06:35:33.300' AS DateTime), CAST(N'2022-08-20T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (131, 2, CAST(N'2022-08-21T06:35:33.300' AS DateTime), CAST(N'2022-08-21T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (132, 3, CAST(N'2022-08-01T06:35:33.300' AS DateTime), CAST(N'2022-08-01T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (133, 3, CAST(N'2022-08-02T06:35:33.300' AS DateTime), CAST(N'2022-08-02T18:35:33.300' AS DateTime), 3)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (134, 3, CAST(N'2022-08-03T06:35:33.300' AS DateTime), CAST(N'2022-08-03T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (135, 3, CAST(N'2022-08-04T06:35:33.300' AS DateTime), CAST(N'2022-08-04T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (136, 3, CAST(N'2022-08-05T06:35:33.300' AS DateTime), CAST(N'2022-08-05T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (137, 3, CAST(N'2022-08-06T06:35:33.300' AS DateTime), CAST(N'2022-08-06T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (138, 3, CAST(N'2022-08-07T06:35:33.300' AS DateTime), CAST(N'2022-08-07T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (139, 3, CAST(N'2022-08-08T06:35:33.300' AS DateTime), CAST(N'2022-08-08T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (140, 3, CAST(N'2022-08-09T06:35:33.300' AS DateTime), CAST(N'2022-08-09T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (141, 3, CAST(N'2022-08-10T06:35:33.300' AS DateTime), CAST(N'2022-08-10T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (142, 3, CAST(N'2022-08-11T06:35:33.300' AS DateTime), CAST(N'2022-08-11T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (143, 3, CAST(N'2022-08-12T06:35:33.300' AS DateTime), CAST(N'2022-08-12T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (144, 3, CAST(N'2022-08-13T06:35:33.300' AS DateTime), CAST(N'2022-08-13T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (145, 3, CAST(N'2022-08-14T06:35:33.300' AS DateTime), CAST(N'2022-08-14T13:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (146, 3, CAST(N'2022-08-15T06:35:33.300' AS DateTime), CAST(N'2022-08-15T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (147, 3, CAST(N'2022-08-16T06:35:33.300' AS DateTime), CAST(N'2022-08-16T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (148, 3, CAST(N'2022-08-17T06:35:33.300' AS DateTime), CAST(N'2022-08-17T12:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (149, 3, CAST(N'2022-08-18T06:35:33.300' AS DateTime), CAST(N'2022-08-18T18:35:33.300' AS DateTime), 3)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (150, 3, CAST(N'2022-08-19T06:35:33.300' AS DateTime), CAST(N'2022-08-19T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (151, 3, CAST(N'2022-08-20T06:35:33.300' AS DateTime), CAST(N'2022-08-20T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (152, 3, CAST(N'2022-08-21T06:35:33.300' AS DateTime), CAST(N'2022-08-21T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (153, 3, CAST(N'2022-08-22T06:35:33.300' AS DateTime), CAST(N'2022-08-22T18:35:33.300' AS DateTime), 3)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (154, 3, CAST(N'2022-08-23T06:35:33.300' AS DateTime), CAST(N'2022-08-23T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (155, 3, CAST(N'2022-08-24T06:35:33.300' AS DateTime), CAST(N'2022-08-24T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (156, 3, CAST(N'2022-08-25T06:35:33.300' AS DateTime), CAST(N'2022-08-25T18:35:33.300' AS DateTime), 3)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (157, 3, CAST(N'2022-08-26T06:35:33.300' AS DateTime), CAST(N'2022-08-26T13:05:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (158, 3, CAST(N'2022-08-27T06:35:33.300' AS DateTime), CAST(N'2022-08-27T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (159, 3, CAST(N'2022-08-28T06:35:33.300' AS DateTime), CAST(N'2022-08-28T17:35:33.300' AS DateTime), 3)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (160, 3, CAST(N'2022-08-29T06:35:33.300' AS DateTime), CAST(N'2022-08-29T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (161, 3, CAST(N'2022-08-30T06:35:33.300' AS DateTime), CAST(N'2022-08-30T18:35:33.300' AS DateTime), 3)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (162, 3, CAST(N'2022-08-31T06:35:33.300' AS DateTime), CAST(N'2022-08-31T12:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (163, 4, CAST(N'2022-08-01T06:35:33.300' AS DateTime), CAST(N'2022-08-01T12:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (165, 4, CAST(N'2022-08-02T06:35:33.300' AS DateTime), CAST(N'2022-08-02T14:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (166, 4, CAST(N'2022-08-03T06:35:33.300' AS DateTime), CAST(N'2022-08-03T14:00:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (167, 4, CAST(N'2022-08-04T06:35:33.300' AS DateTime), CAST(N'2022-08-04T13:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (168, 4, CAST(N'2022-08-05T06:35:33.300' AS DateTime), CAST(N'2022-08-05T13:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (169, 4, CAST(N'2022-08-06T06:35:33.300' AS DateTime), CAST(N'2022-08-06T12:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (170, 4, CAST(N'2022-08-07T06:35:33.300' AS DateTime), CAST(N'2022-08-07T12:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (171, 4, CAST(N'2022-08-08T06:35:33.300' AS DateTime), CAST(N'2022-08-08T12:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (172, 4, CAST(N'2022-08-09T06:35:33.300' AS DateTime), CAST(N'2022-08-09T11:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (173, 4, CAST(N'2022-08-10T06:35:33.300' AS DateTime), CAST(N'2022-08-10T12:05:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (174, 4, CAST(N'2022-08-11T06:35:33.300' AS DateTime), CAST(N'2022-08-11T11:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (175, 4, CAST(N'2022-08-12T06:35:33.300' AS DateTime), CAST(N'2022-08-12T12:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (177, 4, CAST(N'2022-08-13T06:35:33.300' AS DateTime), CAST(N'2022-08-13T12:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (178, 4, CAST(N'2022-08-14T06:35:33.300' AS DateTime), CAST(N'2022-08-14T11:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (179, 4, CAST(N'2022-08-15T06:35:33.300' AS DateTime), CAST(N'2022-08-15T12:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (180, 4, CAST(N'2022-08-16T06:35:33.300' AS DateTime), CAST(N'2022-08-16T12:35:33.300' AS DateTime), 1)
GO
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (181, 4, CAST(N'2022-08-17T06:35:33.300' AS DateTime), CAST(N'2022-08-17T12:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (182, 4, CAST(N'2022-08-18T06:35:33.300' AS DateTime), CAST(N'2022-08-18T12:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (183, 4, CAST(N'2022-08-19T06:35:33.300' AS DateTime), CAST(N'2022-08-19T12:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (184, 4, CAST(N'2022-08-20T06:35:33.300' AS DateTime), CAST(N'2022-08-20T12:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (185, 4, CAST(N'2022-08-21T06:35:33.300' AS DateTime), CAST(N'2022-08-21T12:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (186, 4, CAST(N'2022-08-22T06:35:33.300' AS DateTime), CAST(N'2022-08-22T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (187, 4, CAST(N'2022-08-23T06:35:33.300' AS DateTime), CAST(N'2022-08-23T12:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (188, 4, CAST(N'2022-08-24T06:35:33.300' AS DateTime), CAST(N'2022-08-24T12:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (189, 4, CAST(N'2022-08-25T06:35:33.300' AS DateTime), CAST(N'2022-08-25T12:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (190, 4, CAST(N'2022-08-26T06:35:33.300' AS DateTime), CAST(N'2022-08-26T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (191, 4, CAST(N'2022-08-27T06:35:33.300' AS DateTime), CAST(N'2022-08-27T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (192, 4, CAST(N'2022-08-28T06:35:33.300' AS DateTime), CAST(N'2022-08-28T12:05:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (193, 4, CAST(N'2022-08-29T06:35:33.300' AS DateTime), CAST(N'2022-08-29T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (194, 2, CAST(N'2022-08-27T06:35:33.300' AS DateTime), CAST(N'2022-08-27T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (195, 2, CAST(N'2022-08-24T06:35:33.300' AS DateTime), CAST(N'2022-08-24T13:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (196, 2, CAST(N'2022-08-25T06:35:33.300' AS DateTime), CAST(N'2022-08-25T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (197, 2, CAST(N'2022-08-26T06:35:33.300' AS DateTime), CAST(N'2022-08-26T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (198, 2, CAST(N'2022-08-28T06:35:33.300' AS DateTime), CAST(N'2022-08-28T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (199, 2, CAST(N'2022-08-29T06:35:33.300' AS DateTime), CAST(N'2022-08-29T12:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (200, 2, CAST(N'2022-08-31T06:35:33.300' AS DateTime), CAST(N'2022-08-31T12:35:33.300' AS DateTime), 2)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (202, 4, CAST(N'2022-08-30T06:35:33.300' AS DateTime), CAST(N'2022-08-30T13:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (203, 4, CAST(N'2022-08-31T06:35:33.300' AS DateTime), CAST(N'2022-08-31T12:35:33.300' AS DateTime), 1)
INSERT [dbo].[WorkingTime] ([tid], [sid], [checkin], [checkout], [wid]) VALUES (204, 2, CAST(N'2022-08-22T06:35:33.300' AS DateTime), CAST(N'2022-08-22T12:35:33.300' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[WorkingTime] OFF
GO
ALTER TABLE [dbo].[Salary_management]  WITH CHECK ADD  CONSTRAINT [FK_Salary_management_Salary] FOREIGN KEY([said])
REFERENCES [dbo].[Salary] ([said])
GO
ALTER TABLE [dbo].[Salary_management] CHECK CONSTRAINT [FK_Salary_management_Salary]
GO
ALTER TABLE [dbo].[Salary_management]  WITH CHECK ADD  CONSTRAINT [FK_Salary_management_Staff] FOREIGN KEY([sid])
REFERENCES [dbo].[Staff] ([sid])
GO
ALTER TABLE [dbo].[Salary_management] CHECK CONSTRAINT [FK_Salary_management_Staff]
GO
ALTER TABLE [dbo].[WorkingTime]  WITH CHECK ADD  CONSTRAINT [FK_WorkingTime_Staff] FOREIGN KEY([sid])
REFERENCES [dbo].[Staff] ([sid])
GO
ALTER TABLE [dbo].[WorkingTime] CHECK CONSTRAINT [FK_WorkingTime_Staff]
GO
ALTER TABLE [dbo].[WorkingTime]  WITH CHECK ADD  CONSTRAINT [FK_WorkingTime_Work_shift] FOREIGN KEY([wid])
REFERENCES [dbo].[Work_shift] ([wid])
GO
ALTER TABLE [dbo].[WorkingTime] CHECK CONSTRAINT [FK_WorkingTime_Work_shift]
GO
USE [master]
GO
ALTER DATABASE [Test_1] SET  READ_WRITE 
GO
