USE [master]
GO
/****** Object:  Database [db_diamond]    Script Date: 12/3/2023 6:31:38 PM ******/
CREATE DATABASE [db_diamond]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_diamond', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MDUNGSERVER\MSSQL\DATA\db_diamond.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_diamond_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MDUNGSERVER\MSSQL\DATA\db_diamond_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [db_diamond] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_diamond].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_diamond] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_diamond] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_diamond] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_diamond] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_diamond] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_diamond] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_diamond] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_diamond] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_diamond] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_diamond] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_diamond] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_diamond] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_diamond] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_diamond] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_diamond] SET  ENABLE_BROKER 
GO
ALTER DATABASE [db_diamond] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_diamond] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_diamond] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_diamond] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_diamond] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_diamond] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_diamond] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_diamond] SET RECOVERY FULL 
GO
ALTER DATABASE [db_diamond] SET  MULTI_USER 
GO
ALTER DATABASE [db_diamond] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_diamond] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_diamond] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_diamond] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_diamond] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_diamond] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'db_diamond', N'ON'
GO
ALTER DATABASE [db_diamond] SET QUERY_STORE = ON
GO
ALTER DATABASE [db_diamond] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [db_diamond]
GO
/****** Object:  User [mdung]    Script Date: 12/3/2023 6:31:39 PM ******/
CREATE USER [mdung] FOR LOGIN [mdung] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[account]    Script Date: 12/3/2023 6:31:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](24) NOT NULL,
	[password] [varchar](1000) NOT NULL,
	[create_date] [datetime] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[account_role]    Script Date: 12/3/2023 6:31:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account_role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_account] [int] NOT NULL,
	[id_role] [int] NOT NULL,
 CONSTRAINT [PK_account_roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[address_account]    Script Date: 12/3/2023 6:31:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[address_account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_account] [int] NOT NULL,
	[district] [varchar](50) NOT NULL,
	[ward] [varchar](50) NOT NULL,
	[city] [varchar](50) NOT NULL,
	[address] [nvarchar](1000) NOT NULL,
	[status] [bit] NOT NULL,
	[name] [nvarchar](50) NULL,
	[phone] [varchar](10) NULL,
 CONSTRAINT [PK_address_account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 12/3/2023 6:31:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NOT NULL,
	[id_account] [int] NOT NULL,
	[create_date] [datetime] NOT NULL,
	[status] [bit] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_cart] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 12/3/2023 6:31:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type_category] [nvarchar](50) NOT NULL,
	[create_date] [datetime] NOT NULL,
	[id_account] [int] NOT NULL,
	[image] [varchar](250) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category_item]    Script Date: 12/3/2023 6:31:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category_item](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type_category_item] [nvarchar](50) NOT NULL,
	[create_date] [datetime] NOT NULL,
	[id_account] [int] NOT NULL,
	[id_category] [int] NOT NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_category_item] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[image_product]    Script Date: 12/3/2023 6:31:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[image_product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NOT NULL,
	[url] [varchar](250) NOT NULL,
 CONSTRAINT [PK_image_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[info_account]    Script Date: 12/3/2023 6:31:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[info_account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_account] [int] NOT NULL,
	[fullname] [nvarchar](50) NULL,
	[id_card] [varchar](12) NULL,
	[phone] [varchar](10) NULL,
	[gender] [bit] NULL,
	[email] [varchar](50) NULL,
	[image] [varchar](250) NULL,
 CONSTRAINT [PK_info_account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[like_product]    Script Date: 12/3/2023 6:31:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[like_product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NOT NULL,
	[id_account] [int] NOT NULL,
	[create_date] [datetime] NOT NULL,
 CONSTRAINT [PK_like_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[message]    Script Date: 12/3/2023 6:31:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[message](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[sender] [int] NULL,
	[receiver] [int] NULL,
	[image] [text] NULL,
	[message] [nvarchar](300) NULL,
	[time] [datetime] NULL,
 CONSTRAINT [PK_message] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 12/3/2023 6:31:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NOT NULL,
	[id_order] [int] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 12/3/2023 6:31:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_shop] [int] NULL,
	[product_name] [nvarchar](300) NULL,
	[price] [float] NULL,
	[create_date] [datetime] NULL,
	[description] [nvarchar](max) NULL,
	[status] [int] NULL,
	[id_category_item] [int] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rate]    Script Date: 12/3/2023 6:31:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rate](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NOT NULL,
	[star] [float] NOT NULL,
	[description] [nvarchar](250) NULL,
	[id_account] [int] NOT NULL,
	[create_date] [datetime] NOT NULL,
 CONSTRAINT [PK_rate] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 12/3/2023 6:31:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shop]    Script Date: 12/3/2023 6:31:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shop](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_account] [int] NOT NULL,
	[shop_name] [nvarchar](50) NULL,
	[image] [varchar](250) NULL,
	[create_date] [datetime] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shop_address]    Script Date: 12/3/2023 6:31:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shop_address](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_shop] [int] NOT NULL,
	[city] [varchar](50) NOT NULL,
	[district] [varchar](50) NOT NULL,
	[ward] [varchar](50) NOT NULL,
	[address] [varchar](50) NOT NULL,
 CONSTRAINT [PK_address_shop] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status]    Script Date: 12/3/2023 6:31:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status_order]    Script Date: 12/3/2023 6:31:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status_order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_status] [int] NOT NULL,
	[id_order] [int] NOT NULL,
	[create_date] [datetime] NOT NULL,
	[id_account] [int] NOT NULL,
 CONSTRAINT [PK_status_order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[storage]    Script Date: 12/3/2023 6:31:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[storage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NULL,
	[quantity] [int] NULL,
	[create_date] [datetime] NULL,
 CONSTRAINT [PK_Storge] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_order]    Script Date: 12/3/2023 6:31:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[total] [float] NOT NULL,
	[id_account] [int] NOT NULL,
	[create_date] [datetime] NOT NULL,
	[address_order] [nvarchar](1000) NOT NULL,
	[pay] [bit] NOT NULL,
	[id_shop] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[account] ON 

INSERT [dbo].[account] ([id], [username], [password], [create_date], [status]) VALUES (5, N'mdung0907', N'$2a$10$o2Of3.2Wpd7qgUByJlTHOO3IVJNpSB.Hz63yCex6hnvgfz7CwoG9W', CAST(N'2023-12-02T14:18:29.553' AS DateTime), 1)
INSERT [dbo].[account] ([id], [username], [password], [create_date], [status]) VALUES (6, N'venvenven', N'$2a$10$L.zHsW9JIl14GibIiRcXE.nTbWRg3cB8iZFsvrlAoIPx.aChqrkqG', CAST(N'2023-12-02T14:19:04.737' AS DateTime), 1)
INSERT [dbo].[account] ([id], [username], [password], [create_date], [status]) VALUES (7, N'khuongnguyen', N'$2a$10$LLyAI1ZaXLJavDMFM0decuh6q1TVBmJyWyKkYRi64k3tQXJ6w8jIS', CAST(N'2023-12-02T14:19:24.267' AS DateTime), 1)
INSERT [dbo].[account] ([id], [username], [password], [create_date], [status]) VALUES (8, N'mdung09072003', N'$2a$10$/WClc7wklK2DrR8iuZqABuiJfitxqQBwKxv0LJS3aSVMElGx0BBsO', CAST(N'2023-12-02T20:30:57.727' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[account] OFF
GO
SET IDENTITY_INSERT [dbo].[account_role] ON 

INSERT [dbo].[account_role] ([id], [id_account], [id_role]) VALUES (9, 5, 1)
INSERT [dbo].[account_role] ([id], [id_account], [id_role]) VALUES (10, 6, 3)
INSERT [dbo].[account_role] ([id], [id_account], [id_role]) VALUES (11, 7, 3)
INSERT [dbo].[account_role] ([id], [id_account], [id_role]) VALUES (12, 5, 2)
INSERT [dbo].[account_role] ([id], [id_account], [id_role]) VALUES (14, 6, 2)
INSERT [dbo].[account_role] ([id], [id_account], [id_role]) VALUES (15, 8, 1)
INSERT [dbo].[account_role] ([id], [id_account], [id_role]) VALUES (16, 6, 3)
SET IDENTITY_INSERT [dbo].[account_role] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [type_category], [create_date], [id_account], [image], [status]) VALUES (24, N'Thời Trang Nam', CAST(N'2023-12-02T14:34:24.000' AS DateTime), 5, N'12f3c168b0de48bb8f399d3287594095.png', 1)
INSERT [dbo].[category] ([id], [type_category], [create_date], [id_account], [image], [status]) VALUES (25, N'Đồng Hồ', CAST(N'2023-12-02T14:34:52.000' AS DateTime), 5, N'904f433a274745e6a8b82a1717440736.png', 1)
INSERT [dbo].[category] ([id], [type_category], [create_date], [id_account], [image], [status]) VALUES (26, N'Giày Dép Nam', CAST(N'2023-12-02T14:35:16.000' AS DateTime), 5, N'78275e4cc0de41cfb91f18d548512722.png', 1)
INSERT [dbo].[category] ([id], [type_category], [create_date], [id_account], [image], [status]) VALUES (27, N'Điện Thoại Và Phụ Kiện', CAST(N'2023-12-02T14:36:05.000' AS DateTime), 5, N'16f201acbdae4120979e580f1f8f9461.png', 1)
INSERT [dbo].[category] ([id], [type_category], [create_date], [id_account], [image], [status]) VALUES (28, N'Thiết Bị Điện Tử', CAST(N'2023-12-02T14:36:36.000' AS DateTime), 5, N'0db9fe1b2d444088b32b4bb968967634.png', 1)
INSERT [dbo].[category] ([id], [type_category], [create_date], [id_account], [image], [status]) VALUES (29, N'Thời Trang Nữ', CAST(N'2023-12-02T14:36:50.000' AS DateTime), 5, N'92f817cee5984fc6825f5c0f6e5e2eaf.png', 1)
INSERT [dbo].[category] ([id], [type_category], [create_date], [id_account], [image], [status]) VALUES (30, N'Máy Ảnh', CAST(N'2023-12-02T14:37:02.000' AS DateTime), 5, N'a6b9e913efaa4751a31df2716ad318c3.png', 1)
INSERT [dbo].[category] ([id], [type_category], [create_date], [id_account], [image], [status]) VALUES (31, N'Giày Dép Nữ', CAST(N'2023-12-02T14:37:47.000' AS DateTime), 5, N'b98b4e73d33742c79500368a32c123f4.png', 1)
INSERT [dbo].[category] ([id], [type_category], [create_date], [id_account], [image], [status]) VALUES (32, N'Máy Tính và Laptop', CAST(N'2023-12-02T16:12:08.000' AS DateTime), 5, N'640a4be8670843069cc31956217596c9.jpg', 1)
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[category_item] ON 

INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (8, N'Điện thoại', CAST(N'2023-12-02T14:47:56.000' AS DateTime), 5, 27, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (9, N'Máy tính bảng', CAST(N'2023-12-02T14:48:15.000' AS DateTime), 5, 27, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (10, N'Pin dự phòng', CAST(N'2023-12-02T14:49:31.000' AS DateTime), 5, 27, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (11, N'Bảo vệ màn hình', CAST(N'2023-12-02T14:51:08.000' AS DateTime), 5, 27, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (12, N'Thẻ nhớ', CAST(N'2023-12-02T14:51:14.000' AS DateTime), 5, 27, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (13, N'Đồng hồ nam', CAST(N'2023-12-02T14:51:50.000' AS DateTime), 5, 25, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (14, N'Đồng hồ nữ', CAST(N'2023-12-02T14:51:55.000' AS DateTime), 5, 25, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (15, N'Đồng hồ trẻ em', CAST(N'2023-12-02T14:52:03.000' AS DateTime), 5, 25, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (16, N'Phụ kiện đồng hồ', CAST(N'2023-12-02T14:52:15.000' AS DateTime), 5, 25, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (17, N'Bộ đồng hồ', CAST(N'2023-12-02T14:52:52.000' AS DateTime), 5, 25, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (18, N'Bốt', CAST(N'2023-12-02T14:53:17.000' AS DateTime), 5, 26, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (19, N'Thể thao', CAST(N'2023-12-02T14:53:23.000' AS DateTime), 5, 26, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (20, N'Giày sục', CAST(N'2023-12-02T14:53:35.000' AS DateTime), 5, 26, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (21, N'Giày tây', CAST(N'2023-12-02T14:53:43.000' AS DateTime), 5, 26, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (22, N'Giày Oxfords', CAST(N'2023-12-02T14:53:59.000' AS DateTime), 5, 26, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (23, N'Xăng đan và dép', CAST(N'2023-12-02T14:54:12.000' AS DateTime), 5, 26, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (24, N'Phụ kiện giày dép', CAST(N'2023-12-02T14:54:23.000' AS DateTime), 5, 26, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (25, N'Bốt', CAST(N'2023-12-02T14:59:52.000' AS DateTime), 5, 31, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (26, N'Thể thao', CAST(N'2023-12-02T15:00:03.000' AS DateTime), 5, 31, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (27, N'Cao gót', CAST(N'2023-12-02T15:00:12.000' AS DateTime), 5, 31, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (28, N'Giày đế xuồng', CAST(N'2023-12-02T15:01:12.000' AS DateTime), 5, 31, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (29, N'Xăng đan và dép', CAST(N'2023-12-02T15:01:23.000' AS DateTime), 5, 31, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (30, N'Phụ kiện giày dép', CAST(N'2023-12-02T15:01:38.000' AS DateTime), 5, 31, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (31, N'Máy ảnh máy quay phim', CAST(N'2023-12-02T15:02:11.000' AS DateTime), 5, 30, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (32, N'Thẻ nhớ', CAST(N'2023-12-02T15:02:20.000' AS DateTime), 5, 30, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (33, N'Ống kính', CAST(N'2023-12-02T15:02:26.000' AS DateTime), 5, 30, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (34, N'Máy giám sát', CAST(N'2023-12-02T15:02:37.000' AS DateTime), 5, 30, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (35, N'Phụ kiện máy ảnh', CAST(N'2023-12-02T15:02:47.000' AS DateTime), 5, 30, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (36, N'Thiết bị đeo thông minh', CAST(N'2023-12-02T15:03:16.000' AS DateTime), 5, 28, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (37, N'Phụ kiện Tivi', CAST(N'2023-12-02T15:03:26.000' AS DateTime), 5, 28, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (38, N'Đĩa game', CAST(N'2023-12-02T15:03:39.000' AS DateTime), 5, 28, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (39, N'Máy game console', CAST(N'2023-12-02T15:03:56.000' AS DateTime), 5, 28, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (40, N'Phụ kiện điện tử', CAST(N'2023-12-02T15:04:06.000' AS DateTime), 5, 28, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (41, N'Áo khoác', CAST(N'2023-12-02T15:07:20.000' AS DateTime), 5, 24, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (42, N'Áo vest Blazer', CAST(N'2023-12-02T15:07:35.000' AS DateTime), 5, 24, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (43, N'Áo hoodie Len Nỉ', CAST(N'2023-12-02T15:07:59.000' AS DateTime), 5, 24, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (44, N'Quần jeans', CAST(N'2023-12-02T15:08:11.000' AS DateTime), 5, 24, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (45, N'Quần dài Âu', CAST(N'2023-12-02T15:08:26.000' AS DateTime), 5, 24, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (46, N'Quần sort', CAST(N'2023-12-02T15:08:35.000' AS DateTime), 5, 24, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (47, N'Áo ba lỗ', CAST(N'2023-12-02T15:08:42.000' AS DateTime), 5, 24, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (48, N'Quần lót', CAST(N'2023-12-02T15:08:51.000' AS DateTime), 5, 24, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (49, N'Quần lót', CAST(N'2023-12-02T15:09:16.000' AS DateTime), 5, 29, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (50, N'Quần đùi', CAST(N'2023-12-02T15:09:28.000' AS DateTime), 5, 29, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (51, N'Chân váy', CAST(N'2023-12-02T15:09:36.000' AS DateTime), 5, 29, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (52, N'Đầm váy', CAST(N'2023-12-02T15:09:46.000' AS DateTime), 5, 29, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (53, N'Đồ khoác', CAST(N'2023-12-02T15:09:59.000' AS DateTime), 5, 29, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (54, N'Đồ ngủ', CAST(N'2023-12-02T15:10:07.000' AS DateTime), 5, 29, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (55, N'Đồ bầu', CAST(N'2023-12-02T15:10:39.000' AS DateTime), 5, 29, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (56, N'Đồ hóa trang', CAST(N'2023-12-02T15:10:45.000' AS DateTime), 5, 29, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (57, N'Đồng Hồ Thông Minh', CAST(N'2023-12-02T15:57:24.000' AS DateTime), 5, 25, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (58, N'Tai Nghe', CAST(N'2023-12-02T16:03:11.000' AS DateTime), 5, 27, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (59, N'Máy Tính', CAST(N'2023-12-02T16:12:26.000' AS DateTime), 5, 32, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (60, N'Laptop', CAST(N'2023-12-02T16:12:34.000' AS DateTime), 5, 32, 1)
INSERT [dbo].[category_item] ([id], [type_category_item], [create_date], [id_account], [id_category], [status]) VALUES (61, N'Bàn Phím', CAST(N'2023-12-02T16:12:54.000' AS DateTime), 5, 32, 1)
SET IDENTITY_INSERT [dbo].[category_item] OFF
GO
SET IDENTITY_INSERT [dbo].[image_product] ON 

INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (8, 1, N'2477e6e457924baa9619c701ebdaf524.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (9, 1, N'58065878803843bfad26a7a6a431f896.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (10, 1, N'5a9f02bbcdd841438c5061826a8f0496.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (11, 1, N'fa1d30e119b44b499674e7cbbda75d38.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (12, 1, N'44c12bd84f7e4d05b140188c8aea0597.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (13, 1, N'486cb715a42d4c90812e05b6fa78368e.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (14, 1, N'69f5888526474163a21ac3968a1b0a8b.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (15, 2, N'573a86f4db2c4d20aadf2ffd1a1aaa2c.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (16, 2, N'00d5297f9f914ad5bb56bcbddf75fb11.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (17, 2, N'17328da7c32f4b90be5daa1a348fb75b.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (18, 2, N'7b2cc7dc40e74d8d86c2833a86bcec8f.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (19, 2, N'b0adc77cbc2c4fec8a7910eaae97414e.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (20, 2, N'b9f9a1310f6f44629da8d03462bcbc4b.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (21, 2, N'45c4143644b149e8bc1e14c1418804c9.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (22, 2, N'e8d882e6df6b4763bd420673934eeaa3.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (23, 3, N'1a9f6834ec1141829b29f4a6e767378c.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (24, 3, N'0fe767385c23490d870306380d76c62d.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (25, 3, N'0bcf8b436320492fbeacd7f913197ba8.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (26, 3, N'0ba6369e21d547f5ba8448003f419458.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (27, 3, N'bfbbe38bde6f43a789e3b58da6503dfc.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (28, 3, N'25a76006653a40b4a582177a7d54101f.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (29, 4, N'9454429267f047a6a85c83bfaae92a3e.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (30, 4, N'd097849c6d174bc9aec42176f1ed9f08.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (31, 4, N'eb57c5f8ac8843209ed14d62c9cbebac.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (32, 4, N'b6b27f6597014c9eba722a231e579197.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (33, 4, N'd7be8fd1f9014753bcf9d79e122cea73.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (34, 4, N'ea0e7ddc1f9048cfad1ab948e77922b8.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (35, 4, N'd7160d3db2434cc1a6eb4ea3c9b4d4a8.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (36, 4, N'009a338e7c2a490181328e2468e370ff.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (37, 5, N'f3d193836b7945a7b181b8658c7a571a.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (38, 5, N'a673f759d91e4572834172be0e7f88da.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (39, 5, N'4e981ab2acd44ee685e4b123e8560c8a.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (40, 5, N'78f7ec342a024abdaee6815411c1f423.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (41, 5, N'4250bcf6692c421b828b6a0bdb72eb65.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (42, 6, N'aa72187163804bcf86f3f7e78d35de1e.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (43, 6, N'14c675c5bd994bb7867a4104393b3a25.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (44, 6, N'a893ae509a6e4001ac8f1953a918fcca.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (45, 6, N'3fb7a0dafcd14de589287886f4c2174e.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (46, 7, N'4d5a7128068e4381bc551bf83c7abeed.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (47, 7, N'aa22a0b577ce4151bab0023a7ddc6473.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (48, 7, N'cc03e1014f094f7689296d57417ee168.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (49, 7, N'4af0157b9e97407eb54d1c6bc737b95d.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (50, 7, N'1a7733fd70c6489a82b641392dc3dad8.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (51, 7, N'43d97e0f5d334be794c907957d79e846.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (52, 7, N'4730326ca2164b9c9d0a10bcd90a49d5.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (53, 8, N'4f7a6ee5003e47b78ac111dcfd1353eb.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (54, 8, N'7dcc0286017c4636bf31820653096f02.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (55, 8, N'1f3303436db84c9bb5dc2cdf970cb3c5.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (56, 8, N'63392e8285b943e580f15bba63bc2b71.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (57, 9, N'27d34cc369e74fdbbd3183802461e525.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (58, 9, N'dcf4ed32ec904052ac0cea67b9398502.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (59, 9, N'2de1950917494b13af447bc205e129d0.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (60, 9, N'cc65d87d60d440da9cb40fbf500db367.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (61, 9, N'84951ac29cd042668a7c68f98284dab6.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (62, 10, N'9dec00bdd978418a962ea451219e3b95.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (63, 10, N'f084f926b93f423fa48a48bbd016d875.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (64, 10, N'ad673da546684a0c8e8b41808f2f11a2.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (65, 10, N'860092c730b14da999e70d2f3da62a7a.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (66, 10, N'785d3737b8914b79af42002e87b30ff3.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (67, 10, N'ea419a73a9b149b7bbb156aa6138bacc.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (68, 11, N'c3425a31e28c4e6bb8078d9b6fa4c03e.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (69, 11, N'5cb7bc79c2cc4c84b2498751c9630124.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (70, 11, N'829c79d3ad6243c1858be16e19a89183.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (71, 11, N'1280c0330b4b40848709f91ca84f036d.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (72, 12, N'30aadf060158459da68f2bed2a75b38d.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (73, 12, N'25586d4feaad4e3c8727f29426135def.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (74, 12, N'8127062db5de42ad8669c1511c744f14.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (75, 12, N'618e0531048d422e990428f5486a6a07.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (76, 12, N'3c80388d0b3e4b09bbcdafce39ebdc50.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (77, 12, N'9f990552c9644d78995902c8b33988a8.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (78, 13, N'2b1f7592e8d74230acb247aa9fb7d0da.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (79, 13, N'2167b778564a4a52a616283acce3dc54.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (80, 13, N'10b8e208530445a29dd537bc10f9d962.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (81, 13, N'f44de9b59b714121a9c2910cc5440d69.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (82, 13, N'8ae9786219eb44369f6fdab4eae0c6ed.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (83, 13, N'4ed00e64155b405d99138200d40a17b3.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (84, 13, N'93816a2624f64c8797d55f2ba44f9521.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (85, 13, N'74440cdd04b5469eb0aea15aaf20d3f9.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (86, 14, N'd3e1e9b69ce3461fba16a3d4b26a1474.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (87, 14, N'265f928a1ec04c98b04c088bbf9253e7.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (88, 14, N'84ad93e6522f4bbdb8f456b15d986a95.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (89, 14, N'3559c529987a4598a8e19d4d1e038d4e.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (90, 14, N'e9ad5c20ff744f5b9b333536219c704d.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (91, 14, N'ba181402f65b4d24ac451f42999e8838.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (92, 14, N'a3b117a19828499f999116456d982126.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (93, 15, N'75ceef1bcfee4cc9af940227f1c642ce.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (94, 15, N'6c603c131c634b33af080862da8d0c24.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (95, 15, N'0a9bb89db4c04b55895f31c9a37210f7.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (96, 15, N'15b71a4e61ba474e8802ff8381413f61.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (97, 15, N'c21f394376f744e1aad5d3c49373536e.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (98, 15, N'527420f265a34b3baea7b99286c71152.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (99, 15, N'd11fba1114b44d26a42f757c25a73dc4.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (100, 16, N'66460723566a4e69a7410a03942e9962.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (101, 16, N'0db989a6f7a94c59a525943c454ef6e5.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (102, 16, N'30574a0e929940209afe1b40271cc6fc.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (103, 16, N'2830a19ab1ff4532b22d7de325d98fe1.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (104, 16, N'3e70df153a1a477da7a511e0d29e6c24.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (105, 16, N'405982e1369a4998abe7c00628fbc538.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (106, 17, N'106e4fb8a3e047f29e293905b1326c41.jpg')
GO
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (107, 17, N'3fb240a3a8ac4a72be856a76db7daf9b.jpeg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (108, 17, N'49f8783f38904c2db611c819990052b9.jpeg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (109, 17, N'31936f65c2f040a4bfa6220c9ab917e9.jpeg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (110, 17, N'd24184b3621c46b39e72668963e154c5.jpeg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (111, 18, N'ce95d3b7d26e40528a50a93eb5e892e9.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (112, 18, N'95b891e179634063a35a0a2a3ec952f1.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (113, 18, N'f42edadd251c4ed68e6e9ffecff7bf9a.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (114, 18, N'22186d558f25494f9d3999f45c1e438f.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (115, 18, N'adc0a33403094bf7b31d6cc8677b38bb.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (116, 18, N'd4a5f20727ea48f28b3e68821f027425.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (117, 18, N'72793e81a6284e09b36d24b68d996629.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (118, 18, N'e075b5c44bc642c599d4cfd8d9d8fdda.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (119, 19, N'27d42651bae0451cbb7916a8050204a7.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (120, 19, N'7fcec821b8764f429839e79305292abc.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (121, 19, N'ac4262a8a40645a5b11855379dab4096.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (122, 19, N'0e72b8f11808422eaa87629606fede29.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (123, 19, N'14ab1224c70446fb98ac73073adde942.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (124, 19, N'5ec17cb24e4e4a49b2aebe56093e6372.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (125, 19, N'9ae652eb28274f168e80f029ba7c0edc.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (126, 19, N'b6d1f1bda26b4be78bba60424fd0fc5d.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (127, 20, N'1aa5f0a5998a4e89a2e2c49b3715fc99.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (128, 20, N'728409d690164a848545ae848577bbf5.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (129, 20, N'07a8f5cc2ba54c46a1374bcb8358a281.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (130, 20, N'eb5ec0aea9ce4986951c36d132307d4b.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (131, 20, N'abd5f654e77a4a579b51ebd2a409bb81.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (132, 20, N'01ffbc05fd6943dea768c44e357df072.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (133, 20, N'b1b7741b768a4310a9b48159597520ff.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (134, 22, N'5e39af442b534497a69e1bb6d6599143.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (135, 22, N'cc356f4de1b846d68706a0a7b0364959.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (136, 22, N'ba47cfb71ba74a1094c88931294e7088.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (137, 23, N'1fcf75d44eaf4e9c9363833d209baa7c.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (138, 23, N'506750fdffd3423d9a9a1a6b5a008182.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (139, 23, N'df3169331c174f6590a919c1c970be9b.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (162, 21, N'fda147ac68df49619c07aa6f8eeee7a0.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (163, 21, N'd3383abde45a4e74bddb59b6e453d169.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (164, 24, N'23fd584092a8440b989c83cbd83499fc.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (165, 24, N'7bfa5404880e4865a89288d1bf12463f.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (166, 25, N'c8c2725145c040b795cfe8a5b3996a2d.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (167, 25, N'48668241812f48a6a43ca058b8e28d05.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (168, 25, N'e56057f0b9cb42629eb38406fe94b0b0.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (169, 26, N'70f2f4e675e0427a89f0439a6e04a735.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (170, 26, N'750edaa2f33546cfba1660a2d467f308.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (171, 27, N'c13416a396ba4c91b71edb1c6ef69bfb.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (172, 27, N'517a30efaed64681bc5cbf03c259527b.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (173, 27, N'b5b4aa704286424fb095eb657b22eef3.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (174, 27, N'22cbd71f1d534eb6a24ece9ed57cb51e.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (175, 28, N'5d68058cd3e64d5283a9e4fb6b446033.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (176, 28, N'90028f2e5557473ba510c197748bdd26.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (177, 28, N'5bf73d0e9d1a493eab7331f5c9670eae.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (178, 28, N'3e743cace0694de9bdba14ff0ecdcff6.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (179, 29, N'a2c06e516d3d4623abaabe5f3a6326df.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (180, 29, N'a0269f8c442c48baa7608dfe70356885.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (181, 29, N'5febbc2b5f2a4bb7b77d2038e3e77376.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (182, 30, N'5e099fe40c0d4647b8dd7569f3feba36.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (183, 30, N'9edb6ec0ef8d444ebb9082e90342e524.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (184, 30, N'd13e6b3453d84f308a2dada5891bbb0c.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (185, 31, N'd8e58ba2b2654e1789b42ca0adf71ab4.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (186, 31, N'0f7a390afc704ea3818435394c2313d9.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (187, 32, N'ec148419da9241ed85f9cc2792308f39.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (188, 32, N'aa741c0289014baca920093df92155b1.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (189, 32, N'4cb98328fa9b4bda88b473852e090c58.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (190, 32, N'af093288eb0d404f843863ab3f2e8009.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (191, 33, N'4dcfad85e3614d7399ad765fca094a0e.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (192, 33, N'904ef43b4fb24a78b647605d957aac7b.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (193, 33, N'cffe836bccd94a53a0c753610ae073df.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (194, 33, N'6c4d3e466cd6470eab78488636a83019.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (195, 34, N'9bbaa0aa473d4594bc7ee92fc11d35b2.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (196, 34, N'db06530c64834902b57f8ef64cf96bb5.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (197, 34, N'd4ef1d70447545e094d0eae6b0a7b19e.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (198, 35, N'f29f19fa34e14700a4144096d8c97484.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (199, 35, N'384f8da9d22f478590802378e01714cc.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (200, 35, N'e5677af37db14d7f99f4eaeb2c9dc881.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (210, 37, N'8bee7be90bb94be388d51fdaa9944cef.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (211, 36, N'02a251ba9ec44ed9bb3d9ef678f14c76.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (212, 38, N'13afab85520b4b8bb27c04f86d347441.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (213, 39, N'e72382d6b6584922a73aafbede33cca5.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (214, 40, N'b622684c46784384a58d53c46a03f887.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (215, 40, N'085845c9d64743aea4cf3e2547e0519d.jpg')
INSERT [dbo].[image_product] ([id], [id_product], [url]) VALUES (216, 40, N'454756b3e915491ab9c15e6a32718c10.jpg')
SET IDENTITY_INSERT [dbo].[image_product] OFF
GO
SET IDENTITY_INSERT [dbo].[info_account] ON 

INSERT [dbo].[info_account] ([id], [id_account], [fullname], [id_card], [phone], [gender], [email], [image]) VALUES (4, 5, N'Lương Quang Dũng', N'066203002007', N'0394900338', 1, N'lqdung999a@gmail.com', NULL)
INSERT [dbo].[info_account] ([id], [id_account], [fullname], [id_card], [phone], [gender], [email], [image]) VALUES (5, 6, N'Đỗ Thanh Vẹn', N'066203002009', N'0394900331', 1, N'thanhven2222@gmail.com', NULL)
INSERT [dbo].[info_account] ([id], [id_account], [fullname], [id_card], [phone], [gender], [email], [image]) VALUES (6, 7, N'Nguyễn Duy Khương', N'066203123349', N'0394900332', 1, N'khuong8177@gmail.com', NULL)
SET IDENTITY_INSERT [dbo].[info_account] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (1, 4, N'Điện thoại Xiaomi 12 5G', 9490000, CAST(N'2023-12-02T15:23:23.233' AS DateTime), N'<p><strong>Màn hình</strong></p><p><strong>Công nghệ màn hình: </strong><a href="https://www.thegioididong.com/hoi-dap/man-hinh-amoled-la-gi-905766">AMOLED</a></p><ul><li><a href="https://www.thegioididong.com/hoi-dap/do-phan-giai-man-hinh-la-gi-co-anh-huong-gi-toi-chat-luong-1335939#hmenuid1"><strong>Độ phân giải:</strong></a><strong> </strong><a href="https://www.thegioididong.com/tin-tuc/do-phan-giai-man-hinh-qhd-hd-fullhd-2k-4k-la-gi--592178#fullhd">Full HD+ (1080 x 2400 Pixels)</a></li></ul><p><strong>Màn hình rộng: </strong>6.28" - Tần số quét <a href="https://www.thegioididong.com/hoi-dap/tan-so-quet-man-hinh-may-tinh-la-gi-1292309#subhmenuid2">120 Hz</a></p><ul><li><a href="https://www.thegioididong.com/hoi-dap/do-sang-nit-tren-man-hinh-laptop-la-gi-bao-nhieu-la-phu-hop-1337509#hmenuid1"><strong>Độ sáng tối đa:</strong></a><strong> </strong>1100 nits</li></ul><p><strong>Mặt kính cảm ứng: </strong><a href="https://www.thegioididong.com/hoi-dap/tim-hieu-kinh-cuong-luc-corning-gorilla-glass-victus-1284586">Kính cường lực Corning Gorilla Glass Victus</a></p><p><strong>Camera sau</strong></p><ul><li><a href="https://www.thegioididong.com/hoi-dap/do-phan-giai-camera-tren-smartphone-la-gi-1339722"><strong>Độ phân giải:</strong></a></li></ul><p>Chính 50 MP &amp; Phụ 13 MP, 5 MP</p><p><a href="https://www.thegioididong.com/hoi-dap/cac-chuan-quay-phim-tren-dien-thoai-tablet-pho-bi-1174134#hd">HD 720p@30fps</a></p><p><a href="https://www.thegioididong.com/hoi-dap/cac-chuan-quay-phim-tren-dien-thoai-tablet-pho-bi-1174134#fullhd">FullHD 1080p@60fps</a></p><p><a href="https://www.thegioididong.com/hoi-dap/cac-chuan-quay-phim-tren-dien-thoai-tablet-pho-bi-1174134#fullhd">FullHD 1080p@30fps</a></p><p><a href="https://www.thegioididong.com/hoi-dap/cac-chuan-quay-phim-tren-dien-thoai-tablet-pho-bi-1174134#4k">4K 2160p@30fps</a></p><p><a href="https://www.thegioididong.com/hoi-dap/cac-chuan-quay-phim-tren-dien-thoai-tablet-pho-bi-1174134#4k">4K 2160p@60fps</a></p><p><a href="https://www.thegioididong.com/hoi-dap/cac-chuan-quay-phim-tren-dien-thoai-tablet-pho-bi-1174134#8k">8K 4320p@24fps</a></p><p><strong>Quay phim: </strong><a href="https://www.thegioididong.com/hoi-dap/tim-hieu-cac-loai-den-flash-tren-camera-dien-thoai-1143808">Có</a></p><p><a href="https://www.thegioididong.com/tin-tuc/tat-tan-tat-ve-che-do-quay-video-hien-thi-kep-1472983#Quayvideohienthikep">Quay video hiển thị kép</a></p><p><a href="https://www.thegioididong.com/hoi-dap/che-do-quay-phim-time-lapse-la-gi-1172228#hmenuid1">Trôi nhanh thời gian (Time Lapse)</a></p><p><a href="https://www.thegioididong.com/hoi-dap/camera-goc-rong-goc-sieu-rong-tren-smartphone-l-1172240">Góc siêu rộng (Ultrawide)</a></p><p><a href="https://www.thegioididong.com/hoi-dap/zoom-quang-hoc-va-zoom-ky-thuat-so-la-gi-co-gi-khac-nhau-1296828#zoom-ky-thuat-so">Zoom kỹ thuật số</a></p><p><a href="https://www.thegioididong.com/hoi-dap/camera-goc-rong-goc-sieu-rong-tren-smartphone-l-1172240">Góc rộng (Wide)</a></p><p><a href="https://www.thegioididong.com/hoi-dap/che-do-quay-video-slow-motion-la-gi-luu-y-khi-quay-video-1013728">Quay chậm (Slow Motion)</a></p><p><a href="https://www.thegioididong.com/hoi-dap/chup-anh-xoa-phong-la-gi-no-co-tac-dung-nhu-the-na-1138006">Xóa phông</a></p><p><a href="https://www.thegioididong.com/hoi-dap/chup-anh-panorama-toan-canh-tren-camera-cua-smar-906425">Toàn cảnh (Panorama)</a></p><p><a href="https://www.thegioididong.com/hoi-dap/che-do-chong-rung-quang-hoc-ois-chup-anh-tren-sm-906416">Chống rung quang học (OIS)</a></p><p><a href="https://www.thegioididong.com/hoi-dap/che-do-chup-anh-raw-tren-smartphone-906402">Ảnh Raw</a></p><p><a href="https://www.thegioididong.com/hoi-dap/che-do-chup-dem-night-mode-la-gi-907873">Ban đêm (Night Mode)</a></p><p><a href="https://www.thegioididong.com/hoi-dap/che-do-chup-anh-manual-mode-pro-tren-smartphone-906405">Chuyên nghiệp (Pro)</a></p><p><a href="https://www.thegioididong.com/hoi-dap/che-do-chup-anh-hdr-tren-smartphone-la-gi-906400">HDR</a></p><p><a href="https://www.thegioididong.com/hoi-dap/che-do-chup-anh-bang-cu-chi-tren-smartphone-906420">Chụp bằng cử chỉ</a></p><p><a href="https://www.thegioididong.com/hoi-dap/che-do-chup-anh-slow-shutter-tren-smartphone-906423">Phơi sáng</a></p><p><a href="https://www.thegioididong.com/tin-tuc/cac-che-do-chup-anh-tren-smartphone-tiep-theo--739084#sieudophangiai">Siêu độ phân giải</a></p><p><a href="https://www.thegioididong.com/hoi-dap/ai-camera-la-gi-co-tac-dung-gi-trong-may-anh-1169103">AI Camera</a></p><p><a href="https://www.thegioididong.com/hoi-dap/che-do-lam-dep-beautify-tren-smartphone-tablet-1172231">Làm đẹp</a></p><p><a href="https://www.thegioididong.com/hoi-dap/che-do-chup-macro-la-gi-907851">Siêu cận (Macro)</a></p><p><a href="https://www.thegioididong.com/hoi-dap/google-lens-la-gi-1174811">Google Lens</a></p><p><strong>Đèn Flash:</strong></p><p>Bộ lọc màu</p><p>Xiaomi ProFocus</p><p><strong>Tính năng: </strong><a href="https://www.thegioididong.com/hoi-dap/tim-hieu-cac-loai-den-flash-tren-camera-dien-thoai-1143808">Có</a></p><p><strong>Camera trước</strong></p><ul><li><a href="https://www.thegioididong.com/hoi-dap/do-phan-giai-camera-tren-smartphone-la-gi-1339722"><strong>Độ phân giải:</strong></a></li></ul><p>32 MP</p><p><a href="https://www.thegioididong.com/tin-tuc/day-la-nhung-gi-ban-can-biet-ve-troi-nhanh-thoi-gian-1472026#Troinhanhthoigian">Trôi nhanh thời gian (Time Lapse)</a></p><p><a href="https://www.thegioididong.com/hoi-dap/che-do-chup-anh-hdr-tren-smartphone-la-gi-906400">HDR</a></p><p><a href="https://www.thegioididong.com/hoi-dap/cac-chuan-quay-phim-tren-dien-thoai-tablet-pho-1174134#fullhd">Quay video Full HD</a></p><p><a href="https://www.thegioididong.com/hoi-dap/chup-anh-panorama-toan-canh-tren-camera-cua-smar-906425">Toàn cảnh (Panorama)</a></p><p><a href="https://www.thegioididong.com/hoi-dap/cac-chuan-quay-phim-tren-dien-thoai-tablet-pho-1174134#hd">Quay video HD</a></p><p><a href="https://www.thegioididong.com/hoi-dap/che-do-chup-anh-bang-cu-chi-tren-smartphone-906420">Chụp bằng cử chỉ</a></p><p><a href="https://www.thegioididong.com/hoi-dap/flash-man-hinh-tren-camera-la-gi-925753">Flash màn hình</a></p><p><a href="https://www.thegioididong.com/hoi-dap/cong-nghe-selfie-ai-beauty-la-gi-1049958">Làm đẹp A.I</a></p><p><a href="https://www.thegioididong.com/hoi-dap/chup-anh-xoa-phong-la-gi-no-co-tac-dung-nhu-the-na-1138006">Xóa phông</a></p><p><a href="https://www.thegioididong.com/hoi-dap/che-do-quay-video-slow-motion-la-gi-luu-y-khi-quay-video-1013728">Quay chậm (Slow Motion)</a></p><p>Hiệu ứng Bokeh</p><p>Chân dung đêm</p><p>Bộ lọc màu</p><p><strong>Tính năng:</strong></p><p><strong>Hệ điều hành &amp; CPU</strong></p><ul><li><a href="https://www.thegioididong.com/hoi-dap/he-dieu-hanh-la-gi-804907#hmenuid1"><strong>Hệ điều hành:</strong></a><strong> </strong><a href="http://www.thegioididong.com/tin-tuc/tat-tan-tat-ve-he-dieu-hanh-android-12-1473025#Android12">Android 12</a></li></ul><p><a href="https://www.thegioididong.com/tin-tuc/snapdragon-8-gen-1-la-gi-tat-tan-tat-ve-chip-cao-cap-cua-qualcomm-1471868#Snapdragon8Gen18nhan">Snapdragon 8 Gen 1 8 nhân</a></p><p><strong>Chip xử lý (CPU): </strong><a href="https://www.thegioididong.com/tin-tuc/snapdragon-8-gen-1-la-gi-tat-tan-tat-ve-chip-cao-cap-cua-qualcomm-1471868#Snapdragon8Gen18nhan">Snapdragon 8 Gen 1 8 nhân</a></p><ul><li><a href="https://www.thegioididong.com/hoi-dap/toc-do-cpu-la-gi-co-y-nghia-gi-trong-cac-thiet-bi-dien-tu-1299483"><strong>Tốc độ CPU:</strong></a><strong> </strong>1 nhân 3 GHz, 3 nhân 2.5 GHz &amp; 4 nhân 1.79 GHz</li></ul><p><strong>Chip đồ họa (GPU): </strong><a href="https://www.thegioididong.com/tin-tuc/tat-tan-tat-ve-gpu-adreno-730-hieu-suat-an-tuong-tiet-kiem-dien-1472021#Adreno730">Adreno 730</a></p><p><strong>Bộ nhớ &amp; Lưu trữ</strong></p><ul><li><a href="https://www.thegioididong.com/hoi-dap/ram-la-gi-co-y-nghia-gi-trong-cac-thiet-bi-dien-t-1216259"><strong>RAM:</strong></a><strong> </strong>8 GB</li></ul><p><strong>Dung lượng lưu trữ: </strong>256 GB</p><p><strong>Dung lượng còn lại (khả dụng) khoảng: </strong>229 GB</p><p><strong>Danh bạ:</strong> Không giới hạn</p><p><strong>Kết nối</strong></p><p><strong>Mạng di động: </strong><a href="https://www.thegioididong.com/hoi-dap/mang-5g-la-gi-co-nhung-uu-diem-gi-so-voi-4g-1312277">Hỗ trợ 5G</a></p><p><strong>SIM: </strong><a href="https://www.thegioididong.com/hoi-dap/sim-thuong-micro-sim-nano-sim-esim-la-gi-co-gi-khac-nhau-1310659#nano-sim">2 Nano SIM</a></p><ul><li><a href="https://www.thegioididong.com/hoi-dap/toc-do-mang-wifi-nhu-the-nao-thi-moi-goi-la-nhanh-567510#hmenuid1"><strong>Wifi:</strong></a></li></ul><p><a href="https://www.thegioididong.com/tin-tuc/wi-fi-direct-la-gi--590298">Wi-Fi Direct</a></p><p><a href="https://www.thegioididong.com/tin-tuc/wifi-la-gi-cai-dat-wifi-hotspot-nhu-the-nao--590309#wifihotspot">Wi-Fi hotspot</a></p><p><a href="https://www.thegioididong.com/hoi-dap/wifi-dual-band-la-gi-736489">Dual-band (2.4 GHz/5 GHz)</a></p><p><a href="https://www.thegioididong.com/hoi-dap/wi-fi-chuan-80211ax-la-gi-tim-hieu-ve-wi-fi-the-1187524">Wi-Fi 802.11 a/b/g/n/ac/ax</a></p><ul><li><a href="https://www.thegioididong.com/hoi-dap/gps-la-gi-806129#hmenuid1"><strong>GPS:</strong></a></li></ul><p><a href="https://www.thegioididong.com/hoi-dap/gps-la-gi-806129#subhmenuid3">BEIDOU</a></p><p><a href="https://www.thegioididong.com/hoi-dap/gps-la-gi-806129#a-gps">GPS</a></p><p><a href="https://www.thegioididong.com/hoi-dap/gps-la-gi-806129#glonass">GLONASS</a></p><p><a href="https://www.thegioididong.com/hoi-dap/gps-la-gi-806129#galileo">GALILEO</a></p><ul><li><a href="https://www.thegioididong.com/hoi-dap/cong-nghe-bluetooth-743602#hmenuid1"><strong>Bluetooth:</strong></a></li></ul><p><a href="https://www.thegioididong.com/hoi-dap/cong-nghe-bluetooth-a2dp-la-gi-723725">A2DP</a></p><p><a href="https://www.thegioididong.com/hoi-dap/cong-nghe-bluetooth-743602#le">LE</a></p><p><a href="https://www.thegioididong.com/hoi-dap/bluetooth-52-la-gi-1363503">v5.2</a></p><p><strong>Cổng kết nối/sạc: </strong><a href="https://www.thegioididong.com/hoi-dap/usb-typec-chuan-muc-cong-ket-noi-moi-723760">Type-C</a></p><p><strong>Jack tai nghe: </strong><a href="https://www.thegioididong.com/hoi-dap/usb-typec-chuan-muc-cong-ket-noi-moi-723760">Type-C</a></p><p><strong>Kết nối khác:</strong><a href="https://www.thegioididong.com/hoi-dap/ket-noi-nfc-tren-dien-thoai-may-tinh-bang-la-gi-1172835">NFC</a><a href="https://www.thegioididong.com/hoi-dap/cam-bien-hong-ngoai-tren-dien-thoai-la-gi-926657">Hồng ngoại</a></p><p><strong>Pin &amp; Sạc</strong></p><p><strong>Dung lượng pin: 4500 mAh</strong></p><p><strong>Loại pin: </strong><a href="https://www.thegioididong.com/hoi-dap/tim-hieu-pin-li-ion-la-gi-985040">Li-Ion</a></p><p><strong>Hỗ trợ sạc tối đa: </strong>67 W</p><p><strong>Sạc kèm theo máy: </strong>67 W</p><p><strong>Công nghệ pin:</strong></p><p><a href="https://www.thegioididong.com/hoi-dap/cong-nghe-sac-nhanh-tren-smartphone-755549">Sạc pin nhanh</a></p><p><a href="https://www.thegioididong.com/hoi-dap/che-do-tiet-kiem-pin-va-sieu-tiet-kiem-pin-la-gi-926730">Tiết kiệm pin</a></p><p><a href="https://www.thegioididong.com/hoi-dap/cong-nghe-sac-khong-day-la-gi-761328">Sạc không dây</a></p><p><a href="https://www.thegioididong.com/hoi-dap/sac-nguoc-khong-day-la-gi-1151528">Sạc ngược không dây</a></p><p><strong>Bảo mật nâng cao: </strong><a href="https://www.thegioididong.com/hoi-dap/tim-hieu-ve-cam-bien-van-tay-duoi-man-hinh-1171916">Mở khoá vân tay dưới màn hình</a><a href="https://www.thegioididong.com/hoi-dap/tinh-nang-mo-khoa-bang-khuon-mat-la-gi-1167784">Mở khoá khuôn mặt</a></p><p><strong>Tiện ích</strong></p><p><a href="https://www.thegioididong.com/tin-tuc/xiaomi-gioi-thieu-cong-nghe-tan-nhiet-moi-1396007">Công nghệ tản nhiệt LiquidCool</a></p><p><a href="https://www.thegioididong.com/hoi-dap/man-hinh-luon-hien-thi-always-on-display-la-gi-1169208">Màn hình luôn hiển thị AOD</a></p><p><a href="https://www.thegioididong.com/hoi-dap/cham-2-lan-sang-man-hinh-tren-smartphone-la-gi-1170632">Chạm 2 lần tắt/sáng màn hình</a></p><p><a href="https://www.thegioididong.com/hoi-dap/tinh-nang-da-cua-so-chia-doi-man-hinh-tren-andr-1074773">Đa cửa sổ (chia đôi màn hình)</a></p><p><a href="https://www.thegioididong.com/hoi-dap/dolby-vision-la-gi-cac-ung-dung-noi-bat-va-nhung-loai-1226284">Công nghệ hình ảnh Dolby Vision</a></p><p>HDR10+</p><p>Âm thanh bởi Harman Kardon</p><p>Loa kép</p><p><a href="https://www.thegioididong.com/hoi-dap/cong-nghe-am-thanh-dolby-altmos-la-gi-co-nhung-gi-noi-bat-1280672#hmenuid1">Âm thanh Dolby Atmos</a></p><p><a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-740243#mp4">MP4</a><a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-740243#avi">AVI</a></p><p><strong>Tính năng đặc biệt: </strong>Không có</p><p><strong>Kháng nước, bụi:</strong></p><p><strong>Ghi âm:&nbsp;</strong></p><p>Ghi âm mặc định</p><p>Ghi âm cuộc gọi</p><p><strong>Xem phim:</strong></p><p><a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-740243#flac">FLAC</a></p><p><a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-740243#ogg">OGG</a></p><p><a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-740243#midi">Midi</a></p><p><strong>Nghe nhạc:</strong></p><p><a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-740243#mp3">MP3</a></p><p><strong>Thông tin chung</strong></p><p><strong>Thiết kế:</strong></p><p><a href="https://www.thegioididong.com/tin-tuc/tim-hieu-cac-kieu-thiet-ke-tren-di-dong-va-may-tin-597153#nguyenkhoi">Nguyên khối</a></p><p><strong>Chất liệu: </strong>Khung kim loại &amp; Mặt lưng kính</p><p><strong>Kích thước, khối lượng:</strong> Dài 152.7 mm - Ngang 69.9 mm - Dày 8.2 mm - Nặng 180 g</p><p><strong>Thời điểm ra mắt:</strong> 03/2022</p>', 1, 8)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (2, 4, N'Điện thoại Iphone 15 Plus', 25790000, CAST(N'2023-12-02T15:42:59.300' AS DateTime), N'<p>Lý do chọn mua iPhone 15 series tại Thế Giới Di Động</p><p>Thế Giới Di Động là một trong những nhà bán lẻ điện thoại di động lớn nhất Việt Nam, cung cấp đa dạng các sản phẩm iPhone 15 chính hãng với mức giá cạnh tranh. Dưới đây là một số lý do khiến bạn nên chọn mua iPhone 15 tại Thế Giới Di Động:</p><p><strong>•&nbsp;Chất lượng sản phẩm:</strong>&nbsp;Thế Giới Di Động cam kết cung cấp sản phẩm&nbsp;<a href="https://www.thegioididong.com/dtdd-apple-iphone-15-series">iPhone 15</a>&nbsp;chính hãng. Điều này giúp bạn yên tâm về chất lượng sản phẩm và được hưởng đầy đủ các quyền lợi bảo hành của Apple.</p><p><strong>•&nbsp;Ưu đãi và khuyến mãi:</strong>&nbsp;Thế Giới Di Động thường xuyên có các chương trình khuyến mãi, giảm giá và tặng quà kèm theo, giúp bạn tiết kiệm chi phí khi mua sắm.</p><p><strong>•&nbsp;Hệ thống cửa hàng rộng rãi:</strong>&nbsp;Thế Giới Di Động có mạng lưới cửa hàng rộng khắp trên toàn quốc, giúp bạn dễ dàng tìm kiếm và mua sắm. Bạn cũng có thể trải nghiệm sản phẩm trực tiếp tại cửa hàng và nhận sự hỗ trợ từ nhân viên.</p><p><strong>•&nbsp;Dịch vụ hậu mãi tốt:</strong>&nbsp;Thế Giới Di Động cung cấp dịch vụ hậu mãi chuyên nghiệp, bao gồm bảo hành, sửa chữa và hỗ trợ kỹ thuật giúp bạn yên tâm khi sử dụng sản phẩm.</p><p><strong>•&nbsp;Hệ thống trả góp linh hoạt:</strong>&nbsp;Thế Giới Di Động cung cấp các lựa chọn trả góp phù hợp với ngân sách của bạn, giúp bạn mua được sản phẩm mong muốn mà không cần thanh toán toàn bộ số tiền một lúc.</p><p><strong>•&nbsp;Uy tín và kinh nghiệm:</strong>&nbsp;Với hơn 15 năm hoạt động trên thị trường, Thế Giới Di Động đã xây dựng được một uy tín mạnh mẽ trong ngành công nghiệp điện thoại di động. Điều này giúp bạn yên tâm khi mua sắm tại đây.</p><p><strong>•&nbsp;Dịch vụ mua sắm trực tuyến:</strong>&nbsp;Ngoài các hệ thống cửa hàng siêu thị, Thế Giới Di Động còn cung cấp dịch vụ mua sắm trực tuyến, giúp bạn mua hàng mọi lúc, mọi nơi và dễ dàng so sánh giá cả.</p><h3>Bảng so sánh thông số kỹ thuật iPhone 15 Plus 128GB và các sản phẩm khác thuộc iPhone 15 series:</h3><figure class="table"><table><tbody><tr><td><strong>Tiêu chí</strong></td><td><strong>iPhone 15 Plus 128GB</strong></td><td><a href="https://www.thegioididong.com/dtdd/iphone-15"><strong>iPhone 15 128GB</strong></a></td><td><a href="https://www.thegioididong.com/dtdd/iphone-15-pro"><strong>iPhone 15 Pro 128GB</strong></a></td><td><a href="https://www.thegioididong.com/dtdd/iphone-15-pro-max"><strong>iPhone 15 Pro Max 128GB</strong></a></td></tr><tr><td><strong>Màn hình</strong></td><td><p>&nbsp; &nbsp;•&nbsp;6.7 inch</p><p>&nbsp; &nbsp;•&nbsp;Màn hình Super Retina XDR</p><p>&nbsp; &nbsp;•&nbsp;Độ phân giải 2796x1290 pixel với mật độ điểm ảnh 460 ppi</p></td><td><p>&nbsp; &nbsp;•&nbsp;6.1 inch</p><p>&nbsp; &nbsp;•&nbsp;Màn hình Super Retina XDR</p><p>&nbsp; &nbsp;•&nbsp;Độ phân giải 2556x1179 pixel với mật độ điểm ảnh 460 ppi</p></td><td><p>&nbsp; •&nbsp;6.1 inch</p><p>&nbsp; •&nbsp;Màn hình Super Retina XDR</p><p>&nbsp; •&nbsp;Độ phân giải 2556x1179 pixel với mật độ điểm ảnh 460 ppi</p></td><td><p>&nbsp; &nbsp;•&nbsp;6.7 inch</p><p>&nbsp; &nbsp;•&nbsp;Màn hình Super Retina XDR</p><p>&nbsp; &nbsp;•&nbsp;Độ phân giải 2796x1290 pixel với mật độ điểm ảnh 460 ppi</p></td></tr><tr><td><strong>Kích thước và khối lượng</strong></td><td><p>&nbsp; &nbsp;•&nbsp;160,9 x 77,8 x 7,80 mm (Dài x Rộng x&nbsp;Dày)</p><p>&nbsp; &nbsp;•&nbsp;201 gram</p></td><td><p>&nbsp;&nbsp; •&nbsp;147,6 x 71,6 x 7,80 mm (Dài x Rộng x&nbsp;Dày)</p><p>&nbsp; &nbsp;•&nbsp;171 gram</p></td><td><p>&nbsp; &nbsp;•&nbsp;146,6 x 70,6 x 8,25 mm (Dài x Rộng x&nbsp;Dày)</p><p>&nbsp; &nbsp;•&nbsp;187 gram</p></td><td><p>&nbsp; &nbsp;•&nbsp;159.9 x 76.7 x 8.25 mm (Dài x Rộng x&nbsp;Dày)</p><p>&nbsp; &nbsp;•&nbsp;221 gram</p></td></tr><tr><td><strong>Khung viền</strong></td><td>Nhôm với mặt sau bằng kính pha màu</td><td>Nhôm với mặt sau bằng kính pha màu</td><td>Titan với mặt sau bằng kính nhám</td><td>Titan với mặt sau bằng kính nhám</td></tr><tr><td><strong>Chip</strong></td><td>Chip A16 Bionic</td><td>Chip A16 Bionic</td><td>Chip A17 Pro</td><td>Chip A17 Pro</td></tr><tr><td><strong>Camera</strong></td><td><p>&nbsp; •&nbsp;Hệ thống camera kép tiên tiến (Chính 48MP và Ultra Wide 12MP)</p><p>&nbsp; •&nbsp;Camera trước TrueDepth</p><p>&nbsp;•&nbsp;Các lựa chọn thu phóng quang học&nbsp; 0,5x, 1x, 2x</p></td><td><p>&nbsp; •&nbsp;Hệ thống camera kép tiên tiến (Chính 48MP và Ultra Wide 12MP)</p><p>&nbsp; •&nbsp;Camera trước TrueDepth</p><p>&nbsp; •&nbsp;Các lựa chọn thu phóng quang học 0,5x, 1x, 2x</p></td><td><p>&nbsp; •&nbsp;Hệ thống camera chuyên nghiệp (Chính 48MP, Ultra Wide 12MP và Telephoto 12MP)</p><p>&nbsp; •&nbsp;Camera trước TrueDepth</p><p>&nbsp; •&nbsp;Các lựa chọn thu phóng quang học 0,5x, 1x, 2x, 3x</p></td><td><p>&nbsp; &nbsp;•&nbsp;Hệ thống camera chuyên nghiệp&nbsp;(Chính 48MP, Ultra Wide 12MP và Telephoto 12MP)</p><p>&nbsp; •&nbsp;Camera trước TrueDepth</p><p>&nbsp; •&nbsp;Các lựa chọn thu phóng quang học 0,5x, 1x, 2x, 5x</p></td></tr><tr><td><strong>Nút tác vụ</strong></td><td>Nút chuyển đổi Chuông/Im Lặng</td><td>Nút chuyển đổi Chuông/Im Lặng</td><td>Nút Action Button</td><td>Nút Action Button</td></tr><tr><td><strong>Thời lượng pin</strong></td><td><p>&nbsp; &nbsp;•&nbsp;Thời gian xem video: 26 giờ</p><p>&nbsp; •&nbsp;Thời gian xem video (trực tuyến): 20 giờ</p><p>&nbsp; &nbsp;•&nbsp;Thời gian nghe nhạc: 100 giờ</p></td><td><p>&nbsp; &nbsp;•&nbsp;Thời gian xem video: 20 giờ</p><p>&nbsp; &nbsp;•&nbsp;Thời gian xem video (trực tuyến): 16 giờ</p><p>&nbsp; &nbsp;•&nbsp;Thời gian nghe nhạc: 80 giờ</p></td><td><p>&nbsp; &nbsp;•&nbsp;Thời gian xem video: 23 giờ</p><p>&nbsp; &nbsp;•&nbsp;Thời gian xem video (trực tuyến): 20 giờ</p><p>&nbsp; &nbsp;•&nbsp;Thời gian nghe nhạc: 75 giờ</p></td><td><p>&nbsp; &nbsp;•&nbsp;Thời gian xem video lên đến 29 giờ</p><p>&nbsp; &nbsp;•&nbsp;Thời gian xem video (trực tuyến) lên đến 25 giờ</p><p>&nbsp; &nbsp;•&nbsp;Thời gian nghe nhạc lên đến 95 giờ</p></td></tr><tr><td><strong>Cảm biến</strong></td><td>Con quay hồi chuyển độ lệch tương phản cao</td><td>Con quay hồi chuyển độ lệch tương phản cao</td><td><p>&nbsp; &nbsp;•&nbsp;LiDAR Scanner</p><p>&nbsp; •&nbsp;Con quay hồi chuyển độ lệch tương&nbsp;phản cao</p></td><td><p>&nbsp; &nbsp;•&nbsp;LiDAR Scanner</p><p>&nbsp; •&nbsp;Con quay hồi chuyển độ lệch tương&nbsp;phản cao</p></td></tr><tr><td><strong>Cổng kết nối</strong></td><td><p>&nbsp; &nbsp;•&nbsp;USB-C</p><p>&nbsp; &nbsp;•&nbsp;Hỗ trợ USB 2</p></td><td><p>&nbsp; &nbsp;•&nbsp;USB-C</p><p>&nbsp; &nbsp;•&nbsp;Hỗ trợ USB 2</p></td><td><p>&nbsp; &nbsp;•&nbsp;USB-C</p><p>&nbsp; &nbsp;•&nbsp;Hỗ trợ USB 3 (lên đến 10Gb/s)</p></td><td><p>&nbsp; &nbsp;•&nbsp;USB-C</p><p>&nbsp; &nbsp;•&nbsp;Hỗ trợ USB 3 (lên đến 10Gb/s)</p></td></tr></tbody></table></figure>', 1, 8)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (3, 4, N'Điện thoại Oppo A 57 128 GB', 4390000, CAST(N'2023-12-02T15:52:06.267' AS DateTime), N'<h3><a href="https://www.thegioididong.com/dtdd-oppo">OPPO</a>&nbsp;đã bổ sung thêm vào dòng sản phẩm OPPO A giá rẻ một thiết bị mới có tên&nbsp;<a href="https://www.thegioididong.com/dtdd/oppo-a57-128gb">OPPO A57 128GB</a>. Khác với mẫu&nbsp;<a href="https://www.thegioididong.com/dtdd/oppo-a57-5g">A57 5G</a>&nbsp;đã được ra mắt trước đó, điện thoại dòng A mới có màn hình HD+, camera chính 13 MP và pin 5000 mAh.</h3><h3>Thiết kế trẻ trung</h3><p><a href="https://www.thegioididong.com/dtdd-oppo-a">Điện thoại OPPO A</a> có màn hình giọt nước ở mặt trước. Khung viền còn được vát phẳng tạo cảm giác sang trọng khi cầm trên tay. Thiết bị được giới thiệu với hai màu sắc trẻ trung: Glowing Green và Glowing Black.</p><p>&nbsp;</p><p>OPPO trang bị cho máy màn hình IPS LCD kích thước 6.56 inch, hỗ trợ độ phân giải HD+ (720 x 1612 pixels), mật độ điểm ảnh khoảng 269 PPI.&nbsp;</p><h3>Hiệu năng ổn định trong tầm giá</h3><p>Bên trong OPPO A57 được trang bị bộ vi xử lý Helio G35 đến từ MediaTek, cùng RAM 4 GB và bộ nhớ trong 128 GB. Kết hợp cùng giao diện ColorOS 12.1 dựa trên Android 12 được cài sẵn, thiết bị hứa hẹn hiệu năng ổn định, chạy tốt các tác vụ cơ bản thường dùng.</p><p>&nbsp;</p><p><a href="https://www.thegioididong.com/dtdd-sac-sieu-nhanh">Điện thoại hỗ trợ sạc siêu nhanh</a>&nbsp;cho khả năng sạc 33 W cùng với đó là viên pin 5000 mAh. Thiết bị còn hỗ trợ các tính năng kết nối như: 4G VoLTE, Wi-Fi, Bluetooth 5.3, GPS, cổng USB-C và cổng cắm tai nghe 3.5 mm để người dùng dễ dàng thưởng thức âm nhạc.</p><h3>Hỗ trợ chụp ảnh quay phim</h3><p>Thiết bị có một camera 8 MP khẩu độ&nbsp;f/2.0 ở mặt trước để chụp ảnh selfie, mặt lưng có camera chính 13 MP khẩu độ f/2.2, cảm biến độ sâu 2 MP khẩu độ&nbsp;f/2.4 chuyên chụp ảnh chân dung và đèn flash LED để hỗ trợ chụp trong những tình huống thiếu sáng.</p><p>&nbsp;</p><p>Hệ thống camera sau của&nbsp;OPPO A57 128GB có thể quay video 1080p ở tốc độ 30 FPS. Ngoài ra máy còn hỗ trợ chụp HDR và chế độ toàn cảnh (panorama).</p><p>OPPO A57 128GB chắc chắn sẽ được đông đảo người tiêu dùng đón nhận do có mức giá rẻ mà sở hữu nhiều thông số kỹ thuật nổi bật. Một chiếc&nbsp;<a href="https://www.thegioididong.com/dtdd">điện thoại</a>&nbsp;giá rẻ đáng để sắm.</p>', 1, 8)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (4, 4, N'Befit WathFit', 590000, CAST(N'2023-12-02T16:00:18.450' AS DateTime), N'<h3><a href="https://www.thegioididong.com/dong-ho-thong-minh/befit-watch-fit-1">BeFit WatchFit</a>&nbsp;được trang bị các chức năng sức khỏe và thể thao cơ bản, đáp ứng được nhu cầu sử dụng của người dùng phổ thông. Tuy thuộc phân khúc giá rẻ nhưng chiếc đồng hồ thông minh này vẫn được trang bị tính năng nghe gọi, đảm bảo sự thuận tiện trong quá trình sử dụng.</h3><h3>Phong cách hiện đại, kiểu dáng nhỏ gọn</h3><p>Về mặt thiết kế BeFit WatchFit sẽ có vài điểm khác biệt so với những mẫu smartwacth cùng hãng. Sở hữu mặt đồng hồ hình chữ nhật có kích thước&nbsp;<strong>46.7 mm,</strong>&nbsp;các góc được bo cong mềm mại nên đối với những ai có cổ tay nhỏ như mình khi đeo cũng không bị thô. Bên cạnh phải của mặt đồng hồ có một nút bấm, khi mình thao tác thì thấy độ nảy khá tốt.</p><p>&nbsp;</p><p>Tuy nhiên, có một điểm mình chưa ưng lắm ở chiếc đồng hồ thông minh này là phần viền khá dày ở cả 4 cạnh. Dù vậy thì mình vẫn có thể sử dụng những tấm ảnh nền đen để tạo cảm giác liền mạch giữa màn hình và viền, tăng tính thẩm mỹ khi nhìn vào.</p><p>Đồng hồ được trang bị&nbsp;<strong>dây silicone</strong>&nbsp;vô cùng mềm mịn, dù mình đeo trên tay cả ngày dài cũng không bị hằn hay ngứa, rất thích hợp với những ai thường ra nhiều mồ hôi. Khối lượng của đồng hồ chỉ&nbsp;<strong>35.5 g</strong>,&nbsp;theo cảm nhận của mình là khá nhẹ nên những lúc mình nhảy dây cũng không cảm thấy mỏi tay.</p><p>&nbsp;</p><p><a href="https://www.thegioididong.com/dong-ho-thong-minh">Đồng hồ thông minh</a>&nbsp;được trang bị màn hình cảm ứng thuận tiện trong các thao tác điều khiển. Kích thước&nbsp;<strong>1.57 inch</strong>&nbsp;tuy không quá lớn nhưng vẫn đủ để hiển thị. Màn hình có độ phân giải&nbsp;<strong>200 x 320 Pixels</strong>&nbsp;mang đến những nội dung rõ nét,&nbsp;<strong>tấm nền IPS&nbsp;</strong>cho màu sắc chân thật và góc nhìn rộng. Những lúc mình sử dụng ở ngoài trời thì màn hình sẽ có bóng gương nhẹ nhưng nội dung hiển thị khá tốt.</p><p>&nbsp;</p><p>BeFit WatchFit không có tính năng&nbsp;<strong>màn hình luôn hiển thị (Always on Display)</strong>&nbsp;nhưng được trang bị tính năng nâng cổ tay sáng màn hình cũng rất tiện lợi khi dùng và tiết kiệm năng lượng. Trong quá trình mình sử dụng thì chưa thấy tình trạng bị trễ khi nâng cổ tay lên để xem giờ.</p><p>&nbsp;</p><h3>Hỗ trợ chăm sóc sức khỏe tốt hơn</h3><p>Đồng hồ thông minh BeFit được trang bị cảm biến đo nhịp tim với tốc độ nhanh chóng, tương đối chính xác. Đồng thời, thiết bị còn được hỗ trợ một số chức năng sức khỏe thông dụng như: Đo huyết áp,&nbsp;<a href="https://www.thegioididong.com/dong-ho-thong-minh-theo-doi-giac-ngu">theo dõi giấc ngủ</a>, đo nồng độ oxy trong máu (<a href="https://www.thegioididong.com/dong-ho-thong-minh?g=do-nong-do-oxy-trong-mau-spo2">SpO2</a>),... giúp người dùng theo dõi sự thay đổi của cơ thể một cách tốt hơn.</p><p>&nbsp;</p><p>Mình đã trải nghiệm tính năng theo dõi giấc ngủ trên đồng hồ rất nhiều lần và kết quả nhận được so với thực tế thì có độ chính xác cao. Đồng hồ đo được thời gian đi ngủ, thời gian thức dậy, giai đoạn ngủ sâu và ngủ nông giúp mình hiểu rõ hơn về tình trạng giấc ngủ từ đó tiến hành điều chỉnh cho phù hợp hơn.</p><p>&nbsp;</p><p>Bên cạnh đó, mình cũng đã tiến hành đo&nbsp;<strong>SpO2&nbsp;</strong>và&nbsp;<strong>nhịp tim</strong>&nbsp;bằng BeFit WatchFit và so sánh với máy đo y tế cầm tay. Kết quả giữa hai thiết bị có sai số nhưng không quá lớn, nên mình vẫn có thể tham khảo những chỉ số này để thiết lập chế độ ăn uống, nghỉ ngơi cho phù hợp với cơ thể.</p><p>&nbsp;</p><p>Tính năng đếm bước chân trên thiết bị này mình cũng đã trải nghiệm, về độ chính xác thì chỉ ở mức tương đối. Mình đã bật chế độ đi bộ để đếm bước chân và đi được 100 bước nhưng đồng hồ chỉ ghi nhận được 85 bước. Lúc mình chạy xe máy cũng có thử bật đếm bước chân, sau khoảng 6 km mình có dừng lại kiểm tra thì thấy đồng hồ đã ghi nhận 12 bước chân. Có thể thấy tính năng này hoạt động chưa thật sự ổn định.</p><p>&nbsp;</p><p><a href="https://www.thegioididong.com/dong-ho-thong-minh-befit">Đồng hồ thông minh BeFit</a>&nbsp;được trang bị những môn thể thao cơ bản như: Đi bộ, bóng rổ, cầu lông, chạy bộ, leo núi, đạp xe,&nbsp;<a href="https://www.thegioididong.com/dong-ho-thong-minh?g=bong-da">bóng đá</a>,... đáp ứng nhu cầu rèn luyện cơ bản của mọi người, cho người dùng thoải mái lựa chọn dựa vào sở thích và mục đích tập luyện. Khi mình tập luyện đồng hồ sẽ đo lường các chỉ số cơ thể, kết quả của buổi tập để thuận tiện cho việc đánh giá và đưa ra kế hoạch rèn luyện thích hợp.</p><p>&nbsp;</p><h3>Có thể nhận cuộc gọi ngay trên đồng hồ</h3><p>Trước tiên mình cần tải ứng dụng <strong>FitCloudPro</strong> để đồng bộ dữ liệu giữa điện thoại và đồng hồ. Theo như trải nghiệm của mình thì khả năng liên kết của hai thiết bị khá tốt, tin nhắn, thông báo và cuộc gọi được hiển thị một cách nhanh chóng.</p><p><strong>Tải ứng dụng&nbsp;FitCloudPro tại:&nbsp;</strong><a href="https://play.google.com/store/apps/details?id=com.topstep.fitcloudpro&amp;hl=en_US&amp;pli=1">CH Play</a>&nbsp;|&nbsp;<a href="https://apps.apple.com/us/app/fitcloudpro/id1452851243">App Store</a></p><p>Khi kết nối với điện thoại&nbsp;<strong>iOS&nbsp;</strong>những cuộc gọi thông thường hay từ ứng dụng mình đều có thể nhận hoặc từ chối bằng đồng hồ. Tuy nhiên, phần tên liên hệ sẽ không được hiển thị dù mình đã lưu trong danh bạ.&nbsp;</p><p>&nbsp;</p><p>Còn khi liên kết với điện thoại&nbsp;<strong>Android&nbsp;</strong>những cuộc gọi quay số thông thường mình có thể nhận hoặc từ chối trực tiếp trên đồng hồ. Đối với những cuộc gọi từ ứng dụng như: Zalo, Line, Messenger,... thì đồng hồ chỉ có thể từ chối chứ không nhận được.&nbsp;</p><p>&nbsp;</p><h3>Đồng hành cùng người dùng trong nhiều ngày</h3><p>BeFit WatchFit được trang bị&nbsp;<strong>viên pin 180 mAh</strong>&nbsp;cung cấp thời gian sử dụng<strong>&nbsp;lên đến 7 ngày</strong>, để nạp đầy pin cho thiết bị chỉ cần&nbsp;<strong>khoảng 2 giờ</strong>. Mình đã sử dụng toàn bộ các tính năng trên đồng hồ, cường độ dùng cao nên đến 5 ngày đã phải sạc lại.&nbsp; Mình có thể mang theo thiết bị trong những chuyến du lịch ngắn hạn, trong các buổi luyện tập mà không lo bị gián đoạn vì hết pin.</p><p><strong>Lưu ý:</strong>&nbsp;Tùy vào cường độ sử dụng của từng người dùng mà sẽ có sự chênh lệch giữa thời lượng pin thực tế với thông tin mà hãng cung cấp.</p><p>&nbsp;</p><p>Với chuẩn&nbsp;<a href="https://www.thegioididong.com/hoi-dap/chong-nuoc-va-chong-bui-tren-smart-phone-771130#subhmenuid3">kháng nước IP67</a>&nbsp;mình thoải mái đeo đồng hồ khi rửa tay, đi mưa,... mà không phải lo lắng nước xâm nhập vào bên trong làm hỏng thiết bị. Tuy nhiên, để đồng hồ thông minh hoạt động tốt và có tuổi thọ cao mình sẽ không đeo đồng hồ khi vào phòng xông hơi, tắm nước nóng, rửa với xà phòng,...</p><p><strong>Lưu ý:&nbsp;</strong>Khả năng kháng nước trên đồng hồ thông minh sẽ suy giảm theo thời gian, để đảm bảo độ bền thì nên hạn chế để thiết bị tiếp xúc với nước.</p><p>&nbsp;</p><h3>Rất nhiều tiện ích khác</h3><p>Bên cạnh các chức năng về sức khỏe và thể thao thì BeFit WatchFit còn trang bị rất nhiều tiện ích khác như: Tìm đồng hồ, báo thức, nhắc nhở lịch trình, điều khiển chơi nhạc trên điện thoại, tìm điện thoại, đồng hồ bấm giờ, đồng hồ đếm ngược,...</p><p>&nbsp;</p><p>BeFit WatchFit chắc chắn là một thiết bị thông minh mà nhiều người dùng đang tìm kiếm bởi kiểu dáng đẹp, hỗ trợ nhận cuộc gọi ngay trên đồng hồ, đa dạng chế độ thể thao và nhiều chức năng sức khỏe. Sản phẩm đáp ứng được nhu cầu sử dụng cơ bản của người dùng cùng mức giá hợp lý trong phân khúc.</p>', 1, 57)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (5, 4, N'Tai nghe Bluetooth Chụp Tai HAVIT H661BT', 400000, CAST(N'2023-12-02T16:03:40.663' AS DateTime), N'<h3><a href="https://www.thegioididong.com/tai-nghe/tai-nghe-bluetooth-chup-tai-havit-h661bt">Tai nghe Bluetooth Chụp Tai Havit H661BT</a> là dạng tai nghe chụp tai, sở hữu vẻ ngoài sang trọng, âm thanh sống động, kết nối nhanh chóng và ổn định, thời lượng pin sử dụng khá lâu, mang đến cho bạn những trải nghiệm tối ưu nhất.</h3><p>•&nbsp;Diện mạo <a href="https://www.thegioididong.com/tai-nghe">tai nghe</a> sang trọng, gam màu phù hợp với mọi phong cách và mọi lứa tuổi sử dụng.</p><p>• Trang bị công nghệ kết nối Bluetooth 5.3 hiện đại cho phép kết nối nhanh chóng giữa tai nghe với thiết bị, cho bạn trải nghiệm âm nhạc liền mạch mà không lo bị ngắt quãng.</p><p>•&nbsp;<a href="https://www.thegioididong.com/tai-nghe-havit">Tai nghe HAVIT</a>&nbsp;có thể kết nối 2 thiết bị cùng 1 lúc vô cùng tiện lợi và dễ sử dụng.</p><p>• Tai nghe hỗ trợ mic thoại với chất lượng thu âm tốt giúp chất lượng cuộc gọi rõ ràng và chi tiết.</p><p>• Tương thích với nhiều hệ điều hành: macOS, iOS, Android và Windows cho phép bạn có thể kết nối được với đa dạng các loại thiết bị điện tử hiện nay.</p><p>• Âm thanh sôi động, phong phú và mạnh mẽ mang đến những buổi tiệc âm nhạc tuyệt vời.</p><p>• Trang bị sẵn dây cáp 3.5 mm với chiều dài 1.2 m để người dùng linh hoạt chuyển thành tai nghe có dây, tiện lợi sử dụng khi tai nghe hết pin hoặc thiết bị gặp vấn đề về kết nối.</p>', 1, 58)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (6, 4, N'Pin sạc dự phòng Polymer 5000mAh Không dây Magnetic Type C PD 20W Xmobile DS611', 410000, CAST(N'2023-12-02T16:08:57.337' AS DateTime), N'<h3><a href="https://www.thegioididong.com/sac-dtdd/sac-du-phong-polymer-5000mah-khong-day-magnetic-type-c-pd-20w-xmobile-ds611">Pin sạc dự phòng Polymer 5000mAh Không dây Magnetic Type C PD 20W Xmobile DS611</a> sở hữu thiết kế độc đáo, công nghệ sạc hiện đại, sạc dự phòng là món phụ kiện nhỏ gọn hỗ trợ nạp pin tiện lợi mỗi ngày, dễ dàng mang theo bất cứ đâu mà không lo chiếm nhiều diện tích.</h3><p>•&nbsp;Kiểu dáng gọn đẹp, kích thước vừa tay cầm, linh hoạt cất gọn&nbsp;pin sạc dự phòng và mang theo mỗi ngày.</p><p>•&nbsp;Hiệu suất sạc lên đến 63%, dung lượng 5.000 mAh,&nbsp;<a href="https://www.thegioididong.com/sac-dtdd">pin sạc dự phòng</a> cho phép bạn cung cấp năng lượng cho thiết bị mọi lúc mọi nơi kể cả khi không có ổ điện gần đó, có thể sạc pin khoảng 1 lần cho chiếc iPhone 11 (nếu sạc đầy từ 0%).</p><p>•&nbsp;Trang bị công nghệ Power Delivery 20 W (sạc có dây qua cổng Type C) và sạc không dây Magnetic hỗ trợ bạn sạc pin cho thiết bị mà không cần cáp sạc rườm rà:</p><p>- Type C: 5V - 3A, 9V - 2.22A, 12V - 1.5A (20 W) tương thích với <a href="https://www.thegioididong.com/dtdd-apple-iphone-15-series">iPhone 15</a>,&nbsp;<a href="https://www.thegioididong.com/dtdd/iphone-15-plus">iPhone 15 Plus</a>,&nbsp;<a href="https://www.thegioididong.com/dtdd/iphone-15-pro">iPhone 15 Pro</a>,&nbsp;<a href="https://www.thegioididong.com/dtdd/iphone-15-pro-max">iPhone 15 Pro Max</a>.</p><p>- Magnetic: 5 W - 7.5 W - 10 W - 15 W.</p><p>• Pin sạc hỗ trợ sạc pin hiệu quả nhờ khả năng tự động phân phối dòng sạc sao cho phù hợp với từng loại thiết bị nhận sạc, vừa đảm bảo an toàn cho pin của thiết bị, vừa tối ưu thời gian chờ sạc.</p><p>•&nbsp;<a href="https://www.thegioididong.com/sac-dtdd-xmobile">Pin sạc dự phòng Xmobile</a> có thể sạc được với các thiết bị phổ biến hiện nay như: Điện thoại, máy tính bảng, tai nghe,...</p><p>•&nbsp;Lõi pin Li - Polymer giúp hạn chế rò rỉ năng lượng và hạn chế cháy nổ, an tâm sạc pin nhiều lần.</p>', 1, 10)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (7, 4, N'Tai nghe Chụp Tai Trẻ em AVA Plus KD 662 ', 90000, CAST(N'2023-12-02T16:23:04.413' AS DateTime), N'<h3><a href="https://www.thegioididong.com/tai-nghe/chup-tai-ava-kd-662">Tai nghe Chụp Tai Trẻ em AVA+ KD-662</a>&nbsp;được thiết kế tinh xảo từ chất liệu mềm mại, đeo vào đầu nhẹ nhàng, không bị mỏi, đau đầu - cổ - tai.</h3><p>• Chụp tai với đệm tai dày mềm êm ái, bao bọc tốt phần tai, cách âm hiệu quả, không gây bức bí, để người dùng thưởng thức trọn vẹn bản nhạc.</p><p>•&nbsp;<a href="https://www.thegioididong.com/tai-nghe-ava">Tai nghe AVA+</a>&nbsp;còn được hỗ trợ&nbsp;micro&nbsp;đảm bảo quá trình tương tác của bạn với đối tác, người thân thuận lợi, giọng thoại trong trẻo, sắc nét.&nbsp;</p><p>• <a href="https://www.thegioididong.com/tai-nghe">Tai nghe</a>&nbsp;kết nối&nbsp;với điện thoại, laptop, máy tính bảng,… bằng jack 3.5 mm tiện lợi, để bạn bắt đầu thưởng thức những bản nhạc yêu thích nhất trong kho âm nhạc của mình.</p>', 1, 58)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (8, 4, N'Tai nghe Chụp Tai Sony MDR  ZX110AP', 449000, CAST(N'2023-12-02T16:26:29.867' AS DateTime), N'<h4><a href="https://www.thegioididong.com/tai-nghe/tai-nghe-sony-mdr-zx110ap">Tai nghe Chụp Tai Sony MDR - ZX110AP</a> với thiết kế hiện đại, phong cách</h4><h4>&nbsp;</h4><h4>Đệm <a href="https://www.thegioididong.com/tai-nghe">tai nghe</a> được thiết kế mềm mại, tạo cảm giác êm ái khi đeo, không gây đau tai</h4><h4>&nbsp;</h4><h4>Âm thanh rõ nét, trong trẻo, với âm bass tốt thích hợp với nhạc sôi động</h4><h4>&nbsp;</h4><h4>Phần quai đeo tai nghe có thể nới lỏng thêm 4.5 cm để phù hợp cho từng người dùng khác nhau</h4><h4>&nbsp;</h4><h4><a href="https://www.thegioididong.com/tai-nghe-on-ear">Tai nghe chụp tai</a>&nbsp;có thể gấp gọn, dễ dàng cất trong balo, túi xách, mang theo trong những chuyến đi</h4><h4>&nbsp;</h4><h4><a href="https://www.thegioididong.com/tai-nghe-co-day">Tai nghe có dây</a> dài 120 cm, jack cắm 3.5 mm dùng được cho&nbsp;điện thoại,&nbsp;máy tính bảng,&nbsp;laptop, máy nghe nhạc,...</h4><h4>&nbsp;</h4><h4>Nút điều khiển <a href="https://www.thegioididong.com/tai-nghe-sony">tai nghe Sony</a> với chức năng dừng/phát nhạc, chuyển bài, nhận cuộc gọi với mic thoại tích hợp</h4><h4>&nbsp;</h4>', 1, 58)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (9, 4, N'Tai nghe Bluetooth AirPods 3 Lightning Charge Apple MPNY3', 4290000, CAST(N'2023-12-02T16:29:16.170' AS DateTime), N'<h3><a href="https://www.thegioididong.com/tai-nghe/tai-nghe-bluetooth-airpods-3-lightning-charge-apple-mpny3-trang">Tai nghe Bluetooth AirPods 3 Lightning Charge Apple MPNY3</a> sở hữu thiết kế gọn nhẹ, màu sắc trang nhã cùng nhiều công nghệ hiện đại đang chờ đón các iFan như: kết nối Bluetooth, Adaptive EQ, Chip Apple H1,...</h3><p>• Thiết kế <a href="https://www.thegioididong.com/tai-nghe">tai nghe</a> nhỏ gọn với màu trắng sang trọng vốn quen thuộc trên các dòng <a href="https://www.thegioididong.com/tai-nghe-apple">tai nghe Apple</a>. Dạng <a href="https://www.thegioididong.com/tai-nghe-earbuds">tai nghe Earbuds</a> cho cảm giác thoải mái khi đeo.</p><p>• Tích hợp các công nghệ âm thanh tiên tiến độc quyền nhà Apple như: Adaptive EQ, Chip Apple H1,&nbsp;Spatial Audio&nbsp;giúp tai nghe tự động hiệu chỉnh và tối ưu âm thanh phát ra đem đến trải nghiệm tuyệt vời cho người dùng.</p><p>• <a href="https://www.thegioididong.com/tai-nghe-bluetooth">Tai nghe Bluetooth</a> cho đường truyền kết nối ổn định, nhanh chóng trong phạm vi khá rộng.</p><p>• Hỗ trợ mic đàm thoại tiện dụng, thu âm thanh rõ ràng, chi tiết.</p><p>• Trang bị chuẩn <a href="https://www.thegioididong.com/tai-nghe-chong-nuoc">chống nước IPX4</a> cho phép bạn thoải mái sử dụng trong các hoạt động thể thao thường ngày mà không cần lo ngại vấn đề bám dính mồ hôi.</p><p>• Dễ dàng kết nối với nhiều thiết bị nhờ khả năng tương thích với hệ điều hành Android, iOS, macOS, iPadOS. Dùng được cho các sản phẩm như:&nbsp;<a href="https://www.thegioididong.com/dtdd-apple-iphone-15-series">iPhone 15</a>,&nbsp;<a href="https://www.thegioididong.com/dtdd/iphone-15-plus">iPhone 15 Plus</a>,&nbsp;<a href="https://www.thegioididong.com/dtdd/iphone-15-pro">iPhone 15 Pro</a>,&nbsp;<a href="https://www.thegioididong.com/dtdd/iphone-15-pro-max">iPhone 15 Pro Max</a>, <a href="https://www.thegioididong.com/dong-ho-thong-minh-apple-watch-ultra-2">Apple Watch Ultra 2</a>, <a href="https://www.thegioididong.com/dong-ho-thong-minh-apple-watch-series-9">Apple Watch Series 9</a>,...</p><p>• Có thể sử dụng liên tục trong khoảng 6 giờ và kéo dài lên đến 30 giờ nếu dùng chung với hộp sạc.</p><p><strong>•&nbsp;Lưu ý: Thanh toán trước khi mở seal.</strong></p>', 1, 58)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (10, 4, N'Tai nghe Bluetooth True Wireless AVA Plus Buds Life Rider GT0', 390000, CAST(N'2023-12-02T16:31:40.350' AS DateTime), N'<h3><a href="https://www.thegioididong.com/tai-nghe/tai-nghe-bluetooth-true-wireless-ava-buds-life-rider-gt07">Tai nghe Bluetooth True Wireless AVA+ Buds Life Rider GT07</a> sở hữu thiết kế gọn nhẹ, kết nối không dây nhanh chóng, âm thanh rõ ràng và chi tiết, dung lượng pin lớn cộng thêm sự hỗ trợ từ hộp sạc, mang đến cho bạn những trải nghiệm tốt nhất.</h3><p>•&nbsp;Diện mạo <a href="https://www.thegioididong.com/tai-nghe">tai nghe</a> đẹp mắt, thiết kế mạnh mẽ, phù hợp với nhiều phong cách người dùng.</p><p>•&nbsp;Không cần dây đeo rườm rà cắm vào điện thoại mỗi khi sử dụng, tai nghe AVA+ kết nối với thiết bị âm thanh mượt mà và ổn định nhờ Bluetooth 5.3.</p><p>•&nbsp;Trang bị tiện ích với micro đàm thoại cho phép cuộc gọi của bạn chi tiết và rõ ràng hơn.</p><p>•&nbsp;Tai nghe tương thích với các thiết bị điện tử phổ biến hiện nay như: ​​macOS, Android, iOS, Windows.</p><p>•&nbsp;Âm thanh <a href="https://www.thegioididong.com/tai-nghe-ava">tai nghe AVA+</a> sống động, âm trầm sâu mang đến cho bạn những trải nghiệm âm thanh tuyệt vời.</p><p>•&nbsp;Chế độ Game Mode cho phép bạn tận hưởng những trận game tuyệt vời với độ trễ được tối ưu hết mức có thể.</p><p>•&nbsp;Chỉ cần sạc tai nghe 1.5 giờ sử dụng được từ 3 đến 5 giờ (thời lượng thực tế tùy mức âm lượng).</p>', 1, 58)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (11, 4, N'Tai nghe Bluetooth True Wireless HAVIT TW945', 315000, CAST(N'2023-12-02T16:37:35.237' AS DateTime), N'<h3><a href="https://www.thegioididong.com/tai-nghe/tai-nghe-bluetooth-true-wireless-havit-tw945">Tai nghe Bluetooth True Wireless HAVIT TW945</a>&nbsp;mang đến thiết kế sang trọng với kiểu dáng tối giản và màu sắc đa dạng, âm thanh đầy đủ và rõ ràng, tích hợp nhiều tính năng và tiện ích khác, phục vụ tốt nhu cầu sử dụng cơ bản hàng ngày của đa số người dùng.</h3><p>•&nbsp;Thiết kế&nbsp;trong suốt trẻ trung và đột phá, trang bị nhiều gam màu thời thượng cho bạn dễ dàng lựa chọn.</p><p>•&nbsp;Khối lượng gọn nhẹ và kích thước vừa vặn, giúp bạn đeo&nbsp;<a href="https://www.thegioididong.com/tai-nghe">tai nghe</a>&nbsp;êm ái và nhẹ nhàng cả ngày dài.</p><p>• Âm thanh&nbsp;sắc nét và sống động, mang đến trải nghiệm nghe nhạc ấn tượng.</p><p>•&nbsp;Người dùng có thể lắng nghe âm thanh độc lập từ mỗi chiếc tai nghe riêng lẻ bằng cách chỉ lấy 1 bên tai ra khỏi hộp sạc.</p><p>•&nbsp;Kết nối ổn định và nhanh chóng nhờ Bluetooth 5.3, đường truyền ổn định trong phạm vi 10 m, nghe nhạc liền mạch.</p><p>•&nbsp;<a href="https://www.thegioididong.com/tai-nghe-havit">Tai nghe HAVIT</a>&nbsp;tích hợp chế độ Game Mode cho độ trễ thấp chỉ 0.05 giây, tối ưu trải nghiệm chơi game, xem phim,...</p>', 1, 58)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (12, 4, N'Điện thoại realme C53', 3890000, CAST(N'2023-12-02T16:40:46.193' AS DateTime), N'<h3><a href="https://www.thegioididong.com/dtdd/realme-c53">realme C53</a> - chiếc điện thoại giá rẻ với thiết kế đẹp, màn hình lớn và camera sắc nét, thực sự là một lựa chọn hợp lý dành cho người dùng khi đang băn khoăn tìm mua một thiết bị trong phân khúc giá rẻ.</h3><h3>Vẻ ngoài vuông vắn trẻ trung</h3><p>realme C53 được thiết kế với sự vuông vắn và làm chủ yếu từ nhựa, mang lại cảm giác chắc chắn khi cầm nắm. Với màn hình giọt nước nhỏ gọn, chiếc <a href="https://www.thegioididong.com/dtdd-realme">điện thoại realme</a> này có thể cung cấp cho người dùng trải nghiệm màn hình rộng hơn mà vẫn giữ được kích thước nhỏ gọn và thời trang.</p><p>&nbsp;</p><p>Về thiết kế phần camera, realme C53 sở hữu cụm 3 ống kính nhưng 2 trong số đó sẽ chứa camera, cái còn lại sẽ là vị trí của đèn LED. Toàn bộ được thiết kế cân đối, hài hòa giúp tạo thêm cho máy một điểm nhấn sang trọng và thời thượng.</p><h3>Nâng cao trải nghiệm với màn hình lớn</h3><p>realme C53 sở hữu màn hình IPS LCD kích thước 6.74 inch, đem đến một không gian hiển thị rộng lớn cho người dùng. Độ phân giải HD+ cho hình ảnh rõ nét và màu sắc sống động. Với tần số làm mới 90 Hz người dùng có thể trải nghiệm mượt mà và nhạy bén hơn khi cuộn trang và chơi game.&nbsp;</p><p>&nbsp;</p><p>Với ưu điểm của tấm nền IPS LCD, realme C53 cho ra nội dung có màu sắc tương đối rực rỡ, góc nhìn rộng cùng khả năng tái hiện hình ảnh có độ sáng cao. Độ sáng của máy lên tới 560 nits tuy không quá cao nhưng vẫn giúp người dùng dễ dàng xem được thông tin trên điện thoại khi ở ngoài trời mỗi khi xem bản đồ để di chuyển hay căn chỉnh khung hình trong lúc chụp ảnh.</p><h3>Tích hợp camera độ phân giải 50 MP</h3><p>realme C53 được trang bị hai camera sau độ phân giải cao, gồm một camera chính 50 MP và một camera phụ 0.08 MP, cho phép người dùng chụp ảnh sắc nét và chi tiết. Camera trước có độ phân giải 8 MP giúp người dùng có những bức selfie đẹp và tự tin đăng trên mạng xã hội.</p><p>&nbsp;</p><p>Ngoài ra, hãng còn trang bị thêm một vài tính năng chụp hữu ích như: Siêu độ phân giải, chuyên nghiệp, xóa phông, chụp đêm, HDR,... điều này giúp người dùng dễ dàng thu lại trọn vẹn vẻ đẹp của khung cảnh trước mắt, làm đa dạng góc chụp hơn thông qua các tính năng cực kỳ thú vị.</p><h3>Hiệu năng đủ dùng cho các tác vụ cơ bản</h3><p><a href="https://www.thegioididong.com/dtdd">Điện thoại</a> này sử dụng hệ điều hành Android 13, kết hợp với chip Unisoc T612, RAM 6 GB và bộ nhớ trong 128 GB, giúp realme C53 có hiệu năng mượt mà và đáp ứng tốt nhu cầu sử dụng hằng ngày của người dùng. Người dùng có thể thực hiện nhiều tác vụ cùng lúc, chơi game mượt mà và lưu trữ nhiều dữ liệu mà không gặp trở ngại.</p><p>&nbsp;</p><p>Tuy không phải là một con chip quá nổi bật trong phân khúc, thế nhưng bù lại với mức giá bán rẻ cùng nhiều điểm nâng cấp vượt trội khác như màn hình, camera, thiết kế thì realme C53 vẫn là một sự lựa chọn rất đáng quan tâm.</p><h3>Pin lớn đủ dùng cho cả ngày dài</h3><p>Với pin dung lượng 5000 mAh, realme C53 cung cấp thời lượng sử dụng lâu dài và đáng tin cậy. Ngoài pin ra thì đây cũng là một chiếc <a href="https://www.thegioididong.com/dtdd-sac-pin-nhanh">điện thoại sạc nhanh</a> với công suất sạc 33 W giúp người dùng tiết kiệm thời gian chờ đợi và nhanh chóng sạc lại điện thoại để sử dụng.</p><p>&nbsp;</p><p>realme C53 là một lựa chọn hấp dẫn trong phân khúc giá rẻ, với những ưu điểm nổi bật như thiết kế đẹp, màn hình lớn và camera chụp ảnh sắc nét. Hiệu năng của chiếc <a href="https://www.thegioididong.com/dtdd?g=android">điện thoại Android</a> này cũng đủ để đáp ứng các nhu cầu sử dụng hằng ngày của người dùng. Với realme C53, người dùng có thể trải nghiệm các tính năng và công nghệ hiện đại với mức giá phải chăng.</p>', 1, 8)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (13, 4, N'Máy tính bảng Samsung Galaxy Tab A9 4G', 4990000, CAST(N'2023-12-02T16:46:25.977' AS DateTime), N'<h3>Samsung đã cho ra mắt mẫu máy tính bảng mang tên&nbsp;<a href="https://www.thegioididong.com/may-tinh-bang/samsung-galaxy-tab-a9-4g">Samsung Galaxy Tab A9 4G</a>, đặc điểm nổi bật của máy bao gồm cấu hình ổn trong tầm giá, màn hình lớn và viên pin 5100 mAh tích hợp bên trong. Điều này cải thiện hiệu suất làm việc mà vẫn giữ tính di động tối ưu.</h3><h3>Thiết kế phẳng, hiện đại</h3><p>Khi nhìn vào chiếc Galaxy Tab A9 4G, một điều đầu tiên mà người dùng có thể cảm nhận là sự thanh lịch và tinh tế. Được lấy cảm hứng từ phong cách thiết kế phẳng, màn hình và mặt lưng của sản phẩm hoàn hảo tương tự với nhau, tạo ra một sự đồng nhất và hiện đại.&nbsp;</p><p>Mặt lưng của Galaxy Tab A9&nbsp;4G&nbsp;được làm bằng chất liệu kim loại, tạo nên một ngoại hình đẳng cấp và sang trọng. Chất liệu này không chỉ thể hiện tính cứng cáp, mà còn giúp tản nhiệt hiệu quả, đảm bảo rằng thiết bị luôn hoạt động ổn định và mát mẻ trong suốt quá trình sử dụng.</p><p>&nbsp;</p><p>Điều đặc biệt là&nbsp;chiếc&nbsp;<a href="https://www.thegioididong.com/may-tinh-bang-samsung">máy tính bảng Samsung</a>&nbsp;này&nbsp;được thiết kế nguyên khối, từ mặt lưng đến bộ khung. Điều này không chỉ tăng tính đồng nhất mà còn giúp tăng cường độ cứng và độ bền của thiết bị. Bạn có thể cảm nhận được sự cẩn trọng trong quá trình sản xuất khi cả mặt trước và mặt lưng đều hài hòa và liền mạch, tạo nên một sản phẩm thực sự đẹp và hiệu suất.</p><h3>Màn hình lớn cùng công nghệ tiết kiệm điện năng</h3><p>Màn hình của chiếc Galaxy Tab A9&nbsp;4G&nbsp;là một điểm sáng trong thiết kế của sản phẩm. Sử dụng công nghệ màn hình TFT LCD là một lựa chọn thông minh, giúp tiết kiệm giá thành mà vẫn mang đến trải nghiệm hấp dẫn.&nbsp;</p><p>Công nghệ TFT LCD cho phép màn hình hiển thị hình ảnh rõ ràng và tương phản tốt, tạo điều kiện thuận lợi cho việc xem phim, đọc sách điện tử và thực hiện các tác vụ hằng ngày. Màn hình với công nghệ này cũng tiết kiệm năng lượng, giúp kéo dài thời gian sử dụng của thiết bị.</p><p>Một trong những ấn tượng lớn về&nbsp;<a href="https://www.thegioididong.com/may-tinh-bang">máy tính bảng</a>&nbsp;chính là kích thước lớn của màn hình đến 8.7 inch. Màn hình rộng rãi này tạo ra một không gian thoải mái và mở rộng, đặc biệt là khi bạn xem phim hoặc duyệt web.&nbsp;</p><p>&nbsp;</p><p>Đây là một điểm mạnh quan trọng, cho phép người dùng tận hưởng trải nghiệm đắm chìm và tận dụng tối đa không gian hiển thị trên màn hình để tương tác với các ứng dụng một cách dễ dàng.&nbsp;</p><p>Màn hình của Galaxy Tab A9&nbsp;4G&nbsp;có độ phân giải cao với 800 x 1340 pixels. Điều này đảm bảo rằng hình ảnh trên màn hình được hiển thị rõ ràng. Bất kể bạn đang xem ảnh, video hoặc duyệt web, mọi chi tiết trên màn hình đều xuất hiện một cách chân thực và sống động.&nbsp;</p><h3>Hỗ trợ quay chụp rõ nét</h3><p>Camera sau của Galaxy Tab A9&nbsp;4G&nbsp;có độ phân giải 8 MP, cho phép người dùng chụp ảnh với chi tiết tốt và màu sắc khá tươi tắn. Dù bạn là một người yêu thích nhiếp ảnh hay muốn lưu giữ những khoảnh khắc đặc biệt, camera này cũng sẽ đáp ứng tốt cho bạn ở mức cơ bản.&nbsp;</p><p>Camera trên tablet phù hợp để chụp các cảnh đẹp thường ngày xung quanh bạn hay những tài liệu phục vụ cho công việc hoặc học tập. Đặc biệt ở trong môi trường có nhiều ánh sáng, camera hứa hẹn mang đến những bức ảnh sắc nét và rõ ràng.</p><p>Camera trước với độ phân giải 2 MP cũng là một điểm cần thiết cho việc ghi lại những bức ảnh tự sướng và cuộc gọi video. Ở mức phân giải này cũng chỉ đủ tạo ra những cuộc trò chuyện video rõ ràng và dễ nhìn, cho phép bạn kết nối với bạn bè và người thân một cách tiện ích.&nbsp;</p><p>&nbsp;</p><p>Với khả năng quay video Full HD của camera sau, bạn có thể lưu giữ những khoảnh khắc đáng nhớ một cách đơn giản. Dù đó là những bữa tiệc gia đình, buổi biểu diễn của con cái hoặc cảnh đẹp trong thiên nhiên, Galaxy Tab A9&nbsp;4G&nbsp;sẽ giúp bạn ghi lại mọi chi tiết với độ phân giải tốt.</p><h3>Sử dụng chipset nhà MediaTek</h3><p>Galaxy Tab A9&nbsp;4G&nbsp;là một sản phẩm đầy ấn tượng, không chỉ bởi thiết kế ngoại hình mà còn bởi hiệu năng mạnh mẽ của nó. Được trang bị chip Helio G99, thiết bị này thực hiện các tác vụ cơ bản một cách nhanh chóng và hiệu quả. Dù bạn đang duyệt web, xem video hoặc sử dụng ứng dụng hằng ngày, Galaxy Tab A9 4G luôn đáp ứng nhanh chóng, đem lại trải nghiệm mượt mà và không gây gián đoạn.</p><p>&nbsp;</p><p>Là mẫu&nbsp;<a href="https://www.thegioididong.com/may-tinh-bang-ram-4gb">máy tính bảng RAM 4 GB</a>, thiết bị có đủ khả năng để đa nhiệm cho các ứng dụng nhẹ mà không gặp tình trạng giật hoặc chậm. Kể cả khi bạn vừa mở email, trình duyệt, đến các ứng dụng xã hội, Galaxy Tab A9&nbsp;4G&nbsp;luôn đảm bảo có thể chuyển đổi giữa chúng một cách dễ dàng, không bao giờ phải chờ đợi quá lâu do bất kỳ gián đoạn nào.</p><p>Ngoài ra, với bộ nhớ lưu trữ 64 GB, người dùng cũng không cần lo lắng về việc lưu trữ dữ liệu và tệp tin quá nhiều. Tuy nhiên, nếu cần thêm không gian, bạn cũng có thể mở rộng thêm 1 TB thông qua thẻ Micro SD. Điều này đồng nghĩa với việc máy có thể lưu trữ hàng trăm video, ngàn bức ảnh và hàng ngàn tệp tin mà không phải lo lắng về không gian bộ nhớ.</p><h3>Tích hợp pin lớn 5100 mAh</h3><p>Pin là một yếu tố quan trọng khi xem xét hiệu suất của bất kỳ thiết bị di động nào và Galaxy Tab A9&nbsp;4G&nbsp;không phải là ngoại lệ. Với viên pin có dung lượng lớn 5100 mAh, thiết bị này cung cấp sự ổn định và đáng tin cậy trong suốt cả ngày.</p><p>Dung lượng pin 5100 mAh trên Galaxy Tab A9&nbsp;4G&nbsp;vừa đủ cho một ngày sử dụng với các tác vụ cơ bản. Người dùng có thể duyệt web, xem video, trò chuyện video và thậm chí làm việc soạn thảo mà không cần lo lắng về việc pin sẽ sớm cạn kiệt. Điều này làm thiết bị trở nên lý tưởng cho công việc hằng ngày, giúp người dùng tiếp tục hoạt động mà không phải suy nghĩ về việc cần sạc pin liên tục.</p><p>&nbsp;</p><p>Tuy nhiên, có một điểm khá tiếc khi nói về việc sạc pin. Galaxy Tab A9&nbsp;4G&nbsp;chỉ hỗ trợ công suất sạc 15 W, điều này có nghĩa là việc sạc đầy viên pin 5100 mAh có thể mất một thời gian khá dài. Điều này có thể làm cho việc sạc trở nên hơi chậm chạp, đặc biệt khi bạn cần sạc nhanh để tiếp tục sử dụng.</p><p>Tổng cộng, Samsung Galaxy Tab A9 4G mang lại một sự lựa chọn tốt, với mức giá hợp lý mà vẫn cung cấp đầy đủ tính năng của dòng sản phẩm Galaxy Tab. Nếu bạn đang tìm kiếm một máy tính bảng mạnh mẽ và linh hoạt có thể mang theo mọi nơi, thì Galaxy Tab A9 4G là một sự lựa chọn đáng xem xét.</p>', 1, 9)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (14, 4, N'Máy tính bảng Xiaomi Redmi Pad SE 4GB', 4490000, CAST(N'2023-12-02T16:49:32.163' AS DateTime), N'<h3><a href="https://www.thegioididong.com/may-tinh-bang/xiaomi-redmi-pad-se-4gb">Xiaomi Redmi Pad SE 4GB</a>&nbsp;mẫu máy tính bảng tầm trung được Xiaomi ra mắt tại thị trường Việt Nam vào tháng 09/2023. Máy ấn tượng với màn hình lớn, cấu hình khủng cùng viên pin có dung lượng 8000 mAh giúp đảm bảo mọi trải nghiệm được liền mạch và ổn định.</h3><h3>Thiết kế vuông vắn thanh lịch</h3><p>Máy tính bảng Xiaomi Redmi Pad SE được thiết kế với sự hiện đại và tinh tế theo kiểu vuông vắn bắt trend. Sự kết hợp hoàn hảo giữa mặt lưng và bộ khung làm phẳng không chỉ tạo nên một cái nhìn hiện đại mà còn mang lại cảm giác sang trọng, đầy vẻ thanh lịch.</p><p>Với việc sử dụng chất liệu kim loại chất lượng cao và thiết kế nguyên khối, máy tính bảng này không chỉ đẹp mắt mà còn đảm bảo độ bền và độ chắc chắn đáng tin cậy.</p><p>Mặt lưng của máy tính bảng này được thiết kế theo kiểu nhám, tạo điểm nhấn cho thiết kế tổng thể. Điều này không chỉ mang lại một vẻ đẹp độc đáo mà còn giúp máy tính bảng dễ dàng cầm nắm và chống trơn trượt hay hạn chế bám dấu vân tay.</p><p>&nbsp;</p><p>Xiaomi Redmi Pad SE có khối lượng khoảng 478 gram, mang lại một sự cân bằng lý tưởng giữa khả năng di động và trải nghiệm sử dụng. Khối lượng này cho phép bạn dễ dàng cầm nắm máy trong thời gian dài mà không gặp mệt mỏi. Bạn có thể sử dụng máy bất kỳ nơi đâu mà không lo lắng về khối lượng quá nặng.</p><p>Xiaomi Redmi Pad SE là một máy tính bảng vượt trội trong việc trải nghiệm âm thanh. Với bốn loa tích hợp, máy tính bảng này mang lại âm thanh mạnh mẽ và rõ ràng. Đặc biệt, công nghệ âm thanh Dolby Atmos và Hi-Res Audio được tích hợp giúp bạn thưởng thức âm nhạc hay xem phim một cách chân thực đầy sống động.</p><h3>Trang bị màn hình IPS LCD kích thước lớn</h3><p>Màn hình của Xiaomi Redmi Pad SE sử dụng tấm nền IPS LCD, một công nghệ hiển thị có chất lượng và thường thấy trong phân khúc tầm trung, đảm bảo rằng mọi góc độ xem đều có hình ảnh chất lượng ổn và màu sắc tươi sáng, rõ ràng. Điều này cho phép bạn thưởng thức nội dung với sự sắc nét và trung thực tối ưu, dù bạn đang xem ảnh, video hay làm các công việc về nội dung đa phương tiện.</p><p>Với độ phân giải 1200 x 1920 pixels, màn hình của Xiaomi Redmi Pad SE mang đến một cấp độ chi tiết tuyệt vời. Tất cả các pixel trên màn hình hoạt động cùng nhau để tạo ra hình ảnh sắc nét, sáng rõ và độ chính xác màu sắc cao, giúp bạn trải nghiệm nội dung với chất lượng hình ảnh vượt trội.</p><p>&nbsp;</p><p>Tần số quét 90 Hz là một tính năng đặc biệt trên màn hình này. Điều này có nghĩa là màn hình cập nhật hình ảnh 90 lần mỗi giây, tạo ra một trải nghiệm mượt mà và đáp ứng nhanh chóng. Đặc biệt, đối với các trò chơi và ứng dụng đòi hỏi sự mượt mà, tần số quét cao này sẽ làm tăng sự thích thú trong lúc trải nghiệm của người dùng lên một tầm cao mới.</p><p>Xiaomi Redmi Pad SE cũng được chứng nhận bởi TUV Rheinland cho khả năng giảm ánh sáng xanh, giúp bảo vệ sức khỏe của mắt. Ánh sáng xanh có thể gây mệt mỏi và gây hại cho thị lực nếu tiếp xúc lâu dài, và chứng nhận này đảm bảo rằng màn hình này sẽ là một sự lựa chọn lý tưởng dành cho những bạn đang có nhu cầu sử dụng tablet liên tục trong thời gian dài.</p><p>&nbsp;</p><p>Màn hình rộng 11 inch&nbsp;không chỉ là một điểm nổi bật của <a href="https://www.thegioididong.com/may-tinh-bang">máy tính bảng</a>&nbsp;này, mà còn mang lại nhiều lợi ích quan trọng, đặc biệt là đối với các nhà thiết kế chuyên về vẽ và sáng tạo.</p><p>Kích thước màn hình lớn tạo ra một không gian hiển thị rộng lớn, giúp bạn có thêm không gian để làm việc và sáng tạo. Đây là yếu tố quan trọng cho các nghệ sĩ, nhà thiết kế đồ họa và người sáng tạo hình ảnh, cho phép hiển thị nhiều chi tiết hơn và tạo ra các bản phác thảo một cách dễ dàng.</p><h3>Camera quay chụp sắc nét và quay phim Full HD</h3><p>Camera sau với độ phân giải 8 MP trên Xiaomi Redmi Pad SE cho phép bạn chụp ảnh với sự sắc nét và chi tiết khá tốt đặc biệt là trong điều kiện ánh sáng tốt. Bạn có thể bắt kịp những khoảnh khắc đáng nhớ và chia sẻ với bạn bè và gia đình. Khả năng quay video Full HD cũng giúp bạn ghi lại những khoảnh khắc đồng đội một cách rõ ràng và sắc nét.</p><p>Với camera trước 5 MP, bạn có thể tự tin thực hiện các bức ảnh selfie chất lượng cao. Nó cũng là một công cụ tuyệt vời cho các cuộc gọi video sắc nét, cho phép bạn kết nối với người thân và bạn bè với hình ảnh rõ ràng.&nbsp;</p><p>&nbsp;</p><h3>Hiệu năng ổn cho các vụ thông thường</h3><p>Chiếc&nbsp;<a href="https://www.thegioididong.com/may-tinh-bang-xiaomi">máy tính bảng Xiaomi</a>&nbsp;này được trang bị bộ xử lý Snapdragon 680 8 nhân, một sự kết hợp hoàn hảo giữa hiệu suất và tiết kiệm năng lượng. Với khả năng xử lý đa nhiệm mượt mà và tốc độ xử lý ổn định, máy tính bảng này sẽ giúp bạn hoàn thành các tác vụ giải trí hay công việc một cách dễ dàng mà ít khi gặp phải gián đoạn như giật lag.</p><p>&nbsp;</p><p>Là mẫu <a href="https://www.thegioididong.com/may-tinh-bang-ram-4gb">máy tính bảng RAM 4 GB</a>, Xiaomi Redmi Pad SE đảm bảo rằng bạn sẽ có đủ tài nguyên để thực hiện các tác vụ giải trí, từ chơi game đến chỉnh sửa ảnh và video. Tuy nhiên hiện tượng giật hay lag vẫn sẽ xuất hiện nếu mở nhiều ứng dụng cùng lúc, vì thế để đảm bảo trải nghiệm được thoải mái bạn nên tắt các ứng dụng không cần thiết để đảm bảo tablet hoạt động với hiệu suất tốt nhất.</p><h3>Trang bị pin lớn 8000 mAh</h3><p>Một điểm đáng chú ý không thể bỏ qua trên Xiaomi Redmi Pad SE chính là dung lượng pin vô cùng ấn tượng lên tới 8000 mAh. Sự mạnh mẽ của viên pin này giúp bạn thỏa sức sử dụng máy tính bảng mà không cần lo lắng về việc sạc pin liên tục.&nbsp;</p><p>Thậm chí với những nhiệm vụ đòi hỏi sự tiêu thụ năng lượng lớn như xem phim, lướt web hoặc làm việc trực tuyến, máy tính bảng này có thể đảm bảo cho bạn một thời gian sử dụng đáng kinh ngạc, kéo dài cả ngày mà không cần phải tìm kiếm nguồn điện sạc.</p><p>&nbsp;</p><p>Mặc dù dung lượng pin lớn thế nhưng chiếc <a href="https://www.thegioididong.com/may-tinh-bang-pin-khung">máy tính bảng pin khủng</a>&nbsp;này cũng chỉ được trang bị khả năng với công suất 10 W. Điều này có nghĩa là bạn có thể sẽ mất khá nhiều thời gian để có thể lấp đầy viên pin trên chiếc máy này, vì thế sạc vào buổi đêm có lẽ là lựa chọn hợp lý nhất khi nó giúp người dùng không tốn quá nhiều thời gian chờ đợi.</p><p>Xiaomi Redmi Pad SE với màn hình rộng và pin dung lượng cao là sự lựa chọn đỉnh cao cho cả công việc và giải trí. Màn hình sắc nét và lớn giúp tận hưởng hình ảnh tuyệt vời, trong khi pin khủng 8000 mAh đảm bảo sử dụng liên tục mà không cần lo lắng về việc sạc pin. Đây thực sự là một máy tính bảng xuất sắc cho những ai đang tìm mua một thiết bị có giá thành hợp lý nhưng vẫn đảm bảo trải nghiệm tốt.</p>', 1, 9)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (15, 4, N'Máy tính bảng iPad Air 5 M1 WiFi Cellular 64GB ', 17990000, CAST(N'2023-12-02T16:51:59.953' AS DateTime), N'<h3>So với chiếc iPad Air 5 M1 WiFi 64GB thì chiếc&nbsp;<a href="https://www.thegioididong.com/may-tinh-bang/ipad-air-5-m1-wifi-cellular-64gb">iPad Air 5 M1 WiFi Cellular 64GB</a> đã có một điểm khác biệt đáng kể đó là phương thức kết nối khi bạn vừa có thể sử dụng Wifi và mạng di động một cách bình thường nhưng vẫn cho một trải nghiệm rất tuyệt vời.</h3><h3>Màn hình to, xem phim, làm việc đã hơn</h3><p><a href="https://www.thegioididong.com/may-tinh-bang">Máy tính bảng</a> được trang bị một màn hình lớn lên đến 10.9 inch vừa đủ không quá to nhưng cũng không nhỏ cho bạn dễ dàng trải nghiệm, sử dụng. Đi kèm với đó chiếc màn hình&nbsp;Retina IPS LCD&nbsp;này sẽ mang lại cho bạn những trải nghiệm về màu sắc tốt hơn.</p><p>&nbsp;</p><h3>Thiết kế thời thượng</h3><p>Thiết kế gọn nhẹ và được <a href="https://www.thegioididong.com/may-tinh-bang-apple-ipad">Apple</a> làm vuông vức ở các cạnh mang lại cảm giác sang trọng, đẳng cấp, nhiều người dùng rất thích điều này. Màu sắc đa dạng cũng sẽ giúp bạn có nhiều sự lựa chọn phù hợp để sử dụng hơn.</p><p>&nbsp;</p><h3>Hiệu năng mạnh mẽ</h3><p>Được cung cấp sức mạnh từ con chip Apple M1 và <a href="https://www.thegioididong.com/may-tinh-bang-ram-8gb">RAM 8 GB</a> nên chiếc&nbsp;iPad Air 5 M1 WiFi Cellular này sẽ có một sức mạnh vô cùng kinh khủng. Nó mạnh hơn thế hệ tiền nhiệm lên đến 60% hứa hẹn sẽ cho bạn một khả năng xử lý, làm việc siêu tốc.</p><p>&nbsp;</p><p>Nhờ được chạy trên phiên bản phần mềm iPadOS 15 sẽ có rất nhiều tính năng hay cho bạn cũng như tối ưu hiệu suất máy. Có cả khả năng kết nối với bút Apple Pencil, Magic Keyboard,... với độ trễ cực thấp.</p><p>Quá nhiều thứ hay ho cho một chiếc iPad Air 5 sẽ mang lại bạn những trải nghiệm mới nhất, mạnh mẽ và thoải mái nhất kể cả khi làm việc hay giải trí.</p><p><br>&nbsp;</p>', 1, 9)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (16, 4, N'Máy tính bảng Masstel Tab 10S', 2890000, CAST(N'2023-12-02T16:55:13.537' AS DateTime), N'<h3>Masstel Tab 10S là chiếc <a href="https://www.thegioididong.com/may-tinh-bang">máy tính bảng</a> thuộc phân khúc giá rẻ của <a href="https://www.thegioididong.com/may-tinh-bang-masstel">tablet&nbsp;Masstel</a>&nbsp;đang được rất nhiều bạn trẻ "lăng xê", bởi em nó không chỉ rẻ, màn hình rộng, cấu hình khỏe mà thời lượng pin cũng đủ lâu để bạn trải nghiệm giải trí đa dạng.&nbsp;</h3><h3>Tầm nhìn rộng với màn hình&nbsp;10.1 inch</h3><p>Khung viền dày màu đen của <a href="https://www.thegioididong.com/may-tinh-bang/masstel-tab-10s">máy tính bảng Masstel Tab 10S</a> cho cảm giác màn hình có vẻ thô, nhỏ nhưng thực tế khi cầm trên tay bạn sẽ thấy màn hình của chiếc tablet này chẳng nhỏ chút nào, trải nghiệm xem cũng rất thoải mái bởi kích cỡ màn hình đạt 10.1 inch, chiếc camera trước cũng nằm trong khung viền nên toàn bộ màn hình hiển thị nội dung liền mạch, cho bạn dễ dàng quan sát từ các góc nhìn khác nhau.</p><p>&nbsp;</p><p>Hỗ trợ công nghệ màn hình&nbsp;IPS LCD cung cấp độ sáng, độ tương phản khá, độ phân giải&nbsp;800 x 1280 Pixels cho tài liệu, hình ảnh xuất hiện rõ ràng, chi tiết, màu sắc chân thật, nâng cao hiệu suất làm việc và giải trí cho mọi đối tượng người dùng.</p><h3>Cấu hình ổn định</h3><p>Hệ điều hành&nbsp;Android 11 có giao diện tùy biến, tăng cường bảo mật và đảm bảo sự riêng tư cho người dùng, cập nhật nhiều tính năng tiện ích như bong bóng chat cho 1 số ứng dụng, có sẵn tính năng quay phim màn hình, bật trợ lý giọng nói Google cho bạn tìm đường, đặt lịch hẹn nhanh,...</p><p>&nbsp;</p><p>Đảm bảo các hoạt động đa nhiệm mượt mà với bộ xử lý&nbsp;Unisoc T310 4 nhân, tốc độ CPU&nbsp;2 GHz, <a href="https://www.thegioididong.com/may-tinh-bang-ram-3gb">máy tính bảng có&nbsp;RAM 3 GB</a>, ROM 32 GB cho bạn xử lý được mọi tác vụ hằng ngày như đọc báo, xem phim, nghe nhạc, kiểm tra email,... Đặc biệt, tải các ứng dụng mà bạn quan tâm thoải mái với khả năng hỗ trợ sử dụng với thẻ nhớ&nbsp;Micro SD, mở rộng không gian lưu trữ lên đến 128 GB.</p><p>&nbsp;</p><h3>Cụm camera đủ dùng trên một chiếc tablet</h3><p>Trang bị 1 camera sau có độ phân giải 5 MP và hỗ trợ nhiều chế độ chụp như chạm lấy nét, HDR, toàn cảnh panorama, làm đẹp,... quay được video chuẩn HD,&nbsp;tua nhanh thời gian (Time‑lapse) cho bạn dễ dàng ghi lại những khoảnh khắc đáng nhớ trong cuộc sống.</p><p>&nbsp;</p><p>Bên cạnh camera sau,&nbsp;Tab 10S còn có 1 camera trước cảm biến 2 MP phù hợp sử dụng để gọi video call, học online, nó được tích hợp chức năng HDR và làm đẹp biến những bức hình selfie của bạn trông xinh đẹp, rõ nét hơn.</p><h3>Thiết kế sang trọng, tinh tế</h3><p>Kiểu dáng hiện đại, 2 phiên bản màu xanh Navy và đen thời trang, trẻ trung, thiết kế các góc máy bo cong duyên dáng tạo vẻ ngoài hoàn thiện, cao cấp. Làm từ chất liệu nhựa nguyên khối cho độ bền cao, giảm khối lượng tối ưu nên với chiều dài 245 mm, ngang 165.4 mm, dày 9.3 mm, em nó có khối lượng khoảng 540 gram cho cảm giác đầm tay và tin cậy khi cầm nắm, di chuyển.&nbsp;</p><p>&nbsp;</p><p>Mặt lưng chế tác đơn giản, có 1 chiếc camera, đèn LED Flash nằm gọn ở 1 góc máy, logo thương hiệu ở vị trí chính giữa, hơi thụt xuống 1 cạnh viền ngang trông rất rõ nét và bắt mắt.&nbsp;</p><p>&nbsp;</p><h3>Thời gian sử dụng bền bỉ</h3><p>Với 1 dòng máy tính bảng&nbsp;giá mềm như&nbsp;Tab 10S thì mức dung lượng pin&nbsp;6000 mAh là rất đáng gờm, hơn nữa kết hợp công nghệ tiết kiệm pin, cục pin&nbsp;Li-Po giúp hạn chế rò rỉ năng lượng, tiêu hao năng lượng nhờ đó kéo dài thời gian sử dụng, cho bạn liên tục trải nghiệm đến cả ngày dài.</p><p>&nbsp;</p><p>Mặt khác, điểm nổi bật nhất về khả năng sạc của em nó chính là thiết kế cổng sạc Type-C xu hướng hiện nay, cho bạn tích hợp dây sạc thuận tiện. Ngoài ra, máy tính bảng hỗ trợ mức sạc tối đa 6 W, để không mất nhiều thời gian chờ đợi thì bạn nên cắm sạc trong thời gian ngủ hay trong thời gian nghỉ ngơi.</p><p>&nbsp;</p><p>Nếu bạn đang cần tìm 1 chiếc máy tính bảng giá rẻ để cho trẻ học online thì&nbsp;Masstel Tab 10S là một lựa chọn vô cùng tuyệt vời, với giá cả hấp dẫn, chất lượng ổn, dung lượng pin tốt, quay chụp tiện lợi, càng khám phá&nbsp;Masstel Tab 10S bạn sẽ càng thích đấy.</p>', 1, 9)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (17, 4, N'Điện thoại vivo Y36 128GB', 5690000, CAST(N'2023-12-02T16:59:07.320' AS DateTime), N'<h3><a href="https://www.thegioididong.com/dtdd/vivo-y36-128gb">vivo Y36 128GB</a> là một trong những sản phẩm điện thoại thông minh nổi bật và đáng chú ý của thương hiệu <a href="https://www.thegioididong.com/dtdd-vivo">vivo</a>. Với những tính năng và thông số kỹ thuật vượt trội, vivo Y36 hứa hẹn mang đến cho người dùng trải nghiệm di động đỉnh cao.</h3><h3>Vẻ ngoài vuông vức, hiện đại</h3><p>vivo Y36 được thiết kế nguyên khối, với khung kim loại và mặt lưng kính, tạo nên vẻ đẹp sang trọng và cao cấp. Kích thước của điện thoại là dài 164.06 mm - ngang 76.17 mm - dày 8.07 mm và nặng 202 g, mang đến cảm giác cầm nắm chắc chắn và thoải mái trong lòng bàn tay.</p><p>&nbsp;</p><p>vivo Y36 đã được cải tiến với mặt trước thiết kế nốt ruồi, vượt trội hơn so với kiểu màn hình giọt nước trước đó. Nhờ vậy, màn hình đã được tối ưu hóa, trở nên rộng rãi hơn và các cạnh viền được thu gọn một cách tinh tế, tạo cảm giác vuốt chạm tuyệt vời.</p><p>Với khả năng kháng nước và bụi theo tiêu chuẩn IP54, vivo Y36 đảm bảo <a href="https://www.thegioididong.com/dtdd">điện thoại</a> của bạn luôn bền bỉ và đồng hành cùng bạn trong mọi hoàn cảnh, bất kể là trong những chuyến du lịch, hoạt động ngoài trời hoặc những ngày mưa bất chợt.</p><h3>Nổi bật với màn hình lớn 6.64 inch</h3><p>Màn hình của chiếc <a href="https://www.thegioididong.com/dtdd-vivo-y">điện thoại vivo dòng Y</a> này được trang bị <a href="https://www.thegioididong.com/hoi-dap/man-hinh-ips-lcd-la-gi-905752">tấm nền IPS LCD</a> với độ phân giải Full HD+ (1080 x 2388 Pixels), giúp hiển thị hình ảnh và video sắc nét, chân thực. Kích thước màn hình rộng 6.64 inch, kết hợp với tần số quét 90 Hz, mang đến trải nghiệm mượt mà và ấn tượng cho người dùng.</p><p>&nbsp;</p><p>Độ sáng tối đa 650 nits giúp hiển thị rõ ràng và sắc nét dưới ánh nắng mặt trời. Màn hình cũng được bảo vệ bởi lớp <a href="https://www.thegioididong.com/hoi-dap/kinh-thuong-kinh-chong-xuoc-kinh-cuong-luc-la-gi-1173657#cuongluc">kính cường lực</a> chất lượng cao, giúp bảo vệ điện thoại trước những va đập và trầy xước không mong muốn.</p><h3>Hệ thống camera chụp ảnh ổn định</h3><p>vivo Y36 sở hữu hệ thống camera sau đa dạng với camera chính có độ phân giải lên tới 50 MP cùng với camera phụ 2 MP giúp bạn chụp ảnh sắc nét và chất lượng cao. Nhiều tính năng hấp dẫn như phơi sáng kép, chế độ chuyên nghiệp (Pro), làm đẹp, bộ lọc màu, trôi nhanh thời gian (Time Lapse), xóa phông,... giúp bạn thoải mái sáng tạo và chia sẻ những khoảnh khắc đẹp và ấn tượng.</p><p>&nbsp;</p><p>Camera trước của vivo Y36 có độ phân giải 16 MP, hỗ trợ nhiều tính năng như làm đẹp, HDR, quay video Full HD, xóa phông, live photo, phơi sáng kép, bộ lọc màu,... giúp bạn tự tin thể hiện cá tính và chia sẻ ảnh tự chụp chất lượng cao.</p><h3>Hoàn thành tốt các tác vụ với Snapdragon 680</h3><p>vivo Y36 được trang bị hệ điều hành <a href="https://www.thegioididong.com/tin-tuc/android-13-nhung-tinh-nang-noi-bat-nhat-ma-ban-can-biet-1456222">Android 13</a>, cùng với chip xử lý <a href="https://www.thegioididong.com/tin-tuc/tat-tan-tat-ve-chip-snapdragon-680-8-nhan-1471481#Snapdragon6808nhan">Snapdragon 680</a> và GPU Adreno 610, giúp điện thoại hoạt động mượt mà và nhanh chóng trong việc chạy các ứng dụng và trò chơi.</p><p>&nbsp;</p><p>Máy hỗ trợ RAM 8 GB và dung lượng lưu trữ 128 GB giúp bạn thoải mái lưu trữ dữ liệu và tận hưởng trải nghiệm đa nhiệm tuyệt vời. Ngoài ra, bạn có thể mở rộng bộ nhớ qua thẻ MicroSD lên đến 1 TB, đảm bảo bạn có đủ không gian lưu trữ cho những khoảnh khắc và thông tin quan trọng.</p><p>&nbsp;</p><p>vivo Y36 hỗ trợ mạng di động 4G, giúp bạn luôn kết nối với thế giới xung quanh một cách nhanh chóng và ổn định. Điện thoại cũng hỗ trợ hai khe cắm Nano SIM, giúp bạn linh hoạt trong việc sử dụng các dịch vụ di động.</p><p>Bảo mật nâng cao là một trong những điểm mạnh của vivo Y36, với khả năng mở khoá khuôn mặt và mở khoá vân tay cạnh viền. Hai phương thức này giúp bạn nhanh chóng và dễ dàng truy cập vào điện thoại một cách bảo mật và thuận tiện.</p><p>&nbsp;</p><h3>Viên pin 5000 mAh thoải mái dùng cả ngày</h3><p>Dung lượng pin lên tới 5000 mAh đảm bảo cho thời gian sử dụng dài lâu, hỗ trợ <a href="https://www.thegioididong.com/dtdd-sac-pin-nhanh">sạc pin nhanh</a> 44 W, với sạc được kèm theo máy. Công nghệ sạc pin nhanh và tiết kiệm pin đảm bảo vivo Y36 luôn sẵn sàng sử dụng mà không cần lo lắng về việc hết pin trong quá trình sử dụng.</p><p>Với âm thanh Hi-Res Audio một tính năng đặc biệt trên vivo Y36, mang đến trải nghiệm nghe nhạc chất lượng cao và sống động. Bạn có thể thưởng thức âm nhạc yêu thích với chất lượng âm thanh tốt nhất, từ những giai điệu dễ thương cho đến âm nhạc cổ điển hay nhạc EDM sôi động.</p><p>Tổng kết, vivo Y36 là một sản phẩm điện thoại thông minh đáng chú ý trong tầm giá của mình. Với màn hình đẹp, camera đa dạng và hiệu năng ổn định, vivo Y36 hứa hẹn mang đến cho bạn trải nghiệm di động vượt trội. Cùng với tính năng bảo mật và tiện ích đa dạng, điện thoại này thực sự là một lựa chọn đáng xem xét cho mọi người.</p>', 1, 8)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (18, 4, N'Điện thoại Xiaomi 13T 5G 8GB', 10990000, CAST(N'2023-12-02T17:02:30.653' AS DateTime), N'<h3><a href="https://www.thegioididong.com/dtdd/xiaomi-13t">Xiaomi 13T 5G</a>&nbsp;là một thiết bị độc đáo được ra mắt tại thị trường Việt Nam vào tháng 09/2023. Sản phẩm này đang thu hút sự chú ý lớn từ cộng đồng người dùng, đặc biệt là những người yêu nhiếp ảnh và đang tìm kiếm một trải nghiệm độc đáo với camera nhờ sự hợp tác với Leica, một trong những thương hiệu sản xuất máy ảnh hàng đầu.</h3><h3>Thiết kế tinh tế, sang trọng</h3><p>Mặt lưng của Xiaomi 13T có hai phiên bản cho bạn lựa chọn: da và kính. Mặt lưng da mang đến sự sang trọng và ấm áp, trong khi mặt lưng kính là một lựa chọn hiện đại và lịch lãm.&nbsp;</p><p>Dù là da hay kính, thiết kế mặt lưng của Xiaomi 13T đều theo kiểu phẳng và được bo cong nhẹ ở vùng rìa, giúp cầm nắm thoải mái hơn bao giờ hết. Sự cân nhắc trong việc bo cong rìa không chỉ tạo điểm nhấn thẩm mỹ mà còn mang lại cảm giác an toàn khi cầm nắm sản phẩm.</p><p>&nbsp;</p><p>Khung của Xiaomi 13T được làm từ chất liệu kim loại cứng cáp, cùng với đó là cách làm phẳng để tạo ra một sự kết hợp hoàn hảo với mặt lưng, giúp bảo vệ tối ưu cho các thành phần bên trong, đảm bảo Xiaomi 13T luôn hoạt động ổn định và bền bỉ với thời gian.</p><p>Với sự hợp tác đến từ Leica, một dòng chữ mang tên thương hiệu này đã được in lên trên cụm camera, điều này giúp Xiaomi 13T trở nên dễ nhận diện hơn và còn có thể tỏa sáng để bất kỳ ai nhìn vào cũng biết được đây là một chiếc <a href="https://www.thegioididong.com/dtdd-chup-anh-quay-phim">điện thoại chụp ảnh, quay phim</a> cao cấp.</p><h3>Màn hình sống động đầy sắc nét</h3><p>Màn hình trên Xiaomi 13T là một tuyệt tác của công nghệ, đem đến cho người dùng một trải nghiệm hình ảnh vượt trội. Với công nghệ màn hình AMOLED, độ phân giải 1.5K (1220 x&nbsp;2712 Pixels) và kích thước lớn 6.67 inch.</p><p>Công nghệ AMOLED không chỉ mang lại sự sống động và đẹp mắt mà còn tái hiện sắc màu với độ chính xác tuyệt đối, tạo nên những gam màu rực rỡ và tự nhiên. Từ đó mang đến những trải nghiệm xem nội dung cực kỳ đã mắt, thích hợp để xem phim chất lượng cao hay chơi những tựa game có đồ họa khủng.</p><p>&nbsp;</p><p>Màn hình Xiaomi 13T được trang bị tần số quét lên đến 144 Hz, được xem là mức cao nhất trên thị trường <a href="https://www.thegioididong.com/dtdd">điện thoại</a> kinh doanh chính hãng tại Việt Nam, giúp tạo ra một hiệu ứng mượt mà và tự nhiên trong mọi hoạt động trên màn hình. Điều này đặc biệt quan trọng khi bạn chơi game hoặc xem video chất lượng cao, giúp giảm thiểu hiện tượng bóng mờ, khựng khung hình để tạo ra trải nghiệm thú vị hơn.</p><p>Để đảm bảo rằng màn hình Xiaomi 13T luôn đẹp và bền bỉ, nó được bảo vệ bằng kính cường lực Corning Gorilla Glass 5. Đây là một trong những loại kính cường lực hàng đầu trên thị trường, giúp chống trầy xước, bảo vệ màn hình khỏi những va đập không mong muốn.&nbsp;</p><h3>Cấu hình top đầu phân khúc</h3><p>Đằng sau hiệu suất mạnh mẽ của Xiaomi 13T là bộ xử lý MediaTek Dimensity 8200-Ultra. Với tốc độ xử lý nhanh chóng và khả năng đa nhiệm xuất sắc, Dimensity 8200-Ultra đảm bảo rằng bạn có thể thực hiện mọi tác vụ một cách mượt mà và hiệu quả. Từ chơi game đầy thách thức đến xem video chất lượng cao, bạn sẽ luôn cảm nhận được sự mạnh mẽ của chip này.</p><p>Là mẫu <a href="https://www.thegioididong.com/dtdd-ram-8gb">điện thoại RAM 8 GB</a>, Xiaomi 13T sẵn sàng đối mặt với mọi nhiệm vụ bạn đặt ra. Dung lượng RAM lớn này không chỉ giúp bạn mở đồng thời nhiều ứng dụng mà còn tạo ra trải nghiệm mượt mà và không giật lag. Bất kể bạn đang xem video, duyệt web hay sử dụng ứng dụng đòi hỏi tài nguyên cao thì Xiaomi 13T luôn đảm bảo hiệu suất tối ưu.</p><p>&nbsp;</p><p>Xiaomi 13T được trang bị hệ điều hành Android 13, phiên bản mới nhất của hệ điều hành di động phổ biến tính đến 09/2023. Điều này đồng nghĩa với việc bạn sẽ có được những tính năng mới nhất, bảo mật tốt hơn và trải nghiệm người dùng được tối ưu hóa.</p><h3>Nắm bắt trọn vẹn mọi khoảnh khắc với camera 50 MP</h3><p>Xiaomi 13T trang bị hệ thống camera đa dạng với 3 ống kính chất lượng. Camera chính có độ phân giải lên tới 50 MP, đảm bảo bạn có thể bắt lấy mọi chi tiết và màu sắc trong mỗi bức ảnh. Camera tele 50 MP hỗ trợ thu phóng kỹ thuật số 20x giúp bạn khám phá thế giới tinh tế và thú vị mà không cần di chuyển gần chủ thể. Cuối cùng là camera góc siêu rộng 12 MP cho phép bạn chụp những khung hình rộng, chân thực và mở rộng góc nhìn</p><p>Không chỉ là một công cụ chụp ảnh xuất sắc, chiếc&nbsp;<a href="https://www.thegioididong.com/dtdd-xiaomi">điện thoại Xiaomi</a>&nbsp;này&nbsp;còn cho phép bạn quay video 4K với độ nét tuyệt đỉnh. Tận dụng sự mạnh mẽ của camera, bạn có thể ghi lại những khoảnh khắc đáng nhớ với độ chi tiết và độ sắc nét xuất sắc. Chất lượng video 4K sẽ mang đến cho bạn trải nghiệm xem video chất lượng cao như trong phòng chiếu phim.</p><p>&nbsp;</p><p>Xiaomi 13T đã hợp tác cùng với hãng nhiếp ảnh danh tiếng Leica để tinh chỉnh máy ảnh. Điều này đảm bảo rằng mọi bức ảnh và video bạn chụp đều được cân chỉnh với sự chuyên nghiệp và đẳng cấp của Leica. Từ việc cân chỉnh màu sắc cho đến sự tối ưu hóa của ống kính, Xiaomi 13T mang đến cho bạn một trải nghiệm nhiếp ảnh đỉnh cao mà bạn không thể tìm thấy ở bất kỳ nơi nào khác.</p><h3>Sử dụng pin lớn cùng khả năng sạc nhanh</h3><p>Một trong những điểm đáng tự hào của Xiaomi 13T chính là dung lượng pin lớn cực khủng lên đến 5000 mAh. Điều này đồng nghĩa với việc bạn có thể sử dụng điện thoại suốt cả ngày mà không cần phải lo lắng về việc hết pin. Dung lượng pin này đủ để bạn thực hiện mọi công việc, chơi game, xem video và duyệt web mà không cần phải tìm kiếm nguồn sạc liên tục.</p><p>Với công nghệ sạc nhanh 67 W, Xiaomi 13T giúp bạn tiết kiệm thời gian đáng kể trong việc sạc pin. Theo thông tin từ hãng, máy có thể sạc pin từ 0% đến 100% chỉ khoảng 42 phút một cách nhanh chóng và hiệu quả.&nbsp;</p><p>&nbsp;</p><p>Xiaomi 13T không chỉ là một công cụ hoàn hảo cho nhiếp ảnh, mà còn là một thiết bị đa năng và linh hoạt, phục vụ nhiều mục đích khác nhau. Đây là một trong những chiếc điện thoại cận flagship đáng chú ý nhất của năm 2023 nhờ hội tụ đầy đủ các thông số hàng đầu phân khúc.</p>', 1, 8)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (19, 4, N'Điện thoại Xiaomi 13T 5G 8GB', 10990000, CAST(N'2023-12-02T17:02:59.223' AS DateTime), N'<h3><a href="https://www.thegioididong.com/dtdd/xiaomi-13t">Xiaomi 13T 5G</a>&nbsp;là một thiết bị độc đáo được ra mắt tại thị trường Việt Nam vào tháng 09/2023. Sản phẩm này đang thu hút sự chú ý lớn từ cộng đồng người dùng, đặc biệt là những người yêu nhiếp ảnh và đang tìm kiếm một trải nghiệm độc đáo với camera nhờ sự hợp tác với Leica, một trong những thương hiệu sản xuất máy ảnh hàng đầu.</h3><h3>Thiết kế tinh tế, sang trọng</h3><p>Mặt lưng của Xiaomi 13T có hai phiên bản cho bạn lựa chọn: da và kính. Mặt lưng da mang đến sự sang trọng và ấm áp, trong khi mặt lưng kính là một lựa chọn hiện đại và lịch lãm.&nbsp;</p><p>Dù là da hay kính, thiết kế mặt lưng của Xiaomi 13T đều theo kiểu phẳng và được bo cong nhẹ ở vùng rìa, giúp cầm nắm thoải mái hơn bao giờ hết. Sự cân nhắc trong việc bo cong rìa không chỉ tạo điểm nhấn thẩm mỹ mà còn mang lại cảm giác an toàn khi cầm nắm sản phẩm.</p><p>&nbsp;</p><p>Khung của Xiaomi 13T được làm từ chất liệu kim loại cứng cáp, cùng với đó là cách làm phẳng để tạo ra một sự kết hợp hoàn hảo với mặt lưng, giúp bảo vệ tối ưu cho các thành phần bên trong, đảm bảo Xiaomi 13T luôn hoạt động ổn định và bền bỉ với thời gian.</p><p>Với sự hợp tác đến từ Leica, một dòng chữ mang tên thương hiệu này đã được in lên trên cụm camera, điều này giúp Xiaomi 13T trở nên dễ nhận diện hơn và còn có thể tỏa sáng để bất kỳ ai nhìn vào cũng biết được đây là một chiếc <a href="https://www.thegioididong.com/dtdd-chup-anh-quay-phim">điện thoại chụp ảnh, quay phim</a> cao cấp.</p><h3>Màn hình sống động đầy sắc nét</h3><p>Màn hình trên Xiaomi 13T là một tuyệt tác của công nghệ, đem đến cho người dùng một trải nghiệm hình ảnh vượt trội. Với công nghệ màn hình AMOLED, độ phân giải 1.5K (1220 x&nbsp;2712 Pixels) và kích thước lớn 6.67 inch.</p><p>Công nghệ AMOLED không chỉ mang lại sự sống động và đẹp mắt mà còn tái hiện sắc màu với độ chính xác tuyệt đối, tạo nên những gam màu rực rỡ và tự nhiên. Từ đó mang đến những trải nghiệm xem nội dung cực kỳ đã mắt, thích hợp để xem phim chất lượng cao hay chơi những tựa game có đồ họa khủng.</p><p>&nbsp;</p><p>Màn hình Xiaomi 13T được trang bị tần số quét lên đến 144 Hz, được xem là mức cao nhất trên thị trường <a href="https://www.thegioididong.com/dtdd">điện thoại</a> kinh doanh chính hãng tại Việt Nam, giúp tạo ra một hiệu ứng mượt mà và tự nhiên trong mọi hoạt động trên màn hình. Điều này đặc biệt quan trọng khi bạn chơi game hoặc xem video chất lượng cao, giúp giảm thiểu hiện tượng bóng mờ, khựng khung hình để tạo ra trải nghiệm thú vị hơn.</p><p>Để đảm bảo rằng màn hình Xiaomi 13T luôn đẹp và bền bỉ, nó được bảo vệ bằng kính cường lực Corning Gorilla Glass 5. Đây là một trong những loại kính cường lực hàng đầu trên thị trường, giúp chống trầy xước, bảo vệ màn hình khỏi những va đập không mong muốn.&nbsp;</p><h3>Cấu hình top đầu phân khúc</h3><p>Đằng sau hiệu suất mạnh mẽ của Xiaomi 13T là bộ xử lý MediaTek Dimensity 8200-Ultra. Với tốc độ xử lý nhanh chóng và khả năng đa nhiệm xuất sắc, Dimensity 8200-Ultra đảm bảo rằng bạn có thể thực hiện mọi tác vụ một cách mượt mà và hiệu quả. Từ chơi game đầy thách thức đến xem video chất lượng cao, bạn sẽ luôn cảm nhận được sự mạnh mẽ của chip này.</p><p>Là mẫu <a href="https://www.thegioididong.com/dtdd-ram-8gb">điện thoại RAM 8 GB</a>, Xiaomi 13T sẵn sàng đối mặt với mọi nhiệm vụ bạn đặt ra. Dung lượng RAM lớn này không chỉ giúp bạn mở đồng thời nhiều ứng dụng mà còn tạo ra trải nghiệm mượt mà và không giật lag. Bất kể bạn đang xem video, duyệt web hay sử dụng ứng dụng đòi hỏi tài nguyên cao thì Xiaomi 13T luôn đảm bảo hiệu suất tối ưu.</p><p>&nbsp;</p><p>Xiaomi 13T được trang bị hệ điều hành Android 13, phiên bản mới nhất của hệ điều hành di động phổ biến tính đến 09/2023. Điều này đồng nghĩa với việc bạn sẽ có được những tính năng mới nhất, bảo mật tốt hơn và trải nghiệm người dùng được tối ưu hóa.</p><h3>Nắm bắt trọn vẹn mọi khoảnh khắc với camera 50 MP</h3><p>Xiaomi 13T trang bị hệ thống camera đa dạng với 3 ống kính chất lượng. Camera chính có độ phân giải lên tới 50 MP, đảm bảo bạn có thể bắt lấy mọi chi tiết và màu sắc trong mỗi bức ảnh. Camera tele 50 MP hỗ trợ thu phóng kỹ thuật số 20x giúp bạn khám phá thế giới tinh tế và thú vị mà không cần di chuyển gần chủ thể. Cuối cùng là camera góc siêu rộng 12 MP cho phép bạn chụp những khung hình rộng, chân thực và mở rộng góc nhìn</p><p>Không chỉ là một công cụ chụp ảnh xuất sắc, chiếc&nbsp;<a href="https://www.thegioididong.com/dtdd-xiaomi">điện thoại Xiaomi</a>&nbsp;này&nbsp;còn cho phép bạn quay video 4K với độ nét tuyệt đỉnh. Tận dụng sự mạnh mẽ của camera, bạn có thể ghi lại những khoảnh khắc đáng nhớ với độ chi tiết và độ sắc nét xuất sắc. Chất lượng video 4K sẽ mang đến cho bạn trải nghiệm xem video chất lượng cao như trong phòng chiếu phim.</p><p>&nbsp;</p><p>Xiaomi 13T đã hợp tác cùng với hãng nhiếp ảnh danh tiếng Leica để tinh chỉnh máy ảnh. Điều này đảm bảo rằng mọi bức ảnh và video bạn chụp đều được cân chỉnh với sự chuyên nghiệp và đẳng cấp của Leica. Từ việc cân chỉnh màu sắc cho đến sự tối ưu hóa của ống kính, Xiaomi 13T mang đến cho bạn một trải nghiệm nhiếp ảnh đỉnh cao mà bạn không thể tìm thấy ở bất kỳ nơi nào khác.</p><h3>Sử dụng pin lớn cùng khả năng sạc nhanh</h3><p>Một trong những điểm đáng tự hào của Xiaomi 13T chính là dung lượng pin lớn cực khủng lên đến 5000 mAh. Điều này đồng nghĩa với việc bạn có thể sử dụng điện thoại suốt cả ngày mà không cần phải lo lắng về việc hết pin. Dung lượng pin này đủ để bạn thực hiện mọi công việc, chơi game, xem video và duyệt web mà không cần phải tìm kiếm nguồn sạc liên tục.</p><p>Với công nghệ sạc nhanh 67 W, Xiaomi 13T giúp bạn tiết kiệm thời gian đáng kể trong việc sạc pin. Theo thông tin từ hãng, máy có thể sạc pin từ 0% đến 100% chỉ khoảng 42 phút một cách nhanh chóng và hiệu quả.&nbsp;</p><p>&nbsp;</p><p>Xiaomi 13T không chỉ là một công cụ hoàn hảo cho nhiếp ảnh, mà còn là một thiết bị đa năng và linh hoạt, phục vụ nhiều mục đích khác nhau. Đây là một trong những chiếc điện thoại cận flagship đáng chú ý nhất của năm 2023 nhờ hội tụ đầy đủ các thông số hàng đầu phân khúc.</p>', 2, 8)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (20, 4, N'Điện thoại OPPO Reno8 Pro 5G', 18990000, CAST(N'2023-12-02T17:08:54.350' AS DateTime), N'<h3><a href="https://www.thegioididong.com/dtdd/oppo-reno8-pro">OPPO Reno8 Pro 5G</a> là chiếc điện thoại cao cấp được nhà OPPO ra mắt vào thời điểm 09/2022, máy hướng đến sự hoàn thiện cao cấp ở phần thiết kế cùng khả năng quay chụp chuyên nghiệp nhờ trang bị vi xử lý hình ảnh MariSilicon X chuyên dụng.</h3><h3>Dáng vẻ cao cấp sang trọng</h3><p>Lần này nhà OPPO mang đến cho chúng ta một chiếc điện thoại có thiết kế đặc biệt, máy sở hữu một diện mạo khác hẳn với những chiếc <a href="https://www.thegioididong.com/dtdd-oppo-reno">điện thoại OPPO Reno</a> trước đây, cách thiết kế này đã làm mình liên tưởng đến chiếc&nbsp;<a href="https://www.thegioididong.com/dtdd/oppo-find-x5-pro">OPPO Find X5 Pro</a> được ra mắt trước đó.</p><p>&nbsp;</p><p>Mặt lưng của điện thoại làm từ kính và được hoàn thiện bóng giúp máy trở nên nổi bật hơn, phần này bóng bẩy đến mức mình có thể soi gương một cách trực tiếp đối với phiên bản màu đen.&nbsp;Tuy nhiên đây cũng có thể coi như một điểm hạn chế bởi mặt lưng máy khá dễ bám dấu vân tay.</p><p>&nbsp;</p><p>Mặt lưng của Reno8 Pro chính là kính cường lực Gorilla Glass 5, loại vật liệu này có khả năng hạn chế xước khá tốt giúp cho phần mặt lưng máy được trở nên bền bỉ hơn.</p><p>&nbsp;</p><p>Điểm mình ấn tượng nhất ở phần thiết kế là tạo hình bo cong tại vị trí tiếp giáp giữa mặt lưng và cụm camera. Điều này giúp cho máy có được cái nhìn liền mạch và đồng nhất hơn, cảm giác như máy được đúc từ một khối, nhìn cực kỳ chắc chắn.</p><p>&nbsp;</p><p>Bên cạnh đó bộ khung của chiếc&nbsp;<a href="https://www.thegioididong.com/dtdd-oppo">điện thoại OPPO</a>&nbsp;này&nbsp;còn&nbsp;được hoàn thiện từ kim loại giúp cho Reno8 Pro tăng thêm phần bền bỉ, giúp cố định phần thân máy được tốt hơn.</p><p>&nbsp;</p><p>Đến phần mặt trước, OPPO trang bị một màn hình có thiết kế dạng đục lỗ và được hoàn thiện phẳng, so với những dòng Reno trước đây thì Reno8 Pro được xem như thiết bị có viền mỏng nhất mà mình từng sử dụng.</p><p>&nbsp;</p><p>Viền màn hình trên Reno8 Pro có kích thước gần như bằng nhau, điều này giúp màn hình trở nên cân đối hơn, cảm giác khi mình nhìn vào rất dễ chịu, xem phim hay chơi game cũng vô cùng đã mắt.</p><h3>Chụp ảnh chất lượng hơn thông qua NPU MariSilicon X</h3><p>Trước khi đi vào trọng tâm phần trải nghiệm thì mình cũng điểm sơ qua phần thông số camera của Reno8 Pro, máy tích hợp 3 camera với camera chính độ phân giải&nbsp;50 MP, cảm biến góc siêu rộng 8 MP và cuối cùng là ống kính macro 2 MP. Ngoài ra bên trong máy còn được hỗ trợ chip xử lý hình ảnh MariSilicon X với khả năng tái tạo màu chân thực và xử lý ảnh chụp được sắc nét hơn.</p><p>Xem thêm:&nbsp;<a href="https://www.thegioididong.com/tin-tuc/marisilicon-x-la-gi-1429621">Tìm hiểu về MariSilicon X: Chip xử lí hình ảnh đầu tiên trên tiến trình 6 nm của OPPO</a></p><p>&nbsp;</p><p>Đến với chế độ tự động, chất lượng ảnh cho ra có độ chi tiết tốt, màu sắc tương đối rực rỡ giúp cho bức ảnh trở nên sinh động hơn. Ảnh khi zoom lên không bị bể quá nhiều giúp cho mình có thể dễ dàng thay đổi khung hình theo ý thích mà không quá lo lắng đến việc chất lượng ảnh bị giảm đi nhiều.</p><p>&nbsp;</p><p>&nbsp;</p><p>Khi chụp ở những môi trường âm u không có quá nhiều ánh sáng mà bức ảnh vẫn trông rất hài hòa và đẹp mắt, máy sẽ tự động cân bằng và tăng độ sáng giúp cho bức hình không bị quá tối so với thực tế.</p><p>&nbsp;</p><p>&nbsp;</p><p>Ở những khung cảnh có nhiều chi tiết nhỏ thì máy cũng có thể thu lại một cách rõ ràng mà không hề lạm dụng vào AI để làm giả chi tiết.</p><p>&nbsp;</p><p>Ảnh chụp ở trong nhà khi không có quá nhiều ánh sáng nhưng chất lượng cho ra vẫn rất ổn áp, màu ảnh có độ trong trẻo nên khi nhìn vào rất thích mắt, hiện tượng nhiễu hạt cũng không thấy xuất hiện trên các bức ảnh mà mình đã chụp (không zoom).</p><p>&nbsp;</p><p>&nbsp;</p><h3>Hiệu năng mạnh mẽ trong phân khúc</h3><p>Bên cạnh sự ra mắt của Reno8 Pro thì lần này chúng ta còn được chứng kiến sức mạnh của con chip Dimensity 8100 Max khi lần đầu tiên có mặt trên smartphone. Chip được nhà MediaTek truyền thông khá nhiều về mặt hiệu năng cùng khả năng tối ưu được lượng điện tiêu thụ, bên cạnh đó vi xử này còn giúp giảm hiện tượng quá nhiệt cho smartphone để mang đến quá trình trải nghiệm tốt nhất.</p><p>&nbsp;</p><p>Dimensity 8100 Max đã vượt qua bài kiểm tra hiệu năng của mình một cách xuất sắc khi mức điểm cho ra khá cao, theo mình đánh giá thì đây là kết quả mà ít có <a href="https://www.thegioididong.com/dtdd?g=android">điện thoại Android</a> nào trong cùng phân khúc có được với điểm số cụ thể như sau: 884 (đơn nhân), 3299 (đa nhân) trên Benchmark và 11445 trên PCMark.</p><p>&nbsp;</p><p>Khả năng xử lý những tựa game đồ họa cao cũng được Reno8 Pro "cân" một cách dễ dàng. Đầu tiên là Liên Quân Mobile với mức cài đặt cấu hình cao, hình ảnh mà máy mang tới hết sức đẹp mắt, không có gì để chê khi máy hiển thị.</p><p>&nbsp;</p><p>Tốc độ khung hình ở tựa game này dao động trong khoảng 58.8 FPS, biểu đồ không xảy ra tình trạng drop FPS sâu giúp cho việc giật lag được hạn chế.</p><p>&nbsp;</p><p>Chuyển qua tựa game PUBG Mobile với mức đồ họa HDR và tốc độ khung hình cực độ, FPS đo được vào khoảng 59.4, mọi thao tác từ bắn súng cho tới di chuyển thì máy gần như mang đến sự mượt mà và được duy trì ổn định xuyên suốt ván đấu.&nbsp;</p><p>&nbsp;</p><p>Ngoài ra Reno8 Pro còn hỗ trợ mức đồ họa tối đa đối với tựa game PUBG Mobile này là Ultra HD và tốc độ khung hình cực cao, tuy nhiên khi chơi game ở mức đồ họa này thì máy phải xử lý hình ảnh nhiều hơn nên sẽ xảy ra tình trạng giật, pin cũng tụt nhanh hơn. Vậy nên những bạn yêu thích sự ổn định thì HDR được xem như chuẩn màn hình phù hợp mà mình đề xuất cho các bạn.</p><p>&nbsp;</p><p>Tuy nhiên khi sử dụng bằng kết nối mạng di động thì máy ấm lên khá nhanh, chỉ trong 40 phút chơi là mình đã bắt đầu cảm nhận được sự thay đổi về nhiệt độ trên phần mặt lưng, nhưng bởi vì làm từ kính nên lượng nhiệt hấp thụ vào cũng không quá nhiều, điều này giúp mình không cảm thấy quá khó chịu mỗi khi chơi game.</p><p>Bên cạnh đó Reno8 Pro 5G còn là <a href="https://www.thegioididong.com/dtdd-ram-12gb">điện thoại RAM 12 GB</a> và được hỗ trợ mở rộng 7 GB từ bộ nhớ trong, nhờ vậy mà khi thao tác đa nhiệm cũng được mượt mà hơn, mở đồng thời nhiều ứng dụng cùng lúc thì máy cũng có thể dễ dàng xử lý.</p><p>&nbsp;</p><h3>Màn hình cao cấp kích thước lớn</h3><p>OPPO Reno8 Pro được trang bị tấm nền AMOLED 6.7 inch, cho ra không gian hiển thị rộng rãi và màu sắc sinh động, tần số quét 120 Hz thể hiện các chuyển động trên màn hình mượt mà, rất phù hợp dùng để xem phim, chơi game hay theo dõi các chương trình về ẩm thực bởi nội dung mà máy mang lại là vô cùng rực rỡ và thích mắt.</p><p>Xem thêm:&nbsp;<a href="https://www.thegioididong.com/hoi-dap/man-hinh-amoled-la-gi-905766">Màn hình AMOLED là gì? Có gì nổi bật? Thiết bị nào có màn hình AMOLED?</a></p><p>&nbsp;</p><p>Ngoài ra màn hình của Reno8 Pro còn có khả năng tái hiện hình ảnh có chiều sâu nhờ ưu điểm của tấm nền mang lại, bởi loại công nghệ này sẽ tự động ngắt độ sáng của những điểm ảnh đang phụ trách trình chiếu nội dung có màu đen, nhờ vậy mà <a href="https://www.thegioididong.com/dtdd">điện thoại</a> còn tối ưu được thời lượng pin.</p><p>Bên cạnh đó màn hình còn có độ sáng 800 nits giúp hình ảnh được hiển thị rõ ràng hơn kể cả khi dùng ở ngoài trời nắng. Mình thường xuyên dùng Reno8 Pro để xem bản đồ mỗi khi dạo quanh thành phố, nhờ độ sáng cao nên mình có thể sử dụng điện thoại một cách dễ dàng hơn.</p><h3>Sạc pin trong tích tắc</h3><p>Theo mình thấy thì Reno8 Pro là một chiếc <a href="https://www.thegioididong.com/dtdd-sac-sieu-nhanh">điện thoại sạc siêu nhanh</a>&nbsp;ấn tượng, được nhà OPPO trang bị công nghệ SuperVOOC công suất 80 W nên việc lấp đầy viên pin trong thời gian ngắn là điều hết sức dễ dàng. Mình cũng đã kiểm chứng thực tế thì máy chỉ mất đâu đó tầm 37 phút là máy đã có thể sạc đầy từ 0 cho đến 100% pin.</p><p>&nbsp;</p><p>Và với viên pin có dung lượng 4500 mAh nên mình hoàn toàn có thể an tâm dùng máy để đáp ứng cho công việc và học tập cả ngày. Theo như quá trình mà mình sử dụng trước đó thì Reno8 Pro đáp ứng được thời lượng dùng lên tới 6 tiếng 17 phút.</p><p>&nbsp;</p><p>Tuy nhiên lúc đó mình chơi game khá nhiều nên con số chưa thực sự cao cho lắm, với những khách hàng thường sử dụng các tác vụ như xem phim, nghe nhạc, lướt mạng xã hội thì việc dùng liên tục trong 8 - 9 tiếng là điều hoàn toàn có thể làm được trên Reno8 Pro 5G.</p><p>OPPO Reno8 Pro 5G - mẫu smartphone hướng đến đối tượng khách hàng thuộc giới trẻ nhờ lối thiết kế vô cùng bắt mắt và thời thượng, camera cũng được đánh giá khá cao nên đây rất phù hợp cho những ai đang làm các công việc có liên quan đến sản xuất nội dung video, hình ảnh, và những gì OPPO mang đến cho người dùng trên phiên bản lần này thì mức giá như trên là cực kỳ xứng đáng.</p>', 1, 8)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (21, 4, N'Máy Ảnh mini HD', 377000, CAST(N'2023-12-02T17:16:48.630' AS DateTime), N'<p>Thương hiệu - Mangze Các yếu tố phổ biến - Màu đồng nhất Chế độ cung cấp điện có thể sạc lại Chất liệu nhựa Xuất xứ - Trung Quốc đại lục Nhóm tuổi áp dụng - Trên 14 tuổi</p>', 1, 31)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (22, 4, N'Máy ảnh canon 30D', 2500000, CAST(N'2023-12-02T17:19:04.903' AS DateTime), N'<p>Hãng sản xuất: Canon&nbsp;</p><p>Gói sản phẩm: Body Only, lens kit 18-55STM&nbsp;</p><p>Độ lớn màn hình LCD(inch): 2.5 inch</p><p>Kích thước cảm biến (Sensor size): APS-C (22.5 x 15 mm)&nbsp;</p><p>Megapixel (Số điểm ảnh hiệu dụng): 8.2 Megapixel&nbsp;</p><p>Độ phân giải ảnh lớn nhất: 3840×2400&nbsp;</p><p>Optical Zoom (Zoom quang): Phụ thuộc vào Lens</p>', 1, 31)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (23, 4, N'Máy ảnh canon 30D', 4699999, CAST(N'2023-12-02T17:20:36.287' AS DateTime), N'<p>Hãng sản xuất: Canon</p><p>Gói sản phẩm: Body Only, lens kit 18-55STM&nbsp;</p><p>Độ lớn màn hình LCD(inch): 2.5 inch</p><p>Kích thước cảm biến (Sensor size): APS-C (22.5 x 15 mm)&nbsp;</p><p>Megapixel (Số điểm ảnh hiệu dụng): 8.2 Megapixel&nbsp;</p><p>Độ phân giải ảnh lớn nhất: 3840×2400&nbsp;</p><p>Optical Zoom (Zoom quang): Phụ thuộc vào Lens</p>', 1, 31)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (24, 4, N'Máy ảnh Mirrorless Sony Alpha Nex', 2580000, CAST(N'2023-12-02T17:21:45.980' AS DateTime), N'<p>Hãng sản xuất: SONY</p><p>Gói sản phẩm: Body Only, lens kit 18-55STM&nbsp;</p><p>Độ lớn màn hình LCD(inch): 2.5 inch</p><p>Kích thước cảm biến (Sensor size): APS-C (22.5 x 15 mm)&nbsp;</p><p>Megapixel (Số điểm ảnh hiệu dụng): 8.2 Megapixel&nbsp;</p><p>Độ phân giải ảnh lớn nhất: 3840×2400&nbsp;</p><p>Optical Zoom (Zoom quang): Phụ thuộc vào Lens</p>', 1, 31)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (25, 4, N'Máy ảnh vintage digital camera', 2580000, CAST(N'2023-12-02T17:23:42.627' AS DateTime), N'<p>NHẮN TIN ĐỂ XEM MÁY TRƯỚC KHI MUA HÀNG&nbsp;</p><p>Máy ảnh được chọn lọc kĩ, độ cond cao nhưng ko thể tránh khỏi những lỗi xước và trầy nhỏ Các bạn nhắn tin để xem chi tiết máy nhé ạ \</p><p>Thông tin sản phẩm đều được ghi trên ảnh&nbsp;</p><p>Một bộ đã bao gồm: Pin, thẻ nhớ, sạc theo máy Tặng kèm dây đeo và túi len đựng máy xinh xinh. ❤️</p>', 1, 31)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (26, 4, N'Giày Nam sneaker thể thao Họa Tiết Clothers Dây thừng Độc Đáo', 169000, CAST(N'2023-12-02T17:30:14.560' AS DateTime), N'<p>💥 THÔNG TIN SẢN PHẨM GIÀY THỂ THAO NAM&nbsp;</p><p>✔️ Đến với Shop bạn hoàn toàn có thể yên tâm hàng đảm bảo chất lượng, tốt nhất trong tầm giá.( không có hàng lỗi, hàng thứ cấp )&nbsp;</p><p>✔️ Chất liệu: Vải Sợi 2 lớp cao cấp&nbsp;</p><p>✔️ Đế giày được làm bằng chất liệu cao su đúc nguyên khối chắc chắn có khắc họa tiết để tăng độ ma sát, chống trơn trượt.&nbsp;</p><p>✔️ Màu sắc:&nbsp;</p><p>✔️ Size: 39-43&nbsp;</p><p>💥 ĐẶC ĐIỂM SẢN PHẨM GIÀY THỂ THAO NAM&nbsp;</p><p>✔️ Giày dễ phối đồ thích hợp cho các hoạt động đi lại hàng ngày, chạy bộ&nbsp;</p><p>✔️ Đế cao su tổng hợp, xẻ rãnh tạo cảm giác thoải mái khi đi&nbsp;</p><p>✔️ Thích hợp với các mùa trong năm: Xuân - Hè - Thu - Đông&nbsp;</p><p>💥 HƯỚNG DẪN BẢO QUẢN GIAY THỂ THAO NAM&nbsp;</p><p>✔️ Để giày ở nơi khô ráo thoáng mát để giữ giày được bền đẹp hơn&nbsp;</p><p>✔️ Vệ sinh giày, dùng khăn hay bàn trải lông mềm để chải sạch giày cùng với nước tẩy rửa giày chuyên dụng&nbsp;</p><p>✔️ Có thể giặt giày cùng với chất tẩy rửa nhẹ&nbsp;</p><p>❌ KHUYẾN CÁO&nbsp;</p><p>⛔ Không dùng hóa chất hay bột giặt có hoạt tính tẩy rửa mạnh&nbsp;</p><p>⛔ Không dùng bàn chải cứng để vệ sinh giày sẽ làm hư&nbsp;</p><p>⛔ Không đi mưa ngâm nước lâu, không phơi giày trực tiếp dưới ngoài trời nắng gắt&nbsp;</p><p>💥 Shop cam kết:&nbsp;</p><p>✔ Sản phẩm chuẩn 100% như hình</p><p>✔ Giao hàng trên toàn quốc ♥️&nbsp;</p><p>SỬ DỤNG VÀ BẢO QUẢN:&nbsp;</p><p>✔️ Tránh mang sản phẩm khi trời mưa hoặc thời tiết xấu để chúng không bị ướt dẫn đến bong tróc&nbsp;</p><p>✔️ Cất giữ sản phẩm ở nơi thoáng mát để giữ gìn chất lượng của sản phẩm ở mức tốt nhất Lau chùi sản phẩm thường xuyên để tránh bụi.&nbsp;</p><p>✔️ Nên dùng bàn chải mềm hoặc khăn mềm để chà giặt sẽ tốt hơn cho đôi giày của bạn.&nbsp;</p><p>✔️ Nên phơi giày chỗ thoáng mát, không nên phơi trực tiếp dưới ánh nắng mặt trời.</p>', 1, 19)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (27, 4, N'Giày Sneakers cổ cao C V Chuck Taylor All Star Lugged ', 655000, CAST(N'2023-12-02T17:32:48.197' AS DateTime), N'<p>Thông Tin Giày Cổ Cao C.V Chuck Taylor All Star Lugged 1.Chất lượng tốt nhất trong tầm giá 2.Form đẹp chuẩn : Màu sắc giống đến 98 °/ₒ ; 3.Chất liệu da + da lộn + vải mesh 4.Logo Mông in dập chìm. 5.Lưỡi gà cao dày dặn; swoosh sắc nét; Mông mũi làm đẹp 6.Tem QR CODE Có thể check mã 2D 7.Đế 2 lớp khâu chỉ đều 8.Full box + accessories Hướng dẫn sử dụng Giày C.V Lugged Đen 1.Không dùng hóa chất hay bột giặt có hoạt tính tẩy rửa mạnh để giặt giày 2.Không dùng bàn chải cứng để vệ sinh giày sẽ làm hư hỏng giày 3.Không đi mưa ngâm nước lâu, không phơi giày thể thao nam nữ trực tiếp dưới ngoài trời nắng gắt 4.Tránh cất giữ giày khi còn ướt, ẩm.. Mô tả chi tiết Giày C.V Lugged Đen 1.Size: 36-43 2.Giày đầy đủ phụ kiện (hộp,bill) được đóng gói cẩn thận. 3.Đế: Đế đúc liền khối phần dưới có các đường họa tiết (chống trơn trượt) và in logo thương hiệu giày. 4.Form: Form dáng chuẩn 1:1 , được gia công tỉ mỉ tạo độ hài hòa giữa phần thân và phần đế 5.Giày hot trend, kiểu dáng đẹp sang chảnh dễ phối đồ có thể mang đi chơi, đi học dự tiệc , đi làm... Jiang Store CAM KẾT: 1. Hình ảnh sản phẩm Giày C.V Lugged Đen là ảnh thật cận chất 100% 2. Giày C.V Lugged Đen giống 100% với mô tả thông tin sản phẩm mà Jiang Store đã đăng. 3. Với bất cứ lỗi nào của sản phẩm Giày C.V Lugged Đen thuộc về nhà sản xuất, Jiang Store sẽ hoàn trả tiền sản phẩm 100% cho khách hàng. 4.Màu của Giày C.V Lugged Đen có thể sẽ chênh lệch thực tế một phần nhỏ, do ảnh hưởng về độ lệch màu của ánh sáng nhưng vẫn đảm bảo chất lượng 5. Đối với đơn hàng đặt nhầm size, nhầm màu, bạn vui lòng đóng gói lại sản phẩm, Jiang Store sẽ gọi ship sản phẩm size mới cho bạn và lấy sản phẩm không vừa về với phí ship 2 chiều là 45k(Shop không thu thêm phụ phí đổi trả). Do mới bán trên Shopee nên Shop chưa có nhiều đánh giá nhưng JIANG STORE luôn tự tin đảm bảo về chất lượng sản phẩm,hỗ trợ mọi vấn đề khách hàng gặp phải đến khi hài lòng và hoàn trả 100% tiền hàng nếu sản phẩm làm khách hàng thấy không hài lòng. Địa chỉ : Yên Sơn, Quốc Oai, Hà Nội</p>', 1, 19)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (28, 4, N'Giày Sneakers cổ cao C V Chuck Taylor All Star Lugged ', 655000, CAST(N'2023-12-02T17:32:55.337' AS DateTime), N'<p>Thông Tin Giày Cổ Cao C.V Chuck Taylor All Star Lugged 1.Chất lượng tốt nhất trong tầm giá 2.Form đẹp chuẩn : Màu sắc giống đến 98 °/ₒ ; 3.Chất liệu da + da lộn + vải mesh 4.Logo Mông in dập chìm. 5.Lưỡi gà cao dày dặn; swoosh sắc nét; Mông mũi làm đẹp 6.Tem QR CODE Có thể check mã 2D 7.Đế 2 lớp khâu chỉ đều 8.Full box + accessories Hướng dẫn sử dụng Giày C.V Lugged Đen 1.Không dùng hóa chất hay bột giặt có hoạt tính tẩy rửa mạnh để giặt giày 2.Không dùng bàn chải cứng để vệ sinh giày sẽ làm hư hỏng giày 3.Không đi mưa ngâm nước lâu, không phơi giày thể thao nam nữ trực tiếp dưới ngoài trời nắng gắt 4.Tránh cất giữ giày khi còn ướt, ẩm.. Mô tả chi tiết Giày C.V Lugged Đen 1.Size: 36-43 2.Giày đầy đủ phụ kiện (hộp,bill) được đóng gói cẩn thận. 3.Đế: Đế đúc liền khối phần dưới có các đường họa tiết (chống trơn trượt) và in logo thương hiệu giày. 4.Form: Form dáng chuẩn 1:1 , được gia công tỉ mỉ tạo độ hài hòa giữa phần thân và phần đế 5.Giày hot trend, kiểu dáng đẹp sang chảnh dễ phối đồ có thể mang đi chơi, đi học dự tiệc , đi làm... Jiang Store CAM KẾT: 1. Hình ảnh sản phẩm Giày C.V Lugged Đen là ảnh thật cận chất 100% 2. Giày C.V Lugged Đen giống 100% với mô tả thông tin sản phẩm mà Jiang Store đã đăng. 3. Với bất cứ lỗi nào của sản phẩm Giày C.V Lugged Đen thuộc về nhà sản xuất, Jiang Store sẽ hoàn trả tiền sản phẩm 100% cho khách hàng. 4.Màu của Giày C.V Lugged Đen có thể sẽ chênh lệch thực tế một phần nhỏ, do ảnh hưởng về độ lệch màu của ánh sáng nhưng vẫn đảm bảo chất lượng 5. Đối với đơn hàng đặt nhầm size, nhầm màu, bạn vui lòng đóng gói lại sản phẩm, Jiang Store sẽ gọi ship sản phẩm size mới cho bạn và lấy sản phẩm không vừa về với phí ship 2 chiều là 45k(Shop không thu thêm phụ phí đổi trả). Do mới bán trên Shopee nên Shop chưa có nhiều đánh giá nhưng JIANG STORE luôn tự tin đảm bảo về chất lượng sản phẩm,hỗ trợ mọi vấn đề khách hàng gặp phải đến khi hài lòng và hoàn trả 100% tiền hàng nếu sản phẩm làm khách hàng thấy không hài lòng. Địa chỉ : Yên Sơn, Quốc Oai, Hà Nội</p>', 1, 26)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (29, 4, N'Renben Dép Quai Ngang Thời Trang Mùa Hè Cho Nam Nữ', 256999, CAST(N'2023-12-02T17:34:57.900' AS DateTime), N'<p>Thời gian giao hàng dự kiến của sản phẩm này là 7-9 ngày</p><p>Chào mừng đến với cửa hàng của chúng tôi.</p><p>😊😊😊</p><p>🌄Giày thể thao, dép. giá cả phải chăng. hàng chất lượng. cửa hàng thân thiện</p><p>Sản xuất tại Trung Quốc</p><p>Giới tính áp dụng - trung tính / cả nam và nữ</p><p>Chất liệu duy nhất - EVA</p><p>Chất liệu trên ''EVA</p><p>⚡Nhấp để đặt hàng. không thể đổi trả</p><p>Về sản phẩm trong hình - Sử dụng các màn hình khác nhau có thể làm cho màu sắc sản phẩm thực tế hơi đậm hơn hoặc nhạt hơn so với hình ảnh.</p><p>Sản phẩm của chúng tôi có xuất xứ từ nước ngoài và được chuyển đến nhà của chúng tôi</p><p>🔥Rất quan trọng - Vui lòng kiểm tra số điện thoại và địa chỉ của bạn là chính xác trước khi nhấp vào để đặt hàng.Nếu có một lỗi. của chúng tôi🔥Không thể thay đổi hoặc sửa đổi bất cứ điều gì</p><p>Chúng tôi có kinh nghiệm phong phú và sản phẩm chất lượng cao.</p><p>Mang đến cho bạn trải nghiệm mua sắm tốt nhất.</p><p>Sản phẩm của chúng tôi là 100''mới.</p><p>Chúng tôi chú ý đến chất lượng cao và giá cả thấp "</p><p>Nếu bạn thích sản phẩm của chúng tôi, xin vui lòng tham gia giỏ hàng.Cảm ơn bạn rất nhiều "!Trong quá trình này,</p><p>Nếu bạn có bất kỳ câu hỏi nào về việc mua hàng của mình, vui lòng liên hệ với chúng tôi.Chúng tôi sẽ cung cấp cho bạn câu trả lời thỏa đáng nhất.</p><p>Nếu vấn đề là do cửa hàng cho biết sản phẩm bị lỗi. bạn có thể liên hệ với cửa hàng bằng cách chat.Cửa hàng của chúng tôi sẵn sàng chịu trách nhiệm.</p><p>Nếu không có gì sai với sản phẩm và nó là hoàn toàn bình thường. đừng quên khen ngợi và đánh giá chúng tôi.Chúng tôi mong đợi xếp hạng 5 sao của bạn</p><p>Mọi thứ đều quan trọng đối với cửa hàng của chúng tôi.Cảm ơn tất cả các khách hàng yêu thích của bạn</p><p>Chúng tôi luôn có những sản phẩm mới.Hãy chú ý đến tin tức mới nhất của cửa hàng của chúng tôi.</p>', 1, 23)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (30, 4, N'Renben Dép Quai Ngang Thời Trang Mùa Hè Cho Nam Nữ', 256999, CAST(N'2023-12-02T17:35:06.873' AS DateTime), N'<p>Thời gian giao hàng dự kiến của sản phẩm này là 7-9 ngày</p><p>Chào mừng đến với cửa hàng của chúng tôi.</p><p>😊😊😊</p><p>🌄Giày thể thao, dép. giá cả phải chăng. hàng chất lượng. cửa hàng thân thiện</p><p>Sản xuất tại Trung Quốc</p><p>Giới tính áp dụng - trung tính / cả nam và nữ</p><p>Chất liệu duy nhất - EVA</p><p>Chất liệu trên ''EVA</p><p>⚡Nhấp để đặt hàng. không thể đổi trả</p><p>Về sản phẩm trong hình - Sử dụng các màn hình khác nhau có thể làm cho màu sắc sản phẩm thực tế hơi đậm hơn hoặc nhạt hơn so với hình ảnh.</p><p>Sản phẩm của chúng tôi có xuất xứ từ nước ngoài và được chuyển đến nhà của chúng tôi</p><p>🔥Rất quan trọng - Vui lòng kiểm tra số điện thoại và địa chỉ của bạn là chính xác trước khi nhấp vào để đặt hàng.Nếu có một lỗi. của chúng tôi🔥Không thể thay đổi hoặc sửa đổi bất cứ điều gì</p><p>Chúng tôi có kinh nghiệm phong phú và sản phẩm chất lượng cao.</p><p>Mang đến cho bạn trải nghiệm mua sắm tốt nhất.</p><p>Sản phẩm của chúng tôi là 100''mới.</p><p>Chúng tôi chú ý đến chất lượng cao và giá cả thấp "</p><p>Nếu bạn thích sản phẩm của chúng tôi, xin vui lòng tham gia giỏ hàng.Cảm ơn bạn rất nhiều "!Trong quá trình này,</p><p>Nếu bạn có bất kỳ câu hỏi nào về việc mua hàng của mình, vui lòng liên hệ với chúng tôi.Chúng tôi sẽ cung cấp cho bạn câu trả lời thỏa đáng nhất.</p><p>Nếu vấn đề là do cửa hàng cho biết sản phẩm bị lỗi. bạn có thể liên hệ với cửa hàng bằng cách chat.Cửa hàng của chúng tôi sẵn sàng chịu trách nhiệm.</p><p>Nếu không có gì sai với sản phẩm và nó là hoàn toàn bình thường. đừng quên khen ngợi và đánh giá chúng tôi.Chúng tôi mong đợi xếp hạng 5 sao của bạn</p><p>Mọi thứ đều quan trọng đối với cửa hàng của chúng tôi.Cảm ơn tất cả các khách hàng yêu thích của bạn</p><p>Chúng tôi luôn có những sản phẩm mới.Hãy chú ý đến tin tức mới nhất của cửa hàng của chúng tôi.</p>', 1, 29)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (31, 4, N'Mins Shoes Giày Bốt Đùi Da Mềm Cao Cấp Bốt 194', 550000, CAST(N'2023-12-02T17:39:12.633' AS DateTime), N'<p>MÔ TẢ SẢN PHẨM:</p><p>- Chất liệu da mềm mại, dễ lau chùi, dáng bốt tạo sự nhỏ gọn cho đôi chân. Bên trong giày lót êm và ấm chân.</p><p>- Gót ~7cm cùng thiết kế cổ cao mũi bầu, cổ ôm cho dáng chân thon thả.</p><p>- Màu Sắc: Kem, Đen, Cafe</p><p>- Bốt thời thượng, tạo phong cách riêng cho bạn.</p><p>SẢN PHẨM CÓ BẢO HÀNH: Tất cả sản phẩm của Min''s đều có chính sách báo hành cho khách hàng,</p><p>THÀNH LẬP TỪ THÁNG 11-2014 , Min’s Shoes là thương hiệu giày nữ hàng đầu Việt Nam, luôn luôn sáng tạo, đổi mới liên tục, dẫn đầu xu hướng thời trang cùng chất lượng vượt trội.</p>', 1, 25)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (32, 4, N'Giày boot THE WOLF wild walk chelsea boot', 2050000, CAST(N'2023-12-02T17:41:00.677' AS DateTime), N'<p>THÔNG TIN SẢN PHẨM:</p><p>- Màu sắc: Đen</p><p>- Chất liệu da: Da bò nhập khẩu</p><p>- Chất liệu đế giày: Cao su cao cấp</p><p>- Lót Trong: Vải canvas cao cấp, da dê</p><p>- Độ cao gót: 4,3 cm</p><p>- Xuất xứ: Việt Nam</p><p>- Size 38, 39, 40, 41, 42, 43, 44</p><p>&nbsp;</p><p>CHÍNH SÁCH BẢO HÀNH:</p><p>- Bảo hành trọn đời về các vấn đề bong tróc keo đế</p><p>- Miễn phí 3 lần vệ sinh đánh bóng giày (mang theo thẻ vệ sinh)</p><p>- Đổi hàng trong vòng 1 tuần nếu xảy ra vấn đề do nhà sản xuất</p><p>+ Đổi hàng trong vòng 1 tuần nếu xảy ra vấn đề do nhà sản xuất</p><p>+ Trong trường hợp chưa mang lần nào, nhưng bị vấn đề về đế</p><p>- Hỗ trợ đổi size (không đổi mẫu) trong vòng 24h kể từ ngày nhận hàng từ Shipper</p><p>&nbsp;</p><p>VỀ THEWOLF:</p><p>Trong thời trang, sự bền vững luôn là yếu tố hàng đầu. Nó là cả một quá trình, từ việc bắt đầu tìm kiếm các nguồn cung cấp nguyên liệu cho đến việc tạo ra những sản phẩm tới tay khách hàng. Bằng cách tránh né cái quan điểm “thời trang nhanh gọn” và bắt tay tập trung vào những dây chuyền sản xuất sản phẩm một cách kĩ lưỡng đã giúp chúng tôi có thể tạo nên sự khác biệt.</p>', 1, 18)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (33, 4, N'Giày boot THE WOLF wild walk chelsea boot', 2050000, CAST(N'2023-12-02T17:41:10.260' AS DateTime), N'<p>THÔNG TIN SẢN PHẨM:</p><p>- Màu sắc: Đen</p><p>- Chất liệu da: Da bò nhập khẩu</p><p>- Chất liệu đế giày: Cao su cao cấp</p><p>- Lót Trong: Vải canvas cao cấp, da dê</p><p>- Độ cao gót: 4,3 cm</p><p>- Xuất xứ: Việt Nam</p><p>- Size 38, 39, 40, 41, 42, 43, 44</p><p>&nbsp;</p><p>CHÍNH SÁCH BẢO HÀNH:</p><p>- Bảo hành trọn đời về các vấn đề bong tróc keo đế</p><p>- Miễn phí 3 lần vệ sinh đánh bóng giày (mang theo thẻ vệ sinh)</p><p>- Đổi hàng trong vòng 1 tuần nếu xảy ra vấn đề do nhà sản xuất</p><p>+ Đổi hàng trong vòng 1 tuần nếu xảy ra vấn đề do nhà sản xuất</p><p>+ Trong trường hợp chưa mang lần nào, nhưng bị vấn đề về đế</p><p>- Hỗ trợ đổi size (không đổi mẫu) trong vòng 24h kể từ ngày nhận hàng từ Shipper</p><p>&nbsp;</p><p>VỀ THEWOLF:</p><p>Trong thời trang, sự bền vững luôn là yếu tố hàng đầu. Nó là cả một quá trình, từ việc bắt đầu tìm kiếm các nguồn cung cấp nguyên liệu cho đến việc tạo ra những sản phẩm tới tay khách hàng. Bằng cách tránh né cái quan điểm “thời trang nhanh gọn” và bắt tay tập trung vào những dây chuyền sản xuất sản phẩm một cách kĩ lưỡng đã giúp chúng tôi có thể tạo nên sự khác biệt.</p>', 1, 25)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (34, 4, N'Chelsea Boots Nam', 654999, CAST(N'2023-12-02T17:42:52.443' AS DateTime), N'<p>BST Chelsea boots - Giày bốt da nam - Bốt cổ cao - tăng chiều cao 7 cm Vintage S1 new 2022 CHÀO MỪNG BẠN GHÉ THĂM Shop ✔️ Các chương trình khuyến mại bất ngờ cực kỳ hấp dẫn sẽ có tại Shop mời bạn ấn theo dõi để biết. 💥 THÔNG TIN SẢN PHẨM ✔️ Đến với Shop bạn hoàn toàn có thể yên tâm hàng đảm bảo chất lượng, tốt nhất trong tầm giá.( không có hàng lỗi, hàng thứ cấp ) ✔️ Chất liệu: Da bò nappa cao cấp nhập khẩu ✔️ Đế giày được làm bằng chất liệu cao su đúc nguyên khối chắc chắn có khắc họa tiết để tăng độ ma sát, chống trơn trượt. ✔️ Màu sắc: Đen ✔️ Size: 38-44 💥 Shop cam kết: ✔ Sản phẩm chuẩn 100% như hình ✔ Giao hàng trên toàn quốc ✔ Đổi size nếu không vừa, thời gian trong 7 ngày. 🎁 LỜI MUỐN NÓI! Nhận giày xong mong các bạn sẽ có những phản hồi tích cực như Feedback hình ảnh hoặc đánh giá 5 sao nếu cảm thấy OK. Mọi vấn đề bạn chưa vừa long xin hãy inbox để được hỗ trợ trước khi đánh giá nhé. Cảm ơn bạn đã đặt giày. Đừng quên nhấn theo dõi nha! Shop luôn dẫn đầu trong việc đáp ứng nhanh chóng những trào lưu xu hướng thời trang mới nhất châu Á. mang đến làn gió mới với xu hướng thời trang năng động, hiện đại và cá tính. Chúng tôi liên tục đổi mới chính mình và cam kết luôn cập nhật những mẫu mới nhất để đáp ứng nhu cầu và làm hài lòng tất cả khách hàng thân thiết của Shop</p>', 1, 18)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (35, 4, N'ROSATA RO444 bốt nữ cổ thấp đế cao 5 phân thời trang hàn quốc cao cấp da Pu loại 1 mềm mại khóa cài', 356000, CAST(N'2023-12-02T17:44:49.793' AS DateTime), N'<p>Tên sản phẩm: Giày boot ROSATA RO444 bốt nữ cổ thấp đế cao 5 phân thời trang hàn quốc cao cấp da Pu loại 1 mềm mại khóa cài</p><p>Thông tin chi tiết:</p><p>✅Kiểu dáng: giày boot nữ</p><p>✅Chất liệu: Da PU loại 1</p><p>✅Size : 35,36,37,38,39,40</p><p>✅Chiều cao gót: +5cm</p><p>✅Màu : Đen</p><p><br>&nbsp;</p>', 1, 25)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (36, 4, N'Dong Ho 1', 155000, CAST(N'2023-12-02T17:51:38.727' AS DateTime), N'<p>Vỏ/gờ : nhựa</p><p>Dây đeo bằng nhựa</p><p>mặt kính nhựa</p><p>Chống nước</p><p>Chức năng xem giờ</p><p>&nbsp;</p><p>Đồng hồ kim: 3 kim (giờ, phút, giây)</p><p>Sai số: ±20 giây mỗi tháng</p><p>Tuổi thọ pin: 3 năm với pin SR626SW</p><p>&nbsp;</p><p>Kích thước vỏ : 38.8×34.9×7.8mm</p><p>Tổng trọng lượng: 20g</p><p>&nbsp;</p><p>Bộ sản phẩm gồm:</p><p>-01 đồng hồ</p><p>-01 hộp</p><p>-01 Thẻ bảo hành chính hãng Anh Khuê</p><p>-Tem chống hàng giả AK sau đáy đồng hồ</p><p>&nbsp;</p><p>Bảo hành 1 năm chính hãng Casio Anh Khuê toàn quốc</p><p>Đặc biệt thay pin trọn đời tại shop Phố Đồng Hồ</p>', 1, 13)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (37, 4, N'Dong Ho 1', 155000, CAST(N'2023-12-02T17:51:48.357' AS DateTime), N'<p>Vỏ/gờ : nhựa</p><p>Dây đeo bằng nhựa</p><p>mặt kính nhựa</p><p>Chống nước</p><p>Chức năng xem giờ</p><p>&nbsp;</p><p>Đồng hồ kim: 3 kim (giờ, phút, giây)</p><p>Sai số: ±20 giây mỗi tháng</p><p>Tuổi thọ pin: 3 năm với pin SR626SW</p><p>&nbsp;</p><p>Kích thước vỏ : 38.8×34.9×7.8mm</p><p>Tổng trọng lượng: 20g</p><p>&nbsp;</p><p>Bộ sản phẩm gồm:</p><p>-01 đồng hồ</p><p>-01 hộp</p><p>-01 Thẻ bảo hành chính hãng Anh Khuê</p><p>-Tem chống hàng giả AK sau đáy đồng hồ</p><p>&nbsp;</p><p>Bảo hành 1 năm chính hãng Casio Anh Khuê toàn quốc</p><p>Đặc biệt thay pin trọn đời tại shop Phố Đồng Hồ</p>', 1, 14)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (38, 4, N'Dong Ho 2', 169000, CAST(N'2023-12-02T17:53:26.960' AS DateTime), N'<p>Vỏ/gờ : nhựa</p><p>Dây đeo bằng nhựa</p><p>mặt kính nhựa</p><p>Chống nước</p><p>Chức năng xem giờ</p><p>&nbsp;</p><p>Đồng hồ kim: 3 kim (giờ, phút, giây)</p><p>Sai số: ±20 giây mỗi tháng</p><p>Tuổi thọ pin: 3 năm với pin SR626SW</p><p>&nbsp;</p><p>Kích thước vỏ : 38.8×34.9×7.8mm</p><p>Tổng trọng lượng: 20g</p><p>&nbsp;</p><p>Bộ sản phẩm gồm:</p><p>-01 đồng hồ</p><p>-01 hộp</p><p>-01 Thẻ bảo hành chính hãng Anh Khuê</p><p>-Tem chống hàng giả AK sau đáy đồng hồ</p><p>&nbsp;</p><p>Bảo hành 1 năm chính hãng Casio Anh Khuê toàn quốc</p><p>Đặc biệt thay pin trọn đời tại shop Phố Đồng Hồ</p>', 1, 13)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (39, 4, N'Dong Ho 2', 169000, CAST(N'2023-12-02T17:53:32.227' AS DateTime), N'<p>Vỏ/gờ : nhựa</p><p>Dây đeo bằng nhựa</p><p>mặt kính nhựa</p><p>Chống nước</p><p>Chức năng xem giờ</p><p>&nbsp;</p><p>Đồng hồ kim: 3 kim (giờ, phút, giây)</p><p>Sai số: ±20 giây mỗi tháng</p><p>Tuổi thọ pin: 3 năm với pin SR626SW</p><p>&nbsp;</p><p>Kích thước vỏ : 38.8×34.9×7.8mm</p><p>Tổng trọng lượng: 20g</p><p>&nbsp;</p><p>Bộ sản phẩm gồm:</p><p>-01 đồng hồ</p><p>-01 hộp</p><p>-01 Thẻ bảo hành chính hãng Anh Khuê</p><p>-Tem chống hàng giả AK sau đáy đồng hồ</p><p>&nbsp;</p><p>Bảo hành 1 năm chính hãng Casio Anh Khuê toàn quốc</p><p>Đặc biệt thay pin trọn đời tại shop Phố Đồng Hồ</p>', 1, 14)
INSERT [dbo].[product] ([id], [id_shop], [product_name], [price], [create_date], [description], [status], [id_category_item]) VALUES (40, 4, N'Ống Kính Fujium XP33mm', 17890000, CAST(N'2023-12-02T17:55:29.710' AS DateTime), N'<p>- Thông tin sản phẩm ống kính FUJINON XF33mmF1.4 R LM WR cho FUJIFILM X Series</p><p>&nbsp;</p><p>&nbsp;</p><p>Với 15 thấu kính trong 10 nhóm - bao gồm hai thấu kính phi cầu và ba thấu kính tán xạ thấp - XF33mmF1.4 R LM WR được thiết kế để cung cấp chất lượng tối ưu và độ chính xác màu sắc vô song, với mức tối thiểu quang sai. Điều này đảm bảo độ phân giải chưa từng có cùng màu sắc tươi tắn, sống động.</p><p>- Khoảng cách lấy nét tối thiểu: 30cm</p><p>&nbsp;</p><p>&nbsp;</p><p>- Kích thước: ø67.0mm x 73.5mm</p><p>&nbsp;</p><p>&nbsp;</p><p>- Với trọng lượng chưa đến 400g (0,88lb), XF33mmF1.4 R LM WR rất dễ để cầm nắm và sử dụng. Cân bằng đẹp mắt trên thân máy nhờ thiết kế hoàn mỹ, là sự phù hợp hoàn hảo cho mọi trường hợp.</p><p>&nbsp;</p><p>&nbsp;</p><p>- R: vòng khẩu độ chuyên dụng có thể tùy chỉnh khẩu độ trực tiếp.</p><p>&nbsp;</p><p>&nbsp;</p><p>- XF33mmF1.4 R LM WR sử dụng động cơ tuyến tính để mang lại hiệu suất lấy nét tự động nhanh, chính xác và gần như im lặng. Hiện tượng giãn nở ống kính "Lens Breathing" khi lấy nét cũng không đáng chú ý, làm cho điều này trở thành lựa chọn hoàn hảo cho các nhà làm phim lấy nét lại trong khi quay phim - hoặc các nhiếp ảnh gia muốn làm việc nhanh chóng, yên tĩnh và dễ dàng.</p><p>&nbsp;</p><p>*Tìm hiểu thêm về chế độ bảo hành tại http://www.fujifilm-vietnam.com/ProductInfo</p><p>&nbsp;</p><p>&nbsp;</p><p>- XF33mmF1.4 R LM WR sẵn sàng cho mọi điều kiện, ngay cả những điều kiện khắc nghiệt nhất. Bên cạnh chất lượng quang học và lấy nét chính xác, thiết kế chống chịu thời tiết của nó luôn sẵn sàng cho mọi hoàn cảnh. Bụi, độ ẩm và nhiệt độ thấp đến -10 ° C (14 ° F) đều được loại bỏ, vì vậy bạn có thể không ngừng sáng tạo.</p><p>&nbsp;</p><p>*Tìm hiểu thêm về chế độ bảo hành tại http://www.fujifilm-vietnam.com/ProductInfo</p>', 1, 33)
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([id], [role_name]) VALUES (1, N'Admin')
INSERT [dbo].[role] ([id], [role_name]) VALUES (2, N'Bussiness')
INSERT [dbo].[role] ([id], [role_name]) VALUES (3, N'User')
SET IDENTITY_INSERT [dbo].[role] OFF
GO
SET IDENTITY_INSERT [dbo].[shop] ON 

INSERT [dbo].[shop] ([id], [id_account], [shop_name], [image], [create_date], [status]) VALUES (4, 6, N'Vẹn Store', NULL, CAST(N'2023-12-02T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[shop] OFF
GO
SET IDENTITY_INSERT [dbo].[storage] ON 

INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (8, 1, 79, CAST(N'2023-12-02T15:23:23.280' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (9, 2, 65, CAST(N'2023-12-02T15:42:59.340' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (10, 3, 90, CAST(N'2023-12-02T15:52:06.357' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (11, 4, 48, CAST(N'2023-12-02T16:00:18.500' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (12, 5, 98, CAST(N'2023-12-02T16:03:40.687' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (13, 6, 173, CAST(N'2023-12-02T16:08:57.397' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (14, 7, 26, CAST(N'2023-12-02T16:23:04.433' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (15, 8, 93, CAST(N'2023-12-02T16:26:29.940' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (16, 9, 86, CAST(N'2023-12-02T16:29:16.237' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (17, 10, 43, CAST(N'2023-12-02T16:31:40.373' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (18, 11, 44, CAST(N'2023-12-02T16:37:35.253' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (19, 12, 31, CAST(N'2023-12-02T16:40:46.257' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (20, 13, 25, CAST(N'2023-12-02T16:46:26.047' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (21, 14, 22, CAST(N'2023-12-02T16:49:32.200' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (22, 15, 30, CAST(N'2023-12-02T16:52:00.033' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (23, 16, 29, CAST(N'2023-12-02T16:55:13.647' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (24, 17, 65, CAST(N'2023-12-02T16:59:07.383' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (25, 18, 65, CAST(N'2023-12-02T17:02:30.733' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (26, 19, 65, CAST(N'2023-12-02T17:02:59.307' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (27, 20, 98, CAST(N'2023-12-02T17:08:54.393' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (28, 21, 76, CAST(N'2023-12-02T17:16:48.667' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (29, 22, 17, CAST(N'2023-12-02T17:19:04.937' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (30, 23, 17, CAST(N'2023-12-02T17:20:36.323' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (31, 24, 17, CAST(N'2023-12-02T17:21:46.013' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (32, 25, 17, CAST(N'2023-12-02T17:23:42.663' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (33, 26, 298, CAST(N'2023-12-02T17:30:14.590' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (34, 27, 70, CAST(N'2023-12-02T17:32:48.233' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (35, 28, 70, CAST(N'2023-12-02T17:32:55.343' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (36, 29, 129, CAST(N'2023-12-02T17:34:57.933' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (37, 30, 129, CAST(N'2023-12-02T17:35:06.893' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (38, 31, 79, CAST(N'2023-12-02T17:39:12.660' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (39, 32, 376, CAST(N'2023-12-02T17:41:00.700' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (40, 33, 376, CAST(N'2023-12-02T17:41:10.270' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (41, 34, 145, CAST(N'2023-12-02T17:42:52.477' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (42, 35, 71, CAST(N'2023-12-02T17:44:49.813' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (43, 36, 24, CAST(N'2023-12-02T17:51:38.750' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (44, 37, 24, CAST(N'2023-12-02T17:51:48.363' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (45, 38, 64, CAST(N'2023-12-02T17:53:26.970' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (46, 39, 64, CAST(N'2023-12-02T17:53:32.233' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (47, 40, 33, CAST(N'2023-12-02T17:55:29.740' AS DateTime))
INSERT [dbo].[storage] ([id], [id_product], [quantity], [create_date]) VALUES (48, 40, 1, CAST(N'2023-12-03T15:53:03.877' AS DateTime))
SET IDENTITY_INSERT [dbo].[storage] OFF
GO
ALTER TABLE [dbo].[account_role]  WITH CHECK ADD  CONSTRAINT [FK_account_role_account] FOREIGN KEY([id_account])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[account_role] CHECK CONSTRAINT [FK_account_role_account]
GO
ALTER TABLE [dbo].[account_role]  WITH CHECK ADD  CONSTRAINT [FK_account_role_role] FOREIGN KEY([id_role])
REFERENCES [dbo].[role] ([id])
GO
ALTER TABLE [dbo].[account_role] CHECK CONSTRAINT [FK_account_role_role]
GO
ALTER TABLE [dbo].[address_account]  WITH CHECK ADD  CONSTRAINT [FK_address_account_account] FOREIGN KEY([id_account])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[address_account] CHECK CONSTRAINT [FK_address_account_account]
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FK_cart_account] FOREIGN KEY([id_account])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FK_cart_account]
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FK_cart_product] FOREIGN KEY([id_product])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FK_cart_product]
GO
ALTER TABLE [dbo].[category]  WITH CHECK ADD  CONSTRAINT [FK_category_account] FOREIGN KEY([id_account])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[category] CHECK CONSTRAINT [FK_category_account]
GO
ALTER TABLE [dbo].[category_item]  WITH CHECK ADD  CONSTRAINT [FK_category_item_account] FOREIGN KEY([id_account])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[category_item] CHECK CONSTRAINT [FK_category_item_account]
GO
ALTER TABLE [dbo].[category_item]  WITH CHECK ADD  CONSTRAINT [FK_category_item_category] FOREIGN KEY([id_category])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[category_item] CHECK CONSTRAINT [FK_category_item_category]
GO
ALTER TABLE [dbo].[image_product]  WITH CHECK ADD  CONSTRAINT [FK_image_product_product] FOREIGN KEY([id_product])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[image_product] CHECK CONSTRAINT [FK_image_product_product]
GO
ALTER TABLE [dbo].[info_account]  WITH CHECK ADD  CONSTRAINT [FK_info_account_account] FOREIGN KEY([id_account])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[info_account] CHECK CONSTRAINT [FK_info_account_account]
GO
ALTER TABLE [dbo].[like_product]  WITH CHECK ADD  CONSTRAINT [FK_like_product_account1] FOREIGN KEY([id_account])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[like_product] CHECK CONSTRAINT [FK_like_product_account1]
GO
ALTER TABLE [dbo].[like_product]  WITH CHECK ADD  CONSTRAINT [FK_like_product_product1] FOREIGN KEY([id_product])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[like_product] CHECK CONSTRAINT [FK_like_product_product1]
GO
ALTER TABLE [dbo].[message]  WITH CHECK ADD  CONSTRAINT [FK_message_account1] FOREIGN KEY([sender])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[message] CHECK CONSTRAINT [FK_message_account1]
GO
ALTER TABLE [dbo].[message]  WITH CHECK ADD  CONSTRAINT [FK_message_account2] FOREIGN KEY([receiver])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[message] CHECK CONSTRAINT [FK_message_account2]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_oder] FOREIGN KEY([id_order])
REFERENCES [dbo].[tbl_order] ([id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_oder]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_storge] FOREIGN KEY([id_product])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_storge]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_category_item] FOREIGN KEY([id_category_item])
REFERENCES [dbo].[category_item] ([id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_category_item]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_shop] FOREIGN KEY([id_shop])
REFERENCES [dbo].[shop] ([id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_shop]
GO
ALTER TABLE [dbo].[rate]  WITH CHECK ADD  CONSTRAINT [FK_rate_cart] FOREIGN KEY([id_account])
REFERENCES [dbo].[cart] ([id])
GO
ALTER TABLE [dbo].[rate] CHECK CONSTRAINT [FK_rate_cart]
GO
ALTER TABLE [dbo].[rate]  WITH CHECK ADD  CONSTRAINT [FK_rate_product] FOREIGN KEY([id_product])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[rate] CHECK CONSTRAINT [FK_rate_product]
GO
ALTER TABLE [dbo].[shop]  WITH CHECK ADD  CONSTRAINT [FK_shop_account] FOREIGN KEY([id_account])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[shop] CHECK CONSTRAINT [FK_shop_account]
GO
ALTER TABLE [dbo].[shop_address]  WITH CHECK ADD  CONSTRAINT [FK_shop_address_shop] FOREIGN KEY([id_shop])
REFERENCES [dbo].[shop] ([id])
GO
ALTER TABLE [dbo].[shop_address] CHECK CONSTRAINT [FK_shop_address_shop]
GO
ALTER TABLE [dbo].[status_order]  WITH CHECK ADD  CONSTRAINT [FK_status_order_oder] FOREIGN KEY([id_order])
REFERENCES [dbo].[tbl_order] ([id])
GO
ALTER TABLE [dbo].[status_order] CHECK CONSTRAINT [FK_status_order_oder]
GO
ALTER TABLE [dbo].[status_order]  WITH CHECK ADD  CONSTRAINT [FK_status_order_status] FOREIGN KEY([id_status])
REFERENCES [dbo].[status] ([id])
GO
ALTER TABLE [dbo].[status_order] CHECK CONSTRAINT [FK_status_order_status]
GO
ALTER TABLE [dbo].[storage]  WITH CHECK ADD  CONSTRAINT [FK_storge_product] FOREIGN KEY([id_product])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[storage] CHECK CONSTRAINT [FK_storge_product]
GO
USE [master]
GO
ALTER DATABASE [db_diamond] SET  READ_WRITE 
GO
