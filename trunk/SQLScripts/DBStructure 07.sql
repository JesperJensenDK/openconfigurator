USE [OpenConfigurator_DEV]
GO
/****** Object:  Table [dbo].[Attribute_Types]    Script Date: 02/03/2012 02:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attribute_Types](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Attribute_Types] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Attribute_Types] ON
INSERT [dbo].[Attribute_Types] ([ID], [Name]) VALUES (1, N'Constant')
INSERT [dbo].[Attribute_Types] ([ID], [Name]) VALUES (2, N'Dynamic')
INSERT [dbo].[Attribute_Types] ([ID], [Name]) VALUES (3, N'UserInput')
SET IDENTITY_INSERT [dbo].[Attribute_Types] OFF
/****** Object:  Table [dbo].[Attribute_DataTypes]    Script Date: 02/03/2012 02:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attribute_DataTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Attribute_DataTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Attribute_DataTypes] ON
INSERT [dbo].[Attribute_DataTypes] ([ID], [Name]) VALUES (1, N'Integer')
INSERT [dbo].[Attribute_DataTypes] ([ID], [Name]) VALUES (2, N'Boolean')
INSERT [dbo].[Attribute_DataTypes] ([ID], [Name]) VALUES (3, N'String')
SET IDENTITY_INSERT [dbo].[Attribute_DataTypes] OFF
/****** Object:  Table [dbo].[CompositionRule_Types]    Script Date: 02/03/2012 02:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompositionRule_Types](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CompositionRule_Types] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CompositionRule_Types] ON
INSERT [dbo].[CompositionRule_Types] ([ID], [Name]) VALUES (1, N'Dependency')
INSERT [dbo].[CompositionRule_Types] ([ID], [Name]) VALUES (2, N'Mutual Dependency')
INSERT [dbo].[CompositionRule_Types] ([ID], [Name]) VALUES (3, N'Mutual Exclusion')
SET IDENTITY_INSERT [dbo].[CompositionRule_Types] OFF
/****** Object:  Table [dbo].[CustomRule_Types]    Script Date: 02/03/2012 02:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomRule_Types](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Rule_Types] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CustomRule_Types] ON
INSERT [dbo].[CustomRule_Types] ([ID], [Name]) VALUES (1, N'Composition Rules')
INSERT [dbo].[CustomRule_Types] ([ID], [Name]) VALUES (2, N'Consequence Rules')
INSERT [dbo].[CustomRule_Types] ([ID], [Name]) VALUES (3, N'Global Constraints')
SET IDENTITY_INSERT [dbo].[CustomRule_Types] OFF
/****** Object:  Table [dbo].[GroupRelation_Types]    Script Date: 02/03/2012 02:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupRelation_Types](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[FixedLowerBound] [int] NULL,
	[FixedUpperBound] [int] NULL,
 CONSTRAINT [PK_FeatureGroup_Types] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[GroupRelation_Types] ON
INSERT [dbo].[GroupRelation_Types] ([ID], [Name], [FixedLowerBound], [FixedUpperBound]) VALUES (1, N'OR', 1, NULL)
INSERT [dbo].[GroupRelation_Types] ([ID], [Name], [FixedLowerBound], [FixedUpperBound]) VALUES (2, N'XOR', 1, 1)
INSERT [dbo].[GroupRelation_Types] ([ID], [Name], [FixedLowerBound], [FixedUpperBound]) VALUES (3, N'Custom OR', NULL, NULL)
SET IDENTITY_INSERT [dbo].[GroupRelation_Types] OFF
/****** Object:  Table [dbo].[Users]    Script Date: 02/03/2012 02:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([ID], [Email], [Password]) VALUES (1, N'Radu', N'hej123!')
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Table [dbo].[SelectionStates]    Script Date: 02/03/2012 02:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SelectionStates](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SelectionStates] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SelectionStates] ON
INSERT [dbo].[SelectionStates] ([ID], [Name]) VALUES (1, N'Selected')
INSERT [dbo].[SelectionStates] ([ID], [Name]) VALUES (2, N'Deselected')
INSERT [dbo].[SelectionStates] ([ID], [Name]) VALUES (3, N'Unselected')
SET IDENTITY_INSERT [dbo].[SelectionStates] OFF
/****** Object:  Table [dbo].[Relation_Types]    Script Date: 02/03/2012 02:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Relation_Types](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[FixedLowerBound] [int] NULL,
	[FixedUpperBound] [int] NULL,
 CONSTRAINT [PK_Feature_Types] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Relation_Types] ON
INSERT [dbo].[Relation_Types] ([ID], [Name], [FixedLowerBound], [FixedUpperBound]) VALUES (1, N'Mandatory', 1, 1)
INSERT [dbo].[Relation_Types] ([ID], [Name], [FixedLowerBound], [FixedUpperBound]) VALUES (2, N'Optional', 0, 1)
INSERT [dbo].[Relation_Types] ([ID], [Name], [FixedLowerBound], [FixedUpperBound]) VALUES (3, N'Cloneable', 0, NULL)
SET IDENTITY_INSERT [dbo].[Relation_Types] OFF
/****** Object:  Table [dbo].[Models]    Script Date: 02/03/2012 02:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Models](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[LastModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Models] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Models] ON
INSERT [dbo].[Models] ([ID], [UserID], [Name], [CreatedDate], [LastModifiedDate]) VALUES (44, 1, N'Laptop model', CAST(0x00009F8B01446AE7 AS DateTime), CAST(0x00009FE800F5275D AS DateTime))
INSERT [dbo].[Models] ([ID], [UserID], [Name], [CreatedDate], [LastModifiedDate]) VALUES (78, 1, N'Bicycle model', CAST(0x00009F8E00B08A24 AS DateTime), CAST(0x00009FE40030D823 AS DateTime))
INSERT [dbo].[Models] ([ID], [UserID], [Name], [CreatedDate], [LastModifiedDate]) VALUES (96, 1, N'Vacation model', CAST(0x00009F9000D1D848 AS DateTime), CAST(0x00009FD6004039AD AS DateTime))
INSERT [dbo].[Models] ([ID], [UserID], [Name], [CreatedDate], [LastModifiedDate]) VALUES (114, 1, N'Insurance', CAST(0x00009FD10022D751 AS DateTime), CAST(0x00009FD1002EC937 AS DateTime))
INSERT [dbo].[Models] ([ID], [UserID], [Name], [CreatedDate], [LastModifiedDate]) VALUES (115, 1, N'IT Services Model', CAST(0x00009FD1017A7B05 AS DateTime), CAST(0x00009FE401714B89 AS DateTime))
INSERT [dbo].[Models] ([ID], [UserID], [Name], [CreatedDate], [LastModifiedDate]) VALUES (117, 1, N'Configit Bike', CAST(0x00009FD80103D779 AS DateTime), CAST(0x00009FD900A8AE94 AS DateTime))
INSERT [dbo].[Models] ([ID], [UserID], [Name], [CreatedDate], [LastModifiedDate]) VALUES (118, 1, N'Catering Firma', CAST(0x00009FDA00D1D3D6 AS DateTime), CAST(0x00009FE20011AF85 AS DateTime))
INSERT [dbo].[Models] ([ID], [UserID], [Name], [CreatedDate], [LastModifiedDate]) VALUES (119, 1, N'Test Model', CAST(0x00009FE401678D12 AS DateTime), CAST(0x00009FEC001B8F96 AS DateTime))
SET IDENTITY_INSERT [dbo].[Models] OFF
/****** Object:  Table [dbo].[GroupRelations]    Script Date: 02/03/2012 02:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupRelations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ModelID] [int] NOT NULL,
	[GroupRelationTypeID] [int] NOT NULL,
	[LowerBound] [int] NULL,
	[UpperBound] [int] NULL,
 CONSTRAINT [PK_FeatureGroups] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[GroupRelations] ON
INSERT [dbo].[GroupRelations] ([ID], [ModelID], [GroupRelationTypeID], [LowerBound], [UpperBound]) VALUES (15, 44, 2, 1, 1)
INSERT [dbo].[GroupRelations] ([ID], [ModelID], [GroupRelationTypeID], [LowerBound], [UpperBound]) VALUES (16, 44, 2, 1, 1)
INSERT [dbo].[GroupRelations] ([ID], [ModelID], [GroupRelationTypeID], [LowerBound], [UpperBound]) VALUES (17, 44, 3, 1, 3)
INSERT [dbo].[GroupRelations] ([ID], [ModelID], [GroupRelationTypeID], [LowerBound], [UpperBound]) VALUES (18, 44, 2, 1, 1)
INSERT [dbo].[GroupRelations] ([ID], [ModelID], [GroupRelationTypeID], [LowerBound], [UpperBound]) VALUES (19, 44, 2, 1, 1)
INSERT [dbo].[GroupRelations] ([ID], [ModelID], [GroupRelationTypeID], [LowerBound], [UpperBound]) VALUES (20, 44, 1, 0, 1)
INSERT [dbo].[GroupRelations] ([ID], [ModelID], [GroupRelationTypeID], [LowerBound], [UpperBound]) VALUES (21, 96, 2, 1, 1)
INSERT [dbo].[GroupRelations] ([ID], [ModelID], [GroupRelationTypeID], [LowerBound], [UpperBound]) VALUES (22, 96, 3, 1, 3)
INSERT [dbo].[GroupRelations] ([ID], [ModelID], [GroupRelationTypeID], [LowerBound], [UpperBound]) VALUES (23, 96, 2, 1, 1)
INSERT [dbo].[GroupRelations] ([ID], [ModelID], [GroupRelationTypeID], [LowerBound], [UpperBound]) VALUES (24, 96, 2, 1, 1)
INSERT [dbo].[GroupRelations] ([ID], [ModelID], [GroupRelationTypeID], [LowerBound], [UpperBound]) VALUES (25, 78, 1, 0, 1)
INSERT [dbo].[GroupRelations] ([ID], [ModelID], [GroupRelationTypeID], [LowerBound], [UpperBound]) VALUES (26, 78, 2, 1, 1)
INSERT [dbo].[GroupRelations] ([ID], [ModelID], [GroupRelationTypeID], [LowerBound], [UpperBound]) VALUES (27, 78, 1, 0, 1)
INSERT [dbo].[GroupRelations] ([ID], [ModelID], [GroupRelationTypeID], [LowerBound], [UpperBound]) VALUES (28, 78, 1, 0, 1)
INSERT [dbo].[GroupRelations] ([ID], [ModelID], [GroupRelationTypeID], [LowerBound], [UpperBound]) VALUES (30, 44, 1, 0, 1)
INSERT [dbo].[GroupRelations] ([ID], [ModelID], [GroupRelationTypeID], [LowerBound], [UpperBound]) VALUES (33, 114, 2, 1, 1)
INSERT [dbo].[GroupRelations] ([ID], [ModelID], [GroupRelationTypeID], [LowerBound], [UpperBound]) VALUES (35, 114, 2, 1, 1)
INSERT [dbo].[GroupRelations] ([ID], [ModelID], [GroupRelationTypeID], [LowerBound], [UpperBound]) VALUES (40, 115, 3, 1, 3)
INSERT [dbo].[GroupRelations] ([ID], [ModelID], [GroupRelationTypeID], [LowerBound], [UpperBound]) VALUES (41, 115, 2, 1, 1)
INSERT [dbo].[GroupRelations] ([ID], [ModelID], [GroupRelationTypeID], [LowerBound], [UpperBound]) VALUES (42, 115, 2, 1, 1)
INSERT [dbo].[GroupRelations] ([ID], [ModelID], [GroupRelationTypeID], [LowerBound], [UpperBound]) VALUES (43, 115, 1, 0, 1)
INSERT [dbo].[GroupRelations] ([ID], [ModelID], [GroupRelationTypeID], [LowerBound], [UpperBound]) VALUES (44, 115, 3, 1, 3)
INSERT [dbo].[GroupRelations] ([ID], [ModelID], [GroupRelationTypeID], [LowerBound], [UpperBound]) VALUES (49, 44, 2, 1, 1)
INSERT [dbo].[GroupRelations] ([ID], [ModelID], [GroupRelationTypeID], [LowerBound], [UpperBound]) VALUES (50, 44, 2, 1, 1)
INSERT [dbo].[GroupRelations] ([ID], [ModelID], [GroupRelationTypeID], [LowerBound], [UpperBound]) VALUES (51, 44, 2, 1, 1)
INSERT [dbo].[GroupRelations] ([ID], [ModelID], [GroupRelationTypeID], [LowerBound], [UpperBound]) VALUES (52, 44, 1, 0, 1)
INSERT [dbo].[GroupRelations] ([ID], [ModelID], [GroupRelationTypeID], [LowerBound], [UpperBound]) VALUES (53, 117, 2, 1, 1)
INSERT [dbo].[GroupRelations] ([ID], [ModelID], [GroupRelationTypeID], [LowerBound], [UpperBound]) VALUES (54, 117, 2, 1, 1)
INSERT [dbo].[GroupRelations] ([ID], [ModelID], [GroupRelationTypeID], [LowerBound], [UpperBound]) VALUES (55, 118, 3, 1, 3)
INSERT [dbo].[GroupRelations] ([ID], [ModelID], [GroupRelationTypeID], [LowerBound], [UpperBound]) VALUES (56, 118, 1, 1, 1)
INSERT [dbo].[GroupRelations] ([ID], [ModelID], [GroupRelationTypeID], [LowerBound], [UpperBound]) VALUES (62, 119, 2, 1, 1)
SET IDENTITY_INSERT [dbo].[GroupRelations] OFF
/****** Object:  Table [dbo].[Features]    Script Date: 02/03/2012 02:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Features](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ModelID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[IsRoot] [bit] NULL,
	[XPos] [float] NULL,
	[YPos] [float] NULL,
 CONSTRAINT [PK_Features] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Features] ON
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (74, 44, N'Laptop', NULL, NULL, 1064.5, 24.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (75, 44, N'Hardware', NULL, NULL, 418.5, 245.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (76, 44, N'Software', NULL, NULL, 1596.5, 370.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (77, 44, N'Operating System', NULL, NULL, 1375.5, 620.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (78, 44, N'Office tools', NULL, NULL, 1622.5, 644.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (82, 78, N'Bicycle', NULL, NULL, 851.5, 5.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (83, 78, N'Parts', NULL, NULL, 275.5, 254.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (84, 78, N'Preferences', NULL, NULL, 961.5, 222.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (90, 78, N'Gear', NULL, NULL, 186.5, 417.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (94, 44, N'Monitor', NULL, NULL, 1067.5, 549.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (95, 44, N'GPU', NULL, NULL, 44.5, 570.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (96, 44, N'Keyboard & Mouse', NULL, NULL, 838.5, 576.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (97, 44, N'HDD', NULL, NULL, 293.5, 577.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (98, 44, N'CPU', NULL, NULL, 555.5, 674.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (99, 44, N'RAM', NULL, NULL, 671.5, 569.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (100, 44, N'1 GB Slot', NULL, NULL, 688.5, 707.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (101, 44, N'Intel i3', NULL, NULL, 567.5, 941.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (102, 44, N'Intel i5', NULL, NULL, 656.5, 975.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (103, 44, N'Intel i7', NULL, NULL, 750.5, 1011.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (104, 44, N'AMD x9', NULL, NULL, 862.5, 1048.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (105, 44, N'Microsoft Keyboard', NULL, NULL, 783.5, 779.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (106, 44, N'Microsoft Mouse', NULL, NULL, 905.5, 792.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (107, 44, N'Insurance', NULL, NULL, 1084.5, 202.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (108, 44, N'Windows XP', NULL, NULL, 1201.5, 839.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (109, 44, N'Windows 7', NULL, NULL, 1309.5, 850.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (110, 44, N'Complete', NULL, NULL, 1045.5, 457.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (111, 44, N'Damage', NULL, NULL, 1176.5, 466.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (112, 44, N'Theft', NULL, NULL, 1295.5, 457.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (113, 44, N'Windows Vista', NULL, NULL, 1423.5, 849.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (114, 44, N'Linux Debian', NULL, NULL, 1536.5, 845.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (115, 44, N'Samsung 19"', NULL, NULL, 989.5, 710.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (116, 44, N'Sony 25"', NULL, NULL, 1081.5, 777.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (117, 44, N'LG 30"', NULL, NULL, 1160.5, 711.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (118, 44, N'Westgate SCSI', NULL, NULL, 127.5, 1011.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (119, 44, N'VNI RADX', NULL, NULL, 202.5, 1065.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (120, 44, N'Nvidia 5700m', NULL, NULL, 4.5, 817.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (121, 44, N'Ati Radeon 5650', NULL, NULL, 120.5, 817.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (122, 96, N'Vacation', NULL, NULL, 749.5, 14.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (124, 96, N'Destination', NULL, NULL, 404.5, 298.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (125, 96, N'Insurance', NULL, NULL, 1368.5, 270.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (126, 96, N'Accommodation', NULL, NULL, 668.5, 444.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (128, 96, N'Hotel', NULL, NULL, 632.5, 707.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (134, 96, N'Thailand', NULL, NULL, 35.5, 494.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (135, 96, N'India', NULL, NULL, 168.5, 559.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (136, 96, N'Greece', NULL, NULL, 300.5, 587.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (137, 96, N'Spain', NULL, NULL, 461.5, 552.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (138, 96, N'Travel', NULL, NULL, 1518.5, 479.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (139, 96, N'Medical', NULL, NULL, 1389.5, 480.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (140, 96, N'Theft', NULL, NULL, 1279.5, 446.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (141, 96, N'Hostel', NULL, NULL, 786.5, 704.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (142, 96, N'Transportation', NULL, NULL, 899.5, 262.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (143, 96, N'Holiday House', NULL, NULL, 901.5, 710.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (144, 96, N'Plane', NULL, NULL, 898.5, 412.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (145, 96, N'Coach', NULL, NULL, 1113.5, 415.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (146, 96, N'Train', NULL, NULL, 1004.5, 449.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (147, 78, N'Frame Type', NULL, NULL, 765.5, 448.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (148, 78, N'City Bike', NULL, NULL, 607.5, 776.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (149, 78, N'Classic', NULL, NULL, 692.5, 824.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (150, 78, N'Mountain Bike', NULL, NULL, 778.5, 863.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (151, 78, N'Racer bike', NULL, NULL, 891.5, 831.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (152, 78, N'Female', NULL, NULL, 1010.5, 778.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (153, 78, N'Male', NULL, NULL, 1112.5, 702.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (154, 78, N'Height', NULL, NULL, 1443.5, 396.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (155, 78, N'150-160', NULL, NULL, 1310.5, 633.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (156, 78, N'160-170', NULL, NULL, 1392.5, 670.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (157, 78, N'170-180', NULL, NULL, 1482.5, 716.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (158, 78, N'180+', NULL, NULL, 1599.5, 706.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (159, 78, N'Avg. driving dist.', NULL, NULL, 1093.5, 402.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (160, 78, N'Less than 50/week', NULL, NULL, 1060.5, 531.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (161, 78, N'More than 50/week', NULL, NULL, 1206.5, 546.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (162, 78, N'Extras', NULL, NULL, 1702.5, 220.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (163, 78, N'Frame colour', NULL, NULL, 359.5, 421.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (164, 96, N'Stars', NULL, NULL, 582.5, 877.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (171, 44, N'MS Office', NULL, NULL, 1801.5, 987.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (172, 44, N'Open Office', NULL, NULL, 1696.5, 977.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (173, 44, N'Adobe Photoshop', NULL, NULL, 1590.5, 966.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (180, 114, N'Insurance', NULL, NULL, 453.5, 14.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (181, 114, N'Personal Information', NULL, NULL, 186.5, 221.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (182, 114, N'Vehicle Type', NULL, NULL, 501.5, 274.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (183, 114, N'Truck', NULL, NULL, 611.5, 472.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (185, 114, N'Car', NULL, NULL, 361.5, 474.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (186, 114, N'Motorcycle', NULL, NULL, 484.5, 478.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (187, 114, N'Utility vehicle', NULL, NULL, 724.5, 428.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (188, 114, N'Roadster', NULL, NULL, 30.5, 736.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (189, 114, N'City', NULL, NULL, 150.5, 804.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (190, 114, N'Theft Insurance', NULL, NULL, 928.5, 249.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (191, 114, N'Car Type', NULL, NULL, 201.5, 605.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (192, 115, N'IT Services', N'Root node for IT services company specialized in offering consultancy and development assistance.', NULL, 539.5, 35.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (195, 115, N'Online Marketing', NULL, NULL, 217.5, 271.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (198, 115, N'Development', NULL, NULL, 876.5, 265.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (199, 115, N'Website analysis', NULL, NULL, 7.5, 499.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (200, 115, N'Programming', NULL, NULL, 1024.5, 467.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (201, 115, N'Sales strategy', NULL, NULL, 81.5, 551.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (203, 115, N'Architecture', NULL, NULL, 846.5, 626.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (204, 115, N'Security', NULL, NULL, 725.5, 626.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (209, 115, N'UI & Usability', NULL, NULL, 559.5, 294.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (210, 115, N'Consultancy', NULL, NULL, 818.5, 471.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (211, 115, N'User Trials', NULL, NULL, 462.5, 558.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (212, 115, N'Eyetracking trials', NULL, NULL, 609.5, 555.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (213, 115, N'Adv. campaign', NULL, NULL, 244.5, 540.5)
GO
print 'Processed 100 total records'
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (214, 115, N'Other', NULL, NULL, 371.5, 518.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (215, 115, N'Setup Analytics', NULL, NULL, 383.5, 859.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (216, 115, N'Google Adwords', NULL, NULL, 257.5, 762.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (217, 115, N'Bing advertisements', NULL, NULL, 186.5, 810.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (218, 115, N'Mobile', NULL, NULL, 982.5, 671.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (219, 115, N'Web', NULL, NULL, 1093.5, 657.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (220, 115, N'Windows', NULL, NULL, 1199.5, 640.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (221, 115, N'UI Design', NULL, NULL, 687.5, 504.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (222, 44, N'External Display Ad.', NULL, NULL, 48.5, 448.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (233, 96, N'Blueray', NULL, NULL, 1116.5, 671.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (234, 96, N'Movie', NULL, NULL, 1122.5, 561.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (235, 115, N'SEO', NULL, NULL, 499.5, 855.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (236, 115, N'Telemarketing', NULL, NULL, 55.5, 940.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (237, 115, N'Partnerships', NULL, NULL, 147.5, 975.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (238, 117, N'Bike', NULL, NULL, 564.5, 22.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (250, 44, N'Accellerator Pack', NULL, NULL, 15.5, 1048.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (251, 44, N'Safety Backup', NULL, NULL, 301.5, 1034.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (252, 44, N'Ultimate', NULL, NULL, 1433.5, 1057.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (253, 44, N'Home', NULL, NULL, 1188.5, 1051.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (254, 44, N'Premium', NULL, NULL, 1316.5, 1053.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (255, 44, N'Professional', NULL, NULL, 1553.5, 1055.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (256, 44, N'Antivirus', NULL, NULL, 1867.5, 648.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (257, 44, N'Panda Antivirus', NULL, NULL, 1836.5, 878.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (258, 44, N'Avast', NULL, NULL, 1945.5, 895.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (259, 44, N'AVG', NULL, NULL, 2053.5, 895.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (260, 44, N'MS Essentials', NULL, NULL, 2163.5, 900.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (261, 44, N'Power Supply', NULL, NULL, 417.5, 904.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (265, 44, N'Antec', NULL, NULL, 391.5, 1138.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (266, 44, N'Corsair', NULL, NULL, 503.5, 1139.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (267, 44, N'Services', NULL, NULL, 2069.5, 462.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (268, 44, N'Support', NULL, NULL, 2105.5, 726.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (269, 44, N'Training', NULL, NULL, 2215.5, 727.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (270, 117, N'Information', NULL, NULL, 303.5, 270.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (271, 117, N'Preferences', NULL, NULL, 563.5, 281.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (272, 117, N'Frame Type', NULL, NULL, 321.5, 554.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (273, 117, N'Frame Type #2', NULL, NULL, 579.5, 558.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (274, 117, N'City bike', NULL, NULL, 97.5, 815.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (275, 117, N'Classic', NULL, NULL, 211.5, 819.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (276, 117, N'Mountain Bike', NULL, NULL, 339.5, 815.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (277, 117, N'Racer bike', NULL, NULL, 461.5, 810.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (278, 117, N'Male', NULL, NULL, 592.5, 806.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (279, 117, N'Female', NULL, NULL, 706.5, 804.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (280, 117, N'Your height', NULL, NULL, 787.5, 556.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (281, 115, N'Mandatory License''', NULL, NULL, 337.5, 1019.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (282, 118, N'Catering Firma', NULL, NULL, 530.5, 16.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (283, 118, N'Mad', NULL, NULL, 212.5, 310.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (284, 118, N'Drikkevarer', NULL, NULL, 560.5, 296.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (285, 118, N'Bordopstilling', NULL, NULL, 989.5, 347.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (288, 118, N'Vin', NULL, NULL, 420.5, 495.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (289, 118, N'Champagne', NULL, NULL, 538.5, 512.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (290, 118, N'Øl', NULL, NULL, 658.5, 511.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (291, 119, N'Root', NULL, NULL, 516.5, 13.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (293, 119, N'FeatureA', NULL, NULL, 427.5, 217.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (300, 119, N'FeatureB', NULL, NULL, 720.5, 235.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (330, 119, N'FeatureC', NULL, NULL, 353.5, 416.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (331, 119, N'FeatureD', NULL, NULL, 1035.5, 477.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (332, 119, N'GroupF1', NULL, NULL, 591.5, 477.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (333, 119, N'GroupF2', NULL, NULL, 716.5, 486.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (334, 119, N'GroupF3', NULL, NULL, 842.5, 485.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (335, 119, N'FeatureE', NULL, NULL, 322.5, 604.5)
SET IDENTITY_INSERT [dbo].[Features] OFF
/****** Object:  Table [dbo].[CustomRules]    Script Date: 02/03/2012 02:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomRules](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ModelID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Expression] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Rules] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CustomRules] ON
INSERT [dbo].[CustomRules] ([ID], [ModelID], [Name], [Expression], [Description]) VALUES (2, 44, N'PriceCalcRule', N'sdsdsd', N'Special rule used for calculating the Total Price
')
INSERT [dbo].[CustomRules] ([ID], [ModelID], [Name], [Expression], [Description]) VALUES (4, 44, N'RamConstraint', N'If Hardware.Ram.TotalChosenRam == 6gb Then', NULL)
INSERT [dbo].[CustomRules] ([ID], [ModelID], [Name], [Expression], [Description]) VALUES (5, 78, N'Default rule', NULL, NULL)
INSERT [dbo].[CustomRules] ([ID], [ModelID], [Name], [Expression], [Description]) VALUES (6, 78, N'Default rue', NULL, NULL)
SET IDENTITY_INSERT [dbo].[CustomRules] OFF
/****** Object:  Table [dbo].[Configurations]    Script Date: 02/03/2012 02:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configurations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ModelID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[LastModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Configurations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Configurations] ON
INSERT [dbo].[Configurations] ([ID], [ModelID], [Name], [CreatedDate], [LastModifiedDate]) VALUES (1, 44, N'Instance 03', CAST(0x00009F8B01446AE7 AS DateTime), CAST(0x00009FE40156F84E AS DateTime))
INSERT [dbo].[Configurations] ([ID], [ModelID], [Name], [CreatedDate], [LastModifiedDate]) VALUES (2, 44, N'Default Configuration', CAST(0x00009FD0011D7380 AS DateTime), CAST(0x00009FD0011D7380 AS DateTime))
INSERT [dbo].[Configurations] ([ID], [ModelID], [Name], [CreatedDate], [LastModifiedDate]) VALUES (3, 44, N'Default Configuration', CAST(0x00009FD0011ECBBA AS DateTime), CAST(0x00009FD0011ECBBA AS DateTime))
INSERT [dbo].[Configurations] ([ID], [ModelID], [Name], [CreatedDate], [LastModifiedDate]) VALUES (32, 115, N'Services', CAST(0x00009FE4016525CA AS DateTime), CAST(0x00009FE401658D8C AS DateTime))
INSERT [dbo].[Configurations] ([ID], [ModelID], [Name], [CreatedDate], [LastModifiedDate]) VALUES (73, 119, N'Configuration00', CAST(0x00009FEC00262F66 AS DateTime), CAST(0x00009FEC00262F66 AS DateTime))
SET IDENTITY_INSERT [dbo].[Configurations] OFF
/****** Object:  Table [dbo].[CompositionRules]    Script Date: 02/03/2012 02:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompositionRules](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ModelID] [int] NOT NULL,
	[CompositionRuleTypeID] [int] NOT NULL,
	[FirstFeatureID] [int] NOT NULL,
	[SecondFeatureID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_CompositionRules] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CompositionRules] ON
INSERT [dbo].[CompositionRules] ([ID], [ModelID], [CompositionRuleTypeID], [FirstFeatureID], [SecondFeatureID], [Name], [Description]) VALUES (4, 44, 3, 108, 104, N'Default rule', NULL)
INSERT [dbo].[CompositionRules] ([ID], [ModelID], [CompositionRuleTypeID], [FirstFeatureID], [SecondFeatureID], [Name], [Description]) VALUES (10, 96, 3, 137, 144, N'Default rule', NULL)
INSERT [dbo].[CompositionRules] ([ID], [ModelID], [CompositionRuleTypeID], [FirstFeatureID], [SecondFeatureID], [Name], [Description]) VALUES (11, 96, 3, 137, 146, N'Default rule', NULL)
INSERT [dbo].[CompositionRules] ([ID], [ModelID], [CompositionRuleTypeID], [FirstFeatureID], [SecondFeatureID], [Name], [Description]) VALUES (12, 44, 1, 94, 222, N'Default rule', NULL)
SET IDENTITY_INSERT [dbo].[CompositionRules] OFF
/****** Object:  Table [dbo].[Relations]    Script Date: 02/03/2012 02:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Relations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ModelID] [int] NOT NULL,
	[RelationTypeID] [int] NOT NULL,
	[ParentFeatureID] [int] NOT NULL,
	[ChildFeatureID] [int] NOT NULL,
	[LowerBound] [int] NULL,
	[UpperBound] [int] NULL,
 CONSTRAINT [PK_Relations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Relations] ON
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (16, 44, 1, 76, 77, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (17, 44, 2, 76, 78, 0, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (34, 44, 1, 74, 75, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (35, 44, 1, 74, 76, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (36, 78, 1, 82, 83, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (37, 78, 1, 82, 84, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (40, 78, 1, 83, 90, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (41, 44, 2, 75, 94, 0, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (42, 44, 2, 75, 96, 0, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (43, 44, 1, 75, 95, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (44, 44, 1, 75, 97, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (45, 44, 1, 75, 98, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (46, 44, 1, 75, 99, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (47, 44, 3, 99, 100, 1, 8)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (48, 44, 1, 96, 105, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (49, 44, 1, 96, 106, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (50, 44, 2, 74, 107, 0, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (51, 96, 1, 122, 125, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (52, 96, 1, 122, 124, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (53, 96, 1, 122, 126, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (54, 96, 1, 122, 142, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (55, 78, 2, 84, 147, 0, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (56, 78, 1, 84, 154, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (57, 78, 1, 84, 159, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (58, 78, 1, 82, 162, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (59, 78, 1, 83, 163, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (60, 96, 3, 128, 164, 1, 5)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (65, 114, 1, 180, 181, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (66, 114, 1, 180, 182, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (67, 114, 2, 180, 190, 0, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (68, 114, 1, 185, 191, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (69, 115, 2, 195, 199, 0, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (70, 115, 2, 198, 210, 0, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (71, 115, 2, 195, 201, 0, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (72, 115, 2, 195, 213, 0, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (73, 115, 1, 195, 214, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (74, 115, 1, 214, 215, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (75, 115, 2, 198, 200, 0, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (76, 115, 1, 209, 221, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (77, 44, 2, 75, 222, 0, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (81, 96, 2, 145, 234, 0, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (82, 96, 2, 234, 233, 0, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (83, 115, 1, 214, 235, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (84, 115, 1, 201, 236, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (85, 115, 1, 201, 237, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (88, 44, 2, 120, 250, 0, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (89, 44, 2, 97, 251, 0, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (90, 44, 1, 76, 256, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (91, 44, 1, 75, 261, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (92, 44, 2, 74, 267, 0, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (93, 117, 1, 238, 270, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (94, 117, 1, 238, 271, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (95, 117, 1, 271, 272, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (96, 117, 1, 271, 273, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (97, 117, 1, 271, 280, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (98, 115, 1, 215, 281, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (107, 119, 1, 291, 293, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (108, 119, 1, 291, 300, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (121, 119, 2, 293, 330, 0, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (122, 119, 2, 300, 331, 0, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (123, 119, 1, 330, 335, 1, 1)
SET IDENTITY_INSERT [dbo].[Relations] OFF
/****** Object:  Table [dbo].[FeatureSelections]    Script Date: 02/03/2012 02:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeatureSelections](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConfigurationID] [int] NOT NULL,
	[FeatureID] [int] NOT NULL,
	[SelectionStateID] [int] NOT NULL,
	[Disabled] [bit] NULL,
	[ToggledByUser] [bit] NULL,
 CONSTRAINT [PK_FeatureSelections] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupRelations_To_Features]    Script Date: 02/03/2012 02:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupRelations_To_Features](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GroupRelationID] [int] NOT NULL,
	[ParentFeatureID] [int] NOT NULL,
	[ChildFeatureID] [int] NOT NULL,
 CONSTRAINT [PK_GroupRelations_To_Features] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[GroupRelations_To_Features] ON
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (17, 15, 98, 101)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (18, 15, 98, 102)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (19, 15, 98, 103)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (20, 15, 98, 104)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (21, 16, 107, 110)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (22, 16, 107, 111)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (23, 16, 107, 112)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (24, 17, 77, 108)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (25, 17, 77, 109)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (26, 17, 77, 113)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (27, 17, 77, 114)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (28, 18, 94, 115)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (29, 18, 94, 116)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (30, 18, 94, 117)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (31, 19, 97, 118)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (32, 19, 97, 119)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (33, 20, 95, 120)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (34, 20, 95, 121)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (35, 21, 124, 134)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (36, 21, 124, 135)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (37, 21, 124, 136)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (38, 21, 124, 137)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (39, 22, 125, 140)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (40, 22, 125, 139)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (41, 22, 125, 138)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (42, 23, 126, 128)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (43, 23, 126, 141)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (44, 23, 126, 143)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (45, 24, 142, 144)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (46, 24, 142, 146)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (47, 24, 142, 145)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (48, 25, 147, 148)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (49, 25, 147, 149)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (50, 25, 147, 150)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (51, 25, 147, 151)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (52, 26, 147, 152)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (53, 26, 147, 153)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (54, 27, 154, 155)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (55, 27, 154, 156)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (56, 27, 154, 157)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (57, 27, 154, 158)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (58, 28, 159, 160)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (59, 28, 159, 161)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (64, 30, 78, 173)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (65, 30, 78, 172)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (66, 30, 78, 171)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (72, 33, 182, 185)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (73, 33, 182, 186)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (74, 33, 182, 183)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (75, 33, 182, 187)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (78, 35, 191, 188)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (79, 35, 191, 189)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (94, 40, 192, 195)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (95, 40, 192, 209)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (96, 40, 192, 198)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (97, 41, 210, 204)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (98, 41, 210, 203)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (99, 42, 213, 217)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (100, 42, 213, 216)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (101, 43, 209, 211)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (102, 43, 209, 212)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (103, 44, 200, 218)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (104, 44, 200, 219)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (105, 44, 200, 220)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (117, 49, 109, 253)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (118, 49, 109, 254)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (119, 49, 109, 252)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (120, 49, 109, 255)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (121, 50, 256, 257)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (122, 50, 256, 258)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (123, 50, 256, 259)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (124, 50, 256, 260)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (125, 51, 261, 265)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (126, 51, 261, 266)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (127, 52, 267, 268)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (128, 52, 267, 269)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (129, 53, 272, 274)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (130, 53, 272, 275)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (131, 53, 272, 276)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (132, 53, 272, 277)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (133, 54, 273, 278)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (134, 54, 273, 279)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (135, 55, 282, 283)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (136, 55, 282, 284)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (137, 55, 282, 285)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (138, 56, 284, 288)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (139, 56, 284, 289)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (140, 56, 284, 290)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (157, 62, 300, 332)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (158, 62, 300, 333)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (159, 62, 300, 334)
SET IDENTITY_INSERT [dbo].[GroupRelations_To_Features] OFF
/****** Object:  Table [dbo].[Attributes]    Script Date: 02/03/2012 02:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attributes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FeatureID] [int] NOT NULL,
	[AttributeTypeID] [int] NOT NULL,
	[DataTypeID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Attributes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Attributes] ON
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description]) VALUES (6, 122, 3, 1, N'Total Price', NULL)
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description]) VALUES (7, 74, 2, 1, N'Total Price', NULL)
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description]) VALUES (8, 124, 3, 1, N'New Attribute', NULL)
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description]) VALUES (11, 181, 3, 1, N'New Attribute', NULL)
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description]) VALUES (12, 181, 3, 1, N'Address', NULL)
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description]) VALUES (13, 211, 3, 1, N'Total Price', NULL)
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description]) VALUES (14, 74, 3, 1, N'Discount', NULL)
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description]) VALUES (15, 75, 2, 1, N'Perf. V', NULL)
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description]) VALUES (16, 107, 2, 1, N'Per month', NULL)
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description]) VALUES (17, 76, 2, 1, N'Monthly costs', NULL)
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description]) VALUES (18, 270, 3, 1, N'Currency', NULL)
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description]) VALUES (19, 270, 3, 1, N'Region', NULL)
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description]) VALUES (20, 270, 3, 1, N'Name', NULL)
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description]) VALUES (21, 280, 3, 1, N'HeightInCM', NULL)
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description]) VALUES (22, 192, 2, 1, N'Total Price', N'Price for company')
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description]) VALUES (23, 74, 3, 2, N'RequiresValidity', NULL)
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description]) VALUES (24, 107, 2, 2, N'Credit', NULL)
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description]) VALUES (25, 192, 3, 1, N'PostNumber', NULL)
SET IDENTITY_INSERT [dbo].[Attributes] OFF
/****** Object:  Table [dbo].[AttributeValues]    Script Date: 02/03/2012 02:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttributeValues](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FeatureSelectionID] [int] NOT NULL,
	[AttributeID] [int] NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AttributeValues] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Attributes_Attribute_DataTypes]    Script Date: 02/03/2012 02:39:44 ******/
