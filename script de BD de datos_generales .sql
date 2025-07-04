USE [master]
GO
/****** Object:  Database [datos_generales]    Script Date: 26/06/2025 08:38:24 a. m. ******/
CREATE DATABASE [datos_generales]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'datos_generales', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\datos_generales.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'datos_generales_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\datos_generales_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [datos_generales] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [datos_generales].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [datos_generales] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [datos_generales] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [datos_generales] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [datos_generales] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [datos_generales] SET ARITHABORT OFF 
GO
ALTER DATABASE [datos_generales] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [datos_generales] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [datos_generales] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [datos_generales] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [datos_generales] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [datos_generales] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [datos_generales] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [datos_generales] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [datos_generales] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [datos_generales] SET  ENABLE_BROKER 
GO
ALTER DATABASE [datos_generales] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [datos_generales] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [datos_generales] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [datos_generales] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [datos_generales] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [datos_generales] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [datos_generales] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [datos_generales] SET RECOVERY FULL 
GO
ALTER DATABASE [datos_generales] SET  MULTI_USER 
GO
ALTER DATABASE [datos_generales] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [datos_generales] SET DB_CHAINING OFF 
GO
ALTER DATABASE [datos_generales] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [datos_generales] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [datos_generales] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [datos_generales] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'datos_generales', N'ON'
GO
ALTER DATABASE [datos_generales] SET QUERY_STORE = ON
GO
ALTER DATABASE [datos_generales] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [datos_generales]
GO
/****** Object:  Table [dbo].[datos_empleado]    Script Date: 26/06/2025 08:38:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datos_empleado](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[FK_datos_personales] [int] NOT NULL,
	[FK_sucursal] [int] NOT NULL,
	[Cargo] [varchar](60) NOT NULL,
	[Horario] [varchar](50) NOT NULL,
	[Salario] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[datos_personales]    Script Date: 26/06/2025 08:38:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datos_personales](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](60) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[Ciudad] [varchar](50) NOT NULL,
	[Num_telefono] [varchar](15) NOT NULL,
	[Email] [varchar](60) NOT NULL,
	[Genero] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sucursal]    Script Date: 26/06/2025 08:38:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sucursal](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_sucursal] [varchar](60) NOT NULL,
	[Ciudad] [varchar](50) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[Cantidad_ventas_anual] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[datos_empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Persona] FOREIGN KEY([FK_datos_personales])
REFERENCES [dbo].[datos_personales] ([ID])
GO
ALTER TABLE [dbo].[datos_empleado] CHECK CONSTRAINT [FK_Empleado_Persona]
GO
ALTER TABLE [dbo].[datos_empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Sucursal] FOREIGN KEY([FK_sucursal])
REFERENCES [dbo].[sucursal] ([ID])
GO
ALTER TABLE [dbo].[datos_empleado] CHECK CONSTRAINT [FK_Empleado_Sucursal]
GO
USE [master]
GO
ALTER DATABASE [datos_generales] SET  READ_WRITE 
GO
