USE [master]
GO
	/****** Object:  Database [EMRE_TEST]    Script Date: 26.01.2023 17:14:45 ******/
	CREATE DATABASE [EMRE_TEST]
GO USE [EMRE_TEST]
GO
	/****** Object:  Table [dbo].[FAMILIES]    Script Date: 26.01.2023 17:14:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO CREATE TABLE [dbo].[FAMILIES](
		[FAMILY_ID] [int] IDENTITY(1, 1) NOT NULL,
		[FAMILY_NAME] [nvarchar](150) NULL,
		[PROJECT_ID] [int] NULL,
		PRIMARY KEY CLUSTERED ([FAMILY_ID] ASC) WITH (
			PAD_INDEX = OFF,
			STATISTICS_NORECOMPUTE = OFF,
			IGNORE_DUP_KEY = OFF,
			ALLOW_ROW_LOCKS = ON,
			ALLOW_PAGE_LOCKS = ON,
			OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
		) ON [PRIMARY]
	) ON [PRIMARY]
GO
	/****** Object:  Table [dbo].[MODULES]    Script Date: 26.01.2023 17:14:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO CREATE TABLE [dbo].[MODULES](
		[MODULE_ID] [int] IDENTITY(1, 1) NOT NULL,
		[FAMILY_ID] [int] NULL,
		[MODULE_NAME] [nvarchar](150) NULL,
		PRIMARY KEY CLUSTERED ([MODULE_ID] ASC) WITH (
			PAD_INDEX = OFF,
			STATISTICS_NORECOMPUTE = OFF,
			IGNORE_DUP_KEY = OFF,
			ALLOW_ROW_LOCKS = ON,
			ALLOW_PAGE_LOCKS = ON,
			OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
		) ON [PRIMARY]
	) ON [PRIMARY]
GO
	/****** Object:  Table [dbo].[PAGES]    Script Date: 26.01.2023 17:14:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO CREATE TABLE [dbo].[PAGES](
		[PAGE_ID] [int] IDENTITY(1, 1) NOT NULL,
		[MODULE_ID] [int] NULL,
		[PAGE_NAME] [nvarchar](150) NULL,
		[FACT] [nvarchar](200) NULL,
		[FILE_PATH] [nvarchar](500) NULL,
		[IS_MENU] [bit] NULL,
		[PROJECT_ID] [int] NULL,
		PRIMARY KEY CLUSTERED ([PAGE_ID] ASC) WITH (
			PAD_INDEX = OFF,
			STATISTICS_NORECOMPUTE = OFF,
			IGNORE_DUP_KEY = OFF,
			ALLOW_ROW_LOCKS = ON,
			ALLOW_PAGE_LOCKS = ON,
			OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
		) ON [PRIMARY]
	) ON [PRIMARY]
GO
	/****** Object:  Table [dbo].[PROJECTS]    Script Date: 26.01.2023 17:14:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO CREATE TABLE [dbo].[PROJECTS](
		[PROJECT_ID] [int] IDENTITY(1, 1) NOT NULL,
		[PROJECT_NAME] [nvarchar](150) NULL,
		[PROJECT_FOLDER] [nvarchar](150) NULL,
		PRIMARY KEY CLUSTERED ([PROJECT_ID] ASC) WITH (
			PAD_INDEX = OFF,
			STATISTICS_NORECOMPUTE = OFF,
			IGNORE_DUP_KEY = OFF,
			ALLOW_ROW_LOCKS = ON,
			ALLOW_PAGE_LOCKS = ON,
			OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
		) ON [PRIMARY]
	) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[FAMILIES] ON
INSERT [dbo].[FAMILIES] ([FAMILY_ID], [FAMILY_NAME], [PROJECT_ID])
VALUES (1, N'DEV', 0)
INSERT [dbo].[FAMILIES] ([FAMILY_ID], [FAMILY_NAME], [PROJECT_ID])
VALUES (2, N'Urun', 1)
SET IDENTITY_INSERT [dbo].[FAMILIES] OFF
GO
SET IDENTITY_INSERT [dbo].[MODULES] ON
INSERT [dbo].[MODULES] ([MODULE_ID], [FAMILY_ID], [MODULE_NAME])
VALUES (1, 1, N'DEV')
INSERT [dbo].[MODULES] ([MODULE_ID], [FAMILY_ID], [MODULE_NAME])
VALUES (2, 2, N'Urun')
INSERT [dbo].[MODULES] ([MODULE_ID], [FAMILY_ID], [MODULE_NAME])
VALUES (3, 2, N'Kategori')
INSERT [dbo].[MODULES] ([MODULE_ID], [FAMILY_ID], [MODULE_NAME])
VALUES (4, 3, N'Marka')
SET IDENTITY_INSERT [dbo].[MODULES] OFF
GO
SET IDENTITY_INSERT [dbo].[PAGES] ON
INSERT [dbo].[PAGES] (
		[PAGE_ID],
		[MODULE_ID],
		[PAGE_NAME],
		[FACT],
		[FILE_PATH],
		[IS_MENU],
		[PROJECT_ID]
	)
VALUES (
		1,
		1,
		N'Sayfalar',
		N'dev.list_pages',
		N'/dev/display/list_pages.cfm',
		1,
		NULL
	)
INSERT [dbo].[PAGES] (
		[PAGE_ID],
		[MODULE_ID],
		[PAGE_NAME],
		[FACT],
		[FILE_PATH],
		[IS_MENU],
		[PROJECT_ID]
	)
VALUES (
		2,
		1,
		N'Sayfa Ekle',
		N'dev.add_page',
		N'/dev/form/add_page.cfm',
		0,
		NULL
	)
INSERT [dbo].[PAGES] (
		[PAGE_ID],
		[MODULE_ID],
		[PAGE_NAME],
		[FACT],
		[FILE_PATH],
		[IS_MENU],
		[PROJECT_ID]
	)
VALUES (
		3,
		1,
		N'Sayfa Güncelle',
		N'dev.upd_page',
		N'/dev/form/upd_page.cfm',
		0,
		NULL
	)
INSERT [dbo].[PAGES] (
		[PAGE_ID],
		[MODULE_ID],
		[PAGE_NAME],
		[FACT],
		[FILE_PATH],
		[IS_MENU],
		[PROJECT_ID]
	)
VALUES (
		4,
		1,
		N'Sayfa Sil',
		N'dev.del_page',
		N'/dev/query/del_page.cfm',
		0,
		NULL
	)
INSERT [dbo].[PAGES] (
		[PAGE_ID],
		[MODULE_ID],
		[PAGE_NAME],
		[FACT],
		[FILE_PATH],
		[IS_MENU],
		[PROJECT_ID]
	)
VALUES (
		5,
		1,
		N'Sayfa Ekle Query',
		N'dev.emptypopup_add_page',
		N'/dev/query/add_page.cfm',
		0,
		NULL
	)
INSERT [dbo].[PAGES] (
		[PAGE_ID],
		[MODULE_ID],
		[PAGE_NAME],
		[FACT],
		[FILE_PATH],
		[IS_MENU],
		[PROJECT_ID]
	)
VALUES (
		6,
		1,
		N'Sayfa Güncelle Query',
		N'dev.emptypopup_upd_page.cfm',
		N'/dev/query/upd_page.cfm',
		0,
		NULL
	)
INSERT [dbo].[PAGES] (
		[PAGE_ID],
		[MODULE_ID],
		[PAGE_NAME],
		[FACT],
		[FILE_PATH],
		[IS_MENU],
		[PROJECT_ID]
	)
VALUES (
		7,
		2,
		N'Urun Listesi',
		N'product.list_tici_products',
		N'/pages/urun/display/list_tici_products.cfm',
		1,
		1
	)
SET IDENTITY_INSERT [dbo].[PAGES] OFF
GO
SET IDENTITY_INSERT [dbo].[PROJECTS] ON
INSERT [dbo].[PROJECTS] ([PROJECT_ID], [PROJECT_NAME], [PROJECT_FOLDER])
VALUES (1, N'TICIMAX', N'TICIMAX')
SET IDENTITY_INSERT [dbo].[PROJECTS] OFF
GO USE [master]
GO ALTER DATABASE [EMRE_TEST]
SET READ_WRITE
GO