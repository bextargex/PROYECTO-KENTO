USE [master]
GO
/****** Object:  Database [DB_KENTO]    Script Date: 27/11/2021 22:13:40 ******/
CREATE DATABASE [DB_KENTO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_KENTO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DB_KENTO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_KENTO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DB_KENTO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DB_KENTO] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_KENTO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_KENTO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_KENTO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_KENTO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_KENTO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_KENTO] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_KENTO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_KENTO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_KENTO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_KENTO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_KENTO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_KENTO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_KENTO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_KENTO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_KENTO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_KENTO] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_KENTO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_KENTO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_KENTO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_KENTO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_KENTO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_KENTO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_KENTO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_KENTO] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_KENTO] SET  MULTI_USER 
GO
ALTER DATABASE [DB_KENTO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_KENTO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_KENTO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_KENTO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_KENTO] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_KENTO] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DB_KENTO] SET QUERY_STORE = OFF
GO
USE [DB_KENTO]
GO
/****** Object:  Table [dbo].[cajero]    Script Date: 27/11/2021 22:13:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cajero](
	[caj_id] [int] IDENTITY(1,1) NOT NULL,
	[caj_nombre] [varchar](50) NOT NULL,
	[caj_apellido] [varchar](50) NOT NULL,
	[caj_telefono] [char](10) NOT NULL,
	[caj_direccion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CAJERO] PRIMARY KEY CLUSTERED 
(
	[caj_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 27/11/2021 22:13:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria](
	[cat_id] [int] IDENTITY(1,1) NOT NULL,
	[cat_nombre] [varchar](50) NOT NULL,
	[cat_descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CATEGORIA] PRIMARY KEY CLUSTERED 
(
	[cat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 27/11/2021 22:13:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[cli_id] [int] IDENTITY(1,1) NOT NULL,
	[cli_nombre] [varchar](50) NOT NULL,
	[cli_apellido] [varchar](50) NOT NULL,
	[cli_correo] [varchar](50) NOT NULL,
	[cli_fecha_registro] [date] NOT NULL,
 CONSTRAINT [PK_CLIENTES] PRIMARY KEY CLUSTERED 
(
	[cli_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comida]    Script Date: 27/11/2021 22:13:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comida](
	[com_id] [int] IDENTITY(1,1) NOT NULL,
	[com_nombre] [varchar](50) NOT NULL,
	[com_moneda] [varchar](50) NOT NULL,
	[com_precio] [varchar](50) NOT NULL,
	[com_fecha_registro] [date] NOT NULL,
	[cat_id] [int] NOT NULL,
 CONSTRAINT [PK_COMIDA] PRIMARY KEY CLUSTERED 
(
	[com_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[factura]    Script Date: 27/11/2021 22:13:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factura](
	[fac_id] [int] IDENTITY(1,1) NOT NULL,
	[fac_descripcion] [varchar](50) NOT NULL,
	[fac_observacion] [varchar](50) NOT NULL,
	[fac_fecha] [date] NOT NULL,
	[cli_id] [int] NOT NULL,
 CONSTRAINT [PK_FACTURAS] PRIMARY KEY CLUSTERED 
(
	[fac_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[factura_detalle]    Script Date: 27/11/2021 22:13:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factura_detalle](
	[det_id] [int] IDENTITY(1,1) NOT NULL,
	[det_cantidad] [varchar](50) NOT NULL,
	[com_id] [int] NOT NULL,
	[fac_id] [int] NOT NULL,
	[caj_id] [int] NULL,
	[pag_id] [int] NULL,
 CONSTRAINT [PK_FACTURA_DETALLE] PRIMARY KEY CLUSTERED 
(
	[det_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[modo_pago]    Script Date: 27/11/2021 22:13:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modo_pago](
	[pag_id] [int] IDENTITY(1,1) NOT NULL,
	[pag_nombre] [varchar](50) NOT NULL,
	[pag_detalle] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MODO_PAGO] PRIMARY KEY CLUSTERED 
(
	[pag_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 27/11/2021 22:13:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[authority] [varchar](50) NOT NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 27/11/2021 22:13:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[enabled] [tinyint] NOT NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[comida]  WITH CHECK ADD  CONSTRAINT [FK_COMIDA_CATEGORIA] FOREIGN KEY([cat_id])
REFERENCES [dbo].[categoria] ([cat_id])
GO
ALTER TABLE [dbo].[comida] CHECK CONSTRAINT [FK_COMIDA_CATEGORIA]
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [FK_FACTURAS_CLIENTES] FOREIGN KEY([cli_id])
REFERENCES [dbo].[cliente] ([cli_id])
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [FK_FACTURAS_CLIENTES]
GO
ALTER TABLE [dbo].[factura_detalle]  WITH CHECK ADD  CONSTRAINT [FK_factura_detalle_cajero] FOREIGN KEY([caj_id])
REFERENCES [dbo].[cajero] ([caj_id])
GO
ALTER TABLE [dbo].[factura_detalle] CHECK CONSTRAINT [FK_factura_detalle_cajero]
GO
ALTER TABLE [dbo].[factura_detalle]  WITH CHECK ADD  CONSTRAINT [FK_FACTURA_DETALLE_COMIDA] FOREIGN KEY([com_id])
REFERENCES [dbo].[comida] ([com_id])
GO
ALTER TABLE [dbo].[factura_detalle] CHECK CONSTRAINT [FK_FACTURA_DETALLE_COMIDA]
GO
ALTER TABLE [dbo].[factura_detalle]  WITH CHECK ADD  CONSTRAINT [FK_factura_detalle_factura] FOREIGN KEY([fac_id])
REFERENCES [dbo].[factura] ([fac_id])
GO
ALTER TABLE [dbo].[factura_detalle] CHECK CONSTRAINT [FK_factura_detalle_factura]
GO
ALTER TABLE [dbo].[factura_detalle]  WITH CHECK ADD  CONSTRAINT [FK_factura_detalle_modo_pago] FOREIGN KEY([pag_id])
REFERENCES [dbo].[modo_pago] ([pag_id])
GO
ALTER TABLE [dbo].[factura_detalle] CHECK CONSTRAINT [FK_factura_detalle_modo_pago]
GO
ALTER TABLE [dbo].[roles]  WITH CHECK ADD  CONSTRAINT [FK_roles_usuarios] FOREIGN KEY([user_id])
REFERENCES [dbo].[usuarios] ([id])
GO
ALTER TABLE [dbo].[roles] CHECK CONSTRAINT [FK_roles_usuarios]
GO
USE [master]
GO
ALTER DATABASE [DB_KENTO] SET  READ_WRITE 
GO
