USE [master]
GO
/****** Object:  Database [FastFood]    Script Date: 6/30/2019 11:13:02 PM ******/
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
/****** Object:  UserDefinedTableType [dbo].[lstcb_sp]    Script Date: 6/30/2019 11:13:02 PM ******/
CREATE TYPE [dbo].[lstcb_sp] AS TABLE(
	[MaSanPham] [int] NULL,
	[SoLuong] [int] NULL
)
GO
/****** Object:  Table [dbo].[ChiPhi]    Script Date: 6/30/2019 11:13:02 PM ******/
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
/****** Object:  Table [dbo].[Combo]    Script Date: 6/30/2019 11:13:02 PM ******/
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
/****** Object:  Table [dbo].[ComBo_HoaDon]    Script Date: 6/30/2019 11:13:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComBo_HoaDon](
	[MaComBo] [int] NULL,
	[MaHoaDon] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ComBo_SanPham]    Script Date: 6/30/2019 11:13:02 PM ******/
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
/****** Object:  Table [dbo].[HoaDon]    Script Date: 6/30/2019 11:13:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [int] NOT NULL,
	[MaKhuyenMai] [int] NULL,
	[TongTien] [decimal](18, 2) NOT NULL,
	[DiaChi] [nvarchar](50) NULL,
	[ThoiGian] [datetime] NULL,
	[TrangThai] [nvarchar](20) NOT NULL CONSTRAINT [DF_HoaDon_TrangThai]  DEFAULT (N'Đang xử lí'),
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhuyenMai]    Script Date: 6/30/2019 11:13:02 PM ******/
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
/****** Object:  Table [dbo].[LoaiChiPhi]    Script Date: 6/30/2019 11:13:02 PM ******/
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
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 6/30/2019 11:13:02 PM ******/
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
/****** Object:  Table [dbo].[SanPham]    Script Date: 6/30/2019 11:13:02 PM ******/
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
/****** Object:  Table [dbo].[SanPham_HoaDon]    Script Date: 6/30/2019 11:13:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham_HoaDon](
	[MaSanPham] [int] NULL,
	[MaHoaDon] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 6/30/2019 11:13:02 PM ******/
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
INSERT [dbo].[ChiPhi] ([MaChiPhi], [GiaTien], [NgayTao], [MaLoaiChiPhi]) VALUES (12, CAST(454544 AS Decimal(18, 0)), CAST(N'2019-05-23 10:46:45.000' AS DateTime), 6)
INSERT [dbo].[ChiPhi] ([MaChiPhi], [GiaTien], [NgayTao], [MaLoaiChiPhi]) VALUES (13, CAST(696969 AS Decimal(18, 0)), CAST(N'2019-05-30 09:40:41.000' AS DateTime), 26)
INSERT [dbo].[ChiPhi] ([MaChiPhi], [GiaTien], [NgayTao], [MaLoaiChiPhi]) VALUES (14, CAST(1200000 AS Decimal(18, 0)), CAST(N'2019-05-30 16:25:07.000' AS DateTime), 6)
INSERT [dbo].[ChiPhi] ([MaChiPhi], [GiaTien], [NgayTao], [MaLoaiChiPhi]) VALUES (15, CAST(500000 AS Decimal(18, 0)), CAST(N'2018-08-03 16:00:00.000' AS DateTime), 26)
SET IDENTITY_INSERT [dbo].[ChiPhi] OFF
SET IDENTITY_INSERT [dbo].[Combo] ON 