ALTER TABLE [dbo].[Attributes]  WITH CHECK ADD  CONSTRAINT [FK_Attributes_Attribute_DataTypes] FOREIGN KEY([DataTypeID])
REFERENCES [dbo].[Attribute_DataTypes] ([ID])
GO
ALTER TABLE [dbo].[Attributes] CHECK CONSTRAINT [FK_Attributes_Attribute_DataTypes]
GO
/****** Object:  ForeignKey [FK_Attributes_Attribute_Types]    Script Date: 02/03/2012 02:39:44 ******/
ALTER TABLE [dbo].[Attributes]  WITH CHECK ADD  CONSTRAINT [FK_Attributes_Attribute_Types] FOREIGN KEY([AttributeTypeID])
REFERENCES [dbo].[Attribute_Types] ([ID])
GO
ALTER TABLE [dbo].[Attributes] CHECK CONSTRAINT [FK_Attributes_Attribute_Types]
GO
/****** Object:  ForeignKey [FK_Attributes_Features]    Script Date: 02/03/2012 02:39:44 ******/
ALTER TABLE [dbo].[Attributes]  WITH CHECK ADD  CONSTRAINT [FK_Attributes_Features] FOREIGN KEY([FeatureID])
REFERENCES [dbo].[Features] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Attributes] CHECK CONSTRAINT [FK_Attributes_Features]
GO
/****** Object:  ForeignKey [FK_AttributeValues_Attributes]    Script Date: 02/03/2012 02:39:44 ******/
ALTER TABLE [dbo].[AttributeValues]  WITH NOCHECK ADD  CONSTRAINT [FK_AttributeValues_Attributes] FOREIGN KEY([AttributeID])
REFERENCES [dbo].[Attributes] ([ID])
GO
ALTER TABLE [dbo].[AttributeValues] NOCHECK CONSTRAINT [FK_AttributeValues_Attributes]
GO
/****** Object:  ForeignKey [FK_AttributeValues_FeatureSelections]    Script Date: 02/03/2012 02:39:44 ******/
ALTER TABLE [dbo].[AttributeValues]  WITH CHECK ADD  CONSTRAINT [FK_AttributeValues_FeatureSelections] FOREIGN KEY([FeatureSelectionID])
REFERENCES [dbo].[FeatureSelections] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AttributeValues] CHECK CONSTRAINT [FK_AttributeValues_FeatureSelections]
GO
/****** Object:  ForeignKey [FK_CompositionRules_CompositionRule_Types]    Script Date: 02/03/2012 02:39:44 ******/
ALTER TABLE [dbo].[CompositionRules]  WITH CHECK ADD  CONSTRAINT [FK_CompositionRules_CompositionRule_Types] FOREIGN KEY([CompositionRuleTypeID])
REFERENCES [dbo].[CompositionRule_Types] ([ID])
GO
ALTER TABLE [dbo].[CompositionRules] CHECK CONSTRAINT [FK_CompositionRules_CompositionRule_Types]
GO
/****** Object:  ForeignKey [FK_CompositionRules_Models]    Script Date: 02/03/2012 02:39:44 ******/
ALTER TABLE [dbo].[CompositionRules]  WITH CHECK ADD  CONSTRAINT [FK_CompositionRules_Models] FOREIGN KEY([ModelID])
REFERENCES [dbo].[Models] ([ID])
GO
ALTER TABLE [dbo].[CompositionRules] CHECK CONSTRAINT [FK_CompositionRules_Models]
GO
/****** Object:  ForeignKey [FK_Configurations_Models]    Script Date: 02/03/2012 02:39:44 ******/
ALTER TABLE [dbo].[Configurations]  WITH CHECK ADD  CONSTRAINT [FK_Configurations_Models] FOREIGN KEY([ModelID])
REFERENCES [dbo].[Models] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Configurations] CHECK CONSTRAINT [FK_Configurations_Models]
GO
/****** Object:  ForeignKey [FK_Rules_Models]    Script Date: 02/03/2012 02:39:44 ******/
ALTER TABLE [dbo].[CustomRules]  WITH CHECK ADD  CONSTRAINT [FK_Rules_Models] FOREIGN KEY([ModelID])
REFERENCES [dbo].[Models] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CustomRules] CHECK CONSTRAINT [FK_Rules_Models]
GO
/****** Object:  ForeignKey [FK_Features_Models]    Script Date: 02/03/2012 02:39:44 ******/
ALTER TABLE [dbo].[Features]  WITH CHECK ADD  CONSTRAINT [FK_Features_Models] FOREIGN KEY([ModelID])
REFERENCES [dbo].[Models] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Features] CHECK CONSTRAINT [FK_Features_Models]
GO
/****** Object:  ForeignKey [FK_FeatureSelections_Configurations]    Script Date: 02/03/2012 02:39:44 ******/
ALTER TABLE [dbo].[FeatureSelections]  WITH CHECK ADD  CONSTRAINT [FK_FeatureSelections_Configurations] FOREIGN KEY([ConfigurationID])
REFERENCES [dbo].[Configurations] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FeatureSelections] CHECK CONSTRAINT [FK_FeatureSelections_Configurations]
GO
/****** Object:  ForeignKey [FK_FeatureSelections_SelectionStates]    Script Date: 02/03/2012 02:39:44 ******/
ALTER TABLE [dbo].[FeatureSelections]  WITH CHECK ADD  CONSTRAINT [FK_FeatureSelections_SelectionStates] FOREIGN KEY([SelectionStateID])
REFERENCES [dbo].[SelectionStates] ([ID])
GO
ALTER TABLE [dbo].[FeatureSelections] CHECK CONSTRAINT [FK_FeatureSelections_SelectionStates]
GO
/****** Object:  ForeignKey [FK_FeatureGroups_Models]    Script Date: 02/03/2012 02:39:44 ******/
ALTER TABLE [dbo].[GroupRelations]  WITH CHECK ADD  CONSTRAINT [FK_FeatureGroups_Models] FOREIGN KEY([ModelID])
REFERENCES [dbo].[Models] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GroupRelations] CHECK CONSTRAINT [FK_FeatureGroups_Models]
GO
/****** Object:  ForeignKey [FK_GroupRelations_GroupRelation_Types]    Script Date: 02/03/2012 02:39:44 ******/
ALTER TABLE [dbo].[GroupRelations]  WITH CHECK ADD  CONSTRAINT [FK_GroupRelations_GroupRelation_Types] FOREIGN KEY([GroupRelationTypeID])
REFERENCES [dbo].[GroupRelation_Types] ([ID])
GO
ALTER TABLE [dbo].[GroupRelations] CHECK CONSTRAINT [FK_GroupRelations_GroupRelation_Types]
GO
/****** Object:  ForeignKey [FK_GroupRelations_To_Features_Features]    Script Date: 02/03/2012 02:39:44 ******/
ALTER TABLE [dbo].[GroupRelations_To_Features]  WITH NOCHECK ADD  CONSTRAINT [FK_GroupRelations_To_Features_Features] FOREIGN KEY([ParentFeatureID])
REFERENCES [dbo].[Features] ([ID])
GO
ALTER TABLE [dbo].[GroupRelations_To_Features] NOCHECK CONSTRAINT [FK_GroupRelations_To_Features_Features]
GO
/****** Object:  ForeignKey [FK_GroupRelations_To_Features_GroupRelations]    Script Date: 02/03/2012 02:39:44 ******/
ALTER TABLE [dbo].[GroupRelations_To_Features]  WITH CHECK ADD  CONSTRAINT [FK_GroupRelations_To_Features_GroupRelations] FOREIGN KEY([GroupRelationID])
REFERENCES [dbo].[GroupRelations] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GroupRelations_To_Features] CHECK CONSTRAINT [FK_GroupRelations_To_Features_GroupRelations]
GO
/****** Object:  ForeignKey [FK_Models_Users]    Script Date: 02/03/2012 02:39:44 ******/
ALTER TABLE [dbo].[Models]  WITH CHECK ADD  CONSTRAINT [FK_Models_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Models] CHECK CONSTRAINT [FK_Models_Users]
GO
/****** Object:  ForeignKey [FK_Relations_Models]    Script Date: 02/03/2012 02:39:44 ******/
ALTER TABLE [dbo].[Relations]  WITH CHECK ADD  CONSTRAINT [FK_Relations_Models] FOREIGN KEY([ModelID])
REFERENCES [dbo].[Models] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Relations] CHECK CONSTRAINT [FK_Relations_Models]
GO
/****** Object:  ForeignKey [FK_Relations_Relation_Types]    Script Date: 02/03/2012 02:39:44 ******/
ALTER TABLE [dbo].[Relations]  WITH CHECK ADD  CONSTRAINT [FK_Relations_Relation_Types] FOREIGN KEY([RelationTypeID])
REFERENCES [dbo].[Relation_Types] ([ID])
GO
ALTER TABLE [dbo].[Relations] CHECK CONSTRAINT [FK_Relations_Relation_Types]
GO
