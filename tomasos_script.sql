USE [master]
GO
/****** Object:  Database [Tomasos]    Script Date: 5/5/2021 4:00:42 PM ******/
CREATE DATABASE [Tomasos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tomasos', FILENAME = N'D:\SQL\MSSQL15.MSSQLSERVER\MSSQL\DATA\Tomasos.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Tomasos_log', FILENAME = N'D:\SQL\MSSQL15.MSSQLSERVER\MSSQL\DATA\Tomasos_log.ldf' , SIZE = 5184KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Tomasos] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tomasos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tomasos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tomasos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tomasos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tomasos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tomasos] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tomasos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Tomasos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tomasos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tomasos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tomasos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tomasos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tomasos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tomasos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tomasos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tomasos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Tomasos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tomasos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tomasos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tomasos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tomasos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tomasos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tomasos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tomasos] SET RECOVERY FULL 
GO
ALTER DATABASE [Tomasos] SET  MULTI_USER 
GO
ALTER DATABASE [Tomasos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tomasos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tomasos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tomasos] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Tomasos] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Tomasos] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Tomasos', N'ON'
GO
ALTER DATABASE [Tomasos] SET QUERY_STORE = OFF
GO
USE [Tomasos]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/5/2021 4:00:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 5/5/2021 4:00:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/5/2021 4:00:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/5/2021 4:00:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/5/2021 4:00:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/5/2021 4:00:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/5/2021 4:00:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[Gatuadress] [varchar](50) NULL,
	[Namn] [varchar](100) NULL,
	[Postnr] [varchar](20) NULL,
	[Postort] [varchar](100) NULL,
	[Points] [int] NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 5/5/2021 4:00:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bestallning]    Script Date: 5/5/2021 4:00:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bestallning](
	[BestallningID] [int] IDENTITY(1,1) NOT NULL,
	[BestallningDatum] [datetime] NOT NULL,
	[Totalbelopp] [int] NOT NULL,
	[Levererad] [bit] NOT NULL,
	[Id] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Bestallning] PRIMARY KEY CLUSTERED 