INSERT [dbo].[Combo] ([MaCombo], [TenCombo], [DonGia], [HinhAnh], [TrangThai]) VALUES (1, N'ComBo Gà Giòn', CAST(150000 AS Decimal(18, 0)), N'menu_spicy_redboat1pc.png', 1)
INSERT [dbo].[Combo] ([MaCombo], [TenCombo], [DonGia], [HinhAnh], [TrangThai]) VALUES (2, N'ComBo Gà Giòn (3 Miếng)', CAST(124124 AS Decimal(18, 0)), N'menu_spicy_redboat1pc.png', 1)
INSERT [dbo].[Combo] ([MaCombo], [TenCombo], [DonGia], [HinhAnh], [TrangThai]) VALUES (3, N'ComBo Gà Giòn 2 Người', CAST(213123 AS Decimal(18, 0)), N'menu_spicy_redboat1pc.png', 1)
SET IDENTITY_INSERT [dbo].[Combo] OFF
INSERT [dbo].[ComBo_SanPham] ([MaCombo], [MaSanPham], [SoLuong]) VALUES (1, 1, 2)
INSERT [dbo].[ComBo_SanPham] ([MaCombo], [MaSanPham], [SoLuong]) VALUES (2, 3, 3)
INSERT [dbo].[ComBo_SanPham] ([MaCombo], [MaSanPham], [SoLuong]) VALUES (3, 1, 2)
INSERT [dbo].[ComBo_SanPham] ([MaCombo], [MaSanPham], [SoLuong]) VALUES (3, 3, 1)
INSERT [dbo].[ComBo_SanPham] ([MaCombo], [MaSanPham], [SoLuong]) VALUES (3, 17, 1)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhuyenMai], [TongTien], [DiaChi], [ThoiGian], [TrangThai]) VALUES (1, NULL, CAST(999999.00 AS Decimal(18, 2)), N'Hà Nội', CAST(N'2018-08-03 00:00:00.000' AS DateTime), N'Xử lí')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhuyenMai], [TongTien], [DiaChi], [ThoiGian], [TrangThai]) VALUES (2, 1, CAST(4000000.00 AS Decimal(18, 2)), N'Mễ Trì', CAST(N'2018-08-03 00:00:00.000' AS DateTime), N'Hủy')
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

