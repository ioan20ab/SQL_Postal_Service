--workflow SQL001--
--this flow adds UID key that is created combining cost_center, department number and location code, meta data field about data source are added
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
INSERT INTO DIM_MASTER_ORGANISATION([Location Code]
      ,[Location]
      ,[Company]
      ,[Department Number]
      ,[Cost Center]
      ,[UID]
      ,[CreatedBy]
      ,[CreatedDate]
      ,[UpdatedBy]
      ,[Updateddate])
    SELECT [Location Code]
      ,[Location]
      ,[Company]
      ,[Department Number]
      ,[Cost Center]
      ,[Cost Center] + '_' + [Department Number] + '_' + [Location Code] UID
      ,'yannis'
      ,GetDate()
      ,'yannis'
      ,getdate()
  FROM [dbo].[TMP_DIM_MASTER_ORGANISATION];
-- end SQL001 --

--workflow SQL002 exercise--
--this flow adds UID key that is created combining [Account 2-digits] and [Account Group], meta data field about data source are added
--exercise Q1
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
-- end SQL002 --
-- SQL003 --
-- Create a data relation that holds real cost information along with associated cost center, department, location and cost date. also a version name field with fixed value 'REA' needs to be present. 
-- following fields needs to be there
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
  INSERT INTO [DTO_TOC_REA_2018_C](
  [Cost Center]
      ,[Department Number]
      ,[Location Code]
      ,[Location]
      ,[Company]
      ,[Account number]
      ,[Account_2_digits]
      ,[Account Type]
      ,[Account Group]
      ,[CostDate]
      ,[Year]
      ,[Month]
      ,[Value DKK]
      ,[Version]
      ,[Dataset]
      ,[FileName]
      ,[CreatedBy]
      ,[CreatedDate]
      ,[UpdatedBy]
      ,[Updateddate])
   SELECT 
	  toc.[Cost Center]
	 ,org.[Department Number]
      ,org.[Location Code]
      ,org.[Location]
      ,org.[Company]
      ,SUBSTRING(toc.[Account number],6,LEN([Account number])-5) as [Account number]
      ,SUBSTRING(toc.[Account number],6,2) as [Account_2_digits]
      ,acc.[Account Type]
      ,acc.[Account Group]	  
      ,datefromparts(SUBSTRING(year,4,4), [month], 1) as [CostDate]
      ,SUBSTRING(year,4,4) as [Year]
      ,[Month]
      ,cast(replace([Value DKK],',','.') as float) [Value DKK]
      ,'REA' [Version]
      ,'Cost Data' [Dataset]
      ,toc.[FileName]
      ,'yannis' [CreatedBy]
      ,getdate() as [CreatedDate]
      ,'yannis' as [UpdatedBy]
      ,getdate() as [Updateddate]
  FROM [dbo].[TMP_DTO_TOC_REA_2018_C] toc, 
  (select Company, [Department Number], [Cost Center], min(Location) Location, min([Location Code]) [Location Code]
  from TMP_DIM_MASTER_ORGANISATION
  group by Company, [Department Number], [Cost Center]) org, 
  TMP_DIM_MASTER_ACCOUNTGROUPS acc  
  where toc.[cost Center] = org.[cost Center] and 
  SUBSTRING(toc.[Account number],6,2) = acc.[Account 2-digits];
-- end of SQL003 --

--find duplicates--

