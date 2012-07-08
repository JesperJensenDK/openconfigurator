﻿/*
Deployment script for OpenConfigurator_TEST
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, NUMERIC_ROUNDABORT, QUOTED_IDENTIFIER OFF;


GO
:setvar DatabaseName "OpenConfigurator_TEST"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\"

GO
USE [master]

GO
:on error exit
GO
IF (DB_ID(N'$(DatabaseName)') IS NOT NULL
    AND DATABASEPROPERTYEX(N'$(DatabaseName)','Status') <> N'ONLINE')
BEGIN
    RAISERROR(N'The state of the target database, %s, is not set to ONLINE. To deploy to this database, its state must be set to ONLINE.', 16, 127,N'$(DatabaseName)') WITH NOWAIT
    RETURN
END

GO
IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creating $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [OpenConfigurator_TEST], FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\OpenConfigurator_TEST.mdf', SIZE = 3072 KB, FILEGROWTH = 1024 KB)
    LOG ON (NAME = [OpenConfigurator_TEST_log], FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\OpenConfigurator_TEST_log.ldf', SIZE = 1024 KB, MAXSIZE = 2097152 MB, FILEGROWTH = 10 %) COLLATE Danish_Norwegian_CI_AS
GO
EXECUTE sp_dbcmptlevel [$(DatabaseName)], 100;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS OFF,
                ANSI_PADDING OFF,
                ANSI_WARNINGS OFF,
                ARITHABORT OFF,
                CONCAT_NULL_YIELDS_NULL OFF,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER OFF,
                ANSI_NULL_DEFAULT OFF,
                CURSOR_DEFAULT GLOBAL,
                RECOVERY FULL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY CHECKSUM,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
USE [$(DatabaseName)]

GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
/*
 Pre-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be executed before the build script.	
 Use SQLCMD syntax to include a file in the pre-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the pre-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

GO
PRINT N'Creating [opencon_radu1984]...';


GO
CREATE USER [opencon_radu1984] WITHOUT LOGIN;


GO
PRINT N'Creating <unnamed>...';


GO
EXECUTE sp_addrolemember @rolename = N'db_datareader', @membername = N'opencon_radu1984';


GO
PRINT N'Creating <unnamed>...';


GO
EXECUTE sp_addrolemember @rolename = N'db_datawriter', @membername = N'opencon_radu1984';


GO
PRINT N'Creating <unnamed>...';


GO
EXECUTE sp_addrolemember @rolename = N'db_owner', @membername = N'opencon_radu1984';


GO
PRINT N'Creating [dbo].[Attribute_DataTypes]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
CREATE TABLE [dbo].[Attribute_DataTypes] (
    [ID]   INT           IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (50) NULL
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
PRINT N'Creating PK_Attribute_DataTypes...';


GO
ALTER TABLE [dbo].[Attribute_DataTypes]
    ADD CONSTRAINT [PK_Attribute_DataTypes] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[Attribute_Types]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
CREATE TABLE [dbo].[Attribute_Types] (
    [ID]   INT           IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (50) NULL
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
PRINT N'Creating PK_Attribute_Types...';


GO
ALTER TABLE [dbo].[Attribute_Types]
    ADD CONSTRAINT [PK_Attribute_Types] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[Attributes]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
CREATE TABLE [dbo].[Attributes] (
    [ID]              INT            IDENTITY (1, 1) NOT NULL,
    [FeatureID]       INT            NOT NULL,
    [AttributeTypeID] INT            NOT NULL,
    [DataTypeID]      INT            NOT NULL,
    [Name]            NVARCHAR (50)  NULL,
    [Description]     NVARCHAR (MAX) NULL,
    [ConstantValue]   NVARCHAR (50)  NULL
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
PRINT N'Creating PK_Attributes...';


GO
ALTER TABLE [dbo].[Attributes]
    ADD CONSTRAINT [PK_Attributes] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[AttributeValues]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
CREATE TABLE [dbo].[AttributeValues] (
    [ID]                 INT            IDENTITY (1, 1) NOT NULL,
    [FeatureSelectionID] INT            NOT NULL,
    [AttributeID]        INT            NOT NULL,
    [Value]              NVARCHAR (MAX) NULL
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
PRINT N'Creating PK_AttributeValues...';


GO
ALTER TABLE [dbo].[AttributeValues]
    ADD CONSTRAINT [PK_AttributeValues] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[CompositionRule_Types]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
CREATE TABLE [dbo].[CompositionRule_Types] (
    [ID]   INT           IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (50) NOT NULL
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
PRINT N'Creating PK_CompositionRule_Types...';


GO
ALTER TABLE [dbo].[CompositionRule_Types]
    ADD CONSTRAINT [PK_CompositionRule_Types] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[CompositionRules]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
CREATE TABLE [dbo].[CompositionRules] (
    [ID]                    INT            IDENTITY (1, 1) NOT NULL,
    [ModelID]               INT            NOT NULL,
    [CompositionRuleTypeID] INT            NOT NULL,
    [FirstFeatureID]        INT            NOT NULL,
    [SecondFeatureID]       INT            NOT NULL,
    [Name]                  NVARCHAR (50)  NULL,
    [Description]           NVARCHAR (MAX) NULL
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
PRINT N'Creating PK_CompositionRules...';


GO
ALTER TABLE [dbo].[CompositionRules]
    ADD CONSTRAINT [PK_CompositionRules] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[Configurations]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
CREATE TABLE [dbo].[Configurations] (
    [ID]               INT           IDENTITY (1, 1) NOT NULL,
    [ModelID]          INT           NOT NULL,
    [Name]             NVARCHAR (50) NULL,
    [CreatedDate]      DATETIME      NULL,
    [LastModifiedDate] DATETIME      NULL
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
PRINT N'Creating PK_Configurations...';


GO
ALTER TABLE [dbo].[Configurations]
    ADD CONSTRAINT [PK_Configurations] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[CustomRule_Types]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
CREATE TABLE [dbo].[CustomRule_Types] (
    [ID]   INT           IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (50) NULL
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
PRINT N'Creating PK_Rule_Types...';


GO
ALTER TABLE [dbo].[CustomRule_Types]
    ADD CONSTRAINT [PK_Rule_Types] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[CustomRules]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
CREATE TABLE [dbo].[CustomRules] (
    [ID]          INT            IDENTITY (1, 1) NOT NULL,
    [ModelID]     INT            NOT NULL,
    [Name]        NVARCHAR (50)  NULL,
    [Expression]  NVARCHAR (MAX) NULL,
    [Description] NVARCHAR (MAX) NULL
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
PRINT N'Creating PK_Rules...';


GO
ALTER TABLE [dbo].[CustomRules]
    ADD CONSTRAINT [PK_Rules] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[Features]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
CREATE TABLE [dbo].[Features] (
    [ID]          INT            IDENTITY (1, 1) NOT NULL,
    [ModelID]     INT            NOT NULL,
    [Name]        NVARCHAR (50)  NULL,
    [Description] NVARCHAR (MAX) NULL,
    [IsRoot]      BIT            NULL,
    [XPos]        FLOAT          NULL,
    [YPos]        FLOAT          NULL
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
PRINT N'Creating PK_Features...';


GO
ALTER TABLE [dbo].[Features]
    ADD CONSTRAINT [PK_Features] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[FeatureSelections]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
CREATE TABLE [dbo].[FeatureSelections] (
    [ID]               INT IDENTITY (1, 1) NOT NULL,
    [ConfigurationID]  INT NOT NULL,
    [FeatureID]        INT NOT NULL,
    [SelectionStateID] INT NOT NULL,
    [Disabled]         BIT NULL,
    [ToggledByUser]    BIT NULL
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
PRINT N'Creating PK_FeatureSelections...';


GO
ALTER TABLE [dbo].[FeatureSelections]
    ADD CONSTRAINT [PK_FeatureSelections] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[GroupRelation_Types]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
CREATE TABLE [dbo].[GroupRelation_Types] (
    [ID]              INT           IDENTITY (1, 1) NOT NULL,
    [Name]            NVARCHAR (50) NULL,
    [FixedLowerBound] INT           NULL,
    [FixedUpperBound] INT           NULL
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
PRINT N'Creating PK_FeatureGroup_Types...';


GO
ALTER TABLE [dbo].[GroupRelation_Types]
    ADD CONSTRAINT [PK_FeatureGroup_Types] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[GroupRelations]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
CREATE TABLE [dbo].[GroupRelations] (
    [ID]                  INT IDENTITY (1, 1) NOT NULL,
    [ModelID]             INT NOT NULL,
    [GroupRelationTypeID] INT NOT NULL,
    [LowerBound]          INT NULL,
    [UpperBound]          INT NULL
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
PRINT N'Creating PK_FeatureGroups...';


GO
ALTER TABLE [dbo].[GroupRelations]
    ADD CONSTRAINT [PK_FeatureGroups] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[GroupRelations_To_Features]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
CREATE TABLE [dbo].[GroupRelations_To_Features] (
    [ID]              INT IDENTITY (1, 1) NOT NULL,
    [GroupRelationID] INT NOT NULL,
    [ParentFeatureID] INT NOT NULL,
    [ChildFeatureID]  INT NOT NULL
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
PRINT N'Creating PK_GroupRelations_To_Features...';


GO
ALTER TABLE [dbo].[GroupRelations_To_Features]
    ADD CONSTRAINT [PK_GroupRelations_To_Features] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[Models]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
CREATE TABLE [dbo].[Models] (
    [ID]               INT           IDENTITY (1, 1) NOT NULL,
    [UserID]           INT           NOT NULL,
    [Name]             NVARCHAR (50) NULL,
    [CreatedDate]      DATETIME      NULL,
    [LastModifiedDate] DATETIME      NULL
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
PRINT N'Creating PK_Models...';


GO
ALTER TABLE [dbo].[Models]
    ADD CONSTRAINT [PK_Models] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[Relation_Types]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
CREATE TABLE [dbo].[Relation_Types] (
    [ID]              INT           IDENTITY (1, 1) NOT NULL,
    [Name]            NVARCHAR (50) NULL,
    [FixedLowerBound] INT           NULL,
    [FixedUpperBound] INT           NULL
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
PRINT N'Creating PK_Feature_Types...';


GO
ALTER TABLE [dbo].[Relation_Types]
    ADD CONSTRAINT [PK_Feature_Types] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[Relations]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
CREATE TABLE [dbo].[Relations] (
    [ID]              INT IDENTITY (1, 1) NOT NULL,
    [ModelID]         INT NOT NULL,
    [RelationTypeID]  INT NOT NULL,
    [ParentFeatureID] INT NOT NULL,
    [ChildFeatureID]  INT NOT NULL,
    [LowerBound]      INT NULL,
    [UpperBound]      INT NULL
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
PRINT N'Creating PK_Relations...';


GO
ALTER TABLE [dbo].[Relations]
    ADD CONSTRAINT [PK_Relations] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[SelectionStates]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
CREATE TABLE [dbo].[SelectionStates] (
    [ID]   INT           IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (50) NOT NULL
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
PRINT N'Creating PK_SelectionStates...';


GO
ALTER TABLE [dbo].[SelectionStates]
    ADD CONSTRAINT [PK_SelectionStates] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[Users]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
CREATE TABLE [dbo].[Users] (
    [ID]       INT           IDENTITY (1, 1) NOT NULL,
    [Email]    NVARCHAR (50) NULL,
    [Password] NVARCHAR (50) NULL
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
PRINT N'Creating PK_Users...';


GO
ALTER TABLE [dbo].[Users]
    ADD CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating FK_Attributes_Attribute_DataTypes...';


GO
ALTER TABLE [dbo].[Attributes] WITH NOCHECK
    ADD CONSTRAINT [FK_Attributes_Attribute_DataTypes] FOREIGN KEY ([DataTypeID]) REFERENCES [dbo].[Attribute_DataTypes] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_Attributes_Attribute_Types...';


GO
ALTER TABLE [dbo].[Attributes] WITH NOCHECK
    ADD CONSTRAINT [FK_Attributes_Attribute_Types] FOREIGN KEY ([AttributeTypeID]) REFERENCES [dbo].[Attribute_Types] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_Attributes_Features...';


GO
ALTER TABLE [dbo].[Attributes] WITH NOCHECK
    ADD CONSTRAINT [FK_Attributes_Features] FOREIGN KEY ([FeatureID]) REFERENCES [dbo].[Features] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Creating FK_AttributeValues_Attributes...';


GO
ALTER TABLE [dbo].[AttributeValues] WITH NOCHECK
    ADD CONSTRAINT [FK_AttributeValues_Attributes] FOREIGN KEY ([AttributeID]) REFERENCES [dbo].[Attributes] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
ALTER TABLE [dbo].[AttributeValues] NOCHECK CONSTRAINT [FK_AttributeValues_Attributes];


GO
PRINT N'Creating FK_AttributeValues_FeatureSelections...';


GO
ALTER TABLE [dbo].[AttributeValues] WITH NOCHECK
    ADD CONSTRAINT [FK_AttributeValues_FeatureSelections] FOREIGN KEY ([FeatureSelectionID]) REFERENCES [dbo].[FeatureSelections] ([ID]) ON DELETE CASCADE ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_CompositionRules_CompositionRule_Types...';


GO
ALTER TABLE [dbo].[CompositionRules] WITH NOCHECK
    ADD CONSTRAINT [FK_CompositionRules_CompositionRule_Types] FOREIGN KEY ([CompositionRuleTypeID]) REFERENCES [dbo].[CompositionRule_Types] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_CompositionRules_Models...';


GO
ALTER TABLE [dbo].[CompositionRules] WITH NOCHECK
    ADD CONSTRAINT [FK_CompositionRules_Models] FOREIGN KEY ([ModelID]) REFERENCES [dbo].[Models] ([ID]) ON DELETE CASCADE ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_Configurations_Models...';


GO
ALTER TABLE [dbo].[Configurations] WITH NOCHECK
    ADD CONSTRAINT [FK_Configurations_Models] FOREIGN KEY ([ModelID]) REFERENCES [dbo].[Models] ([ID]) ON DELETE CASCADE ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_Rules_Models...';


GO
ALTER TABLE [dbo].[CustomRules] WITH NOCHECK
    ADD CONSTRAINT [FK_Rules_Models] FOREIGN KEY ([ModelID]) REFERENCES [dbo].[Models] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Creating FK_Features_Models...';


GO
ALTER TABLE [dbo].[Features] WITH NOCHECK
    ADD CONSTRAINT [FK_Features_Models] FOREIGN KEY ([ModelID]) REFERENCES [dbo].[Models] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Creating FK_FeatureSelections_Configurations...';


GO
ALTER TABLE [dbo].[FeatureSelections] WITH NOCHECK
    ADD CONSTRAINT [FK_FeatureSelections_Configurations] FOREIGN KEY ([ConfigurationID]) REFERENCES [dbo].[Configurations] ([ID]) ON DELETE CASCADE ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_FeatureSelections_SelectionStates...';


GO
ALTER TABLE [dbo].[FeatureSelections] WITH NOCHECK
    ADD CONSTRAINT [FK_FeatureSelections_SelectionStates] FOREIGN KEY ([SelectionStateID]) REFERENCES [dbo].[SelectionStates] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_FeatureGroups_Models...';


GO
ALTER TABLE [dbo].[GroupRelations] WITH NOCHECK
    ADD CONSTRAINT [FK_FeatureGroups_Models] FOREIGN KEY ([ModelID]) REFERENCES [dbo].[Models] ([ID]) ON DELETE CASCADE ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_GroupRelations_GroupRelation_Types...';


GO
ALTER TABLE [dbo].[GroupRelations] WITH NOCHECK
    ADD CONSTRAINT [FK_GroupRelations_GroupRelation_Types] FOREIGN KEY ([GroupRelationTypeID]) REFERENCES [dbo].[GroupRelation_Types] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_GroupRelations_To_Features_Features...';


GO
ALTER TABLE [dbo].[GroupRelations_To_Features] WITH NOCHECK
    ADD CONSTRAINT [FK_GroupRelations_To_Features_Features] FOREIGN KEY ([ParentFeatureID]) REFERENCES [dbo].[Features] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
ALTER TABLE [dbo].[GroupRelations_To_Features] NOCHECK CONSTRAINT [FK_GroupRelations_To_Features_Features];


GO
PRINT N'Creating FK_GroupRelations_To_Features_GroupRelations...';


GO
ALTER TABLE [dbo].[GroupRelations_To_Features] WITH NOCHECK
    ADD CONSTRAINT [FK_GroupRelations_To_Features_GroupRelations] FOREIGN KEY ([GroupRelationID]) REFERENCES [dbo].[GroupRelations] ([ID]) ON DELETE CASCADE ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_Models_Users...';


GO
ALTER TABLE [dbo].[Models] WITH NOCHECK
    ADD CONSTRAINT [FK_Models_Users] FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Creating FK_Relations_Models...';


GO
ALTER TABLE [dbo].[Relations] WITH NOCHECK
    ADD CONSTRAINT [FK_Relations_Models] FOREIGN KEY ([ModelID]) REFERENCES [dbo].[Models] ([ID]) ON DELETE CASCADE ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_Relations_Relation_Types...';


GO
ALTER TABLE [dbo].[Relations] WITH NOCHECK
    ADD CONSTRAINT [FK_Relations_Relation_Types] FOREIGN KEY ([RelationTypeID]) REFERENCES [dbo].[Relation_Types] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
-- Refactoring step to update target server with deployed transaction logs
CREATE TABLE  [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
GO
sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
GO

GO
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

USE [OpenConfigurator_TEST]
GO
/****** Object:  Table [dbo].[Attribute_Types]    Script Date: 06/21/2012 00:06:39 ******/
SET IDENTITY_INSERT [dbo].[Attribute_Types] ON
INSERT [dbo].[Attribute_Types] ([ID], [Name]) VALUES (1, N'Constant')
INSERT [dbo].[Attribute_Types] ([ID], [Name]) VALUES (2, N'Dynamic')
INSERT [dbo].[Attribute_Types] ([ID], [Name]) VALUES (3, N'UserInput')
SET IDENTITY_INSERT [dbo].[Attribute_Types] OFF
/****** Object:  Table [dbo].[Attribute_DataTypes]    Script Date: 06/21/2012 00:06:39 ******/
SET IDENTITY_INSERT [dbo].[Attribute_DataTypes] ON
INSERT [dbo].[Attribute_DataTypes] ([ID], [Name]) VALUES (1, N'Integer')
INSERT [dbo].[Attribute_DataTypes] ([ID], [Name]) VALUES (2, N'Boolean')
INSERT [dbo].[Attribute_DataTypes] ([ID], [Name]) VALUES (3, N'String')
SET IDENTITY_INSERT [dbo].[Attribute_DataTypes] OFF
/****** Object:  Table [dbo].[CompositionRule_Types]    Script Date: 06/21/2012 00:06:39 ******/
SET IDENTITY_INSERT [dbo].[CompositionRule_Types] ON
INSERT [dbo].[CompositionRule_Types] ([ID], [Name]) VALUES (1, N'Dependency')
INSERT [dbo].[CompositionRule_Types] ([ID], [Name]) VALUES (2, N'Mutual Dependency')
INSERT [dbo].[CompositionRule_Types] ([ID], [Name]) VALUES (3, N'Mutual Exclusion')
SET IDENTITY_INSERT [dbo].[CompositionRule_Types] OFF
/****** Object:  Table [dbo].[CustomRule_Types]    Script Date: 06/21/2012 00:06:39 ******/
SET IDENTITY_INSERT [dbo].[CustomRule_Types] ON
INSERT [dbo].[CustomRule_Types] ([ID], [Name]) VALUES (1, N'Composition Rules')
INSERT [dbo].[CustomRule_Types] ([ID], [Name]) VALUES (2, N'Consequence Rules')
INSERT [dbo].[CustomRule_Types] ([ID], [Name]) VALUES (3, N'Global Constraints')
SET IDENTITY_INSERT [dbo].[CustomRule_Types] OFF
/****** Object:  Table [dbo].[GroupRelation_Types]    Script Date: 06/21/2012 00:06:39 ******/
SET IDENTITY_INSERT [dbo].[GroupRelation_Types] ON
INSERT [dbo].[GroupRelation_Types] ([ID], [Name], [FixedLowerBound], [FixedUpperBound]) VALUES (1, N'OR', 1, NULL)
INSERT [dbo].[GroupRelation_Types] ([ID], [Name], [FixedLowerBound], [FixedUpperBound]) VALUES (2, N'XOR', 1, 1)
INSERT [dbo].[GroupRelation_Types] ([ID], [Name], [FixedLowerBound], [FixedUpperBound]) VALUES (3, N'Custom OR', NULL, NULL)
SET IDENTITY_INSERT [dbo].[GroupRelation_Types] OFF
/****** Object:  Table [dbo].[Users]    Script Date: 06/21/2012 00:06:39 ******/
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([ID], [Email], [Password]) VALUES (1, N'Radu', N'hej123!')
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Table [dbo].[SelectionStates]    Script Date: 06/21/2012 00:06:39 ******/
SET IDENTITY_INSERT [dbo].[SelectionStates] ON
INSERT [dbo].[SelectionStates] ([ID], [Name]) VALUES (1, N'Selected')
INSERT [dbo].[SelectionStates] ([ID], [Name]) VALUES (2, N'Deselected')
INSERT [dbo].[SelectionStates] ([ID], [Name]) VALUES (3, N'Unselected')
SET IDENTITY_INSERT [dbo].[SelectionStates] OFF
/****** Object:  Table [dbo].[Relation_Types]    Script Date: 06/21/2012 00:06:39 ******/
SET IDENTITY_INSERT [dbo].[Relation_Types] ON
INSERT [dbo].[Relation_Types] ([ID], [Name], [FixedLowerBound], [FixedUpperBound]) VALUES (1, N'Mandatory', 1, 1)
INSERT [dbo].[Relation_Types] ([ID], [Name], [FixedLowerBound], [FixedUpperBound]) VALUES (2, N'Optional', 0, 1)
INSERT [dbo].[Relation_Types] ([ID], [Name], [FixedLowerBound], [FixedUpperBound]) VALUES (3, N'Cloneable', 0, NULL)
SET IDENTITY_INSERT [dbo].[Relation_Types] OFF
/****** Object:  Table [dbo].[Models]    Script Date: 06/21/2012 00:06:39 ******/
SET IDENTITY_INSERT [dbo].[Models] ON
INSERT [dbo].[Models] ([ID], [UserID], [Name], [CreatedDate], [LastModifiedDate]) VALUES (44, 1, N'Laptop model', CAST(0x00009F8B01446AE7 AS DateTime), CAST(0x00009FF5011AD984 AS DateTime))
INSERT [dbo].[Models] ([ID], [UserID], [Name], [CreatedDate], [LastModifiedDate]) VALUES (78, 1, N'Bicycle model', CAST(0x00009F8E00B08A24 AS DateTime), CAST(0x00009FE40030D823 AS DateTime))
INSERT [dbo].[Models] ([ID], [UserID], [Name], [CreatedDate], [LastModifiedDate]) VALUES (96, 1, N'Vacation model', CAST(0x00009F9000D1D848 AS DateTime), CAST(0x00009FD6004039AD AS DateTime))
INSERT [dbo].[Models] ([ID], [UserID], [Name], [CreatedDate], [LastModifiedDate]) VALUES (114, 1, N'Insurance', CAST(0x00009FD10022D751 AS DateTime), CAST(0x00009FD1002EC937 AS DateTime))
INSERT [dbo].[Models] ([ID], [UserID], [Name], [CreatedDate], [LastModifiedDate]) VALUES (115, 1, N'IT Services Model', CAST(0x00009FD1017A7B05 AS DateTime), CAST(0x00009FE401714B89 AS DateTime))
INSERT [dbo].[Models] ([ID], [UserID], [Name], [CreatedDate], [LastModifiedDate]) VALUES (117, 1, N'Configit Bike', CAST(0x00009FD80103D779 AS DateTime), CAST(0x00009FD900A8AE94 AS DateTime))
INSERT [dbo].[Models] ([ID], [UserID], [Name], [CreatedDate], [LastModifiedDate]) VALUES (118, 1, N'Catering Firma', CAST(0x00009FDA00D1D3D6 AS DateTime), CAST(0x00009FE20011AF85 AS DateTime))
INSERT [dbo].[Models] ([ID], [UserID], [Name], [CreatedDate], [LastModifiedDate]) VALUES (119, 1, N'Test Model', CAST(0x00009FE401678D12 AS DateTime), CAST(0x00009FF7012D0B1E AS DateTime))
INSERT [dbo].[Models] ([ID], [UserID], [Name], [CreatedDate], [LastModifiedDate]) VALUES (122, 1, N'Demo Scenario', CAST(0x00009FFA00C36946 AS DateTime), CAST(0x00009FFB0000CBB1 AS DateTime))
SET IDENTITY_INSERT [dbo].[Models] OFF
/****** Object:  Table [dbo].[GroupRelations]    Script Date: 06/21/2012 00:06:39 ******/
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
INSERT [dbo].[GroupRelations] ([ID], [ModelID], [GroupRelationTypeID], [LowerBound], [UpperBound]) VALUES (67, 119, 2, 1, 1)
INSERT [dbo].[GroupRelations] ([ID], [ModelID], [GroupRelationTypeID], [LowerBound], [UpperBound]) VALUES (68, 119, 1, 1, 1)
INSERT [dbo].[GroupRelations] ([ID], [ModelID], [GroupRelationTypeID], [LowerBound], [UpperBound]) VALUES (69, 119, 2, 1, 1)
INSERT [dbo].[GroupRelations] ([ID], [ModelID], [GroupRelationTypeID], [LowerBound], [UpperBound]) VALUES (70, 119, 1, 1, 1)
INSERT [dbo].[GroupRelations] ([ID], [ModelID], [GroupRelationTypeID], [LowerBound], [UpperBound]) VALUES (71, 122, 1, 0, 1)
INSERT [dbo].[GroupRelations] ([ID], [ModelID], [GroupRelationTypeID], [LowerBound], [UpperBound]) VALUES (72, 122, 2, 1, 1)
SET IDENTITY_INSERT [dbo].[GroupRelations] OFF
/****** Object:  Table [dbo].[Features]    Script Date: 06/21/2012 00:06:39 ******/
SET IDENTITY_INSERT [dbo].[Features] ON
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (74, 44, N'Laptop', NULL, NULL, 1088.5, 10.5)
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
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (106, 44, N'Microsoft Mouse', NULL, NULL, 884.5, 803.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (107, 44, N'Insurance', NULL, NULL, 1091.5, 231.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (108, 44, N'Windows XP', NULL, NULL, 1204.5, 841.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (109, 44, N'Windows 7', NULL, NULL, 1307.5, 844.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (110, 44, N'Complete', NULL, NULL, 1045.5, 457.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (111, 44, N'Damage', NULL, NULL, 1176.5, 466.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (112, 44, N'Theft', NULL, NULL, 1295.5, 457.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (113, 44, N'Windows Vista', NULL, NULL, 1423.5, 849.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (114, 44, N'Linux Debian', NULL, NULL, 1536.5, 845.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (115, 44, N'Samsung 19"', NULL, NULL, 991.5, 723.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (116, 44, N'Sony 25"', NULL, NULL, 1075.5, 775.5)
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
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (291, 119, N'3G Services', NULL, NULL, 618.5, 0.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (300, 119, N'Mobile ', NULL, NULL, 422.5, 185.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (343, 119, N'Mobile Phones', NULL, NULL, 226.5, 387.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (344, 119, N'Subscription Plan', NULL, NULL, 616.5, 451.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (345, 119, N'Broadband net', NULL, NULL, 867.5, 453.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (346, 119, N'ISP services', NULL, NULL, 789.5, 236.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (347, 119, N'USB mobile net', NULL, NULL, 992.5, 405.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (348, 119, N'Sony x200', NULL, NULL, 59.5, 574.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (349, 119, N'Iphone 4', NULL, NULL, 156.5, 618.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (350, 119, N'Samsung Galaxy 2', NULL, NULL, 279.5, 622.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (351, 119, N'HTC', NULL, NULL, 356.5, 579.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (352, 119, N'Base plan', NULL, NULL, 547.5, 601.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (353, 119, N'Extra packages', NULL, NULL, 788.5, 594.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (354, 119, N'3MiniBasis', NULL, NULL, 387.5, 837.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (355, 119, N'3MediumBasis', NULL, NULL, 516.5, 855.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (356, 119, N'3MaxBasis', NULL, NULL, 647.5, 832.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (357, 119, N'Extra data/month', NULL, NULL, 717.5, 873.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (358, 119, N'Extra minutes/month', NULL, NULL, 801.5, 912.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (359, 119, N'Foreign calls disc.', NULL, NULL, 877.5, 872.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (360, 122, N'HIS', NULL, NULL, 316.5, 6.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (361, 122, N'Supervision Sys.', NULL, NULL, 94.5, 191.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (362, 122, N'Control', NULL, NULL, 320.5, 188.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (363, 122, N'Services', NULL, NULL, 605.5, 179.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (364, 122, N'Fire', NULL, NULL, -1.5, 336.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (365, 122, N'Intrusion', NULL, NULL, 58.5, 378.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (366, 122, N'Flood', NULL, NULL, 127.5, 425.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (367, 122, N'Light Control', NULL, NULL, 237.5, 386.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (368, 122, N'Temperature Con.', NULL, NULL, 378.5, 386.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (369, 122, N'Appliances Control', NULL, NULL, 301.5, 425.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (370, 122, N'Video on demand', NULL, NULL, 546.5, 359.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (371, 122, N'Internet connection', NULL, NULL, 630.5, 397.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (372, 122, N'Power line', NULL, NULL, 489.5, 573.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (373, 122, N'ADSL', NULL, NULL, 573.5, 610.5)
INSERT [dbo].[Features] ([ID], [ModelID], [Name], [Description], [IsRoot], [XPos], [YPos]) VALUES (374, 122, N'Wireless', NULL, NULL, 676.5, 575.5)
SET IDENTITY_INSERT [dbo].[Features] OFF
/****** Object:  Table [dbo].[CustomRules]    Script Date: 06/21/2012 00:06:39 ******/
SET IDENTITY_INSERT [dbo].[CustomRules] ON
INSERT [dbo].[CustomRules] ([ID], [ModelID], [Name], [Expression], [Description]) VALUES (2, 44, N'PriceCalcRule', N'sdsdsd', N'Special rule used for calculating the Total Price
')
INSERT [dbo].[CustomRules] ([ID], [ModelID], [Name], [Expression], [Description]) VALUES (4, 44, N'RamConstraint', N'If Hardware.Ram.TotalChosenRam == 6gb Then', NULL)
INSERT [dbo].[CustomRules] ([ID], [ModelID], [Name], [Expression], [Description]) VALUES (5, 78, N'Default rule', NULL, NULL)
INSERT [dbo].[CustomRules] ([ID], [ModelID], [Name], [Expression], [Description]) VALUES (6, 78, N'Default rue', NULL, NULL)
INSERT [dbo].[CustomRules] ([ID], [ModelID], [Name], [Expression], [Description]) VALUES (8, 119, N'Price Calculation Rule', N'#3G_Services[TotalPrice]=250', NULL)
INSERT [dbo].[CustomRules] ([ID], [ModelID], [Name], [Expression], [Description]) VALUES (9, 122, N'PriceCalculation', N'#HIS.TotalPrice=SumOf
(#HIS>descendants.SinglePrice)', N'Calculates the TotalPrice for the root node based on the individual prices of the seleccted descendants which have a SinglePrice attribute.')
SET IDENTITY_INSERT [dbo].[CustomRules] OFF
/****** Object:  Table [dbo].[Configurations]    Script Date: 06/21/2012 00:06:39 ******/
SET IDENTITY_INSERT [dbo].[Configurations] ON
INSERT [dbo].[Configurations] ([ID], [ModelID], [Name], [CreatedDate], [LastModifiedDate]) VALUES (119, 122, N'Configuration00', CAST(0x00009FFA01881B0B AS DateTime), CAST(0x00009FFA01881B0B AS DateTime))
INSERT [dbo].[Configurations] ([ID], [ModelID], [Name], [CreatedDate], [LastModifiedDate]) VALUES (120, 122, N'Configuration00', CAST(0x00009FFA0188F749 AS DateTime), CAST(0x00009FFA0188F749 AS DateTime))
INSERT [dbo].[Configurations] ([ID], [ModelID], [Name], [CreatedDate], [LastModifiedDate]) VALUES (121, 122, N'Configuration00', CAST(0x00009FFB00075318 AS DateTime), CAST(0x00009FFB00075318 AS DateTime))
SET IDENTITY_INSERT [dbo].[Configurations] OFF
/****** Object:  Table [dbo].[CompositionRules]    Script Date: 06/21/2012 00:06:39 ******/
SET IDENTITY_INSERT [dbo].[CompositionRules] ON
INSERT [dbo].[CompositionRules] ([ID], [ModelID], [CompositionRuleTypeID], [FirstFeatureID], [SecondFeatureID], [Name], [Description]) VALUES (4, 44, 3, 108, 104, N'Default rule', NULL)
INSERT [dbo].[CompositionRules] ([ID], [ModelID], [CompositionRuleTypeID], [FirstFeatureID], [SecondFeatureID], [Name], [Description]) VALUES (10, 96, 3, 137, 144, N'Default rule', NULL)
INSERT [dbo].[CompositionRules] ([ID], [ModelID], [CompositionRuleTypeID], [FirstFeatureID], [SecondFeatureID], [Name], [Description]) VALUES (11, 96, 3, 137, 146, N'Default rule', NULL)
INSERT [dbo].[CompositionRules] ([ID], [ModelID], [CompositionRuleTypeID], [FirstFeatureID], [SecondFeatureID], [Name], [Description]) VALUES (12, 44, 1, 94, 222, N'Default rule', NULL)
INSERT [dbo].[CompositionRules] ([ID], [ModelID], [CompositionRuleTypeID], [FirstFeatureID], [SecondFeatureID], [Name], [Description]) VALUES (30, 119, 3, 351, 354, N'ExclusionRule2', NULL)
INSERT [dbo].[CompositionRules] ([ID], [ModelID], [CompositionRuleTypeID], [FirstFeatureID], [SecondFeatureID], [Name], [Description]) VALUES (38, 119, 1, 350, 356, N'SamsungInclusion', NULL)
INSERT [dbo].[CompositionRules] ([ID], [ModelID], [CompositionRuleTypeID], [FirstFeatureID], [SecondFeatureID], [Name], [Description]) VALUES (39, 119, 3, 349, 356, N'IphoneExclusion', NULL)
INSERT [dbo].[CompositionRules] ([ID], [ModelID], [CompositionRuleTypeID], [FirstFeatureID], [SecondFeatureID], [Name], [Description]) VALUES (40, 122, 1, 372, 368, N'PowerLineInclusion', NULL)
INSERT [dbo].[CompositionRules] ([ID], [ModelID], [CompositionRuleTypeID], [FirstFeatureID], [SecondFeatureID], [Name], [Description]) VALUES (41, 122, 3, 372, 366, N'PowerLineMutEx', NULL)
SET IDENTITY_INSERT [dbo].[CompositionRules] OFF
/****** Object:  Table [dbo].[Relations]    Script Date: 06/21/2012 00:06:39 ******/
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
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (108, 119, 2, 291, 300, 0, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (128, 119, 2, 291, 346, 0, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (129, 119, 2, 300, 343, 0, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (130, 119, 2, 300, 344, 0, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (131, 119, 1, 344, 352, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (132, 119, 2, 344, 353, 0, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (133, 122, 1, 360, 361, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (134, 122, 1, 360, 362, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (135, 122, 2, 360, 363, 0, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (136, 122, 1, 361, 364, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (137, 122, 1, 361, 365, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (138, 122, 2, 361, 366, 0, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (139, 122, 1, 362, 367, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (140, 122, 1, 362, 369, 1, 1)
INSERT [dbo].[Relations] ([ID], [ModelID], [RelationTypeID], [ParentFeatureID], [ChildFeatureID], [LowerBound], [UpperBound]) VALUES (141, 122, 2, 362, 368, 0, 1)
SET IDENTITY_INSERT [dbo].[Relations] OFF
/****** Object:  Table [dbo].[FeatureSelections]    Script Date: 06/21/2012 00:06:39 ******/
/****** Object:  Table [dbo].[GroupRelations_To_Features]    Script Date: 06/21/2012 00:06:39 ******/
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
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (170, 67, 343, 348)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (171, 67, 343, 349)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (172, 67, 343, 350)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (173, 67, 343, 351)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (174, 68, 346, 345)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (175, 68, 346, 347)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (176, 69, 352, 354)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (177, 69, 352, 355)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (178, 69, 352, 356)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (179, 70, 353, 357)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (180, 70, 353, 358)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (181, 70, 353, 359)
GO
print 'Processed 100 total records'
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (182, 71, 363, 370)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (183, 71, 363, 371)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (184, 72, 371, 372)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (185, 72, 371, 373)
INSERT [dbo].[GroupRelations_To_Features] ([ID], [GroupRelationID], [ParentFeatureID], [ChildFeatureID]) VALUES (186, 72, 371, 374)
SET IDENTITY_INSERT [dbo].[GroupRelations_To_Features] OFF
/****** Object:  Table [dbo].[Attributes]    Script Date: 06/21/2012 00:06:39 ******/
SET IDENTITY_INSERT [dbo].[Attributes] ON
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description], [ConstantValue]) VALUES (6, 122, 3, 1, N'Total Price', NULL, NULL)
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description], [ConstantValue]) VALUES (7, 74, 2, 1, N'Total Price', NULL, NULL)
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description], [ConstantValue]) VALUES (8, 124, 3, 1, N'New Attribute', NULL, NULL)
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description], [ConstantValue]) VALUES (11, 181, 3, 1, N'New Attribute', NULL, NULL)
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description], [ConstantValue]) VALUES (12, 181, 3, 1, N'Address', NULL, NULL)
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description], [ConstantValue]) VALUES (13, 211, 3, 1, N'Total Price', NULL, NULL)
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description], [ConstantValue]) VALUES (14, 74, 3, 1, N'Discount', NULL, NULL)
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description], [ConstantValue]) VALUES (15, 75, 2, 1, N'Perf. V', NULL, NULL)
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description], [ConstantValue]) VALUES (16, 107, 2, 1, N'Per month', NULL, NULL)
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description], [ConstantValue]) VALUES (17, 76, 2, 1, N'Monthly costs', NULL, NULL)
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description], [ConstantValue]) VALUES (18, 270, 3, 1, N'Currency', NULL, NULL)
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description], [ConstantValue]) VALUES (19, 270, 3, 1, N'Region', NULL, NULL)
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description], [ConstantValue]) VALUES (20, 270, 3, 1, N'Name', NULL, NULL)
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description], [ConstantValue]) VALUES (21, 280, 3, 1, N'HeightInCM', NULL, NULL)
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description], [ConstantValue]) VALUES (22, 192, 2, 1, N'Total Price', N'Price for company', NULL)
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description], [ConstantValue]) VALUES (23, 74, 3, 2, N'RequiresValidity', NULL, NULL)
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description], [ConstantValue]) VALUES (24, 107, 2, 2, N'Credit', NULL, NULL)
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description], [ConstantValue]) VALUES (25, 192, 3, 1, N'PostNumber', NULL, NULL)
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description], [ConstantValue]) VALUES (26, 291, 2, 1, N'TotalPrice', NULL, NULL)
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description], [ConstantValue]) VALUES (27, 360, 2, 1, N'Total Price', NULL, NULL)
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description], [ConstantValue]) VALUES (28, 361, 1, 1, N'IndividualPrice', NULL, N'135')
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description], [ConstantValue]) VALUES (29, 362, 1, 1, N'IndividualPrice', NULL, N'130')
INSERT [dbo].[Attributes] ([ID], [FeatureID], [AttributeTypeID], [DataTypeID], [Name], [Description], [ConstantValue]) VALUES (30, 363, 1, 1, N'IndividualPrice', NULL, N'120')
SET IDENTITY_INSERT [dbo].[Attributes] OFF
/****** Object:  Table [dbo].[AttributeValues]    Script Date: 06/21/2012 00:06:39 ******/

GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Attributes] WITH CHECK CHECK CONSTRAINT [FK_Attributes_Attribute_DataTypes];

ALTER TABLE [dbo].[Attributes] WITH CHECK CHECK CONSTRAINT [FK_Attributes_Attribute_Types];

ALTER TABLE [dbo].[Attributes] WITH CHECK CHECK CONSTRAINT [FK_Attributes_Features];

ALTER TABLE [dbo].[AttributeValues] WITH CHECK CHECK CONSTRAINT [FK_AttributeValues_FeatureSelections];

ALTER TABLE [dbo].[CompositionRules] WITH CHECK CHECK CONSTRAINT [FK_CompositionRules_CompositionRule_Types];

ALTER TABLE [dbo].[CompositionRules] WITH CHECK CHECK CONSTRAINT [FK_CompositionRules_Models];

ALTER TABLE [dbo].[Configurations] WITH CHECK CHECK CONSTRAINT [FK_Configurations_Models];

ALTER TABLE [dbo].[CustomRules] WITH CHECK CHECK CONSTRAINT [FK_Rules_Models];

ALTER TABLE [dbo].[Features] WITH CHECK CHECK CONSTRAINT [FK_Features_Models];

ALTER TABLE [dbo].[FeatureSelections] WITH CHECK CHECK CONSTRAINT [FK_FeatureSelections_Configurations];

ALTER TABLE [dbo].[FeatureSelections] WITH CHECK CHECK CONSTRAINT [FK_FeatureSelections_SelectionStates];

ALTER TABLE [dbo].[GroupRelations] WITH CHECK CHECK CONSTRAINT [FK_FeatureGroups_Models];

ALTER TABLE [dbo].[GroupRelations] WITH CHECK CHECK CONSTRAINT [FK_GroupRelations_GroupRelation_Types];

ALTER TABLE [dbo].[GroupRelations_To_Features] WITH CHECK CHECK CONSTRAINT [FK_GroupRelations_To_Features_GroupRelations];

ALTER TABLE [dbo].[Models] WITH CHECK CHECK CONSTRAINT [FK_Models_Users];

ALTER TABLE [dbo].[Relations] WITH CHECK CHECK CONSTRAINT [FK_Relations_Models];

ALTER TABLE [dbo].[Relations] WITH CHECK CHECK CONSTRAINT [FK_Relations_Relation_Types];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        DECLARE @VarDecimalSupported AS BIT;
        SELECT @VarDecimalSupported = 0;
        IF ((ServerProperty(N'EngineEdition') = 3)
            AND (((@@microsoftversion / power(2, 24) = 9)
                  AND (@@microsoftversion & 0xffff >= 3024))
                 OR ((@@microsoftversion / power(2, 24) = 10)
                     AND (@@microsoftversion & 0xffff >= 1600))))
            SELECT @VarDecimalSupported = 1;
        IF (@VarDecimalSupported > 0)
            BEGIN
                EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
            END
    END


GO