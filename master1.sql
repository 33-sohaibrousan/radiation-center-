USE [MasterPiese]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 5/7/2023 10:33:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 5/7/2023 10:33:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[AppointmentID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[patientAge] [int] NULL,
	[patientgender] [bit] NULL,
	[city] [varchar](25) NULL,
	[DeviceID] [int] NULL,
	[AppointmentDate] [date] NULL,
	[aspuserid] [nvarchar](128) NULL,
	[StartTime] [varchar](max) NULL,
	[EndTime] [varchar](max) NULL,
	[IsAccepted] [bit] NULL,
	[Timeslotsid] [int] NULL,
 CONSTRAINT [PK__Appointm__8ECDFCA295D27C27] PRIMARY KEY CLUSTERED 
(
	[AppointmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/7/2023 10:33:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/7/2023 10:33:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/7/2023 10:33:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/7/2023 10:33:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
	[Email] [varchar](50) NULL,
	[notes] [varchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/7/2023 10:33:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 5/7/2023 10:33:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[image] [varchar](255) NULL,
	[title] [varchar](50) NULL,
	[text] [varchar](max) NULL,
	[aspuser] [nvarchar](128) NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comment]    Script Date: 5/7/2023 10:33:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[comment] [varchar](max) NULL,
	[aspuser] [nvarchar](128) NULL,
	[user_id] [int] NULL,
	[id_blog] [int] NULL,
 CONSTRAINT [PK_comment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 5/7/2023 10:33:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Subject] [varchar](50) NULL,
	[Message] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Devices]    Script Date: 5/7/2023 10:33:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Devices](
	[DeviceID] [int] IDENTITY(1,1) NOT NULL,
	[DeviceName] [varchar](100) NOT NULL,
	[Description] [varchar](max) NULL,
	[Devicebackground] [varchar](255) NULL,
	[DeviceImg2] [varchar](255) NULL,
	[DeviceImg3] [varchar](255) NULL,
	[step1] [varchar](max) NULL,
	[step2] [varchar](max) NULL,
	[step3] [varchar](max) NULL,
	[Duration] [varchar](50) NULL,
	[Price] [int] NULL,
 CONSTRAINT [PK__Devices__49E1233121DA1D27] PRIMARY KEY CLUSTERED 
(
	[DeviceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientReviews]    Script Date: 5/7/2023 10:33:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientReviews](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[AppointmentID] [int] NULL,
	[Rating] [int] NULL,
	[ReviewText] [varchar](500) NULL,
	[ReviewDate] [datetime] NULL,
	[Userid] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payments]    Script Date: 5/7/2023 10:33:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[aspuser] [nchar](10) NULL,
 CONSTRAINT [PK_payments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[radiographer]    Script Date: 5/7/2023 10:33:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[radiographer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[imageemployee] [varchar](255) NULL,
	[Job title] [varchar](50) NULL,
 CONSTRAINT [PK_radiographer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSlots]    Script Date: 5/7/2023 10:33:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSlots](
	[TimeSlotID] [int] IDENTITY(1,1) NOT NULL,
	[StartTime] [time](0) NULL,
	[EndTime] [time](7) NULL,
	[Available] [bit] NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK__TimeSlot__41CC1F52FC41B5E3] PRIMARY KEY CLUSTERED 
(
	[TimeSlotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/7/2023 10:33:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[iduser] [int] IDENTITY(1,1) NOT NULL,
	[userName] [varchar](50) NULL,
	[Age] [int] NULL,
	[Gender] [bit] NULL,
	[aspuserid] [nvarchar](128) NULL,
	[PhoneNumber] [varchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[iduser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202302251649426_InitialCreate', N'Masterpies.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE436127D5F60FF41D05376E1B47CC90C668D7602A76DEF1A195F30ED09F236604BECB63012A588946363912FDB877C527E618B1275E345976EB9BB1D0C306891C553C562912C168BFEF37F7F4C7F780E03EB0927D48FC8997D3439B42D4CDCC8F3C9EACC4ED9F2DB0FF60FDFFFFD6FD34B2F7CB67E2EE84E381DB424F4CC7E642C3E751CEA3EE210D149E8BB4944A3259BB851E8202F728E0F0FFFE51C1D3918206CC0B2ACE9A794303FC4D9077CCE22E2E298A528B8893C1C50510E35F30CD5BA4521A63172F1997D8328C349EC633AC9896DEB3CF0110832C7C1D2B6102111430CC43CFD4CF19C251159CD632840C1C34B8C816E89028A85F8A71579DF9E1C1EF39E3855C302CA4D298BC28180472742358EDC7C2D05DBA5EA407997A064F6C27B9D29F0CCBEF67056F4290A400132C3D359907062D071C9E29CC6B7984D8A86931CF22A01B8DFA2E4EBA48E7860F56E77509AD2F1E490FF3BB06669C0D2049F119CB2040507D67DBA087CF727FCF2107DC5E4ECE468B13CF9F0EE3DF24EDE7F874FDED57B0A7D05BA460114DD27518C13900D2FCBFEDB96D36CE7C80DCB66B536B956C0966056D8D60D7AFE88C98A3DC27C39FE605B57FE33F68A12615C9F890F93081AB12485CFDB3408D022C065BDD3CA93FFDFC2F5F8DDFB51B8DEA2277F950DBDC41F264E02F3EA130EB25AFAE8C7F9F46A8CF7174176954421FF6EDA575EFB651EA589CB3B1319491E50B2C2AC29DDD4A98CB7974973A8F1CDBA40DD7FD3E692AAE6AD25E51D5A6726142CB63D1B0A795F976F6F8B3B8F6318BCCCB4B8465A0D4EDEAB265263B0AB92A4329CA3BE8643A0437FE575F032447E30C242D8830BB8204B3F0971D9CB1F23303B4406CB7C8F288575C0FB0FA28F2DA2C3CF11449F63374DC03CE70C85F1AB73BB7F8C08BE4DC305B7FAEDF11A6D681E7E8BAE90CBA2E492F0561BE37D8CDCAF51CA2E89778118FECCDC02907F3EF8617F8051C439775D4CE9151833F6661178D805E0356127C783E1F8FAB46B476416203FD47B22D24AFAA520ADBC113D85E29118C8745E499BA81FA3954FFA895A909A45CD293A4515644345E560FD241594664133824E3973AAD1FCBC6C84C677F432D8FDF7F436DBBC4D6B414D8D735821F1BF31C1092C63DE3D62E0A0906A04FAAC1BBB7016B2E1E34C5F7D6FCA38FD8C82746C566BCD866C11187F3664B0FB3F1B3231A1F8C9F7B857D2E3F85310037C2F7AFDC9AA7BCE49926D7B3A34BAB96DE6DB59034CD3E59CD2C8F5B359A0097C89B045537EF0E1ACEE1846DE1B390E021D0343F7F9960725D0375B36AA3B728103CCB075EEE681C119A22EF254354287BC0182153BAA46B02A1ED214EE9F0A4FB0749CF046881F8228CC549F30755AF8C4F56314746A496AD9730BE37D2F79C8351738C68433ECD4441FE6FAF00717A0E4230D4A9786A64ECDE2DA0DD1E0B59AC6BCCB85ADC65D894A6CC5263B7C67835D0AFFED550CB35D635B30CE7695F411C018CADB85818AB34A5F03900F2EFB66A0D289C960A0C2A5DA8A813635B603036DAAE4CD19687E44ED3BFED27975DFCCB37950DEFEB6DEAAAE1DD866431F7B669AB9EF096D18B4C0896A9E170B5E899F99E67006728AF31915AEAE6C221C7C8E59336453F9BB5A3FD46907918DA80DB032B40E507109A80029136A8070452CAF553AE1450C802DE26EADB062ED97606B36A062D72F436B84E62B53D9387B9D3ECA9E95D6A01879AFC3420D476310F2E2D5EC780FA598E2B2AA62FAF8C243BCE15AC7C460B428A8C3733528A9E8CCE85A2A4CB35B4B3A876C884BB6919624F7C9A0A5A233A36B49D868B792344EC100B760231535B7F091265B11E928779BB26EEAE42952A260EA1872A9A637288E7DB2AAE55689126B9E2756CDBE9D0F4F390A730CC7A59ACCA352DA92138B12B4C2522DB00649AFFC84B20BC4D002F138CFCC0B1532EDDE6A58FE0B96F5ED531DC4621F28A8F9EFBC857A75DFD86A555F44405C410743EED0645174CDF0EB9B5B3CD50D0528D104EE67519086C4EC5F995BE7D777F5F679898A307524F915FF495196E2E53635DF6B5CD43931CE1895DECBFAE364863069BBF03DEBFA36F9A36694223C55473185AC76366E263766C858C90EE2F0A1EA44789D5925B252EA00A26820462DB14101ABD5F5476DE69ED4319B35FD11A504933AA4543540CA7A1A4943C87AC55A78068DEA29FA73501347EAE86A6D7F644D0A491D5A53BD06B64666B9AE3FAA26CBA40EACA9EE8F5DA59CC86BE81EEF5BC663CBBA1B577EB0DD6CE73260BCCE8238CEC657BBBFAF03D58A0762891B7A054C94EFA531194F77EB1A531ECED8CC980C18E675A771F1DD5C765A6FEBCD988DDBECC6D2DE769B6FC61B66B2AF6A18CAD94E2629B997673CE92C3715E7AAEEC733CA412B27B1AD428DB0ADBF803985134E3099FF1ACC021FF345BC20B841C45F62CAF20C0EFBF8F0E8587A80B33F8F611C4ABD40732E35BD88698ED91692B1C8134ADC4794A8A9111B3C18A94095A8F335F1F0F399FDDFACD56916C0E0BFB2E203EB9A7E26FEAF29543C2429B67E57533DC749A0EFF164A314F4F737F116A2BFCAAF7FF992373DB0EE12984EA7D6A1A4E87586BFF94262903479D30DA459FBDDC4DB9D6D8D67095A5469B6ACFF0A61E1B3515E2014527E13A2E77F0C154DFBCA602344CD4B82B1F04651A1E9A5C03A58C657021E7CB2EC95C0B0CEEA5F0DAC239AF1C5804F8683C9EF05FA2F4345CB1DEE439AF3D23696A44CCF9DF9D61B255FEE7A6F52D2B2379AE86AEAF500B851D3AB377351DE58DAF2685BA7262B7934EC5DDAFDABA722EF4BF671E5B4EF36E9789B79C62DB7497FA9F4E23D4888D324F8EC3E8978DBB6660A00EF7926E6B054E13D3336B1CDEF3E2178DBC6660A10EFB9B10D4AFBDD335BDBD5FEB9634BEBBD85EE3C8957CD47325CE4E8A2C85D49BA79C81D8EFF8B088C20F728F3B795FAACB0B68CD60E86158999A9391D4D66AC4C1C85AF42D1CE76585FC586DFDA5941D3CED690C4D9C65BACFFADBC054D3B6F436AE42ED28BB5C989BA94EF8E75AC2D77EA2DA513377AD291BDDEE5B3B6DECABFA5ECE15194D2983D86DBE5B7932C3C8A4AC69C3A039283D58B62D83B6B7F8B11F66FEAAF2A08FE971909761BBB6649734D9651B1794B1215245284E60633E4C1967A9E307F895C06D53C009D3D0ECF827AFC1A6481BD6B7297B23865D0651C2E8246C08B3B016DFCB30CE8A6CCD3BB987FD131BA0062FA3C707F477E4CFDC02BE5BED2C4840C10DCBB10E15E3E968C877D572F25D26D447A0209F5954ED1030EE300C0E81D99A327BC8E6C607E1FF10AB92F5504D004D23D104DB54F2F7CB44A50480546D51E3EC186BDF0F9FBFF03B729E42192540000, N'6.4.4')
GO
SET IDENTITY_INSERT [dbo].[Appointments] ON 

INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (7, N'sohaib', N'alrousan', 55, 1, N'Ma''an', 14, CAST(N'2023-03-29' AS Date), N'1e6a83a3-9508-4935-a5ed-5128ff3a9f2c', N'9:00 AM', NULL, 0, 2)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (1019, N'fake', N'fake', 99, 1, N'Ajloun', 14, CAST(N'2023-03-29' AS Date), N'c52ca9c9-7704-42dc-9cd8-a0e9c64c254e', N'10:00 AM', NULL, NULL, 2)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (1023, N'ahnn', N'lebb', 85, 1, N'Irbid', 14, NULL, N'c52ca9c9-7704-42dc-9cd8-a0e9c64c254e', NULL, NULL, NULL, 2)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (1024, N'ahnnvv', N'lebb', 85, 1, N'Irbid', 14, NULL, N'c52ca9c9-7704-42dc-9cd8-a0e9c64c254e', NULL, NULL, NULL, 8)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (1025, N'abusss', N'lebb', 11, 1, N'Irbid', 14, NULL, N'c52ca9c9-7704-42dc-9cd8-a0e9c64c254e', NULL, NULL, NULL, 4)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (1026, N'abusss44', N'lebb', 11, 1, N'Irbid', 14, NULL, N'c52ca9c9-7704-42dc-9cd8-a0e9c64c254e', NULL, NULL, NULL, 4)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (1027, N'abusss44dasd', N'lebb', 11, 1, N'Irbid', 14, NULL, N'c52ca9c9-7704-42dc-9cd8-a0e9c64c254e', NULL, NULL, NULL, 4)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (1028, N'suhaib', N'alrousan', 13, 1, N'Madaba', 14, NULL, N'c52ca9c9-7704-42dc-9cd8-a0e9c64c254e', NULL, NULL, NULL, 6)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (1029, N'abood', N'alrousan', 19, 1, N'Amman', 13, NULL, N'c52ca9c9-7704-42dc-9cd8-a0e9c64c254e', NULL, NULL, NULL, 2)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (1030, N'abood1', N'alrousan', 19, 1, N'Amman', 13, NULL, N'c52ca9c9-7704-42dc-9cd8-a0e9c64c254e', NULL, NULL, 0, 2)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (2032, N'admin', N'0', 22, NULL, N'Irbid', 12, CAST(N'2023-03-31' AS Date), N'1e6a83a3-9508-4935-a5ed-5128ff3a9f2c', NULL, NULL, 0, 7)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (2037, NULL, NULL, 55, 0, N'Amman', 14, CAST(N'0001-01-01' AS Date), N'4fe21969-8183-4f35-8edc-0cc2d22f1db0', N'9:30', NULL, 0, NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (2038, NULL, NULL, 55, 0, N'Amman', 14, CAST(N'2023-03-30' AS Date), N'4fe21969-8183-4f35-8edc-0cc2d22f1db0', N'16:30', NULL, 0, NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (2040, NULL, NULL, 55, 0, N'Ajloun', 14, CAST(N'2023-03-30' AS Date), N'4fe21969-8183-4f35-8edc-0cc2d22f1db0', N'15:30', NULL, 0, NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (2041, NULL, NULL, 55, 0, N'Jarash', 14, CAST(N'2023-03-29' AS Date), N'4fe21969-8183-4f35-8edc-0cc2d22f1db0', N'18:30', NULL, 0, NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (2043, NULL, NULL, 55, 0, N'Zarqa', 14, CAST(N'2023-03-29' AS Date), N'4fe21969-8183-4f35-8edc-0cc2d22f1db0', N'17:30', NULL, 0, NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (2045, NULL, NULL, 2, 0, N'Amman', 12, CAST(N'2023-04-01' AS Date), N'1e6a83a3-9508-4935-a5ed-5128ff3a9f2c', N'9:00', NULL, 0, NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (2046, NULL, NULL, 66, 0, N'Jarash', 13, CAST(N'2023-04-04' AS Date), N'1e6a83a3-9508-4935-a5ed-5128ff3a9f2c', N'9:00', NULL, 0, NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (2047, NULL, NULL, 11, 0, N'Jarash', 12, CAST(N'2023-04-02' AS Date), N'1e6a83a3-9508-4935-a5ed-5128ff3a9f2c', N'9:00', NULL, 0, NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (2049, NULL, NULL, 22, 0, N'Zarqa', 14, CAST(N'2023-04-28' AS Date), N'1e6a83a3-9508-4935-a5ed-5128ff3a9f2c', N'10:30', NULL, 0, 2)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (2050, N'yazzed', N'alrousan', 11, 0, N'Irbid', 13, CAST(N'2023-04-25' AS Date), N'c52ca9c9-7704-42dc-9cd8-a0e9c64c254e', N'10:30', NULL, 1, NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (2051, N'sohaibx', N'alrousan', 44, 0, N'Amman', 13, CAST(N'2023-04-29' AS Date), N'1e6a83a3-9508-4935-a5ed-5128ff3a9f2c', N'9:00', NULL, 1, NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (2052, N'abood', N'alrousan', 12, 0, N'karack', 13, CAST(N'2023-04-29' AS Date), N'1e6a83a3-9508-4935-a5ed-5128ff3a9f2c', N'9:30', NULL, 1, NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (2053, N'abood255f', N'alrousanfdf', 22, 0, N'karack', 13, CAST(N'0001-01-01' AS Date), N'1e6a83a3-9508-4935-a5ed-5128ff3a9f2c', N'10:30', NULL, 1, NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (2054, N'abood5', N'alrousanfdf', 22, 1, N'karack', 13, CAST(N'2023-04-29' AS Date), N'1e6a83a3-9508-4935-a5ed-5128ff3a9f2c', N'10:00', NULL, 1, 2)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (2055, N'abood255f', N'alrousanfdf', 22, 0, N'karack', 13, CAST(N'0001-01-01' AS Date), N'1e6a83a3-9508-4935-a5ed-5128ff3a9f2c', N'10:30', NULL, 1, NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (2056, N'abood255f', N'alrousanfdf', 22, 0, N'karack', 13, CAST(N'0001-01-01' AS Date), N'1e6a83a3-9508-4935-a5ed-5128ff3a9f2c', N'10:30', NULL, 1, NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (2065, N'jem', N'alrousanfdf', 22, 0, N'karack', 13, CAST(N'2023-05-02' AS Date), N'1e6a83a3-9508-4935-a5ed-5128ff3a9f2c', N'9:00', NULL, 1, NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (2066, N'ahmad', N'alsayed', 24, 0, N'Irbid', 13, CAST(N'2023-05-02' AS Date), N'c52ca9c9-7704-42dc-9cd8-a0e9c64c254e', N'10:00', NULL, 1, NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (2067, N'ahmad', N'alsayed', 55, 0, N'Irbid', 13, CAST(N'2023-05-04' AS Date), N'1e6a83a3-9508-4935-a5ed-5128ff3a9f2c', N'12:30', NULL, 1, NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (2068, N'ahmad', N'alsayed', 33, 0, N'Irbid', 13, CAST(N'2023-05-04' AS Date), N'1e6a83a3-9508-4935-a5ed-5128ff3a9f2c', N'16:30', NULL, 0, NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (2069, N'ahmad', N'alsayed', 22, 0, N'Irbid', 13, CAST(N'2023-05-04' AS Date), N'1e6a83a3-9508-4935-a5ed-5128ff3a9f2c', N'15:30', NULL, 1, NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (2070, N'ahmad', N'alsayed', 33, 0, N'Irbid', 13, CAST(N'2023-05-04' AS Date), N'c52ca9c9-7704-42dc-9cd8-a0e9c64c254e', N'14:00', NULL, 1, NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (2071, N'soso', N'osos', 55, 0, N'Irbid', 13, CAST(N'2023-05-05' AS Date), N'72d01aa3-be3f-4e6b-8e6f-6647b6a3b4f7', N'18:30', NULL, 1, NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (2072, N'ahmad', N'odat', 22, 0, N'Irbid', 13, CAST(N'2023-05-06' AS Date), N'48b5e2b6-f00d-47f7-859c-aca04d36d576', N'9:00', NULL, 1, NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (2073, N'ahmad', N'alrousan', 33, 0, N'Ajloun', 13, CAST(N'2023-05-06' AS Date), N'9cc6110e-bebe-4800-a0ac-8cbb0404727a', N'10:00', NULL, 1, NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (2074, N'sohaib', N'alrousan', 22, 0, N'Irbid', 13, CAST(N'2023-05-11' AS Date), N'1e6a83a3-9508-4935-a5ed-5128ff3a9f2c', N'12:00', NULL, 1, NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (2075, N'malik', N'altouda', 55, 0, N'Amman', 13, CAST(N'2023-05-10' AS Date), N'1e6a83a3-9508-4935-a5ed-5128ff3a9f2c', N'9:30', NULL, NULL, NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (2076, N'sohaib', N'alrousan', 22, 0, N'Irbid', 12, CAST(N'2023-05-08' AS Date), N'bcd252ee-e555-444a-bffc-fe19988d8ce8', N'9:30', NULL, NULL, NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (2077, N'sohaib', N'alrousan', 55, 0, N'Amman', 13, CAST(N'2023-05-08' AS Date), N'1e6a83a3-9508-4935-a5ed-5128ff3a9f2c', N'16:30', NULL, NULL, NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [FirstName], [LastName], [patientAge], [patientgender], [city], [DeviceID], [AppointmentDate], [aspuserid], [StartTime], [EndTime], [IsAccepted], [Timeslotsid]) VALUES (2078, N'ahmad', N'alsayed', 22, 0, N'Irbid', 13, CAST(N'2023-05-08' AS Date), N'1e6a83a3-9508-4935-a5ed-5128ff3a9f2c', N'10:00', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Appointments] OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'2', N'Users')
GO
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [UserId]) VALUES (N'Facebook', N'1362509387908445', N'0d741b6a-5b4a-47a4-8ed0-c6cb0a2e6d6f')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Email], [notes]) VALUES (N'1e6a83a3-9508-4935-a5ed-5128ff3a9f2c', N'1', NULL, NULL)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Email], [notes]) VALUES (N'48b5e2b6-f00d-47f7-859c-aca04d36d576', N'2', N'adodat91@gmail.com', NULL)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Email], [notes]) VALUES (N'4ecc3832-a3d2-49e6-a763-8f0416fc82e6', N'2', N'ahmad1@gmail.com', NULL)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Email], [notes]) VALUES (N'4fe21969-8183-4f35-8edc-0cc2d22f1db0', N'2', N'ecfdd@gmail.com', NULL)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Email], [notes]) VALUES (N'5c91b96f-3c91-4871-8242-79cdd43745ad', N'2', N'sjaros33333@gmail.com', NULL)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Email], [notes]) VALUES (N'89ae59d0-8d4e-4200-9bc0-8e7eb7cef429', N'2', N'sohaib3@gmail.com', NULL)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Email], [notes]) VALUES (N'8f628747-310d-46eb-8f30-2357dbb127ca', N'2', N'mmmmmmm@gmail.com', NULL)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Email], [notes]) VALUES (N'9b762224-4548-4414-a9e6-b9b8e57bcf9d', N'2', N'jum@gmail.com', NULL)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Email], [notes]) VALUES (N'9cc6110e-bebe-4800-a0ac-8cbb0404727a', N'2', N'odatahmad95@gmail.com', NULL)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Email], [notes]) VALUES (N'bb59dd10-5fa6-4438-9324-a9a7a97f8416', N'2', N'haitham152dd@dd', NULL)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Email], [notes]) VALUES (N'bcd252ee-e555-444a-bffc-fe19988d8ce8', N'2', N'jeem@gmail.com', NULL)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Email], [notes]) VALUES (N'c2f3d0f9-432d-4808-ac15-e0511021451b', N'2', N'mohammad@gmail.com', NULL)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Email], [notes]) VALUES (N'c52ca9c9-7704-42dc-9cd8-a0e9c64c254e', N'2', N'ahmad@gmail.com', NULL)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Email], [notes]) VALUES (N'e02234cd-734e-4fa9-a6e9-5c28c406aacd', N'2', N'jeem1@gmail.com', NULL)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Email], [notes]) VALUES (N'f47cec8d-e3de-4fd1-9502-aaffdf37ae6d', N'2', N'gggggg@gmail.com', NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'004d72ee-fa07-4edd-9855-7ae26d6a5189', N'haytham@gmsil.com', 0, N'APYpfTtn9+2pVT5ipktFjvB9XrJHEdqSwof2shKlLmlyrc970Kt6UY4NJarR5QCiHQ==', N'be6ccf3e-c3fa-4c61-891f-2a214b76bdd6', NULL, 0, 0, NULL, 1, 0, N'haytham@gmsil.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0d741b6a-5b4a-47a4-8ed0-c6cb0a2e6d6f', N'sjaros37@gmail.com', 0, NULL, N'ab35b3ca-a869-49d8-acc3-b2dc88025ba7', NULL, 0, 0, NULL, 1, 0, N'sjaros37@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'16233461-8716-4bfb-a328-444af1995192', N'sohaib2@gmail.com', 0, N'AEs4WZwmFaTZxoykXntyQg9/OwAxH1/U2XmIcFr2t7Ib1peqR+8B6IbeENxXiw44hA==', N'906738fa-5ace-479a-bac3-da9a9fdcacc9', NULL, 0, 0, NULL, 1, 0, N'sohaib2@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1e6a83a3-9508-4935-a5ed-5128ff3a9f2c', N'sohaib@gmail.com', 0, N'AGIgJBAoB0upqJT2bDsD9Fg12zXIpl4uMoj0BaayxD43EwtXOCoqvIkDoAdRSzesYQ==', N'2cee8298-3034-4f52-9049-8733087f7223', NULL, 0, 0, NULL, 1, 0, N'sohaib@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'48b5e2b6-f00d-47f7-859c-aca04d36d576', N'adodat91@gmail.com', 0, N'ANUJnG29doSSLbBJ9+ZYDB38uKkZCEwVb8IEpf12lDzbsERsTdOAHRHQO8OxzAGnNA==', N'5597d9d7-aa8a-40e1-b712-5acf188028c6', NULL, 0, 0, NULL, 1, 0, N'adodat91@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4c115a78-0829-4a07-b7fc-62d5e83b71c5', N'yazeed@gmail.com', 0, N'AEQ6ha7/SWABOO7+z+xuukJ3bfdDDmcxXfabHpP7YIr3IyL8osVkZcHFnqyRLHZ6SA==', N'db97b687-b588-418b-8673-ee7cb5c39257', NULL, 0, 0, NULL, 1, 0, N'yazeed@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4ecc3832-a3d2-49e6-a763-8f0416fc82e6', N'ahmad1@gmail.com', 0, N'ANergtA4voa3k/gXmFEV0LOpenk7vwl6mKtJuYHLvjIZNn8ccb+NUt/YXG6thQseVg==', N'5b538918-f489-414d-ba32-9636a07b9da3', NULL, 0, 0, NULL, 1, 0, N'ahmad1@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4fe21969-8183-4f35-8edc-0cc2d22f1db0', N'ecfdd@gmail.com', 0, N'AMttAAT2rGCGVI2dWudexIcQlPFcBog4lCPsU0vpCpV6aUkJpEIcdEUktWAPlq9grQ==', N'55b773f3-8403-486b-a0f5-ce16571a6a34', NULL, 0, 0, NULL, 1, 0, N'ecfdd@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'5c91b96f-3c91-4871-8242-79cdd43745ad', N'sjaros33333@gmail.com', 0, N'AJ2X4K7/sETHWppJpeorZaLwTKdmsYlrTs4B3F6CxXDbQM2tdI3nnk/AoODtIoLfRA==', N'd0ada181-f662-4489-b9fa-28294439af25', NULL, 0, 0, NULL, 1, 0, N'sjaros33333@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'63b8b845-f351-40e1-a89f-e1d97b7e0140', N'sjaros327@gmaol.com', 0, N'AOTXCCR0p7yVTrtL6CrYn3f506i82rOT3+QmOUu/i8c/CbQheq1AINEf8lObNYZ5gw==', N'efa48cb2-e476-4d4a-b396-492f82fd9e59', NULL, 0, 0, NULL, 1, 0, N'sjaros327@gmaol.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'6e4c5245-1723-4937-82f7-8995f2b4d910', N'sjaros37@gmaol.com', 0, N'AJ0a9kwVl009s9SEy+1idr3t9zMrIup/u4U+Y6oqiHiX6oS9u4CNu2MSJXzSKhfLcg==', N'ca39db96-9346-41b2-89f0-432a3c235ef7', NULL, 0, 0, NULL, 1, 0, N'sjaros37@gmaol.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'72d01aa3-be3f-4e6b-8e6f-6647b6a3b4f7', N'alrousansohaib@gmail.com', 0, N'ABNVMFgoLzlNWKi7Mi2OguLeeqJUFG6+EDS84fY7U8PsHFIdA0bNFeUiktASr1F2Og==', N'1afbf619-85bb-4229-b5ce-e95d3b89e78d', NULL, 0, 0, NULL, 1, 0, N'alrousansohaib@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'89ae59d0-8d4e-4200-9bc0-8e7eb7cef429', N'sohaib3@gmail.com', 0, N'AIuqABcR1Ageb/gTM9fnV2Ip+2t2HiEaPa0DBGuM67xVSPJM46zoMqAgaiPDU/quUQ==', N'36c225cd-4602-425e-9439-6f1030fb8a4c', NULL, 0, 0, NULL, 1, 0, N'sohaib3@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'8f628747-310d-46eb-8f30-2357dbb127ca', N'mmmmmmm@gmail.com', 0, N'AO4FDG1p/AjbFeSetpA/0qUXzb+xg5waMznWXBQOuDici3jA11cNu5+IIc6sLmiRwA==', N'3eb01cba-601b-48ab-840f-32f73d437366', NULL, 0, 0, NULL, 1, 0, N'mmmmmmm@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'9b762224-4548-4414-a9e6-b9b8e57bcf9d', N'jum@gmail.com', 0, N'AG1RI3EBWI8Djr6ENP8VTKzDcj9ASoUfLyAaeBqvvyERifslF8KLgIUljmTnC6uU9w==', N'93e7aece-441a-4ec8-8855-376cdb258d36', NULL, 0, 0, NULL, 1, 0, N'jum@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'9cc6110e-bebe-4800-a0ac-8cbb0404727a', N'odatahmad95@gmail.com', 0, N'AA7sIoKE6YHC3FMeDTiqGowy4q0mfg+/vRApc2Biw436dFyUtVjVl1BkpsNpiSOwfA==', N'2c82492e-e799-47b3-a2b0-4a4148375649', NULL, 0, 0, NULL, 1, 0, N'odatahmad95@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'bb59dd10-5fa6-4438-9324-a9a7a97f8416', N'haitham152dd@dd', 0, N'ABQMWGEH2OiVw9fl4aSBBb8dtOY4oii1dPSNhwkDc549qbiO4K8AE134m33nNPbuXg==', N'488ba0c1-d773-4383-a681-d811a6041108', NULL, 0, 0, NULL, 1, 0, N'haitham152dd@dd')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'bcd252ee-e555-444a-bffc-fe19988d8ce8', N'jeem@gmail.com', 0, N'ABmhpEv24cvEW9rXsnByIrsNVuR6pSZLcRZjgzIVgqxDjbkXJ7BpQ+VJ4J1Su4zFqA==', N'18b9272b-beae-4043-802c-4e5527924d2a', NULL, 0, 0, NULL, 1, 0, N'jeem@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c2f3d0f9-432d-4808-ac15-e0511021451b', N'mohammad@gmail.com', 0, N'AO7iScky6VY9awvBOp/wOO3mGvHIdtg9GGKTiKu6Oq5NgTG1h/L300R8h2qW02zRfA==', N'e8fc5d77-6ce5-46eb-a6fe-64bd456593e2', NULL, 0, 0, NULL, 1, 0, N'mohammad@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c52ca9c9-7704-42dc-9cd8-a0e9c64c254e', N'ahmad@gmail.com', 0, N'AJoAiqrKS8TZdCnstA+2z5k+YsNC0gRMeg24OfL8hwb9tFzJPcZ+R0rRA43jQq1CHA==', N'd1834946-f472-4431-93dd-ef8cad93fe08', NULL, 0, 0, NULL, 1, 0, N'ahmad@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e02234cd-734e-4fa9-a6e9-5c28c406aacd', N'jeem1@gmail.com', 0, N'ANmddHE7zNo+Rjin+a/x1k2baMGNt8YQULU8//a70zmNzji0L0USNGPkG1qQHJ0dGQ==', N'bc7cce8f-b590-4e06-9911-16b1c1bd0e67', NULL, 0, 0, NULL, 1, 0, N'jeem1@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f47cec8d-e3de-4fd1-9502-aaffdf37ae6d', N'gggggg@gmail.com', 0, N'AAEehwlYGoB3SIp/5f3iIlmIqTjYh4idyLl26UbUiHOIG0lf3yRoOIM6etm73RbSNw==', N'5b056811-d5c7-47be-b629-d7b7e12eb546', NULL, 0, 0, NULL, 1, 0, N'gggggg@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([id], [image], [title], [text], [aspuser]) VALUES (1, N'../Content/Images/ctscanblog.jpg', N'CT  Computed Tomography', N'Computed tomography (CT) of the chest uses special x-ray equipment to examine abnormalities found in other imaging tests and to help diagnose the cause of unexplained cough, shortness of breath, chest pain, fever and other chest symptoms. CT scanning is fast, painless, noninvasive and accurate. Because it is able to detect very small nodules in the lung, chest CT is especially effective for diagnosing lung cancer at its earliest, most curable stage.Tell your doctor if there is a possibility you are pregnant and discuss any recent illnesses, medical conditions, medications you are taking, and allergies. You will be instructed not to eat or drink anything for a few hours beforehand. If you have a known allergy to contrast material, your doctor may prescribe medications to reduce the risk of an allergic reaction. These medications must be taken beginning 12 hours prior to your exam. Leave jewelry at home and wear loose, comfortable clothing. You may be asked to wear a gown.', N'1e6a83a3-9508-4935-a5ed-5128ff3a9f2c')
INSERT [dbo].[Blog] ([id], [image], [title], [text], [aspuser]) VALUES (2, N'../Content/Images/bone.jpg', N'Bone density measurement', N'Brittle bones or osteoporosis are common, especially in women after menopause.
Factors such as heredity, calcium- and vitamin-poor diet, smoking and lack of exercise mean an increased risk of suffering from osteoporosis. Even special diseases can give rise to osteoporosis.

To investigate osteoporosis, a bone density measurement can be done. The lower the bone density, the greater the risk of bone fracture. Osteoporosis is often discovered by suffering an osteoporosis fracture.


 

About bone densitometry examination 

Before
No special preparation is needed. During the examination, you must not wear jewellery, clothes with metal buttons or the like, as this can affect the measurement result.

Referral is required for all X-ray examinations. You get a referral, for example, from your family doctor or another doctor.


During
You will lie on a stretcher with an X-ray machine above you. The X-ray machine moves back and forth across the body to gather information about your skeleton.

The most common method of measuring bone density is a form of x-ray technology called DEXA. During the examination, the bone density is measured at one or two places on the skeleton, for example the hip or the lumbar spine. Your measured value is then compared with the normal value in the age group to which you belong.

The survey is very simple and takes about 20 minutes. The radiation dose is significantly lower than in ordinary X-ray examinations.


After
You get the answer to the examination from your doctor (the doctor who wrote the referral). Your doctor usually has the examination results within 1 week of the examination.

In some cases, the radiologist may suggest a supplement or need to order old images for comparison to ensure a diagnosis, in which case the response may take some time.', N'1e6a83a3-9508-4935-a5ed-5128ff3a9f2c')
INSERT [dbo].[Blog] ([id], [image], [title], [text], [aspuser]) VALUES (3, N'../Content/Images/mri.jpg', N'Magnetic camera (MR x-ray)', N'About magnetic camera examination
Before
Referral is required  for all X-ray examinations. You can get it, for example, from your family doctor or another doctor. In your summons, you will receive information about what preparations are needed for the examination.

You cannot be examined in a magnetic camera if you have metal splinters in any part of your body, pacemaker, insulin pump or other electronic equipment implanted. However, it is possible to carry out the examination if you have non-magnetic metal, such as a hip or knee joint prosthesis or dental filling.

There are also other types of metal objects, such as certain clips and stents, which can be obstacles. Therefore, it is important that we are informed about this in order to determine whether you can undergo your examination. The invitation to the survey includes a checklist and instructions on how to proceed if you answered YES to any of the questions.

During
An x-ray nurse explains how the examination is carried out and you get to lie down on the bunk which will then be pushed into the so-called magnetic tunnel.

An intense knocking sound is heard during the examination, so headphones or earplugs are offered. If you want, you can listen to music. You also get an alarm button in your hand that you can use if you want to get in touch with the nurse.

Then you are pushed into the tunnel where you have to lie still while the magnetic camera takes pictures. The body part to be examined is placed in the middle of the tunnel.

During an examination, a large number of images are taken over a period of 15 to 60 minutes, depending on which part of the body is to be examined. The staff is outside and can see you through a glass window.

After
You get the answer to the examination  from your doctor (the doctor who wrote the referral). Your doctor usually has the examination answer within 2 -4 working days from the time of the examination.

In some cases, the radiologist may suggest a supplement to ensure a diagnosis, in which case the answer may take some time.', N'1e6a83a3-9508-4935-a5ed-5128ff3a9f2c')
INSERT [dbo].[Blog] ([id], [image], [title], [text], [aspuser]) VALUES (4, N'../Content/Images/generalxray.jpg', N'Skeletal and chest X-ray', N'X-ray examinations of the skeleton and lungs are in most cases simple and uncomplicated to carry out and are usually quick.
For an optimal image of the skeleton and lungs, the images must be taken at different angles.

 

About skeletal and lung X-rays
 

Before
No preparation is required for a skeletal or chest X-ray. Referral is required for all X-ray examinations. You get a referral, for example, from your family doctor or another doctor.

 

During
An x-ray nurse carries out the x-ray examinations and the images are interpreted by a radiologist. The examination only takes a few minutes, but you may need to reserve more time for the entire visit.

 

After
You get the answer to the examination from your doctor (the doctor who wrote the referral). Our goal is for the referring physician to have the examination results within two working days.

In some cases, the radiologist may suggest a supplement to ensure a diagnosis, in which case the answer may take some time.', N'1e6a83a3-9508-4935-a5ed-5128ff3a9f2c')
SET IDENTITY_INSERT [dbo].[Blog] OFF
GO
SET IDENTITY_INSERT [dbo].[comment] ON 

INSERT [dbo].[comment] ([id], [Name], [Email], [comment], [aspuser], [user_id], [id_blog]) VALUES (1, NULL, NULL, N'sohaib ', N'1e6a83a3-9508-4935-a5ed-5128ff3a9f2c', 0, 1)
SET IDENTITY_INSERT [dbo].[comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (2, N'sohaib alrousan', N'sohaib@gmail.com', N'mail', N'hello')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (3, N'ahmad alsayed', N'alrousansohaib@gmail.com', N'mail', N'helo')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (4, N'ahmad alsayed', N'alrousansohaib@gmail.com', N'mail', N'hello')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (5, N'mohammad swalha', N'alrousansohaib@gmail.com', N'mail', N'hhhhhh')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (6, N'mohammad swalha', N'alrousansohaib@gmail.com', N'mail', N'hoooo')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (7, N'yazeed aldamen', N'alrousansohaib@gmail.com', N'mail', N'now we win')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (8, N'ahmad alsayed', N'ahmad@gmail.com', N'mail', N'waitk')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (9, N'yazeed aldamen', N'alrousansohaib@gmail.com', N'mail', N'waitk')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (10, N'ahmad alsayed', N'alrousansohaib@gmail.com', N'mail', N'sohaib')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (11, N'ahmad alsayed', N'alrousansohaib@gmail.com', N'mail', N'dddd')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (12, N'mohammad swalha', N'alrousansohaib@gmail.com', N'mail', N'wwwwww')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (13, N'yazeed aldamen', N'alrousansohaib@gmail.com', N'mail', N'wow
')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (14, N'yazeed aldamen', N'alrousansohaib@gmail.com', N'mail', N'sohaijb')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (15, N'yazeed aldamen', N'alrousansohaib@gmail.com', N'mail', N'ggg')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (16, N'yazeed aldamen', N'alrousansohaib@gmail.com', N'mail', N'sddddd')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (17, N'yazeed aldamen', N'alrousansohaib@gmail.com', N'mail', N'bhguy')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (18, N'mohammad swalha', N'alrousansohaib@gmail.com', N'mail', N'ssss')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (19, N'mohammad swalha', N'alrousansohaib@gmail.com', N'mail', N'sadsd')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (20, N'mohammad swalha', N'alrousansohaib@gmail.com', N'mail', N'ewfeawg')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (21, N'ahmad alsayed', N'sohaibalrousan99@gmail.com', N'mail', N'mnbv')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (22, N'ahmad alsayed', N'ahmad@gmail.com', N'mail', N'gfds')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (23, N'ahmad alsayed', N'ahmad@gmail.com', N'mail', N'fedsv')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (24, N'yazeed aldamen', N'alrousansohaib@gmail.com', N'mail', N'hello ')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (25, N'yazeed aldamen', N'alrousansohaib@gmail.com', N'mail', N'hgfds')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (26, N'yazeed aldamen', N'alrousansohaib@gmail.com', N'mail', N'hgfds')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (27, N'yazeed aldamen', N'alrousansohaib@gmail.com', N'mail', N'hgfds')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (28, N'yazeed aldamen', N'alrousansohaib@gmail.com', N'mail', N'hgfds')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (29, N'yazeed aldamen', N'alrousansohaib@gmail.com', N'mail', N'hgfds')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (30, N'yazeed aldamen', N'alrousansohaib@gmail.com', N'mail', N'hgfds')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (31, N'yazeed aldamen', N'alrousansohaib@gmail.com', N'mail', N'hgfds')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (32, N'yazeed aldamen', N'alrousansohaib@gmail.com', N'mail', N'hgfds')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (33, N'yazeed aldamen', N'alrousansohaib@gmail.com', N'mail', N'hgfds')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (34, N'yazeed aldamen', N'alrousansohaib@gmail.com', N'mail', N'hgfds')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (35, N'yazeed aldamen', N'alrousansohaib@gmail.com', N'mail', N'hgfds')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (36, N'yazeed aldamen', N'alrousansohaib@gmail.com', N'mail', N'hgfds')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (37, N'yazeed aldamen', N'alrousansohaib@gmail.com', N'mail', N'hgfds')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (38, N'yazeed aldamen', N'alrousansohaib@gmail.com', N'mail', N'sqdw')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (39, N'yazeed aldamen', N'alrousansohaib@gmail.com', N'mail', N'sqdw')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (40, N'ahmad alsayed', N'ahmad@gmail.com', N'mail', N'wdqw')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (41, N'ahmad alsayed', N'ahmad@gmail.com', N'mail', N'wdqw')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (42, N'ahmad alsayed', N'ahmad@gmail.com', N'mail', N'wdqw')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (43, N'ahmad alsayed', N'ahmad@gmail.com', N'mail', N'wdqw')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (44, N'ahmad alsayed', N'ahmad@gmail.com', N'mail', N'dwqfew')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (45, N'ahmad alsayed', N'ahmad@gmail.com', N'mail', N'dwqfew')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (46, N'ahmad alsayed', N'ahmad@gmail.com', N'mail', N'dwqfew')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (47, N'ahmad alsayed', N'ahmad@gmail.com', N'mail', N'dwqfew')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (48, N'ahmad alsayed', N'ahmad@gmail.com', N'mail', N'dwqfew')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (49, N'ahmad alsayed', N'ahmad@gmail.com', N'mail', N'dwqfew')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (50, N'ahmad alsayed', N'ahmad@gmail.com', N'mail', N'swqd')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (51, N'ahmad alsayed', N'ahmad@gmail.com', N'mail', N'swqd')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (52, N'ahmad alsayed', N'ahmad@gmail.com', N'mail', N'swqd')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (53, N'ahmad alsayed', N'ahmad@gmail.com', N'mail', N'swqd')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (54, N'ahmad alsayed', N'ahmad@gmail.com', N'mail', N'swqd')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (55, N'ahmad alsayed', N'ahmad@gmail.com', N'mail', N'swqd')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (56, N'ahmad alsayed', N'ahmad@gmail.com', N'mail', N'swqd')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (57, N'ahmad alsayed', N'ahmad@gmail.com', N'mail', N'swqd')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (58, N'ahmad alsayed', N'ahmad@gmail.com', N'mail', N'swqd')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (59, N'ahmad alsayed', N'ahmad@gmail.com', N'mail', N'swqd')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (60, N'ahmad alsayed', N'ahmad@gmail.com', N'mail', N'swqd')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (61, N'ahmad alsayed', N'ahmad@gmail.com', N'mail', N'swqd')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (62, N'ahmad alsayed', N'ahmad@gmail.com', N'mail', N'swqd')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (63, N'ahmad alsayed', N'ahmad@gmail.com', N'mail', N'swqd')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (64, N'ahmad alsayed', N'ahmad@gmail.com', N'mail', N'swqd')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (65, N'ahmad alsayed', N'ahmad@gmail.com', N'mail', N'swqd')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (66, N'ahmad alsayed', N'ahmad@gmail.com', N'mail', N'swqd')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (67, N'ahmad alsayed', N'ahmad@gmail.com', N'mail', N'swqd')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (68, N'ahmad alsayed', N'ahmad@gmail.com', N'mail', N'sdwqd')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (69, N'ahmad alsayed', N'ahmad@gmail.com', N'mail', N'sdwqd')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (70, N'ahmad alsayed', N'ahmad@gmail.com', N'mail', N'sdwqd')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (71, N'ahmad alsayed', N'ahmad@gmail.com', N'mail', N'sdwqd')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (72, N'ahmad alsayed', N'ahmad@gmail.com', N'mail', N'sdwqd')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (73, N'ahmad alsayed', N'ahmad@gmail.com', N'mail', N'sdwqd')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (74, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (75, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (76, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (77, NULL, NULL, NULL, NULL)
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (78, N'aboos', N'alrousansohaib@gmail.com', N'mail', N'aboood')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (79, N'aboodf', N'alrousansohaib@gmail.com', N'mail', N'sssss')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (80, N'sohaib', N'sohaib@gmail.com', N'sohaib', N'hello man')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (81, N'sohaib', N'sohaib@gmail.com', N'mail', N'cscscds')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (82, N'suhaib jehad alrousan', N'alrousansohaib@gmail.com', N'mail', N'mohammad')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (83, N'suhaib jehad alrousan', N'alrousansohaib@gmail.com', N'mail', N'fqwfw')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (84, N'suhaib jehad alrousan', N'alrousansohaib@gmail.com', N'mail', N'dsfsdfs')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (85, N'suhaib jehad alrousan', N'alrousansohaib@gmail.com', N'mail', N'vdsvsd')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (86, N'sohaib', N'sohaib@gmail.com', N'mail', N'gfdgfd')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (87, N'sohaib', N'sohaib@gmail.com', N'mail', N'sohaib')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (88, N'sohaib', N'sohaib@gmail.com', N'mail', N'now')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (89, N'aboodf', N'alrousansohaib@gmail.com', N'mail', N'foul')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (90, N'aboodf', N'alrousansohaib@gmail.com', N'mail', N'mmmmm')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (91, N'Sohaib alrousan', N'sohaib@gmail.com', N'mail', N'saddada')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (92, N'Sohaib alrousan', N'sohaib@gmail.com', N'mail', N'hiii there')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (93, N'malih', N'sohaib@gmail.com', N'mail', N'heeeeee')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (94, N'Sohaib s', N'sohaib@gmail.com', N'mail', N'ssss')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (95, N'Sohaib s', N'sohaib@gmail.com', N'mail', N'ssss')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (96, N'ahmad alsayed', N'alrousansohaib@gmail.com', N'mail', N'www')
INSERT [dbo].[Contact] ([id], [Name], [Email], [Subject], [Message]) VALUES (97, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Contact] OFF
GO
SET IDENTITY_INSERT [dbo].[Devices] ON 

INSERT [dbo].[Devices] ([DeviceID], [DeviceName], [Description], [Devicebackground], [DeviceImg2], [DeviceImg3], [step1], [step2], [step3], [Duration], [Price]) VALUES (12, N'General X-Ray', N'We pride ourselves on delivering top quality diagnostic imaging services in a timely manner. Using the latest in X-Ray technology, our experienced Radiologists interpret images and provide reports in a completely filmless environment.', N'../Content/Images/xraycover.jpg', N'../Content/Images/generalxray.jpg', N'../Content/Images/xrayabout.jpg', N'After checking in, you will be shown to a change room and asked to remove some or all of your clothing and put on a gown You may also be asked to remove jewelry, dentures, eye glasses and any metal objects or clothing that might interfere with x-ray imaging During the exam, depending on the body part being examined, we may image you while you are sitting, standing or lying down and you will be required to keep still. Lead aprons may be placed in areas not being examined to limit exposure Once the exam is complete you are free to leave and continue normally with your day. Your results will be sent directly from our radiologist to your referring physician', N'To our female patients: you should always inform the technologist if there is any possibility that you are pregnant. If an x-ray is necessary, precautions will be taken to minimize radiation exposure to the baby Walk-in exams can generally be accommodated and no appointment is necessary, although we can’t guarantee we can see you if you arrive less than 30 minutes before closing time', N'Please be sure to arrive at least 10 minutes before your appointment to allow enough time to change and prepare for your examination. It is recommended that you dress comfortably. Please avoid clothing that has zippers, clasps, snaps, buttons and/or beading near the area to be imaged. Any metal or jewelry near the area to be imaged must be removed prior to the X-Ray. Please note: if there is a chance that you are pregnant, the exam may not be possible.', NULL, 20)
INSERT [dbo].[Devices] ([DeviceID], [DeviceName], [Description], [Devicebackground], [DeviceImg2], [DeviceImg3], [step1], [step2], [step3], [Duration], [Price]) VALUES (13, N'Computed Tomography (CT)', N'Computer tomography can be used to examine most of the body''s organs. Computed tomography is also called DT or CT, and colloquially also X-ray.', N'../Content/Images/CT scan background.jpg', N'../Content/Images/ct2.jpg', N'../Content/Images/CTScan-about.jpg', N'Depending on which part of your body is being scanned, you may be asked to:  Take off some or all of your clothing and wear a hospital gown Remove metal objects, such as a belt, jewelry, dentures and eyeglasses, which might interfere with image results Refrain from eating or drinking for a few hours before your scan', N'CT scanners are shaped like a large doughnut standing on its side. You lie on a narrow, motorized table that slides through the opening into a tunnel. Straps and pillows may be used to help you stay in position. During a head scan, the table may be fitted with a special cradle that holds your head still.  While the table moves you into the scanner, detectors and the X-ray tube rotate around you. Each rotation yields several images of thin slices of your body. You may hear buzzing and whirring noises.  A technologist in a separate room can see and hear you. You will be able to communicate with the technologist via intercom. The technologist may ask you to hold your breath at certain points to avoid blurring the images.', N'After the exam you can return to your normal routine. If you were given contrast material, you may receive special instructions. In some cases, you may be asked to wait for a short time before leaving to ensure that you feel well after the exam. After the scan, you''ll likely be told to drink lots of fluids to help your kidneys remove the contrast material from your body', NULL, 30)
INSERT [dbo].[Devices] ([DeviceID], [DeviceName], [Description], [Devicebackground], [DeviceImg2], [DeviceImg3], [step1], [step2], [step3], [Duration], [Price]) VALUES (14, N'MRI', N'Examination with a magnetic camera (also called magnetic x-ray) is used to detect and map a variety of diseases and conditions that are difficult to see with ordinary X-ray or computed tomography examinations.', N'../Content/Images/mriabckground.jpeg', N'../Content/Images/mri.jpg', N'../Content/Images/mriabout.jpeg', N'Before an MRI exam, eat normally and continue to take your usual medications, unless otherwise instructed. You will typically be asked to change into a gown and to remove things that might affect the magnetic imaging, such as:  Jewelry Hairpins Eyeglasses Watches Wigs Dentures Hearing aids Underwire bras Cosmetics that contain metal particles', N'The MRI machine creates a strong magnetic field around you, and radio waves are directed at your body. The procedure is painless. You don''t feel the magnetic field or radio waves, and there are no moving parts around you. In some cases, a contrast material, typically gadolinium, will be injected through an intravenous (IV) line into a vein in your hand or arm. The contrast material enhances certain details. Gadolinium rarely causes allergic reactions.  An MRI can last anywhere from 15 minutes to more than an hour. You must hold still because movement can blur the resulting images.  During a functional MRI, you might be asked to perform a number of small tasks — such as tapping your thumb against your fingers, rubbing a block of sandpaper or answering simple questions. This helps pinpoint the portions of your brain that control these actions.', N'If you haven''t been sedated, you can resume your usual activities immediately after the scan.', NULL, 50)
INSERT [dbo].[Devices] ([DeviceID], [DeviceName], [Description], [Devicebackground], [DeviceImg2], [DeviceImg3], [step1], [step2], [step3], [Duration], [Price]) VALUES (28, N'MRI', N'good', N'../Content/Images/login0.jpeg', N'../Content/Images/login0.jpeg', N'../Content/Images/checkout.png', N'After checking in, you will be shown to a change room and asked to remove some or all of your clothing and put on a gown You may also be asked to remove jewelry, dentures, eye glasses and any metal objects or clothing that might interfere with x-ray imaging During the exam, depending on the body part being examined, we may image you while you are sitting, standing or lying down and you will be required to keep still. Lead aprons may be placed in areas not being examined to limit exposure Once the exam is complete you are free to leave and continue normally with your day. Your results will be sent directly from our radiologist to your referring physician', N'To our female patients: you should always inform the technologist if there is any possibility that you are pregnant. If an x-ray is necessary, precautions will be taken to minimize radiation exposure to the baby Walk-in exams can generally be accommodated and no appointment is necessary, although we can’t guarantee we can see you if you arrive less than 30 minutes before closing time', N'Please be sure to arrive at least 10 minutes before your appointment to allow enough time to change and prepare for your examination. It is recommended that you dress comfortably. Please avoid clothing that has zippers, clasps, snaps, buttons and/or beading near the area to be imaged. Any metal or jewelry near the area to be imaged must be removed prior to the X-Ray. Please note: if there is a chance that you are pregnant, the exam may not be possible.', N'1 Hours', NULL)
SET IDENTITY_INSERT [dbo].[Devices] OFF
GO
SET IDENTITY_INSERT [dbo].[radiographer] ON 

INSERT [dbo].[radiographer] ([id], [Name], [imageemployee], [Job title]) VALUES (1, N'Sohaib alrousan', N'../Content/Images/sohaib.png', N'MRI Technologist ')
INSERT [dbo].[radiographer] ([id], [Name], [imageemployee], [Job title]) VALUES (2, N'yazeed aldamen', N'../Content/Images/yazeed.png', N'MRI Technologist ')
INSERT [dbo].[radiographer] ([id], [Name], [imageemployee], [Job title]) VALUES (3, N'mohammad swalha', N'../Content/Images/swalha.png', N'CT Radiographer')
SET IDENTITY_INSERT [dbo].[radiographer] OFF
GO
SET IDENTITY_INSERT [dbo].[TimeSlots] ON 

INSERT [dbo].[TimeSlots] ([TimeSlotID], [StartTime], [EndTime], [Available], [Date]) VALUES (2, CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[TimeSlots] ([TimeSlotID], [StartTime], [EndTime], [Available], [Date]) VALUES (3, CAST(N'10:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[TimeSlots] ([TimeSlotID], [StartTime], [EndTime], [Available], [Date]) VALUES (4, CAST(N'11:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[TimeSlots] ([TimeSlotID], [StartTime], [EndTime], [Available], [Date]) VALUES (5, CAST(N'12:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[TimeSlots] ([TimeSlotID], [StartTime], [EndTime], [Available], [Date]) VALUES (6, CAST(N'13:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[TimeSlots] ([TimeSlotID], [StartTime], [EndTime], [Available], [Date]) VALUES (7, CAST(N'14:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[TimeSlots] ([TimeSlotID], [StartTime], [EndTime], [Available], [Date]) VALUES (8, CAST(N'15:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[TimeSlots] ([TimeSlotID], [StartTime], [EndTime], [Available], [Date]) VALUES (9, CAST(N'16:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[TimeSlots] ([TimeSlotID], [StartTime], [EndTime], [Available], [Date]) VALUES (10, CAST(N'17:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[TimeSlots] ([TimeSlotID], [StartTime], [EndTime], [Available], [Date]) VALUES (11, CAST(N'18:00:00' AS Time), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TimeSlots] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([iduser], [userName], [Age], [Gender], [aspuserid], [PhoneNumber]) VALUES (0, NULL, NULL, NULL, N'bcd252ee-e555-444a-bffc-fe19988d8ce8', NULL)
INSERT [dbo].[Users] ([iduser], [userName], [Age], [Gender], [aspuserid], [PhoneNumber]) VALUES (1, N'Sohaib', 25, NULL, N'5c91b96f-3c91-4871-8242-79cdd43745ad', NULL)
INSERT [dbo].[Users] ([iduser], [userName], [Age], [Gender], [aspuserid], [PhoneNumber]) VALUES (2, N'ahmad', 22, NULL, N'4ecc3832-a3d2-49e6-a763-8f0416fc82e6', NULL)
INSERT [dbo].[Users] ([iduser], [userName], [Age], [Gender], [aspuserid], [PhoneNumber]) VALUES (3, N'mohammad', 22, NULL, N'c2f3d0f9-432d-4808-ac15-e0511021451b', NULL)
INSERT [dbo].[Users] ([iduser], [userName], [Age], [Gender], [aspuserid], [PhoneNumber]) VALUES (4, N'jeem59', 2930, 1, N'bcd252ee-e555-444a-bffc-fe19988d8ce8', NULL)
INSERT [dbo].[Users] ([iduser], [userName], [Age], [Gender], [aspuserid], [PhoneNumber]) VALUES (1004, N'jeem1', 25, NULL, N'e02234cd-734e-4fa9-a6e9-5c28c406aacd', NULL)
INSERT [dbo].[Users] ([iduser], [userName], [Age], [Gender], [aspuserid], [PhoneNumber]) VALUES (1005, N'sohaib', 55, 1, N'1e6a83a3-9508-4935-a5ed-5128ff3a9f2c', NULL)
INSERT [dbo].[Users] ([iduser], [userName], [Age], [Gender], [aspuserid], [PhoneNumber]) VALUES (1006, N'ahmad', 56, NULL, N'c52ca9c9-7704-42dc-9cd8-a0e9c64c254e', NULL)
INSERT [dbo].[Users] ([iduser], [userName], [Age], [Gender], [aspuserid], [PhoneNumber]) VALUES (1007, N'mossa', 25, NULL, N'bb59dd10-5fa6-4438-9324-a9a7a97f8416', NULL)
INSERT [dbo].[Users] ([iduser], [userName], [Age], [Gender], [aspuserid], [PhoneNumber]) VALUES (1008, N'mossadd', 40, NULL, N'8f628747-310d-46eb-8f30-2357dbb127ca', NULL)
INSERT [dbo].[Users] ([iduser], [userName], [Age], [Gender], [aspuserid], [PhoneNumber]) VALUES (1009, N'gggggggggggg', 50, NULL, N'f47cec8d-e3de-4fd1-9502-aaffdf37ae6d', NULL)
INSERT [dbo].[Users] ([iduser], [userName], [Age], [Gender], [aspuserid], [PhoneNumber]) VALUES (1010, N'ffrfsds', 15, NULL, N'4fe21969-8183-4f35-8edc-0cc2d22f1db0', NULL)
INSERT [dbo].[Users] ([iduser], [userName], [Age], [Gender], [aspuserid], [PhoneNumber]) VALUES (1011, N'jumaneh', 22, NULL, N'9b762224-4548-4414-a9e6-b9b8e57bcf9d', N'0790552430')
INSERT [dbo].[Users] ([iduser], [userName], [Age], [Gender], [aspuserid], [PhoneNumber]) VALUES (1012, N'ahmad odat', 22, NULL, N'48b5e2b6-f00d-47f7-859c-aca04d36d576', NULL)
INSERT [dbo].[Users] ([iduser], [userName], [Age], [Gender], [aspuserid], [PhoneNumber]) VALUES (1013, N'ahmad22', 33, NULL, N'9cc6110e-bebe-4800-a0ac-8cbb0404727a', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_AspNetUsers] FOREIGN KEY([aspuserid])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_AspNetUsers]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Devices] FOREIGN KEY([DeviceID])
REFERENCES [dbo].[Devices] ([DeviceID])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Devices]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_TimeSlots] FOREIGN KEY([Timeslotsid])
REFERENCES [dbo].[TimeSlots] ([TimeSlotID])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_TimeSlots]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_AspNetUsers] FOREIGN KEY([aspuser])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_AspNetUsers]
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [FK_comment_AspNetUsers] FOREIGN KEY([aspuser])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [FK_comment_AspNetUsers]
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [FK_comment_Blog] FOREIGN KEY([id_blog])
REFERENCES [dbo].[Blog] ([id])
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [FK_comment_Blog]
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [FK_comment_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([iduser])
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [FK_comment_Users]
GO
ALTER TABLE [dbo].[PatientReviews]  WITH CHECK ADD  CONSTRAINT [FK__PatientRe__Appoi__68487DD7] FOREIGN KEY([AppointmentID])
REFERENCES [dbo].[Appointments] ([AppointmentID])
GO
ALTER TABLE [dbo].[PatientReviews] CHECK CONSTRAINT [FK__PatientRe__Appoi__68487DD7]
GO
ALTER TABLE [dbo].[PatientReviews]  WITH CHECK ADD  CONSTRAINT [FK_PatientReviews_AspNetUsers] FOREIGN KEY([Userid])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[PatientReviews] CHECK CONSTRAINT [FK_PatientReviews_AspNetUsers]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_AspNetUsers] FOREIGN KEY([aspuserid])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_AspNetUsers]
GO
ALTER TABLE [dbo].[TimeSlots]  WITH CHECK ADD  CONSTRAINT [chk_StartTimeBeforeEndTime] CHECK  (([StartTime]<[EndTime]))
GO
ALTER TABLE [dbo].[TimeSlots] CHECK CONSTRAINT [chk_StartTimeBeforeEndTime]
GO
