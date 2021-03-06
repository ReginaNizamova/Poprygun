USE [master]
GO
/****** Object:  Database [Agents]    Script Date: 13.12.2021 17:27:59 ******/
CREATE DATABASE [Agents]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Agents', FILENAME = N'D:\SQL\Agent\Agents.mdf' , SIZE = 2097152KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1048576KB )
 LOG ON 
( NAME = N'Agents_log', FILENAME = N'D:\SQL\Agent\Agents_log.ldf' , SIZE = 1048576KB , MAXSIZE = 2097152KB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Agents] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Agents].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Agents] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Agents] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Agents] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Agents] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Agents] SET ARITHABORT OFF 
GO
ALTER DATABASE [Agents] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Agents] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Agents] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Agents] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Agents] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Agents] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Agents] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Agents] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Agents] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Agents] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Agents] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Agents] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Agents] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Agents] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Agents] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Agents] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Agents] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Agents] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Agents] SET  MULTI_USER 
GO
ALTER DATABASE [Agents] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Agents] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Agents] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Agents] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Agents] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Agents] SET QUERY_STORE = OFF
GO
USE [Agents]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 13.12.2021 17:27:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[AgentTypeID] [int] NOT NULL,
	[Address] [nvarchar](300) NULL,
	[INN] [float] NOT NULL,
	[KPP] [float] NULL,
	[DirectorName] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Logo] [nvarchar](100) NULL,
	[Priority] [int] NOT NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentPriorityHistory]    Script Date: 13.12.2021 17:27:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentPriorityHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[PriorityValue] [int] NOT NULL,
 CONSTRAINT [PK_AgentPriorityHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentType]    Script Date: 13.12.2021 17:27:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](100) NULL,
 CONSTRAINT [PK_AgentType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 13.12.2021 17:27:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[CountInPack] [int] NOT NULL,
	[Unit] [nvarchar](10) NOT NULL,
	[CountInStock] [float] NULL,
	[MinCount] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[Image] [nvarchar](100) NULL,
	[MaterialTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialCountHistory]    Script Date: 13.12.2021 17:27:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialCountHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CountValue] [float] NOT NULL,
 CONSTRAINT [PK_MaterialCountHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialSupplier]    Script Date: 13.12.2021 17:27:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialSupplier](
	[MaterialID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
 CONSTRAINT [PK_MaterialSupplier] PRIMARY KEY CLUSTERED 
(
	[MaterialID] ASC,
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 13.12.2021 17:27:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NOT NULL,
 CONSTRAINT [PK_MaterialType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 13.12.2021 17:27:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[ProductTypeID] [int] NULL,
	[ArticleNumber] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](100) NULL,
	[ProductionPersonCount] [int] NULL,
	[ProductionWorkshopNumber] [int] NULL,
	[MinCostForAgent] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCostHistory]    Script Date: 13.12.2021 17:27:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCostHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CostValue] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_ProductCostHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMaterial]    Script Date: 13.12.2021 17:27:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMaterial](
	[ProductID] [int] NOT NULL,
	[MaterialID] [int] NOT NULL,
	[Count] [float] NULL,
 CONSTRAINT [PK_ProductMaterial] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 13.12.2021 17:27:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[SaleDate] [date] NOT NULL,
	[ProductCount] [int] NOT NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 13.12.2021 17:27:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 13.12.2021 17:27:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[Address] [nvarchar](300) NULL,
	[AgentID] [int] NOT NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 13.12.2021 17:27:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[INN] [varchar](12) NOT NULL,
	[StartDate] [date] NOT NULL,
	[QualityRating] [int] NULL,
	[SupplierType] [nvarchar](20) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Agent] ON 

INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (1, N'ВодТверьХозМашина', 1, N'145030, Сахалинская область, город Шатура, въезд Гоголя, 79', 4174253174, 522227145, N'Жданова Александра Дмитриевна ', N'+7(922)849-91-96', N'tkrylov@baranova.net', N'\agents\agent_56.png', 8)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (2, N'МясРеч', 1, N'903648, Калужская область, город Воскресенск, пр. Будапештсткая, 91', 9254261217, 656363498, N'Белоусова Ирина Максимовна', N'8-800-453-63-45', N'bkozlov@volkov.ru', N'\agents\agent_58.png', 355)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (3, N'Флот', 1, N'505562, Тюменская область, город Наро-Фоминск, пр. Косиора, 11', 1112170258, 382584255, N'Ковалёв Василий Андреевич', N'8-800-144-25-38', N'gerasim.makarov@kornilov.ru', N'\agents\agent_87.png', 473)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (4, N'СибПивОмскСнаб', 1, N'816260, Ивановская область, город Москва, ул. Гагарина, 31', 5676173945, 256512286, N'Сафонова Людмила Александровна', N'+7(922)153-95-22', N'evorontova@potapova.ru', N'\agents\agent_46.png', 477)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (5, N'ЦементАсбоцемент', 1, N'619540, Курская область, город Раменское, пл. Балканская, 12', 4345774724, 352469905, N'Воронова Мария Александровна', N'(495)184-87-92', N'polykov.veronika@artemeva.ru', N'отсутствует', 426)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (6, N'ТелеГлавВекторСбыт', 1, N'062489, Челябинская область, город Пушкино, въезд Бухарестская, 07', 9504787157, 419758597, N'Ковалёва Екатерина Фёдоровна', N'(35222)56-15-37', N'nsitnikov@kovaleva.ru', N'\agents\agent_31.png', 185)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (7, N'ЭлектроРемОрионЛизинг', 1, N'594365, Ярославская область, город Павловский Посад, бульвар Космонавтов, 64', 1340072597, 500478249, N'Тарасов Дан Львович', N'(495)519-97-41', N'anfisa.fedotova@tvetkov.ru', N'\agents\agent_68.png', 198)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (8, N'ОрионСофтВодСнос', 1, N'577227, Калужская область, город Павловский Посад, наб. Чехова, 35', 1522348613, 977738715, N'Мухин Ян Фёдорович', N'(35222)59-75-11', N'isukanov@sobolev.com', N'\agents\agent_97.png', 361)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (9, N'ЦементКрепТех-М', 1, N'263764, Свердловская область, город Раменское, пер. Косиора, 28', 5359981084, 680416300, N'Сергеев Владлен Александрович', N'(812)838-79-58', N'yna.evdokimov@gordeeva.ru', N'\agents\agent_82.png', 189)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (10, N'БашкирЮпитерТомск', 1, N'035268, Сахалинская область, город Волоколамск, проезд Ладыгина, 51', 1606315697, 217799345, N'Фадеева Раиса Александровна', N'(812)189-59-57', N'dyckov.veniamin@kotova.ru', N'\agents\agent_59.png', 139)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (11, N'СервисХмельМонтаж', 1, N'928260, Нижегородская область, город Балашиха, пл. Косиора, 44', 3459886235, 356196105, N'Горбунова Анжелика Дмитриевна', N'+7(922)344-73-38', N'galina31@melnikov.ru', N'\agents\agent_92.png', 124)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (12, N'Рем', 1, N'707812, Иркутская область, город Шаховская, ул. Гагарина, 17', 3203830728, 456254820, N'Шарова Елизавета Львовна', N'(495)987-88-53', N'zanna25@nikiforova.com', N'\agents\agent_79.png', 329)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (13, N'Вод', 1, N'964386, Оренбургская область, город Чехов, пл. Косиора, 80', 1296063939, 447430051, N'Селезнёва Зоя Романовна', N'(495)142-19-84', N'savva86@zaiteva.ru', N'\agents\agent_129.png', 359)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (14, N'СофтРосБух', 1, N'747695, Амурская область, город Сергиев Посад, въезд Бухарестская, 46', 8321561226, 807803984, N'Белова Полина Владимировна', N'+7(922)445-69-17', N'ivanova.antonin@rodionov.ru', N'\agents\agent_124.png', 69)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (15, N'УралСтройХмель', 1, N'462632, Костромская область, город Шаховская, шоссе Сталина, 92', 8773558039, 402502867, N'Красильников Август Борисович ', N'(35222)39-23-65', N'aleksandr95@kolobova.ru', N'\agents\agent_113.png', 372)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (16, N'ТекстильУралАвтоОпт', 1, N'028936, Магаданская область, город Видное, ул. Гагарина, 54', 3930950057, 678529397, N'Дьячкова Алина Сергеевна ', N'(35222)98-76-54', N'hkononova@pavlova.ru', N'отсутствует', 176)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (17, N'Креп', 1, N'336489, Калининградская область, город Можайск, наб. Славы, 35', 4880732317, 258673591, N'Григорьев Назар Алексеевич ', N'(495)217-46-29', N'savina.dominika@belousova.com', N'\agents\agent_39.png', 371)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (18, N'МонтажОрионУрал', 2, N'027573, Тамбовская область, город Коломна, ул. Ленина, 20', 1692286718, 181380912, N'Давыдова Нина Евгеньевна', N'(35222)67-39-26', N'pzaitev@blokin.org', N'\agents\agent_96.png', 50)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (19, N'МетизСтрой', 2, N'254238, Нижегородская область, город Павловский Посад, проезд Балканская, 23', 4024742936, 295608432, N'Беспалова Ева Борисовна ', N'8-800-172-62-56', N'kristina.pakomov@burova.ru', N'\agents\agent_94.png', 374)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (20, N'Гор', 2, N'376483, Калужская область, город Сергиев Посад, ул. Славы, 09', 7088187045, 440309946, N'Одинцова Нонна Львовна ', N'(495)973-48-55', N'maiy12@koklov.net', N'\agents\agent_52.png', 175)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (21, N'ТверьХозМорСбыт', 2, N'252101, Ростовская область, город Дорохово, пер. Ленина, 85', 6681338084, 460530907, N'Субботин Аким Львович', N'(495)416-75-67', N'marina58@koroleva.com', N'\agents\agent_117.png', 207)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (22, N'ГазДизайнЖелДор', 2, N'695230, Курская область, город Красногорск, пр. Гоголя, 64', 2396029740, 458924890, N'Третьяков Лев Иванович', N'(495)797-97-33', N'elizaveta.komarov@rybakov.net', N'\agents\agent_49.png', 236)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (23, N'ЮпитерЛенГараж-М', 2, N'339507, Московская область, город Видное, ул. Космонавтов, 11', 2038393690, 259672761, N'Васильева Валерия Борисовна', N'(495)327-58-25', N'larkipova@gorbunov.ru', N'\agents\agent_48.png', 470)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (24, N'СибГаз', 2, N'365674, Архангельская область, город Серебряные Пруды, пр. Ленина, 29', 6483417250, 455013058, N'Третьяков Вячеслав Романович', N'(495)945-37-25', N'inna.sarova@panfilov.ru', N'\agents\agent_103.png', 488)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (25, N'БашкирФлотМотор-H', 2, N'008081, Тюменская область, город Ногинск, въезд Гагарина, 94', 1657476072, 934931159, N'Фролов Марат Алексеевич ', N'(495)793-84-82', N'morozova.nika@kazakova.ru', N'\agents\agent_36.png', 416)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (26, N'ТелекомЮпитер', 2, N'959793, Курская область, город Егорьевск, бульвар Ленина, 72', 9383182378, 944520594, N'Калинина Татьяна Ивановна', N'(812)895-67-23', N'kulikov.adrian@zuravlev.org', N'\agents\agent_81.png', 302)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (27, N'СибБашкирТекстиль', 2, N'429540, Мурманская область, город Воскресенск, пл. Славы, 36', 7392007090, 576103661, N'Елисеев Григорий Владимирович ', N'(495)285-78-38', N'vzimina@zdanova.com', N'\agents\agent_69.png', 218)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (28, N'МеталТекстильЛифтТрест', 2, N'786287, Свердловская область, город Волоколамск, пер. Будапештсткая, 72', 2971553297, 821859486, N'Одинцов Назар Борисович', N'(812)753-96-76', N'muravev.trofim@sazonov.net', N'\agents\agent_86.png', 425)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (29, N'Монтаж', 3, N'066594, Магаданская область, город Шаховская, спуск Сталина, 59', 6142194281, 154457435, N'Блохин Сергей Максимович', N'(495)867-76-15', N'zakar.sazonova@gavrilov.ru', N'отсутствует', 300)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (30, N'Газ', 3, N'252821, Тамбовская область, город Пушкино, ул. Чехова, 40', 8876413796, 955381891, N'Терентьев Илларион Максимович', N'(35222)22-45-58', N'ulyna.antonov@noskov.ru', N'\agents\agent_76.png', 170)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (31, N'ГлавITФлотПроф', 3, N'447811, Мурманская область, город Егорьевск, ул. Ленина, 24', 2561361494, 525678825, N'Зыков Стефан Максимович', N'(812)146-66-46', N'savva.rybov@kolobov.ru', N'\agents\agent_64.png', 62)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (32, N'Гараж', 3, N'585758, Самарская область, город Красногорск, бульвар Балканская, 13', 2638464552, 746822723, N'Панфилов Константин Максимович', N'(35222)54-72-59', N'antonin51@korolev.com', N'\agents\agent_90.png', 107)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (33, N'СантехБашкир', 3, N'180288, Тверская область, город Одинцово, ул. Бухарестская, 37', 4159215346, 639267493, N'Молчанов Виктор Иванович', N'+7(922)155-87-39', N'nikodim81@kiseleva.com', N'\agents\agent_99.png', 369)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (34, N'ВостокКазРыб', 3, N'059565, Оренбургская область, город Истра, шоссе Домодедовская, 27', 7411284960, 176779733, N'Самсонов Родион Романович', N'(495)987-31-63', N'flukin@misin.org', N'\agents\agent_112.png', 361)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (35, N'Строй', 3, N'763019, Омская область, город Шатура, пл. Сталина, 56', 6678884759, 279288618, N'Кудрявцев Адриан Андреевич', N'(812)447-45-59', N'soloveva.adam@andreev.ru', N'отсутствует', 12)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (36, N'АсбоцементТехАвто', 3, N'304975, Пензенская область, город Солнечногорск, шоссе Балканская, 76', 7626076463, 579234124, N'Сидорова Любовь Ивановна', N'+7(922)977-68-84', N'matveev.yliy@kiseleva.ru', N'\agents\agent_110.png', 247)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (37, N'Транс', 3, N'508299, Кемеровская область, город Кашира, пер. Гагарина, 42', 9604275878, 951258069, N'Евсеев Болеслав Сергеевич', N'8-800-954-23-89', N'artem.fadeev@polykov.com', N'\agents\agent_127.png', 38)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (38, N'Бух', 3, N'409600, Новгородская область, город Ногинск, пл. Гагарина, 68', 1953785418, 122905583, N'Королёва Татьяна Сергеевна ', N'+7(922)375-49-21', N'belova.vikentii@konstantinova.net', N'\agents\agent_78.png', 82)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (39, N'РадиоСевер', 4, N'491360, Московская область, город Одинцово, въезд Ленина, 19', 5889206249, 372789083, N'Карпов Иосиф Максимович', N'(495)368-86-51', N'maiy.belov@rogov.ru', N'\agents\agent_123.png', 431)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (40, N'Тех', 4, N'731935, Калининградская область, город Павловский Посад, наб. Гагарина, 59', 9282924869, 587356429, N'Логинов Аким Романович', N'+7(922)427-13-31', N'vasilisa99@belyev.ru', N'\agents\agent_61.png', 278)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (41, N'Инфо', 4, N'100469, Рязанская область, город Ногинск, шоссе Гагарина, 57', 6549468639, 718386757, N'Баранов Виктор Романович', N'8-800-793-59-97', N'arsenii.mikailova@prokorov.com', N'\agents\agent_89.png', 304)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (42, N'МясТрансМоторЛизинг', 4, N'765320, Ивановская область, город Шатура, спуск Гоголя, 88', 6148685143, 196332656, N'Семёнова Тамара Дмитриевна', N'+7(922)676-34-94', N'vlad.sokolov@andreev.org', N'\agents\agent_62.png', 268)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (43, N'ЭлектроТранс', 4, N'434616, Калининградская область, город Павловский Посад, пл. Ладыгина, 83', 6019144874, 450629885, N'Титов Сава Александрович ', N'(812)342-24-31', N'boleslav.zukova@nikiforova.com', N'\agents\agent_91.png', 129)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (44, N'Электро', 4, N'966815, Новгородская область, город Одинцово, пр. Космонавтов, 19', 7896029866, 786038848, N'Шарапова Елена Дмитриевна', N'8-800-714-36-41', N'likacev.makar@antonov.ru', N'\agents\agent_93.png', 366)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (45, N'РемСантехОмскБанк', 4, N'289468, Омская область, город Видное, пер. Балканская, 33', 6823050572, 176488617, N'Фокина Искра Максимовна', N'(812)182-44-77', N'anisimov.mark@vorobev.ru', N'\agents\agent_57.png', 442)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (46, N'ЭлектроМоторТрансСнос', 4, N'913777, Самарская область, город Красногорск, ул. Бухарестская, 49', 6608362851, 799760512, N'Новикова Людмила Евгеньевна ', N'(35222)43-62-19', N'inessa.voronov@sidorova.ru', N'отсутствует', 151)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (47, N'РемГаражЛифт', 4, N'048715, Ивановская область, город Люберцы, проезд Космонавтов, 89', 1656477206, 988968838, N'Филатов Владимир Максимович', N'8-800-772-27-53', N'novikova.gleb@sestakov.ru', N'\agents\agent_65.png', 374)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (48, N'КазХоз', 4, N'384162, Астраханская область, город Одинцово, бульвар Гагарина, 57', 6503377671, 232279972, N'Степанов Роман Иванович', N'+7(922)728-85-62', N'istrelkova@fomin.ru', N'отсутствует', 213)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (49, N'ХозЮпитер', 4, N'038182, Курганская область, город Москва, спуск Космонавтов, 16', 6667635058, 380592865, N'Максимова Вера Фёдоровна', N'+7(922)332-48-96', N'jisakova@nazarova.com', N'\agents\agent_114.png', 375)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (50, N'ВодГараж', 4, N'988899, Саратовская область, город Раменское, пр. Славы, 40', 5575072431, 684290320, N'Логинов Лаврентий Фёдорович ', N'+7(922)363-86-67', N'pmaslov@fomiceva.com', N'\agents\agent_67.png', 250)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (51, N'СтройГорНефть', 4, N'444539, Ульяновская область, город Лотошино, спуск Будапештсткая, 95', 5916775587, 398299418, N'Тарасов Макар Максимович', N'(812)385-21-37', N'lysy.kolesnikova@molcanova.com', N'\agents\agent_37.png', 161)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (52, N'Софт', 4, N'453714, Смоленская область, город Одинцово, спуск Косиора, 84', 3889910123, 952047511, N'Петухов Прохор Фёдорович', N'(35222)12-82-65', N'jterentev@ersov.com', N'\agents\agent_122.png', 292)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (53, N'ТелекомГор', 4, N'210024, Белгородская область, город Сергиев Посад, наб. Ломоносова, 43', 3748947224, 766431901, N'Михайлова Ксения Андреевна ', N'(35222)78-93-21', N'gorskov.larisa@kalinin.com', N'\agents\agent_98.png', 255)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (54, N'ЮпитерТяжОрионЭкспедиция', 4, N'960726, Томская область, город Орехово-Зуево, въезд 1905 года, 51', 6843174002, 935556458, N'Виноградов Валерий Евгеньевич ', N'(35222)95-63-65', N'gblokin@orlov.net', N'\agents\agent_44.png', 446)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (55, N'РемВод', 4, N'449723, Смоленская область, город Наро-Фоминск, пер. Ломоносова, 94', 3986603105, 811373078, N'Медведева Ярослава Фёдоровна', N'+7(922)353-31-72', N'komarov.elizaveta@agafonova.ru', N'\agents\agent_126.png', 1)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (56, N'ВодГор', 4, N'265653, Калужская область, город Ступино, шоссе Гоголя, 89', 4463113470, 899603778, N'Филиппова Фаина Фёдоровна ', N'(35222)73-72-16', N'tvetkova.robert@sorokin.com', N'\agents\agent_125.png', 72)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (57, N'ТяжРадиоУралПроф', 4, N'521087, Орловская область, город Егорьевск, шоссе Ладыгина, 14', 5688533246, 401535045, N'Мухина София Алексеевна', N'+7(922)885-66-15', N'liliy62@grisina.ru', N'\agents\agent_88.png', 278)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (58, N'ГаражЛофт', 4, N'294596, Мурманская область, город Шаховская, пр. Домодедовская, 88', 2816939574, 754741128, N'Кудряшова Клавдия Фёдоровна ', N'(495)427-55-66', N'lydmila.belyeva@karpov.ru', N'\agents\agent_108.png', 335)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (59, N'ITСтройАлмаз', 4, N'361730, Костромская область, город Волоколамск, шоссе Славы, 36', 7689065648, 456612755, N'Алексеев Валериан Андреевич', N'8-800-185-78-91', N'fokin.eduard@samoilov.com', N'\agents\agent_83.png', 159)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (60, N'КазаньТекстиль', 4, N'231891, Челябинская область, город Шатура, бульвар Ладыгина, 40', 4584384019, 149680499, N'Александров Бронислав Максимович', N'(35222)86-74-21', N'osimonova@andreeva.com', N'\agents\agent_47.png', 156)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (61, N'КазЮпитерТомск', 4, N'393450, Тульская область, город Кашира, пр. 1905 года, 47', 9201745524, 510248846, N'Копылов Рафаил Андреевич', N'+7(922)772-33-58', N'tgavrilov@frolov.ru', N'\agents\agent_60.png', 244)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (62, N'Мобайл', 4, N'606703, Амурская область, город Чехов, пл. Будапештсткая, 91', 7803888520, 885703265, N'Бобылёва Екатерина Сергеевна ', N'8-800-618-73-37', N'dsiryev@dementeva.com', N'\agents\agent_107.png', 464)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (63, N'БухМясМоторПром', 4, N'677498, Костромская область, город Зарайск, спуск Славы, 59', 7377410338, 592041317, N'Чернова Нина Дмитриевна ', N'(35222)83-23-59', N'varvara49@savin.ru', N'\agents\agent_95.png', 158)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (64, N'Компания КазАлмаз', 5, N'848810, Кемеровская область, город Лотошино, пер. Ломоносова, 90', 3084797352, 123190924, N'Муравьёв Марк Фёдорович ', N'8-800-533-24-75', N'irina.gusina@vlasova.ru', N'\agents\agent_80.png', 396)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (65, N'Компания СервисРадиоГор', 5, N'547196, Ульяновская область, город Серебряные Пруды, въезд Балканская, 81', 8880473721, 729975116, N'Попов Вадим Александрович', N'8-800-676-32-86', N'nika.nekrasova@kovalev.ru', N'\agents\agent_40.png', 169)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (66, N'ТверьМетизУралСнос', 5, N'880551, Ленинградская область, город Красногорск, ул. Гоголя, 61', 1076095397, 947828491, N'Соболева Зоя Андреевна', N'(35222)57-92-75', N'rlazareva@novikov.ru', N'\agents\agent_109.png', 165)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (67, N'Компания ТелекомХмельГаражПром', 5, N'126668, Ростовская область, город Зарайск, наб. Гагарина, 69', 1614623826, 824882264, N'Костина Татьяна Борисовна', N'(812)983-91-73', N'qkolesnikova@kalinina.ru', N'\agents\agent_71.png', 457)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (68, N'Компания Алмаз', 5, N'016215, Воронежская область, город Зарайск, ул. Косиора, 48', 6698862694, 662876919, N'Фомина Лариса Романовна', N'+7(922)688-74-22', N'akalinina@zaitev.ru', N'\agents\agent_121.png', 259)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (69, N'ВостокГлав', 5, N'217022, Ростовская область, город Озёры, ул. Домодедовская, 19', 3580946305, 405017349, N'Дмитриева Инга Фёдоровна', N'(812)949-29-26', N'gordei95@kirillov.ru', N'\agents\agent_63.png', 107)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (70, N'Компания Гараж', 5, N'395101, Белгородская область, город Балашиха, бульвар 1905 года, 00', 6190244524, 399106161, N'Ларионова Владлена Фёдоровна ', N'+7(922)848-38-54', N'asiryeva@andreeva.com', N'\agents\agent_66.png', 413)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (71, N'Компания ТомскХоз', 5, N'861543, Томская область, город Истра, бульвар Славы, 42', 8430391035, 961540858, N'Лазарев Аркадий Сергеевич', N'+7(922)849-13-37', N'nelli11@gureva.ru', N'\agents\agent_115.png', 464)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (72, N'Компания МясДизайнДизайн', 5, N'557264, Брянская область, город Серпухов, въезд Гоголя, 34', 8004989990, 908629456, N'Стрелкова Клементина Сергеевна', N'(812)535-17-25', N'gleb.gulyev@belyeva.com', N'\agents\agent_53.png', 491)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (73, N'Компания ЖелДорТверьМонтаж', 5, N'152424, Рязанская область, город Сергиев Посад, ул. 1905 года, 27', 3325722996, 665766347, N'Гуляев Нестор Максимович ', N'(495)521-61-75', N'burova.zlata@zueva.ru', N'\agents\agent_85.png', 2)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (74, N'МетизТехАвтоПроф', 5, N'713016, Брянская область, город Подольск, пл. Домодедовская, 93', 2988890076, 215491048, N'Третьяков Егор Фёдорович', N'(495)581-42-46', N'anastasiy.gromov@samsonova.com', N'\agents\agent_33.png', 321)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (75, N'Компания КазМеталКазань', 5, N'532703, Пензенская область, город Чехов, наб. Чехова, 81', 4598939812, 303467543, N'Хохлов Валерий Владимирович ', N'(495)685-34-29', N'mmoiseev@teterin.ru', N'\agents\agent_130.png', 252)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (76, N'Компания Газ', 5, N'310403, Кировская область, город Солнечногорск, пл. Балканская, 76', 2262431140, 247369527, N'Фадеев Давид Андреевич', N'(35222)75-96-85', N'alina56@zdanov.com', N'\agents\agent_120.png', 445)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (77, N'Компания Монтаж', 5, N'036381, Брянская область, город Кашира, бульвар Гагарина, 76', 6206428565, 118570048, N'Силин Даниил Иванович', N'(35222)92-45-98', N'afanasev.anastasiy@muravev.ru', N'\agents\agent_75.png', 124)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (78, N'СантехСеверЛенМашина', 5, N'606990, Новосибирская область, город Павловский Посад, въезд Домодедовская, 38', 3506691089, 830713603, N'Рожков Павел Максимович ', N'(812)918-88-43', N'pgorbacev@vasilev.net', N'\agents\agent_74.png', 201)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (79, N'Цемент', 5, N'084315, Амурская область, город Шаховская, наб. Чехова, 62', 9662118663, 650216214, N'Бурова Анфиса Фёдоровна', N'8-800-517-78-47', N'panova.klementina@bobrov.ru', N'\agents\agent_54.png', 340)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (80, N'Компания Хмель', 5, N'889757, Новосибирская область, город Раменское, бульвар 1905 года, 93', 9004087602, 297273898, N'Суворов Владимир Борисович ', N'(812)421-77-82', N'ermakov.mark@isakova.ru', N'отсутствует', 2)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (81, N'Компания ВодАлмазIT', 5, N'302100, Нижегородская область, город Мытищи, пер. 1905 года, 63', 2345297765, 908449277, N'Гуляев Егор Евгеньевич', N'(35222)52-76-16', N'zakar37@nikolaeva.ru', N'\agents\agent_111.png', 31)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (82, N'Компания ФинансСервис', 5, N'841700, Брянская область, город Серпухов, спуск Домодедовская, 35', 7491491391, 673621812, N'Виноградова Клавдия Сергеевна ', N'(812)878-42-71', N'robert.serbakov@safonova.ru', N'\agents\agent_38.png', 395)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (83, N'Лифт', 5, N'479565, Курганская область, город Клин, пл. Ленина, 54', 6169713039, 848972934, N'Денисова Вера Евгеньевна ', N'(812)484-92-38', N'zinaida01@bespalova.ru', N'\agents\agent_101.png', 92)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (84, N'Компания МоторТелекомЦемент-М', 5, N'021293, Амурская область, город Наро-Фоминск, шоссе Славы, 40', 7326832482, 440199498, N'Белоусов Иван Евгеньевич ', N'(812)857-95-57', N'larisa44@silin.org', N'\agents\agent_118.png', 237)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (85, N'РосАвтоМонтаж', 5, N'331914, Курская область, город Ногинск, спуск Ладыгина, 66', 4735043946, 263682488, N'Исакова Диана Алексеевна', N'(495)445-97-76', N'lapin.inessa@isaeva.com', N'\agents\agent_55.png', 10)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (86, N'Компания СервисТелеМотор', 5, N'625988, Вологодская область, город Озёры, пр. Гоголя, 18', 3248454160, 138472695, N'Фролов Эдуард Борисович', N'+7(922)461-25-29', N'veronika.egorov@bespalova.com', N'\agents\agent_102.png', 81)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (87, N'Асбоцемент', 5, N'030119, Курганская область, город Дмитров, пер. Славы, 47', 1261407459, 745921890, N'Никитина Антонина Андреевна', N'8-800-211-16-23', N'antonin19@panfilov.ru', N'\agents\agent_34.png', 273)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (88, N'Компания КрепЦемент', 5, N'423477, Мурманская область, город Кашира, бульвар Домодедовская, 61', 3025099903, 606083992, N'Суворова Екатерина Львовна ', N'(812)963-77-87', N'rusakov.efim@nikiforov.ru', N'\agents\agent_50.png', 426)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (89, N'ОрионГлав', 6, N'729639, Магаданская область, город Талдом, въезд Будапештсткая, 98', 9032455179, 763045792, N'Тимофеев Григорий Андреевич', N'+7(922)684-13-74', N'sermakova@sarova.net', N'\agents\agent_106.png', 482)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (90, N'ТверьМонтажОмск', 6, N'761751, Амурская область, город Балашиха, шоссе Гоголя, 02', 2421347164, 157370604, N'Большаков Матвей Романович', N'8-800-363-43-86', N'dteterina@selezneva.ru', N'\agents\agent_128.png', 272)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (91, N'БухВжух', 6, N'481744, Амурская область, город Щёлково, пл. Сталина, 48', 2320989197, 359282667, N'Тарасов Болеслав Александрович', N'(495)367-21-41', N'valentina.bolsakova@aksenova.ru', N'отсутствует', 327)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (92, N'МеталСервисМор', 6, N'293265, Иркутская область, город Клин, пр. Славы, 12', 6922817841, 580142825, N'Коновалов Кирилл Львович', N'(35222)91-28-62', N'xdanilov@titov.ru', N'отсутствует', 475)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (93, N'Орион', 6, N'951035, Ивановская область, город Ступино, шоссе Космонавтов, 73', 2670166502, 716874456, N'Мартынов Михаил Борисович', N'8-800-621-61-93', N'aleksei63@kiselev.ru', N'\agents\agent_77.png', 166)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (94, N'БашкирРечТомск', 6, N'136886, Амурская область, город Видное, въезд Космонавтов, 39', 7027724917, 823811460, N'Назарова Вера Андреевна', N'8-800-254-71-85', N'aleksandra77@karpov.com', N'\agents\agent_100.png', 84)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (95, N'РемСтрем', 6, N'373761, Псковская область, город Наро-Фоминск, наб. Гагарина, 03', 9006569852, 152177100, N'Романова Альбина Александровна ', N'(35222)55-28-24', N'rafail96@sukin.ru', N'\agents\agent_116.png', 88)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (96, N'АсбоцементЛифтРеч-H', 6, N'599158, Ростовская область, город Озёры, ул. Космонавтов, 05', 6567878928, 560960507, N'Кондратьева Таисия Андреевна', N'(495)245-57-16', N'vladlena58@seliverstova.ru', N'\agents\agent_105.png', 407)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (97, N'ФинансТелеТверь', 6, N'687171, Томская область, город Лотошино, пл. Славы, 59', 2646091050, 971874277, N'Зайцева Дарья Сергеевна', N'(812)115-56-93', N'medvedev.klim@afanasev.com', N'\agents\agent_45.png', 100)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (98, N'Радио', 6, N'798718, Ленинградская область, город Пушкино, бульвар Балканская, 37', 9077613654, 657690787, N'Колесникова Эмма Андреевна ', N'8-800-897-32-78', N'rtretykova@kozlov.ru', N'\agents\agent_43.png', 221)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (99, N'ОрионТомскТех', 6, N'738763, Курская область, город Егорьевск, спуск Чехова, 66', 9351493429, 583041591, N'Лукин Георгий Александрович ', N'+7(922)542-89-15', N'faina.tikonova@veselov.com', N'\agents\agent_119.png', 73)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (100, N'ЖелДорДизайнМетизТраст', 6, N'170549, Сахалинская область, город Видное, проезд Космонавтов, 89', 7669116841, 906390137, N'Агафонов Игорь Львович ', N'(812)123-63-47', N'lnikitina@kulikova.com', N'отсутствует', 290)
SET IDENTITY_INSERT [dbo].[Agent] OFF
GO
SET IDENTITY_INSERT [dbo].[AgentType] ON 

INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (1, N'ЗАО', NULL)
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (2, N'МКК', NULL)
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (3, N'МФО', NULL)
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (4, N'ОАО', NULL)
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (5, N'ООО', NULL)
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (6, N'ПАО', NULL)
SET IDENTITY_INSERT [dbo].[AgentType] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (1, N'Попрыгунчик для собачек 5096', 1, 67975083, NULL, NULL, 4, 9, CAST(1465.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (2, N'Попрыгунчик для мальчиков 5389', 1, 70873532, NULL, NULL, 3, 2, CAST(1739.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (3, N'Шар 6366', 1, 25514523, NULL, NULL, 4, 4, CAST(1932.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (4, N'Попрыгунчик для девочек 2311', 1, 25262035, NULL, NULL, 4, 1, CAST(1308.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (5, N'Попрыгунчик детский красный 6591', 1, 79704172, NULL, NULL, 5, 7, CAST(592.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (6, N'Попрыгунчик для кошечек 3741', 1, 43987093, NULL, NULL, 5, 4, CAST(1668.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (7, N'Попрыгунчик для собачек 4485', 1, 33440129, NULL, NULL, 2, 12, CAST(1995.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (8, N'Попрыгунчик для девочек 6849', 1, 10084400, NULL, NULL, 1, 11, CAST(933.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (9, N'Попрыгунчик для девочек 3389', 1, 26434211, NULL, NULL, 3, 10, CAST(597.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (10, N'Шар 2243', 1, 42536654, NULL, NULL, 3, 12, CAST(1247.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (11, N'Попрыгунчик детский красный 1740', 1, 43330133, NULL, NULL, 5, 3, CAST(1749.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (12, N'Попрыгунчик детский красный 5400', 1, 68237918, NULL, NULL, 4, 5, CAST(1570.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (13, N'Попрыгунчик детский желтый 2582', 1, 32125209, NULL, NULL, 3, 11, CAST(1730.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (14, N'Попрыгун 2299', 1, 34750945, NULL, NULL, 2, 2, CAST(1688.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (15, N'Попрыгунчик детский розовый 5501', 1, 25409940, NULL, NULL, 2, 7, CAST(652.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (16, N'Попрыгунчик детский 1916', 1, 73345857, NULL, NULL, 5, 8, CAST(832.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (17, N'Попрыгунчик детский желтый 6678', 2, 80007300, NULL, NULL, 2, 1, CAST(1768.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (18, N'Попрыгунчик детский красный 3240', 2, 88098604, NULL, NULL, 3, 8, CAST(882.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (19, N'Попрыгунчик детский красный 3839', 2, 26655484, NULL, NULL, 5, 2, CAST(1921.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (20, N'Попрыгунчик для мальчиков 4791', 2, 45540528, NULL, NULL, 3, 11, CAST(1260.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (21, N'Попрыгунчик для собачек 3500', 2, 79994924, NULL, NULL, 2, 9, CAST(1142.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (22, N'Попрыгунчик детский 6029', 2, 69184347, NULL, NULL, 3, 7, CAST(419.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (23, N'Попрыгунчик детский красный 1972', 2, 59509797, NULL, NULL, 1, 7, CAST(794.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (24, N'Попрыгунчик детский 5117', 2, 80875656, NULL, NULL, 3, 12, CAST(338.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (25, N'Попрыгун 6412', 2, 28152672, NULL, NULL, 2, 9, CAST(523.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (26, N'Попрыгунчик для собачек 4529', 2, 81713527, NULL, NULL, 3, 6, CAST(1923.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (27, N'Попрыгунчик детский розовый 2694', 2, 13340356, NULL, NULL, 4, 6, CAST(1691.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (28, N'Попрыгунчик детский красный 1289', 3, 82925345, NULL, NULL, 4, 10, CAST(1919.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (29, N'Попрыгунчик детский 6888', 3, 13875235, NULL, NULL, 4, 12, CAST(1972.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (30, N'Попрыгунчик для мальчиков 3929', 3, 2158097, NULL, NULL, 1, 9, CAST(255.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (31, N'Попрыгунчик детский 2071', 3, 3157982, NULL, NULL, 3, 6, CAST(275.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (32, N'Попрыгунчик детский розовый 5376', 3, 74291677, NULL, NULL, 4, 6, CAST(1889.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (33, N'Попрыгунчик для кошечек 2604', 3, 11890154, NULL, NULL, 2, 7, CAST(842.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (34, N'Попрыгунчик детский розовый 1657', 3, 86558177, NULL, NULL, 4, 3, CAST(662.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (35, N'Попрыгунчик детский красный 4969', 3, 10614909, NULL, NULL, 5, 12, CAST(913.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (36, N'Попрыгунчик для девочек 1560', 3, 47378395, NULL, NULL, 5, 6, CAST(235.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (37, N'Попрыгунчик для собачек 4387', 4, 89607276, NULL, NULL, 3, 8, CAST(912.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (38, N'Попрыгун 6882', 4, 12732041, NULL, NULL, 1, 6, CAST(809.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (39, N'Попрыгунчик для кошечек 4740', 4, 80698285, NULL, NULL, 1, 6, CAST(1973.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (40, N'Попрыгунчик для мальчиков 3307', 5, 30269726, NULL, NULL, 4, 10, CAST(1533.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (41, N'Попрыгунчик детский желтый 6051', 5, 88211092, NULL, NULL, 4, 12, CAST(727.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (42, N'Попрыгун 3016', 5, 74919447, NULL, NULL, 1, 12, CAST(615.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (43, N'Попрыгунчик для девочек 1895', 5, 54983244, NULL, NULL, 4, 4, CAST(1586.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (44, N'Попрыгунчик для собачек 5754', 5, 79018408, NULL, NULL, 2, 8, CAST(633.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (45, N'Попрыгунчик для девочек 1656', 5, 22217580, NULL, NULL, 5, 6, CAST(1494.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (46, N'Попрыгунчик детский желтый 1371', 5, 85514178, NULL, NULL, 3, 7, CAST(252.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (47, N'Попрыгунчик детский розовый 5197', 5, 89612317, NULL, NULL, 1, 3, CAST(1948.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (48, N'Шар 4124', 5, 39025230, NULL, NULL, 5, 8, CAST(1160.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (49, N'Попрыгунчик детский розовый 6346', 5, 30282346, NULL, NULL, 1, 10, CAST(1024.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (50, N'Попрыгунчик для собачек 4381', 5, 27301447, NULL, NULL, 2, 5, CAST(1234.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductSale] ON 

INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (1, 60, 33, CAST(N'2010-06-21' AS Date), 7)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (2, 82, 44, CAST(N'2016-02-17' AS Date), 18)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (3, 47, 7, CAST(N'2012-11-07' AS Date), 9)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (4, 98, 25, CAST(N'2019-06-01' AS Date), 5)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (5, 93, 19, CAST(N'2014-06-11' AS Date), 11)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (6, 45, 28, CAST(N'2012-08-12' AS Date), 12)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (7, 30, 11, CAST(N'2012-09-26' AS Date), 16)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (8, 47, 34, CAST(N'2018-02-28' AS Date), 3)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (9, 27, 17, CAST(N'2018-09-15' AS Date), 6)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (10, 72, 41, CAST(N'2011-08-27' AS Date), 10)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (11, 70, 23, CAST(N'2011-08-19' AS Date), 2)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (12, 47, 49, CAST(N'2015-02-02' AS Date), 20)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (13, 17, 26, CAST(N'2011-07-01' AS Date), 14)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (14, 23, 16, CAST(N'2013-12-23' AS Date), 8)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (15, 40, 33, CAST(N'2017-11-11' AS Date), 10)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (16, 74, 7, CAST(N'2014-04-15' AS Date), 14)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (17, 22, 7, CAST(N'2018-06-22' AS Date), 6)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (18, 12, 13, CAST(N'2013-07-11' AS Date), 12)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (19, 42, 34, CAST(N'2016-08-13' AS Date), 7)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (20, 30, 16, CAST(N'2014-07-28' AS Date), 8)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (21, 51, 37, CAST(N'2010-04-15' AS Date), 8)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (22, 48, 37, CAST(N'2017-10-12' AS Date), 8)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (23, 16, 48, CAST(N'2012-09-02' AS Date), 13)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (24, 61, 34, CAST(N'2015-08-08' AS Date), 14)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (25, 65, 50, CAST(N'2012-05-25' AS Date), 15)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (26, 46, 12, CAST(N'2014-03-06' AS Date), 12)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (27, 45, 18, CAST(N'2016-05-18' AS Date), 6)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (28, 88, 27, CAST(N'2014-07-11' AS Date), 10)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (29, 80, 49, CAST(N'2016-08-18' AS Date), 8)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (30, 65, 30, CAST(N'2019-07-25' AS Date), 19)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (31, 50, 22, CAST(N'2019-03-17' AS Date), 6)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (32, 35, 6, CAST(N'2014-08-06' AS Date), 9)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (33, 65, 8, CAST(N'2011-09-12' AS Date), 18)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (34, 29, 37, CAST(N'2011-08-28' AS Date), 11)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (35, 80, 14, CAST(N'2015-12-25' AS Date), 4)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (36, 42, 28, CAST(N'2016-02-25' AS Date), 8)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (37, 4, 32, CAST(N'2017-06-07' AS Date), 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (38, 27, 48, CAST(N'2016-11-27' AS Date), 6)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (39, 40, 5, CAST(N'2012-03-12' AS Date), 18)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (40, 79, 2, CAST(N'2018-06-13' AS Date), 18)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (41, 46, 21, CAST(N'2017-11-05' AS Date), 2)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (42, 67, 48, CAST(N'2016-02-26' AS Date), 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (43, 60, 9, CAST(N'2010-06-20' AS Date), 8)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (44, 40, 46, CAST(N'2015-06-23' AS Date), 12)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (45, 72, 37, CAST(N'2013-01-24' AS Date), 3)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (46, 2, 4, CAST(N'2015-02-28' AS Date), 5)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (47, 42, 23, CAST(N'2019-07-05' AS Date), 14)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (48, 38, 22, CAST(N'2014-03-06' AS Date), 6)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (49, 17, 21, CAST(N'2017-05-01' AS Date), 5)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (50, 77, 20, CAST(N'2015-01-17' AS Date), 15)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (51, 97, 42, CAST(N'2018-04-14' AS Date), 7)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (52, 17, 5, CAST(N'2014-12-12' AS Date), 14)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (53, 23, 34, CAST(N'2015-03-28' AS Date), 16)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (54, 6, 14, CAST(N'2017-11-24' AS Date), 15)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (55, 4, 25, CAST(N'2019-06-27' AS Date), 10)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (56, 87, 9, CAST(N'2014-06-04' AS Date), 2)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (57, 12, 24, CAST(N'2019-03-18' AS Date), 11)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (58, 6, 23, CAST(N'2015-09-12' AS Date), 8)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (59, 79, 16, CAST(N'2012-01-02' AS Date), 13)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (60, 2, 7, CAST(N'2011-02-01' AS Date), 12)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (61, 20, 39, CAST(N'2016-10-07' AS Date), 17)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (62, 61, 30, CAST(N'2017-06-07' AS Date), 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (63, 35, 31, CAST(N'2016-02-26' AS Date), 14)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (64, 35, 17, CAST(N'2013-11-09' AS Date), 5)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (65, 2, 22, CAST(N'2015-07-01' AS Date), 14)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (66, 78, 38, CAST(N'2015-08-27' AS Date), 6)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (67, 79, 44, CAST(N'2013-08-27' AS Date), 15)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (68, 93, 43, CAST(N'2013-05-10' AS Date), 2)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (69, 50, 7, CAST(N'2013-12-01' AS Date), 19)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (70, 82, 42, CAST(N'2011-06-11' AS Date), 16)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (71, 70, 17, CAST(N'2019-05-24' AS Date), 16)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (72, 35, 25, CAST(N'2017-04-02' AS Date), 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (73, 45, 29, CAST(N'2013-04-08' AS Date), 10)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (74, 77, 27, CAST(N'2019-08-16' AS Date), 20)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (75, 85, 25, CAST(N'2011-12-26' AS Date), 5)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (76, 70, 19, CAST(N'2016-07-19' AS Date), 19)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (77, 29, 15, CAST(N'2014-03-17' AS Date), 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (78, 5, 18, CAST(N'2011-06-14' AS Date), 13)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (79, 54, 9, CAST(N'2017-05-20' AS Date), 13)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (80, 50, 28, CAST(N'2010-04-13' AS Date), 6)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (81, 5, 28, CAST(N'2019-10-15' AS Date), 9)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (82, 10, 24, CAST(N'2019-10-08' AS Date), 20)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (83, 72, 19, CAST(N'2018-04-08' AS Date), 8)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (84, 46, 10, CAST(N'2012-06-14' AS Date), 2)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (85, 51, 46, CAST(N'2012-04-23' AS Date), 3)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (86, 93, 8, CAST(N'2015-08-17' AS Date), 6)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (87, 77, 9, CAST(N'2016-09-14' AS Date), 7)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (88, 1, 30, CAST(N'2012-03-23' AS Date), 15)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (89, 25, 48, CAST(N'2010-11-17' AS Date), 5)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (90, 22, 22, CAST(N'2016-11-17' AS Date), 13)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (91, 20, 15, CAST(N'2010-05-03' AS Date), 19)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (92, 7, 41, CAST(N'2019-03-06' AS Date), 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (93, 67, 7, CAST(N'2017-10-14' AS Date), 20)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (94, 85, 27, CAST(N'2017-02-08' AS Date), 3)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (95, 70, 4, CAST(N'2017-08-02' AS Date), 3)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (96, 97, 32, CAST(N'2017-03-09' AS Date), 18)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (97, 72, 13, CAST(N'2017-11-13' AS Date), 18)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (98, 46, 13, CAST(N'2015-12-02' AS Date), 19)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (99, 31, 40, CAST(N'2011-06-14' AS Date), 19)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (100, 80, 28, CAST(N'2014-08-14' AS Date), 16)
SET IDENTITY_INSERT [dbo].[ProductSale] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (1, N' Взрослый', NULL)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (2, N' Для больших деток', NULL)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (3, N' Для маленьких деток', NULL)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (4, N' Упругий', NULL)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (5, N' Цифровой', NULL)
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_AgentType] FOREIGN KEY([AgentTypeID])
REFERENCES [dbo].[AgentType] ([ID])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_AgentType]
GO
ALTER TABLE [dbo].[AgentPriorityHistory]  WITH CHECK ADD  CONSTRAINT [FK_AgentPriorityHistory_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[AgentPriorityHistory] CHECK CONSTRAINT [FK_AgentPriorityHistory_Agent]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_MaterialType] FOREIGN KEY([MaterialTypeID])
REFERENCES [dbo].[MaterialType] ([ID])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_MaterialType]
GO
ALTER TABLE [dbo].[MaterialCountHistory]  WITH CHECK ADD  CONSTRAINT [FK_MaterialCountHistory_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialCountHistory] CHECK CONSTRAINT [FK_MaterialCountHistory_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Supplier]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[ProductType] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
ALTER TABLE [dbo].[ProductCostHistory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCostHistory_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductCostHistory] CHECK CONSTRAINT [FK_ProductCostHistory_Product]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Material]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Agent]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_Agent]
GO
USE [master]
GO
ALTER DATABASE [Agents] SET  READ_WRITE 
GO
