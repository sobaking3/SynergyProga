USE [master]
GO
/****** Object:  Database [Synergy]    Script Date: 21.06.2023 22:08:30 ******/
CREATE DATABASE [Synergy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Synergy', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Synergy.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Synergy_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Synergy_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Synergy] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Synergy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Synergy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Synergy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Synergy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Synergy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Synergy] SET ARITHABORT OFF 
GO
ALTER DATABASE [Synergy] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Synergy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Synergy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Synergy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Synergy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Synergy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Synergy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Synergy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Synergy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Synergy] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Synergy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Synergy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Synergy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Synergy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Synergy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Synergy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Synergy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Synergy] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Synergy] SET  MULTI_USER 
GO
ALTER DATABASE [Synergy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Synergy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Synergy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Synergy] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Synergy] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Synergy] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Synergy] SET QUERY_STORE = ON
GO
ALTER DATABASE [Synergy] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Synergy]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 21.06.2023 22:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[IdEquipment] [int] IDENTITY(1,1) NOT NULL,
	[EqName] [nvarchar](50) NOT NULL,
	[EqNumber] [nvarchar](50) NOT NULL,
	[EqCost] [nvarchar](50) NOT NULL,
	[IdEqType] [int] NOT NULL,
	[IdWorkerInfo] [int] NULL,
 CONSTRAINT [PK_Equipment] PRIMARY KEY CLUSTERED 
