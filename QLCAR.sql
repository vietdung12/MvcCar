CREATE Database QLCAR
GO
USE [QLCAR]
GO
/****** Object:  Table [dbo].[ADMIN]    Script Date: 8/14/2019 4:12:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADMIN](
	[AdUser] [nvarchar](30) NOT NULL,
	[AdPass] [nvarchar](50) NOT NULL,
	[AdName] [nvarchar](50) NULL,
 CONSTRAINT [Pk_Admin] PRIMARY KEY CLUSTERED 
(
	[AdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BRANCH]    Script Date: 8/14/2019 4:12:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BRANCH](
	[BraID] [int] IDENTITY(1,1) NOT NULL,
	[BraLocal] [nvarchar](50) NOT NULL,
	[BraAdress] [nvarchar](200) NULL,
	[BraTelephone] [varchar](50) NULL,
 CONSTRAINT [pk_Branch] PRIMARY KEY CLUSTERED 
(
	[BraID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CAR]    Script Date: 8/14/2019 4:12:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CAR](
	[CarID] [int] IDENTITY(1,1) NOT NULL,
	[CarName] [nvarchar](100) NOT NULL,
	[Price] [decimal](18, 0) NULL,
	[Introduce] [nvarchar](max) NULL,
	[Image] [varchar](50) NULL,
	[UpdateDay] [datetime] NULL,
	[AvailableQuantity] [int] NULL,
	[TypeCarID] [int] NULL,
	[BraID] [int] NULL,
	[CarManuID] [int] NULL,
 CONSTRAINT [Pk_Car] PRIMARY KEY CLUSTERED 
(
	[CarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CARMANUFACTURER]    Script Date: 8/14/2019 4:12:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CARMANUFACTURER](
	[CarManuID] [int] IDENTITY(1,1) NOT NULL,
	[CarManuName] [nvarchar](50) NOT NULL,
 CONSTRAINT [Pk_CARMANUFACTURER] PRIMARY KEY CLUSTERED 
(
	[CarManuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CUSTOMMER]    Script Date: 8/14/2019 4:12:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CUSTOMMER](
	[CusID] [int] IDENTITY(1,1) NOT NULL,
	[CusName] [nvarchar](50) NOT NULL,
	[CusEmail] [varchar](100) NOT NULL,
	[CusPass] [varchar](50) NOT NULL,
	[CusAdress] [nvarchar](200) NULL,
	[CusTelephone] [nvarchar](50) NULL,
	[BirthDay] [datetime] NULL,
	[TypeCusID] [int] NULL,
 CONSTRAINT [Pk_Custommer] PRIMARY KEY CLUSTERED 
(
	[CusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ORDERCAR]    Script Date: 8/14/2019 4:12:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERCAR](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[Paid] [bit] NULL,
	[DeliveryStatus] [bit] NULL,
	[OrderDate] [datetime] NULL,
	[DeliveryDate] [datetime] NULL,
	[CusID] [int] NULL,
 CONSTRAINT [Pk_Ordercar] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ORDERDETAILS]    Script Date: 8/14/2019 4:12:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERDETAILS](
	[OrderID] [int] NOT NULL,
	[CarID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [decimal](18, 0) NULL,
	[Discout] [float] NULL,
	[ReturnDate] [datetime] NULL,
 CONSTRAINT [Pk_Oderdetails] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[CarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TYPECAR]    Script Date: 8/14/2019 4:12:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TYPECAR](
	[TypeCarID] [int] IDENTITY(1,1) NOT NULL,
	[TypeCarName] [nvarchar](50) NOT NULL,
 CONSTRAINT [Pk_Typecar] PRIMARY KEY CLUSTERED 
(
	[TypeCarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TYPECUSTOMMER]    Script Date: 8/14/2019 4:12:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TYPECUSTOMMER](
	[TypeCusID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](30) NULL,
	[Discout] [float] NULL,
 CONSTRAINT [Pk_Typecustommer] PRIMARY KEY CLUSTERED 
(
	[TypeCusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[ADMIN] ([AdUser], [AdPass], [AdName]) VALUES (N'admin', N'admin', N'Dung')
SET IDENTITY_INSERT [dbo].[BRANCH] ON 

INSERT [dbo].[BRANCH] ([BraID], [BraLocal], [BraAdress], [BraTelephone]) VALUES (1, N'Quận 1', N'123 Nguyễn Cư Tring Quận 1 TP.HCM', N'112278945')
INSERT [dbo].[BRANCH] ([BraID], [BraLocal], [BraAdress], [BraTelephone]) VALUES (2, N'Quận 2', N'456 Phan Văn Trị Quận 2 TP.HCM', N'122411765')
INSERT [dbo].[BRANCH] ([BraID], [BraLocal], [BraAdress], [BraTelephone]) VALUES (3, N'Quận 3', N'789 Hồ Xuân Hương Quận 3 TP.HCM', N'124318905')
SET IDENTITY_INSERT [dbo].[BRANCH] OFF
SET IDENTITY_INSERT [dbo].[CAR] ON 

INSERT [dbo].[CAR] ([CarID], [CarName], [Price], [Introduce], [Image], [UpdateDay], [AvailableQuantity], [TypeCarID], [BraID], [CarManuID]) VALUES (1, N'YARIS 1.5G CVT', CAST(650000 AS Decimal(18, 0)), N'Yaris thế hệ mới với thiết kế đột phá, ấn tượng, dáng vẻ năng động và cá tính mang đến cảm giác đầy kiêu hãnh và tự hào khi sở hữu một dòng xe đậm dấu ấn riêng', N'YARIS15G.jpg', CAST(N'1900-01-01 00:00:00.000' AS DateTime), 5, 2, 1, 1)
INSERT [dbo].[CAR] ([CarID], [CarName], [Price], [Introduce], [Image], [UpdateDay], [AvailableQuantity], [TypeCarID], [BraID], [CarManuID]) VALUES (2, N'BMW X7', CAST(740000 AS Decimal(18, 0)), N'Nét đặc biệt đầu tiên khi lần đầu trông thấy BMW X7 2019 chính là những đường nét cơ bắp, cứng cáp và khá hầm hố. Sở hữu kích thước tổng thể lần lượt là chiều dài 5.163 mm x chiều rộng 1.999 mm x chiều cao 1.805 mm, với kích thước trên thì BMW X7 2019 chính là mẫu SUV lớn nhất hiện tại của BMW, hiện trên thế giới rất hiếm có mẫu xe nào có kích thước lớn như mẫu SUV này', N'BMWX7.jpg', CAST(N'1900-01-01 00:00:00.000' AS DateTime), 6, 1, 2, 2)
INSERT [dbo].[CAR] ([CarID], [CarName], [Price], [Introduce], [Image], [UpdateDay], [AvailableQuantity], [TypeCarID], [BraID], [CarManuID]) VALUES (3, N'CAMRY 2.5Q', CAST(500000 AS Decimal(18, 0)), N'Phiên bản Toyota Camry 2016 mang đến một diện mạo mới mẻ, vô cùng bắt mắt với sự liền mạch trong mọi chi tiết thiết kế, là tâm điểm thu hút những ánh nhìn mỗi khi lướt bánh.', N'ToyotaCamry2.5Q.jpg', CAST(N'2019-08-11 00:00:00.000' AS DateTime), 5, 1, 3, 1)
INSERT [dbo].[CAR] ([CarID], [CarName], [Price], [Introduce], [Image], [UpdateDay], [AvailableQuantity], [TypeCarID], [BraID], [CarManuID]) VALUES (5, N'Mazda2 Deluxe', CAST(514000 AS Decimal(18, 0)), N'Động cơ, Công suất cực đại, Mô men xoắn cực đại', N'Mazda2Deluxe.jpg', CAST(N'2019-08-14 00:00:00.000' AS DateTime), 7, 1, 1, 4)
INSERT [dbo].[CAR] ([CarID], [CarName], [Price], [Introduce], [Image], [UpdateDay], [AvailableQuantity], [TypeCarID], [BraID], [CarManuID]) VALUES (6, N'Mazda6 Deluxe', CAST(819000 AS Decimal(18, 0)), N'Động cơ: 1998 cc ; Công suất cực đại: 153 HP/6,000 rpm ; Mô men xoắn cực đại: 200 Nm/4,000 rpm ;', N'Mazda6Deluxe.jpg', CAST(N'2019-08-14 00:00:00.000' AS DateTime), 6, 1, 2, 4)
INSERT [dbo].[CAR] ([CarID], [CarName], [Price], [Introduce], [Image], [UpdateDay], [AvailableQuantity], [TypeCarID], [BraID], [CarManuID]) VALUES (7, N'Mazda3 Sport Luxury', CAST(699000 AS Decimal(18, 0)), N'Động cơ: 1496 cc ; Công suất cực đại: 110 HP/6,000 rpm ; Mô men xoắn cực đại: 144 Nm/4,000 rpm ;', N'Mazda3Sport.jpg', CAST(N'2019-08-14 00:00:00.000' AS DateTime), 3, 1, 3, 4)
INSERT [dbo].[CAR] ([CarID], [CarName], [Price], [Introduce], [Image], [UpdateDay], [AvailableQuantity], [TypeCarID], [BraID], [CarManuID]) VALUES (8, N'TOYOTA RUSH', CAST(668000 AS Decimal(18, 0)), N'Loại động cơ: 2NR-VE (1.5L) ; Số xy lanh: 4 ; Dung tích xy lanh (cc): 1496 ;', N'toyotarush.jpg', CAST(N'2019-08-14 00:00:00.000' AS DateTime), 6, 2, 2, 1)
INSERT [dbo].[CAR] ([CarID], [CarName], [Price], [Introduce], [Image], [UpdateDay], [AvailableQuantity], [TypeCarID], [BraID], [CarManuID]) VALUES (9, N'BMW 1 SERIES 5', CAST(549000 AS Decimal(18, 0)), N'BMW 1 Series 5 cửa - vượt xa những giới hạn thông thường. Mẫu xe này mang đến cảm giác lái linh hoạt và dễ điều khiển với kiểu dáng thể thao, hiện đại. Mặt trước của phiên bản này được thiết kế lại với lưới tản nhiệt đặc trưng kiểu BMW cùng với đèn pha LED càng làm nổi bật những nét mạnh mẽ của chiếc BMW 1 Series', N'bmw1series5.jpg', CAST(N'2019-08-14 00:00:00.000' AS DateTime), 6, 2, 1, 2)
INSERT [dbo].[CAR] ([CarID], [CarName], [Price], [Introduce], [Image], [UpdateDay], [AvailableQuantity], [TypeCarID], [BraID], [CarManuID]) VALUES (10, N'BMW 3 SERIES SEDAN', CAST(566000 AS Decimal(18, 0)), N'Giữ nguyên giá trị cốt lõi từ năm 1975: BMW 3 Series là hiện thân của dòng xe sedan thể thao. Ở thế hệ thứ 6 này, sự kết hợp hoàn hảo giữa thiết kế động lực học, sự linh hoạt, và tính hữu dụng cho nhu cầu hàng ngày đã làm nên mẫu xe cực kỳ ấn tượng này. Với sự bố trí trọng lượng tối ưu, bánh sau truyền động mạnh mẽ, động cơ xăng và dầu hiệu suất cao với công nghệ BMW EfficientDynamics đảm bảo tính động lực học xuất sắc và mức tiêu thụ nhiên liệu thấp.', N'BMW3.jpg', CAST(N'2019-08-14 00:00:00.000' AS DateTime), 8, 1, 3, 2)
INSERT [dbo].[CAR] ([CarID], [CarName], [Price], [Introduce], [Image], [UpdateDay], [AvailableQuantity], [TypeCarID], [BraID], [CarManuID]) VALUES (11, N'Chevrolet Blazer', CAST(600000 AS Decimal(18, 0)), N'Xe được trang bị động cơ V6 3.6L, công suất 305 mã lực, mô-men xoắn 365 Nm, xe sử dụng hộp số tự động 9 cấp. Chevrolet Blazer 2019 phiên bản thấp nhất được trang bị động cơ 4 xi-lanh 2.5L với công suất 193 mã lực, mô-men xoắn 255 Nm', N'ChevroletBlazer.jpg', CAST(N'2019-08-14 00:00:00.000' AS DateTime), 3, 4, 1, 5)
INSERT [dbo].[CAR] ([CarID], [CarName], [Price], [Introduce], [Image], [UpdateDay], [AvailableQuantity], [TypeCarID], [BraID], [CarManuID]) VALUES (12, N'Chevrolet Equinox', CAST(666000 AS Decimal(18, 0)), N'Một trong những điểm mới đáng giá của Equinox thế hệ mới đó chính là tính năng vận hành. Có tới 3 loại động cơ đều sử dụng công nghệ Turbo tăng áp dành cho Equinox 2018-2019, bao gồm 2 động cơ xăng (1.5L và  2.0L) và một động cơ dầu (1.6L). Đồng thời Equinox mới cũng là mẫu Chevrolet đầu tiên ở Bắc Mỹ sử dụng hoàn toàn các phiên bản động cơ tăng áp turbocharged.', N'chevroletequinox.jpg', CAST(N'2019-08-14 00:00:00.000' AS DateTime), 2, 4, 2, 5)
INSERT [dbo].[CAR] ([CarID], [CarName], [Price], [Introduce], [Image], [UpdateDay], [AvailableQuantity], [TypeCarID], [BraID], [CarManuID]) VALUES (13, N'Chevrolet Trax', CAST(645000 AS Decimal(18, 0)), N' Bốn xilanh thẳng hàng với tổng dung tích 1.364 cc ứng dụng công nghệ ECOTEC, phun xăng đa điểm sau đi cùng turbo giúp sản sinh 140 mã lực và 200 Nm. Bên cạnh đó, khả năng tiết kiệm nhiên liệu sẵn có, tiêu chuẩn khí thải mà mẫu động cơ xăng này đạt được là Euro 6, một mức tiêu chuẩn khá tốt và thực sự có lợi cho môi trường.', N'ChevroletTrax.jpg', CAST(N'2019-08-14 00:00:00.000' AS DateTime), 2, 4, 3, 5)
INSERT [dbo].[CAR] ([CarID], [CarName], [Price], [Introduce], [Image], [UpdateDay], [AvailableQuantity], [TypeCarID], [BraID], [CarManuID]) VALUES (14, N'Audi A4 saloon', CAST(400000 AS Decimal(18, 0)), N' Audi A4 Sedan hoàn toàn mới với động cơ 2.0 Một động cơ mới một nguyên tắc duy nhất: mức tiêu thụ nhiên liệu thấp hơn và công suất cao hơn. So với các phiên bản trước, mức tiêu thụ nhiên liệu đã được giảm đến 16% trong khi công suất cũng đồng thời được tăng lên đến 12%. Audi A4 sedan được trang bị động cơ TFSI 2.0 tạo ra công suất 140 k( 190 mã lực) cùng khả năng tăng tốc từ 0-100 km/h chỉ trong 7,3 giây và có thể đạt tốc độ tối đa lên đến 210 km/h', N'AudiA4.jpg', CAST(N'2019-08-14 00:00:00.000' AS DateTime), 3, 3, 1, 6)
INSERT [dbo].[CAR] ([CarID], [CarName], [Price], [Introduce], [Image], [UpdateDay], [AvailableQuantity], [TypeCarID], [BraID], [CarManuID]) VALUES (15, N'Audi A5 Sportback', CAST(669000 AS Decimal(18, 0)), N'Xe được trang bị động cơ 2.0 TFSI với công suất lên tới 252 mã lực và momen xoắn 370 Nm, công suất này lớn hơn so với phiên bản tiền nhiệm 9%. Tuy nhiên điểm cộng là công suất lớn hơn nhưng mức độ tiêu hao nhiên liệu của xe giảm tới 11% so với mẫu trước.', N'AudiA5.jpg', CAST(N'2019-08-14 00:00:00.000' AS DateTime), 5, 3, 3, 6)
SET IDENTITY_INSERT [dbo].[CAR] OFF
SET IDENTITY_INSERT [dbo].[CARMANUFACTURER] ON 

INSERT [dbo].[CARMANUFACTURER] ([CarManuID], [CarManuName]) VALUES (1, N'TOYOTA')
INSERT [dbo].[CARMANUFACTURER] ([CarManuID], [CarManuName]) VALUES (2, N'BMW')
INSERT [dbo].[CARMANUFACTURER] ([CarManuID], [CarManuName]) VALUES (4, N'MAZDA')
INSERT [dbo].[CARMANUFACTURER] ([CarManuID], [CarManuName]) VALUES (5, N'CHEVROLET')
INSERT [dbo].[CARMANUFACTURER] ([CarManuID], [CarManuName]) VALUES (6, N'AUDI')
SET IDENTITY_INSERT [dbo].[CARMANUFACTURER] OFF
SET IDENTITY_INSERT [dbo].[CUSTOMMER] ON 

INSERT [dbo].[CUSTOMMER] ([CusID], [CusName], [CusEmail], [CusPass], [CusAdress], [CusTelephone], [BirthDay], [TypeCusID]) VALUES (1, N'Dung', N'vd12@gmail.com', N'123456789', N'123/456 jdd', N'1234213423', CAST(N'1997-12-12 00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[CUSTOMMER] OFF
SET IDENTITY_INSERT [dbo].[ORDERCAR] ON 

INSERT [dbo].[ORDERCAR] ([OrderID], [Paid], [DeliveryStatus], [OrderDate], [DeliveryDate], [CusID]) VALUES (1, 0, 0, CAST(N'2019-08-08 10:09:49.457' AS DateTime), CAST(N'2020-01-01 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ORDERCAR] ([OrderID], [Paid], [DeliveryStatus], [OrderDate], [DeliveryDate], [CusID]) VALUES (2, 0, 0, CAST(N'2019-08-08 13:29:22.187' AS DateTime), CAST(N'2019-08-11 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ORDERCAR] ([OrderID], [Paid], [DeliveryStatus], [OrderDate], [DeliveryDate], [CusID]) VALUES (3, 0, 0, CAST(N'2019-08-08 14:05:08.717' AS DateTime), CAST(N'2019-08-15 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ORDERCAR] ([OrderID], [Paid], [DeliveryStatus], [OrderDate], [DeliveryDate], [CusID]) VALUES (4, 0, 0, CAST(N'2019-08-08 14:08:10.830' AS DateTime), CAST(N'2019-08-12 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ORDERCAR] ([OrderID], [Paid], [DeliveryStatus], [OrderDate], [DeliveryDate], [CusID]) VALUES (5, 0, 0, CAST(N'2019-08-09 09:10:18.487' AS DateTime), CAST(N'2019-08-10 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ORDERCAR] ([OrderID], [Paid], [DeliveryStatus], [OrderDate], [DeliveryDate], [CusID]) VALUES (6, 0, 0, CAST(N'2019-08-14 13:04:37.633' AS DateTime), CAST(N'2019-08-14 00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[ORDERCAR] OFF
INSERT [dbo].[ORDERDETAILS] ([OrderID], [CarID], [Quantity], [UnitPrice], [Discout], [ReturnDate]) VALUES (1, 1, 1, CAST(650000 AS Decimal(18, 0)), 0, CAST(N'2020-01-02 00:00:00.000' AS DateTime))
INSERT [dbo].[ORDERDETAILS] ([OrderID], [CarID], [Quantity], [UnitPrice], [Discout], [ReturnDate]) VALUES (2, 2, 1, CAST(740000 AS Decimal(18, 0)), 0, CAST(N'2019-08-12 00:00:00.000' AS DateTime))
INSERT [dbo].[ORDERDETAILS] ([OrderID], [CarID], [Quantity], [UnitPrice], [Discout], [ReturnDate]) VALUES (3, 1, 1, CAST(650000 AS Decimal(18, 0)), 0, CAST(N'2019-08-16 00:00:00.000' AS DateTime))
INSERT [dbo].[ORDERDETAILS] ([OrderID], [CarID], [Quantity], [UnitPrice], [Discout], [ReturnDate]) VALUES (4, 1, 1, CAST(650000 AS Decimal(18, 0)), 0, CAST(N'2019-08-13 00:00:00.000' AS DateTime))
INSERT [dbo].[ORDERDETAILS] ([OrderID], [CarID], [Quantity], [UnitPrice], [Discout], [ReturnDate]) VALUES (5, 1, 1, CAST(650000 AS Decimal(18, 0)), 0, CAST(N'2019-08-11 00:00:00.000' AS DateTime))
INSERT [dbo].[ORDERDETAILS] ([OrderID], [CarID], [Quantity], [UnitPrice], [Discout], [ReturnDate]) VALUES (6, 2, 5, CAST(740000 AS Decimal(18, 0)), 0, CAST(N'2019-08-19 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[TYPECAR] ON 

INSERT [dbo].[TYPECAR] ([TypeCarID], [TypeCarName]) VALUES (1, N'Small Family Cars')
INSERT [dbo].[TYPECAR] ([TypeCarID], [TypeCarName]) VALUES (2, N'Large Family Cars')
INSERT [dbo].[TYPECAR] ([TypeCarID], [TypeCarName]) VALUES (3, N'Compact Executive Cars')
INSERT [dbo].[TYPECAR] ([TypeCarID], [TypeCarName]) VALUES (4, N'Compact SUVs')
SET IDENTITY_INSERT [dbo].[TYPECAR] OFF
SET IDENTITY_INSERT [dbo].[TYPECUSTOMMER] ON 

INSERT [dbo].[TYPECUSTOMMER] ([TypeCusID], [TypeName], [Discout]) VALUES (1, N'Normal', 0)
INSERT [dbo].[TYPECUSTOMMER] ([TypeCusID], [TypeName], [Discout]) VALUES (2, N'Vip', 0.1)
SET IDENTITY_INSERT [dbo].[TYPECUSTOMMER] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__CUSTOMME__60A7203FE14388E1]    Script Date: 8/14/2019 4:12:26 PM ******/
ALTER TABLE [dbo].[CUSTOMMER] ADD UNIQUE NONCLUSTERED 
(
	[CusEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CAR]  WITH CHECK ADD  CONSTRAINT [Fk_Branch] FOREIGN KEY([BraID])
REFERENCES [dbo].[BRANCH] ([BraID])
GO
ALTER TABLE [dbo].[CAR] CHECK CONSTRAINT [Fk_Branch]
GO
ALTER TABLE [dbo].[CAR]  WITH CHECK ADD  CONSTRAINT [Fk_Carmanufacturer] FOREIGN KEY([CarManuID])
REFERENCES [dbo].[CARMANUFACTURER] ([CarManuID])
GO
ALTER TABLE [dbo].[CAR] CHECK CONSTRAINT [Fk_Carmanufacturer]
GO
ALTER TABLE [dbo].[CAR]  WITH CHECK ADD  CONSTRAINT [Fk_TypeCar] FOREIGN KEY([TypeCarID])
REFERENCES [dbo].[TYPECAR] ([TypeCarID])
GO
ALTER TABLE [dbo].[CAR] CHECK CONSTRAINT [Fk_TypeCar]
GO
ALTER TABLE [dbo].[CUSTOMMER]  WITH CHECK ADD  CONSTRAINT [Fk_Typecustommer] FOREIGN KEY([TypeCusID])
REFERENCES [dbo].[TYPECUSTOMMER] ([TypeCusID])
GO
ALTER TABLE [dbo].[CUSTOMMER] CHECK CONSTRAINT [Fk_Typecustommer]
GO
ALTER TABLE [dbo].[ORDERCAR]  WITH CHECK ADD  CONSTRAINT [Fk_Custommer] FOREIGN KEY([CusID])
REFERENCES [dbo].[CUSTOMMER] ([CusID])
GO
ALTER TABLE [dbo].[ORDERCAR] CHECK CONSTRAINT [Fk_Custommer]
GO
ALTER TABLE [dbo].[ORDERDETAILS]  WITH CHECK ADD  CONSTRAINT [Fk_Car] FOREIGN KEY([CarID])
REFERENCES [dbo].[CAR] ([CarID])
GO
ALTER TABLE [dbo].[ORDERDETAILS] CHECK CONSTRAINT [Fk_Car]
GO
ALTER TABLE [dbo].[ORDERDETAILS]  WITH CHECK ADD  CONSTRAINT [Fk_Ordercar] FOREIGN KEY([OrderID])
REFERENCES [dbo].[ORDERCAR] ([OrderID])
GO
ALTER TABLE [dbo].[ORDERDETAILS] CHECK CONSTRAINT [Fk_Ordercar]
GO
ALTER TABLE [dbo].[CAR]  WITH CHECK ADD CHECK  (([Price]>=(0)))
GO
ALTER TABLE [dbo].[ORDERDETAILS]  WITH CHECK ADD CHECK  (([Quantity]>=(0)))
GO
ALTER TABLE [dbo].[ORDERDETAILS]  WITH CHECK ADD CHECK  (([UnitPrice]>=(0)))
GO
