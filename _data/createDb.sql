--USE [master]
--GO
/****** Object:  Database [Db]    Script Date: 12/24/2021 7:37:49 PM ******/
/*
CREATE DATABASE [Db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Db', FILENAME = N'C:\Users\bruce\Db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Db_log', FILENAME = N'C:\Users\bruce\Db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Db] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Db] SET ARITHABORT OFF 
GO
ALTER DATABASE [Db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Db] SET  MULTI_USER 
GO
ALTER DATABASE [Db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Db] SET QUERY_STORE = OFF
GO
USE [Db]
GO
*/
/****** Object:  Table [dbo].[Column]    Script Date: 12/24/2021 7:37:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Column](
	[Id] [varchar](10) NOT NULL,
	[TableId] [varchar](10) NOT NULL,
	[Code] [varchar](30) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[DataType] [varchar](20) NOT NULL,
	[Nullable] [bit] NOT NULL,
	[DefaultValue] [varchar](20) NULL,
	[Sort] [int] NOT NULL,
	[Note] [nvarchar](255) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Column] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Crud]    Script Date: 12/24/2021 7:37:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Crud](
	[Id] [varchar](10) NOT NULL,
	[ProjectId] [varchar](10) NOT NULL,
	[ProgCode] [varchar](30) NOT NULL,
	[ProgName] [nvarchar](30) NOT NULL,
	[LabelHori] [bit] NOT NULL,
	[ReadSql] [varchar](500) NOT NULL,
	[TableAs] [varchar](10) NULL,
	[HasCreate] [bit] NOT NULL,
	[HasUpdate] [bit] NOT NULL,
	[HasDelete] [bit] NOT NULL,
	[HasView] [bit] NOT NULL,
	[HasExport] [bit] NOT NULL,
	[HasReset] [bit] NOT NULL,
	[AuthType] [tinyint] NOT NULL,
	[Status] [bit] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Revised] [datetime] NULL,
 CONSTRAINT [PK_Crud] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CrudEitem]    Script Date: 12/24/2021 7:37:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CrudEitem](
	[Id] [varchar](10) NOT NULL,
	[EtableId] [varchar](10) NOT NULL,
	[ColumnId] [varchar](10) NOT NULL,
	[EitemType] [varchar](10) NOT NULL,
	[ItemData] [nvarchar](50) NULL,
	[Required] [bit] NOT NULL,
	[HasCreate] [bit] NOT NULL,
	[HasUpdate] [bit] NOT NULL,
	[PlaceHolder] [varchar](10) NULL,
	[DefaultValue] [varchar](10) NULL,
	[PosGroup] [varchar](10) NULL,
	[LayoutCols] [varchar](10) NULL,
	[Width] [int] NOT NULL,
	[CheckType] [varchar](10) NOT NULL,
	[CheckData] [varchar](10) NULL,
	[Sort] [int] NOT NULL,
 CONSTRAINT [PK_CrudEitem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CrudEtable]    Script Date: 12/24/2021 7:37:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CrudEtable](
	[Id] [varchar](10) NOT NULL,
	[CrudId] [varchar](10) NOT NULL,
	[TableId] [varchar](10) NOT NULL,
	[PkeyFid] [varchar](10) NOT NULL,
	[FkeyFid] [varchar](10) NULL,
	[Col4] [varchar](30) NOT NULL,
	[OrderBy] [varchar](10) NOT NULL,
	[Sort] [int] NOT NULL,
	[HalfWidth] [bit] NOT NULL,
 CONSTRAINT [PK_CrudEtable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CrudQitem]    Script Date: 12/24/2021 7:37:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CrudQitem](
	[Id] [varchar](10) NOT NULL,
	[CrudId] [varchar](10) NOT NULL,
	[ColumnId] [varchar](10) NOT NULL,
	[TableAs] [varchar](20) NOT NULL,
	[QitemType] [varchar](20) NOT NULL,
	[ItemData] [varchar](20) NULL,
	[Op] [varchar](10) NOT NULL,
	[IsRange] [bit] NOT NULL,
	[IsFind2] [bit] NOT NULL,
	[PosGroup] [varchar](10) NULL,
	[LayoutCols] [varchar](20) NULL,
	[Sort] [int] NOT NULL,
 CONSTRAINT [PK_CrudQitem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CrudRitem]    Script Date: 12/24/2021 7:37:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CrudRitem](
	[Id] [varchar](10) NOT NULL,
	[CrudId] [varchar](10) NOT NULL,
	[ColumnCode] [varchar](30) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Width] [int] NOT NULL,
	[RitemType] [varchar](10) NOT NULL,
	[Sort] [int] NOT NULL,
 CONSTRAINT [PK_CrudRitem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 12/24/2021 7:37:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[Id] [varchar](10) NOT NULL,
	[Code] [nvarchar](30) NOT NULL,
	[DbName] [varchar](20) NOT NULL,
	[ProjectPath] [varchar](255) NOT NULL,
	[ConnectStr] [varchar](255) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table]    Script Date: 12/24/2021 7:37:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table](
	[Id] [varchar](10) NOT NULL,
	[ProjectId] [varchar](10) NOT NULL,
	[Code] [varchar](30) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Note] [nvarchar](255) NOT NULL,
	[TranLog] [bit] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Table] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XpCode]    Script Date: 12/24/2021 7:37:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XpCode](
	[Type] [varchar](20) NOT NULL,
	[Value] [varchar](10) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Sort] [int] NOT NULL,
	[Ext] [varchar](30) NULL,
	[Note] [nvarchar](255) NULL,
 CONSTRAINT [PK_XpCode] PRIMARY KEY CLUSTERED 
(
	[Type] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB37ZKA', N'5X9RB36MYA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'PKey', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB381FA', N'5X9RB36MYA', N'TableId', N'資料表Id', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3845A', N'5X9RB36MYA', N'Name', N'欄位名稱', N'nvarchar(30)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3890A', N'5X9RB36MYA', N'DataType', N'資料型態', N'varchar(20)', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB38APA', N'5X9RB36MYA', N'Nullable', N'可空值', N'bit', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB38E9A', N'5X9RB36MYA', N'DefaultValue', N'預設值', N'varchar(20)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB38G3A', N'5X9RB36MYA', N'Sort', N'排序', N'int', 0, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB38HTA', N'5X9RB36MYA', N'Note', N'說明', N'nvarchar(255)', 1, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB38KTA', N'5X9RB36MYA', N'Status', N'資料狀態', N'bit', 0, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB38NHA', N'5X9RB36PRA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'PKey', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB38QJA', N'5X9RB36PRA', N'ProjectId', N'專案Id', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB395WA', N'5X9RB36PRA', N'LabelHori', N'水平Label', N'bit', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB397PA', N'5X9RB36PRA', N'ReadSql', N'查詢Sql', N'varchar(500)', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB39DFA', N'5X9RB36PRA', N'TableAs', N'資料表別名', N'varchar(10)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB39FLA', N'5X9RB36PRA', N'HasCreate', N'Create功能', N'bit', 0, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB39HDA', N'5X9RB36PRA', N'HasUpdate', N'Update功能', N'bit', 0, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB39L2A', N'5X9RB36PRA', N'HasDelete', N'Delete功能', N'bit', 0, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB39NSA', N'5X9RB36PRA', N'HasView', N'View功能', N'bit', 0, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB39QUA', N'5X9RB36PRA', N'HasExport', N'Export功能', N'bit', 0, N'', 12, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB39TLA', N'5X9RB36PRA', N'HasReset', N'Reset功能', N'bit', 0, N'', 13, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB39VJA', N'5X9RB36PRA', N'Status', N'資料狀態', N'bit', 0, N'', 15, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB39XPA', N'5X9RB36TCA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'PKey', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3A19A', N'5X9RB36TCA', N'EtableId', N'EtableId', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3A4CA', N'5X9RB36TCA', N'InputType', N'輸入類型', N'varchar(10)', 0, N'', 4, N'', 0)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3A6GA', N'5X9RB36TCA', N'InputData', N'輸入資料', N'nvarchar(50)', 1, N'', 5, N'', 0)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3A9JA', N'5X9RB36TCA', N'Required', N'必填', N'bit', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3ABDA', N'5X9RB36TCA', N'HasCreate', N'Create功能', N'bit', 0, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3ACRA', N'5X9RB36TCA', N'HasUpdate', N'Update功能', N'bit', 0, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3AE4A', N'5X9RB36TCA', N'PlaceHolder', N'PlaceHolder', N'varchar(10)', 1, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3AHCA', N'5X9RB36TCA', N'DefaultValue', N'預設值', N'varchar(10)', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3AT3A', N'5X9RB36TCA', N'PosGroup', N'同列', N'varchar(10)', 1, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3BH2A', N'5X9RB36TCA', N'LayoutCols', N'版位', N'varchar(10)', 1, N'', 12, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3DMHA', N'5X9RB36TCA', N'Width', N'欄位寬度', N'int', 0, N'', 13, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3E38A', N'5X9RB36TCA', N'CheckType', N'檢查類型', N'varchar(10)', 0, N'', 14, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3E4QA', N'5X9RB36TCA', N'CheckData', N'檢查資料', N'varchar(10)', 1, N'', 15, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3E6SA', N'5X9RB36TCA', N'Sort', N'排序', N'int', 0, N'', 16, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3E8JA', N'5X9RB36VLA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'PKey', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3EAAA', N'5X9RB36VLA', N'CrudId', N'CrudId', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3EBUA', N'5X9RB36VLA', N'TableId', N'資料表Id', N'varchar(10)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3EDAA', N'5X9RB36VLA', N'Kid', N'主鍵Id', N'varchar(10)', 0, N'', 4, N'', 0)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3EEPA', N'5X9RB36VLA', N'MapFid', N'外鍵Id', N'varchar(10)', 1, N'', 5, N'', 0)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3EG4A', N'5X9RB36VLA', N'Col4', N'Col4', N'varchar(30)', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3EHJA', N'5X9RB36VLA', N'OrderBy', N'OrderBy', N'varchar(10)', 0, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3EK8A', N'5X9RB36VLA', N'Sort', N'排序', N'int', 0, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3ELQA', N'5X9RB36XEA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'PKey', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3ENRA', N'5X9RB36XEA', N'CrudId', N'CrudId', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3F0AA', N'5X9RB36XEA', N'TableAs', N'資料表別名', N'varchar(20)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3FABA', N'5X9RB36XEA', N'InputType', N'輸入類型', N'varchar(20)', 0, N'', 5, N'', 0)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3FC9A', N'5X9RB36XEA', N'InputData', N'輸入資料', N'varchar(20)', 1, N'', 6, N'', 0)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3FELA', N'5X9RB36XEA', N'Op', N'比對方式', N'varchar(10)', 0, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3FG9A', N'5X9RB36XEA', N'IsRange', N'Range比對', N'bit', 0, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3FHUA', N'5X9RB36XEA', N'IsFind2', N'進階查詢', N'bit', 0, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3FKDA', N'5X9RB36XEA', N'PosGroup', N'同列', N'varchar(10)', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3FM3A', N'5X9RB36XEA', N'LayoutCols', N'版位', N'varchar(20)', 1, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3FNUA', N'5X9RB36XEA', N'ExtInfo', N'其他資料', N'varchar(20)', 1, N'', 12, N'', 0)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3FQ1A', N'5X9RB36XEA', N'Sort', N'排序', N'int', 0, N'', 12, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3FRUA', N'5X9RB36ZCA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'PKey', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3FTJA', N'5X9RB36ZCA', N'CrudId', N'CrudId', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3G21A', N'5X9RB36ZCA', N'Width', N'欄位寬度', N'int', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3G3PA', N'5X9RB36ZCA', N'RitemType', N'結果欄位類型', N'varchar(10)', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3G5KA', N'5X9RB36ZCA', N'ExtInfo', N'其他資料', N'varchar(30)', 1, N'', 7, N'', 0)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3G71A', N'5X9RB36ZCA', N'Sort', N'排序', N'int', 0, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3G8EA', N'5X9RB3720A', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'PKey', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3GG2A', N'5X9RB3720A', N'DbName', N'Db名稱', N'varchar(20)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3GK9A', N'5X9RB3720A', N'ProjectPath', N'專案路徑', N'varchar(255)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3GLJA', N'5X9RB3720A', N'ConnectStr', N'Db連線字串', N'varchar(255)', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3GN2A', N'5X9RB3720A', N'Status', N'資料狀態', N'bit', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3GPHA', N'5X9RB373ZA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'PKey', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3GRZA', N'5X9RB373ZA', N'ProjectId', N'專案Id', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3GT3A', N'5X9RB373ZA', N'Name', N'資料表名稱', N'nvarchar(30)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3GWNA', N'5X9RB373ZA', N'Note', N'說明', N'nvarchar(255)', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5X9RB3GZ3A', N'5X9RB373ZA', N'Status', N'資料狀態', N'bit', 0, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XBA43L8QA', N'5X9RB36TCA', N'ColumnId', N'欄位Id', N'varchar(10)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XBA43LBNA', N'5X9RB36XEA', N'ColumnId', N'欄位Id', N'varchar(10)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XCRAA', N'5XD29XBSMA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'PKey', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XCUNA', N'5XD29XBSMA', N'Name', N'部門名稱', N'nvarchar(30)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XCW1A', N'5XD29XBSMA', N'MgrId', N'主管Id', N'varchar(10)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XD5LA', N'5XD29XC3BA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'PKey', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XD72A', N'5XD29XC3BA', N'Account', N'帳號', N'varchar(20)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XD8JA', N'5XD29XC3BA', N'Name', N'使用者名稱', N'nvarchar(20)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XDARA', N'5XD29XC3BA', N'DeptId', N'部門', N'varchar(10)', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XDBYA', N'5XD29XC3BA', N'Status', N'資料狀態', N'bit', 0, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XDDDA', N'5XD29XC6LA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'PKey', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XDF1A', N'5XD29XC6LA', N'UserId', N'用戶Id', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XDGTA', N'5XD29XC6LA', N'JobName', N'工作名稱', N'nvarchar(30)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XDKZA', N'5XD29XC6LA', N'JobType', N'工作類型', N'nvarchar(30)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XDN0A', N'5XD29XC6LA', N'JobPlace', N'工作地點', N'nvarchar(30)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XDPVA', N'5XD29XC6LA', N'StartEnd', N'起迄時間', N'varchar(30)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XDUAA', N'5XD29XC6LA', N'CorpName', N'公司名稱', N'nvarchar(30)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XDVWA', N'5XD29XC6LA', N'CorpUsers', N'公司人數', N'int', 0, N'0', 8, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XDXPA', N'5XD29XC6LA', N'IsManaged', N'管理職', N'bit', 0, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XE1AA', N'5XD29XC6LA', N'JobDesc', N'工作說明', N'varchar(-1)', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XE2UA', N'5XD29XC7WA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'PKey', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XE9LA', N'5XD29XC7WA', N'UserId', N'用戶Id', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XFPMA', N'5XD29XC7WA', N'LangName', N'語言名稱', N'nvarchar(30)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XFX1A', N'5XD29XC7WA', N'ListenLevel', N'聴力', N'tinyint', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XFZXA', N'5XD29XC7WA', N'SpeakLevel', N'說', N'tinyint', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XG6HA', N'5XD29XC7WA', N'ReadLevel', N'閱讀', N'tinyint', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XG8HA', N'5XD29XC7WA', N'WriteLevel', N'書寫', N'tinyint', 0, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XGACA', N'5XD29XC7WA', N'Sort', N'排序', N'int', 0, N'', 8, N'', 1)
GO
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XGC3A', N'5XD29XC9AA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'PKey', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XGE9A', N'5XD29XC9AA', N'UserId', N'用戶Id', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XGG3A', N'5XD29XC9AA', N'LicenseName', N'證照名稱', N'nvarchar(30)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XGHSA', N'5XD29XC9AA', N'StartEnd', N'起迄時間', N'varchar(30)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XGKPA', N'5XD29XC9AA', N'FileName', N'上傳檔名', N'nvarchar(100)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XGNVA', N'5XD29XCAWA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'PKey', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XGR4A', N'5XD29XCAWA', N'UserId', N'用戶Id', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XGSRA', N'5XD29XCAWA', N'SchoolName', N'學校名稱', N'nvarchar(30)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XGV8A', N'5XD29XCAWA', N'SchoolDept', N'科系', N'nvarchar(20)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XGWUA', N'5XD29XCAWA', N'SchoolType', N'學歷種類', N'nvarchar(20)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XGZGA', N'5XD29XCAWA', N'StartEnd', N'起迄時間', N'varchar(30)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XH1CA', N'5XD29XCAWA', N'Graduated', N'是否畢業', N'bit', 0, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XH4HA', N'5XD29XCDPA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'PKey', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XH6EA', N'5XD29XCDPA', N'UserId', N'用戶Id', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XH8EA', N'5XD29XCDPA', N'SkillName', N'技能名稱', N'nvarchar(30)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XD29XHA2A', N'5XD29XCDPA', N'SkillDesc', N'技能說明', N'nvarchar(500)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XLQ99LTVA', N'5XD29XC9AA', N'Sort', N'排序', N'int', 0, N'', 6, N'', 0)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5XLQ99LV9A', N'5XD29XCDPA', N'Sort', N'排序', N'int', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5YFVGEZSJA', N'5XD29XC3BA', N'Pwd', N'密碼', N'varchar(32)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5YFVJXBYXA', N'5X9RB36MYA', N'Code', N'欄位代碼', N'varchar(30)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5YFVJXC0WA', N'5X9RB36PRA', N'ProgCode', N'功能代碼', N'varchar(30)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5YFVJXC2BA', N'5X9RB36PRA', N'ProgName', N'功能名稱', N'nvarchar(30)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5YFVJXC3RA', N'5X9RB36PRA', N'AuthType', N'權限種類', N'tinyint', 0, N'', 14, N'see Code, 0(無), 1(Ctrl), 2(Action)', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5YFVJXC4ZA', N'5X9RB36PRA', N'Created', N'建檔時間', N'datetime', 0, N'', 16, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5YFVJXC6KA', N'5X9RB36PRA', N'Revised', N'修改時間', N'datetime', 1, N'', 17, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5YFVJXC7TA', N'5X9RB36ZCA', N'ColumnCode', N'欄位代碼', N'varchar(30)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5YFVJXC9YA', N'5X9RB36ZCA', N'Name', N'顯示名稱', N'nvarchar(30)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5YFVJXCB7A', N'5X9RB3720A', N'Code', N'專案代碼', N'nvarchar(30)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5YFVJXCCVA', N'5X9RB373ZA', N'Code', N'資料表代碼', N'varchar(30)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5Z5BHXMCMA', N'5Z5BHXK86A', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5Z5BHXME5A', N'5Z5BHXK86A', N'UserId', N'請假人', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5Z5BHXMFJA', N'5Z5BHXK86A', N'AgentId', N'代理人', N'varchar(10)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5Z5BHXMGLA', N'5Z5BHXK86A', N'LeaveType', N'假別', N'char(1)', 0, N'', 4, N'Code LeaveType', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5Z5BHXMJ7A', N'5Z5BHXK86A', N'StartTime', N'開始時間', N'datetime', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5Z5BHXMKSA', N'5Z5BHXK86A', N'EndTime', N'結束時間', N'datetime', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5Z5BHXMM5A', N'5Z5BHXK86A', N'Hours', N'請假時數', N'decimal', 0, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5Z5BHXMS5A', N'5Z5BHXK86A', N'FlowSignStatus', N'流程簽核狀態', N'char(1)', 0, N'', 9, N'', 0)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5Z5BHXMU0A', N'5Z5BHXK86A', N'Status', N'資料狀態', N'bit', 0, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5Z5BHXMVTA', N'5Z5BHXK86A', N'Creator', N'建檔人員', N'varchar(10)', 0, N'', 12, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5Z5BHXMXVA', N'5Z5BHXK86A', N'Created', N'建檔日期', N'datetime', 0, N'', 13, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5Z5BHXMZRA', N'5Z5BHXK86A', N'Reviser', N'修改人員', N'varchar(10)', 1, N'', 14, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5Z5BHXN1KA', N'5Z5BHXK86A', N'Revised', N'修改日期', N'datetime', 1, N'', 15, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'5ZKB7A6VPA', N'5X9RB36VLA', N'HalfWidth', N'是否半幅寬度', N'bit', 0, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58FUTP10A', N'5X9RB36TCA', N'EitemType', N'編輯欄位種類', N'varchar(10)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58FUTPHMA', N'5X9RB36TCA', N'ItemData', N'欄位資料', N'nvarchar(50)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58FUTPZ6A', N'5X9RB36VLA', N'PkeyFid', N'主鍵欄位Id', N'varchar(10)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58FUTQEQA', N'5X9RB36VLA', N'FkeyFid', N'外鍵欄位Id', N'varchar(10)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58FUTQVNA', N'5X9RB36XEA', N'QitemType', N'查詢欄位種類', N'varchar(20)', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58FUTRAMA', N'5X9RB36XEA', N'ItemData', N'欄位資料', N'varchar(20)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58FUTT5TA', N'5X9RB373ZA', N'TranLog', N'是否記錄交易', N'bit', 0, N'0', 6, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58FV79WAA', N'5Z5BHXK86A', N'FlowLevel', N'流程目前Level', N'tinyint', 0, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58FV7ABUA', N'5Z5BHXK86A', N'FlowStatus', N'流程狀態', N'char(1)', 0, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58FV7ATEA', N'5Z5BHXK86A', N'FileName', N'上傳檔名', N'nvarchar(100)', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58FV7B84A', N'5XD29XC3BA', N'PhotoFile', N'相片檔名', N'nvarchar(100)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58J2RNGAA', N'D58J2RM39A', N'Type', N'資料類別', N'varchar(20)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58J2RNXYA', N'D58J2RM39A', N'Value', N'Key值', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58J2RPC0A', N'D58J2RM39A', N'Name', N'顯示內容', N'nvarchar(30)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58J2RPTKA', N'D58J2RM39A', N'Sort', N'排序', N'int', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58J2RQ9CA', N'D58J2RM39A', N'Ext', N'擴充資訊', N'varchar(30)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58J2RR6RA', N'D58J2RM39A', N'Note', N'備註', N'nvarchar(255)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXL78TA', N'D58LXKZJUA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXL7PHA', N'D58LXKZJUA', N'CmsType', N'Cms類別', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXL84GA', N'D58LXKZJUA', N'DataType', N'資料型態', N'varchar(10)', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXL8LJA', N'D58LXKZJUA', N'Title', N'標題', N'nvarchar(255)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXL926A', N'D58LXKZJUA', N'Text', N'文字內容', N'nvarchar(-1)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXL9JRA', N'D58LXKZJUA', N'Html', N'HTML內容', N'nvarchar(-1)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXL9ZYA', N'D58LXKZJUA', N'Note', N'備註', N'nvarchar(255)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLAE4A', N'D58LXKZJUA', N'FileName', N'上傳檔名', N'nvarchar(100)', 1, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLAWDA', N'D58LXKZJUA', N'StartTime', N'開始時間', N'datetime', 0, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLBBRA', N'D58LXKZJUA', N'EndTime', N'結束時間', N'datetime', 0, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLBS3A', N'D58LXKZJUA', N'Status', N'資料狀態', N'bit', 0, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLC7BA', N'D58LXKZJUA', N'Creator', N'建檔人員', N'varchar(10)', 0, N'', 12, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLCNPA', N'D58LXKZJUA', N'Created', N'建檔日期', N'datetime', 0, N'', 13, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLD4AA', N'D58LXKZJUA', N'Reviser', N'修改人員', N'varchar(10)', 1, N'', 14, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLDKHA', N'D58LXKZJUA', N'Revised', N'修改日期', N'datetime', 1, N'', 15, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLE05A', N'D58LXL00BA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLEGNA', N'D58LXL00BA', N'FldText', N'文字欄位', N'nchar(10)', 1, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLEXFA', N'D58LXL00BA', N'FldNum', N'整數欄位', N'int', 1, N'', 3, N'', 0)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLFDXA', N'D58LXL00BA', N'FldNum2', N'小數欄位', N'float', 1, N'', 4, N'', 0)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLFVLA', N'D58LXL00BA', N'FldCheck', N'Check欄位', N'bit', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLGATA', N'D58LXL00BA', N'FldRadio', N'Radio欄位', N'tinyint', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLGR2A', N'D58LXL00BA', N'FldSelect', N'下拉式欄位', N'varchar(10)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLH7YA', N'D58LXL00BA', N'FldDate', N'日期欄位', N'date', 1, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLHNJA', N'D58LXL00BA', N'FldDatetime', N'時間欄位', N'datetime', 1, N'', 9, N'', 0)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLJ38A', N'D58LXL00BA', N'FldFile', N'檔案欄位', N'nvarchar(100)', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLJJKA', N'D58LXL00BA', N'FldColor', N'Color欄位', N'varchar(10)', 1, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLJZDA', N'D58LXL00BA', N'FldTextarea', N'多行文字欄位', N'nvarchar(-1)', 1, N'', 12, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLKFWA', N'D58LXL00BA', N'FldHtml', N'HTML欄位', N'nvarchar(-1)', 1, N'', 13, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLKXXA', N'D58LXL0GHA', N'Type', N'資料類別', N'varchar(20)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLLC9A', N'D58LXL0GHA', N'Value', N'Key值', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLLTNA', N'D58LXL0GHA', N'Name_zhTW', N'名稱(繁中)', N'nvarchar(30)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLM8FA', N'D58LXL0GHA', N'Name_zhCN', N'名稱(簡中)', N'nvarchar(30)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLMQTA', N'D58LXL0GHA', N'Name_enUS', N'名稱(英文)', N'nvarchar(30)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLN5BA', N'D58LXL0GHA', N'Sort', N'排序', N'int', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLNLEA', N'D58LXL0GHA', N'Ext', N'擴充資訊', N'varchar(30)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLP29A', N'D58LXL0GHA', N'Note', N'備註', N'nvarchar(255)', 1, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLPJHA', N'D58LXL0Y0A', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLPZMA', N'D58LXL0Y0A', N'Name', N'名稱', N'nvarchar(50)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLQF2A', N'D58LXL0Y0A', N'TplFile', N'範本檔名', N'nvarchar(100)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLQWKA', N'D58LXL0Y0A', N'ToEmails', N'收件者', N'varchar(500)', 0, N'', 4, N'', 1)
GO
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLRCUA', N'D58LXL0Y0A', N'Sql', N'SQL內容', N'nvarchar(500)', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLRT0A', N'D58LXL0Y0A', N'Status', N'資料狀態', N'bit', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLS80A', N'D58LXL1D4A', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLSQUA', N'D58LXL1D4A', N'Code', N'代碼', N'varchar(20)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLT5GA', N'D58LXL1D4A', N'Name', N'名稱', N'nvarchar(30)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLTMCA', N'D58LXL1D4A', N'Portrait', N'是否直立', N'bit', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLU24A', N'D58LXL1D4A', N'Status', N'資料狀態', N'bit', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLUH6A', N'D58LXL1VTA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLUY9A', N'D58LXL1VTA', N'FlowId', N'流程Id', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLVE4A', N'D58LXL1VTA', N'StartNode', N'開始節點', N'varchar(10)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLVVGA', N'D58LXL1VTA', N'EndNode', N'結束節點', N'varchar(10)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLWA6A', N'D58LXL1VTA', N'CondStr', N'條件字串', N'varchar(255)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLWR6A', N'D58LXL1VTA', N'Sort', N'排序', N'smallint', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLX7DA', N'D58LXL2A8A', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLXPBA', N'D58LXL2A8A', N'FlowId', N'流程Id', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLY5WA', N'D58LXL2A8A', N'Name', N'名稱', N'nvarchar(30)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLYM9A', N'D58LXL2A8A', N'NodeType', N'節點類別', N'char(1)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLZ2TA', N'D58LXL2A8A', N'PosX', N'位置X', N'smallint', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLZHUA', N'D58LXL2A8A', N'PosY', N'位置Y', N'smallint', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXLZZFA', N'D58LXL2A8A', N'SignerType', N'簽核者類別', N'varchar(2)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXM0F2A', N'D58LXL2A8A', N'SignerValue', N'簽核者值', N'varchar(30)', 1, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXM0XDA', N'D58LXL2A8A', N'PassType', N'通過類別', N'char(1)', 0, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXM1D6A', N'D58LXL2A8A', N'PassNum', N'通過數量', N'smallint', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXM1UJA', N'D58LXL2SLA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXM2ADA', N'D58LXL2SLA', N'FlowId', N'流程Id', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXM2SWA', N'D58LXL2SLA', N'SourceId', N'來源資料Id', N'varchar(10)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXM374A', N'D58LXL2SLA', N'NodeName', N'節點名稱', N'nvarchar(30)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXM3PDA', N'D58LXL2SLA', N'FlowLevel', N'流程Level', N'smallint', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXM44MA', N'D58LXL2SLA', N'TotalLevel', N'合計Level', N'smallint', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXM4STA', N'D58LXL2SLA', N'SignerId', N'簽核者Id', N'varchar(10)', 0, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXM51YA', N'D58LXL2SLA', N'SignerName', N'簽核者姓名', N'nvarchar(20)', 0, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXM5GQA', N'D58LXL2SLA', N'SignStatus', N'簽核狀態', N'char(1)', 0, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXM5YEA', N'D58LXL2SLA', N'SignTime', N'簽核時間', N'datetime', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXM6DAA', N'D58LXL2SLA', N'Note', N'說明', N'nvarchar(255)', 1, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXM6UQA', N'D58LXL378A', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXM7ABA', N'D58LXL378A', N'Type', N'資料類別', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXM7R3A', N'D58LXL378A', N'FileName', N'上傳檔名', N'nvarchar(100)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXM861A', N'D58LXL378A', N'OkCount', N'成功筆數', N'smallint', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXM8MUA', N'D58LXL378A', N'FailCount', N'失敗筆數', N'smallint', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXM93BA', N'D58LXL378A', N'TotalCount', N'合計筆數', N'smallint', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXM9J1A', N'D58LXL378A', N'CreatorName', N'建檔人員', N'nvarchar(30)', 0, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXM9ZEA', N'D58LXL378A', N'Created', N'建檔日期', N'datetime', 0, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXMAE9A', N'D58LXL3N4A', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXMAWMA', N'D58LXL3N4A', N'Code', N'代碼', N'varchar(30)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXMBB0A', N'D58LXL3N4A', N'Name', N'名稱', N'nvarchar(30)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXMBSCA', N'D58LXL3N4A', N'Icon', N'圖示', N'varchar(20)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXMC85A', N'D58LXL3N4A', N'Url', N'Url', N'varchar(100)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXMCQ7A', N'D58LXL3N4A', N'Sort', N'排序', N'smallint', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXMD5AA', N'D58LXL3N4A', N'AuthRow', N'資料權限', N'tinyint', 0, N'0', 7, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXMDL8A', N'D58LXL3N4A', N'FunCreate', N'FunCreate', N'tinyint', 0, N'0', 8, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXME1HA', N'D58LXL3N4A', N'FunRead', N'FunRead', N'tinyint', 0, N'0', 9, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXMEGYA', N'D58LXL3N4A', N'FunUpdate', N'FunUpdate', N'tinyint', 0, N'0', 10, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXMEX3A', N'D58LXL3N4A', N'FunDelete', N'FunDelete', N'tinyint', 0, N'0', 11, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXMFD9A', N'D58LXL3N4A', N'FunPrint', N'FunPrint', N'tinyint', 0, N'0', 12, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXMFVYA', N'D58LXL3N4A', N'FunExport', N'FunExport', N'tinyint', 0, N'0', 13, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXMGAPA', N'D58LXL3N4A', N'FunView', N'FunView', N'tinyint', 0, N'0', 14, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXMGRPA', N'D58LXL3N4A', N'FunOther', N'FunOther', N'tinyint', 0, N'0', 15, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXMH73A', N'D58LXL44TA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXMHPPA', N'D58LXL44TA', N'Name', N'名稱', N'nvarchar(30)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXMJ4NA', N'D58LXL4KKA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXMJKJA', N'D58LXL4KKA', N'RoleId', N'角色Id', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXMK1QA', N'D58LXL4KKA', N'ProgId', N'功能Id', N'varchar(10)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXMKHDA', N'D58LXL4KKA', N'FunCreate', N'FunCreate', N'tinyint', 0, N'0', 4, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXMKYWA', N'D58LXL4KKA', N'FunRead', N'FunRead', N'tinyint', 0, N'0', 5, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXMLD7A', N'D58LXL4KKA', N'FunUpdate', N'FunUpdate', N'tinyint', 0, N'0', 6, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXMLUYA', N'D58LXL4KKA', N'FunDelete', N'FunDelete', N'tinyint', 0, N'0', 7, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXMMAHA', N'D58LXL4KKA', N'FunPrint', N'FunPrint', N'tinyint', 0, N'0', 8, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXMMSRA', N'D58LXL4KKA', N'FunExport', N'FunExport', N'tinyint', 0, N'0', 9, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXMN8NA', N'D58LXL4KKA', N'FunView', N'FunView', N'tinyint', 0, N'0', 10, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXMNPHA', N'D58LXL4KKA', N'FunOther', N'FunOther', N'tinyint', 0, N'0', 11, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXMP45A', N'D58LXL50NA', N'Sn', N'序號', N'int', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXMPLVA', N'D58LXL50NA', N'RowId', N'資料Id', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXMQ1QA', N'D58LXL50NA', N'TableName', N'資料表名稱', N'varchar(30)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXMQG0A', N'D58LXL50NA', N'ColName', N'欄位名稱', N'varchar(30)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXMQYKA', N'D58LXL50NA', N'OldValue', N'舊值', N'nvarchar(500)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXMRE7A', N'D58LXL50NA', N'NewValue', N'新值', N'nvarchar(500)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXMRVJA', N'D58LXL50NA', N'Act', N'執行動作', N'varchar(10)', 0, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXMSB0A', N'D58LXL50NA', N'Created', N'建檔日期', N'datetime', 0, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXMSSCA', N'D58LXL5FUA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXMT79A', N'D58LXL5FUA', N'UserId', N'用戶Id', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58LXMTNNA', N'D58LXL5FUA', N'RoleId', N'角色Id', N'varchar(10)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX65UJA', N'D58WX60WVA', N'UserId', N'用戶Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX66AAA', N'D58WX60WVA', N'BaoId', N'尋寶Id', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX66RHA', N'D58WX60WVA', N'Created', N'建檔日期', N'datetime', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX677AA', N'D58WX61CCA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX67N5A', N'D58WX61CCA', N'Name', N'尋寶名稱', N'nvarchar(30)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX683EA', N'D58WX61CCA', N'StartTime', N'開始時間', N'datetime', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX68JCA', N'D58WX61CCA', N'EndTime', N'結束時間', N'datetime', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX68ZGA', N'D58WX61CCA', N'IsBatch', N'是否批次解謎', N'bit', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX69E7A', N'D58WX61CCA', N'IsMove', N'是否移動地點', N'bit', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX69V5A', N'D58WX61CCA', N'GiftType', N'獎品種類', N'char(1)', 0, N'', 7, N'G(獎品), M(獎金)', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6ABUA', N'D58WX61CCA', N'GiftName', N'獎品內容', N'nvarchar(100)', 0, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6ATUA', N'D58WX61CCA', N'Note', N'注意事項', N'nvarchar(500)', 1, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6BQRA', N'D58WX61CCA', N'LevelCount', N'關卡數目', N'tinyint', 0, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6C6SA', N'D58WX61CCA', N'LaunchStatus', N'上架狀態', N'tinyint', 0, N'0', 11, N'refer XpCode.LaunchStatus', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6CNVA', N'D58WX61CCA', N'Status', N'資料狀態', N'bit', 0, N'', 12, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6D3LA', N'D58WX61CCA', N'Creator', N'建檔人員', N'varchar(10)', 0, N'', 13, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6DJ3A', N'D58WX61CCA', N'Created', N'建檔日期', N'datetime', 0, N'', 14, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6E0GA', N'D58WX61TFA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6EFQA', N'D58WX61TFA', N'CmsType', N'CMS種類', N'varchar(10)', 0, N'', 2, N'', 1)
GO
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6EWHA', N'D58WX61TFA', N'Title', N'標題', N'nvarchar(255)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6FC1A', N'D58WX61TFA', N'Text', N'文字內容', N'nvarchar(-1)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6FT1A', N'D58WX61TFA', N'Html', N'Html內容', N'nvarchar(-1)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6G8UA', N'D58WX61TFA', N'Note', N'備註', N'nvarchar(255)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6GPJA', N'D58WX61TFA', N'FileName', N'上傳檔名', N'nvarchar(100)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6H4WA', N'D58WX61TFA', N'StartTime', N'開始時間', N'datetime', 0, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6HL3A', N'D58WX61TFA', N'EndTime', N'結束時間', N'datetime', 0, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6J13A', N'D58WX61TFA', N'Status', N'資料狀態', N'bit', 0, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6JHKA', N'D58WX61TFA', N'Creator', N'建檔人員', N'varchar(10)', 0, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6JZ4A', N'D58WX61TFA', N'Created', N'建檔日期', N'datetime', 0, N'', 12, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6KEGA', N'D58WX61TFA', N'Reviser', N'修改人員', N'varchar(10)', 1, N'', 13, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6KVNA', N'D58WX61TFA', N'Revised', N'修改日期', N'datetime', 1, N'', 14, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6LB5A', N'D58WX627KA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6LSHA', N'D58WX627KA', N'BaoId', N'尋寶Id', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6M70A', N'D58WX627KA', N'UserId', N'用戶Id', N'varchar(10)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6MNHA', N'D58WX627KA', N'Reply', N'答題內容', N'nvarchar(500)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6N48A', N'D58WX627KA', N'Created', N'建檔日期', N'datetime', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6NKEA', N'D58WX62PGA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6P1NA', N'D58WX62PGA', N'BaoId', N'尋寶Id', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6PHDA', N'D58WX62PGA', N'FileName', N'上傳檔案名稱', N'nvarchar(100)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6PZDA', N'D58WX62PGA', N'Hint', N'提示', N'nvarchar(100)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6QEEA', N'D58WX62PGA', N'Answer', N'正確答案', N'varchar(22)', 0, N'', 5, N'MD5加密', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6QWGA', N'D58WX62PGA', N'Sort', N'排序', N'smallint', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6RBPA', N'D58WX634WA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6RT8A', N'D58WX634WA', N'Name', N'姓名', N'nvarchar(30)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6S9UA', N'D58WX634WA', N'Account', N'帳號', N'varchar(20)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6SRJA', N'D58WX634WA', N'Pwd', N'密碼', N'varchar(22)', 0, N'''''', 4, N'MD5加密', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6T64A', N'D58WX634WA', N'Status', N'資料狀態', N'bit', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6TMNA', N'D58WX634WA', N'IsAdmin', N'是否管理者', N'bit', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6U3JA', N'D58WX63L5A', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6UKQA', N'D58WX63L5A', N'Name', N'姓名', N'nvarchar(30)', 1, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6V0WA', N'D58WX63L5A', N'Phone', N'手機號碼', N'varchar(15)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6VFNA', N'D58WX63L5A', N'Email', N'Email', N'varchar(100)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6VXLA', N'D58WX63L5A', N'Address', N'地址', N'nvarchar(255)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6WCUA', N'D58WX63L5A', N'Created', N'建檔日期', N'datetime', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6WUUA', N'D58WX63L5A', N'Revised', N'修改日期', N'datetime', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6XA1A', N'D58WX6485A', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6XRPA', N'D58WX6485A', N'Name', N'姓名', N'nvarchar(30)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6Y7NA', N'D58WX6485A', N'Account', N'帳號', N'varchar(30)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6YNSA', N'D58WX6485A', N'Pwd', N'密碼', N'varchar(22)', 0, N'''''', 4, N'MD5加密', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6Z41A', N'D58WX6485A', N'Phone', N'手機號碼', N'varchar(15)', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX6ZKCA', N'D58WX6485A', N'Email', N'Email', N'varchar(100)', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX70B0A', N'D58WX6485A', N'Address', N'地址', N'nvarchar(255)', 0, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX70X9A', N'D58WX6485A', N'IsCorp', N'是否公司', N'bit', 0, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D58WX71C0A', N'D58WX6485A', N'Created', N'建檔日期', N'datetime', 0, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D70XCQLA3A', N'D58LXL00BA', N'FldInt', N'', N'int', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D70XCQLSCA', N'D58LXL00BA', N'FldDec', N'', N'float', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (N'D70XCQM7TA', N'D58LXL00BA', N'FldDt', N'', N'datetime', 1, N'', 9, N'', 1)
GO
INSERT [dbo].[Crud] ([Id], [ProjectId], [ProgCode], [ProgName], [LabelHori], [ReadSql], [TableAs], [HasCreate], [HasUpdate], [HasDelete], [HasView], [HasExport], [HasReset], [AuthType], [Status], [Created], [Revised]) VALUES (N'5XDCQU13AA', N'Hr', N'UserExt', N'用戶學經歷維護', 1, N'select u.*, d.name as DeptName from [User] u
join [Dept] d on u.DeptId=d.Id
order by u.Id', N'', 0, 1, 0, 1, 0, 1, 1, 1, CAST(N'2020-12-12T19:18:07.000' AS DateTime), CAST(N'2021-01-20T18:09:39.000' AS DateTime))
INSERT [dbo].[Crud] ([Id], [ProjectId], [ProgCode], [ProgName], [LabelHori], [ReadSql], [TableAs], [HasCreate], [HasUpdate], [HasDelete], [HasView], [HasExport], [HasReset], [AuthType], [Status], [Created], [Revised]) VALUES (N'5YFB6C2XKA', N'Hr', N'User', N'用戶維護', 1, N'select u.Id, u.Account, u.Name, u.Status,
   d.Name as DeptName
from [User] u
join Dept d on u.DeptId=d.Id
order by u.Name', N'', 1, 1, 1, 1, 0, 1, 1, 1, CAST(N'2021-01-21T23:35:17.000' AS DateTime), CAST(N'2021-01-22T15:54:51.000' AS DateTime))
INSERT [dbo].[Crud] ([Id], [ProjectId], [ProgCode], [ProgName], [LabelHori], [ReadSql], [TableAs], [HasCreate], [HasUpdate], [HasDelete], [HasView], [HasExport], [HasReset], [AuthType], [Status], [Created], [Revised]) VALUES (N'5YG4KXSFVA', N'Hr', N'Role', N'角色維護', 1, N'select * from Role
order by Id', N'', 1, 1, 1, 1, 0, 1, 1, 1, CAST(N'2021-01-22T21:12:03.000' AS DateTime), CAST(N'2021-01-22T22:56:15.000' AS DateTime))
INSERT [dbo].[Crud] ([Id], [ProjectId], [ProgCode], [ProgName], [LabelHori], [ReadSql], [TableAs], [HasCreate], [HasUpdate], [HasDelete], [HasView], [HasExport], [HasReset], [AuthType], [Status], [Created], [Revised]) VALUES (N'5YG70CB56A', N'Hr', N'Prog', N'功能維護', 1, N'select * from Prog
order by Id', N'', 1, 1, 1, 1, 0, 0, 1, 1, CAST(N'2021-01-22T23:06:48.000' AS DateTime), CAST(N'2021-01-22T23:18:26.000' AS DateTime))
INSERT [dbo].[Crud] ([Id], [ProjectId], [ProgCode], [ProgName], [LabelHori], [ReadSql], [TableAs], [HasCreate], [HasUpdate], [HasDelete], [HasView], [HasExport], [HasReset], [AuthType], [Status], [Created], [Revised]) VALUES (N'5Z5JPZR5HA', N'Hr', N'Leave', N'請假作業', 1, N'select l.* 
from Leave l
join [User] u on l.UserId=u.Id
join [User] u2 on l.AgentId=u2.Id
order by l.Id', N'', 1, 1, 1, 1, 0, 1, 1, 1, CAST(N'2021-02-18T01:11:15.000' AS DateTime), CAST(N'2021-02-20T11:53:27.000' AS DateTime))
GO
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYLM3KAA', N'5XEYLM3AWA', N'5XD29XD5LA', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 0)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYLM3N0A', N'5XEYLM3AWA', N'5XD29XD72A', N'T', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 1)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYNLFSBA', N'5XEYLM3AWA', N'5XD29XD8JA', N'T', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 2)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYNLFW4A', N'5XEYLM3AWA', N'5XD29XDARA', N'T', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 3)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYNLFXLA', N'5XEYLM3AWA', N'5XD29XDBYA', N'C', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 4)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYNLFYVA', N'5XEYNLFBNA', N'5XD29XDDDA', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 0)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYNLG0EA', N'5XEYNLFBNA', N'5XD29XDF1A', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 1)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYNLG1MA', N'5XEYNLFBNA', N'5XD29XDGTA', N'T', N'', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 2)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYNLG31A', N'5XEYNLFBNA', N'5XD29XDKZA', N'T', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 3)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYNLG4KA', N'5XEYNLFBNA', N'5XD29XDN0A', N'T', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 4)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYNLG5VA', N'5XEYNLFBNA', N'5XD29XDPVA', N'T', N'', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 5)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYNLG7CA', N'5XEYNLFBNA', N'5XD29XDUAA', N'T', N'', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 6)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYNLG8MA', N'5XEYNLFBNA', N'5XD29XDVWA', N'INT', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 7)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYNLGA4A', N'5XEYNLFBNA', N'5XD29XDXPA', N'C', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 8)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYNLGBGA', N'5XEYNLFBNA', N'5XD29XE1AA', N'MO', N'1000', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 9)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYURNH5A', N'5XEYURMVMA', N'5XD29XGNVA', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 0)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYURNJEA', N'5XEYURMVMA', N'5XD29XGR4A', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 1)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYURNKSA', N'5XEYURMVMA', N'5XD29XGSRA', N'T', N'', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 2)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYURNN1A', N'5XEYURMVMA', N'5XD29XGV8A', N'T', N'', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 3)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYURNQBA', N'5XEYURMVMA', N'5XD29XGWUA', N'T', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 4)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYURNRRA', N'5XEYURMVMA', N'5XD29XGZGA', N'T', N'', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 5)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYURNSWA', N'5XEYURMVMA', N'5XD29XH1CA', N'C', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 6)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYURNX4A', N'5XEYURN5GA', N'5XD29XE2UA', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 0)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYURNZNA', N'5XEYURN5GA', N'5XD29XE9LA', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 1)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYURP18A', N'5XEYURN5GA', N'5XD29XGACA', N'SO', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 7)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYURP33A', N'5XEYURN5GA', N'5XD29XFPMA', N'T', N'', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 2)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYURP56A', N'5XEYURN5GA', N'5XD29XFX1A', N'S', N'LangLevels', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 3)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYURP6HA', N'5XEYURN5GA', N'5XD29XFZXA', N'S', N'LangLevels', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 4)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYURP80A', N'5XEYURN5GA', N'5XD29XG6HA', N'S', N'LangLevels', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 5)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYURP9NA', N'5XEYURN5GA', N'5XD29XG8HA', N'S', N'LangLevels', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 6)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYURPBDA', N'5XEYURNAJA', N'5XD29XGC3A', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 0)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYURPDTA', N'5XEYURNAJA', N'5XD29XGE9A', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 1)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYURPFAA', N'5XEYURNAJA', N'5XD29XGG3A', N'T', N'', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 2)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYURPGVA', N'5XEYURNAJA', N'5XD29XGHSA', N'T', N'', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 3)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYURPN5A', N'5XEYURNAJA', N'5XD29XGKPA', N'F', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 4)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYURPPJA', N'5XEYURNC2A', N'5XD29XH4HA', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 0)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYURPQVA', N'5XEYURNC2A', N'5XD29XH6EA', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 1)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYURPT8A', N'5XEYURNC2A', N'5XD29XHC2A', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 2)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYURPWGA', N'5XEYURNC2A', N'5XD29XH8EA', N'T', N'', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 2)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XEYURPYZA', N'5XEYURNC2A', N'5XD29XHA2A', N'TA', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 3)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5XLQA0CC6A', N'5XEYURNC2A', N'5XLQ99LV9A', N'SO', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 4)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5YFCNZLN9A', N'5YFCNZL8NA', N'5XD29XD5LA', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 0)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5YFCNZLRHA', N'5YFCNZL8NA', N'5XD29XD72A', N'T', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 1)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5YFCNZLTXA', N'5YFCNZL8NA', N'5XD29XD8JA', N'T', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 2)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5YFCNZLV5A', N'5YFCNZL8NA', N'5XD29XDARA', N'S', N'Depts', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 4)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5YFCNZLXLA', N'5YFCNZL8NA', N'5XD29XDBYA', N'C', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 5)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5YFVMEQ3QA', N'5YFVMEPW5A', N'5YFVGEZTZA', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 0)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5YFVMEQ6VA', N'5YFVMEPW5A', N'5YFVGEZV9A', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 1)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5YFVMEQ81A', N'5YFVMEPW5A', N'5YFVGEZWHA', N'S', N'Roles', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 2)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5YFY3BQSWA', N'5YFCNZL8NA', N'5YFVGEZSJA', N'PWD', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 3)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5YG4KXTXJA', N'5YG4KXTSVA', N'5XD29XD23A', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 0)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5YG4KXU1DA', N'5YG4KXTSVA', N'5XD29XD41A', N'T', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 1)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5YG4KXU2PA', N'5YG4KXTV9A', N'5YFVGEZMAA', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 0)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5YG4KXU58A', N'5YG4KXTV9A', N'5YFVGEZP5A', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 1)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5YG4KXU6EA', N'5YG4KXTV9A', N'5YFVGEZR5A', N'S', N'Progs', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 2)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5YG70CC5SA', N'5YG70CC0CA', N'5XD29XCXFA', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 0)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5YG70CC8LA', N'5YG70CC0CA', N'5YFVGEZE6A', N'T', N'', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 1)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5YG70CCJRA', N'5YG70CC0CA', N'5XD29XCYRA', N'T', N'', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 2)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5YG70CCM9A', N'5YG70CC0CA', N'5YFVGEZHLA', N'T', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 3)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5YG70CCNMA', N'5YG70CC0CA', N'5YFVGEZKGA', N'T', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 4)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5YG70CCQMA', N'5YG70CC2GA', N'5YFVGEZMAA', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 0)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5YG70CCS2A', N'5YG70CC2GA', N'5YFVGEZP5A', N'S', N'Roles', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 2)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5YG70CCTNA', N'5YG70CC2GA', N'5YFVGEZR5A', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 1)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5Z642A9Q8A', N'5Z642A9LLA', N'5Z5BHXMCMA', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 0)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5Z642A9QYA', N'5Z642A9LLA', N'5Z5BHXME5A', N'S', N'Users', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 1)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5Z642A9RUA', N'5Z642A9LLA', N'5Z5BHXMFJA', N'S', N'Users', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 2)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5Z642A9T0A', N'5Z642A9LLA', N'5Z5BHXMGLA', N'S', N'LeaveTypes', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 3)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5Z642A9TYA', N'5Z642A9LLA', N'5Z5BHXMJ7A', N'DT', N'', 1, 1, 1, N'', N'', N'', N'2,4', 0, N'0', N'', 4)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5Z642A9ULA', N'5Z642A9LLA', N'5Z5BHXMKSA', N'DT', N'', 1, 1, 1, N'', N'', N'', N'2,4', 0, N'0', N'', 5)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5Z642A9VKA', N'5Z642A9LLA', N'5Z5BHXMM5A', N'DEC', N'', 1, 1, 1, N'', N'', N'', N'2,1', 0, N'0', N'', 6)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5Z642A9XHA', N'5Z642A9LLA', N'5Z5BHXMS5A', N'RO', N'FlowSignStatusName', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 7)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5Z642A9YGA', N'5Z642A9LLA', N'5Z5BHXMU0A', N'C', N'啟用', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 8)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5Z642A9ZHA', N'5Z642A9LLA', N'5Z5BHXMVTA', N'RO', N'CreatorName', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 9)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5Z642AA1FA', N'5Z642A9LLA', N'5Z5BHXMXVA', N'RO', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 10)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5Z642AA2HA', N'5Z642A9LLA', N'5Z5BHXMZRA', N'RO', N'ReviserName', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 11)
INSERT [dbo].[CrudEitem] ([Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (N'5Z642AA37A', N'5Z642A9LLA', N'5Z5BHXN1KA', N'RO', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 12)
GO
INSERT [dbo].[CrudEtable] ([Id], [CrudId], [TableId], [PkeyFid], [FkeyFid], [Col4], [OrderBy], [Sort], [HalfWidth]) VALUES (N'5XEYLM3AWA', N'5XDCQU13AA', N'5XD29XC3BA', N'Id', N'', N'0', N'', 0, 0)
INSERT [dbo].[CrudEtable] ([Id], [CrudId], [TableId], [PkeyFid], [FkeyFid], [Col4], [OrderBy], [Sort], [HalfWidth]) VALUES (N'5XEYNLFBNA', N'5XDCQU13AA', N'5XD29XC6LA', N'Id', N'UserId', N'0', N'', 2, 0)
INSERT [dbo].[CrudEtable] ([Id], [CrudId], [TableId], [PkeyFid], [FkeyFid], [Col4], [OrderBy], [Sort], [HalfWidth]) VALUES (N'5XEYURMVMA', N'5XDCQU13AA', N'5XD29XCAWA', N'Id', N'UserId', N'0', N'', 1, 0)
INSERT [dbo].[CrudEtable] ([Id], [CrudId], [TableId], [PkeyFid], [FkeyFid], [Col4], [OrderBy], [Sort], [HalfWidth]) VALUES (N'5XEYURN5GA', N'5XDCQU13AA', N'5XD29XC7WA', N'Id', N'UserId', N'0', N'Sort', 3, 0)
INSERT [dbo].[CrudEtable] ([Id], [CrudId], [TableId], [PkeyFid], [FkeyFid], [Col4], [OrderBy], [Sort], [HalfWidth]) VALUES (N'5XEYURNAJA', N'5XDCQU13AA', N'5XD29XC9AA', N'Id', N'UserId', N'0', N'', 4, 0)
INSERT [dbo].[CrudEtable] ([Id], [CrudId], [TableId], [PkeyFid], [FkeyFid], [Col4], [OrderBy], [Sort], [HalfWidth]) VALUES (N'5XEYURNC2A', N'5XDCQU13AA', N'5XD29XCDPA', N'Id', N'UserId', N'0', N'', 5, 0)
INSERT [dbo].[CrudEtable] ([Id], [CrudId], [TableId], [PkeyFid], [FkeyFid], [Col4], [OrderBy], [Sort], [HalfWidth]) VALUES (N'5YFCNZL8NA', N'5YFB6C2XKA', N'5XD29XC3BA', N'Id', N'', N'0', N'', 0, 0)
INSERT [dbo].[CrudEtable] ([Id], [CrudId], [TableId], [PkeyFid], [FkeyFid], [Col4], [OrderBy], [Sort], [HalfWidth]) VALUES (N'5YFVMEPW5A', N'5YFB6C2XKA', N'5YFVGEXZEA', N'Id', N'UserId', N'0', N'', 1, 1)
INSERT [dbo].[CrudEtable] ([Id], [CrudId], [TableId], [PkeyFid], [FkeyFid], [Col4], [OrderBy], [Sort], [HalfWidth]) VALUES (N'5YG4KXTSVA', N'5YG4KXSFVA', N'5XD29XC1AA', N'Id', N'', N'0', N'', 0, 0)
INSERT [dbo].[CrudEtable] ([Id], [CrudId], [TableId], [PkeyFid], [FkeyFid], [Col4], [OrderBy], [Sort], [HalfWidth]) VALUES (N'5YG4KXTV9A', N'5YG4KXSFVA', N'5YFVGEXX7A', N'Id', N'RoleId', N'0', N'', 1, 1)
INSERT [dbo].[CrudEtable] ([Id], [CrudId], [TableId], [PkeyFid], [FkeyFid], [Col4], [OrderBy], [Sort], [HalfWidth]) VALUES (N'5YG70CC0CA', N'5YG70CB56A', N'5XD29XBZHA', N'Id', N'', N'0', N'', 0, 0)
INSERT [dbo].[CrudEtable] ([Id], [CrudId], [TableId], [PkeyFid], [FkeyFid], [Col4], [OrderBy], [Sort], [HalfWidth]) VALUES (N'5YG70CC2GA', N'5YG70CB56A', N'5YFVGEXX7A', N'Id', N'ProgId', N'0', N'', 1, 1)
INSERT [dbo].[CrudEtable] ([Id], [CrudId], [TableId], [PkeyFid], [FkeyFid], [Col4], [OrderBy], [Sort], [HalfWidth]) VALUES (N'5Z642A9LLA', N'5Z5JPZR5HA', N'5Z5BHXK86A', N'Id', N'', N'1', N'', 0, 0)
GO
INSERT [dbo].[CrudQitem] ([Id], [CrudId], [ColumnId], [TableAs], [QitemType], [ItemData], [Op], [IsRange], [IsFind2], [PosGroup], [LayoutCols], [Sort]) VALUES (N'5XDCQUBPRA', N'5XDCQU13AA', N'5XD29XD72A', N'', N'T', N'', N'Like', 0, 0, N'', N'', 0)
INSERT [dbo].[CrudQitem] ([Id], [CrudId], [ColumnId], [TableAs], [QitemType], [ItemData], [Op], [IsRange], [IsFind2], [PosGroup], [LayoutCols], [Sort]) VALUES (N'5XDCS43M4A', N'5XDCQU13AA', N'5XD29XD8JA', N'', N'T', N'', N'Like', 0, 0, N'', N'', 1)
INSERT [dbo].[CrudQitem] ([Id], [CrudId], [ColumnId], [TableAs], [QitemType], [ItemData], [Op], [IsRange], [IsFind2], [PosGroup], [LayoutCols], [Sort]) VALUES (N'5XDCS43PJA', N'5XDCQU13AA', N'5XD29XDARA', N'', N'S', N'Depts', N'Equal', 0, 0, N'', N'', 2)
INSERT [dbo].[CrudQitem] ([Id], [CrudId], [ColumnId], [TableAs], [QitemType], [ItemData], [Op], [IsRange], [IsFind2], [PosGroup], [LayoutCols], [Sort]) VALUES (N'5YFCH2K2NA', N'5YFB6C2XKA', N'5XD29XD72A', N'', N'T', N'', N'Like', 0, 0, N'', N'', 0)
INSERT [dbo].[CrudQitem] ([Id], [CrudId], [ColumnId], [TableAs], [QitemType], [ItemData], [Op], [IsRange], [IsFind2], [PosGroup], [LayoutCols], [Sort]) VALUES (N'5YFCH2KDYA', N'5YFB6C2XKA', N'5XD29XD8JA', N'', N'T', N'', N'Like', 0, 0, N'', N'', 1)
INSERT [dbo].[CrudQitem] ([Id], [CrudId], [ColumnId], [TableAs], [QitemType], [ItemData], [Op], [IsRange], [IsFind2], [PosGroup], [LayoutCols], [Sort]) VALUES (N'5YFCH2KK3A', N'5YFB6C2XKA', N'5XD29XDARA', N'', N'S', N'Depts', N'Equal', 0, 0, N'', N'', 2)
INSERT [dbo].[CrudQitem] ([Id], [CrudId], [ColumnId], [TableAs], [QitemType], [ItemData], [Op], [IsRange], [IsFind2], [PosGroup], [LayoutCols], [Sort]) VALUES (N'5YG4KXTH4A', N'5YG4KXSFVA', N'5XD29XD41A', N'', N'T', N'', N'Like', 0, 0, N'', N'', 0)
INSERT [dbo].[CrudQitem] ([Id], [CrudId], [ColumnId], [TableAs], [QitemType], [ItemData], [Op], [IsRange], [IsFind2], [PosGroup], [LayoutCols], [Sort]) VALUES (N'5YG70CBFBA', N'5YG70CB56A', N'5YFVGEZE6A', N'', N'T', N'', N'Like', 0, 0, N'', N'', 0)
INSERT [dbo].[CrudQitem] ([Id], [CrudId], [ColumnId], [TableAs], [QitemType], [ItemData], [Op], [IsRange], [IsFind2], [PosGroup], [LayoutCols], [Sort]) VALUES (N'5YG70CBL4A', N'5YG70CB56A', N'5XD29XCYRA', N'', N'T', N'', N'Like', 0, 0, N'', N'', 1)
INSERT [dbo].[CrudQitem] ([Id], [CrudId], [ColumnId], [TableAs], [QitemType], [ItemData], [Op], [IsRange], [IsFind2], [PosGroup], [LayoutCols], [Sort]) VALUES (N'5Z5ZUACK6A', N'5Z5JPZR5HA', N'5Z5BHXMGLA', N'', N'S', N'LeaveTypes', N'Equal', 0, 0, N'', N'', 1)
INSERT [dbo].[CrudQitem] ([Id], [CrudId], [ColumnId], [TableAs], [QitemType], [ItemData], [Op], [IsRange], [IsFind2], [PosGroup], [LayoutCols], [Sort]) VALUES (N'5Z5ZUACL6A', N'5Z5JPZR5HA', N'5Z5BHXMS5A', N'', N'S', N'SignStatuses', N'Equal', 0, 0, N'', N'', 2)
INSERT [dbo].[CrudQitem] ([Id], [CrudId], [ColumnId], [TableAs], [QitemType], [ItemData], [Op], [IsRange], [IsFind2], [PosGroup], [LayoutCols], [Sort]) VALUES (N'5Z87DRL40A', N'5Z5JPZR5HA', N'5Z5BHXMJ7A', N'', N'D', N'', N'InRange', 1, 0, N'', N'', 0)
GO
INSERT [dbo].[CrudRitem] ([Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (N'5XEXK6A9SA', N'5XDCQU13AA', N'Account', N'帳號', 0, N'0', 0)
INSERT [dbo].[CrudRitem] ([Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (N'5XEXK6ASFA', N'5XDCQU13AA', N'Name', N'使用者名稱', 0, N'0', 1)
INSERT [dbo].[CrudRitem] ([Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (N'5XEXK6B26A', N'5XDCQU13AA', N'DeptName', N'部門', 0, N'0', 2)
INSERT [dbo].[CrudRitem] ([Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (N'5XEXK6B5MA', N'5XDCQU13AA', N'Status', N'資料狀態', 0, N'SS', 3)
INSERT [dbo].[CrudRitem] ([Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (N'5XEXK6B9RA', N'5XDCQU13AA', N'_Fun', N'維護', 0, N'CF', 4)
INSERT [dbo].[CrudRitem] ([Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (N'5YFCJVDVKA', N'5YFB6C2XKA', N'Account', N'帳號', 0, N'0', 0)
INSERT [dbo].[CrudRitem] ([Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (N'5YFCJVEBEA', N'5YFB6C2XKA', N'Name', N'使用者名稱', 0, N'0', 1)
INSERT [dbo].[CrudRitem] ([Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (N'5YFCJVEF0A', N'5YFB6C2XKA', N'DeptName', N'部門', 0, N'0', 2)
INSERT [dbo].[CrudRitem] ([Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (N'5YFCJVEJLA', N'5YFB6C2XKA', N'Status', N'資料狀態', 0, N'SS', 3)
INSERT [dbo].[CrudRitem] ([Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (N'5YFXR6UWHA', N'5YFB6C2XKA', N'_Fun', N'維護', 0, N'CF', 4)
INSERT [dbo].[CrudRitem] ([Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (N'5YG4KXTQJA', N'5YG4KXSFVA', N'Name', N'角色名稱', 0, N'0', 0)
INSERT [dbo].[CrudRitem] ([Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (N'5YG6SSVYPA', N'5YG4KXSFVA', N'_Fun', N'維護', 0, N'CF', 1)
INSERT [dbo].[CrudRitem] ([Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (N'5YG70CBMMA', N'5YG70CB56A', N'Code', N'功能代碼', 0, N'0', 0)
INSERT [dbo].[CrudRitem] ([Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (N'5YG70CBQNA', N'5YG70CB56A', N'Name', N'功能名稱', 0, N'0', 1)
INSERT [dbo].[CrudRitem] ([Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (N'5YG70CBS2A', N'5YG70CB56A', N'Icon', N'圖示', 0, N'0', 2)
INSERT [dbo].[CrudRitem] ([Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (N'5YG70CBUGA', N'5YG70CB56A', N'Url', N'Url', 0, N'0', 3)
INSERT [dbo].[CrudRitem] ([Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (N'5YG70CBXLA', N'5YG70CB56A', N'_Fun', N'維護', 0, N'CF', 4)
INSERT [dbo].[CrudRitem] ([Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (N'5Z5ZUACLWA', N'5Z5JPZR5HA', N'UserId', N'請假人', 0, N'0', 0)
INSERT [dbo].[CrudRitem] ([Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (N'5Z5ZUACMUA', N'5Z5JPZR5HA', N'AgentId', N'代理人', 0, N'0', 1)
INSERT [dbo].[CrudRitem] ([Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (N'5Z5ZUACP0A', N'5Z5JPZR5HA', N'LeaveType', N'假別', 0, N'0', 2)
INSERT [dbo].[CrudRitem] ([Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (N'5Z5ZUACPQA', N'5Z5JPZR5HA', N'StartTime', N'開始時間', 0, N'DT', 3)
INSERT [dbo].[CrudRitem] ([Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (N'5Z5ZUACQUA', N'5Z5JPZR5HA', N'EndTime', N'結束時間', 0, N'DT', 4)
INSERT [dbo].[CrudRitem] ([Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (N'5Z5ZUACRPA', N'5Z5JPZR5HA', N'Hours', N'請假時數', 0, N'0', 5)
INSERT [dbo].[CrudRitem] ([Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (N'5Z5ZUACTKA', N'5Z5JPZR5HA', N'FlowSignStatus', N'流程簽核狀態', 0, N'0', 6)
INSERT [dbo].[CrudRitem] ([Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (N'5Z5ZUACUHA', N'5Z5JPZR5HA', N'Created', N'Created', 0, N'DT', 7)
GO
INSERT [dbo].[Project] ([Id], [Code], [DbName], [ProjectPath], [ConnectStr], [Status]) VALUES (N'D58WWHCYQA', N'BaoAdm', N'Bao', N'd:\_projects\BaoAdm', N'data source=(localdb)\mssqllocaldb;initial catalog=Bao;integrated security=True;multipleactiveresultsets=True;max pool size=1000;', 1)
INSERT [dbo].[Project] ([Id], [Code], [DbName], [ProjectPath], [ConnectStr], [Status]) VALUES (N'Db', N'DbAdm', N'Db', N'(empty)', N'data source=(localdb)\mssqllocaldb;initial catalog=Db;integrated security=True;multipleactiveresultsets=True;max pool size=1000;', 1)
INSERT [dbo].[Project] ([Id], [Code], [DbName], [ProjectPath], [ConnectStr], [Status]) VALUES (N'Hr', N'HrAdm', N'Hr', N'D:\_project2\HrAdm', N'data source=(localdb)\mssqllocaldb;initial catalog=Hr;integrated security=True;multipleactiveresultsets=True;max pool size=1000;', 1)
GO
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'5X9RB36MYA', N'Db', N'Column', N'欄位檔', N'', 0, 1)
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'5X9RB36PRA', N'Db', N'Crud', N'CRUD設定', N'', 0, 1)
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'5X9RB36TCA', N'Db', N'CrudEitem', N'CRUD維護欄位', N'', 0, 1)
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'5X9RB36VLA', N'Db', N'CrudEtable', N'CRUD維護資料表', N'', 0, 1)
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'5X9RB36XEA', N'Db', N'CrudQitem', N'CRUD查詢欄位', N'', 0, 1)
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'5X9RB36ZCA', N'Db', N'CrudRitem', N'CRUD查詢結果欄位', N'', 0, 1)
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'5X9RB3720A', N'Db', N'Project', N'專案檔', N'', 0, 1)
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'5X9RB373ZA', N'Db', N'Table', N'資料表檔', N'', 0, 1)
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'5XD29XBSMA', N'Hr', N'Dept', N'部門', N'', 0, 1)
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'5XD29XC3BA', N'Hr', N'User', N'使用者', N'', 1, 1)
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'5XD29XC6LA', N'Hr', N'UserJob', N'工作經驗', N'', 0, 1)
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'5XD29XC7WA', N'Hr', N'UserLang', N'語言能力', N'', 0, 1)
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'5XD29XC9AA', N'Hr', N'UserLicense', N'用戶證照', N'', 0, 1)
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'5XD29XCAWA', N'Hr', N'UserSchool', N'學歷資料', N'', 0, 1)
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'5XD29XCDPA', N'Hr', N'UserSkill', N'專業技能', N'', 0, 1)
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'5Z5BHXK86A', N'Hr', N'Leave', N'假單', N'', 1, 1)
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'D58J2RM39A', N'Db', N'XpCode', N'雜項檔', N'', 1, 1)
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'D58LXKZJUA', N'Hr', N'Cms', N'CMS', N'', 0, 1)
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'D58LXL00BA', N'Hr', N'CustInput', N'自訂輸入欄位', N'', 0, 1)
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'D58LXL0GHA', N'Hr', N'XpCode', N'雜項檔', N'', 0, 1)
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'D58LXL0Y0A', N'Hr', N'XpEasyRpt', N'簡單報表', N'', 0, 1)
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'D58LXL1D4A', N'Hr', N'XpFlow', N'流程', N'', 0, 1)
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'D58LXL1VTA', N'Hr', N'XpFlowLine', N'流程線', N'', 0, 1)
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'D58LXL2A8A', N'Hr', N'XpFlowNode', N'流程節點', N'', 0, 1)
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'D58LXL2SLA', N'Hr', N'XpFlowSign', N'流程簽核資料', N'', 0, 1)
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'D58LXL378A', N'Hr', N'XpImportLog', N'匯入資料', N'', 0, 1)
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'D58LXL3N4A', N'Hr', N'XpProg', N'系統功能', N'', 0, 1)
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'D58LXL44TA', N'Hr', N'XpRole', N'角色', N'', 0, 1)
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'D58LXL4KKA', N'Hr', N'XpRoleProg', N'角色功能', N'', 0, 1)
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'D58LXL50NA', N'Hr', N'XpTranLog', N'交易記錄', N'', 0, 1)
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'D58LXL5FUA', N'Hr', N'XpUserRole', N'用戶角色', N'', 0, 1)
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'D58WX60WVA', N'D58WWHCYQA', N'Attend', N'手機用戶參加尋寶資料', N'', 0, 1)
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'D58WX61CCA', N'D58WWHCYQA', N'Bao', N'尋寶資料', N'', 1, 1)
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'D58WX61TFA', N'D58WWHCYQA', N'Cms', N'CMS內容', N'', 0, 1)
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'D58WX627KA', N'D58WWHCYQA', N'Reply', N'用戶答題資料', N'', 0, 1)
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'D58WX62PGA', N'D58WWHCYQA', N'Stage', N'尋寶關卡', N'', 1, 1)
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'D58WX634WA', N'D58WWHCYQA', N'User', N'管理系統用戶', N'', 0, 1)
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'D58WX63L5A', N'D58WWHCYQA', N'UserApp', N'手機用戶資料', N'', 1, 1)
INSERT [dbo].[Table] ([Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (N'D58WX6485A', N'D58WWHCYQA', N'UserCust', N'客戶資料', N'', 1, 1)
GO
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'AuthType', N'0', N'無', 1, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'AuthType', N'1', N'Controller', 2, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'AuthType', N'2', N'Action', 3, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'CheckType', N'0', N'None', 1, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'CheckType', N'Email', N'Email', 2, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'CheckType', N'Max', N'Max', 5, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'CheckType', N'Min', N'Min', 4, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'CheckType', N'Range', N'Range', 6, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'CheckType', N'Url', N'Url', 3, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'EitemType', N'C', N'CheckBox', 7, N'Q', NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'EitemType', N'D', N'Date', 9, N'Q', NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'EitemType', N'DEC', N'Decimal', 5, N'Q', NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'EitemType', N'DT', N'DateTime', 10, N'Q', NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'EitemType', N'F', N'File', 11, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'EitemType', N'H', N'Hide', 1, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'EitemType', N'HTML', N'Html', 12, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'EitemType', N'INT', N'Integer', 4, N'Q', NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'EitemType', N'MO', N'Modal', 14, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'EitemType', N'PWD', N'Password', 15, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'EitemType', N'R', N'Radio', 8, N'Q', NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'EitemType', N'RO', N'ReadOnly', 16, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'EitemType', N'S', N'Select', 6, N'Q', NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'EitemType', N'SO', N'Sort', 13, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'EitemType', N'T', N'Text', 2, N'Q', NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'EitemType', N'TA', N'TextArea', 3, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'InputType', N'C', N'CheckBox', 6, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'InputType', N'D', N'Date', 8, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'InputType', N'DT', N'DateTime', 9, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'InputType', N'F', N'File', 10, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'InputType', N'H', N'Hide', 1, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'InputType', N'MO', N'Modal', 12, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'InputType', N'N', N'Numeric', 4, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'InputType', N'PWD', N'Password', 13, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'InputType', N'R', N'Radio', 7, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'InputType', N'RO', N'Read Only', 14, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'InputType', N'S', N'Select', 5, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'InputType', N'SO', N'Sort', 11, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'InputType', N'T', N'Text', 2, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'InputType', N'TA', N'TextArea', 3, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'QitemOp', N'Equal', N'Equal', 1, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'QitemOp', N'In', N'In', 4, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'QitemOp', N'InRange', N'In Range', 12, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'QitemOp', N'Is', N'Is', 9, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'QitemOp', N'IsNull', N'Is Null', 10, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'QitemOp', N'Like', N'Like', 2, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'QitemOp', N'Like2', N'Like(模糊)', 5, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'QitemOp', N'Like2Cols', N'Like Cols(模糊)', 8, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'QitemOp', N'LikeCols', N'Like Cols', 7, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'QitemOp', N'LikeList', N'Like List', 6, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'QitemOp', N'NotLike', N'Not Like', 3, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'QitemOp', N'NotNull', N'Not Null', 11, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'QitemOp', N'UD', N'User Defined', 13, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'RitemType', N'0', N'Normal', 1, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'RitemType', N'CF', N'Crud Fun', 2, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'RitemType', N'DT', N'DateTime', 5, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'RitemType', N'SN', N'Status Name', 4, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'RitemType', N'SS', N'Set Status', 3, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'RitemType', N'UD', N'User Defined', 5, NULL, NULL)
GO
ALTER TABLE [dbo].[Table] ADD  CONSTRAINT [DF_Table_TranLog]  DEFAULT ((0)) FOR [TranLog]
GO
ALTER TABLE [dbo].[CrudEitem]  WITH CHECK ADD  CONSTRAINT [FK_CrudEitem_CrudEtable] FOREIGN KEY([EtableId])
REFERENCES [dbo].[CrudEtable] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CrudEitem] CHECK CONSTRAINT [FK_CrudEitem_CrudEtable]
GO
ALTER TABLE [dbo].[CrudEtable]  WITH CHECK ADD  CONSTRAINT [FK_CrudEtable_Crud] FOREIGN KEY([CrudId])
REFERENCES [dbo].[Crud] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CrudEtable] CHECK CONSTRAINT [FK_CrudEtable_Crud]
GO
ALTER TABLE [dbo].[CrudQitem]  WITH CHECK ADD  CONSTRAINT [FK_CrudQitem_Crud] FOREIGN KEY([CrudId])
REFERENCES [dbo].[Crud] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CrudQitem] CHECK CONSTRAINT [FK_CrudQitem_Crud]
GO
ALTER TABLE [dbo].[CrudRitem]  WITH CHECK ADD  CONSTRAINT [FK_CrudRitem_Crud] FOREIGN KEY([CrudId])
REFERENCES [dbo].[Crud] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CrudRitem] CHECK CONSTRAINT [FK_CrudRitem_Crud]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'權限種類, 0(無), 1(Ctrl), 2(Action)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Crud', @level2type=N'COLUMN',@level2name=N'AuthType'
GO
--USE [master]
--GO
--ALTER DATABASE [Db] SET  READ_WRITE 
--GO
