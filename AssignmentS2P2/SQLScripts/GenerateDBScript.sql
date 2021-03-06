USE [master]
GO
/****** Object:  Database [BookingSystemDB]    Script Date: 12/2/2017 11:23:30 AM ******/
CREATE DATABASE [BookingSystemDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookingSystemDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BookingSystemDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BookingSystemDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BookingSystemDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BookingSystemDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookingSystemDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookingSystemDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookingSystemDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookingSystemDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookingSystemDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookingSystemDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookingSystemDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookingSystemDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookingSystemDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookingSystemDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookingSystemDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookingSystemDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookingSystemDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookingSystemDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookingSystemDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookingSystemDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BookingSystemDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookingSystemDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookingSystemDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookingSystemDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookingSystemDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookingSystemDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookingSystemDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookingSystemDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BookingSystemDB] SET  MULTI_USER 
GO
ALTER DATABASE [BookingSystemDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookingSystemDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookingSystemDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookingSystemDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BookingSystemDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BookingSystemDB]
GO
/****** Object:  Table [dbo].[HotelBedTypes]    Script Date: 12/2/2017 11:23:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HotelBedTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BedType] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HotelBookings]    Script Date: 12/2/2017 11:23:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HotelBookings](
	[BookingID] [int] IDENTITY(1,1) NOT NULL,
	[Booking_User] [varchar](50) NOT NULL,
	[RoomID] [int] NOT NULL,
	[CheckInDate] [datetime] NOT NULL,
	[CheckOutDate] [datetime] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[Price] [smallmoney] NOT NULL,
	[TransactionID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HotelRooms]    Script Date: 12/2/2017 11:23:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelRooms](
	[RoomID] [int] IDENTITY(100,1) NOT NULL,
	[TypeID] [int] NOT NULL DEFAULT ((0)),
	[ViewID] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_HotelRooms] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HotelRoomServices]    Script Date: 12/2/2017 11:23:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelRoomServices](
	[ServiceID] [int] IDENTITY(1,1) NOT NULL,
	[WiFi-Service] [bit] NOT NULL DEFAULT ((0)),
	[Room-Service] [bit] NOT NULL DEFAULT ((0)),
	[House-Keeping] [bit] NOT NULL DEFAULT ((0)),
	[Express Queue] [bit] NOT NULL DEFAULT ((0)),
	[Bed_Type] [int] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HotelRoomTypes]    Script Date: 12/2/2017 11:23:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HotelRoomTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomClass] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HotelRoomViews]    Script Date: 12/2/2017 11:23:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HotelRoomViews](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ViewType] [varchar](50) NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PriceTable]    Script Date: 12/2/2017 11:23:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PriceTable](
	[Item] [varchar](50) NOT NULL,
	[Price] [smallmoney] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SportBookings]    Script Date: 12/2/2017 11:23:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SportBookings](
	[BookingId] [int] IDENTITY(1,1) NOT NULL,
	[Booking_User] [varchar](50) NOT NULL,
	[BookingDate] [datetime] NOT NULL,
	[FacilityId] [int] NOT NULL,
	[TimeSlot] [int] NOT NULL,
	[Duration] [int] NOT NULL,
	[Price] [smallmoney] NOT NULL,
	[TransactionID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SportDurations]    Script Date: 12/2/2017 11:23:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SportDurations](
	[DurationId] [int] IDENTITY(1,1) NOT NULL,
	[Hours] [varchar](50) NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[DurationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SportFacilities]    Script Date: 12/2/2017 11:23:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SportFacilities](
	[FacilityId] [int] IDENTITY(1,1) NOT NULL,
	[FacilityName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FacilityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SportTimeSlots]    Script Date: 12/2/2017 11:23:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SportTimeSlots](
	[SlotId] [int] IDENTITY(1,1) NOT NULL,
	[TimeSlot] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SlotId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 12/2/2017 11:23:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[SessionStart] [datetime] NOT NULL,
	[SessionEnd] [datetime] NOT NULL,
	[SessionDuration] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/2/2017 11:23:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Username] [varchar](50) NOT NULL,
	[Password_Hash] [char](64) NOT NULL,
	[Password_Salt] [varchar](128) NOT NULL,
	[User_Group] [varchar](10) NOT NULL DEFAULT ('User'),
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[HotelBedTypes] ON 

INSERT [dbo].[HotelBedTypes] ([Id], [BedType]) VALUES (1, N'Single')
INSERT [dbo].[HotelBedTypes] ([Id], [BedType]) VALUES (2, N'Double')
INSERT [dbo].[HotelBedTypes] ([Id], [BedType]) VALUES (3, N'Twin')
INSERT [dbo].[HotelBedTypes] ([Id], [BedType]) VALUES (4, N'Triple')
INSERT [dbo].[HotelBedTypes] ([Id], [BedType]) VALUES (5, N'Double Double')
SET IDENTITY_INSERT [dbo].[HotelBedTypes] OFF
SET IDENTITY_INSERT [dbo].[HotelBookings] ON 

INSERT [dbo].[HotelBookings] ([BookingID], [Booking_User], [RoomID], [CheckInDate], [CheckOutDate], [ServiceID], [Price], [TransactionID]) VALUES (2013, N'admin', 130, CAST(N'2017-02-12 00:00:00.000' AS DateTime), CAST(N'2017-02-14 00:00:00.000' AS DateTime), 2015, 450.0000, 1004)
INSERT [dbo].[HotelBookings] ([BookingID], [Booking_User], [RoomID], [CheckInDate], [CheckOutDate], [ServiceID], [Price], [TransactionID]) VALUES (2014, N'admin', 151, CAST(N'2017-02-12 00:00:00.000' AS DateTime), CAST(N'2017-02-14 00:00:00.000' AS DateTime), 2016, 525.0000, 1004)
SET IDENTITY_INSERT [dbo].[HotelBookings] OFF
SET IDENTITY_INSERT [dbo].[HotelRooms] ON 

INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (100, 1, 1)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (101, 1, 1)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (102, 1, 2)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (103, 1, 2)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (104, 1, 3)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (105, 1, 3)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (106, 1, 4)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (107, 1, 4)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (108, 2, 1)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (109, 2, 1)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (110, 2, 2)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (111, 2, 2)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (112, 2, 3)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (113, 2, 3)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (114, 2, 4)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (115, 2, 4)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (116, 3, 1)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (117, 3, 1)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (118, 3, 2)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (119, 3, 2)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (120, 3, 3)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (121, 3, 3)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (122, 3, 4)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (123, 3, 4)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (124, 4, 1)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (125, 4, 1)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (126, 4, 2)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (127, 4, 2)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (128, 4, 3)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (129, 4, 3)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (130, 4, 4)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (131, 4, 4)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (132, 5, 1)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (133, 5, 1)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (134, 5, 2)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (135, 5, 2)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (136, 5, 3)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (137, 5, 3)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (138, 5, 4)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (139, 5, 4)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (140, 6, 1)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (141, 6, 1)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (142, 6, 2)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (143, 6, 2)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (144, 6, 3)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (145, 6, 3)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (146, 6, 4)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (147, 6, 4)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (149, 7, 1)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (150, 7, 1)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (151, 7, 2)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (152, 7, 2)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (153, 7, 3)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (154, 7, 3)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (155, 7, 4)
INSERT [dbo].[HotelRooms] ([RoomID], [TypeID], [ViewID]) VALUES (156, 7, 4)
SET IDENTITY_INSERT [dbo].[HotelRooms] OFF
SET IDENTITY_INSERT [dbo].[HotelRoomServices] ON 

INSERT [dbo].[HotelRoomServices] ([ServiceID], [WiFi-Service], [Room-Service], [House-Keeping], [Express Queue], [Bed_Type]) VALUES (2015, 0, 0, 0, 0, 3)
INSERT [dbo].[HotelRoomServices] ([ServiceID], [WiFi-Service], [Room-Service], [House-Keeping], [Express Queue], [Bed_Type]) VALUES (2016, 0, 0, 0, 0, 5)
SET IDENTITY_INSERT [dbo].[HotelRoomServices] OFF
SET IDENTITY_INSERT [dbo].[HotelRoomTypes] ON 

INSERT [dbo].[HotelRoomTypes] ([Id], [RoomClass]) VALUES (1, N'Standard')
INSERT [dbo].[HotelRoomTypes] ([Id], [RoomClass]) VALUES (2, N'Premium')
INSERT [dbo].[HotelRoomTypes] ([Id], [RoomClass]) VALUES (3, N'Superior')
INSERT [dbo].[HotelRoomTypes] ([Id], [RoomClass]) VALUES (4, N'Deluxe')
INSERT [dbo].[HotelRoomTypes] ([Id], [RoomClass]) VALUES (5, N'Mini-Suite')
INSERT [dbo].[HotelRoomTypes] ([Id], [RoomClass]) VALUES (6, N'Suite')
INSERT [dbo].[HotelRoomTypes] ([Id], [RoomClass]) VALUES (7, N'Studio')
SET IDENTITY_INSERT [dbo].[HotelRoomTypes] OFF
SET IDENTITY_INSERT [dbo].[HotelRoomViews] ON 

INSERT [dbo].[HotelRoomViews] ([Id], [ViewType]) VALUES (1, N'City View')
INSERT [dbo].[HotelRoomViews] ([Id], [ViewType]) VALUES (2, N'Garden View')
INSERT [dbo].[HotelRoomViews] ([Id], [ViewType]) VALUES (3, N'Island View')
INSERT [dbo].[HotelRoomViews] ([Id], [ViewType]) VALUES (4, N'Ocean View')
SET IDENTITY_INSERT [dbo].[HotelRoomViews] OFF
INSERT [dbo].[PriceTable] ([Item], [Price]) VALUES (N'Bed-Double', 18.0000)
INSERT [dbo].[PriceTable] ([Item], [Price]) VALUES (N'Bed-DoubleDouble', 35.0000)
INSERT [dbo].[PriceTable] ([Item], [Price]) VALUES (N'Bed-Single', 10.0000)
INSERT [dbo].[PriceTable] ([Item], [Price]) VALUES (N'Bed-Triple', 30.0000)
INSERT [dbo].[PriceTable] ([Item], [Price]) VALUES (N'Bed-Twin', 20.0000)
INSERT [dbo].[PriceTable] ([Item], [Price]) VALUES (N'Extras-Express-Queue', 60.0000)
INSERT [dbo].[PriceTable] ([Item], [Price]) VALUES (N'Extras-HouseKeeping', 40.0000)
INSERT [dbo].[PriceTable] ([Item], [Price]) VALUES (N'Extras-RoomService', 30.0000)
INSERT [dbo].[PriceTable] ([Item], [Price]) VALUES (N'Extras-WifiNetwork', 20.0000)
INSERT [dbo].[PriceTable] ([Item], [Price]) VALUES (N'HotelRate-FirstDay', 50.0000)
INSERT [dbo].[PriceTable] ([Item], [Price]) VALUES (N'HotelRate-Subsequent', 30.0000)
INSERT [dbo].[PriceTable] ([Item], [Price]) VALUES (N'Room-Deluxe', 180.0000)
INSERT [dbo].[PriceTable] ([Item], [Price]) VALUES (N'Room-Mini-Suite', 250.0000)
INSERT [dbo].[PriceTable] ([Item], [Price]) VALUES (N'Room-Premium', 80.0000)
INSERT [dbo].[PriceTable] ([Item], [Price]) VALUES (N'Room-Standard', 50.0000)
INSERT [dbo].[PriceTable] ([Item], [Price]) VALUES (N'Room-Studio', 500.0000)
INSERT [dbo].[PriceTable] ([Item], [Price]) VALUES (N'Room-Suite', 300.0000)
INSERT [dbo].[PriceTable] ([Item], [Price]) VALUES (N'Room-Superior', 120.0000)
INSERT [dbo].[PriceTable] ([Item], [Price]) VALUES (N'SportFacility-Normal', 5.0000)
INSERT [dbo].[PriceTable] ([Item], [Price]) VALUES (N'SportFacility-Special', 10.0000)
INSERT [dbo].[PriceTable] ([Item], [Price]) VALUES (N'SportRate-Duration', 2.0000)
INSERT [dbo].[PriceTable] ([Item], [Price]) VALUES (N'SportRate-Flat', 10.0000)
INSERT [dbo].[PriceTable] ([Item], [Price]) VALUES (N'SportRate-Weekday', 5.0000)
INSERT [dbo].[PriceTable] ([Item], [Price]) VALUES (N'SportRate-Weekend', 10.0000)
INSERT [dbo].[PriceTable] ([Item], [Price]) VALUES (N'SportTimeSlot-Afternoon', 8.0000)
INSERT [dbo].[PriceTable] ([Item], [Price]) VALUES (N'SportTimeSlot-Morning', 6.0000)
INSERT [dbo].[PriceTable] ([Item], [Price]) VALUES (N'SportTimeSlot-Night', 10.0000)
INSERT [dbo].[PriceTable] ([Item], [Price]) VALUES (N'View-City', 30.0000)
INSERT [dbo].[PriceTable] ([Item], [Price]) VALUES (N'View-Garden', 50.0000)
INSERT [dbo].[PriceTable] ([Item], [Price]) VALUES (N'View-Island', 80.0000)
INSERT [dbo].[PriceTable] ([Item], [Price]) VALUES (N'View-Ocean', 100.0000)
SET IDENTITY_INSERT [dbo].[SportBookings] ON 

INSERT [dbo].[SportBookings] ([BookingId], [Booking_User], [BookingDate], [FacilityId], [TimeSlot], [Duration], [Price], [TransactionID]) VALUES (6, N'admin', CAST(N'2017-02-13 00:00:00.000' AS DateTime), 8, 5, 2, 32.0000, 1004)
INSERT [dbo].[SportBookings] ([BookingId], [Booking_User], [BookingDate], [FacilityId], [TimeSlot], [Duration], [Price], [TransactionID]) VALUES (7, N'admin', CAST(N'2017-02-13 00:00:00.000' AS DateTime), 4, 5, 2, 37.0000, 1004)
INSERT [dbo].[SportBookings] ([BookingId], [Booking_User], [BookingDate], [FacilityId], [TimeSlot], [Duration], [Price], [TransactionID]) VALUES (8, N'admin', CAST(N'2017-02-13 00:00:00.000' AS DateTime), 4, 1, 2, 35.0000, 1004)
INSERT [dbo].[SportBookings] ([BookingId], [Booking_User], [BookingDate], [FacilityId], [TimeSlot], [Duration], [Price], [TransactionID]) VALUES (9, N'admin', CAST(N'2017-02-16 00:00:00.000' AS DateTime), 3, 4, 2, 32.0000, 1005)
INSERT [dbo].[SportBookings] ([BookingId], [Booking_User], [BookingDate], [FacilityId], [TimeSlot], [Duration], [Price], [TransactionID]) VALUES (10, N'admin', CAST(N'2017-02-16 00:00:00.000' AS DateTime), 7, 4, 5, 43.0000, 1005)
SET IDENTITY_INSERT [dbo].[SportBookings] OFF
SET IDENTITY_INSERT [dbo].[SportDurations] ON 

INSERT [dbo].[SportDurations] ([DurationId], [Hours]) VALUES (1, N'1')
INSERT [dbo].[SportDurations] ([DurationId], [Hours]) VALUES (2, N'2')
INSERT [dbo].[SportDurations] ([DurationId], [Hours]) VALUES (3, N'3')
INSERT [dbo].[SportDurations] ([DurationId], [Hours]) VALUES (4, N'4')
INSERT [dbo].[SportDurations] ([DurationId], [Hours]) VALUES (5, N'5')
INSERT [dbo].[SportDurations] ([DurationId], [Hours]) VALUES (6, N'6')
SET IDENTITY_INSERT [dbo].[SportDurations] OFF
SET IDENTITY_INSERT [dbo].[SportFacilities] ON 

INSERT [dbo].[SportFacilities] ([FacilityId], [FacilityName]) VALUES (1, N'Badminton Court')
INSERT [dbo].[SportFacilities] ([FacilityId], [FacilityName]) VALUES (2, N'Basketball Court')
INSERT [dbo].[SportFacilities] ([FacilityId], [FacilityName]) VALUES (3, N'Gymnasium')
INSERT [dbo].[SportFacilities] ([FacilityId], [FacilityName]) VALUES (4, N'Indoor Multi Purpose Sports Hall')
INSERT [dbo].[SportFacilities] ([FacilityId], [FacilityName]) VALUES (5, N'Soccer Field')
INSERT [dbo].[SportFacilities] ([FacilityId], [FacilityName]) VALUES (6, N'Stadium')
INSERT [dbo].[SportFacilities] ([FacilityId], [FacilityName]) VALUES (7, N'Swimming Pool')
INSERT [dbo].[SportFacilities] ([FacilityId], [FacilityName]) VALUES (8, N'Table Tennis Court')
INSERT [dbo].[SportFacilities] ([FacilityId], [FacilityName]) VALUES (9, N'Tennis Court')
SET IDENTITY_INSERT [dbo].[SportFacilities] OFF
SET IDENTITY_INSERT [dbo].[SportTimeSlots] ON 

INSERT [dbo].[SportTimeSlots] ([SlotId], [TimeSlot]) VALUES (1, N'06:00 - 08:00')
INSERT [dbo].[SportTimeSlots] ([SlotId], [TimeSlot]) VALUES (2, N'08:00 - 10:00')
INSERT [dbo].[SportTimeSlots] ([SlotId], [TimeSlot]) VALUES (3, N'10:00 - 12:00')
INSERT [dbo].[SportTimeSlots] ([SlotId], [TimeSlot]) VALUES (4, N'12:00 - 14:00')
INSERT [dbo].[SportTimeSlots] ([SlotId], [TimeSlot]) VALUES (5, N'14:00 - 16:00')
INSERT [dbo].[SportTimeSlots] ([SlotId], [TimeSlot]) VALUES (6, N'16:00 - 18:00')
INSERT [dbo].[SportTimeSlots] ([SlotId], [TimeSlot]) VALUES (7, N'18:00 - 20:00')
INSERT [dbo].[SportTimeSlots] ([SlotId], [TimeSlot]) VALUES (8, N'20:00 - 22:00')
SET IDENTITY_INSERT [dbo].[SportTimeSlots] OFF
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([TransactionID], [TransactionDate], [SessionStart], [SessionEnd], [SessionDuration]) VALUES (1, CAST(N'2017-02-04 00:00:00.000' AS DateTime), CAST(N'2017-02-04 20:21:46.960' AS DateTime), CAST(N'2017-02-04 20:22:05.727' AS DateTime), CAST(N'00:00:18.7694129' AS Time))
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDate], [SessionStart], [SessionEnd], [SessionDuration]) VALUES (2, CAST(N'2017-02-04 00:00:00.000' AS DateTime), CAST(N'2017-02-04 22:52:57.107' AS DateTime), CAST(N'2017-02-04 22:53:56.883' AS DateTime), CAST(N'00:00:59.7758967' AS Time))
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDate], [SessionStart], [SessionEnd], [SessionDuration]) VALUES (3, CAST(N'2017-02-04 00:00:00.000' AS DateTime), CAST(N'2017-02-04 22:54:40.780' AS DateTime), CAST(N'2017-02-04 22:55:03.700' AS DateTime), CAST(N'00:00:22.9192937' AS Time))
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDate], [SessionStart], [SessionEnd], [SessionDuration]) VALUES (4, CAST(N'2017-02-10 00:00:00.000' AS DateTime), CAST(N'2017-02-10 14:21:27.167' AS DateTime), CAST(N'2017-02-10 15:04:43.300' AS DateTime), CAST(N'00:43:16.1342795' AS Time))
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDate], [SessionStart], [SessionEnd], [SessionDuration]) VALUES (1004, CAST(N'2017-02-12 00:00:00.000' AS DateTime), CAST(N'2017-02-12 00:10:24.137' AS DateTime), CAST(N'2017-02-12 00:13:14.110' AS DateTime), CAST(N'00:02:49.9719325' AS Time))
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDate], [SessionStart], [SessionEnd], [SessionDuration]) VALUES (1005, CAST(N'2017-02-12 00:00:00.000' AS DateTime), CAST(N'2017-02-12 11:16:58.027' AS DateTime), CAST(N'2017-02-12 11:17:46.960' AS DateTime), CAST(N'00:00:48.9319214' AS Time))
SET IDENTITY_INSERT [dbo].[Transactions] OFF
INSERT [dbo].[Users] ([Username], [Password_Hash], [Password_Salt], [User_Group]) VALUES (N'admin', N'75F10104C1F70D57B3443EB759521BC72F882D0F4B3D364AD7AD40E440347332', N'DEHrSN9Lg+PF5jecwBjVoaWGuq4Ch5+bjQ8TuVz1A7A=', N'Admin')
INSERT [dbo].[Users] ([Username], [Password_Hash], [Password_Salt], [User_Group]) VALUES (N'user', N'1E3B17FF14BE907655381F184C1509B6ACD75AB5F987E8888164BE921EC9B9C6', N'CiPyO/RT5wu2vtZ5FxXzgq3JkTXX9USq4//ITonX8U4=', N'User')
ALTER TABLE [dbo].[HotelBookings]  WITH CHECK ADD  CONSTRAINT [FK_Booking_User_Hotel] FOREIGN KEY([Booking_User])
REFERENCES [dbo].[Users] ([Username])
GO
ALTER TABLE [dbo].[HotelBookings] CHECK CONSTRAINT [FK_Booking_User_Hotel]
GO
ALTER TABLE [dbo].[HotelBookings]  WITH CHECK ADD  CONSTRAINT [FK_RoomID] FOREIGN KEY([RoomID])
REFERENCES [dbo].[HotelRooms] ([RoomID])
GO
ALTER TABLE [dbo].[HotelBookings] CHECK CONSTRAINT [FK_RoomID]
GO
ALTER TABLE [dbo].[HotelBookings]  WITH CHECK ADD  CONSTRAINT [FK_Services] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[HotelRoomServices] ([ServiceID])
GO
ALTER TABLE [dbo].[HotelBookings] CHECK CONSTRAINT [FK_Services]
GO
ALTER TABLE [dbo].[HotelBookings]  WITH NOCHECK ADD  CONSTRAINT [FK_TransactionID_Hotel] FOREIGN KEY([TransactionID])
REFERENCES [dbo].[Transactions] ([TransactionID])
GO
ALTER TABLE [dbo].[HotelBookings] CHECK CONSTRAINT [FK_TransactionID_Hotel]
GO
ALTER TABLE [dbo].[HotelRooms]  WITH CHECK ADD  CONSTRAINT [FK_TypeID] FOREIGN KEY([TypeID])
REFERENCES [dbo].[HotelRoomTypes] ([Id])
GO
ALTER TABLE [dbo].[HotelRooms] CHECK CONSTRAINT [FK_TypeID]
GO
ALTER TABLE [dbo].[HotelRooms]  WITH CHECK ADD  CONSTRAINT [FK_ViewID] FOREIGN KEY([ViewID])
REFERENCES [dbo].[HotelRoomViews] ([Id])
GO
ALTER TABLE [dbo].[HotelRooms] CHECK CONSTRAINT [FK_ViewID]
GO
ALTER TABLE [dbo].[HotelRoomServices]  WITH CHECK ADD  CONSTRAINT [FK_Bed_Type] FOREIGN KEY([Bed_Type])
REFERENCES [dbo].[HotelBedTypes] ([Id])
GO
ALTER TABLE [dbo].[HotelRoomServices] CHECK CONSTRAINT [FK_Bed_Type]
GO
ALTER TABLE [dbo].[SportBookings]  WITH CHECK ADD  CONSTRAINT [FK_Booking_User_Sport] FOREIGN KEY([Booking_User])
REFERENCES [dbo].[Users] ([Username])
GO
ALTER TABLE [dbo].[SportBookings] CHECK CONSTRAINT [FK_Booking_User_Sport]
GO
ALTER TABLE [dbo].[SportBookings]  WITH NOCHECK ADD  CONSTRAINT [FK_Duration] FOREIGN KEY([Duration])
REFERENCES [dbo].[SportDurations] ([DurationId])
GO
ALTER TABLE [dbo].[SportBookings] CHECK CONSTRAINT [FK_Duration]
GO
ALTER TABLE [dbo].[SportBookings]  WITH NOCHECK ADD  CONSTRAINT [FK_FacilityId] FOREIGN KEY([FacilityId])
REFERENCES [dbo].[SportFacilities] ([FacilityId])
GO
ALTER TABLE [dbo].[SportBookings] CHECK CONSTRAINT [FK_FacilityId]
GO
ALTER TABLE [dbo].[SportBookings]  WITH NOCHECK ADD  CONSTRAINT [FK_TimeSlot] FOREIGN KEY([TimeSlot])
REFERENCES [dbo].[SportTimeSlots] ([SlotId])
GO
ALTER TABLE [dbo].[SportBookings] CHECK CONSTRAINT [FK_TimeSlot]
GO
ALTER TABLE [dbo].[SportBookings]  WITH NOCHECK ADD  CONSTRAINT [FK_TransactionID_Sport] FOREIGN KEY([TransactionID])
REFERENCES [dbo].[Transactions] ([TransactionID])
GO
ALTER TABLE [dbo].[SportBookings] CHECK CONSTRAINT [FK_TransactionID_Sport]
GO
USE [master]
GO
ALTER DATABASE [BookingSystemDB] SET  READ_WRITE 
GO
