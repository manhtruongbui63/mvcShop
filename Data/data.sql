USE [OnlineShop]
GO
/****** Object:  Table [dbo].[About]    Script Date: 11/15/2021 12:44:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[About](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[Description] [nvarchar](250) NULL,
	[Image] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Detail] [ntext] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
 CONSTRAINT [PK_About] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/15/2021 12:44:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Status] [bit] NULL,
	[ParentID] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Content]    Script Date: 11/15/2021 12:44:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Content](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[MetaTitle] [varchar](250) NULL,
	[Description] [nvarchar](250) NULL,
	[Image] [nvarchar](250) NULL,
	[CategoryID] [bigint] NULL,
	[Detail] [ntext] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[TopHot] [datetime] NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Credential]    Script Date: 11/15/2021 12:44:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credential](
	[UserGroupID] [varchar](50) NOT NULL,
	[RoleID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Credential] PRIMARY KEY CLUSTERED 
(
	[UserGroupID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 11/15/2021 12:44:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](50) NULL,
	[Link] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/15/2021 12:44:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerID] [bigint] NULL,
	[CreatedDate] [date] NULL,
	[ShipName] [nvarchar](50) NULL,
	[ShipMobile] [nvarchar](50) NULL,
	[ShipAddress] [nvarchar](50) NULL,
	[ShipEmail] [nvarchar](50) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 11/15/2021 12:44:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ProductID] [bigint] NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/15/2021 12:44:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[MetaTitle] [varchar](250) NULL,
	[Description] [nvarchar](250) NULL,
	[Image] [nvarchar](250) NULL,
	[Price] [decimal](18, 0) NULL,
	[Quantity] [int] NULL,
	[CategoryID] [bigint] NULL,
	[Detail] [ntext] NULL,
	[CreatedDate] [date] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[TopHot] [datetime] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 11/15/2021 12:44:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Status] [bit] NULL,
	[ParentID] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/15/2021 12:44:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/15/2021 12:44:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](32) NULL,
	[Name] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[Email] [nvarchar](250) NULL,
	[GroupID] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 11/15/2021 12:44:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroup](
	[ID] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [Status], [ParentID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (8, N'Nhẫn', N'nhan', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [Status], [ParentID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (9, N'Bông tai', N'bong-tai', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [Status], [ParentID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (10, N'Lắc & Vòng tay', N'lac-vong-tay', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [Status], [ParentID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (11, N'Dây chuyền', N'day-chuyen', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [Status], [ParentID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (12, N'Mặt dây chuyền', N'mat-day-chuyen', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [Status], [ParentID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (13, N'Dây cổ', N'day-co', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [Status], [ParentID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (14, N'Cham', N'cham', 1, NULL, NULL, NULL, CAST(N'2021-11-09T17:40:28.030' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Content] ON 

INSERT [dbo].[Content] ([ID], [Name], [Status], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [TopHot]) VALUES (1, N'Ngày tái ngộ, chọn quà ý nghĩa dành tặng nàng sau khoảng thời gian yêu xa', NULL, N'ngay-tai-ngo-chon-qua-y-nghia-danh-tang-nang-sau-khoang-thoi-gian-yeu-xa', N'Ngày tái ngộ, chọn quà ý nghĩa dành tặng nàng sau khoảng thời gian yêu xa', N'/Data/images/Ngay-tai-ngo-chon-qua-y-nghia-danh-tang-nang-sau-khoang-thoi-gian-yeu-xa-1024x768.jpg', NULL, N'<p><em>Sau một m&ugrave;a y&ecirc;u xa đầy ch&ocirc;ng gai, ng&agrave;y gặp lại ch&agrave;ng đừng qu&ecirc;n d&agrave;nh tặng những bất ngờ cho n&agrave;ng nh&eacute;. C&ugrave;ng PNJ tham khảo v&agrave;i gợi &yacute; sau nh&eacute;!</em></p>

<p>&nbsp;</p>

<h2><strong>Trang sức kim cương</strong></h2>

<p>Trải qua bao nhi&ecirc;u năm th&aacute;ng,<a href="https://www.pnj.com.vn/blog/goi-y-nhung-mon-trang-suc-kim-cuong-tuyet-dep-chi-duoi-10-trieu-dong/">&nbsp;trang sức kim cương</a>&nbsp;vẫn đứng số một trong danh s&aacute;ch những m&oacute;n qu&agrave; đốn tim chị em. V&igrave; thế, điểm nhấn long lanh n&agrave;y xứng đ&aacute;ng được ch&agrave;ng c&acirc;n nhắc để gửi đến n&agrave;ng nh&acirc;n dịp trở về ng&agrave;y b&igrave;nh thường mới. Ngo&agrave;i ra, kim cương c&ograve;n tượng trưng cho sức mạnh v&ocirc; song m&agrave; kh&ocirc;ng điều g&igrave; c&oacute; thể ph&aacute; huỷ được. Khi trao tặng m&oacute;n qu&agrave; qu&yacute; n&agrave;y, ch&agrave;ng đ&atilde; thầm gửi đến th&ocirc;ng điệp về t&igrave;nh bền bỉ của cả hai rồi đấy.</p>

<p><em><img alt="" src="/Data/images/Ngay-tai-ngo-chon-qua-y-nghia-danh-tang-nang-sau-khoang-thoi-gian-yeu-xa-1-696x522.jpg" style="height:522px; width:696px" /></em></p>

<h2><strong>Trang sức đ&ocirc;i</strong></h2>

<p>Nhẫn đ&ocirc;i hay v&ograve;ng đ&ocirc;i sẽ l&agrave; gợi &yacute; ho&agrave;n hảo trong dịp n&agrave;y. M&oacute;n qu&agrave; n&agrave;y kh&ocirc;ng chỉ t&ocirc; đẹp cho cả hai m&agrave; c&ograve;n l&agrave; lời cam kết, minh chứng cho t&igrave;nh y&ecirc;u của đ&ocirc;i lứa, d&ugrave; trải qua những th&aacute;ng ng&agrave;y xa c&aacute;ch nhưng vẫn lu&ocirc;n hướng về đối phương. Ch&agrave;ng c&oacute; thể tham khảo mẫu v&ograve;ng tay XU &ndash; được chơi chữ kh&eacute;o l&eacute;o nghĩa l&agrave; It&rsquo;s You, ch&iacute;nh l&agrave; N&agrave;ng/Ch&agrave;ng. Một th&ocirc;ng điệp s&uacute;c t&iacute;ch v&agrave; trọn vẹn cả tấm ch&acirc;n t&igrave;nh.</p>

<p><img alt="" src="/Data/images/Ngay-tai-ngo-chon-qua-y-nghia-danh-tang-nang-sau-khoang-thoi-gian-yeu-xa-2-1024x768.jpg" style="height:768px; width:1024px" /></p>
', CAST(N'2021-11-09T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Content] ([ID], [Name], [Status], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [TopHot]) VALUES (2, N'Dancing Stone – Đá Nhảy: Viên đá kỳ diệu trong ngành kim hoàn', NULL, N'dancing-stone-da-nhay-vien-da-ky-dieu-trong-nganh-kim-hoan', N'Dancing Stone – Đá Nhảy: Viên đá kỳ diệu trong ngành kim hoàn', N'/Data/images/Dancing-Stone-Da-Nhay-Vien-da-ky-dieu-trong-nganh-kim-hoan-1024x768.jpg', NULL, N'<h2><strong>Dancing Stone l&agrave; g&igrave;?</strong></h2>

<p>Dancing Stone, hay c&ograve;n gọi l&agrave; Đ&aacute; Nhảy, được biết đến l&agrave; một trong những kỳ quan của ng&agrave;nh kim ho&agrave;n. Nh&oacute;m trang sức n&agrave;y c&oacute; đặc điểm l&agrave; vi&ecirc;n đ&aacute; được đặt ngay t&acirc;m giữa, c&oacute; thể chuyển động v&agrave; phản quang &aacute;nh s&aacute;ng trong từng nhịp hoạt động của c&aacute;c chủ nh&acirc;n.</p>

<p><img alt="" src="/Data/images/Dancing-Stone-Da-Nhay-Vien-da-ky-dieu-trong-nganh-kim-hoan-1024x768.jpg" style="height:768px; width:1024px" /></p>

<p>B&iacute; mật của d&ograve;ng sản phẩm n&agrave;y nằm ở cấu tr&uacute;c của c&aacute;c khớp nối giữ vi&ecirc;n đ&aacute;. Thay v&igrave; sử dụng kỹ thuật gắn đ&aacute; truyền thống, tinh thể long lanh được cố định bằng những&nbsp; chiếc chấu si&ecirc;u nhỏ. Từ đ&oacute;, vi&ecirc;n đ&aacute; qu&yacute; sẽ lu&ocirc;n di chuyển v&agrave; ph&aacute;t ra những luồng s&aacute;ng cực kỳ h&uacute;t mắt.</p>

<h2><strong>V&igrave; sao Dancing Stone được y&ecirc;u th&iacute;ch?</strong></h2>

<p>Một trong những l&yacute; do ch&iacute;nh yếu gi&uacute;p Dancing Stone được y&ecirc;u th&iacute;ch rộng r&atilde;i ch&iacute;nh l&agrave; sự sống động. Kh&aacute;c với những m&oacute;n trang sức truyền thống, điểm nhấn đ&aacute; nhảy ghi dấu ấn bằng những tia s&aacute;ng lu&ocirc;n uyển chuyển, tựa như những người vũ c&ocirc;ng đang nhảy m&uacute;a.</p>

<p><img alt="" src="/Data/images/Dancing-Stone-Da-Nhay-Vien-da-ky-dieu-trong-nganh-kim-hoan-1-1024x768.jpg" style="height:768px; width:1024px" />Ngo&agrave;i ra, việc chế t&aacute;c trang sức đ&aacute; nhảy cũng đ&ograve;i hỏi sự khắt khe v&agrave; tinh chọn kỹ lưỡng. Để ho&agrave;n th&agrave;nh một sản phẩm, c&aacute;c nghệ nh&acirc;n phải c&oacute; tay nghề cao cũng như sự am hiểu tường tận về nghệ thuật kim ho&agrave;n. Do đ&oacute;, việc sở hữu trang sức Dancing Stone sẽ tạo cảm gi&aacute;c n&agrave;ng đang c&oacute; trong tay m&oacute;n trang sức độc đ&aacute;o, đầy m&ecirc; hoặc.<a href="https://www.pnj.com.vn/blog/ban-da-biet-ve-8-su-that-ve-kim-cuong-nu-hoang-cua-da-quy-nay-chua/">&nbsp;Xem 8 sự thật về kim cương tại đ&acirc;y.</a></p>
', CAST(N'2021-11-10T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Content] ([ID], [Name], [Status], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [TopHot]) VALUES (3, N'6 dấu hiệu rõ mồn một cho thấy đôi bạn đã sẵn sàng lập gia đình', NULL, N'6-dau-hieu-ro-mon-mot-cho-thay-doi-ban-tre-san-sang-lap-gia-dinh', N'6 dấu hiệu rõ mồn một cho thấy đôi bạn đã sẵn sàng lập gia đình', N'/Data/images/6-dau-hieu-ro-mon-mot-cho-thay-doi-ban-da-san-sang-lap-gia-dinh-4-1024x768.jpg', NULL, N'<p><img alt="" src="/Data/images/6-dau-hieu-ro-mon-mot-cho-thay-doi-ban-da-san-sang-lap-gia-dinh-4-1024x768.jpg" style="height:768px; width:1024px" /></p>

<p><em>Đ&acirc;u l&agrave; dấu hiệu cho biết cả hai đ&atilde; sẵn s&agrave;ng tiến tới h&ocirc;n nh&acirc;n? C&ugrave;ng PNJ quan s&aacute;t nh&eacute;!</em></p>

<p>V&igrave; sao c&oacute; người quen nhau 10 năm nhưng vẫn chưa kết h&ocirc;n, nhưng c&oacute; cặp đ&ocirc;i chỉ mới v&agrave;i ba th&aacute;ng đ&atilde; đi tới h&ocirc;n nh&acirc;n? Đ&acirc;y sẽ l&agrave; những dấu hiệu cho thấy đ&ocirc;i bạn đ&atilde; sẵn s&agrave;ng lập gia đ&igrave;nh, bất chấp thời gian quen nhau.</p>

<h2><strong>Ch&agrave;ng n&oacute;i về tương lai của cả hai</strong></h2>

<p>Đ&agrave;n &ocirc;ng &iacute;t mơ mộng hơn ph&aacute;i nữ. Do đ&oacute;, khi ch&agrave;ng bắt đầu n&oacute;i về tương lai của cả hai cũng l&agrave; thời điểm ch&agrave;ng đ&atilde; sẵn s&agrave;ng t&iacute;nh đến việc lập gia đ&igrave;nh c&ugrave;ng n&agrave;ng. Đ&acirc;y cũng l&agrave; c&aacute;ch m&agrave; c&aacute;c ch&agrave;ng thăm d&ograve; suy nghĩ v&agrave; cảm x&uacute;c của đối phương, để đảm bảo rằng khi m&igrave;nh ngỏ lời sẽ nhận được sự Đồng &Yacute;. Ngo&agrave;i ra, h&ocirc;n nh&acirc;n l&agrave; một h&agrave;nh tr&igrave;nh cần sự cam kết l&acirc;u d&agrave;i từ cảm x&uacute;c v&agrave; kinh tế, n&ecirc;n việc l&ecirc;n kế hoạch tương lai chứng tỏ người đ&agrave;n &ocirc;ng của bạn đang nghi&ecirc;m t&uacute;c về mối quan hệ n&agrave;y.</p>

<p><img alt="" src="/Data/images/6-dau-hieu-ro-mon-mot-cho-thay-doi-ban-da-san-sang-lap-gia-dinh-4-1024x768.jpg" style="height:768px; width:1024px" /></p>

<h2><strong>Ch&agrave;ng đầu tư v&agrave;o n&agrave;ng</strong></h2>

<p>C&oacute; một điều kh&aacute; th&uacute; vị rằng, đ&agrave;n &ocirc;ng sẽ c&oacute; xu hướng chu cấp vật chất v&agrave; thời gian v&agrave;o người m&igrave;nh y&ecirc;u. Việc đầu tư n&agrave;y kh&ocirc;ng chỉ g&oacute;i gọn l&agrave; tiền bạc, m&agrave; c&ograve;n cả thời gian v&agrave; t&igrave;nh cảm. Nếu một ch&agrave;ng trai bận rộn trong c&ocirc;ng việc v&agrave; x&acirc;y dựng sự nghiệp, m&agrave; vẫn d&agrave;nh nhiều kh&ocirc;ng gian v&agrave; thời gian c&ugrave;ng bạn th&igrave; xin ch&uacute;c mừng, n&agrave;ng đ&atilde; chọn đ&uacute;ng người rồi đấy!&nbsp;<a href="https://www.pnj.com.vn/blog/nhung-dieu-can-luu-y-khi-to-chuc-dam-cuoi-hau-covid-19/">Xem những điều cần lưu &yacute; khi tổ chức đ&aacute;m cưới hậu Covid tại đ&acirc;y.</a></p>
', CAST(N'2021-11-10T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Content] ([ID], [Name], [Status], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [TopHot]) VALUES (4, N'Ngày tái ngộ, chọn quà ý nghĩa dành tặng nàng sau khoảng thời gian yêu xa', 1, N'ngay-tai-ngo-chon-qua-y-nghia-danh-tang-nang-sau-khoang-thoi-gian-yeu-xa', N'Ngày tái ngộ, chọn quà ý nghĩa dành tặng nàng sau khoảng thời gian yêu xa', N'/Data/images/Ngay-tai-ngo-chon-qua-y-nghia-danh-tang-nang-sau-khoang-thoi-gian-yeu-xa-1024x768.jpg', NULL, N'<p><em>Sau một m&ugrave;a y&ecirc;u xa đầy ch&ocirc;ng gai, ng&agrave;y gặp lại ch&agrave;ng đừng qu&ecirc;n d&agrave;nh tặng những bất ngờ cho n&agrave;ng nh&eacute;. C&ugrave;ng PNJ tham khảo v&agrave;i gợi &yacute; sau nh&eacute;!</em></p>', CAST(N'2021-11-10T00:56:49.050' AS DateTime), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Content] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Status]) VALUES (1, N'Home', N'/', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Status]) VALUES (2, N'Blog', N'/blog', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Status]) VALUES (5, N'Cart', N'/cart', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Status]) VALUES (6, N'Sign up', N'/register', 1, 1)
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [CustomerID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (8, 3, CAST(N'2021-11-09' AS Date), N'Truong Bui', N'0961980030', N'138 Tran Binh', N'manhtruongbui63@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CustomerID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (9, 6, CAST(N'2021-11-10' AS Date), N'Truong Bui', N'0961980030', N'138 Tran Binh', N'manhtruongbui63@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CustomerID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (10, 6, CAST(N'2021-10-13' AS Date), N'Truong Bui', N'0961980030', N'138 Tran Binh', N'manhtruongbui63@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CustomerID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (11, 6, CAST(N'2021-07-13' AS Date), N'Truong Bui', N'0961980030', N'138 Tran Binh', N'manhtruongbui63@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CustomerID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (12, 4, CAST(N'2021-07-13' AS Date), N'Truong Bui', N'0961980030', N'138 Tran Binh', N'manhtruongbui63@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CustomerID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (13, 4, CAST(N'2021-08-13' AS Date), N'Truong Bui', N'0961980030', N'138 Tran Binh', N'manhtruongbui63@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CustomerID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (14, 7, CAST(N'2021-09-13' AS Date), N'Truong Bui', N'0961980030', N'138 Tran Binh', N'manhtruongbui63@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CustomerID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (15, 5, CAST(N'2021-11-13' AS Date), N'Truong Bui', N'0961980030', N'138 Tran Binh', N'manhtruongbui63@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CustomerID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (16, 5, CAST(N'2021-10-13' AS Date), N'Truong Bui', N'0961980030', N'138 Tran Binh', N'manhtruongbui63@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CustomerID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (17, 4, CAST(N'2021-11-13' AS Date), N'Truong Bui', N'0961980030', N'138 Tran Binh', N'manhtruongbui63@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CustomerID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (18, 3, CAST(N'2021-11-14' AS Date), N'Truong Bui', N'0961980030', N'138 Tran Binh', N'manhtruongbui63@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CustomerID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (19, 3, CAST(N'2021-11-14' AS Date), N'Truong Bui', N'0961980030', N'138 Tran Binh', N'manhtruongbui63@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CustomerID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (20, 3, CAST(N'2021-11-14' AS Date), N'Truong Bui', N'0961980030', N'138 Tran Binh', N'manhtruongbui63@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CustomerID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (21, 3, CAST(N'2021-11-14' AS Date), N'Truong Bui', N'0961980030', N'138 Tran Binh', N'manhtruongbui63@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CustomerID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (22, 3, CAST(N'2021-11-14' AS Date), N'Truong Bui', N'0961980030', N'138 Tran Binh', N'manhtruongbui63@gmail.com', NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (24, 13, 1, CAST(995000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (25, 9, 2, CAST(645000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (25, 21, 1, CAST(645000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (27, 9, 6, CAST(695000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (28, 15, 1, CAST(495000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (28, 16, 1, CAST(495000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (28, 20, 1, CAST(495000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (29, 12, 1, CAST(10950000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (29, 16, 1, CAST(10950000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (31, 15, 1, CAST(5549000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (32, 8, 3, CAST(295000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (32, 14, 1, CAST(295000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (32, 15, 1, CAST(295000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (32, 18, 3, CAST(295000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (34, 10, 1, CAST(264000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (34, 11, 2, CAST(264000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (34, 19, 1, CAST(264000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (34, 22, 1, CAST(264000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (35, 12, 1, CAST(389000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (35, 17, 1, CAST(389000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (36, 14, 2, CAST(455000 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [Status], [MetaTitle], [Description], [Image], [Price], [Quantity], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [TopHot]) VALUES (22, N'Nhẫn Bạc STYLE By PNJ XM00H000047', NULL, N'nhan-bac-style-by-pnj-xm00h000047', N'Nhẫn Bạc STYLE By PNJ XM00H000047', N'/Data/images/snxm00h000047-nhan-bac-style-by-pnj-01.png', CAST(695000 AS Decimal(18, 0)), 20, 8, N'<p>Thương hiệu:</p>

<p>STYLE BY PNJ</p>

<p>&nbsp;</p>

<p>Loại đ&aacute; ch&iacute;nh:</p>

<p>Xo&agrave;n mỹ</p>

<p>&nbsp;</p>

<p>Loại đ&aacute; phụ (nếu c&oacute;):</p>

<p>Kh&ocirc;ng gắn đ&aacute;</p>

<p>&nbsp;</p>

<p>Giới t&iacute;nh:</p>

<p>Nữ</p>
', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Status], [MetaTitle], [Description], [Image], [Price], [Quantity], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [TopHot]) VALUES (23, N'Nhẫn bạc đính đá STYLE By PNJ XM00X000009', NULL, N'nhan-bac-dinh-da-style-by-pnj-xm00x000009', N'Nhẫn bạc đính đá STYLE By PNJ XM00X000009', N'/Data/images/snxm00x000009-nhan-bac-dinh-da-style-by-pnj.png', CAST(765000 AS Decimal(18, 0)), 40, 8, N'<p>Thương hiệu:</p>

<p>STYLE BY PNJ</p>

<p>&nbsp;</p>

<p>Bộ sưu tập:</p>

<p>Seamyself</p>

<p>&nbsp;</p>

<p>Loại đ&aacute; ch&iacute;nh:</p>

<p>Xo&agrave;n mỹ</p>

<p>&nbsp;</p>

<p>Loại đ&aacute; phụ (nếu c&oacute;):</p>

<p>Kh&ocirc;ng gắn đ&aacute;</p>

<p>&nbsp;</p>

<p>Giới t&iacute;nh:</p>

<p>Nữ</p>
', NULL, NULL, CAST(N'2021-11-09T17:35:11.107' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Status], [MetaTitle], [Description], [Image], [Price], [Quantity], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [TopHot]) VALUES (24, N'Nhẫn bạc đính đá PNJSilver hình trái tim XMXMW060005', NULL, N'nhan-bac-dinh-da-pnjsliver-hinh-trai-tim-xmxmw060005', N'Nhẫn bạc đính đá PNJSilver hình trái tim XMXMW060005', N'/Data/images/snxmxmw060005-nhan-bac-dinh-da-pnjsilver-hinh-trai-tim.png', CAST(995000 AS Decimal(18, 0)), 12, 8, N'<p>Thương hiệu:</p>

<p>PNJSilver</p>

<p>&nbsp;</p>

<p>Loại đ&aacute; ch&iacute;nh:</p>

<p>Xo&agrave;n mỹ</p>

<p>&nbsp;</p>

<p>Loại đ&aacute; phụ (nếu c&oacute;):</p>

<p>Xoàn mỹ</p>

<p>&nbsp;</p>

<p>Giới t&iacute;nh:</p>

<p>Nữ</p>
', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Status], [MetaTitle], [Description], [Image], [Price], [Quantity], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [TopHot]) VALUES (25, N'Nhẫn Bạc đính đá ECZ STYLE By PNJ DNA XM00X000010', NULL, N'nhan-bac-dinh-da-ecz-style-by-pnj-dna-xm00x000010', N'Nhẫn Bạc đính đá ECZ STYLE By PNJ DNA XM00X000010', N'/Data/images/snxm00x000010-nhan-bac-dinh-da-ecz-style-by-pnj-dna.png', CAST(645000 AS Decimal(18, 0)), 29, 8, N'<p>Thương hiệu:</p>

<p>STYLE BY PNJ</p>

<p>&nbsp;</p>

<p>Bộ sưu tập:</p>

<p>DNA Vol 2</p>

<p>&nbsp;</p>

<p>Loại đ&aacute; ch&iacute;nh:</p>

<p>Xo&agrave;n mỹ</p>

<p>&nbsp;</p>

<p>M&agrave;u đ&aacute; ch&iacute;nh:</p>

<p>Trắng</p>

<p>&nbsp;</p>

<p>H&igrave;nh dạng đ&aacute;:</p>

<p>Tr&ograve;n</p>

<p>&nbsp;</p>

<p>Loại đ&aacute; phụ (nếu c&oacute;):</p>

<p>Kh&ocirc;ng gắn đ&aacute;</p>

<p>&nbsp;</p>

<p>Giới t&iacute;nh:</p>

<p>Nữ</p>
', NULL, NULL, CAST(N'2021-11-11T22:05:27.527' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Status], [MetaTitle], [Description], [Image], [Price], [Quantity], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [TopHot]) VALUES (26, N'Bông tai bạc đính đá PNJSilver My Feeling XMXMK000197', NULL, N'bong-tai-bac-dinh-da-pnjsliver-my-feeling-xmxmk000197', N'Bông tai bạc đính đá PNJSilver My Feeling XMXMK000197', N'/Data/images/sbxmxmk000197-bong-tai-bac-dinh-da-pnjsilver-my-feeling.png', CAST(359000 AS Decimal(18, 0)), 30, 9, N'<p>Thương hiệu:</p>

<p>PNJSilver</p>

<p>&nbsp;</p>

<p>Bộ sưu tập:</p>

<p>My Feeling</p>

<p>&nbsp;</p>

<p>Loại đ&aacute; ch&iacute;nh:</p>

<p>CZ</p>

<p>&nbsp;</p>

<p>M&agrave;u đ&aacute; ch&iacute;nh:</p>

<p>Trắng</p>

<p>&nbsp;</p>

<p>H&igrave;nh dạng đ&aacute;:</p>

<p>Tr&ograve;n</p>

<p>&nbsp;</p>

<p>Giới t&iacute;nh:</p>

<p>Nữ</p>
', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Status], [MetaTitle], [Description], [Image], [Price], [Quantity], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [TopHot]) VALUES (27, N'Bông tai bạc đính đá màu tím PNJSilver Fantasia ZTXMK000123', NULL, N'bong-tai-dinh-bac-mau-tim-pnjsliver-fantasia-ztxmk000123', N'Bông tai bạc đính đá màu tím PNJSilver Fantasia ZTXMK000123', N'/Data/images/SBZTXMK000123-bong-tai-bac-dinh-da-mau-tim-PNJSilver-Fantasia.png', CAST(695000 AS Decimal(18, 0)), 20, 9, N'<p>Thương hiệu:</p>

<p>PNJSilver</p>

<p>&nbsp;</p>

<p>Bộ sưu tập:</p>

<p>Fantasia</p>

<p>&nbsp;</p>

<p>Loại đ&aacute; ch&iacute;nh:</p>

<p>CZ</p>

<p>&nbsp;</p>

<p>M&agrave;u đ&aacute; ch&iacute;nh:</p>

<p>T&iacute;m</p>

<p>&nbsp;</p>

<p>H&igrave;nh dạng đ&aacute;:</p>

<p>Nhiều dạng</p>

<p>&nbsp;</p>

<p>Loại đ&aacute; phụ (nếu c&oacute;):</p>

<p>CZ</p>

<p>&nbsp;</p>

<p>M&agrave;u đ&aacute; phụ (nếu c&oacute;):</p>

<p>Trắng</p>

<p>&nbsp;</p>

<p>Giới t&iacute;nh:</p>

<p>Nữ</p>
', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Status], [MetaTitle], [Description], [Image], [Price], [Quantity], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [TopHot]) VALUES (28, N'Bông tai bạc đính đá PNJSilver Aura XMZTW000002', NULL, N'bong-tai-dinh-da-pnjsliver-aura-xmztw000002', N'Bông tai bạc đính đá PNJSilver Aura XMZTW000002', N'/Data/images/sbxmztw000002-bong-tai-bac-dinh-da-pnjsilver-aura.png', CAST(495000 AS Decimal(18, 0)), 24, 9, N'<p>Thương hiệu:</p>

<p>PNJSilver</p>

<p>&nbsp;</p>

<p>Bộ sưu tập:</p>

<p>Aura</p>

<p>&nbsp;</p>

<p>Loại đ&aacute; ch&iacute;nh:</p>

<p>Xo&agrave;n mỹ</p>

<p>&nbsp;</p>

<p>Loại đ&aacute; phụ (nếu c&oacute;):</p>

<p>Sythetic</p>

<p>&nbsp;</p>

<p>Giới t&iacute;nh:</p>

<p>Nữ</p>
', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Status], [MetaTitle], [Description], [Image], [Price], [Quantity], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [TopHot]) VALUES (29, N'Vòng tay bạc đính đá Disney|PNJ Snow White & the Seven Dwarfs ZTXMW000003', NULL, N'vong-tay-bac-dinh-da-disney-pnj-snow-white-the-seven-dwarfs-ztxmw000003', N'Vòng tay bạc đính đá Disney|PNJ Snow White & the Seven Dwarfs ZTXMW000003', N'/Data/images/svztxmw000003-vong-tay-bac-dinh-da-pnjsilver-snow-white-and-the-seven-dwarfs-ztxmw000003.png', CAST(10950000 AS Decimal(18, 0)), 22, 10, N'<p>Thương hiệu:</p>

<p>Disney|PNJ</p>

<p>&nbsp;</p>

<p>Bộ sưu tập:</p>

<p>Snow White &amp; the Seven Dwarfs</p>

<p>&nbsp;</p>

<p>Loại đ&aacute; ch&iacute;nh:</p>

<p>Synthetic</p>

<p>&nbsp;</p>

<p>Loại đ&aacute; phụ (nếu c&oacute;):</p>

<p>Xoàn mỹ</p>

<p>&nbsp;</p>

<p>Giới t&iacute;nh:</p>

<p>Nữ</p>
', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Status], [MetaTitle], [Description], [Image], [Price], [Quantity], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [TopHot]) VALUES (30, N'Lắc tay Vàng 18K PNJ 0000Y060452s', NULL, N'lac-tay-vang-18k-pnj-0000y060452', N'Lắc tay Vàng 18K PNJ 0000Y060452', N'/Data/images/gl0000y060452-lac-tay-vang-18k-pnj.png', CAST(17672000 AS Decimal(18, 0)), 10, 10, N'<p>Thương hiệu:</p>

<p>PNJ</p>

<p>&nbsp;</p>

<p>Loại đ&aacute; ch&iacute;nh:</p>

<p>Kh&ocirc;ng gắn đ&aacute;</p>

<p>&nbsp;</p>

<p>Loại đ&aacute; phụ (nếu c&oacute;):</p>

<p>Kh&ocirc;ng gắn đ&aacute;</p>

<p>&nbsp;</p>

<p>Giới t&iacute;nh:</p>

<p>Nữ</p>

<p>&nbsp;</p>

<p>Trọng lượng v&agrave;ng tham khảo (ph&acirc;n v&agrave;ng):</p>

<p>22.45553</p>
', NULL, NULL, CAST(N'2021-11-09T17:28:30.433' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Status], [MetaTitle], [Description], [Image], [Price], [Quantity], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [TopHot]) VALUES (31, N'Mặt dây chuyền Vàng trắng 14K đính đá Topaz PNJ TPXMW000388', NULL, N'mat-day-chuyen-vang-trang-14k-dinh-da-topaz-pnj-tpxm000388', N'Mặt dây chuyền Vàng trắng 14K đính đá Topaz PNJ TPXMW000388', N'/Data/images/gmtpxmw000388-mat-day-chuyen-vang-trang-14k-dinh-da-topaz-pnj.png', CAST(5549000 AS Decimal(18, 0)), 20, 12, N'<p>Thương hiệu:</p>

<p>PNJ</p>

<p>&nbsp;</p>

<p>Loại đ&aacute; ch&iacute;nh:</p>

<p>Topaz</p>

<p>&nbsp;</p>

<p>M&agrave;u đ&aacute; ch&iacute;nh:</p>

<p>Xanh nước biển</p>

<p>&nbsp;</p>

<p>H&igrave;nh dạng đ&aacute;:</p>

<p>Chữ nhật</p>

<p>&nbsp;</p>

<p>Loại đ&aacute; phụ (nếu c&oacute;):</p>

<p>Xoàn mỹ</p>

<p>&nbsp;</p>

<p>M&agrave;u đ&aacute; phụ (nếu c&oacute;):</p>

<p>Trắng</p>

<p>&nbsp;</p>

<p>Giới t&iacute;nh:</p>

<p>Nữ</p>

<p>&nbsp;</p>

<p>Trọng lượng v&agrave;ng tham khảo (ph&acirc;n v&agrave;ng):</p>

<p>3.60571</p>

<p>&nbsp;</p>

<p>K&iacute;ch thước đ&aacute; (tham khảo):</p>

<p>8 x 10 ly</p>
', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Status], [MetaTitle], [Description], [Image], [Price], [Quantity], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [TopHot]) VALUES (32, N'Hạt charm xỏ DIY PNJSilver hình trái tim lưới 0000L060001', NULL, N'hat-cham-xo-diy-pnjsliver-hinh-trai-tim-luoi-0L061', N'Hạt charm xỏ DIY PNJSilver hình trái tim lưới 0000L060001', N'/Data/images/si0000l060001-hat-charm-xo-diy-pnjsilver-hinh-trai-tim-luoi-01.png', CAST(295000 AS Decimal(18, 0)), 30, 14, N'<p>Thương hiệu:</p>

<p>PNJSilver</p>

<p>&nbsp;</p>

<p>Loại charm:</p>

<p>Charm xỏ</p>

<p>&nbsp;</p>

<p>Bộ sưu tập:</p>

<p>V&ograve;ng Tay Charm D.I.Y</p>

<p>&nbsp;</p>

<p>Loại đ&aacute; ch&iacute;nh:</p>

<p>Kh&ocirc;ng gắn đ&aacute;</p>

<p>&nbsp;</p>

<p>Loại đ&aacute; phụ (nếu c&oacute;):</p>

<p>Kh&ocirc;ng gắn đ&aacute;</p>

<p>&nbsp;</p>

<p>Giới t&iacute;nh:</p>

<p>Nữ</p>
', CAST(N'2021-11-09' AS Date), NULL, CAST(N'2021-11-09T20:21:22.623' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Status], [MetaTitle], [Description], [Image], [Price], [Quantity], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [TopHot]) VALUES (33, N'sản phẩm mới', NULL, N'san-pham-moi', N'san pham moi', N'/Data/images/gmtpxmw000388-mat-day-chuyen-vang-trang-14k-dinh-da-topaz-pnj.png', CAST(100000 AS Decimal(18, 0)), 20, 13, N'<p>sản phẩm detail</p>
', CAST(N'2021-11-10' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Status], [MetaTitle], [Description], [Image], [Price], [Quantity], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [TopHot]) VALUES (34, N'Nhẫn bạc đính đá PNJSilver hình Bươm bướm 00XMW060001', NULL, N'Nhan-bac-dinh-da-PNJSilver-hinh-Buom-buom-00XMW060001', N'Nhẫn bạc đính đá PNJSilver hình Bươm bướm 00XMW060001', N'/Data/images/sn00xmw060001-nhan-bac-dinh-da-pnjsilver-hinh-buom-buom-00xmw060001.png', CAST(264000 AS Decimal(18, 0)), 28, 8, N'<p>Thương hiệu:</p>

<p>PNJSilver</p>

<p>&nbsp;</p>

<p>Loại đ&aacute; ch&iacute;nh:</p>

<p>Kh&ocirc;ng gắn đ&aacute;</p>

<p>&nbsp;</p>

<p>Loại đ&aacute; phụ (nếu c&oacute;):</p>

<p>Xoàn mỹ</p>
', CAST(N'2021-11-12' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Status], [MetaTitle], [Description], [Image], [Price], [Quantity], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [TopHot]) VALUES (35, N'Nhẫn bạc PNJSilver Retro Forest NHXMK000008', NULL, N'Nhan-bac-PNJSilver-Retro-Forest-NHXMK000008', N'Nhẫn bạc PNJSilver Retro Forest NHXMK000008', N'/Data/images/snd2kn92402_200-nhan-bac-pnjsilver-retro-forest-dinh-ngoc-trai-92402_200.png', CAST(389000 AS Decimal(18, 0)), 10, 8, N'<p>Thương hiệu:</p>

<p>PNJSilver</p>

<p>&nbsp;</p>

<p>Bộ sưu tập:</p>

<p>Retro Forest</p>

<p>&nbsp;</p>

<p>M&agrave;u đ&aacute; ch&iacute;nh:</p>

<p>Hồng</p>

<p>&nbsp;</p>

<p>H&igrave;nh dạng đ&aacute;:</p>

<p>Tr&ograve;n</p>

<p>&nbsp;</p>

<p>Loại đ&aacute; phụ (nếu c&oacute;):</p>

<p>CZ</p>

<p>&nbsp;</p>

<p>M&agrave;u đ&aacute; phụ (nếu c&oacute;):</p>

<p>Trắng</p>

<p>&nbsp;</p>

<p>Giới t&iacute;nh:</p>

<p>Nữ</p>
', CAST(N'2021-11-12' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Status], [MetaTitle], [Description], [Image], [Price], [Quantity], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [TopHot]) VALUES (36, N'Bông tai bạc đính đá PNJSilver XM00H000037', 1, N'Bong-tai-bac-dinh-da-PNJSilver-XM00H000037', N'Bông tai bạc đính đá PNJSilver XM00H000037', N'/Data/images/sbxm00h000037-bong-tai-bac-dinh-da-pnjsilver.png', CAST(455000 AS Decimal(18, 0)), 11, 9, N'<p>Thương hiệu:</p>

<p>PNJSilver</p>

<p>&nbsp;</p>

<p>Bộ sưu tập:</p>

<p>The language of flowers</p>

<p>&nbsp;</p>

<p>Loại đ&aacute; ch&iacute;nh:</p>

<p>Xo&agrave;n mỹ</p>

<p>&nbsp;</p>

<p>Loại đ&aacute; phụ (nếu c&oacute;):</p>

<p>Kh&ocirc;ng gắn đ&aacute;</p>

<p>&nbsp;</p>

<p>Giới t&iacute;nh:</p>

<p>Nữ</p>
', CAST(N'2021-11-12' AS Date), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ADD_USER', NULL)
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'DELETE_USER', NULL)
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'EDIT_USER', NULL)
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'VIEW', NULL)
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [GroupID], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'admin', N'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, N'ADMIN', NULL, CAST(N'2021-10-28T17:57:01.023' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [GroupID], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, N'manhtruong', N'e10adc3949ba59abbe56e057f20f883e', N'Truong Bui', N'138 Tran Binh', N'manhtruongbui63@gmail.com', NULL, N'0961980030', CAST(N'2021-11-02T15:44:38.763' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [GroupID], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, N'hunghoang', N'93279e3308bdbbeed946fc965017f67a', N'hùng hoàng', N'120 tran thai tong', N'hungse333@gmail.com', NULL, N'0961980031', CAST(N'2021-11-02T16:00:50.363' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [GroupID], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (5, N'tranluong', N'be77f82674ab785afba1eea5396bf853', N'Trần Lương', N'nam dinh', N'tranluong@gmail.com', NULL, N'0961980033', CAST(N'2021-11-03T07:32:09.477' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [GroupID], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (6, N'buimanhtruong', N'f50d7300bf62e16a9b86c539f7ecb528', N'Bui Manh Truong', N'138 tran binh,my dinh', N'manhtruongbui@gmail.com', NULL, N'0961980030', CAST(N'2021-11-10T10:48:45.220' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Address], [Email], [GroupID], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (7, N'hoangviethung', N'891b3f3af943b470e6bd576a44c1131b', N'hoang viet hung', N'thanh hoa', N'hoangviethung@gmail.com', NULL, N'0123456789', CAST(N'2021-11-10T10:52:31.437' AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'ADMIN', N'Quản trị')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'MEMBER', N'thành viên')
GO
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_GroupID]  DEFAULT ('MEMBER') FOR [GroupID]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Status]  DEFAULT ((1)) FOR [Status]
GO
