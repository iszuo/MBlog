USE [master]
GO
/****** Object:  Database [MicroBlog]    Script Date: 2022/05/11 13:56:26 ******/
CREATE DATABASE [MicroBlog]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MicroBlog', FILENAME = N'E:\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MicroBlog.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MicroBlog_log', FILENAME = N'E:\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MicroBlog_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MicroBlog] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MicroBlog].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MicroBlog] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MicroBlog] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MicroBlog] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MicroBlog] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MicroBlog] SET ARITHABORT OFF 
GO
ALTER DATABASE [MicroBlog] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MicroBlog] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MicroBlog] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MicroBlog] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MicroBlog] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MicroBlog] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MicroBlog] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MicroBlog] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MicroBlog] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MicroBlog] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MicroBlog] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MicroBlog] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MicroBlog] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MicroBlog] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MicroBlog] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MicroBlog] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MicroBlog] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MicroBlog] SET RECOVERY FULL 
GO
ALTER DATABASE [MicroBlog] SET  MULTI_USER 
GO
ALTER DATABASE [MicroBlog] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MicroBlog] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MicroBlog] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MicroBlog] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MicroBlog] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MicroBlog] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MicroBlog', N'ON'
GO
ALTER DATABASE [MicroBlog] SET QUERY_STORE = OFF
GO
USE [MicroBlog]
GO
/****** Object:  Table [dbo].[Education]    Script Date: 2022/05/11 13:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Education](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[SchoolName] [varchar](255) NULL,
	[SchoolType] [varchar](255) NULL,
	[Accessible] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Follow_Fans]    Script Date: 2022/05/11 13:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Follow_Fans](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Follow] [int] NOT NULL,
	[Fans] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Make]    Script Date: 2022/05/11 13:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Make](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[MsgId] [int] NOT NULL,
	[MakeText] [varchar](255) NOT NULL,
	[MakeClick] [int] NULL,
	[MakeTime] [datetime] NULL,
	[Pic] [nvarchar](50) NULL,
 CONSTRAINT [PK__Make__3214EC075231F577] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Msg]    Script Date: 2022/05/11 13:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Msg](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Userid] [int] NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[sendtime] [datetime] NULL,
	[Click_num] [int] NULL,
	[Address] [nvarchar](50) NULL,
	[Topic] [nvarchar](50) NULL,
	[Pic] [nvarchar](50) NULL,
	[Video] [nvarchar](50) NULL,
 CONSTRAINT [PK_Msg] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2022/05/11 13:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](30) NOT NULL,
	[Phone] [int] NULL,
	[Password] [char](20) NOT NULL,
	[Image] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Explain] [nvarchar](50) NULL,
	[Nick] [nvarchar](20) NULL,
	[QQ] [int] NULL,
	[Sex] [nvarchar](10) NULL,
	[Times] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Education] ON 

INSERT [dbo].[Education] ([id], [UserId], [SchoolName], [SchoolType], [Accessible]) VALUES (1, 1, N'唐山职业技术学院', N'大学（专科）', 1)
INSERT [dbo].[Education] ([id], [UserId], [SchoolName], [SchoolType], [Accessible]) VALUES (2, 2004, N'河北师范大学', N'大学（本科）', 2)
SET IDENTITY_INSERT [dbo].[Education] OFF
GO
SET IDENTITY_INSERT [dbo].[Follow_Fans] ON 

INSERT [dbo].[Follow_Fans] ([Id], [Follow], [Fans]) VALUES (2, 1, 2004)
INSERT [dbo].[Follow_Fans] ([Id], [Follow], [Fans]) VALUES (3, 1, 2004)
INSERT [dbo].[Follow_Fans] ([Id], [Follow], [Fans]) VALUES (4, 1, 2004)
SET IDENTITY_INSERT [dbo].[Follow_Fans] OFF
GO
SET IDENTITY_INSERT [dbo].[Make] ON 

INSERT [dbo].[Make] ([Id], [UserId], [MsgId], [MakeText], [MakeClick], [MakeTime], [Pic]) VALUES (1, 1, 1, N'测试', 100, CAST(N'2022-05-08T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[Make] ([Id], [UserId], [MsgId], [MakeText], [MakeClick], [MakeTime], [Pic]) VALUES (2, 2004, 1, N'附件是打开房间啊还是空间的合法卡就是', 200, CAST(N'2022-05-08T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[Make] ([Id], [UserId], [MsgId], [MakeText], [MakeClick], [MakeTime], [Pic]) VALUES (3, 1, 1, N'fasdfasdf', 0, CAST(N'2022-05-10T15:24:11.350' AS DateTime), N'1')
SET IDENTITY_INSERT [dbo].[Make] OFF
GO
SET IDENTITY_INSERT [dbo].[Msg] ON 

INSERT [dbo].[Msg] ([Id], [Userid], [Text], [sendtime], [Click_num], [Address], [Topic], [Pic], [Video]) VALUES (1, 1, N'你好，世界', CAST(N'2022-05-10T18:30:39.490' AS DateTime), 105, N'河北', N'测试', N'1', N'1')
INSERT [dbo].[Msg] ([Id], [Userid], [Text], [sendtime], [Click_num], [Address], [Topic], [Pic], [Video]) VALUES (2, 2004, N'123123123', CAST(N'2022-05-10T18:30:39.490' AS DateTime), 20, N'北京', N'aaaa', N'1', N'1')
INSERT [dbo].[Msg] ([Id], [Userid], [Text], [sendtime], [Click_num], [Address], [Topic], [Pic], [Video]) VALUES (3, 1, N'你好，世界', CAST(N'2022-05-10T18:30:39.490' AS DateTime), 37, N'天津', N'测试', N'1', N'1')
INSERT [dbo].[Msg] ([Id], [Userid], [Text], [sendtime], [Click_num], [Address], [Topic], [Pic], [Video]) VALUES (4, 2004, N'123123123', CAST(N'2022-05-10T18:30:39.490' AS DateTime), 28, N'上海', N'aaaa', N'1', N'1')
INSERT [dbo].[Msg] ([Id], [Userid], [Text], [sendtime], [Click_num], [Address], [Topic], [Pic], [Video]) VALUES (5, 1, N'你好世界', CAST(N'2022-05-10T18:30:39.490' AS DateTime), 46, N'广州', N'测试', N'1', N'1')
INSERT [dbo].[Msg] ([Id], [Userid], [Text], [sendtime], [Click_num], [Address], [Topic], [Pic], [Video]) VALUES (6, 2004, N'123123123', CAST(N'2022-05-10T18:30:39.490' AS DateTime), 88, N'深圳', N'aaaa', N'1', N'1')
SET IDENTITY_INSERT [dbo].[Msg] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Email], [Phone], [Password], [Image], [Address], [Explain], [Nick], [QQ], [Sex], [Times]) VALUES (1, N'123', 123, N'123                 ', NULL, N'北京', N'TA还没有留下任何介绍', N'微博新人1', 1073520602, N'男', NULL)
INSERT [dbo].[User] ([Id], [Email], [Phone], [Password], [Image], [Address], [Explain], [Nick], [QQ], [Sex], [Times]) VALUES (2004, N'321', 321, N'321                 ', NULL, N'天津', N'TA还没有留下任何介绍', N'微博新人2', 123456, N'女', CAST(N'2022-05-10T15:21:03.587' AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Make] ADD  CONSTRAINT [DF_Make_MakeClick]  DEFAULT ((0)) FOR [MakeClick]
GO
ALTER TABLE [dbo].[Make] ADD  CONSTRAINT [DF__Make__MakeTime__31EC6D26]  DEFAULT (getdate()) FOR [MakeTime]
GO
ALTER TABLE [dbo].[Msg] ADD  CONSTRAINT [DF_Msg_sendtime]  DEFAULT (getdate()) FOR [sendtime]
GO
ALTER TABLE [dbo].[Msg] ADD  CONSTRAINT [DF_Msg_Click_num]  DEFAULT ((0)) FOR [Click_num]
GO
ALTER TABLE [dbo].[Msg] ADD  CONSTRAINT [DF_Msg_Address]  DEFAULT (N'暂未输入') FOR [Address]
GO
ALTER TABLE [dbo].[Msg] ADD  CONSTRAINT [DF_Msg_Topic]  DEFAULT (N'未输入话题') FOR [Topic]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ('TA还没有留下任何介绍') FOR [Explain]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ('微博新人') FOR [Nick]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (getdate()) FOR [Times]
GO
ALTER TABLE [dbo].[Education]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Follow_Fans]  WITH CHECK ADD FOREIGN KEY([Follow])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Follow_Fans]  WITH CHECK ADD FOREIGN KEY([Fans])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Make]  WITH CHECK ADD  CONSTRAINT [FK_Make_Msg] FOREIGN KEY([MsgId])
REFERENCES [dbo].[Msg] ([Id])
GO
ALTER TABLE [dbo].[Make] CHECK CONSTRAINT [FK_Make_Msg]
GO
ALTER TABLE [dbo].[Make]  WITH CHECK ADD  CONSTRAINT [FK_Make_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Make] CHECK CONSTRAINT [FK_Make_User]
GO
ALTER TABLE [dbo].[Msg]  WITH CHECK ADD  CONSTRAINT [FK_Msg_User1] FOREIGN KEY([Userid])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Msg] CHECK CONSTRAINT [FK_Msg_User1]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Education', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'学校名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Education', @level2type=N'COLUMN',@level2name=N'SchoolName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'学校类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Education', @level2type=N'COLUMN',@level2name=N'SchoolType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'可访问性（1可访问、0隐藏）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Education', @level2type=N'COLUMN',@level2name=N'Accessible'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Follow_Fans', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关注者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Follow_Fans', @level2type=N'COLUMN',@level2name=N'Follow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关注的人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Follow_Fans', @level2type=N'COLUMN',@level2name=N'Fans'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Make', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'微博id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Make', @level2type=N'COLUMN',@level2name=N'MsgId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评论内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Make', @level2type=N'COLUMN',@level2name=N'MakeText'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'点赞数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Make', @level2type=N'COLUMN',@level2name=N'MakeClick'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评论时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Make', @level2type=N'COLUMN',@level2name=N'MakeTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'头像' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Image'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地区' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'个人说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Explain'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Nick'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'qq号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'QQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Times'
GO
USE [master]
GO
ALTER DATABASE [MicroBlog] SET  READ_WRITE 
GO
