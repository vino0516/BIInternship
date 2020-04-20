
CREATE TABLE [dbo].[Dim_NSW_School](
	[school_id] [int] NOT NULL,
	[school_code] [int] NULL,
	[school_name] [varchar](150) NULL,
	[street] [varchar](150) NULL,
	[suburb] [varchar](150) NULL,
	[postcode] [int] NULL,
	[student_number] [int] NULL,
	[ICSEA_Value] [int] NULL,
	[level_of_schooling] [varchar](150) NULL,
	[school_subtype] [varchar](150) NULL,
	[gender] [varchar](150) NULL,
	[Remoteness] [varchar](150) NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
 CONSTRAINT [PK_Dim_NSW_School] PRIMARY KEY CLUSTERED 
(
	[school_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Dim_NSW_Station](
	[Station_id] [int] NOT NULL,
	[Station_Name] [varchar](150) NULL,
	[Street] [varchar](150) NULL,
	[Entrance_Type] [varchar](150) NULL,
	[LAT] [float] NULL,
	[LONG] [float] NULL,
	[Exit_Number] [int] NULL,
	[Mode] [varchar](150) NULL,
 CONSTRAINT [PK_Dim_NSW_Station] PRIMARY KEY CLUSTERED 
(
	[Station_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Dim_NSW_Suburb](
	[postcode] [int] NULL,
	[suburb] [varchar](150) NULL,
	[city] [varchar](150) NULL,
	[state] [varchar](150) NULL,
	[lat] [float] NULL,
	[lon] [float] NULL,
	[Suburb_Id] [int] NOT NULL,
 CONSTRAINT [PK_Dim_NSW_Suburb] PRIMARY KEY CLUSTERED 
(
	[Suburb_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
CREATE TABLE [dbo].[Fact_Property_New](
	[Fact_Property_Id] [int] IDENTITY(1,1) NOT NULL,
	[Suburb_Id] [int] NOT NULL,
	[School_Id] [int] NOT NULL,
	[Station_Id] [int] NOT NULL,
	[Property Median Value] [float] NULL
) ON [PRIMARY]
GO
