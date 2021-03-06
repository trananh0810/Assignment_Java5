USE [master]
GO
/****** Object:  Database [dbJava4_Assignment]    Script Date: 12/10/2019 3:07:07 CH ******/
CREATE DATABASE [dbJava4_Assignment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbJava4_Assignment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\dbJava4_Assignment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbJava4_Assignment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\dbJava4_Assignment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [dbJava4_Assignment] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbJava4_Assignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbJava4_Assignment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbJava4_Assignment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbJava4_Assignment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbJava4_Assignment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbJava4_Assignment] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbJava4_Assignment] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [dbJava4_Assignment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbJava4_Assignment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbJava4_Assignment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbJava4_Assignment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbJava4_Assignment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbJava4_Assignment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbJava4_Assignment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbJava4_Assignment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbJava4_Assignment] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbJava4_Assignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbJava4_Assignment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbJava4_Assignment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbJava4_Assignment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbJava4_Assignment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbJava4_Assignment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbJava4_Assignment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbJava4_Assignment] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbJava4_Assignment] SET  MULTI_USER 
GO
ALTER DATABASE [dbJava4_Assignment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbJava4_Assignment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbJava4_Assignment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbJava4_Assignment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbJava4_Assignment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbJava4_Assignment] SET QUERY_STORE = OFF
GO
USE [dbJava4_Assignment]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 12/10/2019 3:07:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [ntext] NOT NULL,
	[image] [ntext] NULL,
	[content] [ntext] NOT NULL,
	[createdDate] [date] NOT NULL,
	[quantityView] [int] NULL,
	[userId] [int] NOT NULL,
	[categoryId] [int] NOT NULL,
 CONSTRAINT [PK__Blog__3213E83FCEE120DD] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryBlog]    Script Date: 12/10/2019 3:07:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryBlog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryProduct]    Script Date: 12/10/2019 3:07:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryProduct](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 12/10/2019 3:07:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ratingValue] [int] NOT NULL,
	[title] [ntext] NOT NULL,
	[content] [ntext] NOT NULL,
	[createdDate] [date] NOT NULL,
	[userId] [int] NOT NULL,
	[productId] [int] NOT NULL,
 CONSTRAINT [PK__Comment__3213E83F1F24FFB8] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 12/10/2019 3:07:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullName] [nvarchar](100) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[title] [ntext] NOT NULL,
	[content] [ntext] NOT NULL,
	[createdDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 12/10/2019 3:07:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderId] [int] NOT NULL,
	[productId] [int] NOT NULL,
	[price] [int] NOT NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/10/2019 3:07:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[createdDate] [date] NOT NULL,
	[address] [ntext] NOT NULL,
	[note] [ntext] NULL,
	[statusId] [int] NOT NULL,
	[userId] [int] NOT NULL,
 CONSTRAINT [PK__Orders__3213E83F8505CC61] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 12/10/2019 3:07:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/10/2019 3:07:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[image] [nvarchar](3000) NULL,
	[price] [int] NOT NULL,
	[detail] [ntext] NULL,
	[quantityView] [int] NULL,
	[createdDate] [date] NOT NULL,
	[categoryId] [int] NOT NULL,
 CONSTRAINT [PK__Product__3213E83FEAE7616E] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12/10/2019 3:07:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/10/2019 3:07:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullName] [nvarchar](100) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[phone] [varchar](15) NOT NULL,
	[password] [varchar](32) NOT NULL,
	[createdDate] [date] NOT NULL,
	[roleId] [int] NOT NULL,
 CONSTRAINT [PK__Users__3213E83F4B356C4A] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([id], [title], [image], [content], [createdDate], [quantityView], [userId], [categoryId]) VALUES (4, N'Những lợi ích tuyệt vời của dâu tây mà không phải ai cũng biết', N'nhung_loi_ich_tuyet_voi_cua_dau_tay.jpeg', N'Nội dung của Những lợi ích tuyệt vời của dâu tây mà không phải ai cũng biết', CAST(N'2019-07-14' AS Date), 12, 1, 1)
