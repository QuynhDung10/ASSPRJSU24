USE [AssPRJ]
GO
/****** Object:  Table [dbo].[assesments]    Script Date: 6/26/2024 10:41:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[assesments](
	[aid] [int] NOT NULL,
	[aname] [varchar](150) NOT NULL,
	[weight] [float] NOT NULL,
	[subid] [int] NULL,
 CONSTRAINT [PK_assesments] PRIMARY KEY CLUSTERED 
(
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courses]    Script Date: 6/26/2024 10:41:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses](
	[cid] [int] NOT NULL,
	[cname] [varchar](150) NOT NULL,
	[lid] [int] NOT NULL,
	[subid] [int] NOT NULL,
	[semid] [int] NOT NULL,
 CONSTRAINT [PK_courses] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exams]    Script Date: 6/26/2024 10:41:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exams](
	[eid] [int] NOT NULL,
	[from] [datetime] NOT NULL,
	[duration] [float] NOT NULL,
	[aid] [int] NOT NULL,
 CONSTRAINT [PK_exams] PRIMARY KEY CLUSTERED 
(
	[eid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[grades]    Script Date: 6/26/2024 10:41:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grades](
	[eid] [int] NOT NULL,
	[sid] [int] NOT NULL,
	[score] [float] NOT NULL,
 CONSTRAINT [PK_grades] PRIMARY KEY CLUSTERED 
(
	[eid] ASC,
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lecturers]    Script Date: 6/26/2024 10:41:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lecturers](
	[lid] [int] NOT NULL,
	[lname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_lecturers] PRIMARY KEY CLUSTERED 
(
	[lid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[semester]    Script Date: 6/26/2024 10:41:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[semester](
	[semid] [int] NOT NULL,
	[year] [int] NOT NULL,
	[season] [varchar](10) NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_semester] PRIMARY KEY CLUSTERED 
(
	[semid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students]    Script Date: 6/26/2024 10:41:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students](
	[sid] [int] NOT NULL,
	[sname] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_students] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students_courses]    Script Date: 6/26/2024 10:41:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students_courses](
	[sid] [int] NOT NULL,
	[cid] [int] NOT NULL,
 CONSTRAINT [PK_students_courses] PRIMARY KEY CLUSTERED 
(
	[sid] ASC,
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subjects]    Script Date: 6/26/2024 10:41:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subjects](
	[subid] [int] NOT NULL,
	[subname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_subjects] PRIMARY KEY CLUSTERED 
(
	[subid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 6/26/2024 10:41:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[username] [varchar](150) NOT NULL,
	[password] [varchar](150) NOT NULL,
	[displayname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_lecturers]    Script Date: 6/26/2024 10:41:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_lecturers](
	[username] [varchar](150) NOT NULL,
	[lid] [int] NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_users_lecturers] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[lid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_students](
	[username] [varchar](150) NOT NULL,
	[sid] [int] NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_users_students] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (1, N'WS1', 0.05, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (2, N'WS2', 0.05, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (3, N'PT1', 0.05, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (4, N'PT2', 0.05, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (5, N'Assignment', 0.4, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (6, N'Final Exam', 0.2, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (7, N'Practical Exam', 0.2, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (8, N'FE', 0.2, 1)




INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (9, N'Participation', 0.1, 2)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (10, N'ProgressTest1', 0.1, 2)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (11, N'ProgressTest2', 0.1, 2)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (12, N'Mid-term test', 0.3, 2)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (13, N'FE Listening', 0.1, 2)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (14, N'FE GVR', 0.3, 2)


INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (15, N'WS1', 0.05, 3)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (16, N'WS2', 0.05, 3)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (17, N'PT1', 0.05, 3)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (18, N'PT2', 0.05, 3)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (19, N'Assignment', 0.2, 3)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (20, N'Practical Exam', 0.3, 3)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (21, N'Final Exam', 0.3, 3)



GO
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (1, N'SE1872-PRJ301', 1, 1, 4)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (2, N'SE1872-JPD123', 2, 2, 4)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (3, N'SE1873-PRO192', 1, 3, 4)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (4, N'SE1874-PRJ301', 1, 1, 4)
GO
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (1, CAST(N'2024-06-17T09:00:00.000' AS DateTime), 30, 1)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (2, CAST(N'2024-06-17T09:00:00.000' AS DateTime), 30, 2)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (3, CAST(N'2024-06-17T09:00:00.000' AS DateTime), 30, 3)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (4, CAST(N'2024-06-17T09:00:00.000' AS DateTime), 30, 4)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (5, CAST(N'2024-06-17T09:00:00.000' AS DateTime), 30, 5)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (6, CAST(N'2024-06-17T09:00:00.000' AS DateTime), 30, 6)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (7, CAST(N'2024-06-17T09:00:00.000' AS DateTime), 30, 7)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (8, CAST(N'2024-06-18T09:00:00.000' AS DateTime), 30, 1)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (9, CAST(N'2024-06-18T09:00:00.000' AS DateTime), 30, 8)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (10, CAST(N'2024-06-18T09:00:00.000' AS DateTime), 30, 9)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (11, CAST(N'2024-06-18T09:00:00.000' AS DateTime), 30, 10)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES 
(12, CAST(N'2024-06-18T09:00:00.000' AS DateTime), 30, 11),

(13, CAST(N'2024-06-18T09:00:00.000' AS DateTime), 30, 12),
(14, CAST(N'2024-06-18T09:00:00.000' AS DateTime), 30, 13),
(15, CAST(N'2024-06-18T09:00:00.000' AS DateTime), 30, 14),
(16, CAST(N'2024-06-18T09:00:00.000' AS DateTime), 30, 15),
(17, CAST(N'2024-06-18T09:00:00.000' AS DateTime), 30, 16),
(18, CAST(N'2024-06-18T09:00:00.000' AS DateTime), 30, 17),
(19, CAST(N'2024-06-18T09:00:00.000' AS DateTime), 30, 18),
(20, CAST(N'2024-06-18T09:00:00.000' AS DateTime), 30, 19),
(21, CAST(N'2024-06-18T09:00:00.000' AS DateTime), 30, 20);




GO
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (1, 1, 8)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (1, 2, 6)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (2, 1, 5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (3, 2, 9)

GO


INSERT [dbo].[lecturers] ([lid], [lname]) VALUES (1, N'sonnt')
INSERT [dbo].[lecturers] ([lid], [lname]) VALUES (2, N'dunglt')

GO
INSERT [dbo].[semester] ([semid], [year], [season], [active]) VALUES (1, 2023, N'SUMMER', 0)
INSERT [dbo].[semester] ([semid], [year], [season], [active]) VALUES (2, 2023, N'FALL', 0)
INSERT [dbo].[semester] ([semid], [year], [season], [active]) VALUES (3, 2024, N'SPRING', 0)
INSERT [dbo].[semester] ([semid], [year], [season], [active]) VALUES (4, 2024, N'SUMMER', 1)
GO
INSERT [dbo].[students] ([sid], [sname]) VALUES (1, N'dungpq')
INSERT [dbo].[students] ([sid], [sname]) VALUES (2, N'sunny')
INSERT [dbo].[students] ([sid], [sname]) VALUES (3, N'anhdn')
INSERT [dbo].[students] ([sid], [sname]) VALUES (4, N'haha')
INSERT [dbo].[students] ([sid], [sname]) VALUES (5, N'mainh')

GO
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (1, 1)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (1, 2)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (2, 1)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (2, 2)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (3, 1)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (3, 3)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (4, 3)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (5, 4)

GO
INSERT [dbo].[subjects] ([subid], [subname]) VALUES (1, N'PRJ301')
INSERT [dbo].[subjects] ([subid], [subname]) VALUES (2, N'JPD123')
INSERT [dbo].[subjects] ([subid], [subname]) VALUES (3, N'PRO192')
GO
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'sonnt', N'123', N'Ngo Tung Son')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'dunglt', N'123', N'Le Thi Dung')

INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'dungpq', N'123', N'Pham Quynh Dung')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'sunny', N'123', N'Sunny')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'anhdn', N'123', N'Duong Ngoc Anh')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'haha', N'123', N'Ha Ha')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'mainh', N'123', N'Nguyen Hien Mai')

GO
INSERT [dbo].[users_lecturers] ([username], [lid], [active]) VALUES (N'sonnt', 1, 1)
INSERT [dbo].[users_lecturers] ([username], [lid], [active]) VALUES (N'dunglt', 2, 1)

GO

INSERT [dbo].[users_students] ([username], [sid], [active]) VALUES (N'dungpq', 1, 1)
INSERT [dbo].[users_students] ([username], [sid], [active]) VALUES (N'sunny', 2, 1)
INSERT [dbo].[users_students] ([username], [sid], [active]) VALUES (N'anhdn', 3, 1)
INSERT [dbo].[users_students] ([username], [sid], [active]) VALUES (N'haha', 4, 1)
INSERT [dbo].[users_students] ([username], [sid], [active]) VALUES (N'mainh', 5, 1)


GO
ALTER TABLE [dbo].[assesments]  WITH CHECK ADD  CONSTRAINT [FK_assesments_subjects] FOREIGN KEY([subid])
REFERENCES [dbo].[subjects] ([subid])
GO
ALTER TABLE [dbo].[assesments] CHECK CONSTRAINT [FK_assesments_subjects]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_courses_lecturers] FOREIGN KEY([lid])
REFERENCES [dbo].[lecturers] ([lid])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_courses_lecturers]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_courses_semester] FOREIGN KEY([semid])
REFERENCES [dbo].[semester] ([semid])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_courses_semester]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_courses_subjects] FOREIGN KEY([subid])
REFERENCES [dbo].[subjects] ([subid])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_courses_subjects]
GO
ALTER TABLE [dbo].[exams]  WITH CHECK ADD  CONSTRAINT [FK_exams_assesments] FOREIGN KEY([aid])
REFERENCES [dbo].[assesments] ([aid])
GO
ALTER TABLE [dbo].[exams] CHECK CONSTRAINT [FK_exams_assesments]
GO
ALTER TABLE [dbo].[grades]  WITH CHECK ADD  CONSTRAINT [FK_grades_exams] FOREIGN KEY([eid])
REFERENCES [dbo].[exams] ([eid])
GO
ALTER TABLE [dbo].[grades] CHECK CONSTRAINT [FK_grades_exams]
GO
ALTER TABLE [dbo].[grades]  WITH CHECK ADD  CONSTRAINT [FK_grades_students] FOREIGN KEY([sid])
REFERENCES [dbo].[students] ([sid])
GO
ALTER TABLE [dbo].[grades] CHECK CONSTRAINT [FK_grades_students]
GO
ALTER TABLE [dbo].[students_courses]  WITH CHECK ADD  CONSTRAINT [FK_students_courses_courses] FOREIGN KEY([cid])
REFERENCES [dbo].[courses] ([cid])
GO
ALTER TABLE [dbo].[students_courses] CHECK CONSTRAINT [FK_students_courses_courses]
GO
ALTER TABLE [dbo].[students_courses]  WITH CHECK ADD  CONSTRAINT [FK_students_courses_students] FOREIGN KEY([sid])
REFERENCES [dbo].[students] ([sid])
GO
ALTER TABLE [dbo].[students_courses] CHECK CONSTRAINT [FK_students_courses_students]
GO
ALTER TABLE [dbo].[users_lecturers]  WITH CHECK ADD  CONSTRAINT [FK_users_lecturers_lecturers] FOREIGN KEY([lid])
REFERENCES [dbo].[lecturers] ([lid])
GO
ALTER TABLE [dbo].[users_lecturers] CHECK CONSTRAINT [FK_users_lecturers_lecturers]
GO
ALTER TABLE [dbo].[users_lecturers]  WITH CHECK ADD  CONSTRAINT [FK_users_lecturers_users] FOREIGN KEY([username])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[users_lecturers] CHECK CONSTRAINT [FK_users_lecturers_users]
GO


ALTER TABLE [dbo].[users_students]  WITH CHECK ADD  CONSTRAINT [FK_users_students_students] FOREIGN KEY([sid])
REFERENCES [dbo].[students] ([sid])
GO
ALTER TABLE [dbo].[users_students] CHECK CONSTRAINT [FK_users_students_students]
GO
ALTER TABLE [dbo].[users_students]  WITH CHECK ADD  CONSTRAINT [FK_users_students_users] FOREIGN KEY([username])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[users_students] CHECK CONSTRAINT [FK_users_students_users]
GO