(
	[BestallningID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BestallningMatratt]    Script Date: 5/5/2021 4:00:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BestallningMatratt](
	[MatrattID] [int] NOT NULL,
	[BestallningID] [int] NOT NULL,
	[Antal] [int] NOT NULL,
 CONSTRAINT [PK_BestallningMatratt] PRIMARY KEY CLUSTERED 
(
	[MatrattID] ASC,
	[BestallningID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Matratt]    Script Date: 5/5/2021 4:00:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matratt](
	[MatrattID] [int] IDENTITY(1,1) NOT NULL,
	[MatrattNamn] [varchar](50) NOT NULL,
	[Beskrivning] [varchar](200) NULL,
	[Pris] [int] NOT NULL,
	[MatrattTypID] [int] NOT NULL,
 CONSTRAINT [PK_Matratt] PRIMARY KEY CLUSTERED 
(
	[MatrattID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MatrattProdukt]    Script Date: 5/5/2021 4:00:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatrattProdukt](
	[MatrattID] [int] NOT NULL,
	[ProduktID] [int] NOT NULL,
 CONSTRAINT [PK_MatrattProdukt] PRIMARY KEY CLUSTERED 
(
	[MatrattID] ASC,
	[ProduktID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MatrattTyp]    Script Date: 5/5/2021 4:00:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatrattTyp](
	[MatrattTypID] [int] IDENTITY(1,1) NOT NULL,
	[Beskrivning] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MatrattTyp] PRIMARY KEY CLUSTERED 
(
	[MatrattTypID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produkt]    Script Date: 5/5/2021 4:00:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produkt](
	[ProduktID] [int] IDENTITY(1,1) NOT NULL,
	[ProduktNamn] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Produkt] PRIMARY KEY CLUSTERED 
(
	[ProduktID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210127084330_AwesomeName', N'5.0.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210127225853_TomasosMigration', N'5.0.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210201110101_PointsMigration', N'5.0.2')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'04f5bc06-4b33-42d8-a190-51249ff4a529', N'PremiumUser', N'PREMIUMUSER', N'dac9039e-9c95-478b-b53e-62cf6beb6475')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'71a83ef0-5476-4518-a1d5-af04816fbcf0', N'RegularUser', N'REGULARUSER', N'a128b9ab-478a-4007-82c3-342d965c12a4')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'87ec3877-ac9b-402c-a8e4-d50235124d1e', N'Admin', N'ADMIN', N'e9f776b3-16a2-4d87-9643-9df23ee3a45e')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'18fc0a60-f9d2-4dc8-beae-f1d15f802edc', N'04f5bc06-4b33-42d8-a190-51249ff4a529')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7090ed9f-aaab-4532-9ab8-70e58cf5591c', N'04f5bc06-4b33-42d8-a190-51249ff4a529')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2413b439-6efc-4d35-9894-887bd86a213f', N'71a83ef0-5476-4518-a1d5-af04816fbcf0')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b62290d3-a139-4f2e-8e23-ef941ce509d4', N'71a83ef0-5476-4518-a1d5-af04816fbcf0')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e5c77529-f83a-466b-af5f-7480606bed8e', N'71a83ef0-5476-4518-a1d5-af04816fbcf0')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'fb2bb105-fda3-430e-ba1d-4ab3a5180000', N'87ec3877-ac9b-402c-a8e4-d50235124d1e')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Gatuadress], [Namn], [Postnr], [Postort], [Points]) VALUES (N'18fc0a60-f9d2-4dc8-beae-f1d15f802edc', N'premium', N'PREMIUM', N'premium@premium.se', N'PREMIUM@PREMIUM.SE', 0, N'AQAAAAEAACcQAAAAEOtHiHjXwuqVYnwrOV/tto3FFdS/EzFX/0hb7se48kv+qANuHkG8uorCGPdl2nfqqg==', N'7VJMR25LEFWOK24UQQCAF4FNOD4RNXXO', N'a21563b8-5e9d-4f04-9ad7-fb9e41d685aa', N'0784146589', 0, 0, NULL, 1, 0, N'premiumgatan 2', N'Premium', N'43265', N'Knivsta', 130)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Gatuadress], [Namn], [Postnr], [Postort], [Points]) VALUES (N'2413b439-6efc-4d35-9894-887bd86a213f', N'linus', N'LINUS', N'linus@gmail.com', N'LINUS@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEPmHqzEUvecaFdQShIOuSBwJ1DTSum3PgzCeF/ESZ6dXclAqfYMa4jCBlylKos3saA==', N'6NZ5ABNOMNOHBZZG3YJDGZCAYPGAE4II', N'de5ee2b5-5443-458a-9b64-5f1d82ce2442', N'0761706900', 0, 0, NULL, 1, 0, N'Villebrådsgatan 7a', N'Linus', N'74145', N'Knivsta', 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Gatuadress], [Namn], [Postnr], [Postort], [Points]) VALUES (N'7090ed9f-aaab-4532-9ab8-70e58cf5591c', N'fredrik', N'FREDRIK', N'fredrik@gmail.com', N'FREDRIK@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEBbWFOaTi/6CF0XA8RP4SWYWBmxCLmGCYScfiNxjDMuu26zeyKY5LTE57aNPCO1smg==', N'BYEQKESYVWXLD2RSXSENJO5Q2H4EQ5BS', N'cafd98f1-6ce3-4c10-8ea4-755e3a400953', N'07879651498', 0, 0, NULL, 1, 0, N'asd', N'asd', N'0456546', N'stockholm', 20)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Gatuadress], [Namn], [Postnr], [Postort], [Points]) VALUES (N'b62290d3-a139-4f2e-8e23-ef941ce509d4', N'regular', N'REGULAR', N'regular@regular.se', N'REGULAR@REGULAR.SE', 0, N'AQAAAAEAACcQAAAAEJPQSX7Lm1NXsdo3QdCBp1bikm+ws/vuyOsUronlL5/PUGKuxTiqAvF29tm/HWfTUQ==', N'432HKH2XL2XO6O6ZN7YUS5VK6GAE3U76', N'2968761c-1eb6-4da5-969e-9b0ce8694a98', N'0769584896', 0, 0, NULL, 1, 0, N'Långvägen 2', N'Regular', N'84567', N'Uppsala', 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Gatuadress], [Namn], [Postnr], [Postort], [Points]) VALUES (N'e5c77529-f83a-466b-af5f-7480606bed8e', N'jimmy', N'JIMMY', N'jimmy@gmail.com', N'JIMMY@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEAi+9uvccGdRJbNKIfCC8YnzQa25lIf0BJn+sb31ZmBwyT2zhq3XYmJeMbsBAZ25mA==', N'BNU5G7V42X5YEWCOHRQWCWQAHJVYXVAU', N'09e44afa-11c8-4e25-be6e-5b9f639eefa0', N'0785858585', 0, 0, NULL, 1, 0, N'asd', N'asd', N'456895', N'asd', 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Gatuadress], [Namn], [Postnr], [Postort], [Points]) VALUES (N'fb2bb105-fda3-430e-ba1d-4ab3a5180000', N'admin', N'ADMIN', N'admin@admin.se', N'ADMIN@ADMIN.SE', 0, N'AQAAAAEAACcQAAAAEFyhYjy8BmN67gCybIj/jqPS11UKNzp7iA0KtRhktUNyk+T5Tzz1ZcIIZw/Wuo+erQ==', N'PNUJ3JLC2TM2TVEVSVVC6ZYTGAXWHF47', N'bfb7ab9d-61e3-4ede-ac15-33453a0daf83', N'0761706900', 0, 0, NULL, 1, 0, N'Villebrådsgatan 7a', N'Admin', N'74145', N'Knivsta', 0)
GO
SET IDENTITY_INSERT [dbo].[Bestallning] ON 

INSERT [dbo].[Bestallning] ([BestallningID], [BestallningDatum], [Totalbelopp], [Levererad], [Id]) VALUES (24, CAST(N'2021-02-10T23:01:05.530' AS DateTime), 185, 0, N'b62290d3-a139-4f2e-8e23-ef941ce509d4')
INSERT [dbo].[Bestallning] ([BestallningID], [BestallningDatum], [Totalbelopp], [Levererad], [Id]) VALUES (26, CAST(N'2021-02-11T00:49:51.060' AS DateTime), 828, 0, N'18fc0a60-f9d2-4dc8-beae-f1d15f802edc')
INSERT [dbo].[Bestallning] ([BestallningID], [BestallningDatum], [Totalbelopp], [Levererad], [Id]) VALUES (27, CAST(N'2021-02-11T00:52:22.043' AS DateTime), 196, 0, N'18fc0a60-f9d2-4dc8-beae-f1d15f802edc')
INSERT [dbo].[Bestallning] ([BestallningID], [BestallningDatum], [Totalbelopp], [Levererad], [Id]) VALUES (30, CAST(N'2021-02-11T01:10:11.433' AS DateTime), 504, 0, N'18fc0a60-f9d2-4dc8-beae-f1d15f802edc')
INSERT [dbo].[Bestallning] ([BestallningID], [BestallningDatum], [Totalbelopp], [Levererad], [Id]) VALUES (31, CAST(N'2021-02-11T14:15:47.920' AS DateTime), 90, 0, N'b62290d3-a139-4f2e-8e23-ef941ce509d4')
INSERT [dbo].[Bestallning] ([BestallningID], [BestallningDatum], [Totalbelopp], [Levererad], [Id]) VALUES (32, CAST(N'2021-02-14T15:26:38.757' AS DateTime), 220, 1, N'e5c77529-f83a-466b-af5f-7480606bed8e')
INSERT [dbo].[Bestallning] ([BestallningID], [BestallningDatum], [Totalbelopp], [Levererad], [Id]) VALUES (33, CAST(N'2021-02-14T15:35:03.147' AS DateTime), 95, 1, N'18fc0a60-f9d2-4dc8-beae-f1d15f802edc')
INSERT [dbo].[Bestallning] ([BestallningID], [BestallningDatum], [Totalbelopp], [Levererad], [Id]) VALUES (34, CAST(N'2021-02-15T08:51:10.607' AS DateTime), 70, 0, N'b62290d3-a139-4f2e-8e23-ef941ce509d4')
INSERT [dbo].[Bestallning] ([BestallningID], [BestallningDatum], [Totalbelopp], [Levererad], [Id]) VALUES (35, CAST(N'2021-02-15T09:19:21.363' AS DateTime), 225, 1, N'7090ed9f-aaab-4532-9ab8-70e58cf5591c')
INSERT [dbo].[Bestallning] ([BestallningID], [BestallningDatum], [Totalbelopp], [Levererad], [Id]) VALUES (36, CAST(N'2021-02-15T09:22:08.763' AS DateTime), 192, 1, N'7090ed9f-aaab-4532-9ab8-70e58cf5591c')
INSERT [dbo].[Bestallning] ([BestallningID], [BestallningDatum], [Totalbelopp], [Levererad], [Id]) VALUES (37, CAST(N'2021-02-15T09:22:50.187' AS DateTime), 392, 0, N'7090ed9f-aaab-4532-9ab8-70e58cf5591c')
INSERT [dbo].[Bestallning] ([BestallningID], [BestallningDatum], [Totalbelopp], [Levererad], [Id]) VALUES (38, CAST(N'2021-02-15T09:23:35.257' AS DateTime), 95, 1, N'7090ed9f-aaab-4532-9ab8-70e58cf5591c')
INSERT [dbo].[Bestallning] ([BestallningID], [BestallningDatum], [Totalbelopp], [Levererad], [Id]) VALUES (39, CAST(N'2021-02-15T10:07:28.083' AS DateTime), 620, 0, N'18fc0a60-f9d2-4dc8-beae-f1d15f802edc')
SET IDENTITY_INSERT [dbo].[Bestallning] OFF
GO
INSERT [dbo].[BestallningMatratt] ([MatrattID], [BestallningID], [Antal]) VALUES (1, 24, 1)
INSERT [dbo].[BestallningMatratt] ([MatrattID], [BestallningID], [Antal]) VALUES (1, 30, 7)
INSERT [dbo].[BestallningMatratt] ([MatrattID], [BestallningID], [Antal]) VALUES (1, 31, 1)
INSERT [dbo].[BestallningMatratt] ([MatrattID], [BestallningID], [Antal]) VALUES (1, 32, 1)
INSERT [dbo].[BestallningMatratt] ([MatrattID], [BestallningID], [Antal]) VALUES (1, 33, 1)
INSERT [dbo].[BestallningMatratt] ([MatrattID], [BestallningID], [Antal]) VALUES (1, 34, 1)
INSERT [dbo].[BestallningMatratt] ([MatrattID], [BestallningID], [Antal]) VALUES (1, 35, 2)
INSERT [dbo].[BestallningMatratt] ([MatrattID], [BestallningID], [Antal]) VALUES (1, 36, 1)
INSERT [dbo].[BestallningMatratt] ([MatrattID], [BestallningID], [Antal]) VALUES (1, 37, 7)
INSERT [dbo].[BestallningMatratt] ([MatrattID], [BestallningID], [Antal]) VALUES (1, 38, 1)
INSERT [dbo].[BestallningMatratt] ([MatrattID], [BestallningID], [Antal]) VALUES (1, 39, 7)
INSERT [dbo].[BestallningMatratt] ([MatrattID], [BestallningID], [Antal]) VALUES (103, 24, 1)
INSERT [dbo].[BestallningMatratt] ([MatrattID], [BestallningID], [Antal]) VALUES (103, 33, 1)
INSERT [dbo].[BestallningMatratt] ([MatrattID], [BestallningID], [Antal]) VALUES (103, 36, 1)
INSERT [dbo].[BestallningMatratt] ([MatrattID], [BestallningID], [Antal]) VALUES (103, 38, 1)
INSERT [dbo].[BestallningMatratt] ([MatrattID], [BestallningID], [Antal]) VALUES (103, 39, 3)
INSERT [dbo].[BestallningMatratt] ([MatrattID], [BestallningID], [Antal]) VALUES (104, 32, 2)
INSERT [dbo].[BestallningMatratt] ([MatrattID], [BestallningID], [Antal]) VALUES (104, 36, 1)
INSERT [dbo].[BestallningMatratt] ([MatrattID], [BestallningID], [Antal]) VALUES (105, 35, 1)
GO
SET IDENTITY_INSERT [dbo].[Matratt] ON 

INSERT [dbo].[Matratt] ([MatrattID], [MatrattNamn], [Beskrivning], [Pris], [MatrattTypID]) VALUES (1, N'Calzone', N'Inbakad pizza', 70, 1)
INSERT [dbo].[Matratt] ([MatrattID], [MatrattNamn], [Beskrivning], [Pris], [MatrattTypID]) VALUES (103, N'Tonfisksallad', N'mums', 95, 3)
INSERT [dbo].[Matratt] ([MatrattID], [MatrattNamn], [Beskrivning], [Pris], [MatrattTypID]) VALUES (104, N'Ost & skink sallad', N'fräsch', 75, 3)
INSERT [dbo].[Matratt] ([MatrattID], [MatrattNamn], [Beskrivning], [Pris], [MatrattTypID]) VALUES (105, N'Carbonara', N'god pasta', 85, 2)
INSERT [dbo].[Matratt] ([MatrattID], [MatrattNamn], [Beskrivning], [Pris], [MatrattTypID]) VALUES (106, N'Vesuvio', N'klassisk', 60, 1)
INSERT [dbo].[Matratt] ([MatrattID], [MatrattNamn], [Beskrivning], [Pris], [MatrattTypID]) VALUES (107, N'Köttfärssås', N'mycket god', 85, 3)
INSERT [dbo].[Matratt] ([MatrattID], [MatrattNamn], [Beskrivning], [Pris], [MatrattTypID]) VALUES (108, N'Kebabpizza', N'god kebabpizza', 85, 1)
SET IDENTITY_INSERT [dbo].[Matratt] OFF
GO
INSERT [dbo].[MatrattProdukt] ([MatrattID], [ProduktID]) VALUES (1, 1)
INSERT [dbo].[MatrattProdukt] ([MatrattID], [ProduktID]) VALUES (1, 2)
INSERT [dbo].[MatrattProdukt] ([MatrattID], [ProduktID]) VALUES (103, 7)
INSERT [dbo].[MatrattProdukt] ([MatrattID], [ProduktID]) VALUES (104, 1)
INSERT [dbo].[MatrattProdukt] ([MatrattID], [ProduktID]) VALUES (104, 2)
INSERT [dbo].[MatrattProdukt] ([MatrattID], [ProduktID]) VALUES (104, 4)
INSERT [dbo].[MatrattProdukt] ([MatrattID], [ProduktID]) VALUES (105, 1)
INSERT [dbo].[MatrattProdukt] ([MatrattID], [ProduktID]) VALUES (105, 4)
INSERT [dbo].[MatrattProdukt] ([MatrattID], [ProduktID]) VALUES (105, 6)
INSERT [dbo].[MatrattProdukt] ([MatrattID], [ProduktID]) VALUES (106, 1)
INSERT [dbo].[MatrattProdukt] ([MatrattID], [ProduktID]) VALUES (106, 2)
INSERT [dbo].[MatrattProdukt] ([MatrattID], [ProduktID]) VALUES (106, 4)
INSERT [dbo].[MatrattProdukt] ([MatrattID], [ProduktID]) VALUES (107, 4)
INSERT [dbo].[MatrattProdukt] ([MatrattID], [ProduktID]) VALUES (107, 6)
INSERT [dbo].[MatrattProdukt] ([MatrattID], [ProduktID]) VALUES (108, 2)
INSERT [dbo].[MatrattProdukt] ([MatrattID], [ProduktID]) VALUES (108, 4)
INSERT [dbo].[MatrattProdukt] ([MatrattID], [ProduktID]) VALUES (108, 6)
GO
SET IDENTITY_INSERT [dbo].[MatrattTyp] ON 

INSERT [dbo].[MatrattTyp] ([MatrattTypID], [Beskrivning]) VALUES (1, N'Pizza')
INSERT [dbo].[MatrattTyp] ([MatrattTypID], [Beskrivning]) VALUES (2, N'Pasta')
INSERT [dbo].[MatrattTyp] ([MatrattTypID], [Beskrivning]) VALUES (3, N'Sallad')
SET IDENTITY_INSERT [dbo].[MatrattTyp] OFF
GO
SET IDENTITY_INSERT [dbo].[Produkt] ON 

INSERT [dbo].[Produkt] ([ProduktID], [ProduktNamn]) VALUES (1, N'Skinka')
INSERT [dbo].[Produkt] ([ProduktID], [ProduktNamn]) VALUES (2, N'Mozzarella')
INSERT [dbo].[Produkt] ([ProduktID], [ProduktNamn]) VALUES (3, N'Champinjoner')
INSERT [dbo].[Produkt] ([ProduktID], [ProduktNamn]) VALUES (4, N'Tomat')
INSERT [dbo].[Produkt] ([ProduktID], [ProduktNamn]) VALUES (6, N'Lök')
INSERT [dbo].[Produkt] ([ProduktID], [ProduktNamn]) VALUES (7, N'Tonfisk')
SET IDENTITY_INSERT [dbo].[Produkt] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 5/5/2021 4:00:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 5/5/2021 4:00:43 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 5/5/2021 4:00:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 5/5/2021 4:00:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 5/5/2021 4:00:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 5/5/2021 4:00:43 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 5/5/2021 4:00:43 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT ((0)) FOR [Points]
GO
ALTER TABLE [dbo].[BestallningMatratt] ADD  CONSTRAINT [DF_BestallningMatratt_Antal]  DEFAULT ((1)) FOR [Antal]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Bestallning]  WITH CHECK ADD  CONSTRAINT [FK_Bestallning_AspNetUsers] FOREIGN KEY([Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Bestallning] CHECK CONSTRAINT [FK_Bestallning_AspNetUsers]
GO
ALTER TABLE [dbo].[BestallningMatratt]  WITH CHECK ADD  CONSTRAINT [FK_BestallningMatratt_Bestallning] FOREIGN KEY([BestallningID])
REFERENCES [dbo].[Bestallning] ([BestallningID])
GO
ALTER TABLE [dbo].[BestallningMatratt] CHECK CONSTRAINT [FK_BestallningMatratt_Bestallning]
GO
ALTER TABLE [dbo].[BestallningMatratt]  WITH CHECK ADD  CONSTRAINT [FK_BestallningMatratt_Matratt] FOREIGN KEY([MatrattID])
REFERENCES [dbo].[Matratt] ([MatrattID])
GO
ALTER TABLE [dbo].[BestallningMatratt] CHECK CONSTRAINT [FK_BestallningMatratt_Matratt]
GO
ALTER TABLE [dbo].[Matratt]  WITH CHECK ADD  CONSTRAINT [FK_Matratt_MatrattTyp] FOREIGN KEY([MatrattTypID])
REFERENCES [dbo].[MatrattTyp] ([MatrattTypID])
GO
ALTER TABLE [dbo].[Matratt] CHECK CONSTRAINT [FK_Matratt_MatrattTyp]
GO
ALTER TABLE [dbo].[MatrattProdukt]  WITH CHECK ADD  CONSTRAINT [FK_MatrattProdukt_Matratt] FOREIGN KEY([MatrattID])
REFERENCES [dbo].[Matratt] ([MatrattID])
GO
ALTER TABLE [dbo].[MatrattProdukt] CHECK CONSTRAINT [FK_MatrattProdukt_Matratt]
GO
ALTER TABLE [dbo].[MatrattProdukt]  WITH CHECK ADD  CONSTRAINT [FK_MatrattProdukt_Produkt] FOREIGN KEY([ProduktID])
REFERENCES [dbo].[Produkt] ([ProduktID])
GO
ALTER TABLE [dbo].[MatrattProdukt] CHECK CONSTRAINT [FK_MatrattProdukt_Produkt]
GO
/****** Object:  StoredProcedure [dbo].[GetMeny]    Script Date: 5/5/2021 4:00:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetMeny] 
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    Select [MatrattNamn], [Pris]
	from [dbo].[Matratt]
END
GO
USE [master]
GO
ALTER DATABASE [Tomasos] SET  READ_WRITE 
GO
