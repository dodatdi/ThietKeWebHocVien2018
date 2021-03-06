USE [master]
GO
/****** Object:  Database [WebSiteHV]    Script Date: 3/4/18 04:04:07 PM ******/
CREATE DATABASE [WebSiteHV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebSiteHV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\WebSiteHV.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WebSiteHV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\WebSiteHV_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WebSiteHV] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebSiteHV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebSiteHV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebSiteHV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebSiteHV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebSiteHV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebSiteHV] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebSiteHV] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [WebSiteHV] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [WebSiteHV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebSiteHV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebSiteHV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebSiteHV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebSiteHV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebSiteHV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebSiteHV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebSiteHV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebSiteHV] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebSiteHV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebSiteHV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebSiteHV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebSiteHV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebSiteHV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebSiteHV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebSiteHV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebSiteHV] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WebSiteHV] SET  MULTI_USER 
GO
ALTER DATABASE [WebSiteHV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebSiteHV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebSiteHV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebSiteHV] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [WebSiteHV]
GO
/****** Object:  User [webhv]    Script Date: 3/4/18 04:04:09 PM ******/
CREATE USER [webhv] FOR LOGIN [webhv] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Authorized]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Authorized](
	[Name] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Authorized] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MainMenuID] [int] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsContent]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContent](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[contentType] [int] NOT NULL,
 CONSTRAINT [PK_cmsContent] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsContentType]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[alias] [nvarchar](255) NULL,
	[icon] [nvarchar](255) NULL,
	[thumbnail] [nvarchar](255) NOT NULL,
	[description] [nvarchar](1500) NULL,
	[isContainer] [bit] NOT NULL,
	[allowAtRoot] [bit] NOT NULL,
 CONSTRAINT [PK_cmsContentType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsContentType2ContentType]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentType2ContentType](
	[parentContentTypeId] [int] NOT NULL,
	[childContentTypeId] [int] NOT NULL,
 CONSTRAINT [PK_cmsContentType2ContentType] PRIMARY KEY CLUSTERED 
(
	[parentContentTypeId] ASC,
	[childContentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsContentTypeAllowedContentType]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentTypeAllowedContentType](
	[Id] [int] NOT NULL,
	[AllowedId] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_cmsContentTypeAllowedContentType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[AllowedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsContentVersion]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentVersion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ContentId] [int] NOT NULL,
	[VersionId] [uniqueidentifier] NOT NULL,
	[VersionDate] [datetime] NOT NULL,
 CONSTRAINT [PK_cmsContentVersion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsContentXml]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentXml](
	[nodeId] [int] NOT NULL,
	[xml] [ntext] NOT NULL,
 CONSTRAINT [PK_cmsContentXml] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsDataType]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDataType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[propertyEditorAlias] [nvarchar](255) NOT NULL,
	[dbType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_cmsDataType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsDataTypePreValues]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDataTypePreValues](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[datatypeNodeId] [int] NOT NULL,
	[value] [ntext] NULL,
	[sortorder] [int] NOT NULL,
	[alias] [nvarchar](50) NULL,
 CONSTRAINT [PK_cmsDataTypePreValues] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsDictionary]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDictionary](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[parent] [uniqueidentifier] NULL,
	[key] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_cmsDictionary] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsDocument]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDocument](
	[nodeId] [int] NOT NULL,
	[published] [bit] NOT NULL,
	[documentUser] [int] NOT NULL,
	[versionId] [uniqueidentifier] NOT NULL,
	[text] [nvarchar](255) NOT NULL,
	[releaseDate] [datetime] NULL,
	[expireDate] [datetime] NULL,
	[updateDate] [datetime] NOT NULL,
	[templateId] [int] NULL,
	[newest] [bit] NOT NULL,
 CONSTRAINT [PK_cmsDocument] PRIMARY KEY CLUSTERED 
(
	[versionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsDocumentType]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDocumentType](
	[contentTypeNodeId] [int] NOT NULL,
	[templateNodeId] [int] NOT NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_cmsDocumentType] PRIMARY KEY CLUSTERED 
(
	[contentTypeNodeId] ASC,
	[templateNodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsLanguageText]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsLanguageText](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[languageId] [int] NOT NULL,
	[UniqueId] [uniqueidentifier] NOT NULL,
	[value] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsLanguageText] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsMacro]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMacro](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uniqueId] [uniqueidentifier] NOT NULL,
	[macroUseInEditor] [bit] NOT NULL,
	[macroRefreshRate] [int] NOT NULL,
	[macroAlias] [nvarchar](255) NOT NULL,
	[macroName] [nvarchar](255) NULL,
	[macroScriptType] [nvarchar](255) NULL,
	[macroScriptAssembly] [nvarchar](255) NULL,
	[macroXSLT] [nvarchar](255) NULL,
	[macroCacheByPage] [bit] NOT NULL,
	[macroCachePersonalized] [bit] NOT NULL,
	[macroDontRender] [bit] NOT NULL,
	[macroPython] [nvarchar](255) NULL,
 CONSTRAINT [PK_cmsMacro] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsMacroProperty]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMacroProperty](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uniquePropertyId] [uniqueidentifier] NOT NULL,
	[editorAlias] [nvarchar](255) NOT NULL,
	[macro] [int] NOT NULL,
	[macroPropertySortOrder] [int] NOT NULL,
	[macroPropertyAlias] [nvarchar](50) NOT NULL,
	[macroPropertyName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_cmsMacroProperty] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsMedia]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMedia](
	[nodeId] [int] NOT NULL,
	[versionId] [uniqueidentifier] NOT NULL,
	[mediaPath] [nvarchar](255) NULL,
 CONSTRAINT [PK_cmsMedia] PRIMARY KEY CLUSTERED 
(
	[versionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsMember]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMember](
	[nodeId] [int] NOT NULL,
	[Email] [nvarchar](1000) NOT NULL,
	[LoginName] [nvarchar](1000) NOT NULL,
	[Password] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsMember] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsMember2MemberGroup]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMember2MemberGroup](
	[Member] [int] NOT NULL,
	[MemberGroup] [int] NOT NULL,
 CONSTRAINT [PK_cmsMember2MemberGroup] PRIMARY KEY CLUSTERED 
(
	[Member] ASC,
	[MemberGroup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsMemberType]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMemberType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[NodeId] [int] NOT NULL,
	[propertytypeId] [int] NOT NULL,
	[memberCanEdit] [bit] NOT NULL,
	[viewOnProfile] [bit] NOT NULL,
	[isSensitive] [bit] NOT NULL,
 CONSTRAINT [PK_cmsMemberType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsPreviewXml]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPreviewXml](
	[nodeId] [int] NOT NULL,
	[versionId] [uniqueidentifier] NOT NULL,
	[timestamp] [datetime] NOT NULL,
	[xml] [ntext] NOT NULL,
 CONSTRAINT [PK_cmsContentPreviewXml] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC,
	[versionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsPropertyData]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyData](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contentNodeId] [int] NOT NULL,
	[versionId] [uniqueidentifier] NULL,
	[propertytypeid] [int] NOT NULL,
	[dataInt] [int] NULL,
	[dataDecimal] [decimal](38, 6) NULL,
	[dataDate] [datetime] NULL,
	[dataNvarchar] [nvarchar](500) NULL,
	[dataNtext] [ntext] NULL,
 CONSTRAINT [PK_cmsPropertyData] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsPropertyType]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dataTypeId] [int] NOT NULL,
	[contentTypeId] [int] NOT NULL,
	[propertyTypeGroupId] [int] NULL,
	[Alias] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[sortOrder] [int] NOT NULL,
	[mandatory] [bit] NOT NULL,
	[validationRegExp] [nvarchar](255) NULL,
	[Description] [nvarchar](2000) NULL,
	[UniqueID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_cmsPropertyType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsPropertyTypeGroup]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyTypeGroup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contenttypeNodeId] [int] NOT NULL,
	[text] [nvarchar](255) NOT NULL,
	[sortorder] [int] NOT NULL,
	[uniqueID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_cmsPropertyTypeGroup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsTagRelationship]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTagRelationship](
	[nodeId] [int] NOT NULL,
	[tagId] [int] NOT NULL,
	[propertyTypeId] [int] NOT NULL,
 CONSTRAINT [PK_cmsTagRelationship] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC,
	[propertyTypeId] ASC,
	[tagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsTags]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tag] [nvarchar](200) NULL,
	[ParentId] [int] NULL,
	[group] [nvarchar](100) NULL,
 CONSTRAINT [PK_cmsTags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsTask]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTask](
	[closed] [bit] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[taskTypeId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[parentUserId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Comment] [nvarchar](500) NULL,
 CONSTRAINT [PK_cmsTask] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsTaskType]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTaskType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[alias] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_cmsTaskType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsTemplate]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTemplate](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[alias] [nvarchar](100) NULL,
	[design] [ntext] NOT NULL,
 CONSTRAINT [PK_cmsTemplate] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Footer]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Footer](
	[ID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MainMenu]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MainMenu](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Linked] [nvarchar](250) NULL,
 CONSTRAINT [PK_MainMenu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[News]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[ID] [bigint] NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Content] [xml] NULL,
	[Title] [nvarchar](250) NULL,
	[Preview] [nvarchar](500) NULL,
	[CreateDate] [date] NULL,
	[Author] [nvarchar](50) NULL,
	[CatID] [int] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[S_Category]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[S_Category](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](250) NULL,
	[CatID] [int] NULL,
 CONSTRAINT [PK_S_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Slide]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Slide](
	[ID] [int] NOT NULL,
	[Link] [varchar](250) NULL,
	[Title] [nvarchar](250) NULL,
	[Image] [varchar](250) NULL,
 CONSTRAINT [PK_Slide] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[umbracoAccess]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoAccess](
	[id] [uniqueidentifier] NOT NULL,
	[nodeId] [int] NOT NULL,
	[loginNodeId] [int] NOT NULL,
	[noAccessNodeId] [int] NOT NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoAccess] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoAccessRule]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoAccessRule](
	[id] [uniqueidentifier] NOT NULL,
	[accessId] [uniqueidentifier] NOT NULL,
	[ruleValue] [nvarchar](255) NOT NULL,
	[ruleType] [nvarchar](255) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoAccessRule] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoAudit]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoAudit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[performingUserId] [int] NOT NULL,
	[performingDetails] [nvarchar](1024) NULL,
	[performingIp] [nvarchar](64) NULL,
	[eventDateUtc] [datetime] NOT NULL,
	[affectedUserId] [int] NOT NULL,
	[affectedDetails] [nvarchar](1024) NULL,
	[eventType] [nvarchar](256) NOT NULL,
	[eventDetails] [nvarchar](1024) NULL,
 CONSTRAINT [PK_umbracoAudit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoCacheInstruction]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoCacheInstruction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[utcStamp] [datetime] NOT NULL,
	[jsonInstruction] [ntext] NOT NULL,
	[originated] [nvarchar](500) NOT NULL,
	[instructionCount] [int] NOT NULL,
 CONSTRAINT [PK_umbracoCacheInstruction] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoConsent]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoConsent](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[current] [bit] NOT NULL,
	[source] [nvarchar](512) NOT NULL,
	[context] [nvarchar](128) NOT NULL,
	[action] [nvarchar](512) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[state] [int] NOT NULL,
	[comment] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoConsent] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoDomains]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDomains](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[domainDefaultLanguage] [int] NULL,
	[domainRootStructureID] [int] NULL,
	[domainName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoDomains] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoExternalLogin]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoExternalLogin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[loginProvider] [nvarchar](4000) NOT NULL,
	[providerKey] [nvarchar](4000) NOT NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoExternalLogin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoLanguage]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLanguage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[languageISOCode] [nvarchar](10) NULL,
	[languageCultureName] [nvarchar](100) NULL,
 CONSTRAINT [PK_umbracoLanguage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoLock]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLock](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[value] [int] NOT NULL,
	[name] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_umbracoLock] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoLog]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[NodeId] [int] NOT NULL,
	[Datestamp] [datetime] NOT NULL,
	[logHeader] [nvarchar](50) NOT NULL,
	[logComment] [nvarchar](4000) NULL,
 CONSTRAINT [PK_umbracoLog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoMigration]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoMigration](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[version] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_umbracoMigration] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoNode]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoNode](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[trashed] [bit] NOT NULL,
	[parentID] [int] NOT NULL,
	[nodeUser] [int] NULL,
	[level] [int] NOT NULL,
	[path] [nvarchar](150) NOT NULL,
	[sortOrder] [int] NOT NULL,
	[uniqueID] [uniqueidentifier] NOT NULL,
	[text] [nvarchar](255) NULL,
	[nodeObjectType] [uniqueidentifier] NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_structure] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoRedirectUrl]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRedirectUrl](
	[id] [uniqueidentifier] NOT NULL,
	[contentKey] [uniqueidentifier] NOT NULL,
	[createDateUtc] [datetime] NOT NULL,
	[url] [nvarchar](255) NOT NULL,
	[urlHash] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_umbracoRedirectUrl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoRelation]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRelation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parentId] [int] NOT NULL,
	[childId] [int] NOT NULL,
	[relType] [int] NOT NULL,
	[datetime] [datetime] NOT NULL,
	[comment] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_umbracoRelation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoRelationType]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRelationType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[typeUniqueId] [uniqueidentifier] NOT NULL,
	[dual] [bit] NOT NULL,
	[parentObjectType] [uniqueidentifier] NOT NULL,
	[childObjectType] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[alias] [nvarchar](100) NULL,
 CONSTRAINT [PK_umbracoRelationType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoServer]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoServer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](500) NOT NULL,
	[computerName] [nvarchar](255) NOT NULL,
	[registeredDate] [datetime] NOT NULL,
	[lastNotifiedDate] [datetime] NOT NULL,
	[isActive] [bit] NOT NULL,
	[isMaster] [bit] NOT NULL,
 CONSTRAINT [PK_umbracoServer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUser]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userDisabled] [bit] NOT NULL,
	[userNoConsole] [bit] NOT NULL,
	[userName] [nvarchar](255) NOT NULL,
	[userLogin] [nvarchar](125) NOT NULL,
	[userPassword] [nvarchar](500) NOT NULL,
	[passwordConfig] [nvarchar](500) NULL,
	[userEmail] [nvarchar](255) NOT NULL,
	[userLanguage] [nvarchar](10) NULL,
	[securityStampToken] [nvarchar](255) NULL,
	[failedLoginAttempts] [int] NULL,
	[lastLockoutDate] [datetime] NULL,
	[lastPasswordChangeDate] [datetime] NULL,
	[lastLoginDate] [datetime] NULL,
	[emailConfirmedDate] [datetime] NULL,
	[invitedDate] [datetime] NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
	[avatar] [nvarchar](500) NULL,
	[tourData] [ntext] NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUser2NodeNotify]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2NodeNotify](
	[userId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[action] [nchar](1) NOT NULL,
 CONSTRAINT [PK_umbracoUser2NodeNotify] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[nodeId] ASC,
	[action] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUser2UserGroup]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2UserGroup](
	[userId] [int] NOT NULL,
	[userGroupId] [int] NOT NULL,
 CONSTRAINT [PK_user2userGroup] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[userGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUserGroup]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserGroup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userGroupAlias] [nvarchar](200) NOT NULL,
	[userGroupName] [nvarchar](200) NOT NULL,
	[userGroupDefaultPermissions] [nvarchar](50) NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
	[icon] [nvarchar](255) NULL,
	[startContentId] [int] NULL,
	[startMediaId] [int] NULL,
 CONSTRAINT [PK_umbracoUserGroup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUserGroup2App]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserGroup2App](
	[userGroupId] [int] NOT NULL,
	[app] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_userGroup2App] PRIMARY KEY CLUSTERED 
(
	[userGroupId] ASC,
	[app] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUserGroup2NodePermission]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserGroup2NodePermission](
	[userGroupId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[permission] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoUserGroup2NodePermission] PRIMARY KEY CLUSTERED 
(
	[userGroupId] ASC,
	[nodeId] ASC,
	[permission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUserLogin]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserLogin](
	[sessionId] [uniqueidentifier] NOT NULL,
	[userId] [int] NOT NULL,
	[loggedInUtc] [datetime] NOT NULL,
	[lastValidatedUtc] [datetime] NOT NULL,
	[loggedOutUtc] [datetime] NULL,
	[ipAddress] [nvarchar](255) NULL,
 CONSTRAINT [PK_umbracoUserLogin] PRIMARY KEY CLUSTERED 
(
	[sessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUserStartNode]    Script Date: 3/4/18 04:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserStartNode](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[startNode] [int] NOT NULL,
	[startNodeType] [int] NOT NULL,
 CONSTRAINT [PK_userStartNode] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[cmsContent] ON 

INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (1, 1059, 1058)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (4, 1075, 1074)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (5, 1077, 1076)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (6, 1079, 1078)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (9, 1086, 1081)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (10, 1087, 1081)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (11, 1094, 1091)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (12, 1096, 1091)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (13, 1099, 1081)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (14, 1100, 1081)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (15, 1101, 1081)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (16, 1102, 1081)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (17, 1105, 1092)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (18, 1106, 1104)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (19, 1107, 1031)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (20, 1108, 1031)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (21, 1109, 1032)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (22, 1111, 1110)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (23, 1112, 1110)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (24, 1113, 1058)
SET IDENTITY_INSERT [dbo].[cmsContent] OFF
SET IDENTITY_INSERT [dbo].[cmsContentType] ON 

INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (531, 1044, N'Member', N'icon-user', N'icon-user', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (532, 1031, N'Folder', N'icon-folder', N'icon-folder', NULL, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (533, 1032, N'Image', N'icon-picture', N'icon-picture', NULL, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (534, 1033, N'File', N'icon-document', N'icon-document', NULL, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (536, 1057, N'page', N'icon-document', N'folder.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (537, 1058, N'trangChu', N'icon-document', N'folder.png', NULL, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (538, 1060, N'tinTuc', N'icon-newspaper-alt', N'folder.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (539, 1063, N'chiTietTinTuc', N'icon-document', N'folder.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (540, 1074, N'gioiThieu', N'icon-document', N'folder.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (541, 1076, N'daoTao', N'icon-document', N'folder.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (542, 1078, N'tuyenSinh', N'icon-document', N'folder.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (543, 1080, N'misc', N'icon-document', N'folder.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (544, 1081, N'tab', N'icon-document', N'folder.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (547, 1091, N'gioiThieuChung', N'icon-document', N'folder.png', NULL, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (548, 1092, N'coCauToChuc', N'icon-document', N'folder.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (549, 1093, N'hinhAnhTieuBieu', N'icon-document', N'folder.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (550, 1104, N'banGiamDoc', N'icon-document', N'folder.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (551, 1110, N'banGiamDocItem', N'icon-document', N'folder.png', NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[cmsContentType] OFF
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1057, 1058)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1057, 1060)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1057, 1063)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1057, 1074)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1057, 1076)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1057, 1078)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1074, 1091)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1074, 1092)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1074, 1093)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1080, 1081)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1092, 1104)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1104, 1110)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1031, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1032, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1033, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1058, 1060, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1058, 1074, 1)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1058, 1076, 2)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1058, 1078, 3)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1060, 1063, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1074, 1081, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1074, 1091, 1)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1074, 1092, 2)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1074, 1093, 3)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1091, 1081, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1092, 1104, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1104, 1110, 0)
SET IDENTITY_INSERT [dbo].[cmsContentVersion] ON 

INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (1, 1059, N'a2b444a3-c811-49b7-894f-01e53562fa62', CAST(0x0000A8AF00BDB4A3 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (6, 1075, N'cffba5b8-741e-4785-af1c-ce532503b113', CAST(0x0000A8B6016313F2 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (7, 1077, N'b940bfa2-1df4-462b-af23-67ef5fbb6d6c', CAST(0x0000A8B000F342BE AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (8, 1079, N'5cf68d67-3b4f-4522-952c-5c77558044a2', CAST(0x0000A8B000F3E928 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (11, 1086, N'fcd09c11-e991-4f31-9809-99c9591906c6', CAST(0x0000A8B30079F8B1 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (12, 1086, N'fc8e5bd2-8915-42bd-a8ab-f40d4121d145', CAST(0x0000A8B300823DEC AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (13, 1087, N'd82194c2-75e5-427f-9dad-e2c90e0529d1', CAST(0x0000A8B300826E28 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (14, 1087, N'f5b30734-8a77-43fd-a765-351ca77f22a7', CAST(0x0000A8B30082CD79 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (16, 1094, N'8b8864b2-c1a8-48b6-9ef3-4a71412964ef', CAST(0x0000A8B30091394E AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (17, 1094, N'0377dfa3-ba48-4b63-9b14-a85f32f7f262', CAST(0x0000A8B60150E5B1 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (18, 1094, N'af444c3f-ab2f-4137-8c00-45f4a561eefa', CAST(0x0000A8B60156D50B AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (19, 1094, N'5f0440a8-4e09-4308-8fe3-814933f8c2ce', CAST(0x0000A8B60156D526 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (20, 1096, N'4101342d-a5a5-4659-9621-1bfefa21ed25', CAST(0x0000A8B60156F2B7 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (23, 1099, N'7bebb272-5378-4f74-9ef6-81deae9296e8', CAST(0x0000A8B601624873 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (24, 1100, N'cf1de4d3-4f68-4396-abc5-174722806e31', CAST(0x0000A8B60158B286 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (25, 1101, N'ad59612a-3485-4a84-bbde-c3eb6c1c9318', CAST(0x0000A8B601648CD4 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (26, 1102, N'85ede54f-6d08-45fb-939d-9b0d371e6622', CAST(0x0000A8B60164AB22 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (27, 1059, N'9850175a-e883-4f30-b673-3f8d39114e32', CAST(0x0000A8B700F020C9 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (28, 1075, N'ab047191-bec7-4a7b-89b1-b41abf99dbf9', CAST(0x0000A8B700F02108 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (29, 1079, N'bc234aef-3dd1-4d32-9182-20bb3f469475', CAST(0x0000A8B700F0210F AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (30, 1077, N'6e6c2e85-bca2-4155-b01d-29f0b385a429', CAST(0x0000A8B700F02113 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (32, 1096, N'7f65daa1-3f15-4f9c-9b3a-b34d72dc38b8', CAST(0x0000A8B700F02118 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (33, 1087, N'be28c0cc-5fe8-476a-80a9-892db6cbb9ef', CAST(0x0000A8B700F0211A AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (34, 1086, N'6ab80cad-7dd7-4ae9-a280-29fbb955a0d6', CAST(0x0000A8B700F02130 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (36, 1102, N'65305876-844c-4aa6-b8d5-e444686482a4', CAST(0x0000A8B700F0217C AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (37, 1101, N'7c53c7fb-8414-4b4b-b686-6dba399c0db5', CAST(0x0000A8B700F02186 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (38, 1099, N'2426b643-8bcd-4727-81cc-d7d509324a32', CAST(0x0000A8B700F0218F AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (39, 1100, N'7053ea2f-be52-4611-8d0f-a2b259dd4f89', CAST(0x0000A8B700F02195 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (40, 1059, N'f3cf2ef9-2043-4502-9ca0-366221e47eb7', CAST(0x0000A8B700F0E219 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (41, 1075, N'c5ac862d-6da6-4c9d-a540-718566a36d13', CAST(0x0000A8B700F021A7 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (42, 1079, N'9a165545-f33e-4ef9-8e96-ebe66bfb98f8', CAST(0x0000A8B700F021A8 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (43, 1077, N'45db02b8-3fac-4d04-a641-89a7aa888610', CAST(0x0000A8B700F021A9 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (45, 1096, N'5353f7ad-876f-4150-9154-76bcf780feef', CAST(0x0000A8B700F021AB AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (46, 1087, N'7685c9d8-99ac-4682-bd37-5aaaf45405b2', CAST(0x0000A8B700F021AC AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (47, 1086, N'6dc35893-cbbf-44d4-ab97-e8672c569117', CAST(0x0000A8B700F021AE AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (49, 1102, N'27210fe1-f718-4fa4-9267-c8e5e90c3b7e', CAST(0x0000A8B700F021B0 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (50, 1101, N'239410eb-ef0e-43c4-b91c-67407779600c', CAST(0x0000A8B700F021B1 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (51, 1099, N'26d246ad-6ec9-4b44-9143-9359084a4a12', CAST(0x0000A8B700F021B3 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (52, 1100, N'9274556f-cf17-44e6-ac26-e75c5b5b099c', CAST(0x0000A8B700F021B4 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (53, 1094, N'7958112e-897f-4176-8a9e-a6fe2387bd6a', CAST(0x0000A8B700F634CF AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (54, 1094, N'4e4ee0c9-d6df-43d5-bbc1-b476399e24d1', CAST(0x0000A8B700F65140 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (55, 1094, N'3d72145c-d6a9-4244-9941-75c301d8288b', CAST(0x0000A8B700F67B3E AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (56, 1094, N'a22bd5a0-9729-4fa6-876c-21722066cbca', CAST(0x0000A8B700F67B4A AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (57, 1059, N'f1e551e9-3f66-4f18-ab11-949a7eea64ee', CAST(0x0000A8B700F9661B AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (58, 1075, N'fc7cd625-b16a-4cb2-9d15-9b0a1f10b5d8', CAST(0x0000A8B700F9664C AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (59, 1096, N'fd2bb135-f41f-463e-841b-b9e0e219fbc7', CAST(0x0000A8B700F96650 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (60, 1102, N'f096073c-3d33-47fa-87b5-6003e2150e4a', CAST(0x0000A8B700F96657 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (61, 1101, N'f0e4f83b-139b-4511-9f5b-7e375daf4340', CAST(0x0000A8B700F9665D AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (62, 1099, N'0470ff7b-33d9-447d-88e9-491096aaab2b', CAST(0x0000A8B700F96664 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (63, 1100, N'f65caf8c-8db5-4e8f-ba5a-5865187f7572', CAST(0x0000A8B700F9666E AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (64, 1087, N'1e51396a-9705-474c-b329-8c5e4e8eb9f5', CAST(0x0000A8B700F96670 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (65, 1086, N'86a80fbc-f0af-4aa8-95d7-761f58043ca9', CAST(0x0000A8B700F96672 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (66, 1079, N'7f8d0085-d327-4903-aced-19e96736aea0', CAST(0x0000A8B700F96675 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (67, 1077, N'050056f5-faac-492f-bb2c-f37c657d9216', CAST(0x0000A8B700F96677 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (68, 1059, N'f66f4f10-ed7c-4c1c-852f-d216b3c2db93', CAST(0x0000A8B700F97231 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (69, 1075, N'a395d095-c2be-43a8-add3-f6a65e0298ff', CAST(0x0000A8B700FD8042 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (70, 1096, N'e5f05a07-852e-452b-9f56-0a6a854293ef', CAST(0x0000A8B701027ECD AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (71, 1102, N'df87cbfd-c6c4-47cd-aeca-020fea81183d', CAST(0x0000A8B700F98611 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (72, 1101, N'75f4ad5e-8ef9-43c4-b5db-1dde9e407c3f', CAST(0x0000A8B700F98866 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (73, 1099, N'd52bfacf-e780-45bb-aee2-5c693d643b8f', CAST(0x0000A8B700F98B8A AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (74, 1100, N'1ebe9658-1a78-42ce-a48d-b602af84af9b', CAST(0x0000A8B700F98E28 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (75, 1087, N'7b99fa0e-cd08-460b-835f-8b62aaa85503', CAST(0x0000A8B700FC9FE9 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (76, 1086, N'f19f46ef-002e-4efe-bbd7-23b32d4c8b5f', CAST(0x0000A8B700F996E6 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (77, 1105, N'9cbf6fb6-e765-4a05-8358-53e2e14bf51b', CAST(0x0000A8B700FD7528 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (78, 1106, N'd82f274d-d976-4b6a-a1c1-5f119eb3c8b4', CAST(0x0000A8B700FE0B87 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (79, 1107, N'836c1dd8-2284-4b68-9727-e49f660db768', CAST(0x0000A8B700FE2AF9 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (80, 1108, N'9ea9e42b-321f-4bd0-8c97-4b2ad0646878', CAST(0x0000A8B700FE330D AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (81, 1109, N'03bd1d74-9779-4e04-8ce1-1d4289bb0e64', CAST(0x0000A8B700FE462E AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (82, 1106, N'ed9e38ff-333a-4357-bbf6-2f9184f0ae64', CAST(0x0000A8B70102B538 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (83, 1111, N'cca9ec74-ffc3-445d-8f9c-88eeefe6fdae', CAST(0x0000A8B700FFD243 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (84, 1112, N'25ee7aaf-c56d-40a3-bedc-d0897d47b62f', CAST(0x0000A8B700FFFADA AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (85, 1113, N'3c04fc45-2746-49a4-8d7d-56595316f6fa', CAST(0x0000A8B701012165 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (86, 1113, N'e139af38-a987-4f7a-9fc9-4d97a2165a4d', CAST(0x0000A8B7010142E1 AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (87, 1113, N'faa1400f-5840-4d07-b868-eebd4d8b987c', CAST(0x0000A8B7010142EE AS DateTime))
SET IDENTITY_INSERT [dbo].[cmsContentVersion] OFF
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1059, N'<trangChu id="1059" key="98ddf55b-0e71-4441-bb44-36f2c5b3076b" parentID="-1" level="1" creatorID="0" sortOrder="1" createDate="2018-03-26T11:30:41" updateDate="2018-04-03T15:08:12" nodeName="Trang Chu" urlName="trang-chu" path="-1,1059" isDoc="" nodeType="1058" creatorName="DoDat" writerName="DoDat" writerID="0" template="1055" nodeTypeAlias="trangChu" isPublished="true" />')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1075, N'<gioiThieu id="1075" key="cce7a73c-7747-4c3a-8c32-87ebe1819b79" parentID="1059" level="2" creatorID="0" sortOrder="7" createDate="2018-03-27T14:35:35" updateDate="2018-04-03T15:22:58" nodeName="Giới Thiệu" urlName="giới-thiệu" path="-1,1059,1075" isDoc="" nodeType="1074" creatorName="DoDat" writerName="DoDat" writerID="0" template="0" nodeTypeAlias="gioiThieu" isPublished="true" />')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1086, N'<tab id="1086" key="09e5e729-7e1f-478e-8c6a-9bf9c2c96ce7" parentID="1075" level="3" creatorID="0" sortOrder="10" createDate="2018-03-30T07:24:05" updateDate="2018-04-03T15:08:43" nodeName="KHỐI PHÒNG CHỨC NĂNG" urlName="khối-phòng-chức-năng" path="-1,1059,1075,1086" isDoc="" nodeType="1081" creatorName="DoDat" writerName="DoDat" writerID="0" template="0" nodeTypeAlias="tab" isPublished="true"><noiDung><![CDATA[<ol>
<li><span>    Phòng Chính trị. Chủ nhiệm chính trị: Đại tá, Tiến sĩ Nguyễn Minh Thắng</span></li>
<li><span>    Văn phòng. Chánh Văn phòng: Đại tá, Kỹ sư Phạm Mạnh Khái<br /></span></li>
<li><span>    Phòng Đào tạo. Trưởng phòng: Đại tá, Phó Giáo sư, Tiến sĩ Trần Xuân Nam<br /></span></li>
<li><span>    Phòng Sau đại học. Trưởng phòng: Đại tá, Phó Giáo sư, Tiến sĩ  Vũ Quốc Trụ</span></li>
<li><span>    Phòng Khoa học Quân sự. Trưởng phòng: Thượng tá, Phó Giáo sư, Tiến sĩ Nguyễn Thái Chung<br /></span></li>
<li><span>    Phòng Thông tin Khoa học Quân sự. Trưởng phòng: Đại tá, Phó Giáo sư, Tiến sĩ Nguyễn Hoàng Vũ<br /></span></li>
<li><span>    Phòng Kỹ thuật. Trưởng phòng: Đại tá, Thạc sỹ Nguyễn Văn Thủy</span></li>
<li><span>    Phòng Hậu cần. Chủ nhiệm: Đại tá, Tiến sỹ Hồ Quang Huy</span></li>
<li><span>    Ban Tài chính. Trưởng ban: Đại tá, Cử nhân Tạ Văn Hồng<br /></span></li>
<li>    Phòng Hợp tác Quốc tế và Quản lý lưu học sinh quân sự. Trưởng phòng: Trung tá, Phó Giáo sư, Tiến sĩ Nguyễn Trung Kiên</li>
<li><span>    Phòng Khảo thí và đảm bảo chất lượng giáo dục - đào tạo. Trưởng phòng: Đại tá, Tiến sĩ Đặng Huy Tú<br /></span></li>
<li><span>    Ban Quản lý dự án. Trưởng ban: Đại tá, Thạc sĩ Nguyễn Ngọc Khôi</span></li>
<li><span>    Ban Quản lý dự án Đầu tư hiện đại hóa các phòng thí nghiệm. Trưởng ban: Đại tá, Tiến sĩ Nguyễn Đăng Hải</span></li>
<li><span>    Trung tâm Công nghệ thông tin. Trưởng Trung tâm: Trung tá, Tiến sĩ Nguyễn Hoàng Sinh<br /></span></li>
<li><span>    Cơ sở II - Thành phố Hồ Chí Minh. Trưởng Đại diện phía Nam: Thượng tá Dương Ngọc Phượng</span></li>
</ol>]]></noiDung></tab>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1087, N'<tab id="1087" key="9dd8b2b2-2b5e-48df-bf69-b41d934a582d" parentID="1075" level="3" creatorID="0" sortOrder="9" createDate="2018-03-30T07:54:39" updateDate="2018-04-03T15:19:46" nodeName="KHỐI VIỆN, TRUNG TÂM" urlName="khối-viện-trung-tâm" path="-1,1059,1075,1087" isDoc="" nodeType="1081" creatorName="DoDat" writerName="DoDat" writerID="0" template="0" nodeTypeAlias="tab" isPublished="true"><noiDung><![CDATA[<p><span>1. Viện Công nghệ Mô phỏng. Viện trưởng: Đại tá, Phó Giáo sư, Tiến sĩ Mai Quang Huy   </span></p>
<p><span>2.Viện Kỹ thuật công trình đặc biệt. Viện trưởng: Đại tá, Phó Giáo sư, Tiến sĩ Nguyễn Trí </span></p>
<p><span>3.Viện Tích hợp hệ thống. Viện Trưởng: Đại tá, Tiến sĩ Lê Đại Phong<br /></span></p>
<p> </p>
<ol>
<li><span>Trung tâm Công nghệ. Trưởng Trung tâm: Trung tá, Phó Giáo sư, Tiến sĩ Trần Đức Tăng<br /></span></li>
<li><span>Trung tâm huấn luyện 125 - Vĩnh Phúc. Trưởng Trung tâm: Đại tá, Thạc sĩ Trần Thanh Từ</span></li>
</ol>]]></noiDung></tab>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1096, N'<gioiThieuChung id="1096" key="30865ed4-81b4-4180-a108-8b9d20d5ca7b" parentID="1075" level="3" creatorID="0" sortOrder="8" createDate="2018-04-02T20:48:38" updateDate="2018-04-03T15:41:09" nodeName="Giới Thiệu Chung" urlName="giới-thiệu-chung" path="-1,1059,1075,1096" isDoc="" nodeType="1091" creatorName="DoDat" writerName="DoDat" writerID="0" template="1095" nodeTypeAlias="gioiThieuChung" isPublished="true" />')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1099, N'<tab id="1099" key="9bde509b-c27f-4518-821b-19344113d079" parentID="1096" level="4" creatorID="0" sortOrder="10" createDate="2018-04-02T20:54:01" updateDate="2018-04-03T15:08:33" nodeName="Lịch sử phát triển và các thành tích tiêu biểu" urlName="lịch-sử-phát-triển-và-các-thành-tích-tiêu-biểu" path="-1,1059,1075,1096,1099" isDoc="" nodeType="1081" creatorName="DoDat" writerName="DoDat" writerID="0" template="0" nodeTypeAlias="tab" isPublished="true"><noiDung><![CDATA[<p> <span><strong>Học viện Kỹ thuật Quân sự</strong>          </span></p>
<p> </p>
<p><span>Học viện Kỹ thuật Quân sự được thành lập theo Quyết định số 146/CP ngày 08/8/1966 của Hội đồng Chính phủ với tên gọi ban đầu là “Phân hiệu II Đại học Bách khoa”. Ngày 28/10/1966, tại Hội trường lớn Đại học Bách khoa, Bộ Đại học và Trung học chuyên nghiệp (nay là Bộ Giáo dục và Đào tạo) và Bộ Quốc phòng long trọng tổ chức Lễ thành lập Phân hiệu II Đại học Bách khoa, đồng thời khai giảng khoá đào tạo đầu tiên. Từ đó, ngày 28/10/1966 được chọn là Ngày truyền thống của Học viện Kỹ thuật Quân sự. Ngày 13/6/1968, Thủ tướng Chính phủ quyết định đổi tên “Phân hiệu II Đại học Bách khoa” thành trường Đại học Kỹ thuật Quân sự và ngày 15/12/1981, Bộ Quốc phòng quyết định thành lập Học viện Kỹ thuật Quân sự trên cơ sở trường Đại học Kỹ thuật Quân sự. Ngày 06/6/1991, Chủ tịch Hội đồng Bộ trưởng quyết định cho phép Học viện Kỹ thuật Quân sự mang thêm tên gọi Đại học kỹ thuật Lê Quý Đôn. Ngày 31/1/2008, Học viện Kỹ thuật Quân sự được Chính phủ quyết định bổ sung vào danh sách các trường đại học trọng điểm quốc gia.</span></p>
<p><img src="http://mta.edu.vn/portals/0/Thuy/2017/1_Ngaykhaigiang.jpg" alt="" /></p>
<p><span><em> </em></span></p>
<p><span><em>Học viện Kỹ thuật Quân sự khai giảng năm học mới</em></span></p>
<p><span><em> </em></span></p>
<p><strong><span>Sứ mạng</span></strong></p>
<p><span>Sứ mạng của Học viện Kỹ thuật Quân sự là đào tạo nguồn nhân lực chất lượng cao, nghiên cứu phát triển, sản xuất chế thử, chuyển giao công nghệ tiên tiến và hội nhập quốc tế, góp phần đắc lực vào sự nghiệp xây dựng và bảo vệ Tổ quốc, phát triển ngành khoa học kỹ thuật quân sự Việt Nam.</span></p>
<p><span> </span></p>
<p><strong><span>Mục tiêu</span></strong></p>
<p><span>Đào tạo đội ngũ cán bộ kỹ thuật, chỉ huy quản lý kỹ thuật chất lượng cao có trình độ đại học, sau đại học cho Quân đội và Đất nước; có bản lĩnh chính trị vững vàng, phẩm chất đạo đức tốt, tuyệt đối trung thành với Đảng Cộng sản Việt Nam, với Tổ quốc, với Nhân dân; có trình độ kiến thức nền vững chắc, kiến thức chuyên ngành chuyên sâu; có tác phong chính quy và có năng lực toàn diện trong chỉ huy, quản lý, tổ chức, điều hành và huấn luyện bộ đội; có năng lực ngoại ngữ, công nghệ thông tin đáp ứng yêu cầu hoạt động chuyên môn và hội nhập quốc tế; có sức khỏe tốt; có khả năng tự học tập, nghiên cứu nâng cao trình độ và thích nghi với mọi hoàn cảnh; có khả năng phát triển thành chuyên gia đầu ngành hoặc đảm nhiệm được các chức vụ cao hơn, đáp ứng yêu cầu xây dựng Quân đội, xây dựng và bảo vệ Tổ quốc.</span></p>
<p><span> </span></p>
<p> </p>
<p><strong><span>Phương châm giáo dục - đào tạo của Học viện<br /></span></strong></p>
<p><span>Cơ bản, hệ thống, toàn diện, chuyên sâu.</span></p>
<p><span> </span></p>
<p><span><strong>Nhiệm vụ chính</strong><br /></span></p>
<p><span>- Đào tạo cán bộ kỹ thuật và quản lý kỹ thuật có trình độ đại học, sau đại học</span></p>
<p><em><span>+ Đào tạo Kỹ sư quân sự: 42 chuyên ngành</span></em></p>
<p><em><span>+ Đào tạo Kỹ sư dân sự: 25 chuyên ngành</span></em></p>
<p><em><span>+ Đào tạo Thạc sĩ: 17 ngành</span></em></p>
<p><em><span>+ Đào tạo Tiến sĩ: 12 ngành</span></em></p>
<p><span> - Nghiên cứu khoa học, tư vấn khoa học kỹ thuật, triển khai dịch vụ khoa học công nghệ,… phục vụ quốc phòng - an ninh và kinh tế - xã hội.</span></p>
<p><span> </span></p>
<p><strong><span>Phần thưởng cao quý</span></strong></p>
<p> </p>
<p><span>- Danh hiệu Đơn vị Anh hùng LLVT nhân dân thời kỳ đổi mới;</span></p>
<p><span>- 01 Huân chương Hồ Chí Minh;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhất;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhì;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Ba;</span></p>
<p><span>- 02 Huân chương Quân công hạng Nhất;</span></p>
<p><span>- 01 Huân chương Quân công hạng Nhì;</span></p>
<p><span>- 01 Huân chương Lao động hạng Ba;</span></p>
<p><span>- 03 Huân chương Chiến công: hạng Nhất, hạng Nhì, hạng Ba</span></p>
<p><span> </span></p>
<p><span><img src="http://mta.edu.vn/portals/0/Thuy/2017/NhanHCdoclapHangNhi.jpg" alt="" /><br /></span></p>
<p><em><span> </span></em></p>
<p><em><span>Học viện Kỹ thuật Quân sự đón nhận Huân chương Độc lập hạng Nhì</span></em></p>
<p><em><span> </span></em></p>
<p><strong><span>Địa chỉ</span></strong></p>
<p><span>Cơ sở 1: 236 Hoàng Quốc Việt, Bắc Từ Liêm, Hà Nội<br />Cơ sở 2: Đường Mê Linh, Vĩnh Yên, Vĩnh Phúc<br />Cơ sở 3: 71 Đường Cộng hoà, Quận Tân Bình, Tp. Hồ Chí Minh<br />Cơ sở 4: Kiều Mai, Phú Diễn 1, Bắc Từ Liêm, Hà Nội</span></p>]]></noiDung></tab>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1100, N'<tab id="1100" key="eae1b129-c224-4ca6-903b-8b880a9482fc" parentID="1096" level="4" creatorID="0" sortOrder="11" createDate="2018-04-02T20:55:00" updateDate="2018-04-03T15:08:36" nodeName="Chức năng, nhiệm vụ" urlName="chức-năng-nhiệm-vụ" path="-1,1059,1075,1096,1100" isDoc="" nodeType="1081" creatorName="DoDat" writerName="DoDat" writerID="0" template="0" nodeTypeAlias="tab" isPublished="true"><noiDung><![CDATA[<p><strong><span>Sứ mạng</span></strong></p>
<p><span>Sứ mạng của Học viện Kỹ thuật Quân sự là đào tạo nguồn nhân lực chất lượng cao, nghiên cứu phát triển, sản xuất chế thử, chuyển giao công nghệ tiên tiến và hội nhập quốc tế, góp phần đắc lực vào sự nghiệp xây dựng và bảo vệ Tổ quốc, phát triển ngành khoa học kỹ thuật quân sự Việt Nam.</span></p>
<p><span> </span></p>
<p><strong><span>Mục tiêu</span></strong></p>
<p><span>Đào tạo đội ngũ cán bộ kỹ thuật, chỉ huy quản lý kỹ thuật chất lượng cao có trình độ đại học, sau đại học cho Quân đội và Đất nước; có bản lĩnh chính trị vững vàng, phẩm chất đạo đức tốt, tuyệt đối trung thành với Đảng Cộng sản Việt Nam, với Tổ quốc, với Nhân dân; có trình độ kiến thức nền vững chắc, kiến thức chuyên ngành chuyên sâu; có tác phong chính quy và có năng lực toàn diện trong chỉ huy, quản lý, tổ chức, điều hành và huấn luyện bộ đội; có năng lực ngoại ngữ, công nghệ thông tin đáp ứng yêu cầu hoạt động chuyên môn và hội nhập quốc tế; có sức khỏe tốt; có khả năng tự học tập, nghiên cứu nâng cao trình độ và thích nghi với mọi hoàn cảnh; có khả năng phát triển thành chuyên gia đầu ngành hoặc đảm nhiệm được các chức vụ cao hơn, đáp ứng yêu cầu xây dựng Quân đội, xây dựng và bảo vệ Tổ quốc.</span></p>]]></noiDung></tab>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1101, N'<tab id="1101" key="9aad5f2e-6efc-44ea-8893-b55f49e76d01" parentID="1096" level="4" creatorID="0" sortOrder="9" createDate="2018-04-02T20:56:11" updateDate="2018-04-03T15:08:31" nodeName="Sứ mạng, mục tiêu đào tạo" urlName="sứ-mạng-mục-tiêu-đào-tạo" path="-1,1059,1075,1096,1101" isDoc="" nodeType="1081" creatorName="DoDat" writerName="DoDat" writerID="0" template="0" nodeTypeAlias="tab" isPublished="true"><noiDung><![CDATA[<p><strong><span>Phần thưởng cao quý</span></strong></p>
<p> </p>
<p><span>- Danh hiệu Đơn vị Anh hùng LLVT nhân dân thời kỳ đổi mới;</span></p>
<p><span>- 01 Huân chương Hồ Chí Minh;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhất;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhì;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Ba;</span></p>
<p><span>- 02 Huân chương Quân công hạng Nhất;</span></p>
<p><span>- 01 Huân chương Quân công hạng Nhì;</span></p>
<p><span>- 01 Huân chương Lao động hạng Ba;</span></p>
<p><span>- 03 Huân chương Chiến công: hạng Nhất, hạng Nhì, hạng Ba</span></p>
<p><span> </span></p>
<p><span><img src="http://mta.edu.vn/portals/0/Thuy/2017/NhanHCdoclapHangNhi.jpg" alt="" /><br /></span></p>
<p><em><span> </span></em></p>
<p><em><span>Học viện Kỹ thuật Quân sự đón nhận Huân chương Độc lập hạng Nhì</span></em></p>
<p><em><span> </span></em></p>
<p><strong><span>Địa chỉ</span></strong></p>
<p><span>Cơ sở 1: 236 Hoàng Quốc Việt, Bắc Từ Liêm, Hà Nội<br />Cơ sở 2: Đường Mê Linh, Vĩnh Yên, Vĩnh Phúc<br />Cơ sở 3: 71 Đường Cộng hoà, Quận Tân Bình, Tp. Hồ Chí Minh<br />Cơ sở 4: Kiều Mai, Phú Diễn 1, Bắc Từ Liêm, Hà Nội</span></p>]]></noiDung></tab>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1102, N'<tab id="1102" key="4523b821-5799-4962-9a6b-81e0192bbe0d" parentID="1096" level="4" creatorID="0" sortOrder="8" createDate="2018-04-02T20:58:33" updateDate="2018-04-03T15:08:29" nodeName="Tiềm lực" urlName="tiềm-lực" path="-1,1059,1075,1096,1102" isDoc="" nodeType="1081" creatorName="DoDat" writerName="DoDat" writerID="0" template="0" nodeTypeAlias="tab" isPublished="true"><noiDung><![CDATA[<p><strong><span>Phần thưởng cao quý</span></strong></p>
<p> </p>
<p><span>- Danh hiệu Đơn vị Anh hùng LLVT nhân dân thời kỳ đổi mới;</span></p>
<p><span>- 01 Huân chương Hồ Chí Minh;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhất;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhì;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Ba;</span></p>
<p><span>- 02 Huân chương Quân công hạng Nhất;</span></p>
<p><span>- 01 Huân chương Quân công hạng Nhì;</span></p>
<p><span>- 01 Huân chương Lao động hạng Ba;</span></p>
<p><span>- 03 Huân chương Chiến công: hạng Nhất, hạng Nhì, hạng Ba</span></p>
<p><span> </span></p>
<p><span><img src="http://mta.edu.vn/portals/0/Thuy/2017/NhanHCdoclapHangNhi.jpg" alt="" /><br /></span></p>
<p><em><span> </span></em></p>
<p><em><span>Học viện Kỹ thuật Quân sự đón nhận Huân chương Độc lập hạng Nhì</span></em></p>
<p><em><span> </span></em></p>
<p><strong><span>Địa chỉ</span></strong></p>
<p><span>Cơ sở 1: 236 Hoàng Quốc Việt, Bắc Từ Liêm, Hà Nội<br />Cơ sở 2: Đường Mê Linh, Vĩnh Yên, Vĩnh Phúc<br />Cơ sở 3: 71 Đường Cộng hoà, Quận Tân Bình, Tp. Hồ Chí Minh<br />Cơ sở 4: Kiều Mai, Phú Diễn 1, Bắc Từ Liêm, Hà Nội</span></p>]]></noiDung></tab>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1105, N'<coCauToChuc id="1105" key="956b2b2e-b697-4473-8fd0-96a3b46afcc8" parentID="1075" level="3" creatorID="0" sortOrder="11" createDate="2018-04-03T15:22:48" updateDate="2018-04-03T15:22:48" nodeName="Cơ Cấu Tổ Chức" urlName="cơ-cấu-tổ-chức" path="-1,1059,1075,1105" isDoc="" nodeType="1092" creatorName="DoDat" writerName="DoDat" writerID="0" template="0" nodeTypeAlias="coCauToChuc" isPublished="true" />')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1106, N'<banGiamDoc id="1106" key="c1208262-5df6-4d1c-9687-2fbbb4178744" parentID="1105" level="4" creatorID="0" sortOrder="0" createDate="2018-04-03T15:24:56" updateDate="2018-04-03T15:41:55" nodeName="Ban Giám Đốc" urlName="ban-giám-đốc" path="-1,1059,1075,1105,1106" isDoc="" nodeType="1104" creatorName="DoDat" writerName="DoDat" writerID="0" template="1103" nodeTypeAlias="banGiamDoc" isPublished="true" />')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1107, N'<Folder id="1107" key="18472334-af62-4d38-80d8-695ed96a3d03" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-04-03T15:25:23" updateDate="2018-04-03T15:25:23" nodeName="Giơi Thiệu" urlName="giơi-thiệu" path="-1,1107" isDoc="" nodeType="1031" writerName="DoDat" writerID="0" version="836c1dd8-2284-4b68-9727-e49f660db768" template="0" nodeTypeAlias="Folder" />')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1108, N'<Folder id="1108" key="84b030a5-d048-498a-9755-77384cc38d51" parentID="1107" level="2" creatorID="0" sortOrder="0" createDate="2018-04-03T15:25:30" updateDate="2018-04-03T15:25:30" nodeName="Ban Giám Đốc" urlName="ban-giám-đốc" path="-1,1107,1108" isDoc="" nodeType="1031" writerName="DoDat" writerID="0" version="9ea9e42b-321f-4bd0-8c97-4b2ad0646878" template="0" nodeTypeAlias="Folder" />')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1109, N'<Image id="1109" key="168d2bc2-b4a2-44c1-99ab-9277602ad2e7" parentID="1108" level="3" creatorID="0" sortOrder="0" createDate="2018-04-03T15:25:47" updateDate="2018-04-03T15:25:47" nodeName="17693096_1774836219498459_887219102_o.jpg" urlName="17693096_1774836219498459_887219102_ojpg" path="-1,1107,1108,1109" isDoc="" nodeType="1032" writerName="DoDat" writerID="0" version="03bd1d74-9779-4e04-8ce1-1d4289bb0e64" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[{"src": "/media/1001/17693096_1774836219498459_887219102_o.jpg", "crops": []}]]></umbracoFile><umbracoWidth><![CDATA[1920]]></umbracoWidth><umbracoHeight><![CDATA[1080]]></umbracoHeight><umbracoBytes><![CDATA[170584]]></umbracoBytes><umbracoExtension><![CDATA[jpg]]></umbracoExtension></Image>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1111, N'<banGiamDocItem id="1111" key="e1d7ab7d-1b81-40ea-bedb-f8c55bf3fe0a" parentID="1106" level="5" creatorID="0" sortOrder="0" createDate="2018-04-03T15:31:25" updateDate="2018-04-03T15:31:25" nodeName="Giám Đốc" urlName="giám-đốc" path="-1,1059,1075,1105,1106,1111" isDoc="" nodeType="1110" creatorName="DoDat" writerName="DoDat" writerID="0" template="0" nodeTypeAlias="banGiamDocItem" isPublished="true"><capBac><![CDATA[Trung Tướng]]></capBac><anh><![CDATA[umb://media/168d2bc2b4a244c199ab9277602ad2e7]]></anh><hoTen><![CDATA[Nguyễn Công Định]]></hoTen><danhHieu><![CDATA[GSTS]]></danhHieu><chucVu><![CDATA[Giám Đốc]]></chucVu></banGiamDocItem>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1112, N'<banGiamDocItem id="1112" key="bc7b7a90-875f-4fb7-9415-a976cfc68148" parentID="1106" level="5" creatorID="0" sortOrder="1" createDate="2018-04-03T15:31:59" updateDate="2018-04-03T15:31:59" nodeName="Phó Giám Đốc" urlName="phó-giám-đốc" path="-1,1059,1075,1105,1106,1112" isDoc="" nodeType="1110" creatorName="DoDat" writerName="DoDat" writerID="0" template="0" nodeTypeAlias="banGiamDocItem" isPublished="true"><capBac><![CDATA[ád]]></capBac><hoTen><![CDATA[Lê Minh Thái]]></hoTen><danhHieu><![CDATA[ád]]></danhHieu><chucVu><![CDATA[ád]]></chucVu></banGiamDocItem>')
SET IDENTITY_INSERT [dbo].[cmsDataType] ON 

INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (-28, -97, N'Umbraco.ListView', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (-27, -96, N'Umbraco.ListView', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (-26, -95, N'Umbraco.ListView', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (1, -49, N'Umbraco.TrueFalse', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (2, -51, N'Umbraco.Integer', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (3, -87, N'Umbraco.TinyMCEv3', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (4, -88, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (5, -89, N'Umbraco.TextboxMultiple', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (6, -90, N'Umbraco.UploadField', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (7, -92, N'Umbraco.NoEdit', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (8, -36, N'Umbraco.DateTime', N'Date')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (9, -37, N'Umbraco.ColorPickerAlias', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (11, -39, N'Umbraco.DropDownMultiple', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (12, -40, N'Umbraco.RadioButtonList', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (13, -41, N'Umbraco.Date', N'Date')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (14, -42, N'Umbraco.DropDown', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (15, -43, N'Umbraco.CheckBoxList', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (22, 1041, N'Umbraco.Tags', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (24, 1043, N'Umbraco.ImageCropper', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (26, 1046, N'Umbraco.ContentPicker2', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (27, 1047, N'Umbraco.MemberPicker2', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (28, 1048, N'Umbraco.MediaPicker2', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (29, 1049, N'Umbraco.MediaPicker2', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (30, 1050, N'Umbraco.RelatedLinks2', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (31, 1065, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (32, 1066, N'Umbraco.Decimal', N'Decimal')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (33, 1097, N'Umbraco.Date', N'Date')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (34, 1098, N'Umbraco.DateTime', N'Date')
SET IDENTITY_INSERT [dbo].[cmsDataType] OFF
SET IDENTITY_INSERT [dbo].[cmsDataTypePreValues] ON 

INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-9, -96, N'[{"alias":"updateDate","header":"Last edited","isSystem":1},{"alias":"owner","header":"Updated by","isSystem":1}]', 5, N'includeProperties')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-8, -96, N'[{"name": "Grid","path": "views/propertyeditors/listview/layouts/grid/grid.html", "icon": "icon-thumbnails-small", "isSystem": 1, "selected": true},{"name": "List","path": "views/propertyeditors/listview/layouts/list/list.html","icon": "icon-list", "isSystem": 1,"selected": true}]', 4, N'layouts')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-7, -96, N'desc', 3, N'orderDirection')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-6, -96, N'updateDate', 2, N'orderBy')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-5, -96, N'100', 1, N'pageSize')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-4, -97, N'[{"alias":"username","isSystem":1},{"alias":"email","isSystem":1},{"alias":"updateDate","header":"Last edited","isSystem":1}]', 4, N'includeProperties')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-3, -97, N'asc', 3, N'orderDirection')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-2, -97, N'username', 2, N'orderBy')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-1, -97, N'10', 1, N'pageSize')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (3, -87, N',code,undo,redo,cut,copy,mcepasteword,stylepicker,bold,italic,bullist,numlist,outdent,indent,mcelink,unlink,mceinsertanchor,mceimage,umbracomacro,mceinserttable,umbracoembed,mcecharmap,|1|1,2,3,|0|500,400|1049,|true|', 0, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (4, 1041, N'default', 0, N'group')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (6, 1049, N'1', 0, N'multiPicker')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (7, 1065, NULL, 1, N'maxChars')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (8, 1066, NULL, 1, N'min')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (9, 1066, NULL, 2, N'step')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (10, 1066, NULL, 3, N'max')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (11, 1097, N'YYYY-MM-DD', 1, N'format')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (12, 1098, N'0', 1, N'offsetTime')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (13, 1098, N'YYYY-MM-DD HH:mm:ss', 2, N'format')
SET IDENTITY_INSERT [dbo].[cmsDataTypePreValues] OFF
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1059, 0, 0, N'a2b444a3-c811-49b7-894f-01e53562fa62', N'Trang Chu', NULL, NULL, CAST(0x0000A8AF00BDB4A3 AS DateTime), 1055, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1102, 1, 0, N'df87cbfd-c6c4-47cd-aeca-020fea81183d', N'Tiềm lực', NULL, NULL, CAST(0x0000A8B700F98611 AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1096, 1, 0, N'e5f05a07-852e-452b-9f56-0a6a854293ef', N'Giới Thiệu Chung', NULL, NULL, CAST(0x0000A8B701027ECD AS DateTime), 1095, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1100, 0, 0, N'cf1de4d3-4f68-4396-abc5-174722806e31', N'Chức năng, nhiệm vụ', NULL, NULL, CAST(0x0000A8B60158B286 AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1079, 0, 0, N'7f8d0085-d327-4903-aced-19e96736aea0', N'Tuyển Sinh', NULL, NULL, CAST(0x0000A8B700F96675 AS DateTime), 1069, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1096, 0, 0, N'4101342d-a5a5-4659-9621-1bfefa21ed25', N'Giới Thiệu Chung', NULL, NULL, CAST(0x0000A8B60156F2B7 AS DateTime), 1095, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1101, 1, 0, N'75f4ad5e-8ef9-43c4-b5db-1dde9e407c3f', N'Sứ mạng, mục tiêu đào tạo', NULL, NULL, CAST(0x0000A8B700F98866 AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1079, 0, 0, N'bc234aef-3dd1-4d32-9182-20bb3f469475', N'Tuyển Sinh', NULL, NULL, CAST(0x0000A8B700F0210F AS DateTime), 1069, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1094, 0, 0, N'a22bd5a0-9729-4fa6-876c-21722066cbca', N'Giới Thiệu Chung', NULL, NULL, CAST(0x0000A8B700F67B4A AS DateTime), 1095, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1086, 1, 0, N'f19f46ef-002e-4efe-bbd7-23b32d4c8b5f', N'KHỐI PHÒNG CHỨC NĂNG', NULL, NULL, CAST(0x0000A8B700F996E6 AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1077, 0, 0, N'6e6c2e85-bca2-4155-b01d-29f0b385a429', N'Đào Tạo', NULL, NULL, CAST(0x0000A8B700F02113 AS DateTime), 1068, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1086, 0, 0, N'6ab80cad-7dd7-4ae9-a280-29fbb955a0d6', N'KHỐI PHÒNG CHỨC NĂNG', NULL, NULL, CAST(0x0000A8B700F02130 AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1106, 1, 0, N'ed9e38ff-333a-4357-bbf6-2f9184f0ae64', N'Ban Giám Đốc', NULL, NULL, CAST(0x0000A8B70102B538 AS DateTime), 1103, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1087, 0, 0, N'f5b30734-8a77-43fd-a765-351ca77f22a7', N'KHỐI VIỆN, TRUNG TÂM', NULL, NULL, CAST(0x0000A8B30082CD79 AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1059, 0, 0, N'f3cf2ef9-2043-4502-9ca0-366221e47eb7', N'Trang Chu', NULL, NULL, CAST(0x0000A8B700F0E219 AS DateTime), 1055, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1059, 0, 0, N'9850175a-e883-4f30-b673-3f8d39114e32', N'Trang Chu', NULL, NULL, CAST(0x0000A8B700F020C9 AS DateTime), 1055, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1094, 0, 0, N'af444c3f-ab2f-4137-8c00-45f4a561eefa', N'Giới Thiệu Chung', NULL, NULL, CAST(0x0000A8B60156D50B AS DateTime), 1095, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1099, 0, 0, N'0470ff7b-33d9-447d-88e9-491096aaab2b', N'Lịch sử phát triển và các thành tích tiêu biểu', NULL, NULL, CAST(0x0000A8B700F96664 AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1094, 0, 0, N'8b8864b2-c1a8-48b6-9ef3-4a71412964ef', N'Giới Thiệu Chung', NULL, NULL, CAST(0x0000A8B30091394E AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1113, 0, 0, N'e139af38-a987-4f7a-9fc9-4d97a2165a4d', N'Trang Chủ', NULL, NULL, CAST(0x0000A8B7010142E1 AS DateTime), 1055, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1105, 1, 0, N'9cbf6fb6-e765-4a05-8358-53e2e14bf51b', N'Cơ Cấu Tổ Chức', NULL, NULL, CAST(0x0000A8B700FD7528 AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1113, 0, 0, N'3c04fc45-2746-49a4-8d7d-56595316f6fa', N'Trang Chủ', NULL, NULL, CAST(0x0000A8B701012165 AS DateTime), 1055, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1100, 0, 0, N'f65caf8c-8db5-4e8f-ba5a-5865187f7572', N'Chức năng, nhiệm vụ', NULL, NULL, CAST(0x0000A8B700F9666E AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1087, 0, 0, N'7685c9d8-99ac-4682-bd37-5aaaf45405b2', N'KHỐI VIỆN, TRUNG TÂM', NULL, NULL, CAST(0x0000A8B700F021AC AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1099, 1, 0, N'd52bfacf-e780-45bb-aee2-5c693d643b8f', N'Lịch sử phát triển và các thành tích tiêu biểu', NULL, NULL, CAST(0x0000A8B700F98B8A AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1079, 0, 0, N'5cf68d67-3b4f-4522-952c-5c77558044a2', N'Tuyển Sinh', NULL, NULL, CAST(0x0000A8B000F3E928 AS DateTime), 1069, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1106, 0, 0, N'd82f274d-d976-4b6a-a1c1-5f119eb3c8b4', N'Ban Giám Đốc', NULL, NULL, CAST(0x0000A8B700FE0B87 AS DateTime), 1103, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1102, 0, 0, N'f096073c-3d33-47fa-87b5-6003e2150e4a', N'Tiềm lực', NULL, NULL, CAST(0x0000A8B700F96657 AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1101, 0, 0, N'239410eb-ef0e-43c4-b91c-67407779600c', N'Sứ mạng, mục tiêu đào tạo', NULL, NULL, CAST(0x0000A8B700F021B1 AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1077, 0, 0, N'b940bfa2-1df4-462b-af23-67ef5fbb6d6c', N'Đào Tạo', NULL, NULL, CAST(0x0000A8B000F342BE AS DateTime), 1068, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1101, 0, 0, N'7c53c7fb-8414-4b4b-b686-6dba399c0db5', N'Sứ mạng, mục tiêu đào tạo', NULL, NULL, CAST(0x0000A8B700F02186 AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1075, 0, 0, N'c5ac862d-6da6-4c9d-a540-718566a36d13', N'Giới Thiệu', NULL, NULL, CAST(0x0000A8B700F021A7 AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1094, 0, 0, N'3d72145c-d6a9-4244-9941-75c301d8288b', N'Giới Thiệu Chung', NULL, NULL, CAST(0x0000A8B700F67B3E AS DateTime), 1095, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1086, 0, 0, N'86a80fbc-f0af-4aa8-95d7-761f58043ca9', N'KHỐI PHÒNG CHỨC NĂNG', NULL, NULL, CAST(0x0000A8B700F96672 AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1096, 0, 0, N'5353f7ad-876f-4150-9154-76bcf780feef', N'Giới Thiệu Chung', NULL, NULL, CAST(0x0000A8B700F021AB AS DateTime), 1095, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1101, 0, 0, N'f0e4f83b-139b-4511-9f5b-7e375daf4340', N'Sứ mạng, mục tiêu đào tạo', NULL, NULL, CAST(0x0000A8B700F9665D AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1094, 0, 0, N'5f0440a8-4e09-4308-8fe3-814933f8c2ce', N'Giới Thiệu Chung', NULL, NULL, CAST(0x0000A8B60156D526 AS DateTime), 1095, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1099, 0, 0, N'7bebb272-5378-4f74-9ef6-81deae9296e8', N'Lịch sử phát triển và các thành tích tiêu biểu', NULL, NULL, CAST(0x0000A8B601624873 AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1111, 1, 0, N'cca9ec74-ffc3-445d-8f9c-88eeefe6fdae', N'Giám Đốc', NULL, NULL, CAST(0x0000A8B700FFD243 AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1087, 0, 0, N'be28c0cc-5fe8-476a-80a9-892db6cbb9ef', N'KHỐI VIỆN, TRUNG TÂM', NULL, NULL, CAST(0x0000A8B700F0211A AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1077, 0, 0, N'45db02b8-3fac-4d04-a641-89a7aa888610', N'Đào Tạo', NULL, NULL, CAST(0x0000A8B700F021A9 AS DateTime), 1068, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1087, 1, 0, N'7b99fa0e-cd08-460b-835f-8b62aaa85503', N'KHỐI VIỆN, TRUNG TÂM', NULL, NULL, CAST(0x0000A8B700FC9FE9 AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1087, 0, 0, N'1e51396a-9705-474c-b329-8c5e4e8eb9f5', N'KHỐI VIỆN, TRUNG TÂM', NULL, NULL, CAST(0x0000A8B700F96670 AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1099, 0, 0, N'26d246ad-6ec9-4b44-9143-9359084a4a12', N'Lịch sử phát triển và các thành tích tiêu biểu', NULL, NULL, CAST(0x0000A8B700F021B3 AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1059, 0, 0, N'f1e551e9-3f66-4f18-ab11-949a7eea64ee', N'Trang Chu', NULL, NULL, CAST(0x0000A8B700F9661B AS DateTime), 1055, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1086, 0, 0, N'fcd09c11-e991-4f31-9809-99c9591906c6', N'x', NULL, NULL, CAST(0x0000A8B30079F8B1 AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1075, 0, 0, N'fc7cd625-b16a-4cb2-9d15-9b0a1f10b5d8', N'Giới Thiệu', NULL, NULL, CAST(0x0000A8B700F9664C AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1102, 0, 0, N'85ede54f-6d08-45fb-939d-9b0d371e6622', N'Tiềm lực', NULL, NULL, CAST(0x0000A8B60164AB22 AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1100, 0, 0, N'7053ea2f-be52-4611-8d0f-a2b259dd4f89', N'Chức năng, nhiệm vụ', NULL, NULL, CAST(0x0000A8B700F02195 AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1094, 0, 0, N'7958112e-897f-4176-8a9e-a6fe2387bd6a', N'Giới Thiệu Chung', NULL, NULL, CAST(0x0000A8B700F634CF AS DateTime), 1095, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1094, 0, 0, N'0377dfa3-ba48-4b63-9b14-a85f32f7f262', N'Giới Thiệu Chung', NULL, NULL, CAST(0x0000A8B60150E5B1 AS DateTime), 1095, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1096, 0, 0, N'7f65daa1-3f15-4f9c-9b3a-b34d72dc38b8', N'Giới Thiệu Chung', NULL, NULL, CAST(0x0000A8B700F02118 AS DateTime), 1095, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1075, 0, 0, N'ab047191-bec7-4a7b-89b1-b41abf99dbf9', N'Giới Thiệu', NULL, NULL, CAST(0x0000A8B700F02108 AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1094, 0, 0, N'4e4ee0c9-d6df-43d5-bbc1-b476399e24d1', N'Giới Thiệu Chung', NULL, NULL, CAST(0x0000A8B700F65140 AS DateTime), 1095, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1100, 1, 0, N'1ebe9658-1a78-42ce-a48d-b602af84af9b', N'Chức năng, nhiệm vụ', NULL, NULL, CAST(0x0000A8B700F98E28 AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1096, 0, 0, N'fd2bb135-f41f-463e-841b-b9e0e219fbc7', N'Giới Thiệu Chung', NULL, NULL, CAST(0x0000A8B700F96650 AS DateTime), 1095, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1101, 0, 0, N'ad59612a-3485-4a84-bbde-c3eb6c1c9318', N'Sứ mạng, mục tiêu đào tạo', NULL, NULL, CAST(0x0000A8B601648CD4 AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1102, 0, 0, N'27210fe1-f718-4fa4-9267-c8e5e90c3b7e', N'Tiềm lực', NULL, NULL, CAST(0x0000A8B700F021B0 AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1075, 0, 0, N'cffba5b8-741e-4785-af1c-ce532503b113', N'Giới Thiệu', NULL, NULL, CAST(0x0000A8B6016313F2 AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1112, 1, 0, N'25ee7aaf-c56d-40a3-bedc-d0897d47b62f', N'Phó Giám Đốc', NULL, NULL, CAST(0x0000A8B700FFFADA AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1059, 1, 0, N'f66f4f10-ed7c-4c1c-852f-d216b3c2db93', N'Trang Chu', NULL, NULL, CAST(0x0000A8B700F97231 AS DateTime), 1055, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1099, 0, 0, N'2426b643-8bcd-4727-81cc-d7d509324a32', N'Lịch sử phát triển và các thành tích tiêu biểu', NULL, NULL, CAST(0x0000A8B700F0218F AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1087, 0, 0, N'd82194c2-75e5-427f-9dad-e2c90e0529d1', N'KHỐI VIỆN, TRUNG TÂM', NULL, NULL, CAST(0x0000A8B300826E28 AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1102, 0, 0, N'65305876-844c-4aa6-b8d5-e444686482a4', N'Tiềm lực', NULL, NULL, CAST(0x0000A8B700F0217C AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1100, 0, 0, N'9274556f-cf17-44e6-ac26-e75c5b5b099c', N'Chức năng, nhiệm vụ', NULL, NULL, CAST(0x0000A8B700F021B4 AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1086, 0, 0, N'6dc35893-cbbf-44d4-ab97-e8672c569117', N'KHỐI PHÒNG CHỨC NĂNG', NULL, NULL, CAST(0x0000A8B700F021AE AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1079, 0, 0, N'9a165545-f33e-4ef9-8e96-ebe66bfb98f8', N'Tuyển Sinh', NULL, NULL, CAST(0x0000A8B700F021A8 AS DateTime), 1069, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1113, 0, 0, N'faa1400f-5840-4d07-b868-eebd4d8b987c', N'Trang Chủ', NULL, NULL, CAST(0x0000A8B7010142EE AS DateTime), 1055, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1077, 0, 0, N'050056f5-faac-492f-bb2c-f37c657d9216', N'Đào Tạo', NULL, NULL, CAST(0x0000A8B700F96677 AS DateTime), 1068, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1086, 0, 0, N'fc8e5bd2-8915-42bd-a8ab-f40d4121d145', N'KHỐI PHÒNG CHỨC NĂNG', NULL, NULL, CAST(0x0000A8B300823DEC AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1075, 1, 0, N'a395d095-c2be-43a8-add3-f6a65e0298ff', N'Giới Thiệu', NULL, NULL, CAST(0x0000A8B700FD8042 AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1058, 1055, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1060, 1056, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1076, 1068, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1078, 1069, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1091, 1095, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1104, 1103, 1)
INSERT [dbo].[cmsMedia] ([nodeId], [versionId], [mediaPath]) VALUES (1107, N'836c1dd8-2284-4b68-9727-e49f660db768', NULL)
INSERT [dbo].[cmsMedia] ([nodeId], [versionId], [mediaPath]) VALUES (1108, N'9ea9e42b-321f-4bd0-8c97-4b2ad0646878', NULL)
INSERT [dbo].[cmsMedia] ([nodeId], [versionId], [mediaPath]) VALUES (1109, N'03bd1d74-9779-4e04-8ce1-1d4289bb0e64', N'/media/1001/17693096_1774836219498459_887219102_o.jpg')
SET IDENTITY_INSERT [dbo].[cmsMemberType] ON 

INSERT [dbo].[cmsMemberType] ([pk], [NodeId], [propertytypeId], [memberCanEdit], [viewOnProfile], [isSensitive]) VALUES (1, 1044, 35, 0, 0, 0)
INSERT [dbo].[cmsMemberType] ([pk], [NodeId], [propertytypeId], [memberCanEdit], [viewOnProfile], [isSensitive]) VALUES (2, 1044, 36, 0, 0, 0)
INSERT [dbo].[cmsMemberType] ([pk], [NodeId], [propertytypeId], [memberCanEdit], [viewOnProfile], [isSensitive]) VALUES (3, 1044, 28, 0, 0, 0)
INSERT [dbo].[cmsMemberType] ([pk], [NodeId], [propertytypeId], [memberCanEdit], [viewOnProfile], [isSensitive]) VALUES (4, 1044, 29, 0, 0, 0)
INSERT [dbo].[cmsMemberType] ([pk], [NodeId], [propertytypeId], [memberCanEdit], [viewOnProfile], [isSensitive]) VALUES (5, 1044, 30, 0, 0, 0)
INSERT [dbo].[cmsMemberType] ([pk], [NodeId], [propertytypeId], [memberCanEdit], [viewOnProfile], [isSensitive]) VALUES (6, 1044, 31, 0, 0, 0)
INSERT [dbo].[cmsMemberType] ([pk], [NodeId], [propertytypeId], [memberCanEdit], [viewOnProfile], [isSensitive]) VALUES (7, 1044, 32, 0, 0, 0)
INSERT [dbo].[cmsMemberType] ([pk], [NodeId], [propertytypeId], [memberCanEdit], [viewOnProfile], [isSensitive]) VALUES (8, 1044, 33, 0, 0, 0)
INSERT [dbo].[cmsMemberType] ([pk], [NodeId], [propertytypeId], [memberCanEdit], [viewOnProfile], [isSensitive]) VALUES (9, 1044, 34, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[cmsMemberType] OFF
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1059, N'a2b444a3-c811-49b7-894f-01e53562fa62', CAST(0x0000A8AF00BDB4B5 AS DateTime), N'<trangChu id="1059" key="98ddf55b-0e71-4441-bb44-36f2c5b3076b" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2018-03-26T11:30:41" updateDate="2018-03-26T11:30:41" nodeName="Trang Chu" urlName="trang-chu" path="-1,1059" isDoc="" nodeType="1058" creatorName="DoDat" writerName="DoDat" writerID="0" template="1055" nodeTypeAlias="trangChu" isPublished="true" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1059, N'f3cf2ef9-2043-4502-9ca0-366221e47eb7', CAST(0x0000A8B700F0E238 AS DateTime), N'<trangChu id="1059" key="98ddf55b-0e71-4441-bb44-36f2c5b3076b" parentID="-1" level="1" creatorID="0" sortOrder="4" createDate="2018-03-26T11:30:41" updateDate="2018-04-03T14:37:01" nodeName="Trang Chu" urlName="trang-chu" path="-1,-20,1059" isDoc="" nodeType="1058" creatorName="DoDat" writerName="DoDat" writerID="0" template="1055" nodeTypeAlias="trangChu" isPublished="false" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1059, N'f1e551e9-3f66-4f18-ab11-949a7eea64ee', CAST(0x0000A8B700F96624 AS DateTime), N'<trangChu id="1059" key="98ddf55b-0e71-4441-bb44-36f2c5b3076b" parentID="-1" level="1" creatorID="0" sortOrder="1" createDate="2018-03-26T11:30:41" updateDate="2018-04-03T15:08:02" nodeName="Trang Chu" urlName="trang-chu" path="-1,1059" isDoc="" nodeType="1058" creatorName="DoDat" writerName="DoDat" writerID="0" template="1055" nodeTypeAlias="trangChu" isPublished="false" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1059, N'f66f4f10-ed7c-4c1c-852f-d216b3c2db93', CAST(0x0000A8B700F97235 AS DateTime), N'<trangChu id="1059" key="98ddf55b-0e71-4441-bb44-36f2c5b3076b" parentID="-1" level="1" creatorID="0" sortOrder="1" createDate="2018-03-26T11:30:41" updateDate="2018-04-03T15:08:12" nodeName="Trang Chu" urlName="trang-chu" path="-1,1059" isDoc="" nodeType="1058" creatorName="DoDat" writerName="DoDat" writerID="0" template="1055" nodeTypeAlias="trangChu" isPublished="true" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1075, N'fc7cd625-b16a-4cb2-9d15-9b0a1f10b5d8', CAST(0x0000A8B700F9664E AS DateTime), N'<gioiThieu id="1075" key="cce7a73c-7747-4c3a-8c32-87ebe1819b79" parentID="1059" level="2" creatorID="0" sortOrder="7" createDate="2018-03-27T14:35:35" updateDate="2018-04-03T15:08:02" nodeName="Giới Thiệu" urlName="giới-thiệu" path="-1,1059,1075" isDoc="" nodeType="1074" creatorName="DoDat" writerName="DoDat" writerID="0" template="0" nodeTypeAlias="gioiThieu" isPublished="false" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1075, N'cffba5b8-741e-4785-af1c-ce532503b113', CAST(0x0000A8B6016313F5 AS DateTime), N'<gioiThieu id="1075" key="cce7a73c-7747-4c3a-8c32-87ebe1819b79" parentID="1059" level="2" creatorID="0" sortOrder="1" createDate="2018-03-27T14:35:35" updateDate="2018-04-02T21:32:47" nodeName="Giới Thiệu" urlName="giới-thiệu" path="-1,1059,1075" isDoc="" nodeType="1074" creatorName="DoDat" writerName="DoDat" writerID="0" template="0" nodeTypeAlias="gioiThieu" isPublished="true" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1075, N'a395d095-c2be-43a8-add3-f6a65e0298ff', CAST(0x0000A8B701025A80 AS DateTime), N'<gioiThieu id="1075" key="cce7a73c-7747-4c3a-8c32-87ebe1819b79" parentID="1059" level="2" creatorID="0" sortOrder="7" createDate="2018-03-27T14:35:35" updateDate="2018-04-03T15:22:58" nodeName="Giới Thiệu" urlName="giới-thiệu" path="-1,1059,1075" isDoc="" nodeType="1074" creatorName="DoDat" writerName="DoDat" writerID="0" template="0" nodeTypeAlias="gioiThieu" isPublished="false" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1077, N'b940bfa2-1df4-462b-af23-67ef5fbb6d6c', CAST(0x0000A8B000F342C3 AS DateTime), N'<daoTao id="1077" key="ceb76210-5d12-4d2a-a60a-13489c9b0c9f" parentID="1059" level="2" creatorID="0" sortOrder="2" createDate="2018-03-27T14:45:41" updateDate="2018-03-27T14:45:41" nodeName="Đào Tạo" urlName="đào-tạo" path="-1,1059,1077" isDoc="" nodeType="1076" creatorName="DoDat" writerName="DoDat" writerID="0" template="1068" nodeTypeAlias="daoTao" isPublished="true" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1077, N'050056f5-faac-492f-bb2c-f37c657d9216', CAST(0x0000A8B700F96678 AS DateTime), N'<daoTao id="1077" key="ceb76210-5d12-4d2a-a60a-13489c9b0c9f" parentID="1059" level="2" creatorID="0" sortOrder="9" createDate="2018-03-27T14:45:41" updateDate="2018-04-03T15:08:02" nodeName="Đào Tạo" urlName="đào-tạo" path="-1,1059,1077" isDoc="" nodeType="1076" creatorName="DoDat" writerName="DoDat" writerID="0" template="1068" nodeTypeAlias="daoTao" isPublished="false" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1079, N'7f8d0085-d327-4903-aced-19e96736aea0', CAST(0x0000A8B700F96675 AS DateTime), N'<tuyenSinh id="1079" key="890b02ee-7b7a-4d4e-bcc4-8ab69f5dad72" parentID="1059" level="2" creatorID="0" sortOrder="8" createDate="2018-03-27T14:48:03" updateDate="2018-04-03T15:08:02" nodeName="Tuyển Sinh" urlName="tuyển-sinh" path="-1,1059,1079" isDoc="" nodeType="1078" creatorName="DoDat" writerName="DoDat" writerID="0" template="1069" nodeTypeAlias="tuyenSinh" isPublished="false" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1079, N'5cf68d67-3b4f-4522-952c-5c77558044a2', CAST(0x0000A8B000F3E931 AS DateTime), N'<tuyenSinh id="1079" key="890b02ee-7b7a-4d4e-bcc4-8ab69f5dad72" parentID="1059" level="2" creatorID="0" sortOrder="3" createDate="2018-03-27T14:48:03" updateDate="2018-03-27T14:48:03" nodeName="Tuyển Sinh" urlName="tuyển-sinh" path="-1,1059,1079" isDoc="" nodeType="1078" creatorName="DoDat" writerName="DoDat" writerID="0" template="1069" nodeTypeAlias="tuyenSinh" isPublished="true" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1086, N'f19f46ef-002e-4efe-bbd7-23b32d4c8b5f', CAST(0x0000A8B700F996E9 AS DateTime), N'<tab id="1086" key="09e5e729-7e1f-478e-8c6a-9bf9c2c96ce7" parentID="1075" level="3" creatorID="0" sortOrder="10" createDate="2018-03-30T07:24:05" updateDate="2018-04-03T15:08:43" nodeName="KHỐI PHÒNG CHỨC NĂNG" urlName="khối-phòng-chức-năng" path="-1,1059,1075,1086" isDoc="" nodeType="1081" creatorName="DoDat" writerName="DoDat" writerID="0" template="0" nodeTypeAlias="tab" isPublished="true"><noiDung><![CDATA[<ol>
<li><span>    Phòng Chính trị. Chủ nhiệm chính trị: Đại tá, Tiến sĩ Nguyễn Minh Thắng</span></li>
<li><span>    Văn phòng. Chánh Văn phòng: Đại tá, Kỹ sư Phạm Mạnh Khái<br /></span></li>
<li><span>    Phòng Đào tạo. Trưởng phòng: Đại tá, Phó Giáo sư, Tiến sĩ Trần Xuân Nam<br /></span></li>
<li><span>    Phòng Sau đại học. Trưởng phòng: Đại tá, Phó Giáo sư, Tiến sĩ  Vũ Quốc Trụ</span></li>
<li><span>    Phòng Khoa học Quân sự. Trưởng phòng: Thượng tá, Phó Giáo sư, Tiến sĩ Nguyễn Thái Chung<br /></span></li>
<li><span>    Phòng Thông tin Khoa học Quân sự. Trưởng phòng: Đại tá, Phó Giáo sư, Tiến sĩ Nguyễn Hoàng Vũ<br /></span></li>
<li><span>    Phòng Kỹ thuật. Trưởng phòng: Đại tá, Thạc sỹ Nguyễn Văn Thủy</span></li>
<li><span>    Phòng Hậu cần. Chủ nhiệm: Đại tá, Tiến sỹ Hồ Quang Huy</span></li>
<li><span>    Ban Tài chính. Trưởng ban: Đại tá, Cử nhân Tạ Văn Hồng<br /></span></li>
<li>    Phòng Hợp tác Quốc tế và Quản lý lưu học sinh quân sự. Trưởng phòng: Trung tá, Phó Giáo sư, Tiến sĩ Nguyễn Trung Kiên</li>
<li><span>    Phòng Khảo thí và đảm bảo chất lượng giáo dục - đào tạo. Trưởng phòng: Đại tá, Tiến sĩ Đặng Huy Tú<br /></span></li>
<li><span>    Ban Quản lý dự án. Trưởng ban: Đại tá, Thạc sĩ Nguyễn Ngọc Khôi</span></li>
<li><span>    Ban Quản lý dự án Đầu tư hiện đại hóa các phòng thí nghiệm. Trưởng ban: Đại tá, Tiến sĩ Nguyễn Đăng Hải</span></li>
<li><span>    Trung tâm Công nghệ thông tin. Trưởng Trung tâm: Trung tá, Tiến sĩ Nguyễn Hoàng Sinh<br /></span></li>
<li><span>    Cơ sở II - Thành phố Hồ Chí Minh. Trưởng Đại diện phía Nam: Thượng tá Dương Ngọc Phượng</span></li>
</ol>]]></noiDung></tab>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1086, N'86a80fbc-f0af-4aa8-95d7-761f58043ca9', CAST(0x0000A8B700F96673 AS DateTime), N'<tab id="1086" key="09e5e729-7e1f-478e-8c6a-9bf9c2c96ce7" parentID="1075" level="3" creatorID="0" sortOrder="10" createDate="2018-03-30T07:24:05" updateDate="2018-04-03T15:08:02" nodeName="KHỐI PHÒNG CHỨC NĂNG" urlName="khối-phòng-chức-năng" path="-1,1059,1075,1086" isDoc="" nodeType="1081" creatorName="DoDat" writerName="DoDat" writerID="0" template="0" nodeTypeAlias="tab" isPublished="false"><noiDung><![CDATA[<ol>
<li><span>    Phòng Chính trị. Chủ nhiệm chính trị: Đại tá, Tiến sĩ Nguyễn Minh Thắng</span></li>
<li><span>    Văn phòng. Chánh Văn phòng: Đại tá, Kỹ sư Phạm Mạnh Khái<br /></span></li>
<li><span>    Phòng Đào tạo. Trưởng phòng: Đại tá, Phó Giáo sư, Tiến sĩ Trần Xuân Nam<br /></span></li>
<li><span>    Phòng Sau đại học. Trưởng phòng: Đại tá, Phó Giáo sư, Tiến sĩ  Vũ Quốc Trụ</span></li>
<li><span>    Phòng Khoa học Quân sự. Trưởng phòng: Thượng tá, Phó Giáo sư, Tiến sĩ Nguyễn Thái Chung<br /></span></li>
<li><span>    Phòng Thông tin Khoa học Quân sự. Trưởng phòng: Đại tá, Phó Giáo sư, Tiến sĩ Nguyễn Hoàng Vũ<br /></span></li>
<li><span>    Phòng Kỹ thuật. Trưởng phòng: Đại tá, Thạc sỹ Nguyễn Văn Thủy</span></li>
<li><span>    Phòng Hậu cần. Chủ nhiệm: Đại tá, Tiến sỹ Hồ Quang Huy</span></li>
<li><span>    Ban Tài chính. Trưởng ban: Đại tá, Cử nhân Tạ Văn Hồng<br /></span></li>
<li>    Phòng Hợp tác Quốc tế và Quản lý lưu học sinh quân sự. Trưởng phòng: Trung tá, Phó Giáo sư, Tiến sĩ Nguyễn Trung Kiên</li>
<li><span>    Phòng Khảo thí và đảm bảo chất lượng giáo dục - đào tạo. Trưởng phòng: Đại tá, Tiến sĩ Đặng Huy Tú<br /></span></li>
<li><span>    Ban Quản lý dự án. Trưởng ban: Đại tá, Thạc sĩ Nguyễn Ngọc Khôi</span></li>
<li><span>    Ban Quản lý dự án Đầu tư hiện đại hóa các phòng thí nghiệm. Trưởng ban: Đại tá, Tiến sĩ Nguyễn Đăng Hải</span></li>
<li><span>    Trung tâm Công nghệ thông tin. Trưởng Trung tâm: Trung tá, Tiến sĩ Nguyễn Hoàng Sinh<br /></span></li>
<li><span>    Cơ sở II - Thành phố Hồ Chí Minh. Trưởng Đại diện phía Nam: Thượng tá Dương Ngọc Phượng</span></li>
</ol>]]></noiDung></tab>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1086, N'fcd09c11-e991-4f31-9809-99c9591906c6', CAST(0x0000A8B30079F8F0 AS DateTime), N'<tab id="1086" key="09e5e729-7e1f-478e-8c6a-9bf9c2c96ce7" parentID="1075" level="3" creatorID="0" sortOrder="2" createDate="2018-03-30T07:24:05" updateDate="2018-03-30T07:24:05" nodeName="x" urlName="x" path="-1,1059,1075,1086" isDoc="" nodeType="1081" creatorName="DoDat" writerName="DoDat" writerID="0" template="0" nodeTypeAlias="tab" isPublished="true" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1086, N'fc8e5bd2-8915-42bd-a8ab-f40d4121d145', CAST(0x0000A8B300823E11 AS DateTime), N'<tab id="1086" key="09e5e729-7e1f-478e-8c6a-9bf9c2c96ce7" parentID="1075" level="3" creatorID="0" sortOrder="2" createDate="2018-03-30T07:24:05" updateDate="2018-03-30T07:54:11" nodeName="KHỐI PHÒNG CHỨC NĂNG" urlName="khối-phòng-chức-năng" path="-1,1059,1075,1086" isDoc="" nodeType="1081" creatorName="DoDat" writerName="DoDat" writerID="0" template="0" nodeTypeAlias="tab" isPublished="true"><noiDung><![CDATA[<ol>
<li><span>    Phòng Chính trị. Chủ nhiệm chính trị: Đại tá, Tiến sĩ Nguyễn Minh Thắng</span></li>
<li><span>    Văn phòng. Chánh Văn phòng: Đại tá, Kỹ sư Phạm Mạnh Khái<br /></span></li>
<li><span>    Phòng Đào tạo. Trưởng phòng: Đại tá, Phó Giáo sư, Tiến sĩ Trần Xuân Nam<br /></span></li>
<li><span>    Phòng Sau đại học. Trưởng phòng: Đại tá, Phó Giáo sư, Tiến sĩ  Vũ Quốc Trụ</span></li>
<li><span>    Phòng Khoa học Quân sự. Trưởng phòng: Thượng tá, Phó Giáo sư, Tiến sĩ Nguyễn Thái Chung<br /></span></li>
<li><span>    Phòng Thông tin Khoa học Quân sự. Trưởng phòng: Đại tá, Phó Giáo sư, Tiến sĩ Nguyễn Hoàng Vũ<br /></span></li>
<li><span>    Phòng Kỹ thuật. Trưởng phòng: Đại tá, Thạc sỹ Nguyễn Văn Thủy</span></li>
<li><span>    Phòng Hậu cần. Chủ nhiệm: Đại tá, Tiến sỹ Hồ Quang Huy</span></li>
<li><span>    Ban Tài chính. Trưởng ban: Đại tá, Cử nhân Tạ Văn Hồng<br /></span></li>
<li>    Phòng Hợp tác Quốc tế và Quản lý lưu học sinh quân sự. Trưởng phòng: Trung tá, Phó Giáo sư, Tiến sĩ Nguyễn Trung Kiên</li>
<li><span>    Phòng Khảo thí và đảm bảo chất lượng giáo dục - đào tạo. Trưởng phòng: Đại tá, Tiến sĩ Đặng Huy Tú<br /></span></li>
<li><span>    Ban Quản lý dự án. Trưởng ban: Đại tá, Thạc sĩ Nguyễn Ngọc Khôi</span></li>
<li><span>    Ban Quản lý dự án Đầu tư hiện đại hóa các phòng thí nghiệm. Trưởng ban: Đại tá, Tiến sĩ Nguyễn Đăng Hải</span></li>
<li><span>    Trung tâm Công nghệ thông tin. Trưởng Trung tâm: Trung tá, Tiến sĩ Nguyễn Hoàng Sinh<br /></span></li>
<li><span>    Cơ sở II - Thành phố Hồ Chí Minh. Trưởng Đại diện phía Nam: Thượng tá Dương Ngọc Phượng</span></li>
</ol>]]></noiDung></tab>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1087, N'f5b30734-8a77-43fd-a765-351ca77f22a7', CAST(0x0000A8B30082CD81 AS DateTime), N'<tab id="1087" key="9dd8b2b2-2b5e-48df-bf69-b41d934a582d" parentID="1075" level="3" creatorID="0" sortOrder="3" createDate="2018-03-30T07:54:39" updateDate="2018-03-30T07:56:14" nodeName="KHỐI VIỆN, TRUNG TÂM" urlName="khối-viện-trung-tâm" path="-1,1059,1075,1087" isDoc="" nodeType="1081" creatorName="DoDat" writerName="DoDat" writerID="0" template="0" nodeTypeAlias="tab" isPublished="true"><noiDung><![CDATA[<p><span>1. Viện Công nghệ Mô phỏng. Viện trưởng: Đại tá, Phó Giáo sư, Tiến sĩ Mai Quang Huy   </span></p>
<p><span>2.Viện Kỹ thuật công trình đặc biệt. Viện trưởng: Đại tá, Phó Giáo sư, Tiến sĩ Nguyễn Trí </span></p>
<p><span>3.Viện Tích hợp hệ thống. Viện Trưởng: Đại tá, Tiến sĩ Lê Đại Phong<br /></span></p>
<p> </p>
<ol>
<li><span>Trung tâm Công nghệ. Trưởng Trung tâm: Trung tá, Phó Giáo sư, Tiến sĩ Trần Đức Tăng<br /></span></li>
<li><span>Trung tâm huấn luyện 125 - Vĩnh Phúc. Trưởng Trung tâm: Đại tá, Thạc sĩ Trần Thanh Từ</span></li>
</ol>]]></noiDung></tab>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1087, N'7b99fa0e-cd08-460b-835f-8b62aaa85503', CAST(0x0000A8B700FC9FFE AS DateTime), N'<tab id="1087" key="9dd8b2b2-2b5e-48df-bf69-b41d934a582d" parentID="1075" level="3" creatorID="0" sortOrder="9" createDate="2018-03-30T07:54:39" updateDate="2018-04-03T15:19:46" nodeName="KHỐI VIỆN, TRUNG TÂM" urlName="khối-viện-trung-tâm" path="-1,1059,1075,1087" isDoc="" nodeType="1081" creatorName="DoDat" writerName="DoDat" writerID="0" template="0" nodeTypeAlias="tab" isPublished="true"><noiDung><![CDATA[<p><span>1. Viện Công nghệ Mô phỏng. Viện trưởng: Đại tá, Phó Giáo sư, Tiến sĩ Mai Quang Huy   </span></p>
<p><span>2.Viện Kỹ thuật công trình đặc biệt. Viện trưởng: Đại tá, Phó Giáo sư, Tiến sĩ Nguyễn Trí </span></p>
<p><span>3.Viện Tích hợp hệ thống. Viện Trưởng: Đại tá, Tiến sĩ Lê Đại Phong<br /></span></p>
<p> </p>
<ol>
<li><span>Trung tâm Công nghệ. Trưởng Trung tâm: Trung tá, Phó Giáo sư, Tiến sĩ Trần Đức Tăng<br /></span></li>
<li><span>Trung tâm huấn luyện 125 - Vĩnh Phúc. Trưởng Trung tâm: Đại tá, Thạc sĩ Trần Thanh Từ</span></li>
</ol>]]></noiDung></tab>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1087, N'1e51396a-9705-474c-b329-8c5e4e8eb9f5', CAST(0x0000A8B700F96671 AS DateTime), N'<tab id="1087" key="9dd8b2b2-2b5e-48df-bf69-b41d934a582d" parentID="1075" level="3" creatorID="0" sortOrder="9" createDate="2018-03-30T07:54:39" updateDate="2018-04-03T15:08:02" nodeName="KHỐI VIỆN, TRUNG TÂM" urlName="khối-viện-trung-tâm" path="-1,1059,1075,1087" isDoc="" nodeType="1081" creatorName="DoDat" writerName="DoDat" writerID="0" template="0" nodeTypeAlias="tab" isPublished="false"><noiDung><![CDATA[<p><span>1. Viện Công nghệ Mô phỏng. Viện trưởng: Đại tá, Phó Giáo sư, Tiến sĩ Mai Quang Huy   </span></p>
<p><span>2.Viện Kỹ thuật công trình đặc biệt. Viện trưởng: Đại tá, Phó Giáo sư, Tiến sĩ Nguyễn Trí </span></p>
<p><span>3.Viện Tích hợp hệ thống. Viện Trưởng: Đại tá, Tiến sĩ Lê Đại Phong<br /></span></p>
<p> </p>
<ol>
<li><span>Trung tâm Công nghệ. Trưởng Trung tâm: Trung tá, Phó Giáo sư, Tiến sĩ Trần Đức Tăng<br /></span></li>
<li><span>Trung tâm huấn luyện 125 - Vĩnh Phúc. Trưởng Trung tâm: Đại tá, Thạc sĩ Trần Thanh Từ</span></li>
</ol>]]></noiDung></tab>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1087, N'd82194c2-75e5-427f-9dad-e2c90e0529d1', CAST(0x0000A8B300826E38 AS DateTime), N'<tab id="1087" key="9dd8b2b2-2b5e-48df-bf69-b41d934a582d" parentID="1075" level="3" creatorID="0" sortOrder="3" createDate="2018-03-30T07:54:39" updateDate="2018-03-30T07:54:52" nodeName="KHỐI VIỆN, TRUNG TÂM" urlName="khối-viện-trung-tâm" path="-1,1059,1075,1087" isDoc="" nodeType="1081" creatorName="DoDat" writerName="DoDat" writerID="0" template="0" nodeTypeAlias="tab" isPublished="true"><noiDung><![CDATA[<ol>
<ol>
<li><span>Viện Công nghệ Mô phỏng. Viện trưởng: Đại tá, Phó Giáo sư, Tiến sĩ Mai Quang Huy</span></li>
<li><span>Viện Kỹ thuật công trình đặc biệt. Viện trưởng: Đại tá, Phó Giáo sư, Tiến sĩ Nguyễn Trí Tá</span></li>
<li><span>Viện Tích hợp hệ thống. Viện Trưởng: Đại tá, Tiến sĩ Lê Đại Phong<br /></span></li>
</ol>
</ol>
<p> </p>
<ol>
<li><span>Trung tâm Công nghệ. Trưởng Trung tâm: Trung tá, Phó Giáo sư, Tiến sĩ Trần Đức Tăng<br /></span></li>
<li><span>Trung tâm huấn luyện 125 - Vĩnh Phúc. Trưởng Trung tâm: Đại tá, Thạc sĩ Trần Thanh Từ</span></li>
</ol>]]></noiDung></tab>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1094, N'8b8864b2-c1a8-48b6-9ef3-4a71412964ef', CAST(0x0000A8B300913956 AS DateTime), N'<gioiThieuChung id="1094" key="ad3db2a5-373f-4256-ba71-378186c4d7f5" parentID="1075" level="3" creatorID="0" sortOrder="4" createDate="2018-03-30T08:48:44" updateDate="2018-03-30T08:48:44" nodeName="Giới Thiệu Chung" urlName="giới-thiệu-chung" path="-1,1059,1075,1094" isDoc="" nodeType="1091" creatorName="DoDat" writerName="DoDat" writerID="0" template="1088" nodeTypeAlias="gioiThieuChung" isPublished="true" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1094, N'7958112e-897f-4176-8a9e-a6fe2387bd6a', CAST(0x0000A8B700F634DC AS DateTime), N'<gioiThieuChung id="1094" key="ad3db2a5-373f-4256-ba71-378186c4d7f5" parentID="-1" level="1" creatorID="0" sortOrder="1" createDate="2018-03-30T08:48:44" updateDate="2018-04-03T14:56:24" nodeName="Giới Thiệu Chung" urlName="giới-thiệu-chung" path="-1,1094" isDoc="" nodeType="1091" creatorName="DoDat" writerName="DoDat" writerID="0" template="1095" nodeTypeAlias="gioiThieuChung" isPublished="false" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1094, N'0377dfa3-ba48-4b63-9b14-a85f32f7f262', CAST(0x0000A8B6015697F1 AS DateTime), N'<gioiThieuChung id="1094" key="ad3db2a5-373f-4256-ba71-378186c4d7f5" parentID="1075" level="3" creatorID="0" sortOrder="4" createDate="2018-03-30T08:48:44" updateDate="2018-04-02T20:26:36" nodeName="Giới Thiệu Chung" urlName="giới-thiệu-chung" path="-1,1059,1075,1094" isDoc="" nodeType="1091" creatorName="DoDat" writerName="DoDat" writerID="0" template="1095" nodeTypeAlias="gioiThieuChung" isPublished="false" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1094, N'4e4ee0c9-d6df-43d5-bbc1-b476399e24d1', CAST(0x0000A8B700F6514F AS DateTime), N'<gioiThieuChung id="1094" key="ad3db2a5-373f-4256-ba71-378186c4d7f5" parentID="-1" level="1" creatorID="0" sortOrder="1" createDate="2018-03-30T08:48:44" updateDate="2018-04-03T14:56:48" nodeName="Giới Thiệu Chung" urlName="giới-thiệu-chung" path="-1,1094" isDoc="" nodeType="1091" creatorName="DoDat" writerName="DoDat" writerID="0" template="1095" nodeTypeAlias="gioiThieuChung" isPublished="true" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1096, N'e5f05a07-852e-452b-9f56-0a6a854293ef', CAST(0x0000A8B701027ED6 AS DateTime), N'<gioiThieuChung id="1096" key="30865ed4-81b4-4180-a108-8b9d20d5ca7b" parentID="1075" level="3" creatorID="0" sortOrder="8" createDate="2018-04-02T20:48:38" updateDate="2018-04-03T15:41:09" nodeName="Giới Thiệu Chung" urlName="giới-thiệu-chung" path="-1,1059,1075,1096" isDoc="" nodeType="1091" creatorName="DoDat" writerName="DoDat" writerID="0" template="1095" nodeTypeAlias="gioiThieuChung" isPublished="true" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1096, N'4101342d-a5a5-4659-9621-1bfefa21ed25', CAST(0x0000A8B60156F2BB AS DateTime), N'<gioiThieuChung id="1096" key="30865ed4-81b4-4180-a108-8b9d20d5ca7b" parentID="1075" level="3" creatorID="0" sortOrder="4" createDate="2018-04-02T20:48:38" updateDate="2018-04-02T20:48:38" nodeName="Giới Thiệu Chung" urlName="giới-thiệu-chung" path="-1,1059,1075,1096" isDoc="" nodeType="1091" creatorName="DoDat" writerName="DoDat" writerID="0" template="1095" nodeTypeAlias="gioiThieuChung" isPublished="true" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1096, N'fd2bb135-f41f-463e-841b-b9e0e219fbc7', CAST(0x0000A8B700F96651 AS DateTime), N'<gioiThieuChung id="1096" key="30865ed4-81b4-4180-a108-8b9d20d5ca7b" parentID="1075" level="3" creatorID="0" sortOrder="8" createDate="2018-04-02T20:48:38" updateDate="2018-04-03T15:08:02" nodeName="Giới Thiệu Chung" urlName="giới-thiệu-chung" path="-1,1059,1075,1096" isDoc="" nodeType="1091" creatorName="DoDat" writerName="DoDat" writerID="0" template="1095" nodeTypeAlias="gioiThieuChung" isPublished="false" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1099, N'0470ff7b-33d9-447d-88e9-491096aaab2b', CAST(0x0000A8B700F9666B AS DateTime), N'<tab id="1099" key="9bde509b-c27f-4518-821b-19344113d079" parentID="1096" level="4" creatorID="0" sortOrder="10" createDate="2018-04-02T20:54:01" updateDate="2018-04-03T15:08:02" nodeName="Lịch sử phát triển và các thành tích tiêu biểu" urlName="lịch-sử-phát-triển-và-các-thành-tích-tiêu-biểu" path="-1,1059,1075,1096,1099" isDoc="" nodeType="1081" creatorName="DoDat" writerName="DoDat" writerID="0" template="0" nodeTypeAlias="tab" isPublished="false"><noiDung><![CDATA[<p> <span><strong>Học viện Kỹ thuật Quân sự</strong>          </span></p>
<p> </p>
<p><span>Học viện Kỹ thuật Quân sự được thành lập theo Quyết định số 146/CP ngày 08/8/1966 của Hội đồng Chính phủ với tên gọi ban đầu là “Phân hiệu II Đại học Bách khoa”. Ngày 28/10/1966, tại Hội trường lớn Đại học Bách khoa, Bộ Đại học và Trung học chuyên nghiệp (nay là Bộ Giáo dục và Đào tạo) và Bộ Quốc phòng long trọng tổ chức Lễ thành lập Phân hiệu II Đại học Bách khoa, đồng thời khai giảng khoá đào tạo đầu tiên. Từ đó, ngày 28/10/1966 được chọn là Ngày truyền thống của Học viện Kỹ thuật Quân sự. Ngày 13/6/1968, Thủ tướng Chính phủ quyết định đổi tên “Phân hiệu II Đại học Bách khoa” thành trường Đại học Kỹ thuật Quân sự và ngày 15/12/1981, Bộ Quốc phòng quyết định thành lập Học viện Kỹ thuật Quân sự trên cơ sở trường Đại học Kỹ thuật Quân sự. Ngày 06/6/1991, Chủ tịch Hội đồng Bộ trưởng quyết định cho phép Học viện Kỹ thuật Quân sự mang thêm tên gọi Đại học kỹ thuật Lê Quý Đôn. Ngày 31/1/2008, Học viện Kỹ thuật Quân sự được Chính phủ quyết định bổ sung vào danh sách các trường đại học trọng điểm quốc gia.</span></p>
<p><img src="http://mta.edu.vn/portals/0/Thuy/2017/1_Ngaykhaigiang.jpg" alt="" /></p>
<p><span><em> </em></span></p>
<p><span><em>Học viện Kỹ thuật Quân sự khai giảng năm học mới</em></span></p>
<p><span><em> </em></span></p>
<p><strong><span>Sứ mạng</span></strong></p>
<p><span>Sứ mạng của Học viện Kỹ thuật Quân sự là đào tạo nguồn nhân lực chất lượng cao, nghiên cứu phát triển, sản xuất chế thử, chuyển giao công nghệ tiên tiến và hội nhập quốc tế, góp phần đắc lực vào sự nghiệp xây dựng và bảo vệ Tổ quốc, phát triển ngành khoa học kỹ thuật quân sự Việt Nam.</span></p>
<p><span> </span></p>
<p><strong><span>Mục tiêu</span></strong></p>
<p><span>Đào tạo đội ngũ cán bộ kỹ thuật, chỉ huy quản lý kỹ thuật chất lượng cao có trình độ đại học, sau đại học cho Quân đội và Đất nước; có bản lĩnh chính trị vững vàng, phẩm chất đạo đức tốt, tuyệt đối trung thành với Đảng Cộng sản Việt Nam, với Tổ quốc, với Nhân dân; có trình độ kiến thức nền vững chắc, kiến thức chuyên ngành chuyên sâu; có tác phong chính quy và có năng lực toàn diện trong chỉ huy, quản lý, tổ chức, điều hành và huấn luyện bộ đội; có năng lực ngoại ngữ, công nghệ thông tin đáp ứng yêu cầu hoạt động chuyên môn và hội nhập quốc tế; có sức khỏe tốt; có khả năng tự học tập, nghiên cứu nâng cao trình độ và thích nghi với mọi hoàn cảnh; có khả năng phát triển thành chuyên gia đầu ngành hoặc đảm nhiệm được các chức vụ cao hơn, đáp ứng yêu cầu xây dựng Quân đội, xây dựng và bảo vệ Tổ quốc.</span></p>
<p><span> </span></p>
<p> </p>
<p><strong><span>Phương châm giáo dục - đào tạo của Học viện<br /></span></strong></p>
<p><span>Cơ bản, hệ thống, toàn diện, chuyên sâu.</span></p>
<p><span> </span></p>
<p><span><strong>Nhiệm vụ chính</strong><br /></span></p>
<p><span>- Đào tạo cán bộ kỹ thuật và quản lý kỹ thuật có trình độ đại học, sau đại học</span></p>
<p><em><span>+ Đào tạo Kỹ sư quân sự: 42 chuyên ngành</span></em></p>
<p><em><span>+ Đào tạo Kỹ sư dân sự: 25 chuyên ngành</span></em></p>
<p><em><span>+ Đào tạo Thạc sĩ: 17 ngành</span></em></p>
<p><em><span>+ Đào tạo Tiến sĩ: 12 ngành</span></em></p>
<p><span> - Nghiên cứu khoa học, tư vấn khoa học kỹ thuật, triển khai dịch vụ khoa học công nghệ,… phục vụ quốc phòng - an ninh và kinh tế - xã hội.</span></p>
<p><span> </span></p>
<p><strong><span>Phần thưởng cao quý</span></strong></p>
<p> </p>
<p><span>- Danh hiệu Đơn vị Anh hùng LLVT nhân dân thời kỳ đổi mới;</span></p>
<p><span>- 01 Huân chương Hồ Chí Minh;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhất;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhì;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Ba;</span></p>
<p><span>- 02 Huân chương Quân công hạng Nhất;</span></p>
<p><span>- 01 Huân chương Quân công hạng Nhì;</span></p>
<p><span>- 01 Huân chương Lao động hạng Ba;</span></p>
<p><span>- 03 Huân chương Chiến công: hạng Nhất, hạng Nhì, hạng Ba</span></p>
<p><span> </span></p>
<p><span><img src="http://mta.edu.vn/portals/0/Thuy/2017/NhanHCdoclapHangNhi.jpg" alt="" /><br /></span></p>
<p><em><span> </span></em></p>
<p><em><span>Học viện Kỹ thuật Quân sự đón nhận Huân chương Độc lập hạng Nhì</span></em></p>
<p><em><span> </span></em></p>
<p><strong><span>Địa chỉ</span></strong></p>
<p><span>Cơ sở 1: 236 Hoàng Quốc Việt, Bắc Từ Liêm, Hà Nội<br />Cơ sở 2: Đường Mê Linh, Vĩnh Yên, Vĩnh Phúc<br />Cơ sở 3: 71 Đường Cộng hoà, Quận Tân Bình, Tp. Hồ Chí Minh<br />Cơ sở 4: Kiều Mai, Phú Diễn 1, Bắc Từ Liêm, Hà Nội</span></p>]]></noiDung></tab>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1099, N'd52bfacf-e780-45bb-aee2-5c693d643b8f', CAST(0x0000A8B700F98B8C AS DateTime), N'<tab id="1099" key="9bde509b-c27f-4518-821b-19344113d079" parentID="1096" level="4" creatorID="0" sortOrder="10" createDate="2018-04-02T20:54:01" updateDate="2018-04-03T15:08:33" nodeName="Lịch sử phát triển và các thành tích tiêu biểu" urlName="lịch-sử-phát-triển-và-các-thành-tích-tiêu-biểu" path="-1,1059,1075,1096,1099" isDoc="" nodeType="1081" creatorName="DoDat" writerName="DoDat" writerID="0" template="0" nodeTypeAlias="tab" isPublished="true"><noiDung><![CDATA[<p> <span><strong>Học viện Kỹ thuật Quân sự</strong>          </span></p>
<p> </p>
<p><span>Học viện Kỹ thuật Quân sự được thành lập theo Quyết định số 146/CP ngày 08/8/1966 của Hội đồng Chính phủ với tên gọi ban đầu là “Phân hiệu II Đại học Bách khoa”. Ngày 28/10/1966, tại Hội trường lớn Đại học Bách khoa, Bộ Đại học và Trung học chuyên nghiệp (nay là Bộ Giáo dục và Đào tạo) và Bộ Quốc phòng long trọng tổ chức Lễ thành lập Phân hiệu II Đại học Bách khoa, đồng thời khai giảng khoá đào tạo đầu tiên. Từ đó, ngày 28/10/1966 được chọn là Ngày truyền thống của Học viện Kỹ thuật Quân sự. Ngày 13/6/1968, Thủ tướng Chính phủ quyết định đổi tên “Phân hiệu II Đại học Bách khoa” thành trường Đại học Kỹ thuật Quân sự và ngày 15/12/1981, Bộ Quốc phòng quyết định thành lập Học viện Kỹ thuật Quân sự trên cơ sở trường Đại học Kỹ thuật Quân sự. Ngày 06/6/1991, Chủ tịch Hội đồng Bộ trưởng quyết định cho phép Học viện Kỹ thuật Quân sự mang thêm tên gọi Đại học kỹ thuật Lê Quý Đôn. Ngày 31/1/2008, Học viện Kỹ thuật Quân sự được Chính phủ quyết định bổ sung vào danh sách các trường đại học trọng điểm quốc gia.</span></p>
<p><img src="http://mta.edu.vn/portals/0/Thuy/2017/1_Ngaykhaigiang.jpg" alt="" /></p>
<p><span><em> </em></span></p>
<p><span><em>Học viện Kỹ thuật Quân sự khai giảng năm học mới</em></span></p>
<p><span><em> </em></span></p>
<p><strong><span>Sứ mạng</span></strong></p>
<p><span>Sứ mạng của Học viện Kỹ thuật Quân sự là đào tạo nguồn nhân lực chất lượng cao, nghiên cứu phát triển, sản xuất chế thử, chuyển giao công nghệ tiên tiến và hội nhập quốc tế, góp phần đắc lực vào sự nghiệp xây dựng và bảo vệ Tổ quốc, phát triển ngành khoa học kỹ thuật quân sự Việt Nam.</span></p>
<p><span> </span></p>
<p><strong><span>Mục tiêu</span></strong></p>
<p><span>Đào tạo đội ngũ cán bộ kỹ thuật, chỉ huy quản lý kỹ thuật chất lượng cao có trình độ đại học, sau đại học cho Quân đội và Đất nước; có bản lĩnh chính trị vững vàng, phẩm chất đạo đức tốt, tuyệt đối trung thành với Đảng Cộng sản Việt Nam, với Tổ quốc, với Nhân dân; có trình độ kiến thức nền vững chắc, kiến thức chuyên ngành chuyên sâu; có tác phong chính quy và có năng lực toàn diện trong chỉ huy, quản lý, tổ chức, điều hành và huấn luyện bộ đội; có năng lực ngoại ngữ, công nghệ thông tin đáp ứng yêu cầu hoạt động chuyên môn và hội nhập quốc tế; có sức khỏe tốt; có khả năng tự học tập, nghiên cứu nâng cao trình độ và thích nghi với mọi hoàn cảnh; có khả năng phát triển thành chuyên gia đầu ngành hoặc đảm nhiệm được các chức vụ cao hơn, đáp ứng yêu cầu xây dựng Quân đội, xây dựng và bảo vệ Tổ quốc.</span></p>
<p><span> </span></p>
<p> </p>
<p><strong><span>Phương châm giáo dục - đào tạo của Học viện<br /></span></strong></p>
<p><span>Cơ bản, hệ thống, toàn diện, chuyên sâu.</span></p>
<p><span> </span></p>
<p><span><strong>Nhiệm vụ chính</strong><br /></span></p>
<p><span>- Đào tạo cán bộ kỹ thuật và quản lý kỹ thuật có trình độ đại học, sau đại học</span></p>
<p><em><span>+ Đào tạo Kỹ sư quân sự: 42 chuyên ngành</span></em></p>
<p><em><span>+ Đào tạo Kỹ sư dân sự: 25 chuyên ngành</span></em></p>
<p><em><span>+ Đào tạo Thạc sĩ: 17 ngành</span></em></p>
<p><em><span>+ Đào tạo Tiến sĩ: 12 ngành</span></em></p>
<p><span> - Nghiên cứu khoa học, tư vấn khoa học kỹ thuật, triển khai dịch vụ khoa học công nghệ,… phục vụ quốc phòng - an ninh và kinh tế - xã hội.</span></p>
<p><span> </span></p>
<p><strong><span>Phần thưởng cao quý</span></strong></p>
<p> </p>
<p><span>- Danh hiệu Đơn vị Anh hùng LLVT nhân dân thời kỳ đổi mới;</span></p>
<p><span>- 01 Huân chương Hồ Chí Minh;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhất;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhì;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Ba;</span></p>
<p><span>- 02 Huân chương Quân công hạng Nhất;</span></p>
<p><span>- 01 Huân chương Quân công hạng Nhì;</span></p>
<p><span>- 01 Huân chương Lao động hạng Ba;</span></p>
<p><span>- 03 Huân chương Chiến công: hạng Nhất, hạng Nhì, hạng Ba</span></p>
<p><span> </span></p>
<p><span><img src="http://mta.edu.vn/portals/0/Thuy/2017/NhanHCdoclapHangNhi.jpg" alt="" /><br /></span></p>
<p><em><span> </span></em></p>
<p><em><span>Học viện Kỹ thuật Quân sự đón nhận Huân chương Độc lập hạng Nhì</span></em></p>
<p><em><span> </span></em></p>
<p><strong><span>Địa chỉ</span></strong></p>
<p><span>Cơ sở 1: 236 Hoàng Quốc Việt, Bắc Từ Liêm, Hà Nội<br />Cơ sở 2: Đường Mê Linh, Vĩnh Yên, Vĩnh Phúc<br />Cơ sở 3: 71 Đường Cộng hoà, Quận Tân Bình, Tp. Hồ Chí Minh<br />Cơ sở 4: Kiều Mai, Phú Diễn 1, Bắc Từ Liêm, Hà Nội</span></p>]]></noiDung></tab>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1099, N'7bebb272-5378-4f74-9ef6-81deae9296e8', CAST(0x0000A8B601624877 AS DateTime), N'<tab id="1099" key="9bde509b-c27f-4518-821b-19344113d079" parentID="1096" level="4" creatorID="0" sortOrder="0" createDate="2018-04-02T20:54:01" updateDate="2018-04-02T21:29:54" nodeName="Lịch sử phát triển và các thành tích tiêu biểu" urlName="lịch-sử-phát-triển-và-các-thành-tích-tiêu-biểu" path="-1,1059,1075,1096,1099" isDoc="" nodeType="1081" creatorName="DoDat" writerName="DoDat" writerID="0" template="0" nodeTypeAlias="tab" isPublished="true"><noiDung><![CDATA[<p> <span><strong>Học viện Kỹ thuật Quân sự</strong>          </span></p>
<p> </p>
<p><span>Học viện Kỹ thuật Quân sự được thành lập theo Quyết định số 146/CP ngày 08/8/1966 của Hội đồng Chính phủ với tên gọi ban đầu là “Phân hiệu II Đại học Bách khoa”. Ngày 28/10/1966, tại Hội trường lớn Đại học Bách khoa, Bộ Đại học và Trung học chuyên nghiệp (nay là Bộ Giáo dục và Đào tạo) và Bộ Quốc phòng long trọng tổ chức Lễ thành lập Phân hiệu II Đại học Bách khoa, đồng thời khai giảng khoá đào tạo đầu tiên. Từ đó, ngày 28/10/1966 được chọn là Ngày truyền thống của Học viện Kỹ thuật Quân sự. Ngày 13/6/1968, Thủ tướng Chính phủ quyết định đổi tên “Phân hiệu II Đại học Bách khoa” thành trường Đại học Kỹ thuật Quân sự và ngày 15/12/1981, Bộ Quốc phòng quyết định thành lập Học viện Kỹ thuật Quân sự trên cơ sở trường Đại học Kỹ thuật Quân sự. Ngày 06/6/1991, Chủ tịch Hội đồng Bộ trưởng quyết định cho phép Học viện Kỹ thuật Quân sự mang thêm tên gọi Đại học kỹ thuật Lê Quý Đôn. Ngày 31/1/2008, Học viện Kỹ thuật Quân sự được Chính phủ quyết định bổ sung vào danh sách các trường đại học trọng điểm quốc gia.</span></p>
<p><img src="http://mta.edu.vn/portals/0/Thuy/2017/1_Ngaykhaigiang.jpg" alt="" /></p>
<p><span><em> </em></span></p>
<p><span><em>Học viện Kỹ thuật Quân sự khai giảng năm học mới</em></span></p>
<p><span><em> </em></span></p>
<p><strong><span>Sứ mạng</span></strong></p>
<p><span>Sứ mạng của Học viện Kỹ thuật Quân sự là đào tạo nguồn nhân lực chất lượng cao, nghiên cứu phát triển, sản xuất chế thử, chuyển giao công nghệ tiên tiến và hội nhập quốc tế, góp phần đắc lực vào sự nghiệp xây dựng và bảo vệ Tổ quốc, phát triển ngành khoa học kỹ thuật quân sự Việt Nam.</span></p>
<p><span> </span></p>
<p><strong><span>Mục tiêu</span></strong></p>
<p><span>Đào tạo đội ngũ cán bộ kỹ thuật, chỉ huy quản lý kỹ thuật chất lượng cao có trình độ đại học, sau đại học cho Quân đội và Đất nước; có bản lĩnh chính trị vững vàng, phẩm chất đạo đức tốt, tuyệt đối trung thành với Đảng Cộng sản Việt Nam, với Tổ quốc, với Nhân dân; có trình độ kiến thức nền vững chắc, kiến thức chuyên ngành chuyên sâu; có tác phong chính quy và có năng lực toàn diện trong chỉ huy, quản lý, tổ chức, điều hành và huấn luyện bộ đội; có năng lực ngoại ngữ, công nghệ thông tin đáp ứng yêu cầu hoạt động chuyên môn và hội nhập quốc tế; có sức khỏe tốt; có khả năng tự học tập, nghiên cứu nâng cao trình độ và thích nghi với mọi hoàn cảnh; có khả năng phát triển thành chuyên gia đầu ngành hoặc đảm nhiệm được các chức vụ cao hơn, đáp ứng yêu cầu xây dựng Quân đội, xây dựng và bảo vệ Tổ quốc.</span></p>
<p><span> </span></p>
<p> </p>
<p><strong><span>Phương châm giáo dục - đào tạo của Học viện<br /></span></strong></p>
<p><span>Cơ bản, hệ thống, toàn diện, chuyên sâu.</span></p>
<p><span> </span></p>
<p><span><strong>Nhiệm vụ chính</strong><br /></span></p>
<p><span>- Đào tạo cán bộ kỹ thuật và quản lý kỹ thuật có trình độ đại học, sau đại học</span></p>
<p><em><span>+ Đào tạo Kỹ sư quân sự: 42 chuyên ngành</span></em></p>
<p><em><span>+ Đào tạo Kỹ sư dân sự: 25 chuyên ngành</span></em></p>
<p><em><span>+ Đào tạo Thạc sĩ: 17 ngành</span></em></p>
<p><em><span>+ Đào tạo Tiến sĩ: 12 ngành</span></em></p>
<p><span> - Nghiên cứu khoa học, tư vấn khoa học kỹ thuật, triển khai dịch vụ khoa học công nghệ,… phục vụ quốc phòng - an ninh và kinh tế - xã hội.</span></p>
<p><span> </span></p>
<p><strong><span>Phần thưởng cao quý</span></strong></p>
<p> </p>
<p><span>- Danh hiệu Đơn vị Anh hùng LLVT nhân dân thời kỳ đổi mới;</span></p>
<p><span>- 01 Huân chương Hồ Chí Minh;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhất;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhì;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Ba;</span></p>
<p><span>- 02 Huân chương Quân công hạng Nhất;</span></p>
<p><span>- 01 Huân chương Quân công hạng Nhì;</span></p>
<p><span>- 01 Huân chương Lao động hạng Ba;</span></p>
<p><span>- 03 Huân chương Chiến công: hạng Nhất, hạng Nhì, hạng Ba</span></p>
<p><span> </span></p>
<p><span><img src="http://mta.edu.vn/portals/0/Thuy/2017/NhanHCdoclapHangNhi.jpg" alt="" /><br /></span></p>
<p><em><span> </span></em></p>
<p><em><span>Học viện Kỹ thuật Quân sự đón nhận Huân chương Độc lập hạng Nhì</span></em></p>
<p><em><span> </span></em></p>
<p><strong><span>Địa chỉ</span></strong></p>
<p><span>Cơ sở 1: 236 Hoàng Quốc Việt, Bắc Từ Liêm, Hà Nội<br />Cơ sở 2: Đường Mê Linh, Vĩnh Yên, Vĩnh Phúc<br />Cơ sở 3: 71 Đường Cộng hoà, Quận Tân Bình, Tp. Hồ Chí Minh<br />Cơ sở 4: Kiều Mai, Phú Diễn 1, Bắc Từ Liêm, Hà Nội</span></p>]]></noiDung></tab>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1100, N'cf1de4d3-4f68-4396-abc5-174722806e31', CAST(0x0000A8B60158BD4B AS DateTime), N'<tab id="1100" key="eae1b129-c224-4ca6-903b-8b880a9482fc" parentID="1096" level="4" creatorID="0" sortOrder="1" createDate="2018-04-02T20:55:00" updateDate="2018-04-02T20:55:00" nodeName="Chức năng, nhiệm vụ" urlName="chức-năng-nhiệm-vụ" path="-1,1059,1075,1096,1100" isDoc="" nodeType="1081" creatorName="DoDat" writerName="DoDat" writerID="0" template="0" nodeTypeAlias="tab" isPublished="false"><noiDung><![CDATA[<p><strong><span>Sứ mạng</span></strong></p>
<p><span>Sứ mạng của Học viện Kỹ thuật Quân sự là đào tạo nguồn nhân lực chất lượng cao, nghiên cứu phát triển, sản xuất chế thử, chuyển giao công nghệ tiên tiến và hội nhập quốc tế, góp phần đắc lực vào sự nghiệp xây dựng và bảo vệ Tổ quốc, phát triển ngành khoa học kỹ thuật quân sự Việt Nam.</span></p>
<p><span> </span></p>
<p><strong><span>Mục tiêu</span></strong></p>
<p><span>Đào tạo đội ngũ cán bộ kỹ thuật, chỉ huy quản lý kỹ thuật chất lượng cao có trình độ đại học, sau đại học cho Quân đội và Đất nước; có bản lĩnh chính trị vững vàng, phẩm chất đạo đức tốt, tuyệt đối trung thành với Đảng Cộng sản Việt Nam, với Tổ quốc, với Nhân dân; có trình độ kiến thức nền vững chắc, kiến thức chuyên ngành chuyên sâu; có tác phong chính quy và có năng lực toàn diện trong chỉ huy, quản lý, tổ chức, điều hành và huấn luyện bộ đội; có năng lực ngoại ngữ, công nghệ thông tin đáp ứng yêu cầu hoạt động chuyên môn và hội nhập quốc tế; có sức khỏe tốt; có khả năng tự học tập, nghiên cứu nâng cao trình độ và thích nghi với mọi hoàn cảnh; có khả năng phát triển thành chuyên gia đầu ngành hoặc đảm nhiệm được các chức vụ cao hơn, đáp ứng yêu cầu xây dựng Quân đội, xây dựng và bảo vệ Tổ quốc.</span></p>]]></noiDung></tab>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1100, N'f65caf8c-8db5-4e8f-ba5a-5865187f7572', CAST(0x0000A8B700F9666F AS DateTime), N'<tab id="1100" key="eae1b129-c224-4ca6-903b-8b880a9482fc" parentID="1096" level="4" creatorID="0" sortOrder="11" createDate="2018-04-02T20:55:00" updateDate="2018-04-03T15:08:02" nodeName="Chức năng, nhiệm vụ" urlName="chức-năng-nhiệm-vụ" path="-1,1059,1075,1096,1100" isDoc="" nodeType="1081" creatorName="DoDat" writerName="DoDat" writerID="0" template="0" nodeTypeAlias="tab" isPublished="false"><noiDung><![CDATA[<p><strong><span>Sứ mạng</span></strong></p>
<p><span>Sứ mạng của Học viện Kỹ thuật Quân sự là đào tạo nguồn nhân lực chất lượng cao, nghiên cứu phát triển, sản xuất chế thử, chuyển giao công nghệ tiên tiến và hội nhập quốc tế, góp phần đắc lực vào sự nghiệp xây dựng và bảo vệ Tổ quốc, phát triển ngành khoa học kỹ thuật quân sự Việt Nam.</span></p>
<p><span> </span></p>
<p><strong><span>Mục tiêu</span></strong></p>
<p><span>Đào tạo đội ngũ cán bộ kỹ thuật, chỉ huy quản lý kỹ thuật chất lượng cao có trình độ đại học, sau đại học cho Quân đội và Đất nước; có bản lĩnh chính trị vững vàng, phẩm chất đạo đức tốt, tuyệt đối trung thành với Đảng Cộng sản Việt Nam, với Tổ quốc, với Nhân dân; có trình độ kiến thức nền vững chắc, kiến thức chuyên ngành chuyên sâu; có tác phong chính quy và có năng lực toàn diện trong chỉ huy, quản lý, tổ chức, điều hành và huấn luyện bộ đội; có năng lực ngoại ngữ, công nghệ thông tin đáp ứng yêu cầu hoạt động chuyên môn và hội nhập quốc tế; có sức khỏe tốt; có khả năng tự học tập, nghiên cứu nâng cao trình độ và thích nghi với mọi hoàn cảnh; có khả năng phát triển thành chuyên gia đầu ngành hoặc đảm nhiệm được các chức vụ cao hơn, đáp ứng yêu cầu xây dựng Quân đội, xây dựng và bảo vệ Tổ quốc.</span></p>]]></noiDung></tab>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1100, N'1ebe9658-1a78-42ce-a48d-b602af84af9b', CAST(0x0000A8B700F98E2A AS DateTime), N'<tab id="1100" key="eae1b129-c224-4ca6-903b-8b880a9482fc" parentID="1096" level="4" creatorID="0" sortOrder="11" createDate="2018-04-02T20:55:00" updateDate="2018-04-03T15:08:36" nodeName="Chức năng, nhiệm vụ" urlName="chức-năng-nhiệm-vụ" path="-1,1059,1075,1096,1100" isDoc="" nodeType="1081" creatorName="DoDat" writerName="DoDat" writerID="0" template="0" nodeTypeAlias="tab" isPublished="true"><noiDung><![CDATA[<p><strong><span>Sứ mạng</span></strong></p>
<p><span>Sứ mạng của Học viện Kỹ thuật Quân sự là đào tạo nguồn nhân lực chất lượng cao, nghiên cứu phát triển, sản xuất chế thử, chuyển giao công nghệ tiên tiến và hội nhập quốc tế, góp phần đắc lực vào sự nghiệp xây dựng và bảo vệ Tổ quốc, phát triển ngành khoa học kỹ thuật quân sự Việt Nam.</span></p>
<p><span> </span></p>
<p><strong><span>Mục tiêu</span></strong></p>
<p><span>Đào tạo đội ngũ cán bộ kỹ thuật, chỉ huy quản lý kỹ thuật chất lượng cao có trình độ đại học, sau đại học cho Quân đội và Đất nước; có bản lĩnh chính trị vững vàng, phẩm chất đạo đức tốt, tuyệt đối trung thành với Đảng Cộng sản Việt Nam, với Tổ quốc, với Nhân dân; có trình độ kiến thức nền vững chắc, kiến thức chuyên ngành chuyên sâu; có tác phong chính quy và có năng lực toàn diện trong chỉ huy, quản lý, tổ chức, điều hành và huấn luyện bộ đội; có năng lực ngoại ngữ, công nghệ thông tin đáp ứng yêu cầu hoạt động chuyên môn và hội nhập quốc tế; có sức khỏe tốt; có khả năng tự học tập, nghiên cứu nâng cao trình độ và thích nghi với mọi hoàn cảnh; có khả năng phát triển thành chuyên gia đầu ngành hoặc đảm nhiệm được các chức vụ cao hơn, đáp ứng yêu cầu xây dựng Quân đội, xây dựng và bảo vệ Tổ quốc.</span></p>]]></noiDung></tab>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1101, N'75f4ad5e-8ef9-43c4-b5db-1dde9e407c3f', CAST(0x0000A8B700F98869 AS DateTime), N'<tab id="1101" key="9aad5f2e-6efc-44ea-8893-b55f49e76d01" parentID="1096" level="4" creatorID="0" sortOrder="9" createDate="2018-04-02T20:56:11" updateDate="2018-04-03T15:08:31" nodeName="Sứ mạng, mục tiêu đào tạo" urlName="sứ-mạng-mục-tiêu-đào-tạo" path="-1,1059,1075,1096,1101" isDoc="" nodeType="1081" creatorName="DoDat" writerName="DoDat" writerID="0" template="0" nodeTypeAlias="tab" isPublished="true"><noiDung><![CDATA[<p><strong><span>Phần thưởng cao quý</span></strong></p>
<p> </p>
<p><span>- Danh hiệu Đơn vị Anh hùng LLVT nhân dân thời kỳ đổi mới;</span></p>
<p><span>- 01 Huân chương Hồ Chí Minh;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhất;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhì;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Ba;</span></p>
<p><span>- 02 Huân chương Quân công hạng Nhất;</span></p>
<p><span>- 01 Huân chương Quân công hạng Nhì;</span></p>
<p><span>- 01 Huân chương Lao động hạng Ba;</span></p>
<p><span>- 03 Huân chương Chiến công: hạng Nhất, hạng Nhì, hạng Ba</span></p>
<p><span> </span></p>
<p><span><img src="http://mta.edu.vn/portals/0/Thuy/2017/NhanHCdoclapHangNhi.jpg" alt="" /><br /></span></p>
<p><em><span> </span></em></p>
<p><em><span>Học viện Kỹ thuật Quân sự đón nhận Huân chương Độc lập hạng Nhì</span></em></p>
<p><em><span> </span></em></p>
<p><strong><span>Địa chỉ</span></strong></p>
<p><span>Cơ sở 1: 236 Hoàng Quốc Việt, Bắc Từ Liêm, Hà Nội<br />Cơ sở 2: Đường Mê Linh, Vĩnh Yên, Vĩnh Phúc<br />Cơ sở 3: 71 Đường Cộng hoà, Quận Tân Bình, Tp. Hồ Chí Minh<br />Cơ sở 4: Kiều Mai, Phú Diễn 1, Bắc Từ Liêm, Hà Nội</span></p>]]></noiDung></tab>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1101, N'f0e4f83b-139b-4511-9f5b-7e375daf4340', CAST(0x0000A8B700F96662 AS DateTime), N'<tab id="1101" key="9aad5f2e-6efc-44ea-8893-b55f49e76d01" parentID="1096" level="4" creatorID="0" sortOrder="9" createDate="2018-04-02T20:56:11" updateDate="2018-04-03T15:08:02" nodeName="Sứ mạng, mục tiêu đào tạo" urlName="sứ-mạng-mục-tiêu-đào-tạo" path="-1,1059,1075,1096,1101" isDoc="" nodeType="1081" creatorName="DoDat" writerName="DoDat" writerID="0" template="0" nodeTypeAlias="tab" isPublished="false"><noiDung><![CDATA[<p><strong><span>Phần thưởng cao quý</span></strong></p>
<p> </p>
<p><span>- Danh hiệu Đơn vị Anh hùng LLVT nhân dân thời kỳ đổi mới;</span></p>
<p><span>- 01 Huân chương Hồ Chí Minh;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhất;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhì;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Ba;</span></p>
<p><span>- 02 Huân chương Quân công hạng Nhất;</span></p>
<p><span>- 01 Huân chương Quân công hạng Nhì;</span></p>
<p><span>- 01 Huân chương Lao động hạng Ba;</span></p>
<p><span>- 03 Huân chương Chiến công: hạng Nhất, hạng Nhì, hạng Ba</span></p>
<p><span> </span></p>
<p><span><img src="http://mta.edu.vn/portals/0/Thuy/2017/NhanHCdoclapHangNhi.jpg" alt="" /><br /></span></p>
<p><em><span> </span></em></p>
<p><em><span>Học viện Kỹ thuật Quân sự đón nhận Huân chương Độc lập hạng Nhì</span></em></p>
<p><em><span> </span></em></p>
<p><strong><span>Địa chỉ</span></strong></p>
<p><span>Cơ sở 1: 236 Hoàng Quốc Việt, Bắc Từ Liêm, Hà Nội<br />Cơ sở 2: Đường Mê Linh, Vĩnh Yên, Vĩnh Phúc<br />Cơ sở 3: 71 Đường Cộng hoà, Quận Tân Bình, Tp. Hồ Chí Minh<br />Cơ sở 4: Kiều Mai, Phú Diễn 1, Bắc Từ Liêm, Hà Nội</span></p>]]></noiDung></tab>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1101, N'ad59612a-3485-4a84-bbde-c3eb6c1c9318', CAST(0x0000A8B60164A6E5 AS DateTime), N'<tab id="1101" key="9aad5f2e-6efc-44ea-8893-b55f49e76d01" parentID="1096" level="4" creatorID="0" sortOrder="2" createDate="2018-04-02T20:56:11" updateDate="2018-04-02T21:38:09" nodeName="Sứ mạng, mục tiêu đào tạo" urlName="sứ-mạng-mục-tiêu-đào-tạo" path="-1,1059,1075,1096,1101" isDoc="" nodeType="1081" creatorName="DoDat" writerName="DoDat" writerID="0" template="0" nodeTypeAlias="tab" isPublished="false"><noiDung><![CDATA[<p><strong><span>Phần thưởng cao quý</span></strong></p>
<p> </p>
<p><span>- Danh hiệu Đơn vị Anh hùng LLVT nhân dân thời kỳ đổi mới;</span></p>
<p><span>- 01 Huân chương Hồ Chí Minh;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhất;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhì;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Ba;</span></p>
<p><span>- 02 Huân chương Quân công hạng Nhất;</span></p>
<p><span>- 01 Huân chương Quân công hạng Nhì;</span></p>
<p><span>- 01 Huân chương Lao động hạng Ba;</span></p>
<p><span>- 03 Huân chương Chiến công: hạng Nhất, hạng Nhì, hạng Ba</span></p>
<p><span> </span></p>
<p><span><img src="http://mta.edu.vn/portals/0/Thuy/2017/NhanHCdoclapHangNhi.jpg" alt="" /><br /></span></p>
<p><em><span> </span></em></p>
<p><em><span>Học viện Kỹ thuật Quân sự đón nhận Huân chương Độc lập hạng Nhì</span></em></p>
<p><em><span> </span></em></p>
<p><strong><span>Địa chỉ</span></strong></p>
<p><span>Cơ sở 1: 236 Hoàng Quốc Việt, Bắc Từ Liêm, Hà Nội<br />Cơ sở 2: Đường Mê Linh, Vĩnh Yên, Vĩnh Phúc<br />Cơ sở 3: 71 Đường Cộng hoà, Quận Tân Bình, Tp. Hồ Chí Minh<br />Cơ sở 4: Kiều Mai, Phú Diễn 1, Bắc Từ Liêm, Hà Nội</span></p>]]></noiDung></tab>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1102, N'df87cbfd-c6c4-47cd-aeca-020fea81183d', CAST(0x0000A8B700F98613 AS DateTime), N'<tab id="1102" key="4523b821-5799-4962-9a6b-81e0192bbe0d" parentID="1096" level="4" creatorID="0" sortOrder="8" createDate="2018-04-02T20:58:33" updateDate="2018-04-03T15:08:29" nodeName="Tiềm lực" urlName="tiềm-lực" path="-1,1059,1075,1096,1102" isDoc="" nodeType="1081" creatorName="DoDat" writerName="DoDat" writerID="0" template="0" nodeTypeAlias="tab" isPublished="true"><noiDung><![CDATA[<p><strong><span>Phần thưởng cao quý</span></strong></p>
<p> </p>
<p><span>- Danh hiệu Đơn vị Anh hùng LLVT nhân dân thời kỳ đổi mới;</span></p>
<p><span>- 01 Huân chương Hồ Chí Minh;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhất;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhì;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Ba;</span></p>
<p><span>- 02 Huân chương Quân công hạng Nhất;</span></p>
<p><span>- 01 Huân chương Quân công hạng Nhì;</span></p>
<p><span>- 01 Huân chương Lao động hạng Ba;</span></p>
<p><span>- 03 Huân chương Chiến công: hạng Nhất, hạng Nhì, hạng Ba</span></p>
<p><span> </span></p>
<p><span><img src="http://mta.edu.vn/portals/0/Thuy/2017/NhanHCdoclapHangNhi.jpg" alt="" /><br /></span></p>
<p><em><span> </span></em></p>
<p><em><span>Học viện Kỹ thuật Quân sự đón nhận Huân chương Độc lập hạng Nhì</span></em></p>
<p><em><span> </span></em></p>
<p><strong><span>Địa chỉ</span></strong></p>
<p><span>Cơ sở 1: 236 Hoàng Quốc Việt, Bắc Từ Liêm, Hà Nội<br />Cơ sở 2: Đường Mê Linh, Vĩnh Yên, Vĩnh Phúc<br />Cơ sở 3: 71 Đường Cộng hoà, Quận Tân Bình, Tp. Hồ Chí Minh<br />Cơ sở 4: Kiều Mai, Phú Diễn 1, Bắc Từ Liêm, Hà Nội</span></p>]]></noiDung></tab>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1102, N'f096073c-3d33-47fa-87b5-6003e2150e4a', CAST(0x0000A8B700F9665C AS DateTime), N'<tab id="1102" key="4523b821-5799-4962-9a6b-81e0192bbe0d" parentID="1096" level="4" creatorID="0" sortOrder="8" createDate="2018-04-02T20:58:33" updateDate="2018-04-03T15:08:02" nodeName="Tiềm lực" urlName="tiềm-lực" path="-1,1059,1075,1096,1102" isDoc="" nodeType="1081" creatorName="DoDat" writerName="DoDat" writerID="0" template="0" nodeTypeAlias="tab" isPublished="false"><noiDung><![CDATA[<p><strong><span>Phần thưởng cao quý</span></strong></p>
<p> </p>
<p><span>- Danh hiệu Đơn vị Anh hùng LLVT nhân dân thời kỳ đổi mới;</span></p>
<p><span>- 01 Huân chương Hồ Chí Minh;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhất;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhì;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Ba;</span></p>
<p><span>- 02 Huân chương Quân công hạng Nhất;</span></p>
<p><span>- 01 Huân chương Quân công hạng Nhì;</span></p>
<p><span>- 01 Huân chương Lao động hạng Ba;</span></p>
<p><span>- 03 Huân chương Chiến công: hạng Nhất, hạng Nhì, hạng Ba</span></p>
<p><span> </span></p>
<p><span><img src="http://mta.edu.vn/portals/0/Thuy/2017/NhanHCdoclapHangNhi.jpg" alt="" /><br /></span></p>
<p><em><span> </span></em></p>
<p><em><span>Học viện Kỹ thuật Quân sự đón nhận Huân chương Độc lập hạng Nhì</span></em></p>
<p><em><span> </span></em></p>
<p><strong><span>Địa chỉ</span></strong></p>
<p><span>Cơ sở 1: 236 Hoàng Quốc Việt, Bắc Từ Liêm, Hà Nội<br />Cơ sở 2: Đường Mê Linh, Vĩnh Yên, Vĩnh Phúc<br />Cơ sở 3: 71 Đường Cộng hoà, Quận Tân Bình, Tp. Hồ Chí Minh<br />Cơ sở 4: Kiều Mai, Phú Diễn 1, Bắc Từ Liêm, Hà Nội</span></p>]]></noiDung></tab>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1102, N'85ede54f-6d08-45fb-939d-9b0d371e6622', CAST(0x0000A8B60164AB23 AS DateTime), N'<tab id="1102" key="4523b821-5799-4962-9a6b-81e0192bbe0d" parentID="1096" level="4" creatorID="0" sortOrder="3" createDate="2018-04-02T20:58:33" updateDate="2018-04-02T21:38:35" nodeName="Tiềm lực" urlName="tiềm-lực" path="-1,1059,1075,1096,1102" isDoc="" nodeType="1081" creatorName="DoDat" writerName="DoDat" writerID="0" template="0" nodeTypeAlias="tab" isPublished="true"><noiDung><![CDATA[<p><strong><span>Phần thưởng cao quý</span></strong></p>
<p> </p>
<p><span>- Danh hiệu Đơn vị Anh hùng LLVT nhân dân thời kỳ đổi mới;</span></p>
<p><span>- 01 Huân chương Hồ Chí Minh;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhất;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhì;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Ba;</span></p>
<p><span>- 02 Huân chương Quân công hạng Nhất;</span></p>
<p><span>- 01 Huân chương Quân công hạng Nhì;</span></p>
<p><span>- 01 Huân chương Lao động hạng Ba;</span></p>
<p><span>- 03 Huân chương Chiến công: hạng Nhất, hạng Nhì, hạng Ba</span></p>
<p><span> </span></p>
<p><span><img src="http://mta.edu.vn/portals/0/Thuy/2017/NhanHCdoclapHangNhi.jpg" alt="" /><br /></span></p>
<p><em><span> </span></em></p>
<p><em><span>Học viện Kỹ thuật Quân sự đón nhận Huân chương Độc lập hạng Nhì</span></em></p>
<p><em><span> </span></em></p>
<p><strong><span>Địa chỉ</span></strong></p>
<p><span>Cơ sở 1: 236 Hoàng Quốc Việt, Bắc Từ Liêm, Hà Nội<br />Cơ sở 2: Đường Mê Linh, Vĩnh Yên, Vĩnh Phúc<br />Cơ sở 3: 71 Đường Cộng hoà, Quận Tân Bình, Tp. Hồ Chí Minh<br />Cơ sở 4: Kiều Mai, Phú Diễn 1, Bắc Từ Liêm, Hà Nội</span></p>]]></noiDung></tab>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1105, N'9cbf6fb6-e765-4a05-8358-53e2e14bf51b', CAST(0x0000A8B701029D75 AS DateTime), N'<coCauToChuc id="1105" key="956b2b2e-b697-4473-8fd0-96a3b46afcc8" parentID="1075" level="3" creatorID="0" sortOrder="11" createDate="2018-04-03T15:22:48" updateDate="2018-04-03T15:22:48" nodeName="Cơ Cấu Tổ Chức" urlName="cơ-cấu-tổ-chức" path="-1,1059,1075,1105" isDoc="" nodeType="1092" creatorName="DoDat" writerName="DoDat" writerID="0" template="0" nodeTypeAlias="coCauToChuc" isPublished="false" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1106, N'ed9e38ff-333a-4357-bbf6-2f9184f0ae64', CAST(0x0000A8B70102B53B AS DateTime), N'<banGiamDoc id="1106" key="c1208262-5df6-4d1c-9687-2fbbb4178744" parentID="1105" level="4" creatorID="0" sortOrder="0" createDate="2018-04-03T15:24:56" updateDate="2018-04-03T15:41:55" nodeName="Ban Giám Đốc" urlName="ban-giám-đốc" path="-1,1059,1075,1105,1106" isDoc="" nodeType="1104" creatorName="DoDat" writerName="DoDat" writerID="0" template="1103" nodeTypeAlias="banGiamDoc" isPublished="true" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1106, N'd82f274d-d976-4b6a-a1c1-5f119eb3c8b4', CAST(0x0000A8B700FE0B98 AS DateTime), N'<banGiamDoc id="1106" key="c1208262-5df6-4d1c-9687-2fbbb4178744" parentID="1105" level="4" creatorID="0" sortOrder="0" createDate="2018-04-03T15:24:56" updateDate="2018-04-03T15:24:56" nodeName="Ban Giám Đốc" urlName="ban-giám-đốc" path="-1,1059,1075,1105,1106" isDoc="" nodeType="1104" creatorName="DoDat" writerName="DoDat" writerID="0" template="1103" nodeTypeAlias="banGiamDoc" isPublished="true" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1111, N'cca9ec74-ffc3-445d-8f9c-88eeefe6fdae', CAST(0x0000A8B700FFD24E AS DateTime), N'<banGiamDocItem id="1111" key="e1d7ab7d-1b81-40ea-bedb-f8c55bf3fe0a" parentID="1106" level="5" creatorID="0" sortOrder="0" createDate="2018-04-03T15:31:25" updateDate="2018-04-03T15:31:25" nodeName="Giám Đốc" urlName="giám-đốc" path="-1,1059,1075,1105,1106,1111" isDoc="" nodeType="1110" creatorName="DoDat" writerName="DoDat" writerID="0" template="0" nodeTypeAlias="banGiamDocItem" isPublished="true"><capBac><![CDATA[Trung Tướng]]></capBac><anh><![CDATA[umb://media/168d2bc2b4a244c199ab9277602ad2e7]]></anh><hoTen><![CDATA[Nguyễn Công Định]]></hoTen><danhHieu><![CDATA[GSTS]]></danhHieu><chucVu><![CDATA[Giám Đốc]]></chucVu></banGiamDocItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1112, N'25ee7aaf-c56d-40a3-bedc-d0897d47b62f', CAST(0x0000A8B700FFFADD AS DateTime), N'<banGiamDocItem id="1112" key="bc7b7a90-875f-4fb7-9415-a976cfc68148" parentID="1106" level="5" creatorID="0" sortOrder="1" createDate="2018-04-03T15:31:59" updateDate="2018-04-03T15:31:59" nodeName="Phó Giám Đốc" urlName="phó-giám-đốc" path="-1,1059,1075,1105,1106,1112" isDoc="" nodeType="1110" creatorName="DoDat" writerName="DoDat" writerID="0" template="0" nodeTypeAlias="banGiamDocItem" isPublished="true"><capBac><![CDATA[ád]]></capBac><hoTen><![CDATA[Lê Minh Thái]]></hoTen><danhHieu><![CDATA[ád]]></danhHieu><chucVu><![CDATA[ád]]></chucVu></banGiamDocItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1113, N'3c04fc45-2746-49a4-8d7d-56595316f6fa', CAST(0x0000A8B70101216F AS DateTime), N'<trangChu id="1113" key="4eda2778-7364-46ad-b7e5-24a1e5649c32" parentID="-1" level="1" creatorID="0" sortOrder="2" createDate="2018-04-03T15:35:19" updateDate="2018-04-03T15:36:11" nodeName="Trang Chủ" urlName="trang-chủ" path="-1,1113" isDoc="" nodeType="1058" creatorName="DoDat" writerName="DoDat" writerID="0" template="1055" nodeTypeAlias="trangChu" isPublished="true" />')
SET IDENTITY_INSERT [dbo].[cmsPropertyData] ON 

INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (3, 1086, N'fcd09c11-e991-4f31-9809-99c9591906c6', 37, NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (4, 1086, N'fc8e5bd2-8915-42bd-a8ab-f40d4121d145', 37, NULL, NULL, NULL, NULL, N'<ol>
<li><span>    Phòng Chính trị. Chủ nhiệm chính trị: Đại tá, Tiến sĩ Nguyễn Minh Thắng</span></li>
<li><span>    Văn phòng. Chánh Văn phòng: Đại tá, Kỹ sư Phạm Mạnh Khái<br /></span></li>
<li><span>    Phòng Đào tạo. Trưởng phòng: Đại tá, Phó Giáo sư, Tiến sĩ Trần Xuân Nam<br /></span></li>
<li><span>    Phòng Sau đại học. Trưởng phòng: Đại tá, Phó Giáo sư, Tiến sĩ  Vũ Quốc Trụ</span></li>
<li><span>    Phòng Khoa học Quân sự. Trưởng phòng: Thượng tá, Phó Giáo sư, Tiến sĩ Nguyễn Thái Chung<br /></span></li>
<li><span>    Phòng Thông tin Khoa học Quân sự. Trưởng phòng: Đại tá, Phó Giáo sư, Tiến sĩ Nguyễn Hoàng Vũ<br /></span></li>
<li><span>    Phòng Kỹ thuật. Trưởng phòng: Đại tá, Thạc sỹ Nguyễn Văn Thủy</span></li>
<li><span>    Phòng Hậu cần. Chủ nhiệm: Đại tá, Tiến sỹ Hồ Quang Huy</span></li>
<li><span>    Ban Tài chính. Trưởng ban: Đại tá, Cử nhân Tạ Văn Hồng<br /></span></li>
<li>    Phòng Hợp tác Quốc tế và Quản lý lưu học sinh quân sự. Trưởng phòng: Trung tá, Phó Giáo sư, Tiến sĩ Nguyễn Trung Kiên</li>
<li><span>    Phòng Khảo thí và đảm bảo chất lượng giáo dục - đào tạo. Trưởng phòng: Đại tá, Tiến sĩ Đặng Huy Tú<br /></span></li>
<li><span>    Ban Quản lý dự án. Trưởng ban: Đại tá, Thạc sĩ Nguyễn Ngọc Khôi</span></li>
<li><span>    Ban Quản lý dự án Đầu tư hiện đại hóa các phòng thí nghiệm. Trưởng ban: Đại tá, Tiến sĩ Nguyễn Đăng Hải</span></li>
<li><span>    Trung tâm Công nghệ thông tin. Trưởng Trung tâm: Trung tá, Tiến sĩ Nguyễn Hoàng Sinh<br /></span></li>
<li><span>    Cơ sở II - Thành phố Hồ Chí Minh. Trưởng Đại diện phía Nam: Thượng tá Dương Ngọc Phượng</span></li>
</ol>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (5, 1087, N'd82194c2-75e5-427f-9dad-e2c90e0529d1', 37, NULL, NULL, NULL, NULL, N'<ol>
<ol>
<li><span>Viện Công nghệ Mô phỏng. Viện trưởng: Đại tá, Phó Giáo sư, Tiến sĩ Mai Quang Huy</span></li>
<li><span>Viện Kỹ thuật công trình đặc biệt. Viện trưởng: Đại tá, Phó Giáo sư, Tiến sĩ Nguyễn Trí Tá</span></li>
<li><span>Viện Tích hợp hệ thống. Viện Trưởng: Đại tá, Tiến sĩ Lê Đại Phong<br /></span></li>
</ol>
</ol>
<p> </p>
<ol>
<li><span>Trung tâm Công nghệ. Trưởng Trung tâm: Trung tá, Phó Giáo sư, Tiến sĩ Trần Đức Tăng<br /></span></li>
<li><span>Trung tâm huấn luyện 125 - Vĩnh Phúc. Trưởng Trung tâm: Đại tá, Thạc sĩ Trần Thanh Từ</span></li>
</ol>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (6, 1087, N'f5b30734-8a77-43fd-a765-351ca77f22a7', 37, NULL, NULL, NULL, NULL, N'<p><span>1. Viện Công nghệ Mô phỏng. Viện trưởng: Đại tá, Phó Giáo sư, Tiến sĩ Mai Quang Huy   </span></p>
<p><span>2.Viện Kỹ thuật công trình đặc biệt. Viện trưởng: Đại tá, Phó Giáo sư, Tiến sĩ Nguyễn Trí </span></p>
<p><span>3.Viện Tích hợp hệ thống. Viện Trưởng: Đại tá, Tiến sĩ Lê Đại Phong<br /></span></p>
<p> </p>
<ol>
<li><span>Trung tâm Công nghệ. Trưởng Trung tâm: Trung tá, Phó Giáo sư, Tiến sĩ Trần Đức Tăng<br /></span></li>
<li><span>Trung tâm huấn luyện 125 - Vĩnh Phúc. Trưởng Trung tâm: Đại tá, Thạc sĩ Trần Thanh Từ</span></li>
</ol>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (10, 1099, N'7bebb272-5378-4f74-9ef6-81deae9296e8', 37, NULL, NULL, NULL, NULL, N'<p> <span><strong>Học viện Kỹ thuật Quân sự</strong>          </span></p>
<p> </p>
<p><span>Học viện Kỹ thuật Quân sự được thành lập theo Quyết định số 146/CP ngày 08/8/1966 của Hội đồng Chính phủ với tên gọi ban đầu là “Phân hiệu II Đại học Bách khoa”. Ngày 28/10/1966, tại Hội trường lớn Đại học Bách khoa, Bộ Đại học và Trung học chuyên nghiệp (nay là Bộ Giáo dục và Đào tạo) và Bộ Quốc phòng long trọng tổ chức Lễ thành lập Phân hiệu II Đại học Bách khoa, đồng thời khai giảng khoá đào tạo đầu tiên. Từ đó, ngày 28/10/1966 được chọn là Ngày truyền thống của Học viện Kỹ thuật Quân sự. Ngày 13/6/1968, Thủ tướng Chính phủ quyết định đổi tên “Phân hiệu II Đại học Bách khoa” thành trường Đại học Kỹ thuật Quân sự và ngày 15/12/1981, Bộ Quốc phòng quyết định thành lập Học viện Kỹ thuật Quân sự trên cơ sở trường Đại học Kỹ thuật Quân sự. Ngày 06/6/1991, Chủ tịch Hội đồng Bộ trưởng quyết định cho phép Học viện Kỹ thuật Quân sự mang thêm tên gọi Đại học kỹ thuật Lê Quý Đôn. Ngày 31/1/2008, Học viện Kỹ thuật Quân sự được Chính phủ quyết định bổ sung vào danh sách các trường đại học trọng điểm quốc gia.</span></p>
<p><img src="http://mta.edu.vn/portals/0/Thuy/2017/1_Ngaykhaigiang.jpg" alt="" /></p>
<p><span><em> </em></span></p>
<p><span><em>Học viện Kỹ thuật Quân sự khai giảng năm học mới</em></span></p>
<p><span><em> </em></span></p>
<p><strong><span>Sứ mạng</span></strong></p>
<p><span>Sứ mạng của Học viện Kỹ thuật Quân sự là đào tạo nguồn nhân lực chất lượng cao, nghiên cứu phát triển, sản xuất chế thử, chuyển giao công nghệ tiên tiến và hội nhập quốc tế, góp phần đắc lực vào sự nghiệp xây dựng và bảo vệ Tổ quốc, phát triển ngành khoa học kỹ thuật quân sự Việt Nam.</span></p>
<p><span> </span></p>
<p><strong><span>Mục tiêu</span></strong></p>
<p><span>Đào tạo đội ngũ cán bộ kỹ thuật, chỉ huy quản lý kỹ thuật chất lượng cao có trình độ đại học, sau đại học cho Quân đội và Đất nước; có bản lĩnh chính trị vững vàng, phẩm chất đạo đức tốt, tuyệt đối trung thành với Đảng Cộng sản Việt Nam, với Tổ quốc, với Nhân dân; có trình độ kiến thức nền vững chắc, kiến thức chuyên ngành chuyên sâu; có tác phong chính quy và có năng lực toàn diện trong chỉ huy, quản lý, tổ chức, điều hành và huấn luyện bộ đội; có năng lực ngoại ngữ, công nghệ thông tin đáp ứng yêu cầu hoạt động chuyên môn và hội nhập quốc tế; có sức khỏe tốt; có khả năng tự học tập, nghiên cứu nâng cao trình độ và thích nghi với mọi hoàn cảnh; có khả năng phát triển thành chuyên gia đầu ngành hoặc đảm nhiệm được các chức vụ cao hơn, đáp ứng yêu cầu xây dựng Quân đội, xây dựng và bảo vệ Tổ quốc.</span></p>
<p><span> </span></p>
<p> </p>
<p><strong><span>Phương châm giáo dục - đào tạo của Học viện<br /></span></strong></p>
<p><span>Cơ bản, hệ thống, toàn diện, chuyên sâu.</span></p>
<p><span> </span></p>
<p><span><strong>Nhiệm vụ chính</strong><br /></span></p>
<p><span>- Đào tạo cán bộ kỹ thuật và quản lý kỹ thuật có trình độ đại học, sau đại học</span></p>
<p><em><span>+ Đào tạo Kỹ sư quân sự: 42 chuyên ngành</span></em></p>
<p><em><span>+ Đào tạo Kỹ sư dân sự: 25 chuyên ngành</span></em></p>
<p><em><span>+ Đào tạo Thạc sĩ: 17 ngành</span></em></p>
<p><em><span>+ Đào tạo Tiến sĩ: 12 ngành</span></em></p>
<p><span> - Nghiên cứu khoa học, tư vấn khoa học kỹ thuật, triển khai dịch vụ khoa học công nghệ,… phục vụ quốc phòng - an ninh và kinh tế - xã hội.</span></p>
<p><span> </span></p>
<p><strong><span>Phần thưởng cao quý</span></strong></p>
<p> </p>
<p><span>- Danh hiệu Đơn vị Anh hùng LLVT nhân dân thời kỳ đổi mới;</span></p>
<p><span>- 01 Huân chương Hồ Chí Minh;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhất;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhì;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Ba;</span></p>
<p><span>- 02 Huân chương Quân công hạng Nhất;</span></p>
<p><span>- 01 Huân chương Quân công hạng Nhì;</span></p>
<p><span>- 01 Huân chương Lao động hạng Ba;</span></p>
<p><span>- 03 Huân chương Chiến công: hạng Nhất, hạng Nhì, hạng Ba</span></p>
<p><span> </span></p>
<p><span><img src="http://mta.edu.vn/portals/0/Thuy/2017/NhanHCdoclapHangNhi.jpg" alt="" /><br /></span></p>
<p><em><span> </span></em></p>
<p><em><span>Học viện Kỹ thuật Quân sự đón nhận Huân chương Độc lập hạng Nhì</span></em></p>
<p><em><span> </span></em></p>
<p><strong><span>Địa chỉ</span></strong></p>
<p><span>Cơ sở 1: 236 Hoàng Quốc Việt, Bắc Từ Liêm, Hà Nội<br />Cơ sở 2: Đường Mê Linh, Vĩnh Yên, Vĩnh Phúc<br />Cơ sở 3: 71 Đường Cộng hoà, Quận Tân Bình, Tp. Hồ Chí Minh<br />Cơ sở 4: Kiều Mai, Phú Diễn 1, Bắc Từ Liêm, Hà Nội</span></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (11, 1100, N'cf1de4d3-4f68-4396-abc5-174722806e31', 37, NULL, NULL, NULL, NULL, N'<p><strong><span>Sứ mạng</span></strong></p>
<p><span>Sứ mạng của Học viện Kỹ thuật Quân sự là đào tạo nguồn nhân lực chất lượng cao, nghiên cứu phát triển, sản xuất chế thử, chuyển giao công nghệ tiên tiến và hội nhập quốc tế, góp phần đắc lực vào sự nghiệp xây dựng và bảo vệ Tổ quốc, phát triển ngành khoa học kỹ thuật quân sự Việt Nam.</span></p>
<p><span> </span></p>
<p><strong><span>Mục tiêu</span></strong></p>
<p><span>Đào tạo đội ngũ cán bộ kỹ thuật, chỉ huy quản lý kỹ thuật chất lượng cao có trình độ đại học, sau đại học cho Quân đội và Đất nước; có bản lĩnh chính trị vững vàng, phẩm chất đạo đức tốt, tuyệt đối trung thành với Đảng Cộng sản Việt Nam, với Tổ quốc, với Nhân dân; có trình độ kiến thức nền vững chắc, kiến thức chuyên ngành chuyên sâu; có tác phong chính quy và có năng lực toàn diện trong chỉ huy, quản lý, tổ chức, điều hành và huấn luyện bộ đội; có năng lực ngoại ngữ, công nghệ thông tin đáp ứng yêu cầu hoạt động chuyên môn và hội nhập quốc tế; có sức khỏe tốt; có khả năng tự học tập, nghiên cứu nâng cao trình độ và thích nghi với mọi hoàn cảnh; có khả năng phát triển thành chuyên gia đầu ngành hoặc đảm nhiệm được các chức vụ cao hơn, đáp ứng yêu cầu xây dựng Quân đội, xây dựng và bảo vệ Tổ quốc.</span></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (12, 1101, N'ad59612a-3485-4a84-bbde-c3eb6c1c9318', 37, NULL, NULL, NULL, NULL, N'<p><strong><span>Phần thưởng cao quý</span></strong></p>
<p> </p>
<p><span>- Danh hiệu Đơn vị Anh hùng LLVT nhân dân thời kỳ đổi mới;</span></p>
<p><span>- 01 Huân chương Hồ Chí Minh;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhất;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhì;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Ba;</span></p>
<p><span>- 02 Huân chương Quân công hạng Nhất;</span></p>
<p><span>- 01 Huân chương Quân công hạng Nhì;</span></p>
<p><span>- 01 Huân chương Lao động hạng Ba;</span></p>
<p><span>- 03 Huân chương Chiến công: hạng Nhất, hạng Nhì, hạng Ba</span></p>
<p><span> </span></p>
<p><span><img src="http://mta.edu.vn/portals/0/Thuy/2017/NhanHCdoclapHangNhi.jpg" alt="" /><br /></span></p>
<p><em><span> </span></em></p>
<p><em><span>Học viện Kỹ thuật Quân sự đón nhận Huân chương Độc lập hạng Nhì</span></em></p>
<p><em><span> </span></em></p>
<p><strong><span>Địa chỉ</span></strong></p>
<p><span>Cơ sở 1: 236 Hoàng Quốc Việt, Bắc Từ Liêm, Hà Nội<br />Cơ sở 2: Đường Mê Linh, Vĩnh Yên, Vĩnh Phúc<br />Cơ sở 3: 71 Đường Cộng hoà, Quận Tân Bình, Tp. Hồ Chí Minh<br />Cơ sở 4: Kiều Mai, Phú Diễn 1, Bắc Từ Liêm, Hà Nội</span></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (13, 1102, N'85ede54f-6d08-45fb-939d-9b0d371e6622', 37, NULL, NULL, NULL, NULL, N'<p><strong><span>Phần thưởng cao quý</span></strong></p>
<p> </p>
<p><span>- Danh hiệu Đơn vị Anh hùng LLVT nhân dân thời kỳ đổi mới;</span></p>
<p><span>- 01 Huân chương Hồ Chí Minh;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhất;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhì;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Ba;</span></p>
<p><span>- 02 Huân chương Quân công hạng Nhất;</span></p>
<p><span>- 01 Huân chương Quân công hạng Nhì;</span></p>
<p><span>- 01 Huân chương Lao động hạng Ba;</span></p>
<p><span>- 03 Huân chương Chiến công: hạng Nhất, hạng Nhì, hạng Ba</span></p>
<p><span> </span></p>
<p><span><img src="http://mta.edu.vn/portals/0/Thuy/2017/NhanHCdoclapHangNhi.jpg" alt="" /><br /></span></p>
<p><em><span> </span></em></p>
<p><em><span>Học viện Kỹ thuật Quân sự đón nhận Huân chương Độc lập hạng Nhì</span></em></p>
<p><em><span> </span></em></p>
<p><strong><span>Địa chỉ</span></strong></p>
<p><span>Cơ sở 1: 236 Hoàng Quốc Việt, Bắc Từ Liêm, Hà Nội<br />Cơ sở 2: Đường Mê Linh, Vĩnh Yên, Vĩnh Phúc<br />Cơ sở 3: 71 Đường Cộng hoà, Quận Tân Bình, Tp. Hồ Chí Minh<br />Cơ sở 4: Kiều Mai, Phú Diễn 1, Bắc Từ Liêm, Hà Nội</span></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (14, 1087, N'be28c0cc-5fe8-476a-80a9-892db6cbb9ef', 37, NULL, NULL, NULL, NULL, N'<p><span>1. Viện Công nghệ Mô phỏng. Viện trưởng: Đại tá, Phó Giáo sư, Tiến sĩ Mai Quang Huy   </span></p>
<p><span>2.Viện Kỹ thuật công trình đặc biệt. Viện trưởng: Đại tá, Phó Giáo sư, Tiến sĩ Nguyễn Trí </span></p>
<p><span>3.Viện Tích hợp hệ thống. Viện Trưởng: Đại tá, Tiến sĩ Lê Đại Phong<br /></span></p>
<p> </p>
<ol>
<li><span>Trung tâm Công nghệ. Trưởng Trung tâm: Trung tá, Phó Giáo sư, Tiến sĩ Trần Đức Tăng<br /></span></li>
<li><span>Trung tâm huấn luyện 125 - Vĩnh Phúc. Trưởng Trung tâm: Đại tá, Thạc sĩ Trần Thanh Từ</span></li>
</ol>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (15, 1086, N'6ab80cad-7dd7-4ae9-a280-29fbb955a0d6', 37, NULL, NULL, NULL, NULL, N'<ol>
<li><span>    Phòng Chính trị. Chủ nhiệm chính trị: Đại tá, Tiến sĩ Nguyễn Minh Thắng</span></li>
<li><span>    Văn phòng. Chánh Văn phòng: Đại tá, Kỹ sư Phạm Mạnh Khái<br /></span></li>
<li><span>    Phòng Đào tạo. Trưởng phòng: Đại tá, Phó Giáo sư, Tiến sĩ Trần Xuân Nam<br /></span></li>
<li><span>    Phòng Sau đại học. Trưởng phòng: Đại tá, Phó Giáo sư, Tiến sĩ  Vũ Quốc Trụ</span></li>
<li><span>    Phòng Khoa học Quân sự. Trưởng phòng: Thượng tá, Phó Giáo sư, Tiến sĩ Nguyễn Thái Chung<br /></span></li>
<li><span>    Phòng Thông tin Khoa học Quân sự. Trưởng phòng: Đại tá, Phó Giáo sư, Tiến sĩ Nguyễn Hoàng Vũ<br /></span></li>
<li><span>    Phòng Kỹ thuật. Trưởng phòng: Đại tá, Thạc sỹ Nguyễn Văn Thủy</span></li>
<li><span>    Phòng Hậu cần. Chủ nhiệm: Đại tá, Tiến sỹ Hồ Quang Huy</span></li>
<li><span>    Ban Tài chính. Trưởng ban: Đại tá, Cử nhân Tạ Văn Hồng<br /></span></li>
<li>    Phòng Hợp tác Quốc tế và Quản lý lưu học sinh quân sự. Trưởng phòng: Trung tá, Phó Giáo sư, Tiến sĩ Nguyễn Trung Kiên</li>
<li><span>    Phòng Khảo thí và đảm bảo chất lượng giáo dục - đào tạo. Trưởng phòng: Đại tá, Tiến sĩ Đặng Huy Tú<br /></span></li>
<li><span>    Ban Quản lý dự án. Trưởng ban: Đại tá, Thạc sĩ Nguyễn Ngọc Khôi</span></li>
<li><span>    Ban Quản lý dự án Đầu tư hiện đại hóa các phòng thí nghiệm. Trưởng ban: Đại tá, Tiến sĩ Nguyễn Đăng Hải</span></li>
<li><span>    Trung tâm Công nghệ thông tin. Trưởng Trung tâm: Trung tá, Tiến sĩ Nguyễn Hoàng Sinh<br /></span></li>
<li><span>    Cơ sở II - Thành phố Hồ Chí Minh. Trưởng Đại diện phía Nam: Thượng tá Dương Ngọc Phượng</span></li>
</ol>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (17, 1102, N'65305876-844c-4aa6-b8d5-e444686482a4', 37, NULL, NULL, NULL, NULL, N'<p><strong><span>Phần thưởng cao quý</span></strong></p>
<p> </p>
<p><span>- Danh hiệu Đơn vị Anh hùng LLVT nhân dân thời kỳ đổi mới;</span></p>
<p><span>- 01 Huân chương Hồ Chí Minh;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhất;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhì;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Ba;</span></p>
<p><span>- 02 Huân chương Quân công hạng Nhất;</span></p>
<p><span>- 01 Huân chương Quân công hạng Nhì;</span></p>
<p><span>- 01 Huân chương Lao động hạng Ba;</span></p>
<p><span>- 03 Huân chương Chiến công: hạng Nhất, hạng Nhì, hạng Ba</span></p>
<p><span> </span></p>
<p><span><img src="http://mta.edu.vn/portals/0/Thuy/2017/NhanHCdoclapHangNhi.jpg" alt="" /><br /></span></p>
<p><em><span> </span></em></p>
<p><em><span>Học viện Kỹ thuật Quân sự đón nhận Huân chương Độc lập hạng Nhì</span></em></p>
<p><em><span> </span></em></p>
<p><strong><span>Địa chỉ</span></strong></p>
<p><span>Cơ sở 1: 236 Hoàng Quốc Việt, Bắc Từ Liêm, Hà Nội<br />Cơ sở 2: Đường Mê Linh, Vĩnh Yên, Vĩnh Phúc<br />Cơ sở 3: 71 Đường Cộng hoà, Quận Tân Bình, Tp. Hồ Chí Minh<br />Cơ sở 4: Kiều Mai, Phú Diễn 1, Bắc Từ Liêm, Hà Nội</span></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (18, 1101, N'7c53c7fb-8414-4b4b-b686-6dba399c0db5', 37, NULL, NULL, NULL, NULL, N'<p><strong><span>Phần thưởng cao quý</span></strong></p>
<p> </p>
<p><span>- Danh hiệu Đơn vị Anh hùng LLVT nhân dân thời kỳ đổi mới;</span></p>
<p><span>- 01 Huân chương Hồ Chí Minh;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhất;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhì;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Ba;</span></p>
<p><span>- 02 Huân chương Quân công hạng Nhất;</span></p>
<p><span>- 01 Huân chương Quân công hạng Nhì;</span></p>
<p><span>- 01 Huân chương Lao động hạng Ba;</span></p>
<p><span>- 03 Huân chương Chiến công: hạng Nhất, hạng Nhì, hạng Ba</span></p>
<p><span> </span></p>
<p><span><img src="http://mta.edu.vn/portals/0/Thuy/2017/NhanHCdoclapHangNhi.jpg" alt="" /><br /></span></p>
<p><em><span> </span></em></p>
<p><em><span>Học viện Kỹ thuật Quân sự đón nhận Huân chương Độc lập hạng Nhì</span></em></p>
<p><em><span> </span></em></p>
<p><strong><span>Địa chỉ</span></strong></p>
<p><span>Cơ sở 1: 236 Hoàng Quốc Việt, Bắc Từ Liêm, Hà Nội<br />Cơ sở 2: Đường Mê Linh, Vĩnh Yên, Vĩnh Phúc<br />Cơ sở 3: 71 Đường Cộng hoà, Quận Tân Bình, Tp. Hồ Chí Minh<br />Cơ sở 4: Kiều Mai, Phú Diễn 1, Bắc Từ Liêm, Hà Nội</span></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (19, 1099, N'2426b643-8bcd-4727-81cc-d7d509324a32', 37, NULL, NULL, NULL, NULL, N'<p> <span><strong>Học viện Kỹ thuật Quân sự</strong>          </span></p>
<p> </p>
<p><span>Học viện Kỹ thuật Quân sự được thành lập theo Quyết định số 146/CP ngày 08/8/1966 của Hội đồng Chính phủ với tên gọi ban đầu là “Phân hiệu II Đại học Bách khoa”. Ngày 28/10/1966, tại Hội trường lớn Đại học Bách khoa, Bộ Đại học và Trung học chuyên nghiệp (nay là Bộ Giáo dục và Đào tạo) và Bộ Quốc phòng long trọng tổ chức Lễ thành lập Phân hiệu II Đại học Bách khoa, đồng thời khai giảng khoá đào tạo đầu tiên. Từ đó, ngày 28/10/1966 được chọn là Ngày truyền thống của Học viện Kỹ thuật Quân sự. Ngày 13/6/1968, Thủ tướng Chính phủ quyết định đổi tên “Phân hiệu II Đại học Bách khoa” thành trường Đại học Kỹ thuật Quân sự và ngày 15/12/1981, Bộ Quốc phòng quyết định thành lập Học viện Kỹ thuật Quân sự trên cơ sở trường Đại học Kỹ thuật Quân sự. Ngày 06/6/1991, Chủ tịch Hội đồng Bộ trưởng quyết định cho phép Học viện Kỹ thuật Quân sự mang thêm tên gọi Đại học kỹ thuật Lê Quý Đôn. Ngày 31/1/2008, Học viện Kỹ thuật Quân sự được Chính phủ quyết định bổ sung vào danh sách các trường đại học trọng điểm quốc gia.</span></p>
<p><img src="http://mta.edu.vn/portals/0/Thuy/2017/1_Ngaykhaigiang.jpg" alt="" /></p>
<p><span><em> </em></span></p>
<p><span><em>Học viện Kỹ thuật Quân sự khai giảng năm học mới</em></span></p>
<p><span><em> </em></span></p>
<p><strong><span>Sứ mạng</span></strong></p>
<p><span>Sứ mạng của Học viện Kỹ thuật Quân sự là đào tạo nguồn nhân lực chất lượng cao, nghiên cứu phát triển, sản xuất chế thử, chuyển giao công nghệ tiên tiến và hội nhập quốc tế, góp phần đắc lực vào sự nghiệp xây dựng và bảo vệ Tổ quốc, phát triển ngành khoa học kỹ thuật quân sự Việt Nam.</span></p>
<p><span> </span></p>
<p><strong><span>Mục tiêu</span></strong></p>
<p><span>Đào tạo đội ngũ cán bộ kỹ thuật, chỉ huy quản lý kỹ thuật chất lượng cao có trình độ đại học, sau đại học cho Quân đội và Đất nước; có bản lĩnh chính trị vững vàng, phẩm chất đạo đức tốt, tuyệt đối trung thành với Đảng Cộng sản Việt Nam, với Tổ quốc, với Nhân dân; có trình độ kiến thức nền vững chắc, kiến thức chuyên ngành chuyên sâu; có tác phong chính quy và có năng lực toàn diện trong chỉ huy, quản lý, tổ chức, điều hành và huấn luyện bộ đội; có năng lực ngoại ngữ, công nghệ thông tin đáp ứng yêu cầu hoạt động chuyên môn và hội nhập quốc tế; có sức khỏe tốt; có khả năng tự học tập, nghiên cứu nâng cao trình độ và thích nghi với mọi hoàn cảnh; có khả năng phát triển thành chuyên gia đầu ngành hoặc đảm nhiệm được các chức vụ cao hơn, đáp ứng yêu cầu xây dựng Quân đội, xây dựng và bảo vệ Tổ quốc.</span></p>
<p><span> </span></p>
<p> </p>
<p><strong><span>Phương châm giáo dục - đào tạo của Học viện<br /></span></strong></p>
<p><span>Cơ bản, hệ thống, toàn diện, chuyên sâu.</span></p>
<p><span> </span></p>
<p><span><strong>Nhiệm vụ chính</strong><br /></span></p>
<p><span>- Đào tạo cán bộ kỹ thuật và quản lý kỹ thuật có trình độ đại học, sau đại học</span></p>
<p><em><span>+ Đào tạo Kỹ sư quân sự: 42 chuyên ngành</span></em></p>
<p><em><span>+ Đào tạo Kỹ sư dân sự: 25 chuyên ngành</span></em></p>
<p><em><span>+ Đào tạo Thạc sĩ: 17 ngành</span></em></p>
<p><em><span>+ Đào tạo Tiến sĩ: 12 ngành</span></em></p>
<p><span> - Nghiên cứu khoa học, tư vấn khoa học kỹ thuật, triển khai dịch vụ khoa học công nghệ,… phục vụ quốc phòng - an ninh và kinh tế - xã hội.</span></p>
<p><span> </span></p>
<p><strong><span>Phần thưởng cao quý</span></strong></p>
<p> </p>
<p><span>- Danh hiệu Đơn vị Anh hùng LLVT nhân dân thời kỳ đổi mới;</span></p>
<p><span>- 01 Huân chương Hồ Chí Minh;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhất;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhì;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Ba;</span></p>
<p><span>- 02 Huân chương Quân công hạng Nhất;</span></p>
<p><span>- 01 Huân chương Quân công hạng Nhì;</span></p>
<p><span>- 01 Huân chương Lao động hạng Ba;</span></p>
<p><span>- 03 Huân chương Chiến công: hạng Nhất, hạng Nhì, hạng Ba</span></p>
<p><span> </span></p>
<p><span><img src="http://mta.edu.vn/portals/0/Thuy/2017/NhanHCdoclapHangNhi.jpg" alt="" /><br /></span></p>
<p><em><span> </span></em></p>
<p><em><span>Học viện Kỹ thuật Quân sự đón nhận Huân chương Độc lập hạng Nhì</span></em></p>
<p><em><span> </span></em></p>
<p><strong><span>Địa chỉ</span></strong></p>
<p><span>Cơ sở 1: 236 Hoàng Quốc Việt, Bắc Từ Liêm, Hà Nội<br />Cơ sở 2: Đường Mê Linh, Vĩnh Yên, Vĩnh Phúc<br />Cơ sở 3: 71 Đường Cộng hoà, Quận Tân Bình, Tp. Hồ Chí Minh<br />Cơ sở 4: Kiều Mai, Phú Diễn 1, Bắc Từ Liêm, Hà Nội</span></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (20, 1100, N'7053ea2f-be52-4611-8d0f-a2b259dd4f89', 37, NULL, NULL, NULL, NULL, N'<p><strong><span>Sứ mạng</span></strong></p>
<p><span>Sứ mạng của Học viện Kỹ thuật Quân sự là đào tạo nguồn nhân lực chất lượng cao, nghiên cứu phát triển, sản xuất chế thử, chuyển giao công nghệ tiên tiến và hội nhập quốc tế, góp phần đắc lực vào sự nghiệp xây dựng và bảo vệ Tổ quốc, phát triển ngành khoa học kỹ thuật quân sự Việt Nam.</span></p>
<p><span> </span></p>
<p><strong><span>Mục tiêu</span></strong></p>
<p><span>Đào tạo đội ngũ cán bộ kỹ thuật, chỉ huy quản lý kỹ thuật chất lượng cao có trình độ đại học, sau đại học cho Quân đội và Đất nước; có bản lĩnh chính trị vững vàng, phẩm chất đạo đức tốt, tuyệt đối trung thành với Đảng Cộng sản Việt Nam, với Tổ quốc, với Nhân dân; có trình độ kiến thức nền vững chắc, kiến thức chuyên ngành chuyên sâu; có tác phong chính quy và có năng lực toàn diện trong chỉ huy, quản lý, tổ chức, điều hành và huấn luyện bộ đội; có năng lực ngoại ngữ, công nghệ thông tin đáp ứng yêu cầu hoạt động chuyên môn và hội nhập quốc tế; có sức khỏe tốt; có khả năng tự học tập, nghiên cứu nâng cao trình độ và thích nghi với mọi hoàn cảnh; có khả năng phát triển thành chuyên gia đầu ngành hoặc đảm nhiệm được các chức vụ cao hơn, đáp ứng yêu cầu xây dựng Quân đội, xây dựng và bảo vệ Tổ quốc.</span></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (21, 1087, N'7685c9d8-99ac-4682-bd37-5aaaf45405b2', 37, NULL, NULL, NULL, NULL, N'<p><span>1. Viện Công nghệ Mô phỏng. Viện trưởng: Đại tá, Phó Giáo sư, Tiến sĩ Mai Quang Huy   </span></p>
<p><span>2.Viện Kỹ thuật công trình đặc biệt. Viện trưởng: Đại tá, Phó Giáo sư, Tiến sĩ Nguyễn Trí </span></p>
<p><span>3.Viện Tích hợp hệ thống. Viện Trưởng: Đại tá, Tiến sĩ Lê Đại Phong<br /></span></p>
<p> </p>
<ol>
<li><span>Trung tâm Công nghệ. Trưởng Trung tâm: Trung tá, Phó Giáo sư, Tiến sĩ Trần Đức Tăng<br /></span></li>
<li><span>Trung tâm huấn luyện 125 - Vĩnh Phúc. Trưởng Trung tâm: Đại tá, Thạc sĩ Trần Thanh Từ</span></li>
</ol>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (22, 1086, N'6dc35893-cbbf-44d4-ab97-e8672c569117', 37, NULL, NULL, NULL, NULL, N'<ol>
<li><span>    Phòng Chính trị. Chủ nhiệm chính trị: Đại tá, Tiến sĩ Nguyễn Minh Thắng</span></li>
<li><span>    Văn phòng. Chánh Văn phòng: Đại tá, Kỹ sư Phạm Mạnh Khái<br /></span></li>
<li><span>    Phòng Đào tạo. Trưởng phòng: Đại tá, Phó Giáo sư, Tiến sĩ Trần Xuân Nam<br /></span></li>
<li><span>    Phòng Sau đại học. Trưởng phòng: Đại tá, Phó Giáo sư, Tiến sĩ  Vũ Quốc Trụ</span></li>
<li><span>    Phòng Khoa học Quân sự. Trưởng phòng: Thượng tá, Phó Giáo sư, Tiến sĩ Nguyễn Thái Chung<br /></span></li>
<li><span>    Phòng Thông tin Khoa học Quân sự. Trưởng phòng: Đại tá, Phó Giáo sư, Tiến sĩ Nguyễn Hoàng Vũ<br /></span></li>
<li><span>    Phòng Kỹ thuật. Trưởng phòng: Đại tá, Thạc sỹ Nguyễn Văn Thủy</span></li>
<li><span>    Phòng Hậu cần. Chủ nhiệm: Đại tá, Tiến sỹ Hồ Quang Huy</span></li>
<li><span>    Ban Tài chính. Trưởng ban: Đại tá, Cử nhân Tạ Văn Hồng<br /></span></li>
<li>    Phòng Hợp tác Quốc tế và Quản lý lưu học sinh quân sự. Trưởng phòng: Trung tá, Phó Giáo sư, Tiến sĩ Nguyễn Trung Kiên</li>
<li><span>    Phòng Khảo thí và đảm bảo chất lượng giáo dục - đào tạo. Trưởng phòng: Đại tá, Tiến sĩ Đặng Huy Tú<br /></span></li>
<li><span>    Ban Quản lý dự án. Trưởng ban: Đại tá, Thạc sĩ Nguyễn Ngọc Khôi</span></li>
<li><span>    Ban Quản lý dự án Đầu tư hiện đại hóa các phòng thí nghiệm. Trưởng ban: Đại tá, Tiến sĩ Nguyễn Đăng Hải</span></li>
<li><span>    Trung tâm Công nghệ thông tin. Trưởng Trung tâm: Trung tá, Tiến sĩ Nguyễn Hoàng Sinh<br /></span></li>
<li><span>    Cơ sở II - Thành phố Hồ Chí Minh. Trưởng Đại diện phía Nam: Thượng tá Dương Ngọc Phượng</span></li>
</ol>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (24, 1102, N'27210fe1-f718-4fa4-9267-c8e5e90c3b7e', 37, NULL, NULL, NULL, NULL, N'<p><strong><span>Phần thưởng cao quý</span></strong></p>
<p> </p>
<p><span>- Danh hiệu Đơn vị Anh hùng LLVT nhân dân thời kỳ đổi mới;</span></p>
<p><span>- 01 Huân chương Hồ Chí Minh;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhất;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhì;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Ba;</span></p>
<p><span>- 02 Huân chương Quân công hạng Nhất;</span></p>
<p><span>- 01 Huân chương Quân công hạng Nhì;</span></p>
<p><span>- 01 Huân chương Lao động hạng Ba;</span></p>
<p><span>- 03 Huân chương Chiến công: hạng Nhất, hạng Nhì, hạng Ba</span></p>
<p><span> </span></p>
<p><span><img src="http://mta.edu.vn/portals/0/Thuy/2017/NhanHCdoclapHangNhi.jpg" alt="" /><br /></span></p>
<p><em><span> </span></em></p>
<p><em><span>Học viện Kỹ thuật Quân sự đón nhận Huân chương Độc lập hạng Nhì</span></em></p>
<p><em><span> </span></em></p>
<p><strong><span>Địa chỉ</span></strong></p>
<p><span>Cơ sở 1: 236 Hoàng Quốc Việt, Bắc Từ Liêm, Hà Nội<br />Cơ sở 2: Đường Mê Linh, Vĩnh Yên, Vĩnh Phúc<br />Cơ sở 3: 71 Đường Cộng hoà, Quận Tân Bình, Tp. Hồ Chí Minh<br />Cơ sở 4: Kiều Mai, Phú Diễn 1, Bắc Từ Liêm, Hà Nội</span></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (25, 1101, N'239410eb-ef0e-43c4-b91c-67407779600c', 37, NULL, NULL, NULL, NULL, N'<p><strong><span>Phần thưởng cao quý</span></strong></p>
<p> </p>
<p><span>- Danh hiệu Đơn vị Anh hùng LLVT nhân dân thời kỳ đổi mới;</span></p>
<p><span>- 01 Huân chương Hồ Chí Minh;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhất;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhì;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Ba;</span></p>
<p><span>- 02 Huân chương Quân công hạng Nhất;</span></p>
<p><span>- 01 Huân chương Quân công hạng Nhì;</span></p>
<p><span>- 01 Huân chương Lao động hạng Ba;</span></p>
<p><span>- 03 Huân chương Chiến công: hạng Nhất, hạng Nhì, hạng Ba</span></p>
<p><span> </span></p>
<p><span><img src="http://mta.edu.vn/portals/0/Thuy/2017/NhanHCdoclapHangNhi.jpg" alt="" /><br /></span></p>
<p><em><span> </span></em></p>
<p><em><span>Học viện Kỹ thuật Quân sự đón nhận Huân chương Độc lập hạng Nhì</span></em></p>
<p><em><span> </span></em></p>
<p><strong><span>Địa chỉ</span></strong></p>
<p><span>Cơ sở 1: 236 Hoàng Quốc Việt, Bắc Từ Liêm, Hà Nội<br />Cơ sở 2: Đường Mê Linh, Vĩnh Yên, Vĩnh Phúc<br />Cơ sở 3: 71 Đường Cộng hoà, Quận Tân Bình, Tp. Hồ Chí Minh<br />Cơ sở 4: Kiều Mai, Phú Diễn 1, Bắc Từ Liêm, Hà Nội</span></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (26, 1099, N'26d246ad-6ec9-4b44-9143-9359084a4a12', 37, NULL, NULL, NULL, NULL, N'<p> <span><strong>Học viện Kỹ thuật Quân sự</strong>          </span></p>
<p> </p>
<p><span>Học viện Kỹ thuật Quân sự được thành lập theo Quyết định số 146/CP ngày 08/8/1966 của Hội đồng Chính phủ với tên gọi ban đầu là “Phân hiệu II Đại học Bách khoa”. Ngày 28/10/1966, tại Hội trường lớn Đại học Bách khoa, Bộ Đại học và Trung học chuyên nghiệp (nay là Bộ Giáo dục và Đào tạo) và Bộ Quốc phòng long trọng tổ chức Lễ thành lập Phân hiệu II Đại học Bách khoa, đồng thời khai giảng khoá đào tạo đầu tiên. Từ đó, ngày 28/10/1966 được chọn là Ngày truyền thống của Học viện Kỹ thuật Quân sự. Ngày 13/6/1968, Thủ tướng Chính phủ quyết định đổi tên “Phân hiệu II Đại học Bách khoa” thành trường Đại học Kỹ thuật Quân sự và ngày 15/12/1981, Bộ Quốc phòng quyết định thành lập Học viện Kỹ thuật Quân sự trên cơ sở trường Đại học Kỹ thuật Quân sự. Ngày 06/6/1991, Chủ tịch Hội đồng Bộ trưởng quyết định cho phép Học viện Kỹ thuật Quân sự mang thêm tên gọi Đại học kỹ thuật Lê Quý Đôn. Ngày 31/1/2008, Học viện Kỹ thuật Quân sự được Chính phủ quyết định bổ sung vào danh sách các trường đại học trọng điểm quốc gia.</span></p>
<p><img src="http://mta.edu.vn/portals/0/Thuy/2017/1_Ngaykhaigiang.jpg" alt="" /></p>
<p><span><em> </em></span></p>
<p><span><em>Học viện Kỹ thuật Quân sự khai giảng năm học mới</em></span></p>
<p><span><em> </em></span></p>
<p><strong><span>Sứ mạng</span></strong></p>
<p><span>Sứ mạng của Học viện Kỹ thuật Quân sự là đào tạo nguồn nhân lực chất lượng cao, nghiên cứu phát triển, sản xuất chế thử, chuyển giao công nghệ tiên tiến và hội nhập quốc tế, góp phần đắc lực vào sự nghiệp xây dựng và bảo vệ Tổ quốc, phát triển ngành khoa học kỹ thuật quân sự Việt Nam.</span></p>
<p><span> </span></p>
<p><strong><span>Mục tiêu</span></strong></p>
<p><span>Đào tạo đội ngũ cán bộ kỹ thuật, chỉ huy quản lý kỹ thuật chất lượng cao có trình độ đại học, sau đại học cho Quân đội và Đất nước; có bản lĩnh chính trị vững vàng, phẩm chất đạo đức tốt, tuyệt đối trung thành với Đảng Cộng sản Việt Nam, với Tổ quốc, với Nhân dân; có trình độ kiến thức nền vững chắc, kiến thức chuyên ngành chuyên sâu; có tác phong chính quy và có năng lực toàn diện trong chỉ huy, quản lý, tổ chức, điều hành và huấn luyện bộ đội; có năng lực ngoại ngữ, công nghệ thông tin đáp ứng yêu cầu hoạt động chuyên môn và hội nhập quốc tế; có sức khỏe tốt; có khả năng tự học tập, nghiên cứu nâng cao trình độ và thích nghi với mọi hoàn cảnh; có khả năng phát triển thành chuyên gia đầu ngành hoặc đảm nhiệm được các chức vụ cao hơn, đáp ứng yêu cầu xây dựng Quân đội, xây dựng và bảo vệ Tổ quốc.</span></p>
<p><span> </span></p>
<p> </p>
<p><strong><span>Phương châm giáo dục - đào tạo của Học viện<br /></span></strong></p>
<p><span>Cơ bản, hệ thống, toàn diện, chuyên sâu.</span></p>
<p><span> </span></p>
<p><span><strong>Nhiệm vụ chính</strong><br /></span></p>
<p><span>- Đào tạo cán bộ kỹ thuật và quản lý kỹ thuật có trình độ đại học, sau đại học</span></p>
<p><em><span>+ Đào tạo Kỹ sư quân sự: 42 chuyên ngành</span></em></p>
<p><em><span>+ Đào tạo Kỹ sư dân sự: 25 chuyên ngành</span></em></p>
<p><em><span>+ Đào tạo Thạc sĩ: 17 ngành</span></em></p>
<p><em><span>+ Đào tạo Tiến sĩ: 12 ngành</span></em></p>
<p><span> - Nghiên cứu khoa học, tư vấn khoa học kỹ thuật, triển khai dịch vụ khoa học công nghệ,… phục vụ quốc phòng - an ninh và kinh tế - xã hội.</span></p>
<p><span> </span></p>
<p><strong><span>Phần thưởng cao quý</span></strong></p>
<p> </p>
<p><span>- Danh hiệu Đơn vị Anh hùng LLVT nhân dân thời kỳ đổi mới;</span></p>
<p><span>- 01 Huân chương Hồ Chí Minh;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhất;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhì;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Ba;</span></p>
<p><span>- 02 Huân chương Quân công hạng Nhất;</span></p>
<p><span>- 01 Huân chương Quân công hạng Nhì;</span></p>
<p><span>- 01 Huân chương Lao động hạng Ba;</span></p>
<p><span>- 03 Huân chương Chiến công: hạng Nhất, hạng Nhì, hạng Ba</span></p>
<p><span> </span></p>
<p><span><img src="http://mta.edu.vn/portals/0/Thuy/2017/NhanHCdoclapHangNhi.jpg" alt="" /><br /></span></p>
<p><em><span> </span></em></p>
<p><em><span>Học viện Kỹ thuật Quân sự đón nhận Huân chương Độc lập hạng Nhì</span></em></p>
<p><em><span> </span></em></p>
<p><strong><span>Địa chỉ</span></strong></p>
<p><span>Cơ sở 1: 236 Hoàng Quốc Việt, Bắc Từ Liêm, Hà Nội<br />Cơ sở 2: Đường Mê Linh, Vĩnh Yên, Vĩnh Phúc<br />Cơ sở 3: 71 Đường Cộng hoà, Quận Tân Bình, Tp. Hồ Chí Minh<br />Cơ sở 4: Kiều Mai, Phú Diễn 1, Bắc Từ Liêm, Hà Nội</span></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (27, 1100, N'9274556f-cf17-44e6-ac26-e75c5b5b099c', 37, NULL, NULL, NULL, NULL, N'<p><strong><span>Sứ mạng</span></strong></p>
<p><span>Sứ mạng của Học viện Kỹ thuật Quân sự là đào tạo nguồn nhân lực chất lượng cao, nghiên cứu phát triển, sản xuất chế thử, chuyển giao công nghệ tiên tiến và hội nhập quốc tế, góp phần đắc lực vào sự nghiệp xây dựng và bảo vệ Tổ quốc, phát triển ngành khoa học kỹ thuật quân sự Việt Nam.</span></p>
<p><span> </span></p>
<p><strong><span>Mục tiêu</span></strong></p>
<p><span>Đào tạo đội ngũ cán bộ kỹ thuật, chỉ huy quản lý kỹ thuật chất lượng cao có trình độ đại học, sau đại học cho Quân đội và Đất nước; có bản lĩnh chính trị vững vàng, phẩm chất đạo đức tốt, tuyệt đối trung thành với Đảng Cộng sản Việt Nam, với Tổ quốc, với Nhân dân; có trình độ kiến thức nền vững chắc, kiến thức chuyên ngành chuyên sâu; có tác phong chính quy và có năng lực toàn diện trong chỉ huy, quản lý, tổ chức, điều hành và huấn luyện bộ đội; có năng lực ngoại ngữ, công nghệ thông tin đáp ứng yêu cầu hoạt động chuyên môn và hội nhập quốc tế; có sức khỏe tốt; có khả năng tự học tập, nghiên cứu nâng cao trình độ và thích nghi với mọi hoàn cảnh; có khả năng phát triển thành chuyên gia đầu ngành hoặc đảm nhiệm được các chức vụ cao hơn, đáp ứng yêu cầu xây dựng Quân đội, xây dựng và bảo vệ Tổ quốc.</span></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (28, 1102, N'f096073c-3d33-47fa-87b5-6003e2150e4a', 37, NULL, NULL, NULL, NULL, N'<p><strong><span>Phần thưởng cao quý</span></strong></p>
<p> </p>
<p><span>- Danh hiệu Đơn vị Anh hùng LLVT nhân dân thời kỳ đổi mới;</span></p>
<p><span>- 01 Huân chương Hồ Chí Minh;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhất;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhì;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Ba;</span></p>
<p><span>- 02 Huân chương Quân công hạng Nhất;</span></p>
<p><span>- 01 Huân chương Quân công hạng Nhì;</span></p>
<p><span>- 01 Huân chương Lao động hạng Ba;</span></p>
<p><span>- 03 Huân chương Chiến công: hạng Nhất, hạng Nhì, hạng Ba</span></p>
<p><span> </span></p>
<p><span><img src="http://mta.edu.vn/portals/0/Thuy/2017/NhanHCdoclapHangNhi.jpg" alt="" /><br /></span></p>
<p><em><span> </span></em></p>
<p><em><span>Học viện Kỹ thuật Quân sự đón nhận Huân chương Độc lập hạng Nhì</span></em></p>
<p><em><span> </span></em></p>
<p><strong><span>Địa chỉ</span></strong></p>
<p><span>Cơ sở 1: 236 Hoàng Quốc Việt, Bắc Từ Liêm, Hà Nội<br />Cơ sở 2: Đường Mê Linh, Vĩnh Yên, Vĩnh Phúc<br />Cơ sở 3: 71 Đường Cộng hoà, Quận Tân Bình, Tp. Hồ Chí Minh<br />Cơ sở 4: Kiều Mai, Phú Diễn 1, Bắc Từ Liêm, Hà Nội</span></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (29, 1101, N'f0e4f83b-139b-4511-9f5b-7e375daf4340', 37, NULL, NULL, NULL, NULL, N'<p><strong><span>Phần thưởng cao quý</span></strong></p>
<p> </p>
<p><span>- Danh hiệu Đơn vị Anh hùng LLVT nhân dân thời kỳ đổi mới;</span></p>
<p><span>- 01 Huân chương Hồ Chí Minh;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhất;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhì;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Ba;</span></p>
<p><span>- 02 Huân chương Quân công hạng Nhất;</span></p>
<p><span>- 01 Huân chương Quân công hạng Nhì;</span></p>
<p><span>- 01 Huân chương Lao động hạng Ba;</span></p>
<p><span>- 03 Huân chương Chiến công: hạng Nhất, hạng Nhì, hạng Ba</span></p>
<p><span> </span></p>
<p><span><img src="http://mta.edu.vn/portals/0/Thuy/2017/NhanHCdoclapHangNhi.jpg" alt="" /><br /></span></p>
<p><em><span> </span></em></p>
<p><em><span>Học viện Kỹ thuật Quân sự đón nhận Huân chương Độc lập hạng Nhì</span></em></p>
<p><em><span> </span></em></p>
<p><strong><span>Địa chỉ</span></strong></p>
<p><span>Cơ sở 1: 236 Hoàng Quốc Việt, Bắc Từ Liêm, Hà Nội<br />Cơ sở 2: Đường Mê Linh, Vĩnh Yên, Vĩnh Phúc<br />Cơ sở 3: 71 Đường Cộng hoà, Quận Tân Bình, Tp. Hồ Chí Minh<br />Cơ sở 4: Kiều Mai, Phú Diễn 1, Bắc Từ Liêm, Hà Nội</span></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (30, 1099, N'0470ff7b-33d9-447d-88e9-491096aaab2b', 37, NULL, NULL, NULL, NULL, N'<p> <span><strong>Học viện Kỹ thuật Quân sự</strong>          </span></p>
<p> </p>
<p><span>Học viện Kỹ thuật Quân sự được thành lập theo Quyết định số 146/CP ngày 08/8/1966 của Hội đồng Chính phủ với tên gọi ban đầu là “Phân hiệu II Đại học Bách khoa”. Ngày 28/10/1966, tại Hội trường lớn Đại học Bách khoa, Bộ Đại học và Trung học chuyên nghiệp (nay là Bộ Giáo dục và Đào tạo) và Bộ Quốc phòng long trọng tổ chức Lễ thành lập Phân hiệu II Đại học Bách khoa, đồng thời khai giảng khoá đào tạo đầu tiên. Từ đó, ngày 28/10/1966 được chọn là Ngày truyền thống của Học viện Kỹ thuật Quân sự. Ngày 13/6/1968, Thủ tướng Chính phủ quyết định đổi tên “Phân hiệu II Đại học Bách khoa” thành trường Đại học Kỹ thuật Quân sự và ngày 15/12/1981, Bộ Quốc phòng quyết định thành lập Học viện Kỹ thuật Quân sự trên cơ sở trường Đại học Kỹ thuật Quân sự. Ngày 06/6/1991, Chủ tịch Hội đồng Bộ trưởng quyết định cho phép Học viện Kỹ thuật Quân sự mang thêm tên gọi Đại học kỹ thuật Lê Quý Đôn. Ngày 31/1/2008, Học viện Kỹ thuật Quân sự được Chính phủ quyết định bổ sung vào danh sách các trường đại học trọng điểm quốc gia.</span></p>
<p><img src="http://mta.edu.vn/portals/0/Thuy/2017/1_Ngaykhaigiang.jpg" alt="" /></p>
<p><span><em> </em></span></p>
<p><span><em>Học viện Kỹ thuật Quân sự khai giảng năm học mới</em></span></p>
<p><span><em> </em></span></p>
<p><strong><span>Sứ mạng</span></strong></p>
<p><span>Sứ mạng của Học viện Kỹ thuật Quân sự là đào tạo nguồn nhân lực chất lượng cao, nghiên cứu phát triển, sản xuất chế thử, chuyển giao công nghệ tiên tiến và hội nhập quốc tế, góp phần đắc lực vào sự nghiệp xây dựng và bảo vệ Tổ quốc, phát triển ngành khoa học kỹ thuật quân sự Việt Nam.</span></p>
<p><span> </span></p>
<p><strong><span>Mục tiêu</span></strong></p>
<p><span>Đào tạo đội ngũ cán bộ kỹ thuật, chỉ huy quản lý kỹ thuật chất lượng cao có trình độ đại học, sau đại học cho Quân đội và Đất nước; có bản lĩnh chính trị vững vàng, phẩm chất đạo đức tốt, tuyệt đối trung thành với Đảng Cộng sản Việt Nam, với Tổ quốc, với Nhân dân; có trình độ kiến thức nền vững chắc, kiến thức chuyên ngành chuyên sâu; có tác phong chính quy và có năng lực toàn diện trong chỉ huy, quản lý, tổ chức, điều hành và huấn luyện bộ đội; có năng lực ngoại ngữ, công nghệ thông tin đáp ứng yêu cầu hoạt động chuyên môn và hội nhập quốc tế; có sức khỏe tốt; có khả năng tự học tập, nghiên cứu nâng cao trình độ và thích nghi với mọi hoàn cảnh; có khả năng phát triển thành chuyên gia đầu ngành hoặc đảm nhiệm được các chức vụ cao hơn, đáp ứng yêu cầu xây dựng Quân đội, xây dựng và bảo vệ Tổ quốc.</span></p>
<p><span> </span></p>
<p> </p>
<p><strong><span>Phương châm giáo dục - đào tạo của Học viện<br /></span></strong></p>
<p><span>Cơ bản, hệ thống, toàn diện, chuyên sâu.</span></p>
<p><span> </span></p>
<p><span><strong>Nhiệm vụ chính</strong><br /></span></p>
<p><span>- Đào tạo cán bộ kỹ thuật và quản lý kỹ thuật có trình độ đại học, sau đại học</span></p>
<p><em><span>+ Đào tạo Kỹ sư quân sự: 42 chuyên ngành</span></em></p>
<p><em><span>+ Đào tạo Kỹ sư dân sự: 25 chuyên ngành</span></em></p>
<p><em><span>+ Đào tạo Thạc sĩ: 17 ngành</span></em></p>
<p><em><span>+ Đào tạo Tiến sĩ: 12 ngành</span></em></p>
<p><span> - Nghiên cứu khoa học, tư vấn khoa học kỹ thuật, triển khai dịch vụ khoa học công nghệ,… phục vụ quốc phòng - an ninh và kinh tế - xã hội.</span></p>
<p><span> </span></p>
<p><strong><span>Phần thưởng cao quý</span></strong></p>
<p> </p>
<p><span>- Danh hiệu Đơn vị Anh hùng LLVT nhân dân thời kỳ đổi mới;</span></p>
<p><span>- 01 Huân chương Hồ Chí Minh;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhất;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhì;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Ba;</span></p>
<p><span>- 02 Huân chương Quân công hạng Nhất;</span></p>
<p><span>- 01 Huân chương Quân công hạng Nhì;</span></p>
<p><span>- 01 Huân chương Lao động hạng Ba;</span></p>
<p><span>- 03 Huân chương Chiến công: hạng Nhất, hạng Nhì, hạng Ba</span></p>
<p><span> </span></p>
<p><span><img src="http://mta.edu.vn/portals/0/Thuy/2017/NhanHCdoclapHangNhi.jpg" alt="" /><br /></span></p>
<p><em><span> </span></em></p>
<p><em><span>Học viện Kỹ thuật Quân sự đón nhận Huân chương Độc lập hạng Nhì</span></em></p>
<p><em><span> </span></em></p>
<p><strong><span>Địa chỉ</span></strong></p>
<p><span>Cơ sở 1: 236 Hoàng Quốc Việt, Bắc Từ Liêm, Hà Nội<br />Cơ sở 2: Đường Mê Linh, Vĩnh Yên, Vĩnh Phúc<br />Cơ sở 3: 71 Đường Cộng hoà, Quận Tân Bình, Tp. Hồ Chí Minh<br />Cơ sở 4: Kiều Mai, Phú Diễn 1, Bắc Từ Liêm, Hà Nội</span></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (31, 1100, N'f65caf8c-8db5-4e8f-ba5a-5865187f7572', 37, NULL, NULL, NULL, NULL, N'<p><strong><span>Sứ mạng</span></strong></p>
<p><span>Sứ mạng của Học viện Kỹ thuật Quân sự là đào tạo nguồn nhân lực chất lượng cao, nghiên cứu phát triển, sản xuất chế thử, chuyển giao công nghệ tiên tiến và hội nhập quốc tế, góp phần đắc lực vào sự nghiệp xây dựng và bảo vệ Tổ quốc, phát triển ngành khoa học kỹ thuật quân sự Việt Nam.</span></p>
<p><span> </span></p>
<p><strong><span>Mục tiêu</span></strong></p>
<p><span>Đào tạo đội ngũ cán bộ kỹ thuật, chỉ huy quản lý kỹ thuật chất lượng cao có trình độ đại học, sau đại học cho Quân đội và Đất nước; có bản lĩnh chính trị vững vàng, phẩm chất đạo đức tốt, tuyệt đối trung thành với Đảng Cộng sản Việt Nam, với Tổ quốc, với Nhân dân; có trình độ kiến thức nền vững chắc, kiến thức chuyên ngành chuyên sâu; có tác phong chính quy và có năng lực toàn diện trong chỉ huy, quản lý, tổ chức, điều hành và huấn luyện bộ đội; có năng lực ngoại ngữ, công nghệ thông tin đáp ứng yêu cầu hoạt động chuyên môn và hội nhập quốc tế; có sức khỏe tốt; có khả năng tự học tập, nghiên cứu nâng cao trình độ và thích nghi với mọi hoàn cảnh; có khả năng phát triển thành chuyên gia đầu ngành hoặc đảm nhiệm được các chức vụ cao hơn, đáp ứng yêu cầu xây dựng Quân đội, xây dựng và bảo vệ Tổ quốc.</span></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (32, 1087, N'1e51396a-9705-474c-b329-8c5e4e8eb9f5', 37, NULL, NULL, NULL, NULL, N'<p><span>1. Viện Công nghệ Mô phỏng. Viện trưởng: Đại tá, Phó Giáo sư, Tiến sĩ Mai Quang Huy   </span></p>
<p><span>2.Viện Kỹ thuật công trình đặc biệt. Viện trưởng: Đại tá, Phó Giáo sư, Tiến sĩ Nguyễn Trí </span></p>
<p><span>3.Viện Tích hợp hệ thống. Viện Trưởng: Đại tá, Tiến sĩ Lê Đại Phong<br /></span></p>
<p> </p>
<ol>
<li><span>Trung tâm Công nghệ. Trưởng Trung tâm: Trung tá, Phó Giáo sư, Tiến sĩ Trần Đức Tăng<br /></span></li>
<li><span>Trung tâm huấn luyện 125 - Vĩnh Phúc. Trưởng Trung tâm: Đại tá, Thạc sĩ Trần Thanh Từ</span></li>
</ol>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (33, 1086, N'86a80fbc-f0af-4aa8-95d7-761f58043ca9', 37, NULL, NULL, NULL, NULL, N'<ol>
<li><span>    Phòng Chính trị. Chủ nhiệm chính trị: Đại tá, Tiến sĩ Nguyễn Minh Thắng</span></li>
<li><span>    Văn phòng. Chánh Văn phòng: Đại tá, Kỹ sư Phạm Mạnh Khái<br /></span></li>
<li><span>    Phòng Đào tạo. Trưởng phòng: Đại tá, Phó Giáo sư, Tiến sĩ Trần Xuân Nam<br /></span></li>
<li><span>    Phòng Sau đại học. Trưởng phòng: Đại tá, Phó Giáo sư, Tiến sĩ  Vũ Quốc Trụ</span></li>
<li><span>    Phòng Khoa học Quân sự. Trưởng phòng: Thượng tá, Phó Giáo sư, Tiến sĩ Nguyễn Thái Chung<br /></span></li>
<li><span>    Phòng Thông tin Khoa học Quân sự. Trưởng phòng: Đại tá, Phó Giáo sư, Tiến sĩ Nguyễn Hoàng Vũ<br /></span></li>
<li><span>    Phòng Kỹ thuật. Trưởng phòng: Đại tá, Thạc sỹ Nguyễn Văn Thủy</span></li>
<li><span>    Phòng Hậu cần. Chủ nhiệm: Đại tá, Tiến sỹ Hồ Quang Huy</span></li>
<li><span>    Ban Tài chính. Trưởng ban: Đại tá, Cử nhân Tạ Văn Hồng<br /></span></li>
<li>    Phòng Hợp tác Quốc tế và Quản lý lưu học sinh quân sự. Trưởng phòng: Trung tá, Phó Giáo sư, Tiến sĩ Nguyễn Trung Kiên</li>
<li><span>    Phòng Khảo thí và đảm bảo chất lượng giáo dục - đào tạo. Trưởng phòng: Đại tá, Tiến sĩ Đặng Huy Tú<br /></span></li>
<li><span>    Ban Quản lý dự án. Trưởng ban: Đại tá, Thạc sĩ Nguyễn Ngọc Khôi</span></li>
<li><span>    Ban Quản lý dự án Đầu tư hiện đại hóa các phòng thí nghiệm. Trưởng ban: Đại tá, Tiến sĩ Nguyễn Đăng Hải</span></li>
<li><span>    Trung tâm Công nghệ thông tin. Trưởng Trung tâm: Trung tá, Tiến sĩ Nguyễn Hoàng Sinh<br /></span></li>
<li><span>    Cơ sở II - Thành phố Hồ Chí Minh. Trưởng Đại diện phía Nam: Thượng tá Dương Ngọc Phượng</span></li>
</ol>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (34, 1102, N'df87cbfd-c6c4-47cd-aeca-020fea81183d', 37, NULL, NULL, NULL, NULL, N'<p><strong><span>Phần thưởng cao quý</span></strong></p>
<p> </p>
<p><span>- Danh hiệu Đơn vị Anh hùng LLVT nhân dân thời kỳ đổi mới;</span></p>
<p><span>- 01 Huân chương Hồ Chí Minh;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhất;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhì;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Ba;</span></p>
<p><span>- 02 Huân chương Quân công hạng Nhất;</span></p>
<p><span>- 01 Huân chương Quân công hạng Nhì;</span></p>
<p><span>- 01 Huân chương Lao động hạng Ba;</span></p>
<p><span>- 03 Huân chương Chiến công: hạng Nhất, hạng Nhì, hạng Ba</span></p>
<p><span> </span></p>
<p><span><img src="http://mta.edu.vn/portals/0/Thuy/2017/NhanHCdoclapHangNhi.jpg" alt="" /><br /></span></p>
<p><em><span> </span></em></p>
<p><em><span>Học viện Kỹ thuật Quân sự đón nhận Huân chương Độc lập hạng Nhì</span></em></p>
<p><em><span> </span></em></p>
<p><strong><span>Địa chỉ</span></strong></p>
<p><span>Cơ sở 1: 236 Hoàng Quốc Việt, Bắc Từ Liêm, Hà Nội<br />Cơ sở 2: Đường Mê Linh, Vĩnh Yên, Vĩnh Phúc<br />Cơ sở 3: 71 Đường Cộng hoà, Quận Tân Bình, Tp. Hồ Chí Minh<br />Cơ sở 4: Kiều Mai, Phú Diễn 1, Bắc Từ Liêm, Hà Nội</span></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (35, 1101, N'75f4ad5e-8ef9-43c4-b5db-1dde9e407c3f', 37, NULL, NULL, NULL, NULL, N'<p><strong><span>Phần thưởng cao quý</span></strong></p>
<p> </p>
<p><span>- Danh hiệu Đơn vị Anh hùng LLVT nhân dân thời kỳ đổi mới;</span></p>
<p><span>- 01 Huân chương Hồ Chí Minh;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhất;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhì;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Ba;</span></p>
<p><span>- 02 Huân chương Quân công hạng Nhất;</span></p>
<p><span>- 01 Huân chương Quân công hạng Nhì;</span></p>
<p><span>- 01 Huân chương Lao động hạng Ba;</span></p>
<p><span>- 03 Huân chương Chiến công: hạng Nhất, hạng Nhì, hạng Ba</span></p>
<p><span> </span></p>
<p><span><img src="http://mta.edu.vn/portals/0/Thuy/2017/NhanHCdoclapHangNhi.jpg" alt="" /><br /></span></p>
<p><em><span> </span></em></p>
<p><em><span>Học viện Kỹ thuật Quân sự đón nhận Huân chương Độc lập hạng Nhì</span></em></p>
<p><em><span> </span></em></p>
<p><strong><span>Địa chỉ</span></strong></p>
<p><span>Cơ sở 1: 236 Hoàng Quốc Việt, Bắc Từ Liêm, Hà Nội<br />Cơ sở 2: Đường Mê Linh, Vĩnh Yên, Vĩnh Phúc<br />Cơ sở 3: 71 Đường Cộng hoà, Quận Tân Bình, Tp. Hồ Chí Minh<br />Cơ sở 4: Kiều Mai, Phú Diễn 1, Bắc Từ Liêm, Hà Nội</span></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (36, 1099, N'd52bfacf-e780-45bb-aee2-5c693d643b8f', 37, NULL, NULL, NULL, NULL, N'<p> <span><strong>Học viện Kỹ thuật Quân sự</strong>          </span></p>
<p> </p>
<p><span>Học viện Kỹ thuật Quân sự được thành lập theo Quyết định số 146/CP ngày 08/8/1966 của Hội đồng Chính phủ với tên gọi ban đầu là “Phân hiệu II Đại học Bách khoa”. Ngày 28/10/1966, tại Hội trường lớn Đại học Bách khoa, Bộ Đại học và Trung học chuyên nghiệp (nay là Bộ Giáo dục và Đào tạo) và Bộ Quốc phòng long trọng tổ chức Lễ thành lập Phân hiệu II Đại học Bách khoa, đồng thời khai giảng khoá đào tạo đầu tiên. Từ đó, ngày 28/10/1966 được chọn là Ngày truyền thống của Học viện Kỹ thuật Quân sự. Ngày 13/6/1968, Thủ tướng Chính phủ quyết định đổi tên “Phân hiệu II Đại học Bách khoa” thành trường Đại học Kỹ thuật Quân sự và ngày 15/12/1981, Bộ Quốc phòng quyết định thành lập Học viện Kỹ thuật Quân sự trên cơ sở trường Đại học Kỹ thuật Quân sự. Ngày 06/6/1991, Chủ tịch Hội đồng Bộ trưởng quyết định cho phép Học viện Kỹ thuật Quân sự mang thêm tên gọi Đại học kỹ thuật Lê Quý Đôn. Ngày 31/1/2008, Học viện Kỹ thuật Quân sự được Chính phủ quyết định bổ sung vào danh sách các trường đại học trọng điểm quốc gia.</span></p>
<p><img src="http://mta.edu.vn/portals/0/Thuy/2017/1_Ngaykhaigiang.jpg" alt="" /></p>
<p><span><em> </em></span></p>
<p><span><em>Học viện Kỹ thuật Quân sự khai giảng năm học mới</em></span></p>
<p><span><em> </em></span></p>
<p><strong><span>Sứ mạng</span></strong></p>
<p><span>Sứ mạng của Học viện Kỹ thuật Quân sự là đào tạo nguồn nhân lực chất lượng cao, nghiên cứu phát triển, sản xuất chế thử, chuyển giao công nghệ tiên tiến và hội nhập quốc tế, góp phần đắc lực vào sự nghiệp xây dựng và bảo vệ Tổ quốc, phát triển ngành khoa học kỹ thuật quân sự Việt Nam.</span></p>
<p><span> </span></p>
<p><strong><span>Mục tiêu</span></strong></p>
<p><span>Đào tạo đội ngũ cán bộ kỹ thuật, chỉ huy quản lý kỹ thuật chất lượng cao có trình độ đại học, sau đại học cho Quân đội và Đất nước; có bản lĩnh chính trị vững vàng, phẩm chất đạo đức tốt, tuyệt đối trung thành với Đảng Cộng sản Việt Nam, với Tổ quốc, với Nhân dân; có trình độ kiến thức nền vững chắc, kiến thức chuyên ngành chuyên sâu; có tác phong chính quy và có năng lực toàn diện trong chỉ huy, quản lý, tổ chức, điều hành và huấn luyện bộ đội; có năng lực ngoại ngữ, công nghệ thông tin đáp ứng yêu cầu hoạt động chuyên môn và hội nhập quốc tế; có sức khỏe tốt; có khả năng tự học tập, nghiên cứu nâng cao trình độ và thích nghi với mọi hoàn cảnh; có khả năng phát triển thành chuyên gia đầu ngành hoặc đảm nhiệm được các chức vụ cao hơn, đáp ứng yêu cầu xây dựng Quân đội, xây dựng và bảo vệ Tổ quốc.</span></p>
<p><span> </span></p>
<p> </p>
<p><strong><span>Phương châm giáo dục - đào tạo của Học viện<br /></span></strong></p>
<p><span>Cơ bản, hệ thống, toàn diện, chuyên sâu.</span></p>
<p><span> </span></p>
<p><span><strong>Nhiệm vụ chính</strong><br /></span></p>
<p><span>- Đào tạo cán bộ kỹ thuật và quản lý kỹ thuật có trình độ đại học, sau đại học</span></p>
<p><em><span>+ Đào tạo Kỹ sư quân sự: 42 chuyên ngành</span></em></p>
<p><em><span>+ Đào tạo Kỹ sư dân sự: 25 chuyên ngành</span></em></p>
<p><em><span>+ Đào tạo Thạc sĩ: 17 ngành</span></em></p>
<p><em><span>+ Đào tạo Tiến sĩ: 12 ngành</span></em></p>
<p><span> - Nghiên cứu khoa học, tư vấn khoa học kỹ thuật, triển khai dịch vụ khoa học công nghệ,… phục vụ quốc phòng - an ninh và kinh tế - xã hội.</span></p>
<p><span> </span></p>
<p><strong><span>Phần thưởng cao quý</span></strong></p>
<p> </p>
<p><span>- Danh hiệu Đơn vị Anh hùng LLVT nhân dân thời kỳ đổi mới;</span></p>
<p><span>- 01 Huân chương Hồ Chí Minh;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhất;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Nhì;</span></p>
<p><span>- 01 Huân chương Độc lập hạng Ba;</span></p>
<p><span>- 02 Huân chương Quân công hạng Nhất;</span></p>
<p><span>- 01 Huân chương Quân công hạng Nhì;</span></p>
<p><span>- 01 Huân chương Lao động hạng Ba;</span></p>
<p><span>- 03 Huân chương Chiến công: hạng Nhất, hạng Nhì, hạng Ba</span></p>
<p><span> </span></p>
<p><span><img src="http://mta.edu.vn/portals/0/Thuy/2017/NhanHCdoclapHangNhi.jpg" alt="" /><br /></span></p>
<p><em><span> </span></em></p>
<p><em><span>Học viện Kỹ thuật Quân sự đón nhận Huân chương Độc lập hạng Nhì</span></em></p>
<p><em><span> </span></em></p>
<p><strong><span>Địa chỉ</span></strong></p>
<p><span>Cơ sở 1: 236 Hoàng Quốc Việt, Bắc Từ Liêm, Hà Nội<br />Cơ sở 2: Đường Mê Linh, Vĩnh Yên, Vĩnh Phúc<br />Cơ sở 3: 71 Đường Cộng hoà, Quận Tân Bình, Tp. Hồ Chí Minh<br />Cơ sở 4: Kiều Mai, Phú Diễn 1, Bắc Từ Liêm, Hà Nội</span></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (37, 1100, N'1ebe9658-1a78-42ce-a48d-b602af84af9b', 37, NULL, NULL, NULL, NULL, N'<p><strong><span>Sứ mạng</span></strong></p>
<p><span>Sứ mạng của Học viện Kỹ thuật Quân sự là đào tạo nguồn nhân lực chất lượng cao, nghiên cứu phát triển, sản xuất chế thử, chuyển giao công nghệ tiên tiến và hội nhập quốc tế, góp phần đắc lực vào sự nghiệp xây dựng và bảo vệ Tổ quốc, phát triển ngành khoa học kỹ thuật quân sự Việt Nam.</span></p>
<p><span> </span></p>
<p><strong><span>Mục tiêu</span></strong></p>
<p><span>Đào tạo đội ngũ cán bộ kỹ thuật, chỉ huy quản lý kỹ thuật chất lượng cao có trình độ đại học, sau đại học cho Quân đội và Đất nước; có bản lĩnh chính trị vững vàng, phẩm chất đạo đức tốt, tuyệt đối trung thành với Đảng Cộng sản Việt Nam, với Tổ quốc, với Nhân dân; có trình độ kiến thức nền vững chắc, kiến thức chuyên ngành chuyên sâu; có tác phong chính quy và có năng lực toàn diện trong chỉ huy, quản lý, tổ chức, điều hành và huấn luyện bộ đội; có năng lực ngoại ngữ, công nghệ thông tin đáp ứng yêu cầu hoạt động chuyên môn và hội nhập quốc tế; có sức khỏe tốt; có khả năng tự học tập, nghiên cứu nâng cao trình độ và thích nghi với mọi hoàn cảnh; có khả năng phát triển thành chuyên gia đầu ngành hoặc đảm nhiệm được các chức vụ cao hơn, đáp ứng yêu cầu xây dựng Quân đội, xây dựng và bảo vệ Tổ quốc.</span></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (38, 1087, N'7b99fa0e-cd08-460b-835f-8b62aaa85503', 37, NULL, NULL, NULL, NULL, N'<p><span>1. Viện Công nghệ Mô phỏng. Viện trưởng: Đại tá, Phó Giáo sư, Tiến sĩ Mai Quang Huy   </span></p>
<p><span>2.Viện Kỹ thuật công trình đặc biệt. Viện trưởng: Đại tá, Phó Giáo sư, Tiến sĩ Nguyễn Trí </span></p>
<p><span>3.Viện Tích hợp hệ thống. Viện Trưởng: Đại tá, Tiến sĩ Lê Đại Phong<br /></span></p>
<p> </p>
<ol>
<li><span>Trung tâm Công nghệ. Trưởng Trung tâm: Trung tá, Phó Giáo sư, Tiến sĩ Trần Đức Tăng<br /></span></li>
<li><span>Trung tâm huấn luyện 125 - Vĩnh Phúc. Trưởng Trung tâm: Đại tá, Thạc sĩ Trần Thanh Từ</span></li>
</ol>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (39, 1086, N'f19f46ef-002e-4efe-bbd7-23b32d4c8b5f', 37, NULL, NULL, NULL, NULL, N'<ol>
<li><span>    Phòng Chính trị. Chủ nhiệm chính trị: Đại tá, Tiến sĩ Nguyễn Minh Thắng</span></li>
<li><span>    Văn phòng. Chánh Văn phòng: Đại tá, Kỹ sư Phạm Mạnh Khái<br /></span></li>
<li><span>    Phòng Đào tạo. Trưởng phòng: Đại tá, Phó Giáo sư, Tiến sĩ Trần Xuân Nam<br /></span></li>
<li><span>    Phòng Sau đại học. Trưởng phòng: Đại tá, Phó Giáo sư, Tiến sĩ  Vũ Quốc Trụ</span></li>
<li><span>    Phòng Khoa học Quân sự. Trưởng phòng: Thượng tá, Phó Giáo sư, Tiến sĩ Nguyễn Thái Chung<br /></span></li>
<li><span>    Phòng Thông tin Khoa học Quân sự. Trưởng phòng: Đại tá, Phó Giáo sư, Tiến sĩ Nguyễn Hoàng Vũ<br /></span></li>
<li><span>    Phòng Kỹ thuật. Trưởng phòng: Đại tá, Thạc sỹ Nguyễn Văn Thủy</span></li>
<li><span>    Phòng Hậu cần. Chủ nhiệm: Đại tá, Tiến sỹ Hồ Quang Huy</span></li>
<li><span>    Ban Tài chính. Trưởng ban: Đại tá, Cử nhân Tạ Văn Hồng<br /></span></li>
<li>    Phòng Hợp tác Quốc tế và Quản lý lưu học sinh quân sự. Trưởng phòng: Trung tá, Phó Giáo sư, Tiến sĩ Nguyễn Trung Kiên</li>
<li><span>    Phòng Khảo thí và đảm bảo chất lượng giáo dục - đào tạo. Trưởng phòng: Đại tá, Tiến sĩ Đặng Huy Tú<br /></span></li>
<li><span>    Ban Quản lý dự án. Trưởng ban: Đại tá, Thạc sĩ Nguyễn Ngọc Khôi</span></li>
<li><span>    Ban Quản lý dự án Đầu tư hiện đại hóa các phòng thí nghiệm. Trưởng ban: Đại tá, Tiến sĩ Nguyễn Đăng Hải</span></li>
<li><span>    Trung tâm Công nghệ thông tin. Trưởng Trung tâm: Trung tá, Tiến sĩ Nguyễn Hoàng Sinh<br /></span></li>
<li><span>    Cơ sở II - Thành phố Hồ Chí Minh. Trưởng Đại diện phía Nam: Thượng tá Dương Ngọc Phượng</span></li>
</ol>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (45, 1107, N'836c1dd8-2284-4b68-9727-e49f660db768', 27, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (46, 1108, N'9ea9e42b-321f-4bd0-8c97-4b2ad0646878', 27, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (47, 1109, N'03bd1d74-9779-4e04-8ce1-1d4289bb0e64', 6, NULL, NULL, NULL, NULL, N'{"src": "/media/1001/17693096_1774836219498459_887219102_o.jpg", "crops": []}')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (48, 1109, N'03bd1d74-9779-4e04-8ce1-1d4289bb0e64', 7, NULL, NULL, NULL, N'1920', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (49, 1109, N'03bd1d74-9779-4e04-8ce1-1d4289bb0e64', 8, NULL, NULL, NULL, N'1080', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (50, 1109, N'03bd1d74-9779-4e04-8ce1-1d4289bb0e64', 9, NULL, NULL, NULL, N'170584', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (51, 1109, N'03bd1d74-9779-4e04-8ce1-1d4289bb0e64', 10, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (57, 1111, N'cca9ec74-ffc3-445d-8f9c-88eeefe6fdae', 45, NULL, NULL, NULL, N'Trung Tướng', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (58, 1111, N'cca9ec74-ffc3-445d-8f9c-88eeefe6fdae', 44, NULL, NULL, NULL, NULL, N'umb://media/168d2bc2b4a244c199ab9277602ad2e7')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (59, 1111, N'cca9ec74-ffc3-445d-8f9c-88eeefe6fdae', 43, NULL, NULL, NULL, N'Nguyễn Công Định', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (60, 1111, N'cca9ec74-ffc3-445d-8f9c-88eeefe6fdae', 47, NULL, NULL, NULL, N'GSTS', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (61, 1111, N'cca9ec74-ffc3-445d-8f9c-88eeefe6fdae', 46, NULL, NULL, NULL, N'Giám Đốc', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (62, 1112, N'25ee7aaf-c56d-40a3-bedc-d0897d47b62f', 45, NULL, NULL, NULL, N'ád', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (63, 1112, N'25ee7aaf-c56d-40a3-bedc-d0897d47b62f', 44, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (64, 1112, N'25ee7aaf-c56d-40a3-bedc-d0897d47b62f', 43, NULL, NULL, NULL, N'Lê Minh Thái', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (65, 1112, N'25ee7aaf-c56d-40a3-bedc-d0897d47b62f', 47, NULL, NULL, NULL, N'ád', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (66, 1112, N'25ee7aaf-c56d-40a3-bedc-d0897d47b62f', 46, NULL, NULL, NULL, N'ád', NULL)
SET IDENTITY_INSERT [dbo].[cmsPropertyData] OFF
SET IDENTITY_INSERT [dbo].[cmsPropertyType] ON 

INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (6, 1043, 1032, 3, N'umbracoFile', N'Upload image', 0, 0, NULL, NULL, N'00000006-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (7, -92, 1032, 3, N'umbracoWidth', N'Width', 0, 0, NULL, NULL, N'00000007-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (8, -92, 1032, 3, N'umbracoHeight', N'Height', 0, 0, NULL, NULL, N'00000008-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (9, -92, 1032, 3, N'umbracoBytes', N'Size', 0, 0, NULL, NULL, N'00000009-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (10, -92, 1032, 3, N'umbracoExtension', N'Type', 0, 0, NULL, NULL, N'0000000a-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (24, -90, 1033, 4, N'umbracoFile', N'Upload file', 0, 0, NULL, NULL, N'00000018-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (25, -92, 1033, 4, N'umbracoExtension', N'Type', 0, 0, NULL, NULL, N'00000019-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (26, -92, 1033, 4, N'umbracoBytes', N'Size', 0, 0, NULL, NULL, N'0000001a-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (27, -96, 1031, 5, N'contents', N'Contents:', 0, 0, NULL, NULL, N'0000001b-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (28, -89, 1044, 11, N'umbracoMemberComments', N'Comments', 0, 0, NULL, NULL, N'0000001c-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (29, -92, 1044, 11, N'umbracoMemberFailedPasswordAttempts', N'Failed Password Attempts', 1, 0, NULL, NULL, N'0000001d-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (30, -49, 1044, 11, N'umbracoMemberApproved', N'Is Approved', 2, 0, NULL, NULL, N'0000001e-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (31, -49, 1044, 11, N'umbracoMemberLockedOut', N'Is Locked Out', 3, 0, NULL, NULL, N'0000001f-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (32, -92, 1044, 11, N'umbracoMemberLastLockoutDate', N'Last Lockout Date', 4, 0, NULL, NULL, N'00000020-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (33, -92, 1044, 11, N'umbracoMemberLastLogin', N'Last Login Date', 5, 0, NULL, NULL, N'00000021-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (34, -92, 1044, 11, N'umbracoMemberLastPasswordChangeDate', N'Last Password Change Date', 6, 0, NULL, NULL, N'00000022-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (35, -92, 1044, NULL, N'umbracoMemberPasswordRetrievalAnswer', N'Password Answer', 0, 0, NULL, NULL, N'326b5568-4308-4ab9-abfd-3801ec35b116')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (36, -92, 1044, NULL, N'umbracoMemberPasswordRetrievalQuestion', N'Password Question', 1, 0, NULL, NULL, N'0c357044-e9b3-4428-a1c3-09d5ed5faa85')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (37, -87, 1081, 12, N'noiDung', N'Nội Dung', 0, 0, NULL, NULL, N'18c601c9-435f-4184-82ad-132b14b60069')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (43, -88, 1110, 14, N'hoTen', N'Họ Tên', 0, 0, NULL, NULL, N'5858b277-8b6e-40d6-bba3-8741bd75ce00')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (44, 1048, 1110, 14, N'anh', N'Ảnh', 1, 0, NULL, NULL, N'8f05866e-ffc6-4409-9d2a-49defbd54967')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (45, -88, 1110, 14, N'capBac', N'Cấp Bậc', 2, 0, NULL, NULL, N'94720b76-c0e9-4d61-95fc-0afc33baaca2')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (46, -88, 1110, 14, N'chucVu', N'Chức Vụ', 3, 0, NULL, NULL, N'202b4dd2-5c8c-4b33-93f1-ff8799605db1')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (47, -88, 1110, 14, N'danhHieu', N'Danh Hiệu', 4, 0, NULL, NULL, N'350ef4ba-b9f2-4514-8a2f-ee5ed27d883e')
SET IDENTITY_INSERT [dbo].[cmsPropertyType] OFF
SET IDENTITY_INSERT [dbo].[cmsPropertyTypeGroup] ON 

INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (3, 1032, N'Image', 1, N'79ed4d07-254a-42cf-8fa9-ebe1c116a596')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (4, 1033, N'File', 1, N'50899f9c-023a-4466-b623-aba9049885fe')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (5, 1031, N'Contents', 1, N'79995fa2-63ee-453c-a29b-2e66f324cdbe')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (11, 1044, N'Membership', 1, N'0756729d-d665-46e3-b84a-37aceaa614f8')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (12, 1081, N'Content', 0, N'802f35d0-31aa-4091-9343-11fb21f4ef99')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (14, 1110, N'Content', 0, N'aa30306f-8a5f-4253-a7b8-c94b0402f51d')
SET IDENTITY_INSERT [dbo].[cmsPropertyTypeGroup] OFF
SET IDENTITY_INSERT [dbo].[cmsTaskType] ON 

INSERT [dbo].[cmsTaskType] ([id], [alias]) VALUES (1, N'toTranslate')
SET IDENTITY_INSERT [dbo].[cmsTaskType] OFF
SET IDENTITY_INSERT [dbo].[cmsTemplate] ON 

INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (3, 1054, N'Master', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
	Layout = null;
}

@* the fun starts here *@

<!DOCTYPE HTML>
<html>
<head>
    <title>University a Educational Category Flat Bootstarp Responsive Website Template | Home :: w3layouts</title>
    <link href="/Assets/css/bootstrap.css" rel=''stylesheet'' type=''text/css'' />
    <!-- jQuery (necessary JavaScript plugins) -->
    <script src="/Assets/js/bootstrap.js"></script>
    <!-- Custom Theme files -->
    <link href="/Assets/css/style.css" rel=''stylesheet'' type=''text/css'' />
    <!-- Custom Theme files -->
    <!--//theme-style-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="University Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <script src="/Assets/js/jquery.min.js"></script>
    <script src="/Assets/js/bootstrap.js"></script>

</head>
<body>
    <div class="banner">
        <div class="header">
            <div class="logo">
                <a href="index.html"><img src="images/logo.jpg" alt="" /></a>
            </div>
            <div class="top-menu">
                <span class="menu"></span>
                <ul class="navig">
                    <li class="active"><a href="index.html">Home</a></li>
                    <li><a href="http://localhost:8080/giới-thiệu/">Giới Thiệu</a></li>
                    <li><a href="program.html">Programs</a></li>
                    <li><a href="blog.html">Blog</a></li>
                    <li><a href="gallery.html">Gallery</a></li>
                    <li><a href="contact.html">Contact</a></li>
                </ul>
            </div>
            <!-- script-for-menu -->
            <script>
				$("span.menu").click(function(){
					$("ul.navig").slideToggle("slow" , function(){
					});
				});
            </script>
            <!-- script-for-menu -->

            <div class="clearfix"></div>
        </div>

    </div>
    <!---->

    @RenderBody()

    <div class="footer">
        <div class="container">
            <div class="ftr-sec">
                <div class="col-md-4 ftr-grid">
                    <h3>Text Module</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ut odio ut quam convallis ultricies. Morbi rutrum lectus tortor. Cras vitae semper mi, et feugiat dolor.</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ut odio ut quam convallis ultricies. Morbi rutrum lectus tortor. Cras vitae semper mi, et feugiat dolor.</p>
                </div>
                <div class="col-md-4 ftr-grid2">
                    <h3>Pages</h3>
                    <ul>
                        <li><a href="index.html"><span></span>Home</a></li>
                        <li><a href="about.html"><span></span>About</a></li>
                        <li><a href="program.html"><span></span>Programs</a></li>
                        <li><a href="blog.html"><span></span>Blog</a></li>
                        <li><a href="gallery.html"><span></span>Gallery</a></li>
                        <li><a href="contact.html"><span></span>Contact</a></li>
                    </ul>
                </div>
                <div class="col-md-4 ftr-grid3">
                    <h3>Quick links</h3>
                    <ul>
                        <li><a href="about.html"><span></span>History</a></li>
                        <li><a href="about.html"><span></span>Departments</a></li>
                        <li><a href="gallery.html"><span></span>Services</a></li>
                        <li><a href="blog.html"><span></span>Guidancs</a></li>
                        <li><a href="about.html"><span></span>Team</a></li>
                        <li><a href="contact.html"><span></span>Contact</a></li>
                    </ul>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <!---->
    <div class="copywrite">
        <div class="container">
            <p>Copyright © 2015 University. All rights reserved | Design by <a href="http://w3layouts.com">W3layouts</a></p>
        </div>
    </div>
    <!---->
</body>

</html>')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (4, 1055, N'TrangChu', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
	Layout = "Master.cshtml";
}
Trang Chủ

')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (5, 1056, N'TinTuc', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
	Layout = "Master.cshtml";
}

Tin Tức
')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (8, 1068, N'DaoTao', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
	Layout = "Master.cshtml";
}

@* the fun starts here *@<div>Đào Tạo</div>
')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (9, 1069, N'TuyenSinh', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
	Layout = "Master.cshtml";
}

<div>Tuyển Sinh</div>

')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (10, 1070, N'NghienCuuKhoaHoc', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
	Layout = "Master.cshtml";
}

<div>Nghiên Cứu KH</div>

')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (11, 1071, N'HopTacQuocTe', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
	Layout = "Master.cshtml";
}

<div>Hợp Tác Quốc Tế</div>
')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (12, 1072, N'ThuVien', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
	Layout = "Master.cshtml";
}

<div>Thư Viện</div>

')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (13, 1073, N'LienHe', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
	Layout = "Master.cshtml";
}

<div>Liên Hệ</div>
')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (17, 1095, N'GioiThieuChung', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
    Layout = "Master.cshtml";
}
@Html.Partial("Giới Thiệu")
<div>Giới thiệu chung</div>
@{ 
    var currentNode = UmbracoContext.Current.PublishedContentRequest.PublishedContent;
    var child = currentNode.Children;
}

<div style="float:right;width:70%;">
    <ul class="nav nav-tabs">
        @{
            int index = 1;
            foreach (var item in child)
            {
                <li><a data-toggle="tab" href="@string.Format("#menu"+index++)">@item.Name</a></li>
            }
        }

    </ul>



    <div class="tab-content">
        @{
            index = 1;
            foreach (var item in child)
            {
                <div id="@string.Format("menu"+index++)" class="tab-pane fade in active">
                    <h3>@item.Name</h3>
                    @Html.Raw(item.GetPropertyValue<string>("noiDung"))
                </div>
            }
        }

    </div>
</div>
')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (18, 1103, N'BanGiamDoc', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
	Layout = "Master.cshtml";
}


@{ 
    var currentNode = UmbracoContext.Current.PublishedContentRequest.PublishedContent;
    var child = currentNode.Children;
}
<div>Ban Giám Đốc</div>

<ul>
    @foreach(var item in child)
    {
    
    }
</ul>')
SET IDENTITY_INSERT [dbo].[cmsTemplate] OFF
SET IDENTITY_INSERT [dbo].[umbracoAudit] ON 

INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1, 0, N'User "DoDat" <nevermore96bn@gmail.com>', N'::1', CAST(0x0000A8AF003CAA85 AS DateTime), 0, N'User "DoDat" <nevermore96bn@gmail.com>', N'umbraco/user/save', N'updating TourData, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (2, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A8AF008550F1 AS DateTime), 0, N'User "DoDat" <nevermore96bn@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (3, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A8AF0085510E AS DateTime), 0, N'User "DoDat" <nevermore96bn@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (4, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A8B000311445 AS DateTime), 0, N'User "DoDat" <nevermore96bn@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (5, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A8B00031147A AS DateTime), 0, N'User "DoDat" <nevermore96bn@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (6, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A8B00079B41F AS DateTime), 0, N'User "DoDat" <nevermore96bn@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (7, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A8B00079B430 AS DateTime), 0, N'User "DoDat" <nevermore96bn@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (8, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A8B0008C339E AS DateTime), 0, N'User "DoDat" <nevermore96bn@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (9, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A8B0008C3488 AS DateTime), 0, N'User "DoDat" <nevermore96bn@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (10, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A8B30001E734 AS DateTime), 0, N'User "DoDat" <nevermore96bn@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (11, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A8B30001E766 AS DateTime), 0, N'User "DoDat" <nevermore96bn@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (12, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A8B3000E679F AS DateTime), 0, N'User "DoDat" <nevermore96bn@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (13, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A8B3000E67A6 AS DateTime), 0, N'User "DoDat" <nevermore96bn@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (14, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A8B3001781BB AS DateTime), 0, N'User "DoDat" <nevermore96bn@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (15, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A8B3001781FE AS DateTime), 0, N'User "DoDat" <nevermore96bn@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (16, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A8B3001D38E4 AS DateTime), 0, N'User "DoDat" <nevermore96bn@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (17, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A8B3001D38FC AS DateTime), 0, N'User "DoDat" <nevermore96bn@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (18, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A8B300273FA2 AS DateTime), 0, N'User "DoDat" <nevermore96bn@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (19, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A8B300273FF4 AS DateTime), 0, N'User "DoDat" <nevermore96bn@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (20, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A8B600DBEB75 AS DateTime), 0, N'User "DoDat" <nevermore96bn@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (21, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A8B600DBECA4 AS DateTime), 0, N'User "DoDat" <nevermore96bn@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (22, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A8B600EC1157 AS DateTime), 0, N'User "DoDat" <nevermore96bn@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (23, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A8B600EC1403 AS DateTime), 0, N'User "DoDat" <nevermore96bn@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (24, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A8B600FB6F8E AS DateTime), 0, N'User "DoDat" <nevermore96bn@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (25, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A8B600FB7290 AS DateTime), 0, N'User "DoDat" <nevermore96bn@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (26, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A8B70079625D AS DateTime), 0, N'User "DoDat" <nevermore96bn@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (27, 0, N'User "SYSTEM" ', N'::1', CAST(0x0000A8B70079627D AS DateTime), 0, N'User "DoDat" <nevermore96bn@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
SET IDENTITY_INSERT [dbo].[umbracoAudit] OFF
SET IDENTITY_INSERT [dbo].[umbracoCacheInstruction] ON 

INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (79, CAST(0x0000A8B600DCBE68 AS DateTime), N'[{"RefreshType":5,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1089,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D2] 38B42A9DA4594DC1BEC9CAA702D75DE1', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (80, CAST(0x0000A8B600DCC222 AS DateTime), N'[{"RefreshType":5,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1088,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D2] 38B42A9DA4594DC1BEC9CAA702D75DE1', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (81, CAST(0x0000A8B600DCC535 AS DateTime), N'[{"RefreshType":5,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1090,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D2] 38B42A9DA4594DC1BEC9CAA702D75DE1', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (82, CAST(0x0000A8B600DCC843 AS DateTime), N'[{"RefreshType":5,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1067,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D2] 38B42A9DA4594DC1BEC9CAA702D75DE1', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (83, CAST(0x0000A8B600DCCE82 AS DateTime), N'[{"RefreshType":5,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1064,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D2] 38B42A9DA4594DC1BEC9CAA702D75DE1', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (84, CAST(0x0000A8B600DD356B AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1095]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D2] 38B42A9DA4594DC1BEC9CAA702D75DE1', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (85, CAST(0x0000A8B600DD6FC0 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"gioiThieuChung\",\"Id\":1091,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D2] 38B42A9DA4594DC1BEC9CAA702D75DE1', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (86, CAST(0x0000A8B600DD8B7A AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1094]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1094]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D2] 38B42A9DA4594DC1BEC9CAA702D75DE1', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (87, CAST(0x0000A8B600E0B9DF AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1095]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D12] 5C66957F01BC4A458FA5124D39B38F28', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (88, CAST(0x0000A8B600E2CE7A AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1095]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D12] 5C66957F01BC4A458FA5124D39B38F28', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (89, CAST(0x0000A8B600E2DBF1 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"gioiThieuChung\",\"Id\":1091,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D12] 5C66957F01BC4A458FA5124D39B38F28', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (90, CAST(0x0000A8B600E33D20 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1094]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D13] 6076B621640E46E5A530491E31A80024', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (91, CAST(0x0000A8B600E37A46 AS DateTime), N'[{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1094,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1094]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D13] 6076B621640E46E5A530491E31A80024', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (92, CAST(0x0000A8B600E397A4 AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1096]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D13] 6076B621640E46E5A530491E31A80024', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (93, CAST(0x0000A8B600E3A7CC AS DateTime), N'[{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1084,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1084]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D13] 6076B621640E46E5A530491E31A80024', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (94, CAST(0x0000A8B600E3DD53 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"gioiThieuChung\",\"Id\":1091,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D13] 6076B621640E46E5A530491E31A80024', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (95, CAST(0x0000A8B600E43B74 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"2eab00cb-c24c-4dd4-b9c5-23be80e1314e\",\"Id\":1097}]"}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D13] 6076B621640E46E5A530491E31A80024', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (96, CAST(0x0000A8B600E44ACD AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"gioiThieuChung\",\"Id\":1091,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D13] 6076B621640E46E5A530491E31A80024', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (97, CAST(0x0000A8B600E48026 AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"UniqueId\":\"8edce4f4-bbd2-4b70-a5d6-2a8a91aaaa8a\",\"Id\":1098}]"}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D13] 6076B621640E46E5A530491E31A80024', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (98, CAST(0x0000A8B600E49635 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"gioiThieuChung\",\"Id\":1091,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D13] 6076B621640E46E5A530491E31A80024', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (99, CAST(0x0000A8B600E5131D AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1099]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D13] 6076B621640E46E5A530491E31A80024', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (100, CAST(0x0000A8B600E51C3A AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1099]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1099]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D13] 6076B621640E46E5A530491E31A80024', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (101, CAST(0x0000A8B600E5576A AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1100]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D13] 6076B621640E46E5A530491E31A80024', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (102, CAST(0x0000A8B600E56229 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1100]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D13] 6076B621640E46E5A530491E31A80024', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (103, CAST(0x0000A8B600E5AB72 AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1101]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D13] 6076B621640E46E5A530491E31A80024', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (104, CAST(0x0000A8B600E651DB AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1102]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D13] 6076B621640E46E5A530491E31A80024', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (105, CAST(0x0000A8B600EEBDC2 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1101]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1101]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D13] 6076B621640E46E5A530491E31A80024', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (106, CAST(0x0000A8B600EEC2C8 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1102]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1102]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D13] 6076B621640E46E5A530491E31A80024', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (107, CAST(0x0000A8B600EECABC AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1102]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1102]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D13] 6076B621640E46E5A530491E31A80024', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (108, CAST(0x0000A8B600EECEFD AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1101]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1101]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D13] 6076B621640E46E5A530491E31A80024', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (109, CAST(0x0000A8B600EEED52 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1099]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1099]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D13] 6076B621640E46E5A530491E31A80024', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (110, CAST(0x0000A8B600EF2AB8 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"gioiThieu\",\"Id\":1074,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[{\"Alias\":\"coCauToChuc\",\"Id\":1092,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false},{\"Alias\":\"gioiThieuChung\",\"Id\":1091,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false},{\"Alias\":\"hinhAnhTieuBieu\",\"Id\":1093,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D13] 6076B621640E46E5A530491E31A80024', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (111, CAST(0x0000A8B600EF5292 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1075]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1075]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D13] 6076B621640E46E5A530491E31A80024', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (112, CAST(0x0000A8B600EFB4D6 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1075]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1075]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D13] 6076B621640E46E5A530491E31A80024', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (113, CAST(0x0000A8B600EFB8E6 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1075]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1075]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D13] 6076B621640E46E5A530491E31A80024', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (114, CAST(0x0000A8B600F131F7 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1101]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1101]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D14] FF5639FAF44549B48964729F0B3B1D35', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (115, CAST(0x0000A8B600F13F0A AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1101]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D14] FF5639FAF44549B48964729F0B3B1D35', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (116, CAST(0x0000A8B600F14BB4 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1101]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D14] FF5639FAF44549B48964729F0B3B1D35', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (117, CAST(0x0000A8B600F14FFD AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1102]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1102]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D14] FF5639FAF44549B48964729F0B3B1D35', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (118, CAST(0x0000A8B7007BCC0F AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1103]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D14] FF5639FAF44549B48964729F0B3B1D35', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (119, CAST(0x0000A8B7007C8AD0 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"banGiamDoc\",\"Id\":1104,\"PropertyTypeIds\":[38,39,40,41,42],\"Type\":\"IContentType\",\"AliasChanged\":true,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":true}]"}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D14] FF5639FAF44549B48964729F0B3B1D35', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (120, CAST(0x0000A8B7007CC9B6 AS DateTime), N'[{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1059,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1075,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1079,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1077,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1062,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1096,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1087,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1086,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1085,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1102,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1101,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1099,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1100,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1059,1075,1079,1077,1062,1096,1087,1086,1085,1102,1101,1099,1100]","JsonIdCount":13,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D14] FF5639FAF44549B48964729F0B3B1D35', 26)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (121, CAST(0x0000A8B7007CF00E AS DateTime), N'[{"RefreshType":5,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1085,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D14] FF5639FAF44549B48964729F0B3B1D35', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (122, CAST(0x0000A8B7007D8786 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1059]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D14] FF5639FAF44549B48964729F0B3B1D35', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (123, CAST(0x0000A8B70082D9CD AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1094]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D14] FF5639FAF44549B48964729F0B3B1D35', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (124, CAST(0x0000A8B70082F669 AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1094]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D14] FF5639FAF44549B48964729F0B3B1D35', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (125, CAST(0x0000A8B70083201D AS DateTime), N'[{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1094,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1094]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D14] FF5639FAF44549B48964729F0B3B1D35', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (126, CAST(0x0000A8B700836130 AS DateTime), N'[{"RefreshType":5,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1084,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D14] FF5639FAF44549B48964729F0B3B1D35', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (127, CAST(0x0000A8B700836902 AS DateTime), N'[{"RefreshType":5,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1061,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D14] FF5639FAF44549B48964729F0B3B1D35', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (128, CAST(0x0000A8B70085BA4B AS DateTime), N'[{"RefreshType":5,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1062,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D14] FF5639FAF44549B48964729F0B3B1D35', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (129, CAST(0x0000A8B70086054E AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"trangChu\",\"Id\":1058,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D14] FF5639FAF44549B48964729F0B3B1D35', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (130, CAST(0x0000A8B700860B8F AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1059]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1075]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1096]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1102]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1101]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1099]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1100]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1087]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1086]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1079]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D14] FF5639FAF44549B48964729F0B3B1D35', 11)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (131, CAST(0x0000A8B7008618F9 AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1059]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D14] FF5639FAF44549B48964729F0B3B1D35', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (132, CAST(0x0000A8B700861DB2 AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1075]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D14] FF5639FAF44549B48964729F0B3B1D35', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (133, CAST(0x0000A8B7008626B7 AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1096]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D14] FF5639FAF44549B48964729F0B3B1D35', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (134, CAST(0x0000A8B700862AF4 AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1102]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D14] FF5639FAF44549B48964729F0B3B1D35', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (135, CAST(0x0000A8B700862D3C AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1101]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D14] FF5639FAF44549B48964729F0B3B1D35', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (136, CAST(0x0000A8B700863060 AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1099]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D14] FF5639FAF44549B48964729F0B3B1D35', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (137, CAST(0x0000A8B700863316 AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1100]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D14] FF5639FAF44549B48964729F0B3B1D35', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (138, CAST(0x0000A8B700863653 AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1087]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D14] FF5639FAF44549B48964729F0B3B1D35', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (139, CAST(0x0000A8B700863BD0 AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1086]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D14] FF5639FAF44549B48964729F0B3B1D35', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (140, CAST(0x0000A8B700865D71 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1075]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1075]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D14] FF5639FAF44549B48964729F0B3B1D35', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (141, CAST(0x0000A8B70086958F AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"gioiThieuChung\",\"Id\":1091,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D14] FF5639FAF44549B48964729F0B3B1D35', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (142, CAST(0x0000A8B700869F6B AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1096]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1096]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D14] FF5639FAF44549B48964729F0B3B1D35', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (143, CAST(0x0000A8B70086B025 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1096]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1096]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D14] FF5639FAF44549B48964729F0B3B1D35', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (144, CAST(0x0000A8B7008756C2 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1096]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1096]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D14] FF5639FAF44549B48964729F0B3B1D35', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (145, CAST(0x0000A8B700877819 AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1095]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D14] FF5639FAF44549B48964729F0B3B1D35', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (146, CAST(0x0000A8B700877DD6 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"gioiThieuChung\",\"Id\":1091,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D14] FF5639FAF44549B48964729F0B3B1D35', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (147, CAST(0x0000A8B700894564 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1087]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1087]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D15] 5378227C8BD44ED7914B4760BF9EEBA7', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (148, CAST(0x0000A8B7008A1A16 AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1105]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D15] 5378227C8BD44ED7914B4760BF9EEBA7', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (149, CAST(0x0000A8B7008A2523 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1075]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1075]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D15] 5378227C8BD44ED7914B4760BF9EEBA7', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (150, CAST(0x0000A8B7008A7547 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"banGiamDoc\",\"Id\":1104,\"PropertyTypeIds\":[38,39,40,41,42],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D15] 5378227C8BD44ED7914B4760BF9EEBA7', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (151, CAST(0x0000A8B7008A9CD9 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"coCauToChuc\",\"Id\":1092,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[{\"Alias\":\"banGiamDoc\",\"Id\":1104,\"PropertyTypeIds\":[38,41,42,40,39],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D15] 5378227C8BD44ED7914B4760BF9EEBA7', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (152, CAST(0x0000A8B7008AB075 AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1106]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D15] 5378227C8BD44ED7914B4760BF9EEBA7', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (153, CAST(0x0000A8B7008AD009 AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Path\":\"-1,1107\",\"Id\":1107,\"Operation\":0}]"}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D15] 5378227C8BD44ED7914B4760BF9EEBA7', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (154, CAST(0x0000A8B7008AD812 AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Path\":\"-1,1107,1108\",\"Id\":1108,\"Operation\":0}]"}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D15] 5378227C8BD44ED7914B4760BF9EEBA7', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (155, CAST(0x0000A8B7008AEB11 AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Path\":\"-1,1107,1108,1109\",\"Id\":1109,\"Operation\":0}]"}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D15] 5378227C8BD44ED7914B4760BF9EEBA7', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (156, CAST(0x0000A8B7008AFC8D AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1106]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1106]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D15] 5378227C8BD44ED7914B4760BF9EEBA7', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (157, CAST(0x0000A8B7008B0234 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1106]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1106]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D15] 5378227C8BD44ED7914B4760BF9EEBA7', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (158, CAST(0x0000A8B7008BB1EA AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"banGiamDocItem\",\"Id\":1110,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":true,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":true}]"}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D15] 5378227C8BD44ED7914B4760BF9EEBA7', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (159, CAST(0x0000A8B7008BC942 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"banGiamDoc\",\"Id\":1104,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[{\"Alias\":\"banGiamDocItem\",\"Id\":1110,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D15] 5378227C8BD44ED7914B4760BF9EEBA7', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (160, CAST(0x0000A8B7008BD8A1 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"banGiamDoc\",\"Id\":1104,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[{\"Alias\":\"banGiamDocItem\",\"Id\":1110,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D15] 5378227C8BD44ED7914B4760BF9EEBA7', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (161, CAST(0x0000A8B7008C3877 AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"banGiamDocItem\",\"Id\":1110,\"PropertyTypeIds\":[43,44,45,46,47],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D15] 5378227C8BD44ED7914B4760BF9EEBA7', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (162, CAST(0x0000A8B7008C772A AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1111]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D15] 5378227C8BD44ED7914B4760BF9EEBA7', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (163, CAST(0x0000A8B7008C9FBD AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1112]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D15] 5378227C8BD44ED7914B4760BF9EEBA7', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (164, CAST(0x0000A8B7008CAAFE AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1106]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1106]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D15] 5378227C8BD44ED7914B4760BF9EEBA7', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (165, CAST(0x0000A8B7008D8A1A AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1113]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D16] B2C5F000BE764E9BA1F0C0A141AF8785', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (166, CAST(0x0000A8B7008DAADB AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1113]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1113]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D18] DC88B44122B7439AB49D91D292A006B5', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (167, CAST(0x0000A8B7008DC67F AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1113]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1113]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D19] E220D3C2BE554A9C828E2BE52D8721F8', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (168, CAST(0x0000A8B7008DE80A AS DateTime), N'[{"RefreshType":5,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1113,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1113]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D19] E220D3C2BE554A9C828E2BE52D8721F8', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (169, CAST(0x0000A8B7008EFF62 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1075]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D19] E220D3C2BE554A9C828E2BE52D8721F8', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (170, CAST(0x0000A8B7008F075A AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1096]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D19] E220D3C2BE554A9C828E2BE52D8721F8', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (171, CAST(0x0000A8B7008F23B5 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1096]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1096]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D19] E220D3C2BE554A9C828E2BE52D8721F8', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (172, CAST(0x0000A8B7008F4252 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1105]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D19] E220D3C2BE554A9C828E2BE52D8721F8', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (173, CAST(0x0000A8B7008F532E AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1106]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D19] E220D3C2BE554A9C828E2BE52D8721F8', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (174, CAST(0x0000A8B7008F5A17 AS DateTime), N'[{"RefreshType":3,"RefresherId":"55698352-dfc5-4dbe-96bd-a4a0f6f77145","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1106]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1106]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D19] E220D3C2BE554A9C828E2BE52D8721F8', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (175, CAST(0x0000A8B7008FB8DA AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1103]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT [P7060/D19] E220D3C2BE554A9C828E2BE52D8721F8', 1)
SET IDENTITY_INSERT [dbo].[umbracoCacheInstruction] OFF
SET IDENTITY_INSERT [dbo].[umbracoLanguage] ON 

INSERT [dbo].[umbracoLanguage] ([id], [languageISOCode], [languageCultureName]) VALUES (1, N'en-US', N'en-US')
SET IDENTITY_INSERT [dbo].[umbracoLanguage] OFF
SET IDENTITY_INSERT [dbo].[umbracoLock] ON 

INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-331, -1, N'Servers')
SET IDENTITY_INSERT [dbo].[umbracoLock] OFF
SET IDENTITY_INSERT [dbo].[umbracoLog] ON 

INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1, 0, 0, CAST(0x0000A8AF00B15F74 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (2, 0, 1051, CAST(0x0000A8AF00B269A3 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (3, 0, 1052, CAST(0x0000A8AF00B38D11 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (4, 0, 0, CAST(0x0000A8AF00B65F6E AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (5, 0, 1053, CAST(0x0000A8AF00B9EE3F AS DateTime), N'Delete', N'Delete Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (6, 0, 1051, CAST(0x0000A8AF00B9F30B AS DateTime), N'Delete', N'Delete Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (7, 0, 0, CAST(0x0000A8AF00BA394F AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (8, 0, 0, CAST(0x0000A8AF00BB06C8 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (9, 0, 0, CAST(0x0000A8AF00BB16CB AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (10, 0, -1, CAST(0x0000A8AF00BB3843 AS DateTime), N'Delete', N'Delete Content of Types 1052 performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (11, 0, 1052, CAST(0x0000A8AF00BB3862 AS DateTime), N'Delete', N'Delete ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (12, 0, 1057, CAST(0x0000A8AF00BB3D3A AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (13, 0, 1058, CAST(0x0000A8AF00BB59E2 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (14, 0, 0, CAST(0x0000A8AF00BDB4CD AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (15, 0, 1054, CAST(0x0000A8AF00BDF772 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (16, 0, 1060, CAST(0x0000A8AF00BE45D2 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (17, 0, 1058, CAST(0x0000A8AF00BEC9EA AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (18, 0, 0, CAST(0x0000A8AF00BF0F1C AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (19, 0, 1061, CAST(0x0000A8AF00BF2F12 AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (20, 0, 1061, CAST(0x0000A8AF00BF2F1B AS DateTime), N'Move', N'Move Content to Recycle Bin performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (21, 0, 1061, CAST(0x0000A8AF00BF2F62 AS DateTime), N'Delete', N'Trashed content with Id: ''1061'' related to original parent content with Id: ''-1''')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (22, 0, 0, CAST(0x0000A8AF00BF4413 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (23, 0, 1063, CAST(0x0000A8B000A4DA56 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (24, 0, 0, CAST(0x0000A8B000A4FA87 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (25, 0, 1060, CAST(0x0000A8B000A537E6 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (26, 0, 1060, CAST(0x0000A8B000A556B1 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (27, 0, 0, CAST(0x0000A8B000A62C58 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (28, 0, 0, CAST(0x0000A8B000A8DF98 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (29, 0, 1063, CAST(0x0000A8B000A8F4CD AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (30, 0, 0, CAST(0x0000A8B000EE81B3 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (31, 0, 0, CAST(0x0000A8B000EE92A5 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (32, 0, 0, CAST(0x0000A8B000EEB944 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (33, 0, 0, CAST(0x0000A8B000EED0D7 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (34, 0, 0, CAST(0x0000A8B000EF0046 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (35, 0, 0, CAST(0x0000A8B000EF1745 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (36, 0, 0, CAST(0x0000A8B000EF26DD AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (37, 0, 1074, CAST(0x0000A8B000EFC688 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (38, 0, 1058, CAST(0x0000A8B000EFD3B7 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (39, 0, 1058, CAST(0x0000A8B000EFE271 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (40, 0, 0, CAST(0x0000A8B000F07D2A AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (41, 0, 1054, CAST(0x0000A8B000F2560B AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (42, 0, 1076, CAST(0x0000A8B000F31B2D AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (43, 0, 1058, CAST(0x0000A8B000F33099 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (44, 0, 0, CAST(0x0000A8B000F342C5 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (45, 0, 1078, CAST(0x0000A8B000F3C892 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (46, 0, 1058, CAST(0x0000A8B000F3D2A1 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (47, 0, 0, CAST(0x0000A8B000F3E932 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (48, 0, 1075, CAST(0x0000A8B000F6DC4D AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (49, 0, 1074, CAST(0x0000A8B000F9F7B7 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (50, 0, 1080, CAST(0x0000A8B000FA111E AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (51, 0, 1081, CAST(0x0000A8B000FA1A96 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (52, 0, 1081, CAST(0x0000A8B000FA5BA0 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (53, 0, 1082, CAST(0x0000A8B000FA91A2 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (54, 0, 1074, CAST(0x0000A8B000FAB47A AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (55, 0, -1, CAST(0x0000A8B000FABEC1 AS DateTime), N'Delete', N'Delete Content of Types 1082 performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (56, 0, 1082, CAST(0x0000A8B000FABF18 AS DateTime), N'Delete', N'Delete ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (57, 0, 1083, CAST(0x0000A8B000FB01EC AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (58, 0, 1074, CAST(0x0000A8B000FB1EC7 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (59, 0, 0, CAST(0x0000A8B000FB5E34 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (60, 0, -1, CAST(0x0000A8B000FB7786 AS DateTime), N'Delete', N'Delete Content of Types 1083 performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (61, 0, 1083, CAST(0x0000A8B000FB77A3 AS DateTime), N'Delete', N'Delete ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (62, 0, 1084, CAST(0x0000A8B000FB84B0 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (63, 0, 0, CAST(0x0000A8B000FBD571 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (64, 0, 1084, CAST(0x0000A8B0010046A0 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (65, 0, 1084, CAST(0x0000A8B0010062DA AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (66, 0, 0, CAST(0x0000A8B30079F948 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (67, 0, 1086, CAST(0x0000A8B300823E22 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (68, 0, 0, CAST(0x0000A8B300825EB9 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (69, 0, 1087, CAST(0x0000A8B300826E39 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (70, 0, 1087, CAST(0x0000A8B30082CD82 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (71, 0, 0, CAST(0x0000A8B3008BD28D AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (72, 0, 1088, CAST(0x0000A8B3008BFB3B AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (73, 0, 0, CAST(0x0000A8B3008C32D1 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (74, 0, 0, CAST(0x0000A8B3008C496D AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (75, 0, 1091, CAST(0x0000A8B3008C7F10 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (76, 0, 1092, CAST(0x0000A8B3008C91BD AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (77, 0, 1093, CAST(0x0000A8B3008CA82D AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (78, 0, 1074, CAST(0x0000A8B30090DD76 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (79, 0, 1084, CAST(0x0000A8B300911B87 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (80, 0, 0, CAST(0x0000A8B300913965 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (81, 0, 1088, CAST(0x0000A8B300A4F8E4 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (82, 0, 1088, CAST(0x0000A8B300A50400 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (83, 0, 1067, CAST(0x0000A8B300A6E5D4 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (84, 0, -1, CAST(0x0000A8B300A70616 AS DateTime), N'Save', N'Save PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (85, 0, -1, CAST(0x0000A8B6014FF599 AS DateTime), N'Save', N'Save PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (86, 0, 1089, CAST(0x0000A8B60150198F AS DateTime), N'Delete', N'Delete Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (87, 0, 1088, CAST(0x0000A8B601501D62 AS DateTime), N'Delete', N'Delete Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (88, 0, 1090, CAST(0x0000A8B601502074 AS DateTime), N'Delete', N'Delete Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (89, 0, 1067, CAST(0x0000A8B601502382 AS DateTime), N'Delete', N'Delete Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (90, 0, 1064, CAST(0x0000A8B6015029C1 AS DateTime), N'Delete', N'Delete Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (91, 0, 0, CAST(0x0000A8B6015090AA AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (92, 0, 1091, CAST(0x0000A8B60150CAC6 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (93, 0, 1094, CAST(0x0000A8B60150E5FA AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (94, 0, 1095, CAST(0x0000A8B6015414FF AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (95, 0, 1095, CAST(0x0000A8B6015629B3 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (96, 0, 1091, CAST(0x0000A8B6015636FB AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (97, 0, 1094, CAST(0x0000A8B60156980C AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (98, 0, 1094, CAST(0x0000A8B60156D525 AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (99, 0, 1094, CAST(0x0000A8B60156D52D AS DateTime), N'Move', N'Move Content to Recycle Bin performed by user')
GO
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (100, 0, 1094, CAST(0x0000A8B60156D54F AS DateTime), N'Delete', N'Trashed content with Id: ''1094'' related to original parent content with Id: ''1075''')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (101, 0, 0, CAST(0x0000A8B60156F2C5 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (102, 0, 1084, CAST(0x0000A8B6015702F6 AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (103, 0, 1084, CAST(0x0000A8B6015702FA AS DateTime), N'Move', N'Move Content to Recycle Bin performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (104, 0, 1084, CAST(0x0000A8B601570303 AS DateTime), N'Delete', N'Trashed content with Id: ''1084'' related to original parent content with Id: ''1075''')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (105, 0, 1091, CAST(0x0000A8B601573857 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (106, 0, 0, CAST(0x0000A8B6015796A8 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (107, 0, 1091, CAST(0x0000A8B60157A601 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (108, 0, 0, CAST(0x0000A8B60157DB5D AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (109, 0, 1091, CAST(0x0000A8B60157F169 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (110, 0, 0, CAST(0x0000A8B601586E40 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (111, 0, 1099, CAST(0x0000A8B601587765 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (112, 0, 0, CAST(0x0000A8B60158B291 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (113, 0, 1100, CAST(0x0000A8B60158BD4C AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (114, 0, 0, CAST(0x0000A8B601590698 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (115, 0, 0, CAST(0x0000A8B60159ACFE AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (116, 0, 1101, CAST(0x0000A8B6016218E5 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (117, 0, 1102, CAST(0x0000A8B601621DF0 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (118, 0, 1102, CAST(0x0000A8B6016225E7 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (119, 0, 1101, CAST(0x0000A8B601622A28 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (120, 0, 1099, CAST(0x0000A8B601624878 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (121, 0, 1074, CAST(0x0000A8B6016285DD AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (122, 0, 1075, CAST(0x0000A8B60162AD89 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (123, 0, 1075, CAST(0x0000A8B601631000 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (124, 0, 1075, CAST(0x0000A8B6016313F5 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (125, 0, 1101, CAST(0x0000A8B601648CEB AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (126, 0, 1101, CAST(0x0000A8B601649A33 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (127, 0, 1101, CAST(0x0000A8B60164A6E5 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (128, 0, 1102, CAST(0x0000A8B60164AB24 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (129, 0, -1, CAST(0x0000A8B6016572DD AS DateTime), N'Save', N'Save PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (130, 0, -1, CAST(0x0000A8B6016943F6 AS DateTime), N'Save', N'Save PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (131, 0, -1, CAST(0x0000A8B601695E5B AS DateTime), N'Save', N'Save PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (132, 0, -1, CAST(0x0000A8B6016F06AC AS DateTime), N'Save', N'Save PartialView performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (133, 0, 0, CAST(0x0000A8B700EF26B0 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (134, 0, 1104, CAST(0x0000A8B700EFE4B5 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (135, 0, 1059, CAST(0x0000A8B700F02105 AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (136, 0, 1075, CAST(0x0000A8B700F0210E AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (137, 0, 1079, CAST(0x0000A8B700F02111 AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (138, 0, 1077, CAST(0x0000A8B700F02114 AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (139, 0, 1062, CAST(0x0000A8B700F02116 AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (140, 0, 1096, CAST(0x0000A8B700F02119 AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (141, 0, 1087, CAST(0x0000A8B700F02129 AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (142, 0, 1086, CAST(0x0000A8B700F0213E AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (143, 0, 1085, CAST(0x0000A8B700F0217A AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (144, 0, 1102, CAST(0x0000A8B700F02184 AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (145, 0, 1101, CAST(0x0000A8B700F0218D AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (146, 0, 1099, CAST(0x0000A8B700F02193 AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (147, 0, 1100, CAST(0x0000A8B700F02197 AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (148, 0, 1059, CAST(0x0000A8B700F021B6 AS DateTime), N'Move', N'Move Content to Recycle Bin performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (149, 0, 1059, CAST(0x0000A8B700F02335 AS DateTime), N'Delete', N'Trashed content with Id: ''1059'' related to original parent content with Id: ''-1''')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (150, 0, 1075, CAST(0x0000A8B700F02336 AS DateTime), N'Delete', N'Trashed content with Id: ''1075'' related to original parent content with Id: ''1059''')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (151, 0, 1079, CAST(0x0000A8B700F02338 AS DateTime), N'Delete', N'Trashed content with Id: ''1079'' related to original parent content with Id: ''1059''')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (152, 0, 1077, CAST(0x0000A8B700F02339 AS DateTime), N'Delete', N'Trashed content with Id: ''1077'' related to original parent content with Id: ''1059''')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (153, 0, 1062, CAST(0x0000A8B700F0233A AS DateTime), N'Delete', N'Trashed content with Id: ''1062'' related to original parent content with Id: ''1059''')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (154, 0, 1096, CAST(0x0000A8B700F0233C AS DateTime), N'Delete', N'Trashed content with Id: ''1096'' related to original parent content with Id: ''1075''')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (155, 0, 1087, CAST(0x0000A8B700F0233D AS DateTime), N'Delete', N'Trashed content with Id: ''1087'' related to original parent content with Id: ''1075''')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (156, 0, 1086, CAST(0x0000A8B700F02341 AS DateTime), N'Delete', N'Trashed content with Id: ''1086'' related to original parent content with Id: ''1075''')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (157, 0, 1085, CAST(0x0000A8B700F02343 AS DateTime), N'Delete', N'Trashed content with Id: ''1085'' related to original parent content with Id: ''1075''')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (158, 0, 1102, CAST(0x0000A8B700F02344 AS DateTime), N'Delete', N'Trashed content with Id: ''1102'' related to original parent content with Id: ''1096''')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (159, 0, 1101, CAST(0x0000A8B700F02346 AS DateTime), N'Delete', N'Trashed content with Id: ''1101'' related to original parent content with Id: ''1096''')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (160, 0, 1099, CAST(0x0000A8B700F02347 AS DateTime), N'Delete', N'Trashed content with Id: ''1099'' related to original parent content with Id: ''1096''')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (161, 0, 1100, CAST(0x0000A8B700F02348 AS DateTime), N'Delete', N'Trashed content with Id: ''1100'' related to original parent content with Id: ''1096''')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (162, 0, 1085, CAST(0x0000A8B700F04B3B AS DateTime), N'Delete', N'Delete Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (163, 0, 1059, CAST(0x0000A8B700F0E294 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (164, 0, 1084, CAST(0x0000A8B700F5FE56 AS DateTime), N'RollBack', N'Content rollback performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (165, 0, 1084, CAST(0x0000A8B700F5FE7C AS DateTime), N'RollBack', N'Version rolled back to revision ''5c6675eb-5531-4d14-95fa-5b82f0cb1d1a''')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (166, 0, 1094, CAST(0x0000A8B700F634DE AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (167, 0, 1094, CAST(0x0000A8B700F634E2 AS DateTime), N'Move', N'Move Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (168, 0, 1094, CAST(0x0000A8B700F65162 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (169, 0, 1094, CAST(0x0000A8B700F67B4A AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (170, 0, 1094, CAST(0x0000A8B700F67B4C AS DateTime), N'Move', N'Move Content to Recycle Bin performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (171, 0, 1094, CAST(0x0000A8B700F67B58 AS DateTime), N'Delete', N'Trashed content with Id: ''1094'' related to original parent content with Id: ''-1''')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (172, 0, 1084, CAST(0x0000A8B700F6BC62 AS DateTime), N'Delete', N'Delete Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (173, 0, 1061, CAST(0x0000A8B700F6C431 AS DateTime), N'Delete', N'Delete Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (174, 0, 1059, CAST(0x0000A8B700F6DD4F AS DateTime), N'Publish', N'Publish with Children performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (175, 0, 1062, CAST(0x0000A8B700F9157F AS DateTime), N'Delete', N'Delete Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (176, 0, 1058, CAST(0x0000A8B700F9604C AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (177, 0, 1059, CAST(0x0000A8B700F96625 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (178, 0, 1075, CAST(0x0000A8B700F9664E AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (179, 0, 1096, CAST(0x0000A8B700F96655 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (180, 0, 1102, CAST(0x0000A8B700F9665C AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (181, 0, 1101, CAST(0x0000A8B700F96663 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (182, 0, 1099, CAST(0x0000A8B700F9666C AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (183, 0, 1100, CAST(0x0000A8B700F9666F AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (184, 0, 1087, CAST(0x0000A8B700F96671 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (185, 0, 1086, CAST(0x0000A8B700F96673 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (186, 0, 1079, CAST(0x0000A8B700F96676 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (187, 0, 1077, CAST(0x0000A8B700F96678 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (188, 0, 1059, CAST(0x0000A8B700F96679 AS DateTime), N'Move', N'Move Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (189, 0, 1059, CAST(0x0000A8B700F9723C AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (190, 0, 1075, CAST(0x0000A8B700F978DE AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (191, 0, 1096, CAST(0x0000A8B700F981E0 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (192, 0, 1102, CAST(0x0000A8B700F98614 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (193, 0, 1101, CAST(0x0000A8B700F98869 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (194, 0, 1099, CAST(0x0000A8B700F98B8E AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (195, 0, 1100, CAST(0x0000A8B700F98E2B AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (196, 0, 1087, CAST(0x0000A8B700F99182 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (197, 0, 1086, CAST(0x0000A8B700F996FE AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (198, 0, 1075, CAST(0x0000A8B700F9B886 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (199, 0, 1091, CAST(0x0000A8B700F9F06E AS DateTime), N'Save', N'Save ContentType performed by user')
GO
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (200, 0, 1096, CAST(0x0000A8B700F9FA90 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (201, 0, 1096, CAST(0x0000A8B700FA0B4E AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (202, 0, 1096, CAST(0x0000A8B700FAB1B1 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (203, 0, 1095, CAST(0x0000A8B700FAD355 AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (204, 0, 1091, CAST(0x0000A8B700FAD8D8 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (205, 0, 1087, CAST(0x0000A8B700FCA014 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (206, 0, 0, CAST(0x0000A8B700FD7541 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (207, 0, 1075, CAST(0x0000A8B700FD804C AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (208, 0, 1104, CAST(0x0000A8B700FDD055 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (209, 0, 1092, CAST(0x0000A8B700FDF802 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (210, 0, 0, CAST(0x0000A8B700FE0B9A AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (211, 0, 0, CAST(0x0000A8B700FE2AF4 AS DateTime), N'New', N'Media ''Giơi Thiệu'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (212, 0, 0, CAST(0x0000A8B700FE2B10 AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (213, 0, 0, CAST(0x0000A8B700FE330C AS DateTime), N'New', N'Media ''Ban Giám Đốc'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (214, 0, 0, CAST(0x0000A8B700FE331D AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (215, 0, 0, CAST(0x0000A8B700FE45D2 AS DateTime), N'New', N'Media ''17693096_1774836219498459_887219102_o.jpg'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (216, 0, 0, CAST(0x0000A8B700FE463D AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (217, 0, 1106, CAST(0x0000A8B700FE57AF AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (218, 0, 1106, CAST(0x0000A8B700FE5D60 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (219, 0, 1110, CAST(0x0000A8B700FF0CF6 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (220, 0, 1104, CAST(0x0000A8B700FF246A AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (221, 0, 1104, CAST(0x0000A8B700FF33BD AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (222, 0, 1110, CAST(0x0000A8B700FF93A3 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (223, 0, 0, CAST(0x0000A8B700FFD250 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (224, 0, 0, CAST(0x0000A8B700FFFAE5 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (225, 0, 1106, CAST(0x0000A8B701000623 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (226, 0, 0, CAST(0x0000A8B70100E519 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (227, 0, 1113, CAST(0x0000A8B70101019F AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (228, 0, 1113, CAST(0x0000A8B701012173 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (229, 0, 1113, CAST(0x0000A8B7010142ED AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (230, 0, 1113, CAST(0x0000A8B7010142F1 AS DateTime), N'Move', N'Move Content to Recycle Bin performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (231, 0, 1113, CAST(0x0000A8B70101431D AS DateTime), N'Delete', N'Trashed content with Id: ''1113'' related to original parent content with Id: ''-1''')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (232, 0, 1075, CAST(0x0000A8B701025A82 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (233, 0, 1096, CAST(0x0000A8B70102627E AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (234, 0, 1096, CAST(0x0000A8B701027ED7 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (235, 0, 1105, CAST(0x0000A8B701029D75 AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (236, 0, 1106, CAST(0x0000A8B70102AE4D AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (237, 0, 1106, CAST(0x0000A8B70102B53B AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (238, 0, 1103, CAST(0x0000A8B701031412 AS DateTime), N'Save', N'Save Template performed by user')
SET IDENTITY_INSERT [dbo].[umbracoLog] OFF
SET IDENTITY_INSERT [dbo].[umbracoMigration] ON 

INSERT [dbo].[umbracoMigration] ([id], [name], [createDate], [version]) VALUES (1, N'Umbraco', CAST(0x0000A8AF00AF8FF1 AS DateTime), N'7.9.2')
SET IDENTITY_INSERT [dbo].[umbracoMigration] OFF
SET IDENTITY_INSERT [dbo].[umbracoNode] ON 

INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-97, 0, -1, 0, 1, N'-1,-97', 2, N'aa2c52a0-ce87-4e65-a47c-7df09358585d', N'List View - Members', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A8AF00AF8E25 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-96, 0, -1, 0, 1, N'-1,-96', 2, N'3a0156c4-3b8c-4803-bdc1-6871faa83fff', N'List View - Media', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A8AF00AF8E25 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-95, 0, -1, 0, 1, N'-1,-95', 2, N'c0808dd3-8133-4e4b-8ce8-e2bea84a96a4', N'List View - Content', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A8AF00AF8E25 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-92, 0, -1, 0, 1, N'-1,-92', 35, N'f0bc4bfb-b499-40d6-ba86-058885a5178c', N'Label', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A8AF00AF8E24 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-90, 0, -1, 0, 1, N'-1,-90', 34, N'84c6b441-31df-4ffe-b67e-67d5bc3ae65a', N'Upload', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A8AF00AF8E24 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-89, 0, -1, 0, 1, N'-1,-89', 33, N'c6bac0dd-4ab9-45b1-8e30-e4b619ee5da3', N'Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A8AF00AF8E24 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-88, 0, -1, 0, 1, N'-1,-88', 32, N'0cc0eba1-9960-42c9-bf9b-60e150b429ae', N'Textstring', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A8AF00AF8E24 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-87, 0, -1, 0, 1, N'-1,-87', 4, N'ca90c950-0aff-4e72-b976-a30b1ac57dad', N'Richtext editor', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A8AF00AF8E24 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-51, 0, -1, 0, 1, N'-1,-51', 2, N'2e6d3631-066e-44b8-aec4-96f09099b2b5', N'Numeric', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A8AF00AF8E24 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-49, 0, -1, 0, 1, N'-1,-49', 2, N'92897bc6-a5f3-4ffe-ae27-f2e7e33dda49', N'True/false', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A8AF00AF8E24 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-43, 0, -1, 0, 1, N'-1,-43', 2, N'fbaf13a8-4036-41f2-93a3-974f678c312a', N'Checkbox list', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A8AF00AF8E24 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-42, 0, -1, 0, 1, N'-1,-42', 2, N'0b6a45e7-44ba-430d-9da5-4e46060b9e03', N'Dropdown', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A8AF00AF8E24 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-41, 0, -1, 0, 1, N'-1,-41', 2, N'5046194e-4237-453c-a547-15db3a07c4e1', N'Date Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A8AF00AF8E24 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-40, 0, -1, 0, 1, N'-1,-40', 2, N'bb5f57c9-ce2b-4bb9-b697-4caca783a805', N'Radiobox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A8AF00AF8E24 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-39, 0, -1, 0, 1, N'-1,-39', 2, N'f38f0ac7-1d27-439c-9f3f-089cd8825a53', N'Dropdown multiple', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A8AF00AF8E25 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-37, 0, -1, 0, 1, N'-1,-37', 2, N'0225af17-b302-49cb-9176-b9f35cab9c17', N'Approved Color', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A8AF00AF8E25 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-36, 0, -1, 0, 1, N'-1,-36', 2, N'e4d66c0f-b935-4200-81f0-025f7256b89a', N'Date Picker with time', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A8AF00AF8E25 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-21, 0, -1, 0, 0, N'-1,-21', 0, N'bf7c7cbc-952f-4518-97a2-69e9c7b33842', N'Recycle Bin', N'cf3d8e34-1c1c-41e9-ae56-878b57b32113', CAST(0x0000A8AF00AF8E24 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-20, 0, -1, 0, 0, N'-1,-20', 0, N'0f582a79-1e41-4cf0-bfa0-76340651891a', N'Recycle Bin', N'01bb7ff2-24dc-4c0c-95a2-c24ef72bbac8', CAST(0x0000A8AF00AF8E24 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-1, 0, -1, 0, 0, N'-1', 0, N'916724a5-173d-4619-b97e-b9de133dd6f5', N'SYSTEM DATA: umbraco master root', N'ea7d8624-4cfe-4578-a871-24aa946bf34d', CAST(0x0000A8AF00AF8DFD AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1031, 0, -1, 0, 1, N'-1,1031', 2, N'f38bd2d7-65d0-48e6-95dc-87ce06ec2d3d', N'Folder', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(0x0000A8AF00AF8E25 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1032, 0, -1, 0, 1, N'-1,1032', 2, N'cc07b313-0843-4aa8-bbda-871c8da728c8', N'Image', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(0x0000A8AF00AF8E25 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1033, 0, -1, 0, 1, N'-1,1033', 2, N'4c52d8ab-54e6-40cd-999c-7a5f24903e4d', N'File', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(0x0000A8AF00AF8E25 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1041, 0, -1, 0, 1, N'-1,1041', 2, N'b6b73142-b9c1-4bf8-a16d-e1c23320b549', N'Tags', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A8AF00AF8E25 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1043, 0, -1, 0, 1, N'-1,1043', 2, N'1df9f033-e6d4-451f-b8d2-e0cbc50a836f', N'Image Cropper', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A8AF00AF8E25 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1044, 0, -1, 0, 1, N'-1,1044', 0, N'd59be02f-1df9-4228-aa1e-01917d806cda', N'Member', N'9b5416fb-e72f-45a9-a07b-5a9a2709ce43', CAST(0x0000A8AF00AF8E25 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1046, 0, -1, 0, 1, N'-1,1046', 2, N'fd1e0da5-5606-4862-b679-5d0cf3a52a59', N'Content Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A8AF00AF8E25 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1047, 0, -1, 0, 1, N'-1,1047', 2, N'1ea2e01f-ebd8-4ce1-8d71-6b1149e63548', N'Member Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A8AF00AF8E26 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1048, 0, -1, 0, 1, N'-1,1048', 2, N'135d60e0-64d9-49ed-ab08-893c9ba44ae5', N'Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A8AF00AF8E26 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1049, 0, -1, 0, 1, N'-1,1049', 2, N'9dbbcbbb-2327-434a-b355-af1b84e5010a', N'Multiple Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A8AF00AF8E26 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1050, 0, -1, 0, 1, N'-1,1050', 2, N'b4e3535a-1753-47e2-8568-602cf8cfee6f', N'Related Links', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A8AF00AF8E26 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1054, 0, -1, NULL, 1, N'-1,1054', 0, N'7ae61d5e-7109-419f-9fc2-71bcd0fd4d6a', N'Master', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(0x0000A8AF00BA394E AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1055, 0, 1054, NULL, 1, N'-1,1054,1055', 0, N'9f916e2b-310a-4dd1-b951-740b12c42128', N'Trang Chu', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(0x0000A8AF00BB06C7 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1056, 0, 1054, NULL, 1, N'-1,1054,1056', 0, N'7c928709-8a9a-4c2c-aca7-0993a5657f38', N'Tin Tuc', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(0x0000A8AF00BB16CA AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1057, 0, -1, 0, 1, N'-1,1057', 0, N'9f5c034a-f080-41c3-a645-2f6238ee5a05', N'Page', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A8AF00BB3D30 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1058, 0, 1057, 0, 2, N'-1,1057,1058', 15, N'bd27eb08-e63c-4aee-b3e2-f1bed9e53448', N'Trang Chủ', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A8AF00BB59DD AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1059, 0, -1, 0, 1, N'-1,1059', 1, N'98ddf55b-0e71-4441-bb44-36f2c5b3076b', N'Trang Chu', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A8AF00BDB4A3 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1060, 0, 1057, 0, 2, N'-1,1057,1060', 4, N'75b10c15-8e17-4501-a6c9-8fded9c7b99a', N'Tin Tuc', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A8AF00BE45BF AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1063, 0, 1057, 0, 2, N'-1,1057,1063', 5, N'980ee900-9cdc-4a29-8bd3-1fdaa8271998', N'Chi Tiet Tin Tuc', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A8B000A4D9CE AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1065, 0, -1, 0, 1, N'-1,1065', 24, N'25afe24f-448d-49f1-8a83-860a1b48b07a', N'Chi Tiet Tin Tuc - Name - Textbox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A8B000A62C0D AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1066, 0, -1, 0, 1, N'-1,1066', 25, N'516ebc06-5229-4076-b740-d953ac3f7226', N'Chi Tiet Tin Tuc - asd - Decimal', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A8B000A8DF84 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1068, 0, 1054, NULL, 1, N'-1,1054,1068', 0, N'bf010311-f6ba-44a4-9170-b074faf577f3', N'Đào Tạo', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(0x0000A8B000EE92A5 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1069, 0, 1054, NULL, 1, N'-1,1054,1069', 0, N'613afed4-ca7a-4ed5-8bad-e5776d6239fb', N'Tuyển Sinh', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(0x0000A8B000EEB943 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1070, 0, 1054, NULL, 1, N'-1,1054,1070', 0, N'f40bd8ec-246b-45a0-9159-21b5b2fca552', N'Nghiên Cứu Khoa Học', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(0x0000A8B000EED0D0 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1071, 0, 1054, NULL, 1, N'-1,1054,1071', 0, N'bc3562e8-9492-4070-b5fd-cef36e00c170', N'Hợp Tác Quốc Tế', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(0x0000A8B000EF0037 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1072, 0, 1054, NULL, 1, N'-1,1054,1072', 0, N'05dd5da8-e511-4cb9-8e36-11494c981a2e', N'Thư Viện', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(0x0000A8B000EF173F AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1073, 0, 1054, NULL, 1, N'-1,1054,1073', 0, N'1f7a89b9-b338-4f34-a3ef-fa837e8b1fbf', N'Liên Hệ', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(0x0000A8B000EF26DD AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1074, 0, 1057, 0, 2, N'-1,1057,1074', 14, N'86bde520-c884-4a02-80b3-68b4d1cb02fd', N'Giới Thiệu', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A8B000EFC67D AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1075, 0, 1059, 0, 2, N'-1,1059,1075', 7, N'cce7a73c-7747-4c3a-8c32-87ebe1819b79', N'Giới Thiệu', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A8B000F07C88 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1076, 0, 1057, 0, 2, N'-1,1057,1076', 4, N'3d69fcf0-0522-4410-b737-a227cf955a79', N'Đào Tạo', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A8B000F31B23 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1077, 0, 1059, 0, 2, N'-1,1059,1077', 9, N'ceb76210-5d12-4d2a-a60a-13489c9b0c9f', N'Đào Tạo', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A8B000F342BE AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1078, 0, 1057, 0, 2, N'-1,1057,1078', 5, N'2fa0750c-4133-4641-a46e-de99420709f0', N'Tuyển Sinh', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A8B000F3C87B AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1079, 0, 1059, 0, 2, N'-1,1059,1079', 8, N'890b02ee-7b7a-4d4e-bcc4-8ab69f5dad72', N'Tuyển Sinh', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A8B000F3E928 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1080, 0, -1, 0, 1, N'-1,1080', 1, N'3c0dfa43-763d-4f3d-bd61-3e760a39ffd9', N'Misc', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A8B000FA1118 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1081, 0, 1080, 0, 2, N'-1,1080,1081', 1, N'34f2eede-f5f3-42b4-a441-98f522195127', N'Tab', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A8B000FA1A92 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1086, 0, 1075, 0, 3, N'-1,1059,1075,1086', 10, N'09e5e729-7e1f-478e-8c6a-9bf9c2c96ce7', N'KHỐI PHÒNG CHỨC NĂNG', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A8B30079F8B1 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1087, 0, 1075, 0, 3, N'-1,1059,1075,1087', 9, N'9dd8b2b2-2b5e-48df-bf69-b41d934a582d', N'KHỐI VIỆN, TRUNG TÂM', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A8B300825E5C AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1091, 0, 1074, 0, 3, N'-1,1057,1074,1091', 9, N'6df551ae-9063-4264-8a0f-5124a9536881', N'Giới Thiệu Chung', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A8B3008C7EEA AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1092, 0, 1074, 0, 3, N'-1,1057,1074,1092', 10, N'a38eb528-5f1a-4398-bf90-1e9ffee516bc', N'Cơ Cấu Tổ Chức', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A8B3008C919F AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1093, 0, 1074, 0, 3, N'-1,1057,1074,1093', 2, N'7145834f-ac52-4af8-a6d4-7354ad22cc75', N'Hình Ảnh Tiêu Biểu', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A8B3008CA829 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1094, 1, -20, 0, 1, N'-1,-20,1094', 5, N'ad3db2a5-373f-4256-ba71-378186c4d7f5', N'Giới Thiệu Chung', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A8B30091394E AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1095, 0, 1054, NULL, 1, N'-1,1054,1095', 0, N'faea6f2b-d943-4c78-8158-39be071b8575', N'Giới Thiệu Chung', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(0x0000A8B60150907C AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1096, 0, 1075, 0, 3, N'-1,1059,1075,1096', 8, N'30865ed4-81b4-4180-a108-8b9d20d5ca7b', N'Giới Thiệu Chung', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A8B60156F2B7 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1097, 0, -1, 0, 1, N'-1,1097', 26, N'2eab00cb-c24c-4dd4-b9c5-23be80e1314e', N'Giới Thiệu Chung - s - Date', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A8B601579674 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1098, 0, -1, 0, 1, N'-1,1098', 27, N'8edce4f4-bbd2-4b70-a5d6-2a8a91aaaa8a', N'Giới Thiệu Chung - aa - DateTime', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A8B60157DB53 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1099, 0, 1096, 0, 4, N'-1,1059,1075,1096,1099', 10, N'9bde509b-c27f-4518-821b-19344113d079', N'Lịch sử phát triển và các thành tích tiêu biểu', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A8B601586E26 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1100, 0, 1096, 0, 4, N'-1,1059,1075,1096,1100', 11, N'eae1b129-c224-4ca6-903b-8b880a9482fc', N'Chức năng, nhiệm vụ', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A8B60158B286 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1101, 0, 1096, 0, 4, N'-1,1059,1075,1096,1101', 9, N'9aad5f2e-6efc-44ea-8893-b55f49e76d01', N'Sứ mạng, mục tiêu đào tạo', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A8B601590685 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1102, 0, 1096, 0, 4, N'-1,1059,1075,1096,1102', 8, N'4523b821-5799-4962-9a6b-81e0192bbe0d', N'Tiềm lực', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A8B60159ACF3 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1103, 0, 1054, NULL, 1, N'-1,1054,1103', 0, N'0d11eba3-a202-4d54-9d96-9fef0893cb98', N'Ban Giám Đốc', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(0x0000A8B700EF252C AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1104, 0, 1092, 0, 4, N'-1,1057,1074,1092,1104', 3, N'19093861-7d04-4f95-b245-7f84f2bb5c00', N'Ban Giám Đốc', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A8B700EFE44A AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1105, 0, 1075, 0, 3, N'-1,1059,1075,1105', 11, N'956b2b2e-b697-4473-8fd0-96a3b46afcc8', N'Cơ Cấu Tổ Chức', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A8B700FD7528 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1106, 0, 1105, 0, 4, N'-1,1059,1075,1105,1106', 0, N'c1208262-5df6-4d1c-9687-2fbbb4178744', N'Ban Giám Đốc', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A8B700FE0B87 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1107, 0, -1, 0, 1, N'-1,1107', 0, N'18472334-af62-4d38-80d8-695ed96a3d03', N'Giơi Thiệu', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(0x0000A8B700FE2AF9 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1108, 0, 1107, 0, 2, N'-1,1107,1108', 0, N'84b030a5-d048-498a-9755-77384cc38d51', N'Ban Giám Đốc', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(0x0000A8B700FE330D AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1109, 0, 1108, 0, 3, N'-1,1107,1108,1109', 0, N'168d2bc2-b4a2-44c1-99ab-9277602ad2e7', N'17693096_1774836219498459_887219102_o.jpg', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(0x0000A8B700FE462E AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1110, 0, 1104, 0, 5, N'-1,1057,1074,1092,1104,1110', 1, N'10db2f28-1011-479b-8f31-5b1dbd0ff203', N'Ban Giám Đốc Item', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A8B700FF0CE3 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1111, 0, 1106, 0, 5, N'-1,1059,1075,1105,1106,1111', 0, N'e1d7ab7d-1b81-40ea-bedb-f8c55bf3fe0a', N'Giám Đốc', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A8B700FFD243 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1112, 0, 1106, 0, 5, N'-1,1059,1075,1105,1106,1112', 1, N'bc7b7a90-875f-4fb7-9415-a976cfc68148', N'Phó Giám Đốc', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A8B700FFFADA AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1113, 1, -20, 0, 1, N'-1,-20,1113', 6, N'4eda2778-7364-46ad-b7e5-24a1e5649c32', N'Trang Chủ', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A8B70100E503 AS DateTime))
SET IDENTITY_INSERT [dbo].[umbracoNode] OFF
INSERT [dbo].[umbracoRedirectUrl] ([id], [contentKey], [createDateUtc], [url], [urlHash]) VALUES (N'c913a23f-4d3a-4920-9e20-f790a15ef12e', N'09e5e729-7e1f-478e-8c6a-9bf9c2c96ce7', CAST(0x0000A8B3000EE32B AS DateTime), N'/giới-thiệu/x', N'6b077607a5c02e269545b88ffa8a9e4cd5f2bb61')
SET IDENTITY_INSERT [dbo].[umbracoRelation] ON 

INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (17, -1, 1094, 2, CAST(0x0000A8B700F67B57 AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (18, -1, 1113, 2, CAST(0x0000A8B701014319 AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[umbracoRelation] OFF
SET IDENTITY_INSERT [dbo].[umbracoRelationType] ON 

INSERT [dbo].[umbracoRelationType] ([id], [typeUniqueId], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (1, N'4cbeb612-e689-3563-b755-bf3ede295433', 1, N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'Relate Document On Copy', N'relateDocumentOnCopy')
INSERT [dbo].[umbracoRelationType] ([id], [typeUniqueId], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (2, N'0cc3507c-66ab-3091-8913-3d998148e423', 0, N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'Relate Parent Document On Delete', N'relateParentDocumentOnDelete')
SET IDENTITY_INSERT [dbo].[umbracoRelationType] OFF
SET IDENTITY_INSERT [dbo].[umbracoServer] ON 

INSERT [dbo].[umbracoServer] ([id], [address], [computerName], [registeredDate], [lastNotifiedDate], [isActive], [isMaster]) VALUES (1, N'http://localhost:8080/umbraco', N'DESKTOP-FOJK4NV//LM/W3SVC/2/ROOT', CAST(0x0000A8AF00AFAF3C AS DateTime), CAST(0x0000A8B70108C149 AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[umbracoServer] OFF
SET IDENTITY_INSERT [dbo].[umbracoUser] ON 

INSERT [dbo].[umbracoUser] ([id], [userDisabled], [userNoConsole], [userName], [userLogin], [userPassword], [passwordConfig], [userEmail], [userLanguage], [securityStampToken], [failedLoginAttempts], [lastLockoutDate], [lastPasswordChangeDate], [lastLoginDate], [emailConfirmedDate], [invitedDate], [createDate], [updateDate], [avatar], [tourData]) VALUES (0, 0, 0, N'DoDat', N'nevermore96bn@gmail.com', N'CZt+l4GcHee3Fy+D+orawA==8Nk1/O/svcHeWUTD/P03RjNbxp/ZMYkTbnM9RlJm+ms=', N'{"hashAlgorithm":"HMACSHA256"}', N'nevermore96bn@gmail.com', N'en-US', N'a1dc4fd0-cad0-4375-8792-66e73aaf2c64', NULL, NULL, CAST(0x0000A8AF00AF918C AS DateTime), CAST(0x0000A8B700ECBD7E AS DateTime), NULL, NULL, CAST(0x0000A8AF00AF8FA3 AS DateTime), CAST(0x0000A8B700ECBD8B AS DateTime), NULL, N'[{"alias":"umbIntroIntroduction","completed":false,"disabled":true}]')
SET IDENTITY_INSERT [dbo].[umbracoUser] OFF
INSERT [dbo].[umbracoUser2UserGroup] ([userId], [userGroupId]) VALUES (0, 1)
INSERT [dbo].[umbracoUser2UserGroup] ([userId], [userGroupId]) VALUES (0, 5)
SET IDENTITY_INSERT [dbo].[umbracoUserGroup] ON 

INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (1, N'admin', N'Administrators', N'CADMOSKTPIURZ:5F7ï', CAST(0x0000A8AF00AF9024 AS DateTime), CAST(0x0000A8AF00AF9024 AS DateTime), N'icon-medal', -1, -1)
INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (2, N'writer', N'Writers', N'CAH:F', CAST(0x0000A8AF00AF9028 AS DateTime), CAST(0x0000A8AF00AF9028 AS DateTime), N'icon-edit', -1, -1)
INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (3, N'editor', N'Editors', N'CADMOSKTPUZ:5Fï', CAST(0x0000A8AF00AF9028 AS DateTime), CAST(0x0000A8AF00AF9028 AS DateTime), N'icon-tools', -1, -1)
INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (4, N'translator', N'Translators', N'AF', CAST(0x0000A8AF00AF9028 AS DateTime), CAST(0x0000A8AF00AF9028 AS DateTime), N'icon-globe', -1, -1)
INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (5, N'sensitiveData', N'Sensitive data', N'', CAST(0x0000A8AF00AF9029 AS DateTime), CAST(0x0000A8AF00AF9029 AS DateTime), N'icon-lock', -1, -1)
SET IDENTITY_INSERT [dbo].[umbracoUserGroup] OFF
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'content')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'developer')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'forms')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'media')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'member')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'settings')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'users')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (2, N'content')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (3, N'content')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (3, N'forms')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (3, N'media')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (4, N'translation')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'7585ed0a-67c6-4c5f-afed-2a28a362aa7a', 0, CAST(0x0000A8B0003114E7 AS DateTime), CAST(0x0000A8B000359971 AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'5d82fe98-3f32-49a5-bd3d-2f89a1bccedd', 0, CAST(0x0000A8B3000E67AC AS DateTime), CAST(0x0000A8B3001114DA AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'04d878e2-ccb0-47b2-8c42-591cde3d4e28', 0, CAST(0x0000A8AF003C39BF AS DateTime), CAST(0x0000A8AF004BA7B7 AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'926f48cf-d712-412a-be65-59d63cc5e86b', 0, CAST(0x0000A8B600EC141F AS DateTime), CAST(0x0000A8B600F698C2 AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'04b8d9d7-cbdb-4161-b018-6986e5d1e4fd', 0, CAST(0x0000A8B7007963CD AS DateTime), CAST(0x0000A8B7009375DF AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'9619ac04-b7f7-4cf2-9361-81807794814b', 0, CAST(0x0000A8B30027412B AS DateTime), CAST(0x0000A8B30033D25B AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'2c6e09b4-e22a-4ea1-9563-8929ea03298c', 0, CAST(0x0000A8B30001E904 AS DateTime), CAST(0x0000A8B300085436 AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'5148c7d7-4ddc-4884-ba40-8d30b3105b80', 0, CAST(0x0000A8B30017833C AS DateTime), CAST(0x0000A8B300193659 AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'eabec29f-c66f-42a1-9ae7-afe643fa6334', 0, CAST(0x0000A8B0008C3778 AS DateTime), CAST(0x0000A8B000949E00 AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'74e46fb7-fa90-4b84-975b-e4d87875120a', 0, CAST(0x0000A8AF00855252 AS DateTime), CAST(0x0000A8AF008A4ECA AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'138590b7-0ef7-4eb7-82c5-eaadbf7a1ecb', 0, CAST(0x0000A8B3001D3902 AS DateTime), CAST(0x0000A8B3001EA741 AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'52e8d5df-86ee-4224-91dd-edeb05e4cbf3', 0, CAST(0x0000A8B600DBF962 AS DateTime), CAST(0x0000A8B600E6518C AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'd3a2dfb5-35e3-4943-94a9-edeb7b510de9', 0, CAST(0x0000A8B00079B444 AS DateTime), CAST(0x0000A8B000887A14 AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'bbb4e08c-509b-421d-b5d4-f444a11db921', 0, CAST(0x0000A8B600FB73EA AS DateTime), CAST(0x0000A8B60108B4AB AS DateTime), NULL, N'::1')
/****** Object:  Index [IX_cmsContent]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsContent] ON [dbo].[cmsContent]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsContentType]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsContentType] ON [dbo].[cmsContentType]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_cmsContentType_icon]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsContentType_icon] ON [dbo].[cmsContentType]
(
	[icon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsContentVersion_ContentId]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsContentVersion_ContentId] ON [dbo].[cmsContentVersion]
(
	[ContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsContentVersion_VersionId]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsContentVersion_VersionId] ON [dbo].[cmsContentVersion]
(
	[VersionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsDataType_nodeId]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsDataType_nodeId] ON [dbo].[cmsDataType]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsDictionary_id]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsDictionary_id] ON [dbo].[cmsDictionary]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_cmsDictionary_key]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsDictionary_key] ON [dbo].[cmsDictionary]
(
	[key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsDocument]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsDocument] ON [dbo].[cmsDocument]
(
	[nodeId] ASC,
	[versionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsDocument_newest]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsDocument_newest] ON [dbo].[cmsDocument]
(
	[newest] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsDocument_published]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsDocument_published] ON [dbo].[cmsDocument]
(
	[published] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsMacro_UniqueId]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacro_UniqueId] ON [dbo].[cmsMacro]
(
	[uniqueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_cmsMacroPropertyAlias]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacroPropertyAlias] ON [dbo].[cmsMacro]
(
	[macroAlias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_cmsMacroProperty_Alias]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacroProperty_Alias] ON [dbo].[cmsMacroProperty]
(
	[macro] ASC,
	[macroPropertyAlias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsMacroProperty_UniquePropertyId]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacroProperty_UniquePropertyId] ON [dbo].[cmsMacroProperty]
(
	[uniquePropertyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_cmsMedia]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMedia] ON [dbo].[cmsMedia]
(
	[nodeId] ASC,
	[versionId] ASC,
	[mediaPath] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_cmsMember_LoginName]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsMember_LoginName] ON [dbo].[cmsMember]
(
	[LoginName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsPropertyData_1]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsPropertyData_1] ON [dbo].[cmsPropertyData]
(
	[contentNodeId] ASC,
	[versionId] ASC,
	[propertytypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsPropertyData_2]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsPropertyData_2] ON [dbo].[cmsPropertyData]
(
	[versionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsPropertyData_3]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsPropertyData_3] ON [dbo].[cmsPropertyData]
(
	[propertytypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_cmsPropertyTypeAlias]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsPropertyTypeAlias] ON [dbo].[cmsPropertyType]
(
	[Alias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsPropertyTypeUniqueID]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsPropertyTypeUniqueID] ON [dbo].[cmsPropertyType]
(
	[UniqueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsPropertyTypeGroupUniqueID]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsPropertyTypeGroupUniqueID] ON [dbo].[cmsPropertyTypeGroup]
(
	[uniqueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_cmsTags]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsTags] ON [dbo].[cmsTags]
(
	[tag] ASC,
	[group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_cmsTaskType_alias]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsTaskType_alias] ON [dbo].[cmsTaskType]
(
	[alias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsTemplate_nodeId]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsTemplate_nodeId] ON [dbo].[cmsTemplate]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoAccess_nodeId]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoAccess_nodeId] ON [dbo].[umbracoAccess]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_umbracoAccessRule]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoAccessRule] ON [dbo].[umbracoAccessRule]
(
	[ruleValue] ASC,
	[ruleType] ASC,
	[accessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_umbracoLanguage_languageISOCode]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoLanguage_languageISOCode] ON [dbo].[umbracoLanguage]
(
	[languageISOCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoLog]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoLog] ON [dbo].[umbracoLog]
(
	[NodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_umbracoMigration]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoMigration] ON [dbo].[umbracoMigration]
(
	[name] ASC,
	[version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNodeObjectType]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNodeObjectType] ON [dbo].[umbracoNode]
(
	[nodeObjectType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNodeParentId]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNodeParentId] ON [dbo].[umbracoNode]
(
	[parentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_umbracoNodePath]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNodePath] ON [dbo].[umbracoNode]
(
	[path] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNodeTrashed]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNodeTrashed] ON [dbo].[umbracoNode]
(
	[trashed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNodeUniqueID]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoNodeUniqueID] ON [dbo].[umbracoNode]
(
	[uniqueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_umbracoRedirectUrl]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRedirectUrl] ON [dbo].[umbracoRedirectUrl]
(
	[urlHash] ASC,
	[contentKey] ASC,
	[createDateUtc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoRelation_parentChildType]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRelation_parentChildType] ON [dbo].[umbracoRelation]
(
	[parentId] ASC,
	[childId] ASC,
	[relType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_umbracoRelationType_alias]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRelationType_alias] ON [dbo].[umbracoRelationType]
(
	[alias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_umbracoRelationType_name]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRelationType_name] ON [dbo].[umbracoRelationType]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoRelationType_UniqueId]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRelationType_UniqueId] ON [dbo].[umbracoRelationType]
(
	[typeUniqueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_computerName]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_computerName] ON [dbo].[umbracoServer]
(
	[computerName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoServer_isActive]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoServer_isActive] ON [dbo].[umbracoServer]
(
	[isActive] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_umbracoUser_userLogin]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoUser_userLogin] ON [dbo].[umbracoUser]
(
	[userLogin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_umbracoUserGroup_userGroupAlias]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoUserGroup_userGroupAlias] ON [dbo].[umbracoUserGroup]
(
	[userGroupAlias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_umbracoUserGroup_userGroupName]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoUserGroup_userGroupName] ON [dbo].[umbracoUserGroup]
(
	[userGroupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoUser2NodePermission_nodeId]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoUser2NodePermission_nodeId] ON [dbo].[umbracoUserGroup2NodePermission]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoUserStartNode_startNodeType]    Script Date: 3/4/18 04:04:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoUserStartNode_startNodeType] ON [dbo].[umbracoUserStartNode]
(
	[startNodeType] ASC,
	[startNode] ASC,
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_thumbnail]  DEFAULT ('folder.png') FOR [thumbnail]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_isContainer]  DEFAULT ('0') FOR [isContainer]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_allowAtRoot]  DEFAULT ('0') FOR [allowAtRoot]
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] ADD  CONSTRAINT [df_cmsContentTypeAllowedContentType_sortOrder]  DEFAULT ('0') FOR [SortOrder]
GO
ALTER TABLE [dbo].[cmsContentVersion] ADD  CONSTRAINT [DF_cmsContentVersion_VersionDate]  DEFAULT (getdate()) FOR [VersionDate]
GO
ALTER TABLE [dbo].[cmsDocument] ADD  CONSTRAINT [DF_cmsDocument_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[cmsDocument] ADD  CONSTRAINT [DF_cmsDocument_newest]  DEFAULT ('0') FOR [newest]
GO
ALTER TABLE [dbo].[cmsDocumentType] ADD  CONSTRAINT [DF_cmsDocumentType_IsDefault]  DEFAULT ('0') FOR [IsDefault]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroUseInEditor]  DEFAULT ('0') FOR [macroUseInEditor]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroRefreshRate]  DEFAULT ('0') FOR [macroRefreshRate]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroCacheByPage]  DEFAULT ('1') FOR [macroCacheByPage]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroCachePersonalized]  DEFAULT ('0') FOR [macroCachePersonalized]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroDontRender]  DEFAULT ('0') FOR [macroDontRender]
GO
ALTER TABLE [dbo].[cmsMacroProperty] ADD  CONSTRAINT [DF_cmsMacroProperty_macroPropertySortOrder]  DEFAULT ('0') FOR [macroPropertySortOrder]
GO
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_Email]  DEFAULT ('''') FOR [Email]
GO
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_LoginName]  DEFAULT ('''') FOR [LoginName]
GO
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_Password]  DEFAULT ('''') FOR [Password]
GO
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_memberCanEdit]  DEFAULT ('0') FOR [memberCanEdit]
GO
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_viewOnProfile]  DEFAULT ('0') FOR [viewOnProfile]
GO
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_isSensitive]  DEFAULT ('0') FOR [isSensitive]
GO
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_sortOrder]  DEFAULT ('0') FOR [sortOrder]
GO
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_mandatory]  DEFAULT ('0') FOR [mandatory]
GO
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_UniqueID]  DEFAULT (newid()) FOR [UniqueID]
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup] ADD  CONSTRAINT [DF_cmsPropertyTypeGroup_uniqueID]  DEFAULT (newid()) FOR [uniqueID]
GO
ALTER TABLE [dbo].[cmsTask] ADD  CONSTRAINT [DF_cmsTask_closed]  DEFAULT ('0') FOR [closed]
GO
ALTER TABLE [dbo].[cmsTask] ADD  CONSTRAINT [DF_cmsTask_DateTime]  DEFAULT (getdate()) FOR [DateTime]
GO
ALTER TABLE [dbo].[umbracoAccess] ADD  CONSTRAINT [DF_umbracoAccess_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoAccess] ADD  CONSTRAINT [DF_umbracoAccess_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[umbracoAccessRule] ADD  CONSTRAINT [DF_umbracoAccessRule_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoAccessRule] ADD  CONSTRAINT [DF_umbracoAccessRule_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[umbracoAudit] ADD  CONSTRAINT [DF_umbracoAudit_eventDateUtc]  DEFAULT (getdate()) FOR [eventDateUtc]
GO
ALTER TABLE [dbo].[umbracoCacheInstruction] ADD  CONSTRAINT [DF_umbracoCacheInstruction_instructionCount]  DEFAULT ('1') FOR [instructionCount]
GO
ALTER TABLE [dbo].[umbracoConsent] ADD  CONSTRAINT [DF_umbracoConsent_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoExternalLogin] ADD  CONSTRAINT [DF_umbracoExternalLogin_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoLog] ADD  CONSTRAINT [DF_umbracoLog_Datestamp]  DEFAULT (getdate()) FOR [Datestamp]
GO
ALTER TABLE [dbo].[umbracoMigration] ADD  CONSTRAINT [DF_umbracoMigration_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoNode] ADD  CONSTRAINT [DF_umbracoNode_trashed]  DEFAULT ('0') FOR [trashed]
GO
ALTER TABLE [dbo].[umbracoNode] ADD  CONSTRAINT [DF_umbracoNode_uniqueID]  DEFAULT (newid()) FOR [uniqueID]
GO
ALTER TABLE [dbo].[umbracoNode] ADD  CONSTRAINT [DF_umbracoNode_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoRelation] ADD  CONSTRAINT [DF_umbracoRelation_datetime]  DEFAULT (getdate()) FOR [datetime]
GO
ALTER TABLE [dbo].[umbracoServer] ADD  CONSTRAINT [DF_umbracoServer_registeredDate]  DEFAULT (getdate()) FOR [registeredDate]
GO
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_userDisabled]  DEFAULT ('0') FOR [userDisabled]
GO
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_userNoConsole]  DEFAULT ('0') FOR [userNoConsole]
GO
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[umbracoUserGroup] ADD  CONSTRAINT [DF_umbracoUserGroup_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoUserGroup] ADD  CONSTRAINT [DF_umbracoUserGroup_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[cmsContent]  WITH CHECK ADD  CONSTRAINT [FK_cmsContent_cmsContentType_nodeId] FOREIGN KEY([contentType])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContent] CHECK CONSTRAINT [FK_cmsContent_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsContent]  WITH CHECK ADD  CONSTRAINT [FK_cmsContent_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContent] CHECK CONSTRAINT [FK_cmsContent_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType] CHECK CONSTRAINT [FK_cmsContentType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsContentType2ContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child] FOREIGN KEY([childContentTypeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType2ContentType] CHECK CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child]
GO
ALTER TABLE [dbo].[cmsContentType2ContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent] FOREIGN KEY([parentContentTypeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType2ContentType] CHECK CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent]
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType] FOREIGN KEY([Id])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] CHECK CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType]
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType1] FOREIGN KEY([AllowedId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] CHECK CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType1]
GO
ALTER TABLE [dbo].[cmsContentVersion]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentVersion_cmsContent_nodeId] FOREIGN KEY([ContentId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentVersion] CHECK CONSTRAINT [FK_cmsContentVersion_cmsContent_nodeId]
GO
ALTER TABLE [dbo].[cmsContentXml]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentXml_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentXml] CHECK CONSTRAINT [FK_cmsContentXml_cmsContent_nodeId]
GO
ALTER TABLE [dbo].[cmsDataType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDataType_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsDataType] CHECK CONSTRAINT [FK_cmsDataType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsDataTypePreValues]  WITH CHECK ADD  CONSTRAINT [FK_cmsDataTypePreValues_cmsDataType_nodeId] FOREIGN KEY([datatypeNodeId])
REFERENCES [dbo].[cmsDataType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDataTypePreValues] CHECK CONSTRAINT [FK_cmsDataTypePreValues_cmsDataType_nodeId]
GO
ALTER TABLE [dbo].[cmsDictionary]  WITH CHECK ADD  CONSTRAINT [FK_cmsDictionary_cmsDictionary_id] FOREIGN KEY([parent])
REFERENCES [dbo].[cmsDictionary] ([id])
GO
ALTER TABLE [dbo].[cmsDictionary] CHECK CONSTRAINT [FK_cmsDictionary_cmsDictionary_id]
GO
ALTER TABLE [dbo].[cmsDocument]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocument_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocument] CHECK CONSTRAINT [FK_cmsDocument_cmsContent_nodeId]
GO
ALTER TABLE [dbo].[cmsDocument]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocument_cmsTemplate_nodeId] FOREIGN KEY([templateId])
REFERENCES [dbo].[cmsTemplate] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocument] CHECK CONSTRAINT [FK_cmsDocument_cmsTemplate_nodeId]
GO
ALTER TABLE [dbo].[cmsDocument]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocument_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsDocument] CHECK CONSTRAINT [FK_cmsDocument_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_cmsContentType_nodeId] FOREIGN KEY([contentTypeNodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_cmsTemplate_nodeId] FOREIGN KEY([templateNodeId])
REFERENCES [dbo].[cmsTemplate] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_cmsTemplate_nodeId]
GO
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_umbracoNode_id] FOREIGN KEY([contentTypeNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsLanguageText]  WITH CHECK ADD  CONSTRAINT [FK_cmsLanguageText_cmsDictionary_id] FOREIGN KEY([UniqueId])
REFERENCES [dbo].[cmsDictionary] ([id])
GO
ALTER TABLE [dbo].[cmsLanguageText] CHECK CONSTRAINT [FK_cmsLanguageText_cmsDictionary_id]
GO
ALTER TABLE [dbo].[cmsLanguageText]  WITH CHECK ADD  CONSTRAINT [FK_cmsLanguageText_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[cmsLanguageText] CHECK CONSTRAINT [FK_cmsLanguageText_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[cmsMacroProperty]  WITH CHECK ADD  CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id] FOREIGN KEY([macro])
REFERENCES [dbo].[cmsMacro] ([id])
GO
ALTER TABLE [dbo].[cmsMacroProperty] CHECK CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id]
GO
ALTER TABLE [dbo].[cmsMedia]  WITH CHECK ADD  CONSTRAINT [FK_cmsMedia_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMedia] CHECK CONSTRAINT [FK_cmsMedia_cmsContent_nodeId]
GO
ALTER TABLE [dbo].[cmsMedia]  WITH CHECK ADD  CONSTRAINT [FK_cmsMedia_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMedia] CHECK CONSTRAINT [FK_cmsMedia_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsMember]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMember] CHECK CONSTRAINT [FK_cmsMember_cmsContent_nodeId]
GO
ALTER TABLE [dbo].[cmsMember]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMember] CHECK CONSTRAINT [FK_cmsMember_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId] FOREIGN KEY([Member])
REFERENCES [dbo].[cmsMember] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup] CHECK CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId]
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id] FOREIGN KEY([MemberGroup])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup] CHECK CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsMemberType]  WITH CHECK ADD  CONSTRAINT [FK_cmsMemberType_cmsContentType_nodeId] FOREIGN KEY([NodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMemberType] CHECK CONSTRAINT [FK_cmsMemberType_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsMemberType]  WITH CHECK ADD  CONSTRAINT [FK_cmsMemberType_umbracoNode_id] FOREIGN KEY([NodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMemberType] CHECK CONSTRAINT [FK_cmsMemberType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsPreviewXml]  WITH CHECK ADD  CONSTRAINT [FK_cmsPreviewXml_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPreviewXml] CHECK CONSTRAINT [FK_cmsPreviewXml_cmsContent_nodeId]
GO
ALTER TABLE [dbo].[cmsPreviewXml]  WITH CHECK ADD  CONSTRAINT [FK_cmsPreviewXml_cmsContentVersion_VersionId] FOREIGN KEY([versionId])
REFERENCES [dbo].[cmsContentVersion] ([VersionId])
GO
ALTER TABLE [dbo].[cmsPreviewXml] CHECK CONSTRAINT [FK_cmsPreviewXml_cmsContentVersion_VersionId]
GO
ALTER TABLE [dbo].[cmsPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyData_cmsPropertyType_id] FOREIGN KEY([propertytypeid])
REFERENCES [dbo].[cmsPropertyType] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyData] CHECK CONSTRAINT [FK_cmsPropertyData_cmsPropertyType_id]
GO
ALTER TABLE [dbo].[cmsPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyData_umbracoNode_id] FOREIGN KEY([contentNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyData] CHECK CONSTRAINT [FK_cmsPropertyData_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsContentType_nodeId] FOREIGN KEY([contentTypeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsDataType_nodeId] FOREIGN KEY([dataTypeId])
REFERENCES [dbo].[cmsDataType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsDataType_nodeId]
GO
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id] FOREIGN KEY([propertyTypeGroupId])
REFERENCES [dbo].[cmsPropertyTypeGroup] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id]
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyTypeGroup_cmsContentType_nodeId] FOREIGN KEY([contenttypeNodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup] CHECK CONSTRAINT [FK_cmsPropertyTypeGroup_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsContent] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsContent]
GO
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType] FOREIGN KEY([propertyTypeId])
REFERENCES [dbo].[cmsPropertyType] ([id])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType]
GO
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsTags_id] FOREIGN KEY([tagId])
REFERENCES [dbo].[cmsTags] ([id])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsTags_id]
GO
ALTER TABLE [dbo].[cmsTags]  WITH CHECK ADD  CONSTRAINT [FK_cmsTags_cmsTags] FOREIGN KEY([ParentId])
REFERENCES [dbo].[cmsTags] ([id])
GO
ALTER TABLE [dbo].[cmsTags] CHECK CONSTRAINT [FK_cmsTags_cmsTags]
GO
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_cmsTaskType_id] FOREIGN KEY([taskTypeId])
REFERENCES [dbo].[cmsTaskType] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_cmsTaskType_id]
GO
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_umbracoUser] FOREIGN KEY([parentUserId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_umbracoUser]
GO
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_umbracoUser1] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_umbracoUser1]
GO
ALTER TABLE [dbo].[cmsTemplate]  WITH CHECK ADD  CONSTRAINT [FK_cmsTemplate_umbracoNode] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsTemplate] CHECK CONSTRAINT [FK_cmsTemplate_umbracoNode]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id1] FOREIGN KEY([loginNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id1]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id2] FOREIGN KEY([noAccessNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id2]
GO
ALTER TABLE [dbo].[umbracoAccessRule]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccessRule_umbracoAccess_id] FOREIGN KEY([accessId])
REFERENCES [dbo].[umbracoAccess] ([id])
GO
ALTER TABLE [dbo].[umbracoAccessRule] CHECK CONSTRAINT [FK_umbracoAccessRule_umbracoAccess_id]
GO
ALTER TABLE [dbo].[umbracoDomains]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDomains_umbracoNode_id] FOREIGN KEY([domainRootStructureID])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoDomains] CHECK CONSTRAINT [FK_umbracoDomains_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoNode_umbracoNode_id] FOREIGN KEY([parentID])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoNode] CHECK CONSTRAINT [FK_umbracoNode_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoRedirectUrl]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRedirectUrl_umbracoNode_uniqueID] FOREIGN KEY([contentKey])
REFERENCES [dbo].[umbracoNode] ([uniqueID])
GO
ALTER TABLE [dbo].[umbracoRedirectUrl] CHECK CONSTRAINT [FK_umbracoRedirectUrl_umbracoNode_uniqueID]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoNode] FOREIGN KEY([parentId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoNode]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoNode1] FOREIGN KEY([childId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoNode1]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id] FOREIGN KEY([relType])
REFERENCES [dbo].[umbracoRelationType] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id]
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify] CHECK CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify] CHECK CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoUser2UserGroup]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2UserGroup] CHECK CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoUser2UserGroup]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUserGroup_id] FOREIGN KEY([userGroupId])
REFERENCES [dbo].[umbracoUserGroup] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2UserGroup] CHECK CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUserGroup_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup]  WITH CHECK ADD  CONSTRAINT [FK_startContentId_umbracoNode_id] FOREIGN KEY([startContentId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup] CHECK CONSTRAINT [FK_startContentId_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup]  WITH CHECK ADD  CONSTRAINT [FK_startMediaId_umbracoNode_id] FOREIGN KEY([startMediaId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup] CHECK CONSTRAINT [FK_startMediaId_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup2App]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserGroup2App_umbracoUserGroup_id] FOREIGN KEY([userGroupId])
REFERENCES [dbo].[umbracoUserGroup] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup2App] CHECK CONSTRAINT [FK_umbracoUserGroup2App_umbracoUserGroup_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission] CHECK CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoUserGroup_id] FOREIGN KEY([userGroupId])
REFERENCES [dbo].[umbracoUserGroup] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission] CHECK CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoUserGroup_id]
GO
ALTER TABLE [dbo].[umbracoUserLogin]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserLogin_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUserLogin] CHECK CONSTRAINT [FK_umbracoUserLogin_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoUserStartNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserStartNode_umbracoNode_id] FOREIGN KEY([startNode])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUserStartNode] CHECK CONSTRAINT [FK_umbracoUserStartNode_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUserStartNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserStartNode_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUserStartNode] CHECK CONSTRAINT [FK_umbracoUserStartNode_umbracoUser_id]
GO
USE [master]
GO
ALTER DATABASE [WebSiteHV] SET  READ_WRITE 
GO
