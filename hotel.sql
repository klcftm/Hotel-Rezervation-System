USE [hotel]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 13.01.2019 01:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[admin_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[password] [varchar](50) NULL,
 CONSTRAINT [PK_admin] PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[checkin]    Script Date: 13.01.2019 01:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[checkin](
	[checkin_id] [int] IDENTITY(1,1) NOT NULL,
	[cfirstname] [varchar](50) NULL,
	[clastname] [varchar](50) NULL,
	[croom_type] [varchar](50) NULL,
	[days] [int] NULL,
	[extrabed] [int] NULL,
	[bill] [int] NULL,
	[checkin_time] [datetime] NULL,
	[checkout] [datetime] NULL,
 CONSTRAINT [PK_checkin] PRIMARY KEY CLUSTERED 
(
	[checkin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[durum]    Script Date: 13.01.2019 01:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[durum](
	[transaction_id] [int] IDENTITY(1,1) NOT NULL,
	[status] [varchar](50) NULL,
 CONSTRAINT [PK_durum] PRIMARY KEY CLUSTERED 
(
	[transaction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[guest]    Script Date: 13.01.2019 01:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[guest](
	[guest_id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [varchar](50) NULL,
	[lastname] [varchar](50) NULL,
	[contactno] [varchar](50) NULL,
 CONSTRAINT [PK_guest] PRIMARY KEY CLUSTERED 
(
	[guest_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hakkimizda]    Script Date: 13.01.2019 01:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hakkimizda](
	[genel] [varchar](50) NULL,
	[odalar] [varchar](50) NULL,
	[restoran] [varchar](50) NULL,
	[plaj] [varchar](50) NULL,
	[spa] [varchar](50) NULL,
	[aktivite] [varchar](50) NULL,
	[diger] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[iletisim]    Script Date: 13.01.2019 01:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[iletisim](
	[adres] [varchar](500) NULL,
	[telefon] [varchar](50) NULL,
	[fax] [varchar](50) NULL,
	[email] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[room]    Script Date: 13.01.2019 01:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[room](
	[room_id] [int] IDENTITY(1,1) NOT NULL,
	[room_type] [varchar](50) NULL,
	[photo] [int] NULL,
	[checkin] [datetime] NULL,
	[price] [int] NULL,
 CONSTRAINT [PK_room] PRIMARY KEY CLUSTERED 
(
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[admin] ON 

INSERT [dbo].[admin] ([admin_id], [name], [password]) VALUES (1002, N'fatma', N'123')
SET IDENTITY_INSERT [dbo].[admin] OFF
SET IDENTITY_INSERT [dbo].[durum] ON 

INSERT [dbo].[durum] ([transaction_id], [status]) VALUES (1, N'Beklemede')
INSERT [dbo].[durum] ([transaction_id], [status]) VALUES (2, N'Kayıtlı')
INSERT [dbo].[durum] ([transaction_id], [status]) VALUES (3, N'Beklemede')
SET IDENTITY_INSERT [dbo].[durum] OFF
INSERT [dbo].[hakkimizda] ([genel], [odalar], [restoran], [plaj], [spa], [aktivite], [diger]) VALUES (N'genel', N'odalar', N'restoran', N'plaj', N'spa', N'aktivite', N'diger')
INSERT [dbo].[iletisim] ([adres], [telefon], [fax], [email]) VALUES (N'Konakli Mevki, Ahmet Salih Saf Sok 2/D, 07400 Alanya/Antalya', N' (0242) 510 53 53', N'+90 242 260 42 46', N'alanyaboss@otelgallery.com.tr')
SET IDENTITY_INSERT [dbo].[room] ON 

INSERT [dbo].[room] ([room_id], [room_type], [photo], [checkin], [price]) VALUES (1, N'Standard', 1, CAST(N'2012-12-04T00:00:00.000' AS DateTime), 250)
INSERT [dbo].[room] ([room_id], [room_type], [photo], [checkin], [price]) VALUES (2, N'Superior', 5, CAST(N'2012-12-06T00:00:00.000' AS DateTime), 350)
INSERT [dbo].[room] ([room_id], [room_type], [photo], [checkin], [price]) VALUES (3, N'Super Deluxe', 4, CAST(N'1900-01-01T00:00:00.000' AS DateTime), 450)
INSERT [dbo].[room] ([room_id], [room_type], [photo], [checkin], [price]) VALUES (4, N'Executive Deluxe', 3, CAST(N'2019-01-08T00:00:00.000' AS DateTime), 650)
INSERT [dbo].[room] ([room_id], [room_type], [photo], [checkin], [price]) VALUES (5, N'Jr.Suite', 6, CAST(N'2019-01-09T00:00:00.000' AS DateTime), 850)
SET IDENTITY_INSERT [dbo].[room] OFF
