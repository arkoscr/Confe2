USE [master]
GO
/****** Object:  Database [dbCONFE]    Script Date: 8/16/2019 11:22:25 PM ******/
CREATE DATABASE [dbCONFE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbCONFE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\dbCONFE.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbCONFE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\dbCONFE_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [dbCONFE] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbCONFE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbCONFE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbCONFE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbCONFE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbCONFE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbCONFE] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbCONFE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbCONFE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbCONFE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbCONFE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbCONFE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbCONFE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbCONFE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbCONFE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbCONFE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbCONFE] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbCONFE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbCONFE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbCONFE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbCONFE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbCONFE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbCONFE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbCONFE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbCONFE] SET RECOVERY FULL 
GO
ALTER DATABASE [dbCONFE] SET  MULTI_USER 
GO
ALTER DATABASE [dbCONFE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbCONFE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbCONFE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbCONFE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbCONFE] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbCONFE', N'ON'
GO
ALTER DATABASE [dbCONFE] SET QUERY_STORE = OFF
GO
USE [dbCONFE]
GO
/****** Object:  Schema [juego]    Script Date: 8/16/2019 11:22:25 PM ******/
CREATE SCHEMA [juego]
GO
/****** Object:  Table [dbo].[bitacoraError]    Script Date: 8/16/2019 11:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bitacoraError](
	[idBitacoraError] [int] IDENTITY(1,1) NOT NULL,
	[fechaError] [datetime] NOT NULL,
	[mensajeError] [varchar](max) NOT NULL,
	[procedimientoError] [varchar](50) NULL,
 CONSTRAINT [pkBitacoraUnidad] PRIMARY KEY CLUSTERED 
(
	[idBitacoraError] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[catequista]    Script Date: 8/16/2019 11:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[catequista](
	[idCatequista] [int] IDENTITY(1,1) NOT NULL,
	[idPersona] [int] NOT NULL,
	[idParroquia] [int] NOT NULL,
 CONSTRAINT [pkCatequista] PRIMARY KEY CLUSTERED 
(
	[idCatequista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[catequistaGrupo]    Script Date: 8/16/2019 11:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[catequistaGrupo](
	[idCatequista] [int] NOT NULL,
	[idGrupo] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[catequizando]    Script Date: 8/16/2019 11:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[catequizando](
	[idCatequizando] [int] IDENTITY(1,1) NOT NULL,
	[idPersona] [int] NOT NULL,
	[idGrupo] [int] NULL,
	[idParroquia] [int] NULL,
 CONSTRAINT [pkCatequizando] PRIMARY KEY CLUSTERED 
(
	[idCatequizando] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[diocesis]    Script Date: 8/16/2019 11:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[diocesis](
	[idDiocesis] [int] IDENTITY(1,1) NOT NULL,
	[nombreDiocesis] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idDiocesis] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[grupo]    Script Date: 8/16/2019 11:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grupo](
	[idGrupo] [int] IDENTITY(1,1) NOT NULL,
	[nombreGrupo] [varchar](50) NULL,
	[activo] [varchar](1) NOT NULL,
	[idParroquia] [int] NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[fechaUltimaAct] [datetime] NOT NULL,
 CONSTRAINT [pkGrupo] PRIMARY KEY CLUSTERED 
(
	[idGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[grupoUnidad]    Script Date: 8/16/2019 11:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grupoUnidad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idGrupo] [int] NOT NULL,
	[idUnidad] [int] NOT NULL,
	[activo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[isbn]    Script Date: 8/16/2019 11:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[isbn](
	[idisbn] [int] IDENTITY(1,1) NOT NULL,
	[valor] [varchar](30) NOT NULL,
	[fechacreacion] [datetime] NOT NULL,
	[fechaultimaact] [datetime] NOT NULL,
	[activo] [varchar](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idisbn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[multimedio]    Script Date: 8/16/2019 11:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[multimedio](
	[idMultimedio] [int] IDENTITY(1,1) NOT NULL,
	[nombreMultimedio] [varchar](150) NULL,
	[ruta] [varchar](250) NOT NULL,
	[activo] [varchar](1) NOT NULL,
	[tipo] [int] NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[fechaUltimaAct] [datetime] NOT NULL,
 CONSTRAINT [pkMultimedio] PRIMARY KEY CLUSTERED 
(
	[idMultimedio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[multimedioPublicacion]    Script Date: 8/16/2019 11:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[multimedioPublicacion](
	[idMultimedio] [int] NOT NULL,
	[idPublicacion] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[parroquia]    Script Date: 8/16/2019 11:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[parroquia](
	[idParroquia] [int] IDENTITY(1,1) NOT NULL,
	[nombreParroquia] [varchar](50) NOT NULL,
	[activo] [varchar](1) NOT NULL,
	[idDiocesis] [int] NULL,
	[fechaCreacion] [datetime] NULL,
	[fechaUltimaAct] [datetime] NULL,
 CONSTRAINT [pkParroquia] PRIMARY KEY CLUSTERED 
(
	[idParroquia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[persona]    Script Date: 8/16/2019 11:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persona](
	[idPersona] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido1] [varchar](50) NOT NULL,
	[apellido2] [varchar](50) NOT NULL,
	[fechaNacimiento] [datetime] NOT NULL,
	[cedula] [varchar](30) NULL,
	[sexo] [varchar](1) NOT NULL,
	[contrasena] [varchar](50) NOT NULL,
	[correo] [varchar](50) NOT NULL,
	[imgPerfil] [varchar](max) NULL,
	[idRol] [smallint] NOT NULL,
	[activo] [varchar](1) NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[fechaUltimaAct] [datetime] NOT NULL,
	[motivo] [varchar](250) NULL,
	[intereses] [varchar](250) NULL,
 CONSTRAINT [pkPersona] PRIMARY KEY CLUSTERED 
(
	[idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[publicacion]    Script Date: 8/16/2019 11:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[publicacion](
	[idPublicacion] [int] IDENTITY(1,1) NOT NULL,
	[destacar] [varchar](1) NOT NULL,
	[descripcion] [varchar](max) NULL,
	[autor] [int] NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[fechaUltimaAct] [datetime] NOT NULL,
 CONSTRAINT [pkIdPublicacion] PRIMARY KEY CLUSTERED 
(
	[idPublicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recursos]    Script Date: 8/16/2019 11:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recursos](
	[idRecurso] [int] IDENTITY(1,1) NOT NULL,
	[tipoRecurso] [varchar](50) NOT NULL,
	[nombreRecurso] [varchar](50) NOT NULL,
	[descripcionRecurso] [varchar](50) NOT NULL,
	[formato] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[idRecurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rol]    Script Date: 8/16/2019 11:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol](
	[idRol] [smallint] IDENTITY(1,1) NOT NULL,
	[nombreRol] [varchar](30) NOT NULL,
	[activo] [varchar](1) NOT NULL,
 CONSTRAINT [pkRol] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoMultimedio]    Script Date: 8/16/2019 11:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoMultimedio](
	[idTipoMultimedio] [int] IDENTITY(1,1) NOT NULL,
	[nombreTipoMultimedio] [varchar](50) NOT NULL,
	[activo] [varchar](1) NOT NULL,
 CONSTRAINT [pkTipoMultimedio] PRIMARY KEY CLUSTERED 
(
	[idTipoMultimedio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[unidad]    Script Date: 8/16/2019 11:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[unidad](
	[idUnidad] [int] IDENTITY(1,1) NOT NULL,
	[nombreUnidad] [varchar](50) NOT NULL,
	[numeroUnidad] [int] NOT NULL,
	[fechaCreacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idUnidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnidadRecurso]    Script Date: 8/16/2019 11:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnidadRecurso](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idUnidad] [int] NOT NULL,
	[idRecurso] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [juego].[avatar]    Script Date: 8/16/2019 11:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [juego].[avatar](
	[idAvatar] [int] IDENTITY(1,1) NOT NULL,
	[tipoAvatar] [int] NOT NULL,
	[tipoTraje] [varchar](50) NOT NULL,
	[sexo] [varchar](1) NOT NULL,
	[idUsuario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idAvatar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [juego].[estadoDeLosJuegos]    Script Date: 8/16/2019 11:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [juego].[estadoDeLosJuegos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idJuego] [varchar](50) NULL,
	[idUsuario] [int] NULL,
	[avance] [int] NULL,
	[terminado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [juego].[grupoJuego]    Script Date: 8/16/2019 11:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [juego].[grupoJuego](
	[idJuego] [varchar](50) NULL,
	[idGrupo] [int] NULL,
	[activo] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [juego].[juego]    Script Date: 8/16/2019 11:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [juego].[juego](
	[idJuego] [varchar](50) NOT NULL,
	[idUnidad] [int] NULL,
	[etiqueta] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idJuego] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [juego].[objetos]    Script Date: 8/16/2019 11:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [juego].[objetos](
	[idObjeto] [int] IDENTITY(1,1) NOT NULL,
	[etiqueta] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idObjeto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [juego].[objetosJuego]    Script Date: 8/16/2019 11:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [juego].[objetosJuego](
	[idObjeto] [int] NULL,
	[idUsuario] [int] NULL,
	[activo] [bit] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[bitacoraError] ON 

INSERT [dbo].[bitacoraError] ([idBitacoraError], [fechaError], [mensajeError], [procedimientoError]) VALUES (1, CAST(N'2019-03-24T16:50:19.453' AS DateTime), N'Conversion failed when converting the varchar value ''Es solo una prueba1pgng'' to data type int.', N' [dbo].[actualizarUsuario]')
INSERT [dbo].[bitacoraError] ([idBitacoraError], [fechaError], [mensajeError], [procedimientoError]) VALUES (2, CAST(N'2019-03-24T17:02:18.367' AS DateTime), N'Conversion failed when converting the varchar value ''Es solo una prueba1pgng'' to data type int.', N' [dbo].[actualizarUsuario]')
INSERT [dbo].[bitacoraError] ([idBitacoraError], [fechaError], [mensajeError], [procedimientoError]) VALUES (3, CAST(N'2019-03-24T17:09:53.807' AS DateTime), N'Conversion failed when converting the varchar value ''Es solo una prueba1pgng'' to data type int.', N' [dbo].[actualizarUsuario]')
INSERT [dbo].[bitacoraError] ([idBitacoraError], [fechaError], [mensajeError], [procedimientoError]) VALUES (4, CAST(N'2019-03-24T17:17:39.827' AS DateTime), N'Conversion failed when converting the varchar value ''Es solo una prueba1pgng'' to data type int.', N' [dbo].[actualizarUsuario]')
INSERT [dbo].[bitacoraError] ([idBitacoraError], [fechaError], [mensajeError], [procedimientoError]) VALUES (5, CAST(N'2019-03-31T18:25:24.660' AS DateTime), N'Cannot insert the value NULL into column ''ubicacion'', table ''dbCONFE.dbo.parroquia''; column does not allow nulls. INSERT fails.', N' [dbo].[crearParroquia]')
INSERT [dbo].[bitacoraError] ([idBitacoraError], [fechaError], [mensajeError], [procedimientoError]) VALUES (6, CAST(N'2019-03-31T18:28:15.593' AS DateTime), N'Cannot insert the value NULL into column ''ubicacion'', table ''dbCONFE.dbo.parroquia''; column does not allow nulls. INSERT fails.', N' [dbo].[crearParroquia]')
INSERT [dbo].[bitacoraError] ([idBitacoraError], [fechaError], [mensajeError], [procedimientoError]) VALUES (7, CAST(N'2019-03-31T18:28:56.107' AS DateTime), N'Cannot insert the value NULL into column ''ubicacion'', table ''dbCONFE.dbo.parroquia''; column does not allow nulls. INSERT fails.', N' [dbo].[crearParroquia]')
INSERT [dbo].[bitacoraError] ([idBitacoraError], [fechaError], [mensajeError], [procedimientoError]) VALUES (8, CAST(N'2019-03-31T18:29:41.340' AS DateTime), N'Cannot insert the value NULL into column ''ubicacion'', table ''dbCONFE.dbo.parroquia''; column does not allow nulls. INSERT fails.', N' [dbo].[crearParroquia]')
INSERT [dbo].[bitacoraError] ([idBitacoraError], [fechaError], [mensajeError], [procedimientoError]) VALUES (9, CAST(N'2019-03-31T18:42:04.170' AS DateTime), N'Cannot insert the value NULL into column ''ubicacion'', table ''dbCONFE.dbo.parroquia''; column does not allow nulls. INSERT fails.', N' [dbo].[crearParroquia]')
INSERT [dbo].[bitacoraError] ([idBitacoraError], [fechaError], [mensajeError], [procedimientoError]) VALUES (10, CAST(N'2019-03-31T18:48:01.573' AS DateTime), N'Cannot insert the value NULL into column ''ubicacion'', table ''dbCONFE.dbo.parroquia''; column does not allow nulls. INSERT fails.', N' [dbo].[crearParroquia]')
INSERT [dbo].[bitacoraError] ([idBitacoraError], [fechaError], [mensajeError], [procedimientoError]) VALUES (11, CAST(N'2019-04-27T20:46:04.877' AS DateTime), N'Cannot insert the value NULL into column ''idCatequista'', table ''dbCONFE.dbo.catequistaGrupo''; column does not allow nulls. INSERT fails.', N' [dbo].[registroGrupo]')
INSERT [dbo].[bitacoraError] ([idBitacoraError], [fechaError], [mensajeError], [procedimientoError]) VALUES (12, CAST(N'2019-04-27T20:47:54.900' AS DateTime), N'Cannot insert the value NULL into column ''idCatequista'', table ''dbCONFE.dbo.catequistaGrupo''; column does not allow nulls. INSERT fails.', N' [dbo].[registroGrupo]')
INSERT [dbo].[bitacoraError] ([idBitacoraError], [fechaError], [mensajeError], [procedimientoError]) VALUES (13, CAST(N'2019-04-27T20:50:26.943' AS DateTime), N'Cannot insert the value NULL into column ''idCatequista'', table ''dbCONFE.dbo.catequistaGrupo''; column does not allow nulls. INSERT fails.', N' [dbo].[registroGrupo]')
INSERT [dbo].[bitacoraError] ([idBitacoraError], [fechaError], [mensajeError], [procedimientoError]) VALUES (14, CAST(N'2019-04-27T20:52:37.410' AS DateTime), N'Cannot insert the value NULL into column ''idCatequista'', table ''dbCONFE.dbo.catequistaGrupo''; column does not allow nulls. INSERT fails.', N' [dbo].[registroGrupo]')
INSERT [dbo].[bitacoraError] ([idBitacoraError], [fechaError], [mensajeError], [procedimientoError]) VALUES (15, CAST(N'2019-04-28T13:44:00.370' AS DateTime), N'Conversion failed when converting the varchar value ''Se obtuvo la parroquia con exito'' to data type bit.', N'[dbo].[obtieneParroquiaCatequista]')
INSERT [dbo].[bitacoraError] ([idBitacoraError], [fechaError], [mensajeError], [procedimientoError]) VALUES (1001, CAST(N'2019-06-09T15:06:32.443' AS DateTime), N'Conversion failed when converting the varchar value ''Ya existe una unidad con el mismo número: ('' to data type int.', N' [dbo].[registroUnidad]')
INSERT [dbo].[bitacoraError] ([idBitacoraError], [fechaError], [mensajeError], [procedimientoError]) VALUES (1002, CAST(N'2019-06-16T00:48:51.053' AS DateTime), N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK__recursos__idRol__2645B050". The conflict occurred in database "dbCONFE", table "dbo.rol", column ''idRol''.', N' [dbo].[registroRecurso]')
INSERT [dbo].[bitacoraError] ([idBitacoraError], [fechaError], [mensajeError], [procedimientoError]) VALUES (1003, CAST(N'2019-06-16T01:16:26.640' AS DateTime), N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK__recursos__idRol__2645B050". The conflict occurred in database "dbCONFE", table "dbo.rol", column ''idRol''.', N' [dbo].[registroRecurso]')
SET IDENTITY_INSERT [dbo].[bitacoraError] OFF
SET IDENTITY_INSERT [dbo].[catequista] ON 

INSERT [dbo].[catequista] ([idCatequista], [idPersona], [idParroquia]) VALUES (6, 1018, 14)
INSERT [dbo].[catequista] ([idCatequista], [idPersona], [idParroquia]) VALUES (8, 1025, 14)
SET IDENTITY_INSERT [dbo].[catequista] OFF
INSERT [dbo].[catequistaGrupo] ([idCatequista], [idGrupo]) VALUES (6, 1021)
SET IDENTITY_INSERT [dbo].[catequizando] ON 

INSERT [dbo].[catequizando] ([idCatequizando], [idPersona], [idGrupo], [idParroquia]) VALUES (1, 1017, 1021, 14)
SET IDENTITY_INSERT [dbo].[catequizando] OFF
SET IDENTITY_INSERT [dbo].[diocesis] ON 

INSERT [dbo].[diocesis] ([idDiocesis], [nombreDiocesis]) VALUES (2, N'Cartago')
INSERT [dbo].[diocesis] ([idDiocesis], [nombreDiocesis]) VALUES (3, N'San Jose')
SET IDENTITY_INSERT [dbo].[diocesis] OFF
SET IDENTITY_INSERT [dbo].[grupo] ON 

INSERT [dbo].[grupo] ([idGrupo], [nombreGrupo], [activo], [idParroquia], [fechaCreacion], [fechaUltimaAct]) VALUES (7, N'Grupo 01', N'S', 14, CAST(N'2019-05-04T17:24:41.273' AS DateTime), CAST(N'2019-05-12T19:20:49.473' AS DateTime))
INSERT [dbo].[grupo] ([idGrupo], [nombreGrupo], [activo], [idParroquia], [fechaCreacion], [fechaUltimaAct]) VALUES (8, N'mi grupo 1', N'S', 14, CAST(N'2019-05-05T11:28:23.680' AS DateTime), CAST(N'2019-05-05T21:42:39.287' AS DateTime))
INSERT [dbo].[grupo] ([idGrupo], [nombreGrupo], [activo], [idParroquia], [fechaCreacion], [fechaUltimaAct]) VALUES (9, N'mi grupo 2', N'S', 14, CAST(N'2019-05-05T11:28:30.520' AS DateTime), CAST(N'2019-05-05T11:28:30.520' AS DateTime))
INSERT [dbo].[grupo] ([idGrupo], [nombreGrupo], [activo], [idParroquia], [fechaCreacion], [fechaUltimaAct]) VALUES (10, N'asdasdsad', N'S', 14, CAST(N'2019-05-11T08:58:54.070' AS DateTime), CAST(N'2019-05-11T08:58:54.070' AS DateTime))
INSERT [dbo].[grupo] ([idGrupo], [nombreGrupo], [activo], [idParroquia], [fechaCreacion], [fechaUltimaAct]) VALUES (11, N'sdsdsad', N'S', 14, CAST(N'2019-05-11T10:08:14.903' AS DateTime), CAST(N'2019-05-11T10:08:14.903' AS DateTime))
INSERT [dbo].[grupo] ([idGrupo], [nombreGrupo], [activo], [idParroquia], [fechaCreacion], [fechaUltimaAct]) VALUES (12, N'assadsadsa', N'S', 14, CAST(N'2019-05-11T10:18:35.593' AS DateTime), CAST(N'2019-05-11T10:18:35.593' AS DateTime))
INSERT [dbo].[grupo] ([idGrupo], [nombreGrupo], [activo], [idParroquia], [fechaCreacion], [fechaUltimaAct]) VALUES (13, N'fsdfsdf', N'N', 14, CAST(N'2019-05-11T10:28:12.220' AS DateTime), CAST(N'2019-05-11T14:56:38.427' AS DateTime))
INSERT [dbo].[grupo] ([idGrupo], [nombreGrupo], [activo], [idParroquia], [fechaCreacion], [fechaUltimaAct]) VALUES (14, N'prueba', N'S', 14, CAST(N'2019-05-11T14:49:52.963' AS DateTime), CAST(N'2019-05-11T14:49:52.963' AS DateTime))
INSERT [dbo].[grupo] ([idGrupo], [nombreGrupo], [activo], [idParroquia], [fechaCreacion], [fechaUltimaAct]) VALUES (15, N'ceeeeee', N'N', 14, CAST(N'2019-05-11T14:50:00.543' AS DateTime), CAST(N'2019-05-11T14:51:32.900' AS DateTime))
INSERT [dbo].[grupo] ([idGrupo], [nombreGrupo], [activo], [idParroquia], [fechaCreacion], [fechaUltimaAct]) VALUES (16, N'333333322', N'N', 14, CAST(N'2019-05-11T14:55:38.467' AS DateTime), CAST(N'2019-05-11T14:56:36.537' AS DateTime))
INSERT [dbo].[grupo] ([idGrupo], [nombreGrupo], [activo], [idParroquia], [fechaCreacion], [fechaUltimaAct]) VALUES (17, N'testFinal', N'N', 14, CAST(N'2019-05-11T14:56:46.260' AS DateTime), CAST(N'2019-05-11T14:58:43.930' AS DateTime))
INSERT [dbo].[grupo] ([idGrupo], [nombreGrupo], [activo], [idParroquia], [fechaCreacion], [fechaUltimaAct]) VALUES (18, N'Prueba', N'S', 14, CAST(N'2019-05-13T22:43:51.060' AS DateTime), CAST(N'2019-05-13T22:43:51.060' AS DateTime))
INSERT [dbo].[grupo] ([idGrupo], [nombreGrupo], [activo], [idParroquia], [fechaCreacion], [fechaUltimaAct]) VALUES (1018, N'Reigan grupos', N'S', 16, CAST(N'2019-05-15T21:33:19.820' AS DateTime), CAST(N'2019-05-15T21:50:31.470' AS DateTime))
INSERT [dbo].[grupo] ([idGrupo], [nombreGrupo], [activo], [idParroquia], [fechaCreacion], [fechaUltimaAct]) VALUES (1019, N'Sabados en la tarde', N'S', 16, CAST(N'2019-05-16T20:29:29.017' AS DateTime), CAST(N'2019-05-16T20:29:29.017' AS DateTime))
INSERT [dbo].[grupo] ([idGrupo], [nombreGrupo], [activo], [idParroquia], [fechaCreacion], [fechaUltimaAct]) VALUES (1020, N'grupotest', N'1', 14, CAST(N'2019-07-07T13:52:20.613' AS DateTime), CAST(N'2019-07-07T13:52:20.613' AS DateTime))
INSERT [dbo].[grupo] ([idGrupo], [nombreGrupo], [activo], [idParroquia], [fechaCreacion], [fechaUltimaAct]) VALUES (1021, N'Mi grupo', N'S', 14, CAST(N'2019-07-16T18:57:38.047' AS DateTime), CAST(N'2019-07-16T18:57:38.047' AS DateTime))
SET IDENTITY_INSERT [dbo].[grupo] OFF
SET IDENTITY_INSERT [dbo].[grupoUnidad] ON 

INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (1, 7, 1, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (2, 8, 1, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (3, 9, 1, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (4, 10, 1, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (5, 11, 1, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (6, 12, 1, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (7, 13, 1, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (8, 14, 1, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (9, 15, 1, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (10, 16, 1, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (11, 17, 1, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (12, 18, 1, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (13, 1018, 1, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (14, 1019, 1, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (15, 1020, 1, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (16, 7, 2, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (17, 8, 2, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (18, 9, 2, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (19, 10, 2, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (20, 11, 2, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (21, 12, 2, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (22, 13, 2, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (23, 14, 2, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (24, 15, 2, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (25, 16, 2, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (26, 17, 2, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (27, 18, 2, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (28, 1018, 2, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (29, 1019, 2, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (30, 1020, 2, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (31, 7, 3, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (32, 8, 3, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (33, 9, 3, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (34, 10, 3, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (35, 11, 3, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (36, 12, 3, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (37, 13, 3, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (38, 14, 3, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (39, 15, 3, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (40, 16, 3, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (41, 17, 3, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (42, 18, 3, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (43, 1018, 3, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (44, 1019, 3, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (45, 1020, 3, 0)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (46, 1021, 2, 1)
INSERT [dbo].[grupoUnidad] ([id], [idGrupo], [idUnidad], [activo]) VALUES (47, 1021, 3, 1)
SET IDENTITY_INSERT [dbo].[grupoUnidad] OFF
SET IDENTITY_INSERT [dbo].[isbn] ON 

INSERT [dbo].[isbn] ([idisbn], [valor], [fechacreacion], [fechaultimaact], [activo]) VALUES (1003, N'2323', CAST(N'2019-05-15T22:16:07.983' AS DateTime), CAST(N'2019-05-15T22:16:07.983' AS DateTime), N's')
INSERT [dbo].[isbn] ([idisbn], [valor], [fechacreacion], [fechaultimaact], [activo]) VALUES (1005, N'sdfasdfa233', CAST(N'2019-05-16T20:42:34.533' AS DateTime), CAST(N'2019-05-16T20:42:34.533' AS DateTime), N's')
INSERT [dbo].[isbn] ([idisbn], [valor], [fechacreacion], [fechaultimaact], [activo]) VALUES (1006, N'sdfafsaf', CAST(N'2019-05-16T20:42:42.883' AS DateTime), CAST(N'2019-05-16T20:42:42.883' AS DateTime), N's')
SET IDENTITY_INSERT [dbo].[isbn] OFF
SET IDENTITY_INSERT [dbo].[parroquia] ON 

INSERT [dbo].[parroquia] ([idParroquia], [nombreParroquia], [activo], [idDiocesis], [fechaCreacion], [fechaUltimaAct]) VALUES (14, N'Los Angeles', N'1', 3, CAST(N'2019-04-27T14:35:28.763' AS DateTime), CAST(N'2019-05-15T22:15:06.200' AS DateTime))
INSERT [dbo].[parroquia] ([idParroquia], [nombreParroquia], [activo], [idDiocesis], [fechaCreacion], [fechaUltimaAct]) VALUES (15, N'El Carmencito', N'1', 2, CAST(N'2019-04-27T14:35:28.763' AS DateTime), CAST(N'2019-04-27T14:35:28.763' AS DateTime))
INSERT [dbo].[parroquia] ([idParroquia], [nombreParroquia], [activo], [idDiocesis], [fechaCreacion], [fechaUltimaAct]) VALUES (16, N'Parroquia Tibas', N'1', 3, CAST(N'2019-04-27T14:35:28.763' AS DateTime), CAST(N'2019-04-27T14:35:28.763' AS DateTime))
INSERT [dbo].[parroquia] ([idParroquia], [nombreParroquia], [activo], [idDiocesis], [fechaCreacion], [fechaUltimaAct]) VALUES (17, N'Nuestra señora santa', N'1', 3, CAST(N'2019-04-27T14:35:28.763' AS DateTime), CAST(N'2019-04-27T14:35:28.763' AS DateTime))
INSERT [dbo].[parroquia] ([idParroquia], [nombreParroquia], [activo], [idDiocesis], [fechaCreacion], [fechaUltimaAct]) VALUES (1017, N'La virgencita de los angeles', N'1', 2, CAST(N'2019-04-27T14:35:28.763' AS DateTime), CAST(N'2019-04-27T14:35:28.763' AS DateTime))
INSERT [dbo].[parroquia] ([idParroquia], [nombreParroquia], [activo], [idDiocesis], [fechaCreacion], [fechaUltimaAct]) VALUES (1018, N'Atenea', N'0', 2, CAST(N'2019-04-27T14:35:28.763' AS DateTime), CAST(N'2019-04-27T14:35:28.763' AS DateTime))
INSERT [dbo].[parroquia] ([idParroquia], [nombreParroquia], [activo], [idDiocesis], [fechaCreacion], [fechaUltimaAct]) VALUES (1019, N'San Jose del alto', N'0', 3, CAST(N'2019-04-27T14:35:28.763' AS DateTime), CAST(N'2019-05-16T20:41:27.407' AS DateTime))
INSERT [dbo].[parroquia] ([idParroquia], [nombreParroquia], [activo], [idDiocesis], [fechaCreacion], [fechaUltimaAct]) VALUES (1020, N'La virgen', N'0', 2, CAST(N'2019-05-15T22:08:09.487' AS DateTime), CAST(N'2019-05-15T22:13:57.853' AS DateTime))
INSERT [dbo].[parroquia] ([idParroquia], [nombreParroquia], [activo], [idDiocesis], [fechaCreacion], [fechaUltimaAct]) VALUES (1021, N'La Merced de cartago', N'1', 2, CAST(N'2019-05-16T20:39:00.313' AS DateTime), CAST(N'2019-05-16T20:40:56.740' AS DateTime))
INSERT [dbo].[parroquia] ([idParroquia], [nombreParroquia], [activo], [idDiocesis], [fechaCreacion], [fechaUltimaAct]) VALUES (1022, N'nuevaa', N'1', 2, CAST(N'2019-07-28T14:54:42.887' AS DateTime), CAST(N'2019-07-28T14:54:42.887' AS DateTime))
INSERT [dbo].[parroquia] ([idParroquia], [nombreParroquia], [activo], [idDiocesis], [fechaCreacion], [fechaUltimaAct]) VALUES (1023, N'nuevaa', N'1', 2, CAST(N'2019-07-28T14:54:42.887' AS DateTime), CAST(N'2019-07-28T14:54:42.887' AS DateTime))
SET IDENTITY_INSERT [dbo].[parroquia] OFF
SET IDENTITY_INSERT [dbo].[persona] ON 

INSERT [dbo].[persona] ([idPersona], [nombre], [apellido1], [apellido2], [fechaNacimiento], [cedula], [sexo], [contrasena], [correo], [imgPerfil], [idRol], [activo], [fechaCreacion], [fechaUltimaAct], [motivo], [intereses]) VALUES (1017, N'catequizando', N'Hernandez', N'Badilla', CAST(N'2019-05-04T00:00:00.000' AS DateTime), N'304890357', N'M', N'1234', N'catequizando@gmail.com', N'1017.JPEG', 1, N'S', CAST(N'2019-05-04T16:16:40.860' AS DateTime), CAST(N'2019-07-16T18:59:16.593' AS DateTime), N'Lista de motivo', N'Lista de intereses')
INSERT [dbo].[persona] ([idPersona], [nombre], [apellido1], [apellido2], [fechaNacimiento], [cedula], [sexo], [contrasena], [correo], [imgPerfil], [idRol], [activo], [fechaCreacion], [fechaUltimaAct], [motivo], [intereses]) VALUES (1018, N'catequista', N'Giron', N'Giron', CAST(N'2019-05-04T00:00:00.000' AS DateTime), N'30489357322', N'M', N'1234', N'catequista@gmail.com', N'1018.JPEG', 2, N'S', CAST(N'2019-05-04T16:18:20.260' AS DateTime), CAST(N'2019-07-16T18:56:16.590' AS DateTime), N'Mi motivo', N'Mi lista de interess')
INSERT [dbo].[persona] ([idPersona], [nombre], [apellido1], [apellido2], [fechaNacimiento], [cedula], [sexo], [contrasena], [correo], [imgPerfil], [idRol], [activo], [fechaCreacion], [fechaUltimaAct], [motivo], [intereses]) VALUES (1025, N'Administrador', N'apellido', N'apellido2', CAST(N'2019-05-05T00:00:00.000' AS DateTime), N'4234242', N'M', N'1234', N'admin@gmail.com', N'1025.JPEG', 3, N'S', CAST(N'2019-05-05T11:26:45.137' AS DateTime), CAST(N'2019-07-21T16:22:59.083' AS DateTime), N'asdsa', N'sdf')
SET IDENTITY_INSERT [dbo].[persona] OFF
SET IDENTITY_INSERT [dbo].[recursos] ON 

INSERT [dbo].[recursos] ([idRecurso], [tipoRecurso], [nombreRecurso], [descripcionRecurso], [formato]) VALUES (20, N'img', N'nuevo.png', N'nuevo', N'png')
INSERT [dbo].[recursos] ([idRecurso], [tipoRecurso], [nombreRecurso], [descripcionRecurso], [formato]) VALUES (22, N'img', N'prueba.jpg', N'prueba', N'jpg')
INSERT [dbo].[recursos] ([idRecurso], [tipoRecurso], [nombreRecurso], [descripcionRecurso], [formato]) VALUES (29, N'url', N'enlace telivsesivo', N'www.youtube.com', N'url')
INSERT [dbo].[recursos] ([idRecurso], [tipoRecurso], [nombreRecurso], [descripcionRecurso], [formato]) VALUES (31, N'url', N'aja', N'www.yo.com', N'url')
INSERT [dbo].[recursos] ([idRecurso], [tipoRecurso], [nombreRecurso], [descripcionRecurso], [formato]) VALUES (32, N'url', N'ajaa', N'www.yosssdfasfsafafs.com', N'url')
INSERT [dbo].[recursos] ([idRecurso], [tipoRecurso], [nombreRecurso], [descripcionRecurso], [formato]) VALUES (33, N'url', N'dafsadfjkasdfjasdlfsajflkasdjfasldfaskjfadsklfjas', N'aaadfsafasdfadsfadsfadsfa', N'url')
INSERT [dbo].[recursos] ([idRecurso], [tipoRecurso], [nombreRecurso], [descripcionRecurso], [formato]) VALUES (34, N'url', N'http', N'http://google.com', N'url')
SET IDENTITY_INSERT [dbo].[recursos] OFF
SET IDENTITY_INSERT [dbo].[rol] ON 

INSERT [dbo].[rol] ([idRol], [nombreRol], [activo]) VALUES (1, N'Catequizando', N'S')
INSERT [dbo].[rol] ([idRol], [nombreRol], [activo]) VALUES (2, N'Catequista', N'S')
INSERT [dbo].[rol] ([idRol], [nombreRol], [activo]) VALUES (3, N'Administrador', N'S')
SET IDENTITY_INSERT [dbo].[rol] OFF
SET IDENTITY_INSERT [dbo].[tipoMultimedio] ON 

INSERT [dbo].[tipoMultimedio] ([idTipoMultimedio], [nombreTipoMultimedio], [activo]) VALUES (1, N'Texto', N'S')
INSERT [dbo].[tipoMultimedio] ([idTipoMultimedio], [nombreTipoMultimedio], [activo]) VALUES (2, N'Imagen', N'S')
SET IDENTITY_INSERT [dbo].[tipoMultimedio] OFF
SET IDENTITY_INSERT [dbo].[unidad] ON 

INSERT [dbo].[unidad] ([idUnidad], [nombreUnidad], [numeroUnidad], [fechaCreacion]) VALUES (2, N'Padres amorosos', 1, CAST(N'2019-07-16T18:52:33.457' AS DateTime))
INSERT [dbo].[unidad] ([idUnidad], [nombreUnidad], [numeroUnidad], [fechaCreacion]) VALUES (3, N'Madres amorosas', 2, CAST(N'2019-07-16T18:53:51.987' AS DateTime))
SET IDENTITY_INSERT [dbo].[unidad] OFF
SET IDENTITY_INSERT [dbo].[UnidadRecurso] ON 

INSERT [dbo].[UnidadRecurso] ([id], [idUnidad], [idRecurso]) VALUES (16, 2, 2)
INSERT [dbo].[UnidadRecurso] ([id], [idUnidad], [idRecurso]) VALUES (17, 2, 20)
INSERT [dbo].[UnidadRecurso] ([id], [idUnidad], [idRecurso]) VALUES (18, 2, 22)
INSERT [dbo].[UnidadRecurso] ([id], [idUnidad], [idRecurso]) VALUES (19, 2, 5)
INSERT [dbo].[UnidadRecurso] ([id], [idUnidad], [idRecurso]) VALUES (20, 3, 2)
INSERT [dbo].[UnidadRecurso] ([id], [idUnidad], [idRecurso]) VALUES (21, 3, 2)
SET IDENTITY_INSERT [dbo].[UnidadRecurso] OFF
SET IDENTITY_INSERT [juego].[avatar] ON 

INSERT [juego].[avatar] ([idAvatar], [tipoAvatar], [tipoTraje], [sexo], [idUsuario]) VALUES (2, 2, N'nuevo', N'm', 1017)
SET IDENTITY_INSERT [juego].[avatar] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__isbn__40B8076F12B9F6F6]    Script Date: 8/16/2019 11:22:26 PM ******/
ALTER TABLE [dbo].[isbn] ADD UNIQUE NONCLUSTERED 
(
	[valor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[grupo] ADD  DEFAULT ('S') FOR [activo]
GO
ALTER TABLE [dbo].[grupo] ADD  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[grupo] ADD  DEFAULT (getdate()) FOR [fechaUltimaAct]
GO
ALTER TABLE [dbo].[grupoUnidad] ADD  DEFAULT ((0)) FOR [activo]
GO
ALTER TABLE [dbo].[isbn] ADD  DEFAULT (getdate()) FOR [fechacreacion]
GO
ALTER TABLE [dbo].[isbn] ADD  DEFAULT (getdate()) FOR [fechaultimaact]
GO
ALTER TABLE [dbo].[isbn] ADD  DEFAULT ('s') FOR [activo]
GO
ALTER TABLE [dbo].[multimedio] ADD  DEFAULT ('S') FOR [activo]
GO
ALTER TABLE [dbo].[multimedio] ADD  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[multimedio] ADD  DEFAULT (getdate()) FOR [fechaUltimaAct]
GO
ALTER TABLE [dbo].[parroquia] ADD  DEFAULT ('S') FOR [activo]
GO
ALTER TABLE [dbo].[parroquia] ADD  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[parroquia] ADD  DEFAULT (getdate()) FOR [fechaUltimaAct]
GO
ALTER TABLE [dbo].[persona] ADD  DEFAULT ('S') FOR [activo]
GO
ALTER TABLE [dbo].[persona] ADD  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[persona] ADD  DEFAULT (getdate()) FOR [fechaUltimaAct]
GO
ALTER TABLE [dbo].[publicacion] ADD  DEFAULT ('N') FOR [destacar]
GO
ALTER TABLE [dbo].[publicacion] ADD  DEFAULT ('') FOR [descripcion]
GO
ALTER TABLE [dbo].[publicacion] ADD  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[publicacion] ADD  DEFAULT (getdate()) FOR [fechaUltimaAct]
GO
ALTER TABLE [dbo].[rol] ADD  DEFAULT ('S') FOR [activo]
GO
ALTER TABLE [dbo].[tipoMultimedio] ADD  DEFAULT ('S') FOR [activo]
GO
ALTER TABLE [juego].[estadoDeLosJuegos] ADD  DEFAULT ((0)) FOR [terminado]
GO
ALTER TABLE [juego].[grupoJuego] ADD  DEFAULT ((0)) FOR [activo]
GO
ALTER TABLE [dbo].[catequista]  WITH CHECK ADD  CONSTRAINT [fkCatequistaToParroquia] FOREIGN KEY([idParroquia])
REFERENCES [dbo].[parroquia] ([idParroquia])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[catequista] CHECK CONSTRAINT [fkCatequistaToParroquia]
GO
ALTER TABLE [dbo].[catequista]  WITH CHECK ADD  CONSTRAINT [fkCatequistaToPersona] FOREIGN KEY([idPersona])
REFERENCES [dbo].[persona] ([idPersona])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[catequista] CHECK CONSTRAINT [fkCatequistaToPersona]
GO
ALTER TABLE [dbo].[catequistaGrupo]  WITH CHECK ADD  CONSTRAINT [FkCatequistaGrupoToCatequista] FOREIGN KEY([idCatequista])
REFERENCES [dbo].[catequista] ([idCatequista])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[catequistaGrupo] CHECK CONSTRAINT [FkCatequistaGrupoToCatequista]
GO
ALTER TABLE [dbo].[catequistaGrupo]  WITH CHECK ADD  CONSTRAINT [FkCatequistaGrupoToGrupo] FOREIGN KEY([idGrupo])
REFERENCES [dbo].[grupo] ([idGrupo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[catequistaGrupo] CHECK CONSTRAINT [FkCatequistaGrupoToGrupo]
GO
ALTER TABLE [dbo].[catequizando]  WITH CHECK ADD  CONSTRAINT [fkCatequizandoToGrupo] FOREIGN KEY([idGrupo])
REFERENCES [dbo].[grupo] ([idGrupo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[catequizando] CHECK CONSTRAINT [fkCatequizandoToGrupo]
GO
ALTER TABLE [dbo].[catequizando]  WITH CHECK ADD  CONSTRAINT [fkCatequizandoToParroquia] FOREIGN KEY([idParroquia])
REFERENCES [dbo].[parroquia] ([idParroquia])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[catequizando] CHECK CONSTRAINT [fkCatequizandoToParroquia]
GO
ALTER TABLE [dbo].[catequizando]  WITH CHECK ADD  CONSTRAINT [fkCatequizandoToPersona] FOREIGN KEY([idPersona])
REFERENCES [dbo].[persona] ([idPersona])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[catequizando] CHECK CONSTRAINT [fkCatequizandoToPersona]
GO
ALTER TABLE [dbo].[grupo]  WITH CHECK ADD  CONSTRAINT [fkGrupoToParroquia] FOREIGN KEY([idParroquia])
REFERENCES [dbo].[parroquia] ([idParroquia])
GO
ALTER TABLE [dbo].[grupo] CHECK CONSTRAINT [fkGrupoToParroquia]
GO
ALTER TABLE [dbo].[multimedio]  WITH CHECK ADD  CONSTRAINT [fkmultimedioToTipoMultimedio] FOREIGN KEY([tipo])
REFERENCES [dbo].[tipoMultimedio] ([idTipoMultimedio])
GO
ALTER TABLE [dbo].[multimedio] CHECK CONSTRAINT [fkmultimedioToTipoMultimedio]
GO
ALTER TABLE [dbo].[multimedioPublicacion]  WITH CHECK ADD  CONSTRAINT [fkMultimedioPublicacionToMultimedio] FOREIGN KEY([idMultimedio])
REFERENCES [dbo].[multimedio] ([idMultimedio])
GO
ALTER TABLE [dbo].[multimedioPublicacion] CHECK CONSTRAINT [fkMultimedioPublicacionToMultimedio]
GO
ALTER TABLE [dbo].[multimedioPublicacion]  WITH CHECK ADD  CONSTRAINT [fkMultimedioPublicacionToPublicacion] FOREIGN KEY([idPublicacion])
REFERENCES [dbo].[publicacion] ([idPublicacion])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[multimedioPublicacion] CHECK CONSTRAINT [fkMultimedioPublicacionToPublicacion]
GO
ALTER TABLE [dbo].[parroquia]  WITH CHECK ADD FOREIGN KEY([idDiocesis])
REFERENCES [dbo].[diocesis] ([idDiocesis])
GO
ALTER TABLE [dbo].[persona]  WITH CHECK ADD  CONSTRAINT [fkPersonaToRol] FOREIGN KEY([idRol])
REFERENCES [dbo].[rol] ([idRol])
GO
ALTER TABLE [dbo].[persona] CHECK CONSTRAINT [fkPersonaToRol]
GO
ALTER TABLE [dbo].[publicacion]  WITH CHECK ADD  CONSTRAINT [fkAutor] FOREIGN KEY([autor])
REFERENCES [dbo].[persona] ([idPersona])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[publicacion] CHECK CONSTRAINT [fkAutor]
GO
ALTER TABLE [juego].[avatar]  WITH CHECK ADD  CONSTRAINT [fk_avatar_persona] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[persona] ([idPersona])
ON DELETE CASCADE
GO
ALTER TABLE [juego].[avatar] CHECK CONSTRAINT [fk_avatar_persona]
GO
ALTER TABLE [juego].[estadoDeLosJuegos]  WITH CHECK ADD  CONSTRAINT [fk_estadoJuego_juego] FOREIGN KEY([idJuego])
REFERENCES [juego].[juego] ([idJuego])
ON DELETE CASCADE
GO
ALTER TABLE [juego].[estadoDeLosJuegos] CHECK CONSTRAINT [fk_estadoJuego_juego]
GO
ALTER TABLE [juego].[estadoDeLosJuegos]  WITH CHECK ADD  CONSTRAINT [fk_estadoJuego_persona] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[persona] ([idPersona])
ON DELETE CASCADE
GO
ALTER TABLE [juego].[estadoDeLosJuegos] CHECK CONSTRAINT [fk_estadoJuego_persona]
GO
ALTER TABLE [juego].[grupoJuego]  WITH CHECK ADD  CONSTRAINT [fk_grupoJuego_grupo] FOREIGN KEY([idGrupo])
REFERENCES [dbo].[grupo] ([idGrupo])
ON DELETE CASCADE
GO
ALTER TABLE [juego].[grupoJuego] CHECK CONSTRAINT [fk_grupoJuego_grupo]
GO
ALTER TABLE [juego].[grupoJuego]  WITH CHECK ADD  CONSTRAINT [fk_grupoJuego_juego] FOREIGN KEY([idJuego])
REFERENCES [juego].[juego] ([idJuego])
ON DELETE CASCADE
GO
ALTER TABLE [juego].[grupoJuego] CHECK CONSTRAINT [fk_grupoJuego_juego]
GO
ALTER TABLE [juego].[juego]  WITH CHECK ADD  CONSTRAINT [fk_juego_unidad] FOREIGN KEY([idUnidad])
REFERENCES [dbo].[unidad] ([idUnidad])
GO
ALTER TABLE [juego].[juego] CHECK CONSTRAINT [fk_juego_unidad]
GO
ALTER TABLE [juego].[objetosJuego]  WITH CHECK ADD  CONSTRAINT [fk_objetosPersona_idObjecto] FOREIGN KEY([idObjeto])
REFERENCES [juego].[objetos] ([idObjeto])
ON DELETE CASCADE
GO
ALTER TABLE [juego].[objetosJuego] CHECK CONSTRAINT [fk_objetosPersona_idObjecto]
GO
ALTER TABLE [juego].[objetosJuego]  WITH CHECK ADD  CONSTRAINT [fk_objetosPersona_persona] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[persona] ([idPersona])
ON DELETE CASCADE
GO
ALTER TABLE [juego].[objetosJuego] CHECK CONSTRAINT [fk_objetosPersona_persona]
GO
/****** Object:  StoredProcedure [dbo].[actualizarGrupo]    Script Date: 8/16/2019 11:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[actualizarGrupo] 
	-- Add the parameters for the stored procedure here
	@pNombreGrupo		 varchar(50),
	@pIdGrupo			 int,
	@pResultado          varchar(max) OUTPUT,
	@pEstadoResultado	 bit OUTPUT

AS
BEGIN
	BEGIN TRANSACTION
	  BEGIN TRY
		update grupo set nombreGrupo=@pNombreGrupo, fechaUltimaAct = getDate()
		WHERE idGrupo=@pIdGrupo

		SET @pResultado= 'El grupo se actualizó correctamente'
		set @pEstadoResultado   = 1

		COMMIT TRANSACTION;
	  END TRY 
	BEGIN CATCH
	  
	  ROLLBACK TRANSACTION

	  INSERT INTO dbo.bitacoraError(fechaError,mensajeError,procedimientoError)values(getdate(),ERROR_MESSAGE(),' [dbo].[actualizarGrupo]')
	  SET @pResultado= 'Error al actualizar el grupo'
	  set @pEstadoResultado   = 0

	  declare @error int,@message varchar(4000),@xstate int
	  select @error= ERROR_NUMBER() , @message=ERROR_MESSAGE(),@xstate=XACT_STATE()
	  raiserror ('actualizarGrupo: %d %s',16,1,@error,@message)
	  
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[actualizarUsuario]    Script Date: 8/16/2019 11:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[actualizarUsuario] 
	@pIdPersona			int,
	@pNombre			varchar(50),
	@pApellido1			varchar(50),
	@pApellido2			varchar(50),
	@pFechaNacimiento   datetime,
	@pCedula            varchar(30),
	@pSexo              varchar(1),
	@pContrasena        varchar(50) = null,
	@pCorreo            varchar(50),
	@pRuta				varchar(max) = null,
	@pMotivo			varchar(250),
	@pIntereses			varchar(250),
	@pResultado			varchar(max) OUTPUT,
	@pEstadoResultado	bit OUTPUT
	
AS
BEGIN
  BEGIN TRANSACTION
  BEGIN TRY 
   
	IF (SELECT COUNT(correo)
          FROM persona 
	      WHERE idPersona <> @pIdPersona
	        AND  correo=@pCorreo
			and idPersona <> @pIdPersona) > 0 BEGIN
	   set @pResultado ='Ya existe un usuario con el correo:'+@pCorreo
	   set @pEstadoResultado = 0
	END
	ELSE BEGIN
    					
	-- Si viene vacío o nulo no se actualiza
	if @pContrasena = '' begin
		select @pContrasena = null
	end
	IF @pRuta='' BEGIN
		set @pRuta= null
	END 
															
	UPDATE DBO.persona set nombre=@pNombre,apellido1=@pApellido1,apellido2=@pApellido2,
	                         fechaNacimiento = @pFechaNacimiento,cedula=@pCedula,sexo= @pSexo,
							 contrasena= isnull(@pContrasena, contrasena) ,correo= @pCorreo,fechaUltimaAct=GETDATE(),
							 motivo=@pMotivo,intereses=@pIntereses, imgPerfil= isnull(@pRuta,imgPerfil)
	WHERE idPersona = @pIdPersona	

	set @pResultado ='El usuario fue modificado con exito'
	set @pEstadoResultado = 1
  END
  COMMIT TRANSACTION;
  END TRY
  BEGIN CATCH
	ROLLBACK TRANSACTION

	INSERT INTO dbo.bitacoraError(fechaError,mensajeError,procedimientoError)values(getdate(),ERROR_MESSAGE(),' [dbo].[actualizarUsuario]')
	SET @pResultado= 'Error al actualizar el usuario'
	set @pEstadoResultado   = 0

	declare @error int,@message varchar(4000),@xstate int
	select @error= ERROR_NUMBER() , @message=ERROR_MESSAGE(),@xstate=XACT_STATE()
	raiserror ('actualizarUsuario: %d %s',16,1,@error,@message)
	  
  END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[asignaCatequistaGrupo]    Script Date: 8/16/2019 11:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[asignaCatequistaGrupo] 
	-- Add the parameters for the stored procedure here
	@pIdUsuario			 int, 
	@pIdGrupo		     int,
	@pResultado          varchar(max) OUTPUT,
	@pEstadoResultado	 bit OUTPUT

AS
BEGIN
	BEGIN TRANSACTION
	  BEGIN TRY

		declare @idCatequista int 
		select @idCatequista=idCatequista 
		  from catequista
		 where idPersona=@pIdUsuario

		INSERT INTO catequistaGrupo(idCatequista,idGrupo)
	    VALUES(@idCatequista,@pIdGrupo)

		SET @pResultado= 'Se agregó el catequista al grupo correctamente'
	    set @pEstadoResultado   = 1

		COMMIT TRANSACTION;
	  END TRY 
	BEGIN CATCH

	  ROLLBACK TRANSACTION

	  INSERT INTO dbo.bitacoraError(fechaError,mensajeError,procedimientoError)values(getdate(),ERROR_MESSAGE(),' [dbo].[asignaCatequistaGrupo]')
	  SET @pResultado= 'Error al agregar el catequista al grupo'
	  set @pEstadoResultado   = 0

	  declare @error int,@message varchar(4000),@xstate int
	  select @error= ERROR_NUMBER() , @message=ERROR_MESSAGE(),@xstate=XACT_STATE()
	  raiserror ('asignaCatequistaGrupo: %d %s',16,1,@error,@message)
	  
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[asignaCatequizandoGrupo]    Script Date: 8/16/2019 11:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[asignaCatequizandoGrupo] 
	-- Add the parameters for the stored procedure here
	@pIdUsuario			 int, 
	@pIdGrupo		     int,
	@pResultado          varchar(max) OUTPUT,
	@pEstadoResultado	 bit OUTPUT

AS
BEGIN
	BEGIN TRANSACTION
	  BEGIN TRY

		UPDATE catequizando SET idGrupo=@pIdGrupo
		WHERE idPersona=@pIdUsuario

		UPDATE persona SET fechaUltimaAct = getDate()
		  WHERE idPersona = @pIdUsuario

		SET @pResultado= 'Se agregó el catequizando al grupo correctamente'
	    set @pEstadoResultado   = 1

		COMMIT TRANSACTION;
	  END TRY 
	BEGIN CATCH
	  
	  ROLLBACK TRANSACTION

	  INSERT INTO dbo.bitacoraError(fechaError,mensajeError,procedimientoError)values(getdate(),ERROR_MESSAGE(),' [dbo].[asignaCatequizandoGrupo]')
	  SET @pResultado= 'Error al agregar el catequizando al grupo'
	  set @pEstadoResultado   = 0

	  declare @error int,@message varchar(4000),@xstate int
	  select @error= ERROR_NUMBER() , @message=ERROR_MESSAGE(),@xstate=XACT_STATE()
	  raiserror ('asignaCatequizandoGrupo: %d %s',16,1,@error,@message)
	  
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[completaUsuario]    Script Date: 8/16/2019 11:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[completaUsuario] 
	@pIdPersona   int,
	@pRuta        varchar(max),
	@pMotivo	  varchar(250),
	@pIntereses   varchar(250),
	@resultado    varchar(max) OUTPUT,
	@estadoResultado bit OUTPUT
	

AS
BEGIN
  BEGIN TRANSACTION
  BEGIN TRY 

	UPDATE DBO.persona set imgPerfil=@pRuta, motivo=@pMotivo
	       ,intereses=@pIntereses, fechaUltimaAct = GETDATE()
	WHERE idPersona=@pIdPersona		

    COMMIT TRANSACTION;
	set @resultado ='El usuario fue modificado con exito'
	set @estadoResultado = 1
  END TRY
  BEGIN CATCH
    ROLLBACK TRANSACTION
	INSERT INTO dbo.bitacoraError(fechaError,mensajeError,procedimientoError)values(getdate(),ERROR_MESSAGE(),'[dbo].[completaUsuario]')
    set @resultado ='Eror al actualizar el usuario'
	set @estadoResultado = 0

	 declare @error int,@message varchar(4000),@xstate int
	 select @error= ERROR_NUMBER() , @message=ERROR_MESSAGE(),@xstate=XACT_STATE()
	 raiserror ('completaUsuario: %d %s',16,1,@error,@message)
  END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[desactivarCuenta]    Script Date: 8/16/2019 11:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[desactivarCuenta] 
	@pIdPersona			int,
	@resultado			varchar(max) OUTPUT,
	@estadoResultado	bit OUTPUT
	

AS
BEGIN
  BEGIN TRANSACTION
  BEGIN TRY 
    UPDATE PERSONA SET activo='N', fechaUltimaAct = GETDATE()
	 WHERE idPersona=@pIdPersona

    COMMIT TRANSACTION;
	set @resultado ='El usuario fue modificado con exito'
	set @estadoResultado = 1

  END TRY
  BEGIN CATCH
    ROLLBACK TRANSACTION
	INSERT INTO dbo.bitacoraError(fechaError,mensajeError,procedimientoError)values(getdate(),ERROR_MESSAGE(),'[dbo].[completaUsuario]')
    set @resultado ='Error al desactivar el usuario'
	set @estadoResultado = 0

	declare @error int,@message varchar(4000),@xstate int
	select @error= ERROR_NUMBER() , @message=ERROR_MESSAGE(),@xstate=XACT_STATE()
	raiserror ('desactivarCuenta: %d %s',16,1,@error,@message)
  END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[eliminaCatequistaGrupo]    Script Date: 8/16/2019 11:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[eliminaCatequistaGrupo] 
	-- Add the parameters for the stored procedure here
	@pIdUsuario			 int, 
	@pIdGrupo		     int,
	@pResultado          varchar(max) OUTPUT,
	@pEstadoResultado	 bit OUTPUT

AS
BEGIN
	BEGIN TRANSACTION
	  BEGIN TRY

		declare @idCatequista int 
		select @idCatequista=idCatequista 
		  from catequista
		 where idPersona=@pIdUsuario

		 delete from catequistaGrupo
		 where  idCatequista=@idCatequista and idGrupo=@pIdGrupo

		SET @pResultado= 'Se eliminó el catequista del grupo correctamente'
	    set @pEstadoResultado   = 1

		COMMIT TRANSACTION;
	  END TRY 
	BEGIN CATCH
	  ROLLBACK TRANSACTION

	  INSERT INTO dbo.bitacoraError(fechaError,mensajeError,procedimientoError)values(getdate(),ERROR_MESSAGE(),' [dbo].[eliminaCatequistaGrupo]')
	  SET @pResultado= 'Error al eliminar el catequista del grupo'
	  set @pEstadoResultado   = 0

	  declare @error int,@message varchar(4000),@xstate int
	  select @error= ERROR_NUMBER() , @message=ERROR_MESSAGE(),@xstate=XACT_STATE()
	  raiserror ('eliminaCatequistaGrupo: %d %s',16,1,@error,@message)
	  
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[eliminaCatequizandoDeGrupo]    Script Date: 8/16/2019 11:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[eliminaCatequizandoDeGrupo]
	@pIdPersona	 int,
	@pResultado          varchar(max) OUTPUT,
	@pEstadoResultado	 bit OUTPUT
AS
BEGIN
	  BEGIN TRY
	    declare @idCatequizando int = null
		select @idCatequizando = catequizando.idCatequizando
		  from persona p
		  inner join catequizando catequizando on (catequizando.idPersona = @pIdPersona)
		  where p.idPersona = @pIdPersona;

		if @idCatequizando is null begin
		  set @pResultado = 'El catequizando no existe'
		  set @pEstadoResultado = 0;
		end
		else begin
		  begin transaction
		  update catequizando set idGrupo = null
		    where idCatequizando = @idCatequizando;

		  set @pResultado = 'El catequizando se elimino con exito'
		  set @pEstadoResultado = 0;
		  commit transaction;
		end

	  END TRY 
	BEGIN CATCH
	  ROLLBACK TRANSACTION

	  INSERT INTO dbo.bitacoraError(fechaError,mensajeError,procedimientoError)values(getdate(),ERROR_MESSAGE(),' [dbo].[eliminaCatequistaGrupo]')
	  SET @pResultado= 'Error al eliminar el catequista del grupo'
	  set @pEstadoResultado   = 0

	  declare @error int,@message varchar(4000),@xstate int
	  select @error= ERROR_NUMBER() , @message=ERROR_MESSAGE(),@xstate=XACT_STATE()
	  raiserror ('eliminaCatequistaGrupo: %d %s',16,1,@error,@message)
	  
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[EliminaGrupo]    Script Date: 8/16/2019 11:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[EliminaGrupo] 
	-- Add the parameters for the stored procedure here
	@pIdGrupo			 int,
	@pResultado          varchar(max) OUTPUT,
	@pEstadoResultado	 bit OUTPUT

AS
BEGIN
	BEGIN TRANSACTION
	  BEGIN TRY
		UPDATE grupo SET activo = 'N', fechaUltimaAct = GETDATE()
		  WHERE idGrupo = @pIdGrupo

		SET @pResultado= 'Se eliminó el grupo correctamente'
		set @pEstadoResultado   = 1
		COMMIT TRANSACTION;
	  END TRY 
	BEGIN CATCH
	  ROLLBACK TRANSACTION

	  INSERT INTO dbo.bitacoraError(fechaError,mensajeError,procedimientoError)values(getdate(),ERROR_MESSAGE(),' [dbo].[EliminaGrupo]')
	  SET @pResultado= 'Error al eliminar el grupo'
	  set @pEstadoResultado   = 0

	  declare @error int,@message varchar(4000),@xstate int
	  select @error= ERROR_NUMBER() , @message=ERROR_MESSAGE(),@xstate=XACT_STATE()
	  raiserror ('EliminaGrupo: %d %s',16,1,@error,@message)
	  
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[eliminarISBN]    Script Date: 8/16/2019 11:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Eliminar
create procedure [dbo].[eliminarISBN]
  @pIdISBN            integer,
  @pResultado         varchar(max) output,
  @pEstadoresultado	  bit output
as
begin
  begin transaction
  begin try
    
	declare @result bit = 0
    select @result = 1
      from isbn
      where idisbn = @pIdISBN

    if @result = 1 begin
      delete from isbn where idisbn = @pIdISBN
	  set @pEstadoResultado = 1
    end
    else begin
      set @pResultado ='El código ISBN ' + @pIdISBN + ' no existe'
      set @pEstadoResultado = 0
    end

	commit transaction
  end try

  begin catch
	rollback transaction

	insert into dbo.bitacoraerror(fechaerror,mensajeerror,procedimientoerror)values(getdate(),error_message(),' [dbo].[eliminarISBN]')
	set @pResultado= 'Error al eliminar el ISBN'
	set @pEstadoResultado   = 0

	declare @error int,@message varchar(4000),@xstate int
	select @error= error_number() , @message=error_message(),@xstate=xact_state()
	raiserror ('eliminarISBN: %d %s',16,1,@error,@message)

  end catch

end
GO
/****** Object:  StoredProcedure [dbo].[eliminarParroquia]    Script Date: 8/16/2019 11:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[eliminarParroquia] 
	-- Add the parameters for the stored procedure here

	@pidParroquia	     int, 
	@pResultado          varchar(max) OUTPUT,
	@pEstadoResultado	 bit OUTPUT

AS
BEGIN
	BEGIN TRANSACTION
	  BEGIN TRY
	    update parroquia set activo= 0, fechaUltimaAct = GETDATE()
		 where idParroquia=@pidParroquia
		SET @pResultado= 'Se eliminó correctamente la parroquia'
		set @pEstadoResultado   = 1
		COMMIT TRANSACTION;
	  END TRY 
	BEGIN CATCH
	  ROLLBACK TRANSACTION

	  INSERT INTO dbo.bitacoraError(fechaError,mensajeError,procedimientoError)values(getdate(),ERROR_MESSAGE(),' [dbo].[eliminarParroquia]')
	  SET @pResultado= 'Error al desactivar una parroquia'
	  set @pEstadoResultado   = 0

	  declare @error int,@message varchar(4000),@xstate int
	  select @error= ERROR_NUMBER() , @message=ERROR_MESSAGE(),@xstate=XACT_STATE()
	  raiserror ('eliminarParroquia: %d %s',16,1,@error,@message)
	  
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[login]    Script Date: 8/16/2019 11:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimientos
-- =======================================

CREATE PROCEDURE [dbo].[login] 
	@pUsuario			varchar(50),
	@pContrasena		varchar(50),
	@pResultado			varchar(max) OUTPUT,
	@pEstadoResultado	bit OUTPUT,
	@pNombre            varchar(50) OUTPUT,
	@pApellido          varchar(50) OUTPUT,
	@pIdRol             smallint OUTPUT,
	@pCorreo			varchar(50) OUTPUT,
	@pIdUsuario         integer OUTPUT,
	@pImgPerfil			varchar(max) output
	

AS
BEGIN
  BEGIN TRANSACTION
  BEGIN TRY 
    DECLARE @vIdUsuario int =(SELECT idPersona 
								FROM persona
								WHERE correo		= @pUsuario
								  AND contrasena	= @pContrasena
								  AND activo		= 'S')

    IF @vIdUsuario IS NOT NULL BEGIN
	  SELECT @pIdUsuario = idPersona, @pNombre = nombre, @pApellido = apellido1
			 ,@pIdRol = idRol, @pCorreo = correo, @pImgPerfil=imgPerfil
	    FROM persona
	   WHERE idPersona=@vIdUsuario -- Previamente se valida que este activo

	  set @pResultado ='El usuario ha iniciado sesion'
	  set @pEstadoResultado = 1
	END

	ELSE BEGIN
	  SET @pResultado='No se encontró ningún usuario con los credenciales suministrados'
	  set @pEstadoResultado = 0
	END

	COMMIT TRANSACTION;

  END TRY

  BEGIN CATCH
    ROLLBACK TRANSACTION

	INSERT INTO dbo.bitacoraError(fechaError,mensajeError,procedimientoError)values(getdate(),ERROR_MESSAGE(),'[dbo].[login]')
    set @pResultado ='Error al consultar el usuario :'+ @pUsuario
	set @pEstadoResultado = 0

	declare @error int,@message varchar(4000),@xstate int
	select @error= ERROR_NUMBER() , @message=ERROR_MESSAGE(),@xstate=XACT_STATE()
	raiserror ('login: %d %s',16,1,@error,@message)
  END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[modificarParroquia]    Script Date: 8/16/2019 11:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[modificarParroquia] 
	-- Add the parameters for the stored procedure here

	@pidParroquia	     int,
	@pNombreParroquia	 varchar(50),
	@pidDiocesis		 int ,
	@pResultado          varchar(max) OUTPUT,
	@pEstadoResultado	 bit OUTPUT

AS
BEGIN
	BEGIN TRANSACTION
	  BEGIN TRY

	    UPDATE parroquia SET nombreParroquia= ISNULL(@pNombreParroquia,nombreParroquia),
				idDiocesis=ISNULL(@pidDiocesis,idDiocesis), fechaUltimaAct = GETDATE() 
		WHERE idParroquia=@pidParroquia

		SET @pResultado= 'Se editó correctamente la parroquia'
		set @pEstadoResultado   = 1
		COMMIT TRANSACTION;
	  END TRY 
	BEGIN CATCH
	  ROLLBACK TRANSACTION

	  INSERT INTO dbo.bitacoraError(fechaError,mensajeError,procedimientoError)values(getdate(),ERROR_MESSAGE(),' [dbo].[editarParroquia]')
	  SET @pResultado= 'Error al editar una parroquia'
	  set @pEstadoResultado   = 0

	  declare @error int,@message varchar(4000),@xstate int
	  select @error= ERROR_NUMBER() , @message=ERROR_MESSAGE(),@xstate=XACT_STATE()
	  raiserror ('modificarParroquia: %d %s',16,1,@error,@message)
	  
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[obtieneCatequistasSinGrupoAsignado]    Script Date: 8/16/2019 11:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[obtieneCatequistasSinGrupoAsignado]
	@pIdParroquia			int,
	@pIdGrupo				int
AS
BEGIN
  BEGIN TRY 
	
  select persona.idPersona, persona.nombre, persona.apellido1, persona.apellido2
		,persona.fechaNacimiento, persona.cedula, persona.sexo, persona.correo
		,persona.imgPerfil, persona.idRol, persona.motivo, persona.intereses
    from persona as persona
	inner join catequista catequista on (catequista.idPersona = persona.idPersona)
	where persona.activo = 'S' 
	  and catequista.idParroquia = @pIdParroquia
	  and not exists(select 1
					  from catequistaGrupo cg
					  where cg.idCatequista = catequista.idCatequista
					    and cg.idGrupo      = @pIdGrupo)
	

  END TRY

  BEGIN CATCH

	INSERT INTO dbo.bitacoraError(fechaError,mensajeError,procedimientoError)values(getdate(),ERROR_MESSAGE(),' [dbo].[obtieneCatequistasSinGrupoAsignado]')
	 
	  declare @error int,@message varchar(4000),@xstate int
	  select @error= ERROR_NUMBER() , @message=ERROR_MESSAGE(),@xstate=XACT_STATE()
	  raiserror ('obtieneCatequistasSinGrupoAsignado]: %d %s',16,1,@error,@message)
  END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[obtieneCatequistasXGrupo]    Script Date: 8/16/2019 11:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[obtieneCatequistasXGrupo]
	@pidGrupo			varchar(50)

AS
BEGIN
  BEGIN TRY 
	
  select  persona.idPersona, persona.nombre, persona.apellido1, persona.apellido2
		,persona.fechaNacimiento, persona.cedula, persona.sexo, persona.correo
		,persona.imgPerfil, persona.idRol, persona.motivo, persona.intereses
    from persona as persona
	inner join catequista catequista on (catequista.idPersona = persona.idPersona)
	inner join catequistaGrupo cg on (cg.idCatequista = catequista.idCatequista)
	where persona.activo = 'S'
	  and cg.idGrupo = @pidGrupo

  END TRY

  BEGIN CATCH

	INSERT INTO dbo.bitacoraError(fechaError,mensajeError,procedimientoError)values(getdate(),ERROR_MESSAGE(),' [dbo].[obtieneCatequistasXGrupo]')
	 
	  declare @error int,@message varchar(4000),@xstate int
	  select @error= ERROR_NUMBER() , @message=ERROR_MESSAGE(),@xstate=XACT_STATE()
	  raiserror ('obtieneCatequistasXGrupo: %d %s',16,1,@error,@message)
  END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[obtieneCatequizandosSinGrupoAsignado]    Script Date: 8/16/2019 11:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[obtieneCatequizandosSinGrupoAsignado]
	@pIdParroquia			int

AS
BEGIN
  BEGIN TRY 
	
  select  persona.idPersona, persona.nombre, persona.apellido1, persona.apellido2
		,persona.fechaNacimiento, persona.cedula, persona.sexo, persona.correo
		,persona.imgPerfil, persona.idRol, persona.motivo, persona.intereses
    from persona as persona
	inner join catequizando catequizando on (catequizando.idPersona = persona.idPersona)
	where persona.activo = 'S' and catequizando.idGrupo is null and catequizando.idParroquia=@pIdParroquia
	

  END TRY

  BEGIN CATCH

	INSERT INTO dbo.bitacoraError(fechaError,mensajeError,procedimientoError)values(getdate(),ERROR_MESSAGE(),' [dbo].[obtieneCatequizandosSinGrupoAsignado]')
	 
	  declare @error int,@message varchar(4000),@xstate int
	  select @error= ERROR_NUMBER() , @message=ERROR_MESSAGE(),@xstate=XACT_STATE()
	  raiserror ('obtieneCatequizandosSinGrupoAsignado]: %d %s',16,1,@error,@message)
  END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[obtieneCatequizandosXGrupo]    Script Date: 8/16/2019 11:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[obtieneCatequizandosXGrupo]
	@pidGrupo			varchar(50)

AS
BEGIN
  BEGIN TRY 
	
  select persona.idPersona, persona.nombre, persona.apellido1, persona.apellido2
		,persona.fechaNacimiento, persona.cedula, persona.sexo, persona.correo
		,persona.imgPerfil, persona.idRol, persona.motivo, persona.intereses
    from persona as persona
	inner join catequizando catequizando on (catequizando.idPersona = persona.idPersona)
	where persona.activo = 'S' and catequizando.idGrupo=@pidGrupo
	  

  END TRY

  BEGIN CATCH

	INSERT INTO dbo.bitacoraError(fechaError,mensajeError,procedimientoError)values(getdate(),ERROR_MESSAGE(),' [dbo].[obtieneCatequizandosXGrupo]')
	 
	  declare @error int,@message varchar(4000),@xstate int
	  select @error= ERROR_NUMBER() , @message=ERROR_MESSAGE(),@xstate=XACT_STATE()
	  raiserror ('obtieneCatequizandosXGrupo: %d %s',16,1,@error,@message)
  END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[obtieneGrupoPorCatequizando]    Script Date: 8/16/2019 11:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- Procedimientos
-- =======================================

CREATE PROCEDURE [dbo].[obtieneGrupoPorCatequizando] 
	@pUsuario			varchar(50)

AS
BEGIN
  BEGIN TRANSACTION
  BEGIN TRY 
	
	 declare @idGrupo int

	 select @idGrupo=idGrupo 
	  from catequizando
	  where idPersona=@pUsuario

	 select g.idGrupo,g.nombreGrupo,g.idParroquia 
	 from grupo g
	 where g.idGrupo=@idGrupo and g.activo='S'
		
	COMMIT TRANSACTION;

  END TRY

  BEGIN CATCH
    ROLLBACK TRANSACTION

  END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[obtieneGrupos]    Script Date: 8/16/2019 11:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- Procedimientos
-- =======================================

CREATE PROCEDURE [dbo].[obtieneGrupos] 
	@pUsuario			varchar(50)

AS
BEGIN
  BEGIN TRANSACTION
  BEGIN TRY 
	
	 declare @idCatequista int

	 select @idCatequista=idCatequista 
	  from catequista
	  where idPersona=@pUsuario

	  print @idCatequista

	 select g.idGrupo,g.nombreGrupo,g.idParroquia 
	 from grupo g
	 inner join catequistaGrupo cg on g.idGrupo=cg.idGrupo
	 where cg.idCatequista=@idCatequista and g.activo='S'
		
	COMMIT TRANSACTION;

  END TRY

  BEGIN CATCH
    ROLLBACK TRANSACTION

  END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[obtieneParroquiaCatequista]    Script Date: 8/16/2019 11:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- Procedimientos
-- =======================================

CREATE PROCEDURE [dbo].[obtieneParroquiaCatequista] 
	@pUsuario			varchar(50),
	@pParroquia			int output,
	@pResultado			varchar(max) OUTPUT,
	@pEstadoResultado	bit OUTPUT


AS
BEGIN
  BEGIN TRANSACTION
  BEGIN TRY 
	
	IF (SELECT COUNT(1) FROM catequista
		WHERE idPersona=@pUsuario) > 0 BEGIN


		SELECT @pResultado='Se obtuvo la parroquia con exito',@pEstadoResultado=1,@pParroquia=idParroquia
		FROM catequista
		WHERE idPersona=@pUsuario
	END
	ELSE BEGIN
		SELECT @pResultado='Error no se encontró la parroquia para el usuario'+ @pUsuario,@pEstadoResultado=0,@pParroquia=0
		
	END
		
	COMMIT TRANSACTION;

  END TRY

  BEGIN CATCH
    ROLLBACK TRANSACTION

	INSERT INTO dbo.bitacoraError(fechaError,mensajeError,procedimientoError)values(getdate(),ERROR_MESSAGE(),'[dbo].[obtieneParroquiaCatequista]')
    set @pResultado ='Error no se encontró la parroquia para el usuario:'+ @pUsuario
	set @pEstadoResultado = 0

	declare @error int,@message varchar(4000),@xstate int
	select @error= ERROR_NUMBER() , @message=ERROR_MESSAGE(),@xstate=XACT_STATE()
	raiserror ('login: %d %s',16,1,@error,@message)
  END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[obtieneRecursosSinAsignarXUnidad]    Script Date: 8/16/2019 11:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[obtieneRecursosSinAsignarXUnidad]
	@pIdUnidad			int
AS
BEGIN
  BEGIN TRY 
	
  select r.idRecurso, r.tipoRecurso, r.nombreRecurso, r.descripcionRecurso, r.formato
    from recursos r
	left join UnidadRecurso ur on (ur.idRecurso = r.idRecurso)
	where ur.idUnidad is null OR UR.idUnidad <> @pIdUnidad

  END TRY

  BEGIN CATCH

	INSERT INTO dbo.bitacoraError(fechaError,mensajeError,procedimientoError)values(getdate(),ERROR_MESSAGE(),' [dbo].[obtieneRecursosSinAsignarXUnidad]')
	 
	  declare @error int,@message varchar(4000),@xstate int
	  select @error= ERROR_NUMBER() , @message=ERROR_MESSAGE(),@xstate=XACT_STATE()
	  raiserror ('[obtieneRecursosSinAsignarXUnidad]: %d %s',16,1,@error,@message)
  END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[registroGrupo]    Script Date: 8/16/2019 11:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[registroGrupo] 
	-- Add the parameters for the stored procedure here
	@pNombreGrupo		 varchar(50),
	@pIdParroquia	     int, 
	@pIdPersona          int,
	@pResultado          varchar(max) OUTPUT,
	@pEstadoResultado	 bit OUTPUT

AS
BEGIN
	  BEGIN TRY

		DECLARE @result bit = 0
		SELECT @result = 1
		  FROM parroquia
		  WHERE idParroquia = @pIdParroquia

		IF(@result = 0) BEGIN
			SET @pResultado = 'La Parroquia no existe'
			SET @pEstadoResultado = 0
		END
		ELSE BEGIN
			BEGIN TRANSACTION
			INSERT INTO grupo(nombreGrupo ,activo, idParroquia)
				VALUES (@pNombreGrupo , 'S', @pIdParroquia)
		
			DECLARE @idGrupo INT 
			DECLARE @idCatequista INT

			SELECT @idGrupo = MAX(idGrupo) 
			  FROM grupo

			SELECT @idCatequista = idCatequista 
			  FROM catequista
			  WHERE idPersona = @pIdPersona

			INSERT INTO catequistaGrupo(idCatequista,idGrupo)
				VALUES(@idCatequista,@idGrupo)
		
			SET @pResultado        = 'El grupo se registró correctamente'
			SET @pEstadoResultado  = 1

			COMMIT TRANSACTION;
		END
	  END TRY 
	BEGIN CATCH
	  ROLLBACK TRANSACTION

	  INSERT INTO dbo.bitacoraError(fechaError,mensajeError,procedimientoError)
		VALUES(getdate(),ERROR_MESSAGE(),' [dbo].[registroGrupo]')
	  
	  SET @pResultado= 'Error al registrar el grupo'
	  SET @pEstadoResultado   = 0

	  DECLARE @error INT,@message VARCHAR(4000),@xstate INT
	  SELECT @error= ERROR_NUMBER() , @message=ERROR_MESSAGE(),@xstate=XACT_STATE()
	  RAISERROR ('registroGrupo: %d %s',16,1,@error,@message)
	  
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[registroISBN]    Script Date: 8/16/2019 11:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/***********************
**** Procedimientos ****
***********************/

-- Registro
create procedure [dbo].[registroISBN]
  @pCodigoISBN        varchar(30),
  @pResultado         varchar(max) output,
  @pEstadoresultado	  bit output
as
begin
  begin transaction
  begin try
    
	declare @result bit = 0
    select @result = 1
      from isbn
      where valor = @pCodigoISBN

    if @result = 0 begin
      insert into isbn(valor) values (@pCodigoISBN)
	  set @pEstadoResultado = 1
    end
    else begin
      set @pResultado ='Ya existe el código ISBN (' + @pCodigoISBN + ')'
      set @pEstadoResultado = 0
    end

	commit transaction
  end try

  begin catch
	rollback transaction

	insert into dbo.bitacoraerror(fechaerror,mensajeerror,procedimientoerror)values(getdate(),error_message(),' [dbo].[registroISBN]')
	set @pResultado= 'Error al registrar el ISBN'
	set @pEstadoResultado   = 0

	declare @error int,@message varchar(4000),@xstate int
	select @error= error_number() , @message=error_message(),@xstate=xact_state()
	raiserror ('registroISBN: %d %s',16,1,@error,@message)

  end catch

end
GO
/****** Object:  StoredProcedure [dbo].[registroParroquia]    Script Date: 8/16/2019 11:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[registroParroquia] 
	-- Add the parameters for the stored procedure here
	@pNombreParroquia	 varchar(50),
	@pIdDiocesis	     int, 
	@pResultado          varchar(max) OUTPUT,
	@pEstadoResultado	 bit OUTPUT

AS
BEGIN
	BEGIN TRANSACTION
	  BEGIN TRY
		
		IF (SELECT COUNT(1) 
			  FROM dbo.parroquia
			  WHERE nombreParroquia	= @pNombreParroquia
			    AND idDiocesis      = @pIdDiocesis
			) >= 1 BEGIN 

				SET @pResultado = 'Ya existe una parroquia con el mismo nombre'
				SET @pEstadoResultado   = 0
		END	
		ELSE BEGIN
			INSERT INTO parroquia(nombreParroquia,activo,idDiocesis)
			  VALUES( @pNombreParroquia,1,@pIdDiocesis)
			
			SET @pResultado= 'La parroquia se registró correctamente'
			SET @pEstadoResultado   = 1
		END
		COMMIT TRANSACTION;
	  END TRY 
	BEGIN CATCH
	  ROLLBACK TRANSACTION
	  
	  INSERT INTO dbo.bitacoraError(fechaError,mensajeError,procedimientoError)values(getdate(),ERROR_MESSAGE(),' [dbo].[registroParroquia]')
	  SET @pResultado= 'Error al registrar una parroquia'
	  SET @pEstadoResultado   = 0

	  DECLARE @error int,@message varchar(4000),@xstate int
	  SELECT @error= ERROR_NUMBER() , @message=ERROR_MESSAGE(),@xstate=XACT_STATE()
	  RAISERROR ('registroParroquia: %d %s',16,1,@error,@message)
	  
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[registroRecurso]    Script Date: 8/16/2019 11:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/***********************
**** Procedimientos ****
***********************/

-- Registro
CREATE procedure [dbo].[registroRecurso]
  @pTipoRecurso      varchar(50),
  @pNombreRecurso	 varchar(50),
  @pDescripcion		 varchar(50),
  @pFormato			 varchar(5),
  @pResultado        varchar(max) output,
  @pEstadoresultado	 bit output
as
begin
  begin transaction
  begin try
    
	declare @result bit = 1
   
	if not exists( select nombreRecurso
      from recursos
      where nombreRecurso = @pNombreRecurso) begin
      insert into recursos(tipoRecurso,nombreRecurso,descripcionRecurso, formato) values (@pTipoRecurso, @pNombreRecurso, @pDescripcion, @pFormato)
	  set @pResultado ='Se guardo con exito'
      set @pEstadoResultado = 1
    end
    else begin
      set @pResultado ='Error, ya existe un recurso con el mismo nombre:'+@pNombreRecurso
      set @pEstadoResultado = 0
    end

	commit transaction
  end try

  begin catch
	rollback transaction

	insert into dbo.bitacoraerror(fechaerror,mensajeerror,procedimientoerror)values(getdate(),error_message(),' [dbo].[registroRecurso]')
	set @pResultado= 'Error al registrar un recurso'
	set @pEstadoResultado   = 0

	declare @error int,@message varchar(4000),@xstate int
	select @error= error_number() , @message=error_message(),@xstate=xact_state()
	raiserror ('registroRecurso: %d %s',16,1,@error,@message)

  end catch

end
GO
/****** Object:  StoredProcedure [dbo].[registroUnidad]    Script Date: 8/16/2019 11:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/***********************
**** Procedimientos ****
***********************/

-- Registro
CREATE procedure [dbo].[registroUnidad]
  @pNombreUnidad      varchar(50),
  @pNumeroUnidad	  int,
  @pResultado         varchar(max) output,
  @pEstadoresultado	  bit output
as
begin
  begin transaction
  begin try
    
	declare @result bit = 0
    select @result = 1
      from Unidad
      where numeroUnidad = @pNumeroUnidad

	
	if @result = 0 begin
	  
      insert into Unidad(nombreUnidad,numeroUnidad,fechaCreacion) values (@pNombreUnidad,@pNumeroUnidad,GETDATE())
	  set @pEstadoResultado = 1
    end
    else begin
      set @pResultado ='Ya existe una unidad con el número:'+convert(varchar(max),@pNumeroUnidad)
      set @pEstadoResultado = 0
    end

	commit transaction
  end try

  begin catch
	rollback transaction

	insert into dbo.bitacoraerror(fechaerror,mensajeerror,procedimientoerror)values(getdate(),error_message(),' [dbo].[registroUnidad]')
	set @pResultado= 'Error al registrar una unidad'
	set @pEstadoResultado   = 0

	declare @error int,@message varchar(4000),@xstate int
	select @error= error_number() , @message=error_message(),@xstate=xact_state()
	raiserror ('registroUnidad: %d %s',16,1,@error,@message)

  end catch

end
GO
/****** Object:  StoredProcedure [dbo].[registroUsuario]    Script Date: 8/16/2019 11:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[registroUsuario] 
	@pNombre			varchar(50),
	@pApellidoUno	    varchar(50),
	@pApellidoDos		varchar(50),
	@pFechaNacimiento	datetime,
	@pCedula		    varchar(30),
	@pSexo		        varchar(1),
	@pContrasena        varchar(50),
	@pContrasena2		varchar(50),
	@pCorreo		    varchar(50),
	@pIdRol				smallint,
	@pIdParroquia       int,	 
	@pResultado         varchar(max) OUTPUT,
	@pEstadoResultado   bit OUTPUT

AS
BEGIN
	BEGIN TRANSACTION
	  BEGIN TRY
		
		IF (SELECT COUNT(1) 
				  FROM dbo.persona
				  WHERE cedula = @pCedula
		    ) >= 1 BEGIN 

				SET @pResultado= 'Ya existe una persona registrada con la misma cédula'
				set @pEstadoResultado   = 0
		END	
		ELSE BEGIN
			IF @pContrasena <> @pContrasena2 BEGIN 

				SET @pResultado= 'Las contraseñas son diferentes'
				set @pEstadoResultado   = 0

			END
			ELSE BEGIN
				IF (SELECT COUNT(1) 
					  FROM dbo.persona
					  WHERE correo = @pCorreo
					) >= 1 BEGIN 

					SET @pResultado= 'Ya existe una persona registrada con el mismo correo'
					set @pEstadoResultado   = 0
				END	

				ELSE BEGIN
					
					INSERT INTO DBO.persona(nombre,apellido1,apellido2,fechaNacimiento,cedula,sexo,contrasena,correo,idRol,imgPerfil)
						VALUES (@pNombre,@pApellidoUno,@pApellidoDos,@pFechaNacimiento,@pCedula,@pSexo,@pContrasena,@pCorreo,@pIdRol,'')
					
					declare @vIdPersona INT
					SET @vIdPersona = (SELECT idPersona 
										 FROM dbo.persona
										 WHERE correo = @pCorreo)
					IF @pIdRol = 1
						INSERT INTO dbo.catequizando(idPersona,idParroquia) values(@vIdPersona,@pIdParroquia)
					ELSE IF @pIdRol = 2
						INSERT INTO dbo.catequista(idPersona,idParroquia) values(@vIdPersona,@pIdParroquia)
						SET @pResultado= 'El usuario fue ingresado correctamente'
						set @pEstadoResultado   = 1
					END
				
				END

			END
			COMMIT TRANSACTION;
	  END TRY 
	BEGIN CATCH
	  ROLLBACK TRANSACTION

	  INSERT INTO dbo.bitacoraError(fechaError,mensajeError,procedimientoError)values(getdate(),ERROR_MESSAGE(),' [dbo].[registroUsuario]')
	  SET @pResultado= 'Error al insertar el usuario'
	  set @pEstadoResultado   = 0

	  declare @error int,@message varchar(4000),@xstate int
	  select @error= ERROR_NUMBER() , @message=ERROR_MESSAGE(),@xstate=XACT_STATE()
	  raiserror ('registroUsuario: %d %s',16,1,@error,@message)
	  
	END CATCH
END
GO
/****** Object:  StoredProcedure [juego].[actualizaAvanceJuego]    Script Date: 8/16/2019 11:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [juego].[actualizaAvanceJuego]
	@idUsuario int ,
	@idJuego int,
	@terminado bit ,
	@avance int,
	@pEstadoResultado	 bit OUTPUT
AS
BEGIN
	BEGIN TRY  
	update juego.[estadoDeLosJuegos] set avance=@avance,terminado=@terminado 
	where idUsuario=@idUsuario and idJuego=@idJuego
	set @pEstadoResultado=1
	END TRY 
	BEGIN CATCH
	  set @pEstadoResultado=0
	  INSERT INTO dbo.bitacoraError(fechaError,mensajeError,procedimientoError)values(getdate(),ERROR_MESSAGE(),' [juego].[actualizaAvanceJuego]')
	  declare @error int,@message varchar(4000),@xstate int
	  select @error= ERROR_NUMBER() , @message=ERROR_MESSAGE(),@xstate=XACT_STATE()
	  raiserror ('actualizaAvanceJuego]: %d %s',16,1,@error,@message)
	END CATCH 
END
GO
/****** Object:  StoredProcedure [juego].[actualizaObjetos]    Script Date: 8/16/2019 11:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [juego].[actualizaObjetos] 
	@idObjeto  int,
	@idPersona int,
	@pEstadoResultado	 bit OUTPUT
AS
BEGIN
	BEGIN TRY  
	update juego.objetosPersona set activo=0
	where idObjeto=@idObjeto and idUsuario=@idPersona
	set @pEstadoResultado=1
	END TRY 
	BEGIN CATCH
		
	  set @pEstadoResultado=1
	  INSERT INTO dbo.bitacoraError(fechaError,mensajeError,procedimientoError)values(getdate(),ERROR_MESSAGE(),' [juego.actualizaObjetos]')
	  declare @error int,@message varchar(4000),@xstate int
	  select @error= ERROR_NUMBER() , @message=ERROR_MESSAGE(),@xstate=XACT_STATE()
	  raiserror ('actualizaObjetos ]: %d %s',16,1,@error,@message)
	END CATCH 
END
GO
/****** Object:  StoredProcedure [juego].[asignaAvatar]    Script Date: 8/16/2019 11:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================

-- =============================================
CREATE PROCEDURE [juego].[asignaAvatar] 
	@idUusario int,
	@tipoAvatar int,
	@tipoTraje varchar(50),
	@sexo varchar(1),
	@pEstadoResultado	 bit OUTPUT
AS
BEGIN
	BEGIN TRY  
		
		
		DECLARE  @idAvatar INT  
		SELECT  @idAvatar=idAvatar 
		  FROM  juego.avatar
		  WHERE idUsuario=@idUusario

		IF @idAvatar is null BEGIN 
			INSERT INTO juego.avatar (tipoAvatar,tipoTraje,sexo,idUsuario)
			VALUES (@tipoAvatar,@tipoTraje,@sexo,@idUusario)

			
	  
		END 
		ELSE BEGIN 
			UPDATE juego.avatar SET tipoAvatar=@tipoAvatar , tipoTraje=@tipoTraje, sexo=@sexo
			WHERE idUsuario=@idUusario

		
		END 

		  set @pEstadoResultado   = 1

	END TRY  
	BEGIN CATCH  
		
	INSERT INTO dbo.bitacoraError(fechaError,mensajeError,procedimientoError)values(getdate(),ERROR_MESSAGE(),' [juego].[[asignaAvatar]]')

	  
	  set @pEstadoResultado   = 0

	  declare @error int,@message varchar(4000),@xstate int
	  select @error= ERROR_NUMBER() , @message=ERROR_MESSAGE(),@xstate=XACT_STATE()
	  raiserror ('[asignaAvatar]]: %d %s',16,1,@error,@message)
	END CATCH  

END
GO
/****** Object:  StoredProcedure [juego].[obtieneEstadoJuego]    Script Date: 8/16/2019 11:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================

-- =============================================
CREATE PROCEDURE [juego].[obtieneEstadoJuego] 
	@idUusario int 
AS
BEGIN
	BEGIN TRY  
		declare @idGrupo int 
		select @idGrupo=idGrupo from catequizando

		SELECT jj.idJuego ,jj.idUnidad unidad ,jj.etiqueta,jg.activo,je.avance,je.terminado
		  FROM juego.juego jj INNER JOIN juego.grupoJuego  jg on jj.idJuego=jg.idJuego and jg.idGrupo=@idGrupo
							  INNER JOIN juego.estadoDeLosJuegos je on jg.idJuego= je.idJuego
	END TRY  
	BEGIN CATCH  
		
	INSERT INTO dbo.bitacoraError(fechaError,mensajeError,procedimientoError)values(getdate(),ERROR_MESSAGE(),' [juego].[obtieneEstadoJuego]')
	 
	  declare @error int,@message varchar(4000),@xstate int
	  select @error= ERROR_NUMBER() , @message=ERROR_MESSAGE(),@xstate=XACT_STATE()
	  raiserror ('obtieneEstadoJuego]: %d %s',16,1,@error,@message)
	END CATCH  

END
GO
/****** Object:  StoredProcedure [juego].[obtieneObjetos]    Script Date: 8/16/2019 11:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================

-- =============================================
CREATE PROCEDURE [juego].[obtieneObjetos] 
	@idUsuario int 
AS
BEGIN
	BEGIN TRY  

		
		SELECT idObjeto,idUsuario ,activo
		  FROM  juego.objetosJuego
		  WHERE idUsuario=@idUsuario

	END TRY  
	BEGIN CATCH  
		
	INSERT INTO dbo.bitacoraError(fechaError,mensajeError,procedimientoError)values(getdate(),ERROR_MESSAGE(),' [juego].[obtieneObjetos] ')
	 
	  declare @error int,@message varchar(4000),@xstate int
	  select @error= ERROR_NUMBER() , @message=ERROR_MESSAGE(),@xstate=XACT_STATE()
	  raiserror ('[juego].[obtieneObjetos] : %d %s',16,1,@error,@message)
	END CATCH  

END
GO
/****** Object:  Trigger [dbo].[asignaUnidadesAGrupos]    Script Date: 8/16/2019 11:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create TRIGGER [dbo].[asignaUnidadesAGrupos]
ON  [dbo].[grupo]
AFTER INSERT AS
BEGIN
 DECLARE @idGrupo INTEGER

 SELECT @idGrupo=MAX(idGrupo) 
   FROM grupo

 INSERT INTO grupoUnidad 
 (idGrupo,
 idUnidad,
 activo)
 SELECT @idGrupo,idUnidad,0 
   FROM unidad

END
GO
ALTER TABLE [dbo].[grupo] ENABLE TRIGGER [asignaUnidadesAGrupos]
GO
/****** Object:  Trigger [dbo].[asignaObjetosUsuario]    Script Date: 8/16/2019 11:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create TRIGGER [dbo].[asignaObjetosUsuario]
ON  [dbo].[persona]
AFTER INSERT AS
BEGIN
 DECLARE @idPersona INTEGER

 SELECT @idPersona=MAX(idPersona) 
   FROM persona

 INSERT INTO juego.objetosJuego 
 (idObjeto,
 idUsuario,
 activo)
 SELECT idObjeto,@idPersona,1
   FROM juego.objetos

END
GO
ALTER TABLE [dbo].[persona] ENABLE TRIGGER [asignaObjetosUsuario]
GO
/****** Object:  Trigger [dbo].[asigaGruposAUnidades]    Script Date: 8/16/2019 11:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[asigaGruposAUnidades]
ON  [dbo].[unidad]
AFTER INSERT AS
BEGIN
 DECLARE @idUnidad    INTEGER
 DECLARE @idGrupoTemp INTEGER

 SELECT @idUnidad=MAX(idUnidad) 
   FROM unidad

 INSERT INTO grupoUnidad (
 idGrupo,idUnidad,activo
 )
 SELECT idGrupo,@idUnidad,0 
   FROM grupo

END
GO
ALTER TABLE [dbo].[unidad] ENABLE TRIGGER [asigaGruposAUnidades]
GO
USE [master]
GO
ALTER DATABASE [dbCONFE] SET  READ_WRITE 
GO
