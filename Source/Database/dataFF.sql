USE [master]
GO
/****** Object:  Database [FastFood]    Script Date: 6/4/2019 10:39:57 AM ******/
CREATE DATABASE [FastFood]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FastFood', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\FastFood.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FastFood_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\FastFood_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FastFood] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FastFood].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FastFood] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FastFood] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FastFood] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FastFood] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FastFood] SET ARITHABORT OFF 
GO
ALTER DATABASE [FastFood] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FastFood] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FastFood] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FastFood] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FastFood] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FastFood] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FastFood] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FastFood] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FastFood] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FastFood] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FastFood] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FastFood] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FastFood] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FastFood] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FastFood] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FastFood] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FastFood] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FastFood] SET RECOVERY FULL 
GO
ALTER DATABASE [FastFood] SET  MULTI_USER 
GO
ALTER DATABASE [FastFood] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FastFood] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FastFood] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FastFood] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FastFood] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FastFood', N'ON'
GO
USE [FastFood]
GO
/****** Object:  UserDefinedTableType [dbo].[lstcb_sp]    Script Date: 6/4/2019 10:39:57 AM ******/
CREATE TYPE [dbo].[lstcb_sp] AS TABLE(
	[MaSanPham] [int] NULL,
	[SoLuong] [int] NULL
)
GO
/****** Object:  Table [dbo].[ChiPhi]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiPhi](
	[MaChiPhi] [int] IDENTITY(1,1) NOT NULL,
	[GiaTien] [decimal](18, 0) NULL,
	[NgayTao] [datetime] NULL,
	[MaLoaiChiPhi] [int] NULL,
 CONSTRAINT [PK_ChiPhi] PRIMARY KEY CLUSTERED 
(
	[MaChiPhi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Combo]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Combo](
	[MaCombo] [int] IDENTITY(1,1) NOT NULL,
	[TenCombo] [nvarchar](50) NOT NULL,
	[DonGia] [decimal](18, 0) NOT NULL CONSTRAINT [DF_Combo_DonGia]  DEFAULT ((0)),
	[HinhAnh] [nvarchar](100) NULL,
	[TrangThai] [bit] NOT NULL CONSTRAINT [DF_Combo_TrangThai]  DEFAULT ((1)),
 CONSTRAINT [PK_Combo] PRIMARY KEY CLUSTERED 
(
	[MaCombo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ComBo_SanPham]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComBo_SanPham](
	[MaCombo] [int] NOT NULL,
	[MaSanPham] [int] NOT NULL,
	[SoLuong] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [int] NOT NULL,
	[MaKhuyenMai] [int] NULL,
	[MaCombo] [int] NULL,
	[TongTien] [decimal](18, 2) NOT NULL,
	[ThanhToan] [decimal](18, 2) NOT NULL,
	[DiaChi] [nvarchar](50) NULL,
	[ThoiGian] [datetime] NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhuyenMai]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuyenMai](
	[MaKhuyenMai] [int] IDENTITY(1,1) NOT NULL,
	[TenKhuyenMai] [nvarchar](250) NOT NULL,
	[ChietKhau] [float] NOT NULL,
	[ThoiGianBatDau] [date] NOT NULL,
	[ThoiGianKetThuc] [date] NOT NULL,
	[HinhAnh] [nvarchar](100) NULL,
 CONSTRAINT [PK_KhuyenMai] PRIMARY KEY CLUSTERED 
(
	[MaKhuyenMai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiChiPhi]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiChiPhi](
	[MaLoaiChiPhi] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiChiPhi] [nvarchar](250) NULL,
	[MoTa] [nvarchar](255) NULL,
	[MaChiNhanh] [int] NULL,
 CONSTRAINT [PK_LoaiChiPhi] PRIMARY KEY CLUSTERED 
(
	[MaLoaiChiPhi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLoaiSanPham] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiSanPham] [nvarchar](250) NOT NULL,
	[HinhAnh] [nvarchar](100) NULL,
 CONSTRAINT [PK_LoaiSanPham] PRIMARY KEY CLUSTERED 
(
	[MaLoaiSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSanPham] [int] IDENTITY(1,1) NOT NULL,
	[TenSanPham] [nvarchar](50) NOT NULL,
	[DonGia] [decimal](18, 0) NOT NULL,
	[MaLoaiSanPham] [int] NOT NULL,
	[HinhAnh] [varchar](100) NOT NULL,
	[MoTa] [ntext] NULL,
	[TrangThai] [bit] NOT NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaTaiKhoan] [int] IDENTITY(1,1) NOT NULL,
	[TenTaiKhoan] [nvarchar](255) NOT NULL,
	[MatKhau] [varchar](50) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[SDT] [varchar](20) NOT NULL,
	[QuyenHan] [int] NOT NULL,
	[KichHoat] [bit] NOT NULL,
	[DiaChi] [nvarchar](255) NOT NULL,
	[SoLanNhapSai] [tinyint] NOT NULL CONSTRAINT [DF_TaiKhoan_SoLanNhapSai]  DEFAULT ((0)),
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[MaTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ChiPhi] ON 

INSERT [dbo].[ChiPhi] ([MaChiPhi], [GiaTien], [NgayTao], [MaLoaiChiPhi]) VALUES (6, CAST(1000000 AS Decimal(18, 0)), CAST(N'2019-04-18 16:50:58.000' AS DateTime), 6)
INSERT [dbo].[ChiPhi] ([MaChiPhi], [GiaTien], [NgayTao], [MaLoaiChiPhi]) VALUES (11, CAST(1500000 AS Decimal(18, 0)), CAST(N'2019-04-18 16:50:58.000' AS DateTime), 6)
INSERT [dbo].[ChiPhi] ([MaChiPhi], [GiaTien], [NgayTao], [MaLoaiChiPhi]) VALUES (12, NULL, CAST(N'2019-05-23 10:46:45.220' AS DateTime), 6)
INSERT [dbo].[ChiPhi] ([MaChiPhi], [GiaTien], [NgayTao], [MaLoaiChiPhi]) VALUES (13, NULL, CAST(N'2019-05-30 09:40:41.117' AS DateTime), 26)
INSERT [dbo].[ChiPhi] ([MaChiPhi], [GiaTien], [NgayTao], [MaLoaiChiPhi]) VALUES (14, NULL, CAST(N'2019-05-30 16:25:07.250' AS DateTime), 6)
SET IDENTITY_INSERT [dbo].[ChiPhi] OFF
SET IDENTITY_INSERT [dbo].[Combo] ON 

INSERT [dbo].[Combo] ([MaCombo], [TenCombo], [DonGia], [HinhAnh], [TrangThai]) VALUES (1, N'Combo 1 người khỏe 2 người vui 12', CAST(123123 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Combo] ([MaCombo], [TenCombo], [DonGia], [HinhAnh], [TrangThai]) VALUES (21, N'Nghiện game', CAST(123213 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Combo] ([MaCombo], [TenCombo], [DonGia], [HinhAnh], [TrangThai]) VALUES (22, N'123123', CAST(123213 AS Decimal(18, 0)), N'636942005226744617menu_spicy_40off.png', 1)
INSERT [dbo].[Combo] ([MaCombo], [TenCombo], [DonGia], [HinhAnh], [TrangThai]) VALUES (23, N'aa', CAST(0 AS Decimal(18, 0)), N'63694207653410501851151563_183299985966139_6118346119069040640_n.jpg', 1)
INSERT [dbo].[Combo] ([MaCombo], [TenCombo], [DonGia], [HinhAnh], [TrangThai]) VALUES (24, N'aaa', CAST(123123 AS Decimal(18, 0)), N'636942076187040757menu_spicy_40off.png', 0)
INSERT [dbo].[Combo] ([MaCombo], [TenCombo], [DonGia], [HinhAnh], [TrangThai]) VALUES (25, N'Tình tính tang', CAST(456456 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Combo] ([MaCombo], [TenCombo], [DonGia], [HinhAnh], [TrangThai]) VALUES (26, N'Cuz I love u', CAST(54654 AS Decimal(18, 0)), N'636947506528013769menu_spicy_40off.png', 1)
INSERT [dbo].[Combo] ([MaCombo], [TenCombo], [DonGia], [HinhAnh], [TrangThai]) VALUES (27, N'yes', CAST(12 AS Decimal(18, 0)), N'636942009069671946menu_spicy_40off.png', 1)
INSERT [dbo].[Combo] ([MaCombo], [TenCombo], [DonGia], [HinhAnh], [TrangThai]) VALUES (28, N'123', CAST(12 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[Combo] ([MaCombo], [TenCombo], [DonGia], [HinhAnh], [TrangThai]) VALUES (29, N'123', CAST(12456456 AS Decimal(18, 0)), N'63693210138708084151151563_183299985966139_6118346119069040640_n.jpg', 1)
INSERT [dbo].[Combo] ([MaCombo], [TenCombo], [DonGia], [HinhAnh], [TrangThai]) VALUES (30, N'Show Time', CAST(123123 AS Decimal(18, 0)), N'636932077748344229Capture.PNG', 1)
SET IDENTITY_INSERT [dbo].[Combo] OFF
INSERT [dbo].[ComBo_SanPham] ([MaCombo], [MaSanPham], [SoLuong]) VALUES (1, 1, 4)
INSERT [dbo].[ComBo_SanPham] ([MaCombo], [MaSanPham], [SoLuong]) VALUES (1, 3, 7)
INSERT [dbo].[ComBo_SanPham] ([MaCombo], [MaSanPham], [SoLuong]) VALUES (21, 1, 345)
INSERT [dbo].[ComBo_SanPham] ([MaCombo], [MaSanPham], [SoLuong]) VALUES (26, 1, 1)
INSERT [dbo].[ComBo_SanPham] ([MaCombo], [MaSanPham], [SoLuong]) VALUES (22, 1, 345)
INSERT [dbo].[ComBo_SanPham] ([MaCombo], [MaSanPham], [SoLuong]) VALUES (22, 8, 234)
INSERT [dbo].[ComBo_SanPham] ([MaCombo], [MaSanPham], [SoLuong]) VALUES (22, 13, 2)
INSERT [dbo].[ComBo_SanPham] ([MaCombo], [MaSanPham], [SoLuong]) VALUES (24, 9, 3)
INSERT [dbo].[ComBo_SanPham] ([MaCombo], [MaSanPham], [SoLuong]) VALUES (27, 1, 12)
INSERT [dbo].[ComBo_SanPham] ([MaCombo], [MaSanPham], [SoLuong]) VALUES (25, 3, 12)
INSERT [dbo].[ComBo_SanPham] ([MaCombo], [MaSanPham], [SoLuong]) VALUES (27, 2, 12)
INSERT [dbo].[ComBo_SanPham] ([MaCombo], [MaSanPham], [SoLuong]) VALUES (28, 1, 12)
INSERT [dbo].[ComBo_SanPham] ([MaCombo], [MaSanPham], [SoLuong]) VALUES (29, 1, 12)
INSERT [dbo].[ComBo_SanPham] ([MaCombo], [MaSanPham], [SoLuong]) VALUES (30, 1, 231)
INSERT [dbo].[ComBo_SanPham] ([MaCombo], [MaSanPham], [SoLuong]) VALUES (30, 1, 123)
INSERT [dbo].[ComBo_SanPham] ([MaCombo], [MaSanPham], [SoLuong]) VALUES (27, 16, 12)
INSERT [dbo].[ComBo_SanPham] ([MaCombo], [MaSanPham], [SoLuong]) VALUES (23, 1, 12)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhuyenMai], [MaCombo], [TongTien], [ThanhToan], [DiaChi], [ThoiGian]) VALUES (1, NULL, 1, CAST(999999.00 AS Decimal(18, 2)), CAST(1000000000.00 AS Decimal(18, 2)), NULL, CAST(N'2018-08-03 00:00:00.000' AS DateTime))
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhuyenMai], [MaCombo], [TongTien], [ThanhToan], [DiaChi], [ThoiGian]) VALUES (2, 1, 1, CAST(50000000.00 AS Decimal(18, 2)), CAST(1000000000.00 AS Decimal(18, 2)), NULL, CAST(N'2018-08-03 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[KhuyenMai] ON 

INSERT [dbo].[KhuyenMai] ([MaKhuyenMai], [TenKhuyenMai], [ChietKhau], [ThoiGianBatDau], [ThoiGianKetThuc], [HinhAnh]) VALUES (1, N'Mùng 8/3', 8.21, CAST(N'2019-05-07' AS Date), CAST(N'2019-08-28' AS Date), N'636942055969357407menu_spicy_40off.png')
INSERT [dbo].[KhuyenMai] ([MaKhuyenMai], [TenKhuyenMai], [ChietKhau], [ThoiGianBatDau], [ThoiGianKetThuc], [HinhAnh]) VALUES (2, N'Km', 12, CAST(N'2019-05-22' AS Date), CAST(N'2019-05-22' AS Date), N'636941605968895928menu_spicy_40off.png')
INSERT [dbo].[KhuyenMai] ([MaKhuyenMai], [TenKhuyenMai], [ChietKhau], [ThoiGianBatDau], [ThoiGianKetThuc], [HinhAnh]) VALUES (3, N'That la nho be thoi', 12, CAST(N'2019-05-22' AS Date), CAST(N'2019-05-22' AS Date), N'636941606959608076menu_spicy_40off.png')
INSERT [dbo].[KhuyenMai] ([MaKhuyenMai], [TenKhuyenMai], [ChietKhau], [ThoiGianBatDau], [ThoiGianKetThuc], [HinhAnh]) VALUES (4, N'ád', 5.6, CAST(N'2019-05-22' AS Date), CAST(N'2019-05-22' AS Date), N'63694160842356986451151563_183299985966139_6118346119069040640_n.jpg')
INSERT [dbo].[KhuyenMai] ([MaKhuyenMai], [TenKhuyenMai], [ChietKhau], [ThoiGianBatDau], [ThoiGianKetThuc], [HinhAnh]) VALUES (5, N'Mở cửa hàng', 1, CAST(N'2019-05-30' AS Date), CAST(N'2019-05-31' AS Date), N'636948060914976708menu_spicy_40off.png')
SET IDENTITY_INSERT [dbo].[KhuyenMai] OFF
SET IDENTITY_INSERT [dbo].[LoaiChiPhi] ON 

INSERT [dbo].[LoaiChiPhi] ([MaLoaiChiPhi], [TenLoaiChiPhi], [MoTa], [MaChiNhanh]) VALUES (6, N'123', N'Nâng cấp cơ sở vật chất', 3)
INSERT [dbo].[LoaiChiPhi] ([MaLoaiChiPhi], [TenLoaiChiPhi], [MoTa], [MaChiNhanh]) VALUES (7, N'Lương', N'Lương', 1)
INSERT [dbo].[LoaiChiPhi] ([MaLoaiChiPhi], [TenLoaiChiPhi], [MoTa], [MaChiNhanh]) VALUES (8, N'Tổ chức sinh nhật', N'Lương Tổ chức sinh nhật', 1)
INSERT [dbo].[LoaiChiPhi] ([MaLoaiChiPhi], [TenLoaiChiPhi], [MoTa], [MaChiNhanh]) VALUES (9, N'Lương cứng', N'Lương1', 3)
INSERT [dbo].[LoaiChiPhi] ([MaLoaiChiPhi], [TenLoaiChiPhi], [MoTa], [MaChiNhanh]) VALUES (11, N'Lương', N'Lương 123', 3)
INSERT [dbo].[LoaiChiPhi] ([MaLoaiChiPhi], [TenLoaiChiPhi], [MoTa], [MaChiNhanh]) VALUES (12, N'Lương 121 ', N'Lương', 3)
INSERT [dbo].[LoaiChiPhi] ([MaLoaiChiPhi], [TenLoaiChiPhi], [MoTa], [MaChiNhanh]) VALUES (14, N'Lương 12', N'Lương', 1)
INSERT [dbo].[LoaiChiPhi] ([MaLoaiChiPhi], [TenLoaiChiPhi], [MoTa], [MaChiNhanh]) VALUES (15, N'Lương', N'Lương', 2)
INSERT [dbo].[LoaiChiPhi] ([MaLoaiChiPhi], [TenLoaiChiPhi], [MoTa], [MaChiNhanh]) VALUES (17, N'debugger', N'        debugger', 1)
INSERT [dbo].[LoaiChiPhi] ([MaLoaiChiPhi], [TenLoaiChiPhi], [MoTa], [MaChiNhanh]) VALUES (23, N'123123', N'123123', 1)
INSERT [dbo].[LoaiChiPhi] ([MaLoaiChiPhi], [TenLoaiChiPhi], [MoTa], [MaChiNhanh]) VALUES (24, N'Chi phí 1', NULL, 1)
INSERT [dbo].[LoaiChiPhi] ([MaLoaiChiPhi], [TenLoaiChiPhi], [MoTa], [MaChiNhanh]) VALUES (25, N'chi phí 1', N'123', 1)
INSERT [dbo].[LoaiChiPhi] ([MaLoaiChiPhi], [TenLoaiChiPhi], [MoTa], [MaChiNhanh]) VALUES (26, N'Chi phí khoản A', N'a
a', NULL)
SET IDENTITY_INSERT [dbo].[LoaiChiPhi] OFF
SET IDENTITY_INSERT [dbo].[LoaiSanPham] ON 

INSERT [dbo].[LoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham], [HinhAnh]) VALUES (1, N'Đồ uống', N'636942052479377298menu_spicy_40off.png')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham], [HinhAnh]) VALUES (2, N'Món tráng miệng', N'636942052590003040menu_spicy_40off.png')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham], [HinhAnh]) VALUES (3, N'Món Chính', NULL)
INSERT [dbo].[LoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham], [HinhAnh]) VALUES (4, N'Sản phẩm 1', N'636941544081408294menu_spicy_40off.png')
SET IDENTITY_INSERT [dbo].[LoaiSanPham] OFF
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MaLoaiSanPham], [HinhAnh], [MoTa], [TrangThai]) VALUES (1, N'asd123', CAST(123123234 AS Decimal(18, 0)), 1, N'63693210807384771651151563_183299985966139_6118346119069040640_n.jpg', N'asdasdsadgfd', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MaLoaiSanPham], [HinhAnh], [MoTa], [TrangThai]) VALUES (2, N'insertOrUpdate', CAST(465465465 AS Decimal(18, 0)), 1, N'636942052283489508menu_spicy_40off.png', N'insertOrUpdate', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MaLoaiSanPham], [HinhAnh], [MoTa], [TrangThai]) VALUES (3, N'Sản phẩm 01', CAST(12312321 AS Decimal(18, 0)), 1, N'636948135033655063menu_spicy_40off.png', N'Sản phâm 99', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MaLoaiSanPham], [HinhAnh], [MoTa], [TrangThai]) VALUES (5, N'Sản phẩm 02', CAST(99999 AS Decimal(18, 0)), 1, N'636948135098026172menu_spicy_40off.png', N'Sản phâm 99', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MaLoaiSanPham], [HinhAnh], [MoTa], [TrangThai]) VALUES (8, N'Sản phẩm 02', CAST(99999 AS Decimal(18, 0)), 1, N'63694813516111488551151563_183299985966139_6118346119069040640_n.jpg', N'Sản phâm 99', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MaLoaiSanPham], [HinhAnh], [MoTa], [TrangThai]) VALUES (9, N'Sản phẩm 02', CAST(99999 AS Decimal(18, 0)), 1, N'63694813521992679051151563_183299985966139_6118346119069040640_n.jpg', N'Sản phâm 99', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MaLoaiSanPham], [HinhAnh], [MoTa], [TrangThai]) VALUES (10, N'Sản phẩm 02', CAST(99999 AS Decimal(18, 0)), 1, N'63694813532245324751151563_183299985966139_6118346119069040640_n.jpg', N'Sản phâm 99', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MaLoaiSanPham], [HinhAnh], [MoTa], [TrangThai]) VALUES (11, N'Sản phẩm 02', CAST(99999 AS Decimal(18, 0)), 1, N'636948135385934198menu_spicy_40off.png', N'Sản phâm 99', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MaLoaiSanPham], [HinhAnh], [MoTa], [TrangThai]) VALUES (12, N'Sản phẩm 02', CAST(99999 AS Decimal(18, 0)), 1, N'../../Assets/images/63692917638825422851151563_183299985966139_6118346119069040640_n.jpg', N'Sản phâm 99', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MaLoaiSanPham], [HinhAnh], [MoTa], [TrangThai]) VALUES (13, N'Sản phẩm 02', CAST(99999 AS Decimal(18, 0)), 1, N'../../Assets/images/63692917638825422851151563_183299985966139_6118346119069040640_n.jpg', N'Sản phâm 99', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MaLoaiSanPham], [HinhAnh], [MoTa], [TrangThai]) VALUES (14, N'Sản phẩm 02', CAST(99999 AS Decimal(18, 0)), 1, N'../../Assets/images/63692917638825422851151563_183299985966139_6118346119069040640_n.jpg', N'Sản phâm 99', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MaLoaiSanPham], [HinhAnh], [MoTa], [TrangThai]) VALUES (15, N'Sản phẩm 1', CAST(123123123 AS Decimal(18, 0)), 1, N'636935250279247523menu_spicy_40off.png', N'sdf', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MaLoaiSanPham], [HinhAnh], [MoTa], [TrangThai]) VALUES (16, N'Sản phẩm 031', CAST(123123123 AS Decimal(18, 0)), 2, N'636935260005235827menu_spicy_40off.png', N'123123', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MaLoaiSanPham], [HinhAnh], [MoTa], [TrangThai]) VALUES (17, N'Sản phẩm 55', CAST(23213 AS Decimal(18, 0)), 1, N'636935265228314869menu_spicy_40off.png', N'á', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MaLoaiSanPham], [HinhAnh], [MoTa], [TrangThai]) VALUES (18, N'Sản phẩm 01', CAST(19999999 AS Decimal(18, 0)), 1, N'636941360913607198menu_spicy_40off.png', N'abc\nxxx', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MaLoaiSanPham], [HinhAnh], [MoTa], [TrangThai]) VALUES (19, N'replace', CAST(12312321 AS Decimal(18, 0)), 1, N'636941361466586253menu_spicy_40off.png', N'12312
123
123', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MaLoaiSanPham], [HinhAnh], [MoTa], [TrangThai]) VALUES (20, N'11', CAST(1 AS Decimal(18, 0)), 1, N'636948288847104587menu_spicy_40off.png', N'n', 1)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau], [GioiTinh], [SDT], [QuyenHan], [KichHoat], [DiaChi], [SoLanNhapSai]) VALUES (1, N'admin', N'123456', 1, N'0918279888', 0, 1, N'Hà Nội', 0)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau], [GioiTinh], [SDT], [QuyenHan], [KichHoat], [DiaChi], [SoLanNhapSai]) VALUES (2, N'nhanvien', N'123456', 1, N'0918279888', 2, 1, N'Ha noi', 0)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau], [GioiTinh], [SDT], [QuyenHan], [KichHoat], [DiaChi], [SoLanNhapSai]) VALUES (3, N'subadmin', N'123456', 1, N'0985732426', 1, 1, N'abc', 0)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau], [GioiTinh], [SDT], [QuyenHan], [KichHoat], [DiaChi], [SoLanNhapSai]) VALUES (7, N'user1', N'123456', 1, N'0918279888', 3, 1, N'Ha Noi', 0)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau], [GioiTinh], [SDT], [QuyenHan], [KichHoat], [DiaChi], [SoLanNhapSai]) VALUES (8, N'user2', N'123456', 0, N'0912498789', 1, 0, N'123456', 0)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau], [GioiTinh], [SDT], [QuyenHan], [KichHoat], [DiaChi], [SoLanNhapSai]) VALUES (9, N'a', N'1', 0, N'01234', 0, 0, N'1', 0)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau], [GioiTinh], [SDT], [QuyenHan], [KichHoat], [DiaChi], [SoLanNhapSai]) VALUES (10, N'123', N'123', 0, N'01231231231', 0, 1, N'asd', 0)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau], [GioiTinh], [SDT], [QuyenHan], [KichHoat], [DiaChi], [SoLanNhapSai]) VALUES (11, N'taikhoan2', N'123', 0, N'12312312', 0, 0, N'123', 0)
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
ALTER TABLE [dbo].[ChiPhi]  WITH CHECK ADD  CONSTRAINT [FK_ChiPhi_LoaiChiPhi] FOREIGN KEY([MaLoaiChiPhi])
REFERENCES [dbo].[LoaiChiPhi] ([MaLoaiChiPhi])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiPhi] CHECK CONSTRAINT [FK_ChiPhi_LoaiChiPhi]
GO
ALTER TABLE [dbo].[ComBo_SanPham]  WITH CHECK ADD  CONSTRAINT [FK_ComBo_SanPham_Combo] FOREIGN KEY([MaCombo])
REFERENCES [dbo].[Combo] ([MaCombo])
GO
ALTER TABLE [dbo].[ComBo_SanPham] CHECK CONSTRAINT [FK_ComBo_SanPham_Combo]
GO
ALTER TABLE [dbo].[ComBo_SanPham]  WITH CHECK ADD  CONSTRAINT [FK_ComBo_SanPham_SanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[ComBo_SanPham] CHECK CONSTRAINT [FK_ComBo_SanPham_SanPham]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhuyenMai] FOREIGN KEY([MaKhuyenMai])
REFERENCES [dbo].[KhuyenMai] ([MaKhuyenMai])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhuyenMai]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSanPham] FOREIGN KEY([MaLoaiSanPham])
REFERENCES [dbo].[LoaiSanPham] ([MaLoaiSanPham])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSanPham]
GO
/****** Object:  StoredProcedure [dbo].[CTChiPhi_GetAllBy]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CTChiPhi_GetAllBy]
	@pageNumber INT,
	@pageSize INT,
	@keyText NVARCHAR(255)
AS
BEGIN
	IF (@keyText = '' OR @keyText IS NULL) SET @keyText = NULL

	DECLARE @pageFrom INT,@pageTo INT 
	SET @pageFrom = ((@pageNumber -1) * @pageSize);
	
	SELECT *
	INTO #TempTable
	FROM dbo.ChiPhi
	WHERE @keyText IS NULL 
	OR GiaTien LIKE '%'+ @keyText +'%'
	
	SELECT * FROM #TempTable
	ORDER BY MaChiPhi
	OFFSET @pageFrom ROW
	FETCH NEXT @pageSize ROW ONLY

	SELECT COUNT(*) AS totalEntires
	FROM #TempTable
	DROP TABLE #TempTable
END


GO
/****** Object:  StoredProcedure [dbo].[CTChiPhi_Insert]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CTChiPhi_Insert]
	@MaChiPhi int,
	@GiaTien DECIMAL,
	@NgayTao DATETIME,
	@MaLoaiChiPhi int

AS
	INSERT INTO dbo.ChiPhi
	        ( GiaTien, NgayTao, MaLoaiChiPhi )
	VALUES  ( NULL, -- GiaTien - decimal
	          @NgayTao, -- NgayTao - datetime
	          @MaLoaiChiPhi  -- MaLoaiChiPhi - int
	          )
GO
/****** Object:  StoredProcedure [dbo].[CTChiPhi_Update]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CTChiPhi_Update]
	@MaChiPhi int,
	@GiaTien DECIMAL,
	@NgayTao DATETIME,
	@MaLoaiChiPhi int

AS
	UPDATE dbo.ChiPhi
	SET
		GiaTien = @GiaTien,
		NgayTao =@NgayTao,
		MaLoaiChiPhi=@MaLoaiChiPhi
	WHERE MaChiPhi = @MaChiPhi
GO
/****** Object:  StoredProcedure [dbo].[CTCombo_GetAllBy]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CTCombo_GetAllBy]
	@pageNumber INT,
	@pageSize INT,
	@keyText NVARCHAR(255)
AS
BEGIN
	IF (@keyText = '') SET @keyText = NULL

	DECLARE @pageFrom INT,@pageTo INT 
	SET @pageFrom = ((@pageNumber -1) * @pageSize);
	
	SELECT *
	INTO #TempTable
	FROM dbo.Combo
	WHERE @keyText IS NULL 
	OR TenCombo LIKE '%'+ @keyText +'%'
	
	SELECT *
	INTO #PaginationTb
	FROM #TempTable
	ORDER BY MaCombo
	OFFSET @pageFrom ROW 
	FETCH NEXT @pageSize ROW ONLY

	SELECT #PaginationTb.MaCombo,TenCombo,TenSanPham,SoLuong,ComBo_SanPham.MaSanPham,#PaginationTb.HinhAnh,#PaginationTb.DonGia,#PaginationTb.TrangThai
	FROM #PaginationTb JOIN dbo.ComBo_SanPham ON ComBo_SanPham.MaCombo = #PaginationTb.MaCombo
	JOIN dbo.SanPham ON SanPham.MaSanPham = ComBo_SanPham.MaSanPham


	SELECT COUNT(1) AS totalEntires
	FROM #TempTable
	DROP TABLE #TempTable
	DROP TABLE #PaginationTb

END


GO
/****** Object:  StoredProcedure [dbo].[CTCombo_Insert]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CTCombo_Insert]
	@MaCombo INT=null,
	@HinhAnh NVARCHAR(100)=null,
	@TenCombo nvarchar(50)=null,
	@DonGia DECIMAL,
	@TrangThai BIT,
	@sanPham lstcb_sp READONLY
AS
	BEGIN TRY
		BEGIN TRAN

		IF(@TenCombo = '' OR @TenCombo IS NULL)
			RAISERROR('Tên combo không được trống',16,1)
		INSERT [dbo].Combo
		        ( TenCombo,DonGia,HinhAnh,TrangThai )
		VALUES  ( @TenCombo,@DonGia,@HinhAnh,@TrangThai);

		DECLARE @id INT
		SET @id = @@IDENTITY

		INSERT INTO dbo.ComBo_SanPham
		        ( MaCombo, MaSanPham, SoLuong )
		SELECT @id AS MaCombo,MaSanPham,SoLuong FROM @sanPham
		COMMIT
	END TRY
	BEGIN CATCH
		DECLARE @error VARCHAR(MAX)
		SET @error = ERROR_MESSAGE()
		RAISERROR(@error,16,1)
		ROLLBACK
	END CATCH
RETURN

GO
/****** Object:  StoredProcedure [dbo].[CTComBo_SelectByLSP]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CTComBo_SelectByLSP]
@MaLoaiSanPham int
AS
BEGIN	
	
	SELECT Combo.MaCombo AS MaCB,TenComBo, dbo.Combo.DonGia AS DonGiaCB, dbo.Combo.HinhAnh AS HinhAnhCB, dbo.SanPham.MaSanPham AS MaSP, TenSanPham, SoLuong
	FROM dbo.Combo JOIN dbo.ComBo_SanPham ON ComBo_SanPham.MaCombo = Combo.MaCombo
	JOIN dbo.SanPham ON SanPham.MaSanPham = ComBo_SanPham.MaSanPham
	WHERE Combo.MaCombo IN (
		SELECT MaCombo
		FROM dbo.SanPham JOIN dbo.ComBo_SanPham ON ComBo_SanPham.MaSanPham = SanPham.MaSanPham
		WHERE @MaLoaiSanPham =MaLoaiSanPham
	)
END

GO
/****** Object:  StoredProcedure [dbo].[CTCombo_SelectByPrimaryKey]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CTCombo_SelectByPrimaryKey]
	@MaCombo int
AS
	
	SELECT *
	INTO #TempTable
	FROM dbo.Combo
	WHERE MaCombo = @MaCombo

	SELECT #TempTable.MaCombo,TenCombo,TenSanPham,SoLuong,ComBo_SanPham.MaSanPham,#TempTable.DonGia,#TempTable.HinhAnh,#TempTable.TrangThai
	FROM #TempTable JOIN dbo.ComBo_SanPham ON ComBo_SanPham.MaCombo = #TempTable.MaCombo
	JOIN dbo.SanPham ON SanPham.MaSanPham = ComBo_SanPham.MaSanPham
	
RETURN

GO
/****** Object:  StoredProcedure [dbo].[CTCombo_Update]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CTCombo_Update]
	@MaCombo INT,
	@HinhAnh NVARCHAR(100)=null,
	@TenCombo nvarchar(50)=null,
	@TrangThai BIT,
	@DonGia DECIMAL=null,
	@sanPham lstcb_sp READONLY
AS
	BEGIN TRY
		BEGIN TRAN

		IF(@TenCombo IS NULL)
			RAISERROR('Tên combo không được trống',16,1)

		IF(@DonGia IS NULL)
			RAISERROR('Giá combo không được trống',16,1)
	UPDATE [dbo].Combo
	SET
		[TenCombo] = @TenCombo,
		[DonGia] = @DonGia,
		[HinhAnh] = @HinhAnh,
		[TrangThai]=@TrangThai
	WHERE 
		MaCombo = @MaCombo

	DELETE FROM dbo.ComBo_SanPham WHERE MaCombo = @MaCombo

		INSERT INTO dbo.ComBo_SanPham
		        ( MaCombo, MaSanPham, SoLuong )
		SELECT @MaCombo AS MaCombo,MaSanPham,SoLuong FROM @sanPham
		COMMIT
	END TRY
	BEGIN CATCH
		DECLARE @error NVARCHAR(100)
		SET @error = ERROR_MESSAGE()
		RAISERROR(@error,16,1)
		ROLLBACK
	END CATCH
RETURN

GO
/****** Object:  StoredProcedure [dbo].[CTKhuyenmai_GetAllBy]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CTKhuyenmai_GetAllBy]
	@pageNumber INT,
	@pageSize INT,
	@keyText NVARCHAR(255)
AS
BEGIN
	IF (@keyText = '' OR @keyText IS NULL) SET @keyText = NULL

	DECLARE @pageFrom INT,@pageTo INT 
	SET @pageFrom = ((@pageNumber -1) * @pageSize);
	
	SELECT *
	INTO #TempTable
	FROM dbo.KhuyenMai
	WHERE @keyText IS NULL 
	OR TenKhuyenMai LIKE '%'+ @keyText +'%'
	OR ChietKhau LIKE '%'+ @keyText +'%'
	OR ThoiGianBatDau LIKE '%'+ @keyText +'%'
	OR ThoiGianKetThuc LIKE '%'+ @keyText +'%'


	
	SELECT * FROM #TempTable
	ORDER BY MaKhuyenMai
	OFFSET @pageFrom ROW
	FETCH NEXT @pageSize ROW ONLY

	SELECT COUNT(*) AS totalEntires
	FROM #TempTable
	DROP TABLE #TempTable
END


GO
/****** Object:  StoredProcedure [dbo].[CTKhuyenMai_Insert]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CTKhuyenMai_Insert]
	@MaKhuyenMai int,
	@TenKhuyenMai nvarchar(250) ,
	@ChietKhau float ,
	@ThoiGianBatDau date ,
	@ThoiGianKetThuc date ,
	@HinhAnh nvarchar(100) = null 

AS
	INSERT [dbo].[KhuyenMai]
	(
		[TenKhuyenMai],
		[ChietKhau],
		[ThoiGianBatDau],
		[ThoiGianKetThuc],
		[HinhAnh]

	)
	VALUES
	(
		@TenKhuyenMai,
		@ChietKhau,
		@ThoiGianBatDau,
		@ThoiGianKetThuc,
		@HinhAnh

	)

GO
/****** Object:  StoredProcedure [dbo].[CTKhuyenMai_SelectAll]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CTKhuyenMai_SelectAll]
AS
SELECT * FROM dbo.KhuyenMai
RETURN
GO
/****** Object:  StoredProcedure [dbo].[CTKhuyenMai_Update]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CTKhuyenMai_Update]
	@MaKhuyenMai int,
	@TenKhuyenMai nvarchar(250),
	@ChietKhau float,
	@ThoiGianBatDau date,
	@ThoiGianKetThuc date,
	@HinhAnh nvarchar(100) = null

AS
	UPDATE [dbo].[KhuyenMai]
	SET
		[TenKhuyenMai] = @TenKhuyenMai,
		[ChietKhau] = @ChietKhau,
		[ThoiGianBatDau] = @ThoiGianBatDau,
		[ThoiGianKetThuc] = @ThoiGianKetThuc,
		[HinhAnh] = @HinhAnh
	WHERE 
		[MaKhuyenMai] = @MaKhuyenMai
RETURN

GO
/****** Object:  StoredProcedure [dbo].[CTLoaiChiPhi_DeleteByPrimaryKey]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CTLoaiChiPhi_DeleteByPrimaryKey]
	@MaLoaiChiPhi int
AS
	DELETE FROM [dbo].[LoaiChiPhi]
	WHERE 
		MaLoaiChiPhi = @MaLoaiChiPhi
RETURN

GO
/****** Object:  StoredProcedure [dbo].[CTLoaiChiPhi_GetAllBy]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CTLoaiChiPhi_GetAllBy]
	@pageNumber INT,
	@pageSize INT,
	@keyText NVARCHAR(255)

AS
BEGIN
	
	IF (@keyText = '' OR @keyText IS NULL) SET @keyText = NULL

	DECLARE @pageFrom INT,@pageTo INT 
	SET @pageFrom = ((@pageNumber -1) * @pageSize);
	DECLARE @totalRows INT;
	
	SELECT *
	INTO #TempTable
	FROM dbo.LoaiChiPhi
	WHERE @keyText IS NULL 
	OR TenLoaiChiPhi LIKE '%'+ @keyText +'%'
	OR MoTa LIKE '%'+ @keyText +'%'
	
	SELECT * FROM #TempTable
	ORDER BY MaLoaiChiPhi
	OFFSET @pageFrom ROW
	FETCH NEXT @pageSize ROW ONLY

	SELECT COUNT(*) AS totalEntires
	FROM #TempTable
	DROP TABLE #TempTable
END 


GO
/****** Object:  StoredProcedure [dbo].[CTLoaiChiPhi_Insert]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CTLoaiChiPhi_Insert]
	@MaLoaiChiPhi INT=null,
	@TenLoaiChiPhi nvarchar(250) = null ,
	@MoTa nvarchar(255) = null 

AS
	BEGIN TRY
		BEGIN TRAN
		IF(@TenLoaiChiPhi = '' OR @TenLoaiChiPhi IS NULL)
			RAISERROR('Tên Loại Chi Phí không được trống',16,1)
		INSERT [dbo].[LoaiChiPhi]
		(
			[TenLoaiChiPhi],
			[MoTa]

		)
		VALUES
		(
			@TenLoaiChiPhi,
			@MoTa

		)
		COMMIT
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
		ROLLBACK
	END CATCH
RETURN

GO
/****** Object:  StoredProcedure [dbo].[CTLoaiChiPhi_SelectAll]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CTLoaiChiPhi_SelectAll]
AS
	SELECT *
	FROM [dbo].[LoaiChiPhi]
RETURN

GO
/****** Object:  StoredProcedure [dbo].[CTLoaiChiPhi_Update]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CTLoaiChiPhi_Update]
	@MaLoaiChiPhi int,
	@TenLoaiChiPhi nvarchar(250) = null,
	@MoTa nvarchar(255) = NULL

AS
BEGIN
	BEGIN TRAN
		IF(@TenLoaiChiPhi = '' OR @TenLoaiChiPhi IS NULL)
		BEGIN
			RAISERROR('Tên Loại Chi Phí không được trống',16,1)
			ROLLBACK
			RETURN
		END

		UPDATE [dbo].[LoaiChiPhi]
		SET
			[TenLoaiChiPhi] = @TenLoaiChiPhi,
			[MoTa] = @MoTa
		WHERE 
			[MaLoaiChiPhi] = @MaLoaiChiPhi
		COMMIT
END


GO
/****** Object:  StoredProcedure [dbo].[CTLoaiSanPham_GetAllBy]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[CTLoaiSanPham_GetAllBy]
	@pageNumber INT,
	@pageSize INT,
	@keyText NVARCHAR(255)
AS
BEGIN
	IF (@keyText = '' OR @keyText IS NULL) SET @keyText = NULL

	DECLARE @pageFrom INT,@pageTo INT 
	SET @pageFrom = ((@pageNumber -1) * @pageSize);
	
	SELECT *
	INTO #TempTable
	FROM dbo.LoaiSanPham
	WHERE @keyText IS NULL 
	OR TenLoaiSanPham LIKE '%'+ @keyText +'%'
	
	SELECT * FROM #TempTable
	ORDER BY MaLoaiSanPham
	OFFSET @pageFrom ROW
	FETCH NEXT @pageSize ROW ONLY

	SELECT COUNT(*) AS totalEntires
	FROM #TempTable
	DROP TABLE #TempTable
END


GO
/****** Object:  StoredProcedure [dbo].[CTLoaiSanPham_Insert]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[CTLoaiSanPham_Insert]
(
	@MaLoaiSanPham INT,
	@TenLoaiSanPham NVARCHAR(max),
	@HinhAnh NVARCHAR(100)
)
AS BEGIN
   	INSERT INTO dbo.LoaiSanPham
   	        ( TenLoaiSanPham ,HinhAnh)
   	VALUES  ( @TenLoaiSanPham,@HinhAnh
   	          )
   END
GO
/****** Object:  StoredProcedure [dbo].[CTLoaiSanPham_SelectAll]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CTLoaiSanPham_SelectAll]
AS
	SELECT *
	FROM [dbo].LoaiSanPham
RETURN

GO
/****** Object:  StoredProcedure [dbo].[CTLoaiSanPham_Update]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[CTLoaiSanPham_Update]
(
	@MaLoaiSanPham INT,
	@TenLoaiSanPham NVARCHAR(max),
	@HinhAnh NVARCHAR(100)
)
AS BEGIN
   UPDATE dbo.LoaiSanPham
   SET TenLoaiSanPham = @TenLoaiSanPham,HinhAnh = @HinhAnh
   WHERE MaLoaiSanPham = @MaLoaiSanPham
   END
GO
/****** Object:  StoredProcedure [dbo].[CTReport_Dashboard_Chart]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[CTReport_Dashboard_Chart]
AS
BEGIN
	DECLARE @NgayBatDau DATE,@NgayKetThuc DATE

	SET @NgayKetThuc = GETDATE()
	SET @NgayBatDau = FORMAT(DATEADD(MONTH,-12, @NgayKetThuc),'yyyy/MM/01')

	;WITH CTE AS
	(	
		SELECT @NgayKetThuc lstMonth
		UNION ALL
		SELECT DATEADD(MONTH,-1,lstMonth)
		FROM CTE
		WHERE FORMAT(CTE.lstMonth,'yyyy/MM/01') >@NgayBatDau
	),ChiPhi AS (
		SELECT MONTH(NgayTao) AS lstMonth, SUM(GiaTien) AS ChiPhi
		FROM dbo.ChiPhi JOIN dbo.LoaiChiPhi ON LoaiChiPhi.MaLoaiChiPhi = ChiPhi.MaLoaiChiPhi
		WHERE NgayTao BETWEEN @NgayBatDau AND @NgayKetThuc
		GROUP BY MONTH(NgayTao)
	), DoanhThu AS (
		SELECT MONTH(ThoiGian) AS lstMonth, SUM(TongTien - TongTien * COALESCE(dbo.KhuyenMai.ChietKhau,0) /100) AS DoanhThu
		FROM dbo.HoaDon LEFT JOIN dbo.KhuyenMai ON KhuyenMai.MaKhuyenMai = HoaDon.MaKhuyenMai
		WHERE ThoiGian BETWEEN @NgayBatDau AND @NgayKetThuc
		GROUP BY MONTH(ThoiGian)
	)

		SELECT FORMAT(CTE.lstMonth,'MM/yyyy') AS ThoiGian,COALESCE(CONVERT(FLOAT,DoanhThu.DoanhThu),0) AS DoanhThu,COALESCE(CONVERT(FLOAT,ChiPhi.ChiPhi),0) AS ChiPhi
		FROM CTE LEFT JOIN ChiPhi ON ChiPhi.lstMonth = MONTH(CTE.lstMonth)
		LEFT JOIN DoanhThu ON DoanhThu.lstMonth =  MONTH(CTE.lstMonth)
		
END
GO
/****** Object:  StoredProcedure [dbo].[CTReport_Dashboard_Overview]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[CTReport_Dashboard_Overview]
AS
	BEGIN
		DECLARE @curDate DATE
		SET @curDate = GETDATE()

		SELECT 
			(SELECT COUNT(1) FROM dbo.TaiKhoan) TaiKhoan,
			(SELECT COUNT(1) FROM dbo.SanPham) SanPham,
			(SELECT COUNT(1) FROM dbo.Combo) Combo,
			(SELECT COUNT(1) FROM dbo.KhuyenMai WHERE @curDate BETWEEN ThoiGianBatDau AND ThoiGianKetThuc ) AS KhuyenMai

	END
GO
/****** Object:  StoredProcedure [dbo].[CTSanPham_GetAllBy]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CTSanPham_GetAllBy]
	@pageNumber INT,
	@pageSize INT,
	@keyText NVARCHAR(255)
AS
BEGIN
	IF (@keyText = '' OR @keyText IS NULL) SET @keyText = NULL

	DECLARE @pageFrom INT,@pageTo INT 
	SET @pageFrom = ((@pageNumber -1) * @pageSize);
	
	SELECT *
	INTO #TempTable
	FROM dbo.SanPham
	WHERE @keyText IS NULL 
	OR TenSanPham LIKE '%'+ @keyText +'%'
	OR DonGia LIKE '%'+ @keyText +'%'
	OR MoTa LIKE '%'+ @keyText +'%'
	
	SELECT * FROM #TempTable
	ORDER BY MaSanPham
	OFFSET @pageFrom ROW
	FETCH NEXT @pageSize ROW ONLY

	SELECT COUNT(*) AS totalEntires
	FROM #TempTable
	DROP TABLE #TempTable
END


GO
/****** Object:  StoredProcedure [dbo].[CTSanPham_Insert]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CTSanPham_Insert]
	@MaSanPham int,
	@TenSanPham nvarchar(50) ,
	@DonGia decimal ,
	@MaLoaiSanPham int ,
	@HinhAnh varchar(250) ,
	@MoTa ntext = null ,
	@TrangThai bit

AS
	INSERT [dbo].[SanPham]
	(
		[TenSanPham],
		[DonGia],
		[MaLoaiSanPham],
		[HinhAnh],
		[MoTa],
		[TrangThai]

	)
	VALUES
	(
		@TenSanPham,
		@DonGia,
		@MaLoaiSanPham,
		@HinhAnh,
		@MoTa,
		@TrangThai

	)
GO
/****** Object:  StoredProcedure [dbo].[CTSanPham_SelectAll]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CTSanPham_SelectAll]
AS
	SELECT MaSanPham,TenSanPham
	FROM [dbo].SanPham
RETURN

GO
/****** Object:  StoredProcedure [dbo].[CTSanPham_SelectByLSP]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CTSanPham_SelectByLSP]
@MaLoaiSanPham INT
AS
BEGIN
	SELECT  TenLoaiSanPham,TenSanPham, MaSanPham, DonGia, MoTa, dbo.SanPham.HinhAnh, TrangThai
	FROM dbo.SanPham JOIN dbo.LoaiSanPham ON LoaiSanPham.MaLoaiSanPham = SanPham.MaLoaiSanPham
	WHERE LoaiSanPham.MaLoaiSanPham LIKE @MaLoaiSanPham AND TrangThai =1
END
GO
/****** Object:  StoredProcedure [dbo].[CTSanPham_SelectByPrimaryKey]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CTSanPham_SelectByPrimaryKey]
@MaSanPham INT
AS
BEGIN
SELECT * FROM dbo.SanPham
WHERE MaSanPham = @MaSanPham AND TrangThai =1

END
GO
/****** Object:  StoredProcedure [dbo].[CTSanPham_Update]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CTSanPham_Update]
	@MaSanPham int,
	@TenSanPham nvarchar(50),
	@DonGia decimal,
	@MaLoaiSanPham int,
	@HinhAnh varchar(250),
	@MoTa ntext = NULL,
	@TrangThai bit

AS
	UPDATE [dbo].[SanPham]
	SET
		[TenSanPham] = @TenSanPham,
		[DonGia] = @DonGia,
		[MaLoaiSanPham] = @MaLoaiSanPham,
		[HinhAnh] = @HinhAnh,
		[MoTa] = @MoTa,
		[TrangThai] = @TrangThai
	WHERE 
		[MaSanPham] = @MaSanPham
RETURN

GO
/****** Object:  StoredProcedure [dbo].[CTTaiKhoan_CheckExistLogin]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[CTTaiKhoan_CheckExistLogin]
	@TenTaiKhoan varchar(255),
	@MatKhau VARCHAR(50)
AS
BEGIN
	DECLARE @times INT
	DECLARE @id INT
	DECLARE @pass VARCHAR(50)
	DECLARE @active VARCHAR(50)

	SELECT TOP 1  @times = SoLanNhapSai,@pass = MatKhau,@id=MaTaiKhoan,@active = KichHoat
	FROM [dbo].TaiKhoan
	WHERE TenTaiKhoan = @TenTaiKhoan

	IF(@times > 2)
		BEGIN
			UPDATE dbo.TaiKhoan
			SET SoLanNhapSai = 0,KichHoat = 0
			WHERE MaTaiKhoan = @id

			 RAISERROR('Tài khoản đã bị khóa! Vui lòng liên hệ admin để kích hoạt lại',16,1);
			 RETURN;
		END
	
	IF(@active = 0)
		BEGIN
			 RAISERROR('Tài khoản đã bị khóa! Vui lòng liên hệ admin để kích hoạt lại',16,1);
			 RETURN;
		END
		 
	IF(@pass <> @MatKhau) 
		BEGIN
			UPDATE dbo.TaiKhoan
			SET SoLanNhapSai = @times +1
			WHERE MaTaiKhoan = @id

			RAISERROR('Mật khẩu không chính xác',16,1);
			RETURN;
		END
	ELSE
		BEGIN
			UPDATE dbo.TaiKhoan
			SET SoLanNhapSai = 0
			WHERE MaTaiKhoan = @id
		END
	SELECT TOP 1 *
	FROM [dbo].TaiKhoan
	WHERE TenTaiKhoan = @TenTaiKhoan AND MatKhau = @MatKhau
END
GO
/****** Object:  StoredProcedure [dbo].[CTTaiKhoan_DeleteByPrimaryKey]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CTTaiKhoan_DeleteByPrimaryKey]
	@MaTaiKhoan int
AS
	DELETE FROM [dbo].[TaiKhoan]
	WHERE 
		[MaTaiKhoan] = @MaTaiKhoan
RETURN

GO
/****** Object:  StoredProcedure [dbo].[CTTaiKhoan_GetAllBy]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CTTaiKhoan_GetAllBy]
	@pageNumber INT,
	@pageSize INT,
	@keyText NVARCHAR(255),
	@QuyenHan INT 
AS
BEGIN
	IF (@keyText = '' OR @keyText IS NULL) SET @keyText = NULL

	DECLARE @pageFrom INT,@pageTo INT 
	SET @pageFrom = ((@pageNumber -1) * @pageSize);
	
	SELECT *
	INTO #TempTable
	FROM dbo.TaiKhoan
	WHERE (@keyText IS NULL 
	OR TenTaiKhoan LIKE '%'+ @keyText +'%'
	OR SDT LIKE '%'+ @keyText +'%'
	OR DiaChi LIKE '%'+ @keyText +'%')
	AND QuyenHan >= @QuyenHan


	SELECT * FROM #TempTable
	ORDER BY MaTaiKhoan
	OFFSET @pageFrom ROW
	FETCH NEXT @pageSize ROW ONLY

	SELECT COUNT(*) AS totalEntires
	FROM #TempTable
	DROP TABLE #TempTable
END


GO
/****** Object:  StoredProcedure [dbo].[CTTaiKhoan_Insert]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CTTaiKhoan_Insert]
	@MaTaiKhoan int,
	@TenTaiKhoan nvarchar(255) = null ,
	@MatKhau nvarchar(50) = null ,
	@GioiTinh bit = null ,
	@SDT varchar(20) = null ,
	@QuyenHan int = null ,
	@KichHoat bit = null ,
	@DiaChi nvarchar(255) = null 

AS
	INSERT [dbo].[TaiKhoan]
	(
		[TenTaiKhoan],
		[MatKhau],
		[GioiTinh],
		[SDT],
		[QuyenHan],
		[KichHoat],
		[DiaChi]

	)
	VALUES
	(
		@TenTaiKhoan,
		@MatKhau,
		@GioiTinh,
		@SDT,
		@QuyenHan,
		@KichHoat,
		@DiaChi

	)

RETURN

GO
/****** Object:  StoredProcedure [dbo].[CTTaiKhoan_Update]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CTTaiKhoan_Update]
	@MaTaiKhoan int,
	@TenTaiKhoan nvarchar(255) = null,
	@MatKhau nvarchar(50) = null,
	@GioiTinh bit = null,
	@SDT varchar(20) = null,
	@QuyenHan int = null,
	@KichHoat bit = null,
	@DiaChi nvarchar(255) = null

AS
	UPDATE [dbo].[TaiKhoan]
	SET
		[TenTaiKhoan] = @TenTaiKhoan,
		[MatKhau] = @MatKhau,
		[GioiTinh] = @GioiTinh,
		[SDT] = @SDT,
		[QuyenHan] = @QuyenHan,
		[KichHoat] = @KichHoat,
		[DiaChi] = @DiaChi
	WHERE 
		[MaTaiKhoan] = @MaTaiKhoan
RETURN

GO
/****** Object:  StoredProcedure [dbo].[CTTopic_GetAll]    Script Date: 6/4/2019 10:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[CTTopic_GetAll]
@MaGV INT,
@MaNamHoc INT 
AS
BEGIN
	SELECT DeTaiNghienCuuKHCN.id,TenDeTai
	FROM dbo.DeTaiNghienCuuKHCN
	INNER JOIN dbo.GiaoVien_DeTaiNghienCuuKHCN ON GiaoVien_DeTaiNghienCuuKHCN.DeTai_id = DeTaiNghienCuuKHCN.id
	WHERE DeTaiNghienCuuKHCN.id NOT IN(
		SELECT DeTai_id
		FROM dbo.GiaoVien_DeTaiNghienCuuKHCN
		WHERE GiaoVien_id = @MaGV AND NamHoc_id = @MaNamHoc
	)
END


GO
USE [master]
GO
ALTER DATABASE [FastFood] SET  READ_WRITE 
GO
