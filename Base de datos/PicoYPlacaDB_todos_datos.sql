USE [master]
GO
/****** Object:  Database [PicoYPlacaDB]    Script Date: 1/24/2025 1:59:41 PM ******/
CREATE DATABASE [PicoYPlacaDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PicoYPlacaDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PicoYPlacaDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PicoYPlacaDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PicoYPlacaDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PicoYPlacaDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PicoYPlacaDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PicoYPlacaDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PicoYPlacaDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PicoYPlacaDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PicoYPlacaDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PicoYPlacaDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PicoYPlacaDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PicoYPlacaDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PicoYPlacaDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PicoYPlacaDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PicoYPlacaDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PicoYPlacaDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PicoYPlacaDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PicoYPlacaDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PicoYPlacaDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PicoYPlacaDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PicoYPlacaDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PicoYPlacaDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PicoYPlacaDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PicoYPlacaDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PicoYPlacaDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PicoYPlacaDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PicoYPlacaDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PicoYPlacaDB] SET RECOVERY FULL 
GO
ALTER DATABASE [PicoYPlacaDB] SET  MULTI_USER 
GO
ALTER DATABASE [PicoYPlacaDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PicoYPlacaDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PicoYPlacaDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PicoYPlacaDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PicoYPlacaDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PicoYPlacaDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PicoYPlacaDB', N'ON'
GO
ALTER DATABASE [PicoYPlacaDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [PicoYPlacaDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PicoYPlacaDB]
GO
/****** Object:  Table [dbo].[Consultas]    Script Date: 1/24/2025 1:59:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consultas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Placa] [nvarchar](50) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Hora] [time](7) NOT NULL,
	[Resultado] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Consultas] ON 

INSERT [dbo].[Consultas] ([Id], [Placa], [Fecha], [Hora], [Resultado]) VALUES (1, N'PVP0545', CAST(N'2025-01-29' AS Date), CAST(N'07:00:00' AS Time), N'No puede circular en este horario.')
INSERT [dbo].[Consultas] ([Id], [Placa], [Fecha], [Hora], [Resultado]) VALUES (2, N'ACG648', CAST(N'2025-01-27' AS Date), CAST(N'10:00:00' AS Time), N'Puede circular.')
INSERT [dbo].[Consultas] ([Id], [Placa], [Fecha], [Hora], [Resultado]) VALUES (3, N'HV057G', CAST(N'2025-01-22' AS Date), CAST(N'13:00:00' AS Time), N'Puede circular.')
INSERT [dbo].[Consultas] ([Id], [Placa], [Fecha], [Hora], [Resultado]) VALUES (4, N'HU-718W', CAST(N'2025-01-29' AS Date), CAST(N'10:00:00' AS Time), N'Puede circular.')
INSERT [dbo].[Consultas] ([Id], [Placa], [Fecha], [Hora], [Resultado]) VALUES (5, N'PDL-8399', CAST(N'2025-01-24' AS Date), CAST(N'16:00:00' AS Time), N'No puede circular en este horario.')
INSERT [dbo].[Consultas] ([Id], [Placa], [Fecha], [Hora], [Resultado]) VALUES (6, N'PYL-964', CAST(N'2025-01-28' AS Date), CAST(N'09:30:00' AS Time), N'Puede circular.')
INSERT [dbo].[Consultas] ([Id], [Placa], [Fecha], [Hora], [Resultado]) VALUES (7, N'PYL-964', CAST(N'2025-01-28' AS Date), CAST(N'09:25:00' AS Time), N'Puede circular.')
INSERT [dbo].[Consultas] ([Id], [Placa], [Fecha], [Hora], [Resultado]) VALUES (8, N'AAC-0124', CAST(N'2025-01-28' AS Date), CAST(N'09:30:00' AS Time), N'No puede circular en este horario.')
INSERT [dbo].[Consultas] ([Id], [Placa], [Fecha], [Hora], [Resultado]) VALUES (9, N'AAC-0123', CAST(N'2025-01-28' AS Date), CAST(N'19:00:00' AS Time), N'No puede circular en este horario.')
INSERT [dbo].[Consultas] ([Id], [Placa], [Fecha], [Hora], [Resultado]) VALUES (10, N'IBD-4870', CAST(N'2025-01-24' AS Date), CAST(N'17:00:00' AS Time), N'No puede circular en este horario.')
INSERT [dbo].[Consultas] ([Id], [Placa], [Fecha], [Hora], [Resultado]) VALUES (11, N'PTX-424', CAST(N'2025-01-27' AS Date), CAST(N'16:30:00' AS Time), N'Puede circular.')
INSERT [dbo].[Consultas] ([Id], [Placa], [Fecha], [Hora], [Resultado]) VALUES (12, N'PTX-422', CAST(N'2025-01-27' AS Date), CAST(N'16:30:00' AS Time), N'No puede circular en este horario.')
SET IDENTITY_INSERT [dbo].[Consultas] OFF
GO
USE [master]
GO
ALTER DATABASE [PicoYPlacaDB] SET  READ_WRITE 
GO