INSERT [dbo].[LoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham], [HinhAnh]) VALUES (1, N'Gà Giòn Cay', N'menu_SPICY_alacarte_1.png')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham], [HinhAnh]) VALUES (2, N'Gà Giòn Không Cay', N'menu_MILD_alacarte.png')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham], [HinhAnh]) VALUES (3, N'Hamburger', N'menu_BURGER_fish.png')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham], [HinhAnh]) VALUES (4, N'Món Ăn Kèm', N'menu_SIDE_cajunfries-L.png')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham], [HinhAnh]) VALUES (5, N'Thức Uống & Tráng Miệng', N'menu_bev_dessert.png')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham], [HinhAnh]) VALUES (6, N'Cơm', N'm4.png')
SET IDENTITY_INSERT [dbo].[LoaiSanPham] OFF
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MaLoaiSanPham], [HinhAnh], [MoTa], [TrangThai]) VALUES (1, N'1 Miếng Gà Giòn Cay', CAST(50000 AS Decimal(18, 0)), 1, N'pimgpsh_fullsize_distr.png', N'Gà giòn Cajun tươi mới được ướp với công thức gia vị Louisiana (cay hoặc không cay), tẩm bột thủ công và rán chín cùng lớp phủ giòn tan đặc trưng của miền Nam nước Mỹ.', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MaLoaiSanPham], [HinhAnh], [MoTa], [TrangThai]) VALUES (2, N'Gà Tắm Nước Mắm', CAST(40000 AS Decimal(18, 0)), 1, N'menu_spicy_redboat1pc.png', N'1 miếng Gà Tắm Nước Mắm', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MaLoaiSanPham], [HinhAnh], [MoTa], [TrangThai]) VALUES (3, N'1 Miếng Gà Giòn Không Cay', CAST(36000 AS Decimal(18, 0)), 2, N'_pimgpsh_fullsize_distr.png', N'Gà giòn Cajun tươi mới được ướp với công thức gia vị Louisiana (cay hoặc không cay), tẩm bột thủ công và rán chín cùng lớp phủ giòn tan đặc trưng của miền Nam nước Mỹ.', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MaLoaiSanPham], [HinhAnh], [MoTa], [TrangThai]) VALUES (8, N'Hamburger Cá Rán', CAST(54000 AS Decimal(18, 0)), 3, N'menu_burger_combo9_1.png', N'Từng phiến phi-lê cá mềm trắng nõn được ướp cùng hỗn hợp gia vị Cajun, tẩm bột thủ công và rán giòn thật tươi ngon.', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MaLoaiSanPham], [HinhAnh], [MoTa], [TrangThai]) VALUES (12, N'Hamburger Tôm', CAST(39000 AS Decimal(18, 0)), 3, N'menu_burger_combo9_1.png', N'Từng phiến phi-lê tôm được ướp cùng hỗn hợp gia vị Cajun, tẩm bột thủ công và rán giòn thật tươi ngon.', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MaLoaiSanPham], [HinhAnh], [MoTa], [TrangThai]) VALUES (13, N'Khoai Tây Nghiền', CAST(19000 AS Decimal(18, 0)), 4, N'khoai_tay_chien.png', N'Khoai tây nghiền mịn như kem được phủ nước sốt Gravy đậm đà.', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MaLoaiSanPham], [HinhAnh], [MoTa], [TrangThai]) VALUES (14, N'Khoai Tây Chiên', CAST(29000 AS Decimal(18, 0)), 4, N'khoai_tay_chien.png', N'Khoai tây chiên mang 100% hương vị Cajun với hỗn hợp gia vị đặc biệt từ Louisiana', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MaLoaiSanPham], [HinhAnh], [MoTa], [TrangThai]) VALUES (15, N'Cơm Trắng', CAST(10000 AS Decimal(18, 0)), 4, N'rice.png', N'Mềm dẻo đặc biệt, lựa chọn hoàn hảo để bạn tận hưởng một bữa ăn FastFood tuyệt vời.', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MaLoaiSanPham], [HinhAnh], [MoTa], [TrangThai]) VALUES (16, N'Bắp Cải Trộn', CAST(19000 AS Decimal(18, 0)), 4, N'menu_spicy_redboat1pc.png', N'Bắp cải trộn giòn, cùng lớp sốt đậm đà là sự kết hợp hoàn hỏa cho món gà rán.', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MaLoaiSanPham], [HinhAnh], [MoTa], [TrangThai]) VALUES (17, N'CoCa', CAST(19000 AS Decimal(18, 0)), 5, N'menu_beverages_coca15l.png', N'Uống thả ga khi dùng tại nhà hàng', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MaLoaiSanPham], [HinhAnh], [MoTa], [TrangThai]) VALUES (18, N'PepSi', CAST(19000 AS Decimal(18, 0)), 5, N'menu_beverages_coca15l.png', N'Uống thả ga khi dùng tại nhà hàng', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MaLoaiSanPham], [HinhAnh], [MoTa], [TrangThai]) VALUES (19, N'Kem Tươi', CAST(5000 AS Decimal(18, 0)), 5, N'menu_spicy_redboat1pc.png', N'Lớp kem vani mát lạnh và sánh mịn tan ngay trong miệng', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonGia], [MaLoaiSanPham], [HinhAnh], [MoTa], [TrangThai]) VALUES (20, N'Cơm', CAST(50000 AS Decimal(18, 0)), 6, N'rice.png', N'Cơm', 1)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau], [GioiTinh], [SDT], [QuyenHan], [KichHoat], [DiaChi], [SoLanNhapSai]) VALUES (1, N'admin', N'123456', 1, N'0918279888', 0, 1, N'Hà Nội', 0)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau], [GioiTinh], [SDT], [QuyenHan], [KichHoat], [DiaChi], [SoLanNhapSai]) VALUES (2, N'nhanvien', N'123456', 1, N'0918279888', 2, 1, N'Ha noi', 0)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau], [GioiTinh], [SDT], [QuyenHan], [KichHoat], [DiaChi], [SoLanNhapSai]) VALUES (3, N'subadmin', N'123456', 1, N'0985732426', 1, 1, N'abc', 0)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau], [GioiTinh], [SDT], [QuyenHan], [KichHoat], [DiaChi], [SoLanNhapSai]) VALUES (7, N'user1', N'123456', 1, N'0918279888', 3, 1, N'Ha Noi', 0)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau], [GioiTinh], [SDT], [QuyenHan], [KichHoat], [DiaChi], [SoLanNhapSai]) VALUES (8, N'user2', N'123456', 0, N'0912498789', 1, 0, N'123456', 0)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau], [GioiTinh], [SDT], [QuyenHan], [KichHoat], [DiaChi], [SoLanNhapSai]) VALUES (9, N'talang', N'123456', 0, N'01234', 1, 1, N'asdasdasd', 0)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau], [GioiTinh], [SDT], [QuyenHan], [KichHoat], [DiaChi], [SoLanNhapSai]) VALUES (10, N'123', N'123', 0, N'01231231231', 0, 1, N'asd', 0)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau], [GioiTinh], [SDT], [QuyenHan], [KichHoat], [DiaChi], [SoLanNhapSai]) VALUES (11, N'taikhoan2', N'123', 0, N'12312312', 0, 0, N'123', 0)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau], [GioiTinh], [SDT], [QuyenHan], [KichHoat], [DiaChi], [SoLanNhapSai]) VALUES (12, N'admin', N'123456', 1, N'asd', 2, 1, N'asd', 0)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau], [GioiTinh], [SDT], [QuyenHan], [KichHoat], [DiaChi], [SoLanNhapSai]) VALUES (13, N'admin', N'123456', 1, N'asd', 2, 1, N'asd', 0)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau], [GioiTinh], [SDT], [QuyenHan], [KichHoat], [DiaChi], [SoLanNhapSai]) VALUES (14, N'user3', N'123123', 0, N'12231', 2, 1, N'asd', 0)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau], [GioiTinh], [SDT], [QuyenHan], [KichHoat], [DiaChi], [SoLanNhapSai]) VALUES (15, N'admin', N'123123', 0, N'asd', 2, 1, N'asd', 0)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau], [GioiTinh], [SDT], [QuyenHan], [KichHoat], [DiaChi], [SoLanNhapSai]) VALUES (16, N'admin', N'123456', 0, N'089789789789897897', 2, 1, N'asd', 0)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenTaiKhoan], [MatKhau], [GioiTinh], [SDT], [QuyenHan], [KichHoat], [DiaChi], [SoLanNhapSai]) VALUES (17, N'thanhld', N'123456', 1, N'09789987987', 2, 1, N'Ha noi Viet Nam', 0)
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
ALTER TABLE [dbo].[ChiPhi]  WITH CHECK ADD  CONSTRAINT [FK_ChiPhi_LoaiChiPhi] FOREIGN KEY([MaLoaiChiPhi])
REFERENCES [dbo].[LoaiChiPhi] ([MaLoaiChiPhi])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiPhi] CHECK CONSTRAINT [FK_ChiPhi_LoaiChiPhi]
GO
ALTER TABLE [dbo].[ComBo_HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ComBo_HoaDon_Combo] FOREIGN KEY([MaComBo])
REFERENCES [dbo].[Combo] ([MaCombo])
GO
ALTER TABLE [dbo].[ComBo_HoaDon] CHECK CONSTRAINT [FK_ComBo_HoaDon_Combo]
GO
ALTER TABLE [dbo].[ComBo_HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ComBo_HoaDon_HoaDon] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[ComBo_HoaDon] CHECK CONSTRAINT [FK_ComBo_HoaDon_HoaDon]
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
ALTER TABLE [dbo].[SanPham_HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_HoaDon_HoaDon] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[SanPham_HoaDon] CHECK CONSTRAINT [FK_SanPham_HoaDon_HoaDon]
GO
ALTER TABLE [dbo].[SanPham_HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_HoaDon_SanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[SanPham_HoaDon] CHECK CONSTRAINT [FK_SanPham_HoaDon_SanPham]
GO
/****** Object:  StoredProcedure [dbo].[a]    Script Date: 6/30/2019 11:13:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[a]
@giadau INT,
@giacuoi INT
AS
BEGIN
SELECT * FROM dbo.SanPham WHERE DonGia BETWEEN @giadau AND
@giacuoi
end

GO
/****** Object:  StoredProcedure [dbo].[ComBo_SelectBy]    Script Date: 6/30/2019 11:13:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ComBo_SelectBy]
@sTuKhoa NVARCHAR(250)
AS
BEGIN
SELECT
*
FROM dbo.Combo WHERE TenCombo LIKE @sTuKhoa
OR TenCombo LIKE '%' + @sTuKhoa + '%'
END

GO
/****** Object:  StoredProcedure [dbo].[CTChiNhanh_DeleteByPrimaryKey]    Script Date: 6/30/2019 11:13:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CTChiNhanh_DeleteByPrimaryKey]
	@MaChiNhanh int
AS
	DELETE FROM [dbo].[ChiNhanh]
	WHERE 
		[MaChiNhanh] = @MaChiNhanh
RETURN



GO
/****** Object:  StoredProcedure [dbo].[CTChiNhanh_GetAllBy]    Script Date: 6/30/2019 11:13:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CTChiNhanh_GetAllBy]
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
	FROM dbo.ChiNhanh
	WHERE @keyText IS NULL 
	OR DiaChi LIKE '%'+ @keyText +'%'
	OR SoDienThoai LIKE '%'+ @keyText +'%'
	
	SELECT * FROM #TempTable
	ORDER BY MaChiNhanh
	OFFSET @pageFrom ROW
	FETCH NEXT @pageSize ROW ONLY

	SELECT COUNT(1) AS totalEntires
	FROM #TempTable
	DROP TABLE #TempTable
END




GO
/****** Object:  StoredProcedure [dbo].[CTChiNhanh_Insert]    Script Date: 6/30/2019 11:13:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CTChiNhanh_Insert]
	@MaChiNhanh INT,
	@DiaChi nvarchar(150) ,
	@SoDienThoai varchar(15),
	@TenChiNhanh varchar(50)

AS
BEGIN
	INSERT [dbo].[ChiNhanh]
	(
		[DiaChi],
		[SoDienThoai],
		[TenChiNhanh]

	)
	VALUES
	(
		@DiaChi,
		@SoDienThoai,
		@TenChiNhanh

	)
END
	

RETURN



GO
/****** Object:  StoredProcedure [dbo].[CTChiNhanh_SelectAll]    Script Date: 6/30/2019 11:13:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CTChiNhanh_SelectAll]
AS
	SELECT * FROM dbo.ChiNhanh
RETURN



GO
/****** Object:  StoredProcedure [dbo].[CTChiNhanh_Update]    Script Date: 6/30/2019 11:13:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CTChiNhanh_Update]
	@MaChiNhanh int,
	@DiaChi nvarchar(150),
	@SoDienThoai varchar(15),
	@TenChiNhanh varchar(50)

AS
	UPDATE [dbo].[ChiNhanh]
	SET
		[DiaChi] = @DiaChi,
		[SoDienThoai] = @SoDienThoai,
		[TenChiNhanh] = @TenChiNhanh

	WHERE 
		[MaChiNhanh] = @MaChiNhanh
RETURN



GO
/****** Object:  StoredProcedure [dbo].[CTChiPhi_GetAllBy]    Script Date: 6/30/2019 11:13:02 PM ******/
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

	SELECT COUNT(1) AS totalEntires
	FROM #TempTable
	DROP TABLE #TempTable
END


GO
/****** Object:  StoredProcedure [dbo].[CTChiPhi_Insert]    Script Date: 6/30/2019 11:13:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CTChiPhi_Update]    Script Date: 6/30/2019 11:13:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CTCombo_GetAllBy]    Script Date: 6/30/2019 11:13:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CTCombo_Insert]    Script Date: 6/30/2019 11:13:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CTComBo_SelectByLSP]    Script Date: 6/30/2019 11:13:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CTCombo_SelectByPrimaryKey]    Script Date: 6/30/2019 11:13:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CTCombo_Update]    Script Date: 6/30/2019 11:13:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CTDonHang_GetAllBy]    Script Date: 6/30/2019 11:13:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CTDonHang_GetAllBy]
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
	FROM dbo.HoaDon
	WHERE @keyText IS NULL 
	OR TongTien LIKE '%'+ @keyText +'%'
	OR MaHoaDon LIKE '%'+ @keyText +'%'
	OR DiaChi LIKE '%'+ @keyText +'%'
	
	SELECT * FROM #TempTable
	ORDER BY TrangThai ASC
	OFFSET @pageFrom ROW
	FETCH NEXT @pageSize ROW ONLY

	SELECT COUNT(1) AS totalEntires
	FROM #TempTable
	DROP TABLE #TempTable
END


GO
/****** Object:  StoredProcedure [dbo].[CTDonHang_UpdateStatus]    Script Date: 6/30/2019 11:13:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[CTDonHang_UpdateStatus]
@MaDonHang INT,
@TrangThai NVARCHAR(30)
AS
UPDATE  dbo.HoaDon
SET TrangThai = @TrangThai
WHERE MaHoaDon = @MaDonHang
GO
/****** Object:  StoredProcedure [dbo].[CTKhuyenmai_GetAllBy]    Script Date: 6/30/2019 11:13:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CTKhuyenMai_Insert]    Script Date: 6/30/2019 11:13:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CTKhuyenMai_SelectAll]    Script Date: 6/30/2019 11:13:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CTKhuyenMai_SelectAll]
AS
SELECT * FROM dbo.KhuyenMai
RETURN
GO
/****** Object:  StoredProcedure [dbo].[CTKhuyenMai_Update]    Script Date: 6/30/2019 11:13:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CTLoaiChiPhi_DeleteByPrimaryKey]    Script Date: 6/30/2019 11:13:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CTLoaiChiPhi_GetAllBy]    Script Date: 6/30/2019 11:13:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CTLoaiChiPhi_Insert]    Script Date: 6/30/2019 11:13:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CTLoaiChiPhi_SelectAll]    Script Date: 6/30/2019 11:13:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CTLoaiChiPhi_Update]    Script Date: 6/30/2019 11:13:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CTLoaiSanPham_GetAllBy]    Script Date: 6/30/2019 11:13:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CTLoaiSanPham_Insert]    Script Date: 6/30/2019 11:13:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CTLoaiSanPham_SelectAll]    Script Date: 6/30/2019 11:13:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CTLoaiSanPham_Update]    Script Date: 6/30/2019 11:13:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CTReport_Dashboard_Chart]    Script Date: 6/30/2019 11:13:02 PM ******/
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
		FROM dbo.ChiPhi
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
/****** Object:  StoredProcedure [dbo].[CTReport_Dashboard_Overview]    Script Date: 6/30/2019 11:13:02 PM ******/
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
			(SELECT COUNT(1) FROM dbo.TaiKhoan WHERE KichHoat = 1) TaiKhoan,
			(SELECT COUNT(1) FROM dbo.SanPham WHERE TrangThai = 1) SanPham,
			(SELECT COUNT(1) FROM dbo.Combo WHERE TrangThai = 1) Combo,
			(SELECT COUNT(1) FROM dbo.KhuyenMai WHERE @curDate BETWEEN ThoiGianBatDau AND ThoiGianKetThuc ) AS KhuyenMai

	END
GO
/****** Object:  StoredProcedure [dbo].[CTSanPham_GetAll]    Script Date: 6/30/2019 11:13:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CTSanPham_GetAll]
AS
BEGIN
SELECT * FROM
dbo.SanPham
END

GO
/****** Object:  StoredProcedure [dbo].[CTSanPham_GetAllBy]    Script Date: 6/30/2019 11:13:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CTSanPham_Insert]    Script Date: 6/30/2019 11:13:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CTSanPham_SelectAll]    Script Date: 6/30/2019 11:13:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CTSanPham_SelectByLSP]    Script Date: 6/30/2019 11:13:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CTSanPham_SelectByPrimaryKey]    Script Date: 6/30/2019 11:13:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CTSanPham_Update]    Script Date: 6/30/2019 11:13:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CTTaiKhoan_CheckExistLogin]    Script Date: 6/30/2019 11:13:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CTTaiKhoan_DeleteByPrimaryKey]    Script Date: 6/30/2019 11:13:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CTTaiKhoan_GetAllBy]    Script Date: 6/30/2019 11:13:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CTTaiKhoan_Insert]    Script Date: 6/30/2019 11:13:02 PM ******/
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
	DECLARE @number INT
	SELECT @number=COUNT(1) FROM dbo.TaiKhoan WHERE TenTaiKhoan=@TenTaiKhoan
	IF @number > 0
		RAISERROR('Tên tài khoản đã được sử dung',16,1)
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
/****** Object:  StoredProcedure [dbo].[CTTaiKhoan_Update]    Script Date: 6/30/2019 11:13:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SanPham_SelectBy]    Script Date: 6/30/2019 11:13:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SanPham_SelectBy]
@keytext NVARCHAR(250)
AS
BEGIN
SELECT
*
FROM dbo.SanPham WHERE TenSanPham LIKE @keytext
OR TenSanPham LIKE '%' + @keytext + '%'
END

GO
USE [master]
GO
ALTER DATABASE [FastFood] SET  READ_WRITE 
GO