INSERT [dbo].[Blog] ([id], [title], [image], [content], [createdDate], [quantityView], [userId], [categoryId]) VALUES (5, N'Trà hoa cúc chuẩn vị thưởng thức vào mỗi sáng mai', N'tra_hoa_cuc_chuan_vi_thuong_thuc_vao_moi_buoi_som_mai.jpg', N'Nội dung của Trà hoa cúc chuẩn vị thưởng thức vào mỗi sáng mai', CAST(N'2019-07-14' AS Date), 2, 1, 2)
INSERT [dbo].[Blog] ([id], [title], [image], [content], [createdDate], [quantityView], [userId], [categoryId]) VALUES (6, N'Không cần lò nướng vẫn làm được bánh nếp cẩm xốp mềm thơm', N'khong_can_lo_nuong_van_lam_duoc_banh_nep_cam.jpg', N'Nội dung của Không cần lò nướng vẫn làm được bánh nếp cẩm xốp mềm thơm', CAST(N'2019-07-14' AS Date), 4, 1, 2)
INSERT [dbo].[Blog] ([id], [title], [image], [content], [createdDate], [quantityView], [userId], [categoryId]) VALUES (11, N'Tiêu đề cho test blog: Trải nghiệm các món ăn ngon', N'depositphotos_79596616-stock-illustration-auto-parts-logo-design-concept.jpg', N'<p style="text-align:center"><span style="font-size:18px"><span style="font-family:Verdana,Geneva,sans-serif"><em><strong>Nội d&ugrave;ng của test blog: trải nghiệm c&aacute;c m&oacute;n ăn ngon</strong></em></span></span></p>

<p style="text-align:center"><span style="font-size:18px"><span style="font-family:Verdana,Geneva,sans-serif"><em><strong><img alt="" src="listFileName" /><img alt="" src="https://cdn2.wpbeginner.com/wp-content/uploads/2019/01/choosethebestbloggingplatform.png" style="height:340px; width:550px" /></strong></em></span></span></p>
', CAST(N'2019-08-11' AS Date), 3, 1, 1)
SET IDENTITY_INSERT [dbo].[Blog] OFF
SET IDENTITY_INSERT [dbo].[CategoryBlog] ON 

INSERT [dbo].[CategoryBlog] ([id], [name]) VALUES (1, N'CHIA SẺ')
INSERT [dbo].[CategoryBlog] ([id], [name]) VALUES (2, N'CÔNG THỨC')
INSERT [dbo].[CategoryBlog] ([id], [name]) VALUES (10, N'LÀM ĐẸP')
SET IDENTITY_INSERT [dbo].[CategoryBlog] OFF
SET IDENTITY_INSERT [dbo].[CategoryProduct] ON 

INSERT [dbo].[CategoryProduct] ([id], [name]) VALUES (2, N'Bánh')
INSERT [dbo].[CategoryProduct] ([id], [name]) VALUES (4, N'Cà phê')
INSERT [dbo].[CategoryProduct] ([id], [name]) VALUES (3, N'Kem tươi')
INSERT [dbo].[CategoryProduct] ([id], [name]) VALUES (1, N'Trà')
SET IDENTITY_INSERT [dbo].[CategoryProduct] OFF
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([id], [ratingValue], [title], [content], [createdDate], [userId], [productId]) VALUES (1, 5, N'Test đánh giá', N'Tuyệt vời!!!', CAST(N'2019-07-28' AS Date), 1, 4)
INSERT [dbo].[Comment] ([id], [ratingValue], [title], [content], [createdDate], [userId], [productId]) VALUES (2, 4, N'Test đánh giá 2', N'Very good!!!', CAST(N'2019-07-28' AS Date), 1, 4)
INSERT [dbo].[Comment] ([id], [ratingValue], [title], [content], [createdDate], [userId], [productId]) VALUES (3, 1, N'Test đánh giá 3', N'Nội dung của test đánh giá 3', CAST(N'2019-07-28' AS Date), 1, 4)
INSERT [dbo].[Comment] ([id], [ratingValue], [title], [content], [createdDate], [userId], [productId]) VALUES (4, 5, N'Test đánh giá 4', N'Nội dung của test đánh giá 4', CAST(N'2019-07-28' AS Date), 1, 4)
INSERT [dbo].[Comment] ([id], [ratingValue], [title], [content], [createdDate], [userId], [productId]) VALUES (5, 5, N'Test đánh giá', N'Tuyệt vời!', CAST(N'2019-07-28' AS Date), 1, 1)
INSERT [dbo].[Comment] ([id], [ratingValue], [title], [content], [createdDate], [userId], [productId]) VALUES (8, 5, N'Test', N'Test bình luận', CAST(N'2019-08-07' AS Date), 1, 21)
INSERT [dbo].[Comment] ([id], [ratingValue], [title], [content], [createdDate], [userId], [productId]) VALUES (9, 5, N'Đánh giá', N'Món ăn tuyệt vời', CAST(N'2019-08-12' AS Date), 1, 13)
INSERT [dbo].[Comment] ([id], [ratingValue], [title], [content], [createdDate], [userId], [productId]) VALUES (10, 1, N'test comment', N'nội dung test comment', CAST(N'2019-09-24' AS Date), 10, 1)
INSERT [dbo].[Comment] ([id], [ratingValue], [title], [content], [createdDate], [userId], [productId]) VALUES (11, 3, N'test', N'tưedsfsdfsdf', CAST(N'2019-09-24' AS Date), 10, 1)
INSERT [dbo].[Comment] ([id], [ratingValue], [title], [content], [createdDate], [userId], [productId]) VALUES (12, 5, N'test 3', N'sdsdfsdfdf', CAST(N'2019-09-24' AS Date), 10, 1)
INSERT [dbo].[Comment] ([id], [ratingValue], [title], [content], [createdDate], [userId], [productId]) VALUES (13, 4, N'fdgdf', N'dfgfg', CAST(N'2019-09-25' AS Date), 10, 21)
INSERT [dbo].[Comment] ([id], [ratingValue], [title], [content], [createdDate], [userId], [productId]) VALUES (14, 1, N'fdgfdg', N'dfgdfg', CAST(N'2019-09-25' AS Date), 10, 21)
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([id], [fullName], [email], [title], [content], [createdDate]) VALUES (1, N'Tran Anh', N'fctamduong123456789@gmail.com', N'Test phản hồi', N'Tôi đang test phản hồi', CAST(N'2019-07-23' AS Date))
INSERT [dbo].[Feedback] ([id], [fullName], [email], [title], [content], [createdDate]) VALUES (2, N'Tran Anh', N'fctamduong123456789@gmail.com', N'test', N'test', CAST(N'2019-07-23' AS Date))
INSERT [dbo].[Feedback] ([id], [fullName], [email], [title], [content], [createdDate]) VALUES (3, N'Tran Anh', N'fctamduong123456789@gmail.com', N'test', N'test', CAST(N'2019-07-23' AS Date))
INSERT [dbo].[Feedback] ([id], [fullName], [email], [title], [content], [createdDate]) VALUES (4, N'Tran Anh', N'fctamduong123456789@gmail.com', N'test', N'test', CAST(N'2019-07-23' AS Date))
INSERT [dbo].[Feedback] ([id], [fullName], [email], [title], [content], [createdDate]) VALUES (6, N'Tran Anh', N'fctamduong123456789@gmail.com', N'Test phản hồi 1', N'Nội dung test phản hồi 1', CAST(N'2019-09-24' AS Date))
SET IDENTITY_INSERT [dbo].[Feedback] OFF
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [price], [quantity]) VALUES (2, 1, 4, 150000, 1)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [price], [quantity]) VALUES (3, 1, 1, 100000, 1)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [price], [quantity]) VALUES (4, 2, 2, 100000, 6)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [price], [quantity]) VALUES (5, 3, 1, 100000, 1)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [price], [quantity]) VALUES (6, 4, 4, 150000, 1)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [price], [quantity]) VALUES (7, 4, 1, 100000, 1)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [price], [quantity]) VALUES (8, 4, 10, 35000, 1)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [price], [quantity]) VALUES (9, 5, 8, 450000, 1)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [price], [quantity]) VALUES (10, 5, 15, 100000, 2)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [price], [quantity]) VALUES (11, 6, 4, 150000, 1)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [price], [quantity]) VALUES (12, 7, 4, 150000, 1)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [price], [quantity]) VALUES (13, 8, 4, 150000, 9)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [price], [quantity]) VALUES (14, 9, 4, 150000, 1)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [price], [quantity]) VALUES (15, 10, 1, 120000, 7)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [price], [quantity]) VALUES (16, 10, 2, 100000, 7)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [price], [quantity]) VALUES (17, 11, 4, 150000, 10)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [price], [quantity]) VALUES (18, 11, 2, 100000, 1)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [price], [quantity]) VALUES (19, 12, 4, 150000, 5)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [price], [quantity]) VALUES (20, 12, 3, 45000, 4)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [price], [quantity]) VALUES (21, 13, 4, 150000, 6)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [price], [quantity]) VALUES (22, 13, 13, 85000, 1)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [price], [quantity]) VALUES (23, 14, 4, 150000, 3)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [price], [quantity]) VALUES (24, 14, 2, 100000, 1)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [price], [quantity]) VALUES (25, 15, 4, 150000, 1)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [price], [quantity]) VALUES (26, 15, 13, 85000, 1)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [price], [quantity]) VALUES (27, 16, 4, 150000, 1)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [price], [quantity]) VALUES (28, 16, 13, 85000, 1)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [price], [quantity]) VALUES (29, 16, 2, 100000, 2)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [price], [quantity]) VALUES (30, 17, 4, 150000, 10)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [price], [quantity]) VALUES (31, 18, 4, 150000, 1)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [createdDate], [address], [note], [statusId], [userId]) VALUES (1, CAST(N'2019-07-28' AS Date), N'Ngõ 68 - Đường Phú Diễn - Bắc Từ Liêm - Hà Nội', N'Giao nhanh', 2, 1)
INSERT [dbo].[Orders] ([id], [createdDate], [address], [note], [statusId], [userId]) VALUES (2, CAST(N'2019-07-28' AS Date), N'Ngõ 68 - Đường Phú Diễn - Bắc Từ Liêm - Hà Nội', N'', 2, 1)
INSERT [dbo].[Orders] ([id], [createdDate], [address], [note], [statusId], [userId]) VALUES (3, CAST(N'2019-07-28' AS Date), N'Ngõ 68 - Đường Phú Diễn - Bắc Từ Liêm - Hà Nội', N'', 2, 1)
INSERT [dbo].[Orders] ([id], [createdDate], [address], [note], [statusId], [userId]) VALUES (4, CAST(N'2019-07-28' AS Date), N'Ngõ 68 - Đường Phú Diễn - Bắc Từ Liêm - Hà Nội', N'', 4, 1)
INSERT [dbo].[Orders] ([id], [createdDate], [address], [note], [statusId], [userId]) VALUES (5, CAST(N'2019-07-28' AS Date), N'Ngõ 68 - Đường Phú Diễn - Bắc Từ Liêm - Hà Nội', N'', 4, 1)
INSERT [dbo].[Orders] ([id], [createdDate], [address], [note], [statusId], [userId]) VALUES (6, CAST(N'2019-07-28' AS Date), N'Ngõ 68 - Đường Phú Diễn - Bắc Từ Liêm - Hà Nội', N'', 3, 1)
INSERT [dbo].[Orders] ([id], [createdDate], [address], [note], [statusId], [userId]) VALUES (7, CAST(N'2019-07-28' AS Date), N'Ngõ 68 - Đường Phú Diễn - Bắc Từ Liêm - Hà Nội', N'', 4, 1)
INSERT [dbo].[Orders] ([id], [createdDate], [address], [note], [statusId], [userId]) VALUES (8, CAST(N'2019-07-29' AS Date), N'Tam Dương - Vĩnh Phúc', N'Giao nhanh không bánh hỏng', 2, 10)
INSERT [dbo].[Orders] ([id], [createdDate], [address], [note], [statusId], [userId]) VALUES (9, CAST(N'2019-08-07' AS Date), N'Hà Nội', N'', 2, 1)
INSERT [dbo].[Orders] ([id], [createdDate], [address], [note], [statusId], [userId]) VALUES (10, CAST(N'2019-08-11' AS Date), N'Hà Nội', N'Giao nhanh', 4, 1)
INSERT [dbo].[Orders] ([id], [createdDate], [address], [note], [statusId], [userId]) VALUES (11, CAST(N'2019-08-12' AS Date), N'addsfdfsdfdsf', N'', 4, 1)
INSERT [dbo].[Orders] ([id], [createdDate], [address], [note], [statusId], [userId]) VALUES (12, CAST(N'2019-08-12' AS Date), N'ádfdsfdsf', N'', 4, 1)
INSERT [dbo].[Orders] ([id], [createdDate], [address], [note], [statusId], [userId]) VALUES (13, CAST(N'2019-08-12' AS Date), N'Cầu Diễn - Hà Nội', N'', 4, 1)
INSERT [dbo].[Orders] ([id], [createdDate], [address], [note], [statusId], [userId]) VALUES (14, CAST(N'2019-08-12' AS Date), N'Hà Nội', N'', 2, 10)
INSERT [dbo].[Orders] ([id], [createdDate], [address], [note], [statusId], [userId]) VALUES (15, CAST(N'2019-08-12' AS Date), N'Chung cư Bộ Công An - Phòng Bộ Trưởng', N'', 2, 21)
INSERT [dbo].[Orders] ([id], [createdDate], [address], [note], [statusId], [userId]) VALUES (16, CAST(N'2019-09-24' AS Date), N'Vĩnh Phúc', N'Giao thật nhanh', 2, 10)
INSERT [dbo].[Orders] ([id], [createdDate], [address], [note], [statusId], [userId]) VALUES (17, CAST(N'2019-09-24' AS Date), N'Cầu Diễn', N'Giao supper fast', 2, 10)
INSERT [dbo].[Orders] ([id], [createdDate], [address], [note], [statusId], [userId]) VALUES (18, CAST(N'2019-09-30' AS Date), N'xcvcxvcxv', N'xcvcxv', 2, 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[OrderStatus] ON 

INSERT [dbo].[OrderStatus] ([id], [name]) VALUES (1, N'Chờ xác nhận')
INSERT [dbo].[OrderStatus] ([id], [name]) VALUES (2, N'Đã xác nhận')
INSERT [dbo].[OrderStatus] ([id], [name]) VALUES (4, N'Hủy')
INSERT [dbo].[OrderStatus] ([id], [name]) VALUES (3, N'Thành công')
SET IDENTITY_INSERT [dbo].[OrderStatus] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [image], [price], [detail], [quantityView], [createdDate], [categoryId]) VALUES (1, N'Chocolate Iced', N'Chocolate Iced.jpg', 120000, N'Đây là miêu tả món ăn Chocolate Iced    ', 2, CAST(N'2019-08-02' AS Date), 2)
INSERT [dbo].[Product] ([id], [name], [image], [price], [detail], [quantityView], [createdDate], [categoryId]) VALUES (2, N'Sample Product', N'Sample Product.jpg', 100000, N'Đây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ăn', 1, CAST(N'2019-07-14' AS Date), 2)
INSERT [dbo].[Product] ([id], [name], [image], [price], [detail], [quantityView], [createdDate], [categoryId]) VALUES (3, N'Honey Wheat', N'Honey Wheat.jpg', 45000, N'Đây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ăn', 0, CAST(N'2019-07-14' AS Date), 2)
INSERT [dbo].[Product] ([id], [name], [image], [price], [detail], [quantityView], [createdDate], [categoryId]) VALUES (4, N'Strawberry Frappuccino', N'Strawberry Frappuccino.jpg', 150000, N'Đây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ăn', 52, CAST(N'2019-07-14' AS Date), 2)
INSERT [dbo].[Product] ([id], [name], [image], [price], [detail], [quantityView], [createdDate], [categoryId]) VALUES (5, N'Espresso Con Panna', N'Espresso Con Panna.jpg', 150000, N'Đây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ănĐây là nội dung mô tả món ăn', 0, CAST(N'2019-07-14' AS Date), 4)
INSERT [dbo].[Product] ([id], [name], [image], [price], [detail], [quantityView], [createdDate], [categoryId]) VALUES (6, N'Fruit Cream Puff', N'Fruit Cream Puff.jpg', 150000, NULL, 0, CAST(N'2019-07-14' AS Date), 2)
INSERT [dbo].[Product] ([id], [name], [image], [price], [detail], [quantityView], [createdDate], [categoryId]) VALUES (7, N'Sweet Potato Tart', N'Sweet Potato Tart.jpg', 50000, NULL, 0, CAST(N'2019-07-14' AS Date), 2)
INSERT [dbo].[Product] ([id], [name], [image], [price], [detail], [quantityView], [createdDate], [categoryId]) VALUES (8, N'Strawberry Cake', N'Strawberry Cake.jpg', 450000, N'Đây là miêu tả món ăn Strawberry Cake', 0, CAST(N'2019-08-07' AS Date), 2)
INSERT [dbo].[Product] ([id], [name], [image], [price], [detail], [quantityView], [createdDate], [categoryId]) VALUES (9, N'Lamington', N'lamington.jpg', 300000, NULL, 0, CAST(N'2019-07-14' AS Date), 2)
INSERT [dbo].[Product] ([id], [name], [image], [price], [detail], [quantityView], [createdDate], [categoryId]) VALUES (10, N'Lemon juice', N'Lemon juice.jpg', 35000, NULL, 0, CAST(N'2019-07-14' AS Date), 1)
INSERT [dbo].[Product] ([id], [name], [image], [price], [detail], [quantityView], [createdDate], [categoryId]) VALUES (11, N'Green Tea', N'Green Tea.jpg', 65000, NULL, 0, CAST(N'2019-07-14' AS Date), 1)
INSERT [dbo].[Product] ([id], [name], [image], [price], [detail], [quantityView], [createdDate], [categoryId]) VALUES (12, N'Milk and Cereal', N'Milk and Cereal.jpg', 40000, NULL, 0, CAST(N'2019-07-14' AS Date), 1)
INSERT [dbo].[Product] ([id], [name], [image], [price], [detail], [quantityView], [createdDate], [categoryId]) VALUES (13, N'Dark Chocolate', N'Dark Chocolate.jpg', 85000, NULL, 2, CAST(N'2019-07-14' AS Date), 3)
INSERT [dbo].[Product] ([id], [name], [image], [price], [detail], [quantityView], [createdDate], [categoryId]) VALUES (14, N'Rare Cheese', N'Rare Cheese.jpg', 200000, NULL, 0, CAST(N'2019-07-14' AS Date), 3)
INSERT [dbo].[Product] ([id], [name], [image], [price], [detail], [quantityView], [createdDate], [categoryId]) VALUES (15, N'Cà phê Cappuccino', N'Cà phê Cappuccino.jpg', 100000, NULL, 0, CAST(N'2019-07-14' AS Date), 4)
INSERT [dbo].[Product] ([id], [name], [image], [price], [detail], [quantityView], [createdDate], [categoryId]) VALUES (21, N'Bánh Bèo', N'settings-icon.png', 25000, N'Miêu tả Bánh bèo a', NULL, CAST(N'2019-08-11' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([id], [name]) VALUES (1, N'ADMIN')
INSERT [dbo].[Role] ([id], [name]) VALUES (2, N'CUSTOMER')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [fullName], [email], [phone], [password], [createdDate], [roleId]) VALUES (1, N'admin', N'admin@gmail.com', N'0987654321', N'e10adc3949ba59abbe56e057f20f883e', CAST(N'2019-08-02' AS Date), 1)
INSERT [dbo].[Users] ([id], [fullName], [email], [phone], [password], [createdDate], [roleId]) VALUES (10, N'Tran Anh', N'fctamduong123456789@gmail.com', N'0352315668', N'e10adc3949ba59abbe56e057f20f883e', CAST(N'2019-07-24' AS Date), 1)
INSERT [dbo].[Users] ([id], [fullName], [email], [phone], [password], [createdDate], [roleId]) VALUES (15, N'Vũ Tiến Trung', N'vutientrung@gmail.com', N'0985214565', N'e10adc3949ba59abbe56e057f20f883e', CAST(N'2019-08-02' AS Date), 2)
INSERT [dbo].[Users] ([id], [fullName], [email], [phone], [password], [createdDate], [roleId]) VALUES (16, N'Vũ Đức Phước', N'phuocvdph06996@fpt.edu.vn', N'0352666555', N'e10adc3949ba59abbe56e057f20f883e', CAST(N'2019-08-07' AS Date), 2)
INSERT [dbo].[Users] ([id], [fullName], [email], [phone], [password], [createdDate], [roleId]) VALUES (21, N'Nguyễn Ngọc Giang Nam', N'namnngph06970@fpt.edu.vn', N'0963025973', N'e10adc3949ba59abbe56e057f20f883e', CAST(N'2019-08-12' AS Date), 2)
INSERT [dbo].[Users] ([id], [fullName], [email], [phone], [password], [createdDate], [roleId]) VALUES (26, N'Nguyễn Ngô Tiến Thành', N'nguyenngotienthanh@gmail.com', N'0987654329', N'eeafb716f93fa090d7716749a6eefa72', CAST(N'2019-10-09' AS Date), 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Category__72E12F1BCEB2BCB7]    Script Date: 12/10/2019 3:07:08 CH ******/
ALTER TABLE [dbo].[CategoryBlog] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Category__72E12F1BA8887DF1]    Script Date: 12/10/2019 3:07:08 CH ******/
ALTER TABLE [dbo].[CategoryProduct] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__OrderSta__72E12F1BF17E69B4]    Script Date: 12/10/2019 3:07:08 CH ******/
ALTER TABLE [dbo].[OrderStatus] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Product__72E12F1BA2BC2948]    Script Date: 12/10/2019 3:07:08 CH ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [UQ__Product__72E12F1BA2BC2948] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Role__72E12F1B93232499]    Script Date: 12/10/2019 3:07:08 CH ******/
ALTER TABLE [dbo].[Role] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__AB6E61646594D220]    Script Date: 12/10/2019 3:07:08 CH ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UQ__Users__AB6E61646594D220] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__B43B145FBEFE165D]    Script Date: 12/10/2019 3:07:08 CH ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UQ__Users__B43B145FBEFE165D] UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Blog] ADD  CONSTRAINT [DF__Blog__createdDat__68487DD7]  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[Feedback] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF__Orders__createdD__5CD6CB2B]  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__created__5629CD9C]  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users__createdDa__4E88ABD4]  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK__Blog__categoryId__6A30C649] FOREIGN KEY([categoryId])
REFERENCES [dbo].[CategoryBlog] ([id])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK__Blog__categoryId__6A30C649]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK__Blog__userId__693CA210] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK__Blog__userId__693CA210]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK__Comment__product__70DDC3D8] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK__Comment__product__70DDC3D8]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK__Comment__userId__6FE99F9F] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK__Comment__userId__6FE99F9F]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__order__619B8048] FOREIGN KEY([orderId])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK__OrderDeta__order__619B8048]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__produ__628FA481] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK__OrderDeta__produ__628FA481]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__memberId__5EBF139D] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__memberId__5EBF139D]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__statusId__5DCAEF64] FOREIGN KEY([statusId])
REFERENCES [dbo].[OrderStatus] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__statusId__5DCAEF64]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__categor__571DF1D5] FOREIGN KEY([categoryId])
REFERENCES [dbo].[CategoryProduct] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__categor__571DF1D5]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK__Users__roleId__4F7CD00D] FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK__Users__roleId__4F7CD00D]
GO
/****** Object:  StoredProcedure [dbo].[sp_getTop4BcNhat]    Script Date: 12/10/2019 3:07:08 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_getTop4BcNhat]
AS
BEGIN
    SELECT TOP 4 dbo.Product.id, dbo.Product.name, dbo.Product.image,dbo.Product.price FROM dbo.Product
	INNER JOIN dbo.OrderDetail ON OrderDetail.productId = Product.id
	GROUP BY dbo.Product.id, dbo.Product.name, dbo.Product.image, dbo.Product.price
	ORDER BY SUM(dbo.OrderDetail.quantity) DESC
END
GO
USE [master]
GO
ALTER DATABASE [dbJava4_Assignment] SET  READ_WRITE 
GO