(
	[IdEquipment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquipmentType]    Script Date: 21.06.2023 22:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquipmentType](
	[IdEqType] [int] IDENTITY(1,1) NOT NULL,
	[EqTypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EquipmentType] PRIMARY KEY CLUSTERED 
(
	[IdEqType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 21.06.2023 22:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[IdRole] [int] IDENTITY(1,1) NOT NULL,
	[NameRole] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[IdRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 21.06.2023 22:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[IdUser] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[IdRole] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Worker]    Script Date: 21.06.2023 22:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Worker](
	[IdWorkerInfo] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[DateOfBirth] [nvarchar](50) NOT NULL,
	[Number] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[IdUser] [int] NOT NULL,
	[PhotoStaff] [varbinary](max) NULL,
 CONSTRAINT [PK_Worker] PRIMARY KEY CLUSTERED 
(
	[IdWorkerInfo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Equipment] ON 

INSERT [dbo].[Equipment] ([IdEquipment], [EqName], [EqNumber], [EqCost], [IdEqType], [IdWorkerInfo]) VALUES (2, N'h', N'h', N'h', 1, 1)
SET IDENTITY_INSERT [dbo].[Equipment] OFF
GO
SET IDENTITY_INSERT [dbo].[EquipmentType] ON 

INSERT [dbo].[EquipmentType] ([IdEqType], [EqTypeName]) VALUES (1, N'Системный блок')
INSERT [dbo].[EquipmentType] ([IdEqType], [EqTypeName]) VALUES (2, N'Монитор')
INSERT [dbo].[EquipmentType] ([IdEqType], [EqTypeName]) VALUES (3, N'Стационарный телефон')
INSERT [dbo].[EquipmentType] ([IdEqType], [EqTypeName]) VALUES (4, N'Сканнер')
INSERT [dbo].[EquipmentType] ([IdEqType], [EqTypeName]) VALUES (5, N'Наушники')
SET IDENTITY_INSERT [dbo].[EquipmentType] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([IdRole], [NameRole]) VALUES (1, N'Администратор')
INSERT [dbo].[Roles] ([IdRole], [NameRole]) VALUES (2, N'Менеджер')
INSERT [dbo].[Roles] ([IdRole], [NameRole]) VALUES (3, N'Сотрудник')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([IdUser], [Login], [Password], [IdRole]) VALUES (1, N'admin', N'123', 1)
INSERT [dbo].[User] ([IdUser], [Login], [Password], [IdRole]) VALUES (2, N'Alex', N'999', 2)
INSERT [dbo].[User] ([IdUser], [Login], [Password], [IdRole]) VALUES (3, N'asd', N'222', 3)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[Worker] ON 

INSERT [dbo].[Worker] ([IdWorkerInfo], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Number], [Email], [IdUser], [PhotoStaff]) VALUES (1, N'teast', N'test', N'd', N'12.12.2012', N'ra', N'sd', 3, 0x89504E470D0A1A0A0000000D494844520000022C0000022C0803000000E6A902DB0000000467414D410000B18F0BFC610500000300504C5445E2242EE63F47E74C55E95A62ED767CEF8389F09196F29FA3F4ADB0F6BABDF8C8CBFDF1F2FFFFFF000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000E529FF77000000097048597300000EC200000EC20115284A800000001974455874536F667477617265007061696E742E6E657420342E302E3139D4D6B26400000A6849444154785EEDD2EB96DBB81185D1996432F1387EFFE78D2FB0DDDDE8CB21099648607F7F2481A85A4BD2FEE38B14068BE260511C2C8A834571B0280E16C5C1A2385814078BE260511C2C8A834571B0280E16C5C1A2385814078BE260511C2C8A834571B0280E16C5C1A2385814078BE260511C2C8A834571B0280E16C5C1A2385814078BE260511C2C8A834571B0280E16C5C1A2385814078BE260511C2C8A834571B0280E16C5C1A2385814078BE260511C2C8ADB85E5DF7FE8F6FDDDFECC0DC1B26AB0280E16C5C1A2385814078BE260511C2C8A834571B0280E16C5C1A2385814078BE260511C2C8A834571B0280E16C5C1A2385814078BE260511C2C8A834571B0280E16C5C1A2385814078BE260511C2C8A834571B0280E16C5C1A2385814078BE260511C2C8A834571B0280E16C5C1A2385814078BE260511C2C8A834571B0280E16C5C1A2385814078BE260511C2C8ABB3C9636AF717D6E3FEDE660592F5814078BE260511C2C8A834571B0280E16C5C1A2385814078BE260511C2C8A834571B0280E16C5C1A238581407CB5DFB4F7B2D0C969BF6D703BE202CF7ECAF477C41586ED9572BB0F4C1F24ADFACC0D2074BDF772BB0F4C1D2F5C30A2C7DB0BCAC5981A50F9617FDB4024B1F2CCFFB6505963E589EF5DB0A2C7DB03CED891558FA6079D2532BB0F4C1F2BB675660E983E557CFADC0D207CBCF5E5881A50F96D64B2BB0F4C1F2A3CE0A2C7DB07CAFB7024B1F2CDF7AC50A2C7DB07CED352BB0F4C1F2861558FA6079C30A2C7DB0BC610596BEE5B1BC650596BED5B1BC690596BEC5B1BC6D0596BEB5B1BC630596BEA5B1BC670596BE95B1BC6B0596BE85B1BC6F0596BE75B17C600596BE65B17C640596BE55B17C680596BE45B17C6C0596BE35B1045660E95B124B620596BE15B1445660E95B104B660596BEF5B0845660E95B0E4B6A0596BED5B0C45660E95B0C4B6E0596BEB5B06CB0024BDF5258B65881A56F252C9BACC0D2B710966D5660E95B07CB462BB0F42D8365AB1558FA56C1B2D90A2C7D8B60D96E0596BE35B0ECB0024BDF1258F65881A56F052CBBACC0D2B700967D5660E99B1FCB4E2BB0F44D8F65AF1558FA66C7B2DB0A2C7D9363D96F0596BEB9B11CB0024BDFD4588E5881A56F662C87ACC0D2373196635660E99B17CB412BB0F44D8BE5A81558FA66C572D80A2C7D9362396E0596BE39B10CB0024BDF9458465881A56F462C43ACC0D2372196315660E99B0FCB202BB0F44D8765941558FA66C332CC0A2C7D936119670596BEB9B00CB4024BDF5458465A81A56F262C43ADC0D2371196B15660E99B07CB602BB0F44D8365B4957FB5BD85C152D4702BFF6B8B0B83A5A619ACC052D314566029690E2BB054348915580A9AC50A2CE7378D15584E6F1E2BB09CDD44566039B999ACC0726E535981E5D4E6B202CB994D660596139BCD0A2CE7359D15584E6B3E2BB09CD584566039A919ADC0724E535A81E594E6B402CB194D6A0596139AD50A2CE39BD60A2CC39BD70A2CA39BD80A2C839BD90A2C639BDA0A2C439BDB0A2C239BDC0A2C039BDD0A2CE39ADE0A2CC39ADF0A2CA35AC00A2C835AC10A2C635AC20A2C435AC30A2C235AC40A2C035AC50A2CC75BC60A2C875BC70A2C475BC80A2C075BC90A2CC75ACA0A2C875ACB0A2C475ACC0A2C075ACD0A2CFB5BCE0A2CBB5BCF0A2C7B5BD00A2C3B5BD10A2CFB5AD20A2CBB5AD30A2C7B5AD40A2C3B5AD50A2CDB5BD60A2C9B5BD70A2C5B5BD80A2C1B5BD90A2CDB5ADA0A2C9B5ADB0A2C5B5ADC0A2C1B5ADD0A2C79CB5B81258E1558D25881258D95AFC112C5CAB7604962E57BB004B1F223583E6EB4953F6F6A0596A04F6DE3B03EB5C5770B96205A7E044B122DDF83258A966FC19245CBD76009A305963C5A60C9A30596BCE5B5C0B2A1D5B5C0B2A5C5B5C0B2A9B5B5C0B2ADA5B5C0B2B195B5C0B2B585B5C0B2B975B5C0B2BD65B5C0B2A355B5C0B2A745B5C0B2AB35B5C0B2AF25B5C0B2B315B5C0B2B705B5C0B2BBF5B4C0B2BFE5B4C072A0D5B4C072A4C5B4C072A8B5B4C072ACA5B4C072B095B4C072B485B4C072B875B4C072BC65B4C032A055B4C032A245B4C032A435B4C032A625B4C032A815B4C032AA05B4C032ACF9B5C032AEE9B5C032B0D9B5C032B2C9B5C032B4B9B5C032B6A9B5C032B899B5C032BA89B5C032BC79B5C032BE69B5C07242B36A81E58C26D502CB29CDA90596739A520B2C2735A31658CE6A422DB09CD67C5A6039AFE9B4C07262B36981E5CC26D302CBA9CDA50596739B4A0B2C2737931658CE6E222DB09CDE3C5A6039BF69B4C052D02C5A60A968122DB094348716586A9A420B2C45CDA00596AA866B697B0B83A5ACD15ADADAC260A96BB096B6B530580A1BABA52D2D0C96CA866A693B0B83A5B4915ADACAC260A96DA096B6B130588A1BA7A52D2C0C96EA866969FB0A83A5BC515ADABAC260A96F9096B6AD30581ED0182D6D5961B03CA2215ADAAEC260794823B4B45585C1F2980668699B0A83E5411DD7D2161506CBA33AACA5ED290C968775544B5B53182C8FEBA096B6A530581ED8312D6D4961B03CB2435ADA8EC260796847B4B41585C1F2D80E68691B0A83E5C1EDD7D2161406CBA3DBADA5CD1706CBC3DBABA58D1706CBE3DBA9A54D1706CB05DAA7A50D1706CB15DAA5A5CD1606CB25DAA3A58D1606CB35DAA1A54D1606CB45DAAEA50D1606CB55DAACA5CD1506CB65DAAAA58D1506CB75DAA8A54D1506CB85DAA6A50D1506CB95DAA4A5CD1406CBA5DAA2A58D1406CBB5DAA0A54D1406CBC5CAB5B481C260B95AB19676BF30582E57AAA55D2F0C96EB156A69B70B83E582655ADAE5C260B962919676B730582E59A2A55D2D0C966B166869370B83E5A27DACA55D2C0C96ABF6A19676AF30582EDB475ADAB5C260B96E1F6869B70A83E5C2BDAFA55D2A0C962BF7AE9676A730582EDD7B5ADA95C260B976EF6869370A83E5E2BDADA55D280C96ABF7A696F6BC30582EDF5B5ADAE3C260B97E6F68694F0B83E506BDAEA53D2C0C963BF4AA96F6AC30586ED16B5ADAA3C260B947AF68694F0A83E526F55ADA83C260B94B9D96765E182CB7E9A596765C182CF7E98596765A182C37EAB9967658182C77EA99967656182CB7EAA9967654182CF7EA89967652182C37EBB7967650182C77EB9796F6B930586ED74F2DED6361B0DCAFA6A57D2A0C961BF6434BFB50182C77ECBB96F6BE30586ED9372DED6D61B0DCB3AF5ADABBC260B9699F60E983E58DFE69AF85C1A2385814078BE260511C2C8A834571B0280E16C5C1A2385814078BE260511C2C8A834571B0280E16C5C1A2385814372F96CF1ADD7FDB4FBBB9CB63D175824571B0280E16C5C1A2385814078BE260511C2C8A834571B0280E16C5C1A2385814078BE260511C2C8A834571B0280E16C5C1A2385814078BE260511C2C8A834571B0280E16C5C1A2385814078BE260511C2C8A834571B0280E16C5C1A2385814078BE260511C2C8A834571B0280E16C5C1A2385814078BE260511C2C8A834571B0280E16C5C1A2385814078BE260515C15964F7FEBF67D6E7FE6867661D19AC1A2385814078BE260511C2C8A834571B0280E16C5C1A2385814078BE260511C2C8A834571B0280E16C5C1A2385814078BE260511C2C8A834571B0280E16C5C1A2385814078BE260511C2C8A834571B0280E16C5C1A2385814078BE260511C2C8A834571B0280E16C5C1A2385814078BE260511C2C8A834571B0280E16C5C1A2B02F5FFE0F8C1CDA90FCA688610000000049454E44AE426082)
SET IDENTITY_INSERT [dbo].[Worker] OFF
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_EquipmentType] FOREIGN KEY([IdEqType])
REFERENCES [dbo].[EquipmentType] ([IdEqType])
GO
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [FK_Equipment_EquipmentType]
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_Worker] FOREIGN KEY([IdWorkerInfo])
REFERENCES [dbo].[Worker] ([IdWorkerInfo])
GO
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [FK_Equipment_Worker]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Roles] FOREIGN KEY([IdRole])
REFERENCES [dbo].[Roles] ([IdRole])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Roles]
GO
ALTER TABLE [dbo].[Worker]  WITH CHECK ADD  CONSTRAINT [FK_Worker_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([IdUser])
GO
ALTER TABLE [dbo].[Worker] CHECK CONSTRAINT [FK_Worker_User]
GO
USE [master]
GO
ALTER DATABASE [Synergy] SET  READ_WRITE 
GO
