
CREATE TABLE DIM_MASTER_ORGANISATION (
	[Location Code] [nvarchar](255) NOT NULL,
	[Location] [nvarchar](255) NULL,
	[Company] [nvarchar](255) NULL,
	[Department Number] [nvarchar](255) NULL,
	[Cost Center] [nvarchar](255) NULL,
	[UID] [nvarchar](255) NOT NULL,
	[CreatedBy] [nvarchar](255) Not NULL,
	[CreatedDate] [date] NULL,
	[UpdatedBy] [nvarchar](255) NOT NULL,
	[Updateddate] [datetime] NOT NULL,
	PRIMARY KEY  (UID)
);
CREATE TABLE [DIM_MASTER_ACCOUNTGROUPS](
	[Account 2-digits] [nvarchar](255) NOT NULL,
	[Account Type] [nvarchar](255) NOT NULL,
	[Account Group] [nvarchar](255) NOT NULL,
	[UID] [nvarchar](255) NOT NULL,
	[CreatedBy] [nvarchar](255) NOT NULL,
	[CreatedDate] [date] NOT NULL,
	[UpdatedBy] [nvarchar](255) NOT NULL,
	[Updateddate] [datetime] NOT NULL,
	PRIMARY KEY  (UID)
);
CREATE TABLE [DTO_TOC_REA_2018_C](
	[Cost Center] [nvarchar](255) NOT NULL,
	[Department Number] [nvarchar](254) NOT NULL,
	[Location Code] [nvarchar](254) NOT NULL,
	[Location] [nvarchar](254) NULL,
	[Company] [nvarchar](254) NULL,
	[Account number] [nvarchar](255) NULL,
	[Account_2_digits] [nvarchar](255) NULL,
	[Account Type] [nvarchar](254) NULL,
	[Account Group] [nvarchar](254) NULL,
	[CostDate] [date] NULL,
	[Year] [nvarchar](255) NULL,
	[Month] [nvarchar](255) NULL,
	[Value DKK] [float] NULL,
	[Version] [nvarchar](255) NULL,
	[Dataset] [nvarchar](255) NULL,
	[FileName] [nvarchar](255) NULL,
	[CreatedBy] [nvarchar](255) NULL,
	[CreatedDate] [date] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[Updateddate] [datetime] NULL
);
CREATE TABLE [DTO_TOC_FUT_2020_2H](
	[Cost Center] [nvarchar](255) NULL,
	[Department Number] [nvarchar](254) NULL,
	[Location Code] [nvarchar](254) NULL,
	[Location] [nvarchar](254) NULL,
	[Company] [nvarchar](254) NULL,
	[Account number] [nvarchar](254) NULL,
	[Account_2_digits] [nvarchar](255) NULL,
	[Account Type] [nvarchar](254) NULL,
	[Account Group] [nvarchar](254) NULL,
	[CostDate] [date] NULL,
	[Year] [nvarchar](254) NULL,
	[Month] [nvarchar](19) NULL,
	[Value DKK] [float] NULL,
	[Version] [nvarchar](255) NULL,
	[Dataset] [nvarchar](255) NULL,
	[FileName] [nvarchar](255) NULL,
	[CreatedBy] [nvarchar](255) NULL,
	[CreatedDate] [date] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[Updateddate] [datetime] NULL
);
--temp
CREATE TABLE [DRI_TOC](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Account_Number] [nvarchar](255) NOT NULL,
	[Cost_Center] [nvarchar](255) NOT NULL,
	[Value_DKK] [float] NULL,
	[Description] [nvarchar](100) NULL,
	[CostDate] [datetime] NULL,
	[Incurred] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](255) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	PRIMARY KEY (ID)
)
--end temp
CREATE TABLE [DTO_Employees_REA_2018_C](
	[Cost Center] [nvarchar](255) NULL,
	[Department Number] [nvarchar](254) NULL,
	[Location Code] [nvarchar](254) NULL,
	[Location] [nvarchar](254) NULL,
	[Company] [nvarchar](254) NULL,
	[Date] [date] NULL,
	[Year] [nvarchar](255) NOT NULL,
	[Month] [nvarchar](255) NOT NULL,
	[Version] [nvarchar](255) NOT NULL,
	[Dataset] [nvarchar](255) NOT NULL,
	[Employees] [float] NULL,
	[FileName] [nvarchar](255) NOT NULL,
	[CreatedBy] [nvarchar](255) NOT NULL,
	[CreatedDate] [date] NOT NULL,
	[UpdatedBy] [nvarchar](255) NOT NULL,
	[Updateddate] [datetime] NOT NULL
);
CREATE TABLE [DVA_TOC_EMPLOYEE_DASHBOARD](
	[Cost Center] [nvarchar](255) NULL,
	[Department Number] [nvarchar](255) NULL,
	[Location Code] [float] NULL,
	[Location] [nvarchar](255) NULL,
	[Company] [nvarchar](255) NULL,
	[Account Type] [nvarchar](255) NULL,
	[Account Group] [nvarchar](255) NULL,
	[Date] [date] NULL,
	[Year] [nvarchar](255) NULL,
	[Month] [nvarchar](255) NULL,
	[Version] [nvarchar](255) NULL,
	[Account_2_digits] [nvarchar](255) NULL,
	[Dataset] [nvarchar](255) NULL,
	[Value DKK] [float] NULL,
	[Employees] [float] NULL
);








	





