USE [master]
GO
/****** Object:  Database [GYMNoPainNoGain]    Script Date: 5/3/2021 12:05:34 PM ******/
CREATE DATABASE [GYMNoPainNoGain]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GYMNoPainNoGain', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\GYMNoPainNoGain.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GYMNoPainNoGain_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\GYMNoPainNoGain_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GYMNoPainNoGain] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GYMNoPainNoGain].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GYMNoPainNoGain] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GYMNoPainNoGain] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GYMNoPainNoGain] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GYMNoPainNoGain] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GYMNoPainNoGain] SET ARITHABORT OFF 
GO
ALTER DATABASE [GYMNoPainNoGain] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GYMNoPainNoGain] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GYMNoPainNoGain] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GYMNoPainNoGain] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GYMNoPainNoGain] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GYMNoPainNoGain] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GYMNoPainNoGain] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GYMNoPainNoGain] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GYMNoPainNoGain] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GYMNoPainNoGain] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GYMNoPainNoGain] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GYMNoPainNoGain] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GYMNoPainNoGain] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GYMNoPainNoGain] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GYMNoPainNoGain] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GYMNoPainNoGain] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GYMNoPainNoGain] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GYMNoPainNoGain] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GYMNoPainNoGain] SET  MULTI_USER 
GO
ALTER DATABASE [GYMNoPainNoGain] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GYMNoPainNoGain] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GYMNoPainNoGain] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GYMNoPainNoGain] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GYMNoPainNoGain] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GYMNoPainNoGain] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [GYMNoPainNoGain] SET QUERY_STORE = OFF
GO
USE [GYMNoPainNoGain]
GO
/****** Object:  User [admin]    Script Date: 5/3/2021 12:05:34 PM ******/
CREATE USER [admin] FOR LOGIN [admin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [admin]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 5/3/2021 12:05:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[City] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 5/3/2021 12:05:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Genre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 5/3/2021 12:05:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sites]    Script Date: 5/3/2021 12:05:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sites](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[IdCity] [int] NOT NULL,
 CONSTRAINT [PK_Sites] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/3/2021 12:05:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[IdRol] [tinyint] NOT NULL,
	[IdSite] [int] NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[IdGenre] [tinyint] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([Id], [City]) VALUES (1, N'Bogota')
INSERT [dbo].[Cities] ([Id], [City]) VALUES (2, N'Manizales')
SET IDENTITY_INSERT [dbo].[Cities] OFF
GO
SET IDENTITY_INSERT [dbo].[Genres] ON 

INSERT [dbo].[Genres] ([Id], [Genre]) VALUES (1, N'Masculino')
SET IDENTITY_INSERT [dbo].[Genres] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Name]) VALUES (1, N'Funcionario')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (2, N'Usuario')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Sites] ON 

INSERT [dbo].[Sites] ([Id], [Name], [Address], [IdCity]) VALUES (1, N'La castilla', N'Carrera 13k sur # 25 - 98d', 1)
INSERT [dbo].[Sites] ([Id], [Name], [Address], [IdCity]) VALUES (2, N'La avenida', N'Carrera 14 b sur # 15 - 15', 1)
INSERT [dbo].[Sites] ([Id], [Name], [Address], [IdCity]) VALUES (3, N'La avenids', N'Carrera 14 b sur # 15 - 15', 1)
INSERT [dbo].[Sites] ([Id], [Name], [Address], [IdCity]) VALUES (4, N'La avenidsa', N'Carrera 14 b sur # 15 - 15', 2)
INSERT [dbo].[Sites] ([Id], [Name], [Address], [IdCity]) VALUES (7, N'La avenidscva', N'Carrera 14 b sur # 15 - 15', 1)
SET IDENTITY_INSERT [dbo].[Sites] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [IdRol], [IdSite], [Email], [Password], [IdGenre]) VALUES (2, N'Andres', N'Gutierrez', 1, 1, N'abc123@hotmail.com', N'123', 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [IdRol], [IdSite], [Email], [Password], [IdGenre]) VALUES (6, N'Camilo', N'Rey', 2, 1, N'abc@hotmail.com', N'123', 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [IdRol], [IdSite], [Email], [Password], [IdGenre]) VALUES (7, N'Camilo', N'Rey', 2, 1, N'abcd@hotmail.com', N'123', 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [IdRol], [IdSite], [Email], [Password], [IdGenre]) VALUES (8, N'Camilo', N'Rey', 2, 2, N'abcda@hotmail.com', N'123', 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [IdRol], [IdSite], [Email], [Password], [IdGenre]) VALUES (9, N'Camilo', N'Rey', 2, 2, N'123@hotmail.com', N'123', 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [IdRol], [IdSite], [Email], [Password], [IdGenre]) VALUES (10, N'Camilo', N'Rey', 2, 2, N'123d@hotmail.com', N'123', 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [IdRol], [IdSite], [Email], [Password], [IdGenre]) VALUES (11, N'Camilo', N'Rey', 2, 2, N'123sd@hotmail.com', N'123', 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [IdRol], [IdSite], [Email], [Password], [IdGenre]) VALUES (12, N'Camilo', N'Rey', 2, 2, N'12d3sd@hotmail.com', N'123', 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [IdRol], [IdSite], [Email], [Password], [IdGenre]) VALUES (13, N'Camiloa', N'Rey', 2, 2, N'12d3ssd@hotmail.com', N'123', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Sites]  WITH CHECK ADD  CONSTRAINT [FK_Sites_Cities] FOREIGN KEY([IdCity])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Sites] CHECK CONSTRAINT [FK_Sites_Cities]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Genres] FOREIGN KEY([IdGenre])
REFERENCES [dbo].[Genres] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Genres]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([IdRol])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Sites] FOREIGN KEY([IdSite])
REFERENCES [dbo].[Sites] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Sites]
GO
USE [master]
GO
ALTER DATABASE [GYMNoPainNoGain] SET  READ_WRITE 
GO
