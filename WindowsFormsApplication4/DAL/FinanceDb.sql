USE [master]
GO
/****** Object:  Database [Financing]    Script Date: 12/04/2018 09:09:30 ******/
CREATE DATABASE [Financing] ON  PRIMARY 
( NAME = N'Financing', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Financing.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Financing_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Financing_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Financing] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Financing].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Financing] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Financing] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Financing] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Financing] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Financing] SET ARITHABORT OFF
GO
ALTER DATABASE [Financing] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Financing] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Financing] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Financing] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Financing] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Financing] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Financing] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Financing] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Financing] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Financing] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Financing] SET  DISABLE_BROKER
GO
ALTER DATABASE [Financing] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Financing] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Financing] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Financing] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Financing] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Financing] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Financing] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Financing] SET  READ_WRITE
GO
ALTER DATABASE [Financing] SET RECOVERY FULL
GO
ALTER DATABASE [Financing] SET  MULTI_USER
GO
ALTER DATABASE [Financing] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Financing] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'Financing', N'ON'
GO
USE [Financing]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/04/2018 09:09:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
	[IsPayOut] [bit] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON
INSERT [dbo].[Category] ([Id], [CategoryName], [IsPayOut]) VALUES (1, N'生活消费', 1)
INSERT [dbo].[Category] ([Id], [CategoryName], [IsPayOut]) VALUES (2, N'休闲娱乐', 1)
INSERT [dbo].[Category] ([Id], [CategoryName], [IsPayOut]) VALUES (3, N'工作收入', 0)
INSERT [dbo].[Category] ([Id], [CategoryName], [IsPayOut]) VALUES (4, N'投资收益', 0)
SET IDENTITY_INSERT [dbo].[Category] OFF
/****** Object:  Table [dbo].[Item]    Script Date: 12/04/2018 09:09:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[ItemName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Item] ON
INSERT [dbo].[Item] ([Id], [CategoryId], [ItemName]) VALUES (1, 1, N'餐饮')
INSERT [dbo].[Item] ([Id], [CategoryId], [ItemName]) VALUES (2, 1, N'交通费')
INSERT [dbo].[Item] ([Id], [CategoryId], [ItemName]) VALUES (3, 2, N'电影')
INSERT [dbo].[Item] ([Id], [CategoryId], [ItemName]) VALUES (4, 2, N'演唱会')
INSERT [dbo].[Item] ([Id], [CategoryId], [ItemName]) VALUES (5, 3, N'工资')
INSERT [dbo].[Item] ([Id], [CategoryId], [ItemName]) VALUES (6, 3, N'奖金')
INSERT [dbo].[Item] ([Id], [CategoryId], [ItemName]) VALUES (7, 4, N'股票')
INSERT [dbo].[Item] ([Id], [CategoryId], [ItemName]) VALUES (8, 4, N'基金')
SET IDENTITY_INSERT [dbo].[Item] OFF
/****** Object:  Table [dbo].[List]    Script Date: 12/04/2018 09:09:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[List](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NOT NULL,
	[Amount] [float] NULL,
	[TradeDate] [datetime] NULL,
	[Explain] [ntext] NULL,
 CONSTRAINT [PK_List] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[List] ON
INSERT [dbo].[List] ([Id], [ItemId], [Amount], [TradeDate], [Explain]) VALUES (1, 5, 4000, CAST(0x0000A9A900000000 AS DateTime), N'收入工资4000元')
SET IDENTITY_INSERT [dbo].[List] OFF
/****** Object:  Default [DF_Category_IsPayOut]    Script Date: 12/04/2018 09:09:31 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_IsPayOut]  DEFAULT ((0)) FOR [IsPayOut]
GO
/****** Object:  ForeignKey [FK_Item_Category]    Script Date: 12/04/2018 09:09:31 ******/
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Category]
GO
/****** Object:  ForeignKey [FK_List_Item]    Script Date: 12/04/2018 09:09:31 ******/
ALTER TABLE [dbo].[List]  WITH CHECK ADD  CONSTRAINT [FK_List_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[List] CHECK CONSTRAINT [FK_List_Item]
GO
