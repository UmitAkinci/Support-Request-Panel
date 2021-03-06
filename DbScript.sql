USE [HobimDestekTalepDB]
GO
/****** Object:  Table [dbo].[Personel]    Script Date: 11/11/2018 2:41:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personel](
	[PersonelID] [int] IDENTITY(1,1) NOT NULL,
	[PersonelAdiSoyadi] [nvarchar](50) NULL,
	[DepartmanID] [int] NULL,
 CONSTRAINT [PK_Personel] PRIMARY KEY CLUSTERED 
(
	[PersonelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 11/11/2018 2:41:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanici](
	[KullaniciID] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAdi] [nchar](50) NULL,
	[KullaniciSifre] [nvarchar](50) NULL,
	[KullaniciRol] [nvarchar](50) NULL,
	[PersonelID] [int] NULL,
 CONSTRAINT [PK_Kullanici] PRIMARY KEY CLUSTERED 
(
	[KullaniciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VwKulPer]    Script Date: 11/11/2018 2:41:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VwKulPer]
AS
SELECT dbo.Kullanici.KullaniciID, dbo.Kullanici.KullaniciAdi, dbo.Kullanici.KullaniciSifre, dbo.Kullanici.KullaniciRol, dbo.Personel.PersonelID, dbo.Personel.PersonelAdiSoyadi, dbo.Personel.DepartmanID
FROM     dbo.Kullanici INNER JOIN
                  dbo.Personel ON dbo.Kullanici.PersonelID = dbo.Personel.PersonelID
GO
/****** Object:  Table [dbo].[Departman]    Script Date: 11/11/2018 2:41:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departman](
	[DepartmanID] [int] NOT NULL,
	[DepartmanAdi] [nvarchar](50) NULL,
 CONSTRAINT [PK_Departman] PRIMARY KEY CLUSTERED 
(
	[DepartmanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VwKulPerDep]    Script Date: 11/11/2018 2:41:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VwKulPerDep]
AS
SELECT dbo.Personel.PersonelID, dbo.Kullanici.KullaniciID, dbo.Kullanici.KullaniciAdi, dbo.Kullanici.KullaniciSifre, dbo.Kullanici.KullaniciRol, dbo.Departman.DepartmanAdi, dbo.Departman.DepartmanID, dbo.Personel.PersonelAdiSoyadi
FROM     dbo.Departman INNER JOIN
                  dbo.Personel ON dbo.Departman.DepartmanID = dbo.Personel.DepartmanID INNER JOIN
                  dbo.Kullanici ON dbo.Personel.PersonelID = dbo.Kullanici.PersonelID
GO
/****** Object:  Table [dbo].[Talep]    Script Date: 11/11/2018 2:41:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Talep](
	[TalepID] [int] IDENTITY(1,1) NOT NULL,
	[TalepIcerik] [nvarchar](200) NULL,
	[TalepTuru] [nvarchar](50) NULL,
	[TalepTarihi] [datetime] NULL,
	[PersonelID] [int] NULL,
	[TalepDurumu] [nvarchar](50) NULL,
 CONSTRAINT [PK_Talep] PRIMARY KEY CLUSTERED 
(
	[TalepID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VwDepTal]    Script Date: 11/11/2018 2:41:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VwDepTal]
AS
SELECT dbo.Talep.TalepID, dbo.Talep.TalepIcerik, dbo.Talep.TalepTuru, dbo.Talep.TalepTarihi, dbo.Departman.DepartmanID, dbo.Departman.DepartmanAdi, dbo.Talep.TalepDurumu
FROM     dbo.Departman CROSS JOIN
                  dbo.Talep
GO
INSERT [dbo].[Departman] ([DepartmanID], [DepartmanAdi]) VALUES (1, N'Yazılım')
SET IDENTITY_INSERT [dbo].[Kullanici] ON 

INSERT [dbo].[Kullanici] ([KullaniciID], [KullaniciAdi], [KullaniciSifre], [KullaniciRol], [PersonelID]) VALUES (2, N'admin                                             ', N'admin', N'Admin', 1)
INSERT [dbo].[Kullanici] ([KullaniciID], [KullaniciAdi], [KullaniciSifre], [KullaniciRol], [PersonelID]) VALUES (3, N'umit                                              ', N'umit', N'Normal', 1)
INSERT [dbo].[Kullanici] ([KullaniciID], [KullaniciAdi], [KullaniciSifre], [KullaniciRol], [PersonelID]) VALUES (4, N'yonetici                                          ', N'yonetici', N'Yönetici', 1)
INSERT [dbo].[Kullanici] ([KullaniciID], [KullaniciAdi], [KullaniciSifre], [KullaniciRol], [PersonelID]) VALUES (5, N'aozgunduz                                         ', N'aozgunduz', N'Normal', 2)
SET IDENTITY_INSERT [dbo].[Kullanici] OFF
SET IDENTITY_INSERT [dbo].[Personel] ON 

INSERT [dbo].[Personel] ([PersonelID], [PersonelAdiSoyadi], [DepartmanID]) VALUES (1, N'Ümit Akıncı', 1)
INSERT [dbo].[Personel] ([PersonelID], [PersonelAdiSoyadi], [DepartmanID]) VALUES (2, N'Aykut Özgündüz', 1)
SET IDENTITY_INSERT [dbo].[Personel] OFF
SET IDENTITY_INSERT [dbo].[Talep] ON 

INSERT [dbo].[Talep] ([TalepID], [TalepIcerik], [TalepTuru], [TalepTarihi], [PersonelID], [TalepDurumu]) VALUES (1, N'Bilgisayar bozuk', N'Donanım Arıza', CAST(N'2018-10-17T13:25:19.933' AS DateTime), 1, N'Bekleniyor')
INSERT [dbo].[Talep] ([TalepID], [TalepIcerik], [TalepTuru], [TalepTarihi], [PersonelID], [TalepDurumu]) VALUES (2, N'Masa kırık', N'Diğer', CAST(N'2018-10-17T14:15:02.220' AS DateTime), 1, N'Bekleniyor')
INSERT [dbo].[Talep] ([TalepID], [TalepIcerik], [TalepTuru], [TalepTarihi], [PersonelID], [TalepDurumu]) VALUES (3, N'monitör lazım', N'Donanım İstek', CAST(N'2018-10-31T15:25:08.257' AS DateTime), 1, N'Bekleniyor')
INSERT [dbo].[Talep] ([TalepID], [TalepIcerik], [TalepTuru], [TalepTarihi], [PersonelID], [TalepDurumu]) VALUES (4, N'test', N'Diğer', CAST(N'2018-10-31T16:38:48.017' AS DateTime), 2, N'Bekleniyor')
SET IDENTITY_INSERT [dbo].[Talep] OFF
ALTER TABLE [dbo].[Kullanici]  WITH CHECK ADD FOREIGN KEY([PersonelID])
REFERENCES [dbo].[Personel] ([PersonelID])
GO
ALTER TABLE [dbo].[Personel]  WITH CHECK ADD FOREIGN KEY([DepartmanID])
REFERENCES [dbo].[Departman] ([DepartmanID])
GO
ALTER TABLE [dbo].[Talep]  WITH CHECK ADD FOREIGN KEY([PersonelID])
REFERENCES [dbo].[Talep] ([TalepID])
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Departman"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 126
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Talep"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwDepTal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwDepTal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Kullanici"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Personel"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 148
               Right = 501
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwKulPer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwKulPer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Departman"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 126
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Kullanici"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Personel"
            Begin Extent = 
               Top = 7
               Left = 532
               Bottom = 148
               Right = 743
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwKulPerDep'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwKulPerDep'
GO