select * from TMP_DIM_MASTER_ORGANIZATION) where [Cost Centre] in (
  select [Cost Centre] from TMP_DIM_MASTER_ORGANIZATION group by [Cost Centre]
having count(*) >1

select Company, [Department Number], [Cost Center], min(Location) Location, min([Location Code]) [Location Code]
from TMP_DIM_MASTER_ORGANIZATION
group by Company, [Department Number], [Cost Center]


-- SQL004 -- Future Cost exercise --
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
--exercise Q2
-- SQL004 end script  
-- SQL005 -- implement workflow that has employee information per month as well as associate department and cost information. 
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
)
INSERT INTO [DTO_Employees_REA_2018_C]
([Cost Center]
      ,[Department Number]
      ,[Location Code]
      ,[Location]
      ,[Company]
      ,[Date]
      ,[Year]
      ,[Month]
      ,[Version]
      ,[Dataset]
      ,[Employees]
      ,[FileName]
      ,[CreatedBy]
      ,[CreatedDate]
      ,[UpdatedBy]
      ,[Updateddate])
SELECT emp.[Cost Center]
	 ,org.[Department Number]
      ,org.[Location Code]
      ,org.[Location]
      ,org.[Company]	  
	  ,DATEFROMPARTS(SUBSTRING([TimePeriod],1,4),SUBSTRING([TimePeriod],6,LEN([TimePeriod])-5),1) as [Date]
	  ,SUBSTRING([TimePeriod],1,4) [Year]
	  ,SUBSTRING([TimePeriod],6,LEN([TimePeriod])-5) [Month]
	  ,'REA' Version
	  ,'Employees' Dataset
	  ,EmployeeCount
	  ,'DTO_EMPLOYEES_REA_2018_C'
	  ,'yannis' [CreatedBy]
      ,getdate() as [CreatedDate]
      ,'yannis' as [UpdatedBy]
      ,getdate() as [Updateddate]
FROM
(SELECT [Cost Center] [Cost Center], [TimePeriod], EmployeeCount  
FROM   
   (SELECT [Cost Center] [Cost Center]
      ,[1_1_2018] '2018-1' 
      ,[2_1_2018] '2018-2'
      ,[3_1_2018] '2018-3'
      ,[4_1_2018] '2018-4'      
	  ,[5_1_2018] '2018-5'      
	  ,[6_1_2018] '2018-6'      
	  ,[7_1_2018] '2018-7'      
	  ,[8_1_2018] '2018-8'      
	  ,[9_1_2018] '2018-9'      
	  ,[10_1_2018] '2018-10'
	  ,[11_1_2018] '2018-11'
	  ,[12_1_2018] '2018-12'	  
	  ,[1_1_2019] '2019-1' 
      ,[2_1_2019] '2019-2'
      ,[3_1_2019] '2019-3'
      ,[4_1_2019] '2019-4'      
	  ,[5_1_2019] '2019-5'      
	  ,[6_1_2019] '2019-6'      
	  ,[7_1_2019] '2019-7'      
	  ,[8_1_2019] '2019-8'     
	  ,[1_1_2020] '2020-1' 
      ,[2_1_2020] '2020-2'
      ,[3_1_2020] '2020-3'
      ,[4_1_2020] '2020-4'      
	  ,[5_1_2020] '2020-5'      
	  ,[6_1_2020] '2020-6'      
  FROM [dbo].TMP_DTO_EMPLOYEES_REA_2018_C) p  
UNPIVOT  
   (EmployeeCount FOR TimePeriod IN   
      ([2018-1],[2018-2],[2018-3],[2018-4],
	  [2018-5],[2018-6],[2018-7],[2018-8],
	  [2018-9],[2018-10],[2018-11],[2018-12],
	  [2019-1],[2019-2],[2019-3],[2019-4],
	  [2019-5],[2019-6],[2019-7],[2019-8],
	  [2020-1],[2020-2],[2020-3],[2020-4],
	  [2020-5],[2020-6])  
) as employeeC) emp,
  (select Company, [Department Number], [Cost Center], min(Location) Location, min([Location Code]) [Location Code]
  from TMP_DIM_MASTER_ORGANISATION
  group by Company, [Department Number], [Cost Center]) org
  Where emp.[cost Center] = org.[cost Center];
--
-- SQL006 -- implement dashboard table with following attributes -- Also create a view for same table --
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
--create a view--
--exercise Q3
--end script--